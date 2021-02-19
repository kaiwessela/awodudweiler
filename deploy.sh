#! /bin/bash
if find /var/www/awo.local/resources/images/dynamic -mindepth 1 | read; then
    mkdir /var/www/temp
    cp -r /var/www/awo.local/resources/images/dynamic/. /var/www/temp
    images_exist="true"
else
    images_exist="false"
fi

rm -rf build
mkdir build
cp -r blog/. build
cp -r custom/. build

rm -rf /var/www/awo.local
mkdir /var/www/awo.local
cp -r build/. /var/www/awo.local

if [ "$images_exist" == "true" ]; then
    cp -r /var/www/temp/. /var/www/awo.local/resources/images/dynamic
    rm -rf /var/www/temp
fi

chown -R www-data /var/www/awo.local/resources/images/dynamic
