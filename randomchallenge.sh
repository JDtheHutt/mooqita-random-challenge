#!/bin/bash

# set variables
# could use mktemp if greater file privacy desired but not added for this exercise.
orig_file=/tmp/random.log
sort_file=/tmp/sorted.log
maxsize=1048576
#maxsize=10000 #shorter for testing

# in the below i use a while loop to check for a pre-defined maximum filesize for the
# output file.
# so long as the while condition has not been met, a function is run to obtain the
# first 10 lines of urandom using head, then pipe that to translate which deletes all
# characters except the stated set of alphanumerics.  this is then piped to head again
# and only the first 15 characters finally output.  /dev/random could be used instead
# for greater randomness if desired, but was not used here as a check using time shows
# it to be slower and i'm doing this on a lowly Pi.


# functions
random(){
head /dev/urandom | tr -dc [:alnum:] | head -c 15
}

# check if files exist
if [[ -e $orig_file ]]; then
	echo "$orig_file already exists, please delete or move this then run again." && exit 1
else
	if [[ -e $sort_file ]]; then
		echo "$sort_file already exists, please delete or move this then run again." && exit 1
	else

		echo "Generating random number list, please wait."
	fi
fi

# create file
touch $orig_file

# output random lines to file
# considered using ls to obtain filesize in similar fashion but preferred du as
# du had a simpler output with less need to worry about column separators.
# i was also hoping to redirect to the file and then append to a new line at
# the same time but couldn't work it out so went with adding echo "" to achieve.

while [ "$(du -b $orig_file | cut -f1)" -lt $maxsize ]
do
	random >> $orig_file
	echo "" >> $orig_file
done

# sort the random file into a new output file and remove strings starting a and A
# used -dbf at first to ensure any erronous characters are stripped out and case 
# ignored, however in this situation, with earlier use of tr to filter characters,
# this produces same output as using sort by itself so left as default.
sort $orig_file | sed '/^[aA]/d' >  $sort_file

# calculate number of lines removed
lines1=$(wc -l $orig_file | awk '{ print $1 }' )
lines2=$(wc -l $sort_file | awk '{ print $1 }' )
linediff=$(echo $((lines1-lines2)))

echo ""
echo "Process completed."
echo "Original random data file located at: $orig_file"
echo "Sorted data file located at: $sort_file"
echo "Number of lines removed during sort: $linediff"
echo ""
exit 0
