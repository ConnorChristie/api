#!/usr/bin/env bash

# This script generates a jar file. Run it as:
#
#     cd java
#     ./make-jar.sh

set -e

java_generated_dir=generated
# jar_protobuf_version=3.13.0
# jar_protobuf="protobuf-java-$jar_protobuf_version.jar"
# jar_grpc_version=1.37.0
# jar_grpc_api="grpc-all-$jar_grpc_version.jar"
# jar_grpc_stub="grpc-stub-$jar_grpc_version.jar"
# jar_grpc_protobuf="grpc-protobuf-$jar_grpc_version.jar"
# jar_annotations_api_version=6.0.53
# jar_annotations_api="annotations-api-$jar_annotations_api_version.jar"
# jar_listenablefuture_version=1.0
# jar_listenablefuture="listenablefuture-$jar_listenablefuture_version.jar"

# mkdir -p lib
# if ! test -f "lib/$jar_protobuf" ; then
# 	filepath="com/google/protobuf/protobuf-java/$jar_protobuf_version/protobuf-java-$jar_protobuf_version.jar"
# 	wget -q -O "lib/$jar_protobuf" "https://search.maven.org/remotecontent?filepath=$filepath"
# fi

# if ! test -f "lib/$jar_grpc_api" ; then
# 	filepath="io/grpc/grpc-api/$jar_grpc_version/grpc-api-$jar_grpc_version.jar"
# 	wget -q -O "lib/$jar_grpc_api" "https://search.maven.org/remotecontent?filepath=$filepath"
# fi

# if ! test -f "lib/$jar_grpc_stub" ; then
# 	filepath="io/grpc/grpc-stub/$jar_grpc_version/grpc-stub-$jar_grpc_version.jar"
# 	wget -q -O "lib/$jar_grpc_stub" "https://search.maven.org/remotecontent?filepath=$filepath"
# fi

# if ! test -f "lib/$jar_grpc_protobuf" ; then
# 	filepath="io/grpc/grpc-protobuf/$jar_grpc_version/$jar_grpc_protobuf"
# 	wget -q -O "lib/$jar_grpc_protobuf" "https://search.maven.org/remotecontent?filepath=$filepath"
# fi

# if ! test -f "lib/$jar_listenablefuture" ; then
# 	filepath="com/google/guava/listenablefuture/$jar_listenablefuture_version/$jar_listenablefuture"
# 	wget -q -O "lib/$jar_listenablefuture" "https://search.maven.org/remotecontent?filepath=$filepath"
# fi

# if ! test -f "lib/$jar_annotations_api" ; then
# 	filepath="org/apache/tomcat/annotations-api/$jar_annotations_api_version/$jar_annotations_api"
# 	wget -q -O "lib/$jar_annotations_api" "https://search.maven.org/remotecontent?filepath=$filepath"
# fi

pushd $java_generated_dir 1>/dev/null || exit 1
mvn clean package
popd 1>/dev/null || exit 1

# rm -rf out
# find "$java_generated_dir" -name '*.java' -print0 | xargs -0r javac -d out/ -cp "$java_generated_dir:lib/*"

# api_clients_version="$(git describe --tags 2>/dev/null || echo unknown)"
# java_version="$(java -version 2>&1 | awk '$2 == "version" {gsub(/"/, ""); print $3" ("$1")"}')"
# vega_version="$(sed -e 's/^v//' ../../../proto/from.txt)"

# cat >"out/manifest.txt" <<EOF
# Manifest-Version: 1.0
# Created-by: $java_version
# Main-Class: n/a
# Class-Path: $jar_protobuf $jar_grpc_api $jar_grpc_stub $jar_grpc_protobuf $jar_annotations_api $jar_listenablefuture
# Name: com.vegaprotocol.vega
# Specification-Title: Vega
# Specification-Version: $vega_version
# Specification-Vendor: Vega
# Implementation-Title: Vega
# Implementation-Version: $api_clients_version
# Implementation-Vendor: Vega
# Export-Package: io.vegaprotocol.vega;version="$vega_version"
# Import-Package: com.google.protobuf;version="[3.13,4)"
# EOF

# pushd out 1>/dev/null || exit 1
# jar cfm "vega-$vega_version.jar" manifest.txt com io
# popd 1>/dev/null || exit 1
