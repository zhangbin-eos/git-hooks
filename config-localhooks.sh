#! /bin/bash
set -x
srcpath=./hooks/
hooks="commit-msg pre-commit"

chmod +x -R $srcpath

if ! [ -d ".git/hooks/"  ]
then
        echo "not find git repo"
        exit 1
fi

cur=$(pwd)
cd ".git/hooks/"
rm -rf $hooks

for i in $hooks
do
ln -s ../../$srcpath/$i $i
done

cd $cur

echo "config ok"
