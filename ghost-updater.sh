#!/bin/bash
date=$(date)
git pull origin master
rm -r docs
mkdir docs
cd docs
echo "sam-mcgrath123.github.io" > CNAME
cd -
ECTO1_SOURCE=http://localhost:2368 ECTO1_TARGET=https://sam-mcgrath123.github.io python3 ecto1.py
cd docs
#docker cp ghost:/var/lib/ghost/content/images/. content/images
cd -
grep -lR "srcset" docs/ | xargs sed -i 's/srcset/thisisbuggedatm/g'
git add .
git commit -m "$date"
git config --global credential.helper store
git push -u origin master
