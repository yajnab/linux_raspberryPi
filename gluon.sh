# Gluon Kernel Compiler
red='tput setaf 1'
green='tput setaf 2'
yellow='tput setaf 3'
blue='tput setaf 4'
violet='tput setaf 5'
cyan='tput setaf 6'
white='tput setaf 7'
normal='tput sgr0'
bold='setterm -bold'
date="date"
KERNEL_BUILD="Gluon_Kernel_Raspberry-`date '+%Y-%m-%d---%H-%M'`" 
echo $1 > VERSION	
VERSION='cat VERSION'
$yellow
TOOLCHAIN='../../toolchain/linaro/bin/arm-eabi'
MODULES="./../modules"
$blue
echo " |========================================================================| "
echo " |*************************** GLUON KERNEL *******************************| "
echo " |========================================================================= "
$cyan
echo " |========================================================================| "
echo " |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Gluon Works ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| "
echo " |========================================================================| "
$red
echo " |========================================================================| "
echo " |~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DEVELOPER ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| "
$cyan
echo " |%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Yajnab %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%| "
$red
echo " |=========================== XDA-DEVELOPERS =============================| "
echo " |========================= Github.com/Yajnab ============================| "
echo " |========================================================================| "
$yellow
$bold
echo " |========================================================================| "
echo " |======================== COMPILING GLUON KERNEL ========================| "
echo " |========================================================================| "
$normal


if [ -n VERSION ]; then
echo "Release version is 0"
echo "0" > .version
else 
echo "Release version is $VERSION" 
echo $VERSION > .version
rm VERSION
fi

$cyan
echo "Cleaning"
$violet
make clean
make mrproper
$cyan
echo " Making config"
$violet
ARCH=arm CROSS_COMPILE=../../toolchain/linaro/bin/arm-eabi- make bcmrpi_gluon_defconfig
clear

$cyan
echo "Making the zImage-the real deal"
$violet
ARCH=arm CROSS_COMPILE=../Toolchain/linaro-4.8/bin/arm-linux-gnueabihf- make -j64 CONFIG_DEBUG_SECTION_MISMATCH=y
ARCH=arm CROSS_COMPILE=../Toolchain/linaro-4.8/bin/arm-linux-gnueabihf- INSTALL_MOD_PATH=${MODULES} make modules_install -j64
echo "Cleaning"
$violet
cd ../
cd tools_pi
cd mkimage
./imagetool-uncompressed.py ../../raspberry_pi/arch/arm/boot/zImage

clear
echo " |============================ F.I.N.I.S.H ! =============================|"
$red
echo " |==========================Flash it and Enjoy============================| "
$blue
echo " |==========Don't seek readymade goodies, try to make something new=======| "
$cyan
echo " |==============================Gluon Works===============================| "
$red
echo " |================================Credits=================================| "
echo " |~~~~~~~~~~~~~~~~~~~~~~Dr.Nachiketa Bandyopadhyay(My Father)~~~~~~~~~~~~~| "
echo " |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~My Computer~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| "
echo " |~~~~~~~~~~~~~~~~~~~~~~~~~Samsung Galaxy Fit(Beni)~~~~~~~~~~~~~~~~~~~~~~~| "
echo " |========================================================================| "
$violet
echo " |========================================================================| "
echo " |********************Vishwanath Patil(He taught me all)******************| "
echo " |****************************Aditya Patange(Adipat)**********************| "
echo " |************************Sarthak Acharya(sakindia123)********************| "
echo " |****************************Teguh Soribin(tjstyle)**********************| "
echo " |****************************Yanuar Harry(squadzone)*********************| "
echo " |*********************************faux123********************************| "
echo " |****************************Linux Torvalds(torvalds)********************| "
echo " |========================================================================| "

$normal


