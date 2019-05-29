#!/bin/sh

# 判断参数个数是否合法
if [ $# -ne 1 ]; then
    echo "Usage: $0 <project>"
    echo "    eg: $0 G4"
    echo "    eg: $0 G5"
    echo ""
    exit 1;
fi

mkdir rootdir

# 第一步: 拉取基线代码
svn checkout https://192.0.0.140/AutoElec/DSP/Novateck/9668x/branches/basis_platform/trunk rootdir/

# 第二步: 获取项目对应的打包环境
cd rootdir
mkdir pack

if [ "$1" = "G4" ]; then
    svn checkout https://192.0.0.140/AutoElec-Share/共享资料/APP/NT96687/G4/NT96687 pack/
elif [ "$1" = "G5" ]; then
    svn checkout https://192.0.0.140/AutoElec-Share/共享资料/APP/NT96687/G5/NT96687 pack/
else
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo "                              project not support                              "
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
fi


# 第三步: 添加可以执行文件权限(不添加将无法编译通过)
chmod 777 linux/sdk/root-fs/tools/mkimage
chmod 777 linux/sdk/root-fs/tools/lzop
chmod 777 linux/sdk/u-boot/mkconfig
chmod 777 linux/sdk/root-fs/busybox/scripts/gen_build_files.sh
chmod 777 linux/sdk/root-fs/busybox/scripts/mkconfigs
chmod 777 linux/sdk/root-fs/busybox/applets/usage_compressed
chmod 777 linux/sdk/root-fs/busybox/scripts/trylink
chmod 777 pack/pack*

echo "==============================================================================="
echo "                           download code successful                            "
echo "==============================================================================="
