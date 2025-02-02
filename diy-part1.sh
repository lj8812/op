#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

##############################################################################################

# 主题
git clone https://github.com/kenzok78/luci-theme-argonne.git package/luci-theme-argonne

##############################################################################################

# 服务

#luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

##############################################################################################

cat >> feeds.conf.default <<EOF
src-git helloword https://github.com/fw876/helloworld
src-git passwall https://github.com/xiaorouji/openwrt-passwall
EOF
./scripts/feeds update helloworld
./scripts/feeds install -a -f -p helloworld
./scripts/feeds update passwall
./scripts/feeds install -a -f -p passwall

