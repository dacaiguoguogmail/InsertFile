#!/bin/sh
#"${SRCROOT}/../fix_framewrk.sh"

podarray=("AFNetworking" "SDWebImage" "Realm")

function rsnyncpod(){
    path_af="${PODS_CONFIGURATION_BUILD_DIR}"/$1
    echo $path_af
    if [ ! -d $path_af ]; then
        mkdir $path_af
    fi
    rsync -av /Users/sunyanguo/Desktop/Debug-iphonesimulator/$1 $PODS_CONFIGURATION_BUILD_DIR

}
for v in ${podarray[@]}; do
    echo $v;
    rsnyncpod $v;
done


