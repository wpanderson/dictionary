#!/bin/bash
#Author: Weston Anderson
#Class: Unix
#Lab 5

#Parameters: 1: arbitrary text file, 2: number of typos
#Output: Most common N typos

#Check if there is a first parameter
if [ -z $1 ]; then
	echo "Syntax Error: [Usage: ./dictionary.sh <file> <dictionary> <num of typos>]"
	exit
fi
#Check if there is a second parameter
if [ -z $2 ]; then
	echo "Syntax Error [Usage: ./dictionary.sh <file> <dictionary> <num of typos>]"
	exit
fi
#Check if there is a third parameter
if [ -z $3 ]; then
	echo "Syntax Error [Usage: ./dictionary.sh <file> <dictionary> <num of typos>]"
	exit
fi

#Sort and uniq the text file and output it into temp
sed 's/ /\n/g' $1 > temp
sort temp -u -o temp
#Compare sorted uniqed text file with dictionary
comm -23 temp $2 > results
sed 's/ /\n/g' $1 > temp
echo "Typos in $1" > output
for word in $(cat results);
do
	#echo "$word"
	count=$(grep -c "$word" temp)
	echo "$count $word" >> output
	
done

sort output -nr | head -n $3

#remove temp files
rm temp results

