#! /bin/bash
set -x

hooks="commit-msg pre-commit"


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
ln -s ../../$i $i
done

cd $cur

echo "config ok"
