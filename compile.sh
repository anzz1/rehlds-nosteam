#!/bin/sh
#

mkdir bin 2>/dev/null

gcc -std=c++11 -w -m32 -march=i686 -mtune=generic -msse -msse2 -O3 -s -shared -static-libgcc -static-libstdc++\
	-fno-strict-aliasing -fno-strict-overflow -fvisibility=hidden -fPIC \
	-Isrc \
	-Idep/hlsdk/common -Idep/hlsdk/dlls -Idep/hlsdk/engine -Idep/hlsdk/public \
	-Idep/metamod \
    -Wl,--no-export-dynamic \
	src/*.cpp \
	-o bin/rehlds-nosteam.so

# /opt/intel/bin/icc -mia32 -O3 -s -static-intel -shared -static-libgcc -no-intel-extensions \
# 	-Isrc \
# 	-Idep/hlsdk/common -Idep/hlsdk/dlls -Idep/hlsdk/engine -Idep/hlsdk/public \
# 	-Idep/metamod \
# 	src/*.cpp \
# 	-o bin/rehlds-nosteam.so

