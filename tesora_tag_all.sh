#!/bin/bash

BRANCHNAME=$1
TAGNAME=$2

if [ -z $BRANCHNAME ] || [ -z $TAGNAME ] ; then 
 echo "usage: $0 branchname tagname" 
 echo "example: $0 EE-1.2 EE-1.2.1"
 exit 1
fi

rm -rf ./tmp
mkdir ./tmp
cd ./tmp

cat ../repos.txt | xargs -n 1 | ../tag_repo.sh $BRANCHNAME $TAGNAME
