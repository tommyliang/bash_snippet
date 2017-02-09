#!/bin/bash

~/.bashrc

RED='\033[0;31m'
NC='\033[0m' # No Color

curr_folder=${PWD}
echo 'solution folder:'$curr_folder

for f in $( ls ); do
	if [ -d $f ]; then
		echo '=======['$f']======='
		cd $curr_folder/$f
		if git diff-index --quiet HEAD --; then
		  # no index changes, test remote diff
		  if [ -n "$(git diff origin/master..HEAD)" ]; then
		  	echo '---pulling---'
				git pull origin master 
		  	echo '---pushing---'
				git push origin master
			fi
		else
			echo -e $RED$f':Changes need to commit first'$NC
		fi

		cd $curr_folder
	fi
done

cd $curr_folder

echo "`date`"
