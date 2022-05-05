#!/bin/bash

ROOT_PATH=$(cd $(dirname "${BASH_SOURCE}") && pwd -P)
cd ${ROOT_PATH}
find . -type f | grep -v '.sh' | xargs -L1 -P32 exiftool > /dev/null
rsync -avrut --exclude .git  --delete --force --progress ${ROOT_PATH}/ -e ssh blog:/var/www/pics/
