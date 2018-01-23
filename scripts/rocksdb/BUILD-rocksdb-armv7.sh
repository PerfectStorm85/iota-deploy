#!/bin/sh

# FIXME: specify ARM64 JDK path
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

#export CROSS_COMPILE=aarch64-linux-gnu-

# FIXME: not specific to rock64
ARCH_FLAGS="-march=armv8-a+crc+crypto -mtune=cortex-a53"

set -x
make \
  CC=${CROSS_COMPILE}gcc \
  CXX=${CROSS_COMPILE}g++ \
  AR=${CROSS_COMPILE}ar \
  STRIP=${CROSS_COMPILE}strip \
  EXTRA_CFLAGS="${ARCH_FLAGS} -fuse-ld=gold" \
  EXTRA_CXXFLAGS="${ARCH_FLAGS} -static-libstdc++ -fuse-ld=gold" \
  EXTRA_LDFLAGS="-Wl,-Bsymbolic-functions -Wl,--icf=all" \
  DEBUG_LEVEL=0 \
  rocksdbjavastatic -j2

