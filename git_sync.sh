#!/bin/bash

~/.bashrc

curr_folder=${PWD}
echo 'solution folder:'$curr_folder

for f in $( ls ); do
	echo $f
	if [ -d $f ]; then
		cd $curr_folder/$f
		git pull origin master 

		cd $curr_folder
	fi
done

cd $curr_folder

echo "`date`"
