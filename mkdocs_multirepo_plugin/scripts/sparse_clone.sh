#!/bin/bash

url="$1"
name="$2"
shift 2
dirs=("$@")

if [[ -n  "$AccessToken" ]]; then
    git config http.extraheader "AUTHORIZATION: bearer $AccessToken"
fi
git clone --branch $branch --depth 1 --filter=blob:none --sparse $url "$name" || exit 1
cd "$name"
git sparse-checkout set ${dirs}