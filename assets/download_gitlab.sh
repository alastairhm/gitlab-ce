#!/bin/sh

cd /home/git

TAG=`git ls-remote -t https://gitlab.com/gitlab-org/gitlab-ce.git | grep -v -e '\^{}' -e 'rc[0-9]*' -e 'pre' | grep -o 'v10\..*$' | tail -1`

echo "Downloading gitlab ${TAG}"

sudo -u git -H git clone --depth 1 -b ${TAG} https://gitlab.com/gitlab-org/gitlab-ce.git gitlab -v
