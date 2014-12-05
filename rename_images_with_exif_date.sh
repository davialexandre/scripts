#!/bin/bash

set -e

for image in *JPEG; 
do 
    EXIFDATE=`sips -g creation $image | ack --output="\\$1" "creation: (.+)"`;
    EXIFDATE=$(date -j -f "%Y:%m:%d %H:%M:%S" "$EXIFDATE" +"%Y-%m-%d_%H%M%S"); 
    EXTENSION="${image##*.}";
    NEWFILENAME="$EXIFDATE.$EXTENSION";
    mv $image $NEWFILENAME;
done
