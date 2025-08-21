#!/bin/bash

mkdir -p files/etc/openclash/core

CLASH_META_URL=$( curl -sL https://api.github.com/repos/vernesong/OpenClash/contents/dev/meta?ref=core | grep meta/clash-linux-amd64.tar.gz | awk -F '"' '{print $4}' | awk 'NR==4{print}' )
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

chmod +x files/etc/openclash/core/clash*
