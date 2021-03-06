#!/bin/sh

# Copy a folder to a new destination, without using cp -r command.

if [ $# -eq 2 ] 
then
	if [ ! -d $1 ]
	then
		echo Directory $1 doesn\'t exists
		exit 0
	fi
	
	files=`cd $1; find .`

	if [ ! -d $2 ]
	then
		mkdir $2
	fi

	for file in $files
	do
		if [ "$file" != "." ]
		then
			if [ -d $1/$file ]
			then
				if [ -e $2/$file ]
				then
					rm -r $2/$file
				fi
				mkdir $2/$file
			else
				cp $1/$file $2/$file
			fi
		fi
	done

	exit 0
else
	echo Syntax: $0 source destination
	exit 1
fi

