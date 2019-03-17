# mooqita-random-challenge
Challenge activity by Mooqita from the Linux Foundation LFS101x course - brief below

Write a script using /bin/bash that does the following:

Create a series of random numbers and strings of characters and write them to a file, no more than 15 characters for each line. As characters assume the Latin Alphabet, [A-Za-z], without special characters and the numbers 0,1,2,3,4,5,6,7,8,9. Example of a line with 15 characters: 123456789aBcDeF Explain the process how you create the lines in your file.
Control the size of the file. If the file reaches the size of 1 MiB interrupt the creation of more random lines. What is a good way to control the size of a file? Discuss what options you know and why you picked one of them. Come up with two ways in Linux to find the size of a file. This step is there to protect you from filling up your disk. You should write your script in a way that it terminates when reaching a certain size.
Now sort the file. Select a sorting style. Which one did you use? Why? What is the most common command in Linux to sort a file and what happens when you use the default option, i.e. using no specific sorting option?
Remove all lines that start with an “a”, no matter if it is in uppercase or lowercase. Safe the result into a new file. Use regular expressions to do this.
How many lines were removed?
