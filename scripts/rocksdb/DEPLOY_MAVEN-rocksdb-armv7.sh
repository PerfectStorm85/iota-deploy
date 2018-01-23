#!/bin/sh

VER=5.9.2

M2_ROCKSDBJNI=$HOME/.m2/repository/org/rocksdb/rocksdbjni/$VER
JARBALL=/rocksdb/java/target/rocksdbjni-$VER-linux64.jar

set -x

mkdir -p $M2_ROCKSDBJNI

cp $JARBALL $M2_ROCKSDBJNI/rocksdbjni-$VER.jar
sha1sum $JARBALL | cut -f1 -d ' ' > $M2_ROCKSDBJNI/rocksdbjni-$VER.jar.sha1

cp /rocksdb/java/rocksjni.pom $M2_ROCKSDBJNI/rocksjni-$VER.pom
sha1sum /rocksdb/java/rocksjni.pom | cut -f1 -d ' ' > $M2_ROCKSDBJNI/rocksdbjni-$VER.pom.sha1
