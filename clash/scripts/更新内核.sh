tag="latest"
#tag="tags/Prerelease-Alpha"

url=$(curl -s https://api.github.com/repos/MetaCubeX/Clash.Meta/releases/${tag} \
| grep "android-arm64" \
| cut -d : -f 2,3 \
| tr -d \")

url=${url#*https}

curl -L "https${url}" -o clash.gz

if [ -e clash.gz ]; then
    gunzip clash.gz
    
    mv /data/adb/modules/Clash_For_Magisk/system/bin/clash /data/adb/modules/Clash_For_Magisk/system/bin/clash.bak
    mv clash /data/adb/modules/Clash_For_Magisk/system/bin/clash
    chmod 777 /data/adb/modules/Clash_For_Magisk/system/bin/clash
    
    vvv=$(/data/adb/modules/Clash_For_Magisk/system/bin/clash -v | cut -d ' ' -f 2,3)
    echo "已安装最新版$vvv内核"
fi