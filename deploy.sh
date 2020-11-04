#! /bin/bash

./build.sh

# save previously uploaded images
if find /var/www/awo.local/resources/images/dynamic -mindepth 1 | read; then
	mkdir ./build/temp-images
    cp -r /var/www/awo.local/resources/images/dynamic/* ./build/temp-images
    images_exist="true"
else
	images_exist="false"
fi

# remove old files
rm -rf /var/www/awo.local/*

# copy new files
cp -r ./build/. /var/www/awo.local

# copy previously uploaded images
if [ "$images_exist" == "true" ]; then
	cp -r /var/www/awo.local/temp-images/* /var/www/awo.local/resources/images/dynamic
	rm -rf /var/www/awo.local/temp-images
fi

# set permissions for image upload folder
chown -R www-data /var/www/awo.local/resources/images/dynamic
