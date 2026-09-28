#!/bin/bash

DIST=bookworm
TARGET=python

printf "sudo password: "
stty -echo
read password
stty echo

#----- OpenRTM-aist-Python 
echo "${password}" | sudo -S rm -rf ${TARGET}-*
rm -rf OpenRTM-aist-Python

git clone https://github.com/OpenRTM/OpenRTM-aist-Python

VERSION=`dpkg-parsechangelog --file OpenRTM-aist-Python/packages/deb/debian/changelog --show-field Version | cut -b 1-5`
SHORT_VER=`echo $VERSION | cut -b 1-3 | sed 's/\.//g'`

# build in docker environment
echo "${password}" | sudo -S docker build \
 --build-arg VERSION=${VERSION} \
 -t ${TARGET}${SHORT_VER} \
 -f OpenRTM-aist-Python/scripts/${DIST}/Dockerfile.package .
echo "${password}" | sudo -S docker create --name ${TARGET}${SHORT_VER} ${TARGET}${SHORT_VER}
echo "${password}" | sudo -S docker cp ${TARGET}${SHORT_VER}:/root/${TARGET}-deb-pkgs .
echo "${password}" | sudo -S docker rm ${TARGET}${SHORT_VER}
USER_NAME=$(whoami)
echo "${password}" | sudo -S chown -R ${USER_NAME}:${USER_NAME} ${TARGET}-deb-pkgs
