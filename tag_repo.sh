#!/bin/bash -ex

BRANCH=$1
TAGNAME=$2
REPO=$3

CLOBBER=true

if [ -z $REPO ] || [ -z $BRANCH ] || [ -z $TAGNAME ]; then exit; fi

# BH: I'm sure there's a way to do this without pulling down the bits,
# but I didn't bother.
git clone $REPO

DIRECTORY=`echo $REPO | cut -d'/' -f 2 | cut -d'.' -f 1`
echo $DIRECTORY

cd $DIRECTORY
git checkout $BRANCH

if [ "$CLOBBER" = true ]; then
  # can handle failure if it doesn't exist.
  set +e
  git tag -d $TAGNAME
  git push origin :refs/tags/$TAGNAME
  set -e
fi

git tag $TAGNAME -m $TAGNAME 
git push origin --tags
