#!/bin/bash
# https://github.com/CryptoPHI/EDX-MN for updates
# UPDATE a built EDX node from https://github.com/CryptoCoderz/EDX Repository on to Ubuntu +16.04 VPS
# Tested on a minimal VPS configuration of: 1vCPU 1GB RAM 16GB Storage
#########################################################################################################
# PLEASE REVIEW IT BEFORE YOUR RUN 
#########################################################################################################
clear

echo "Updating the VM and applying OS patches"
apt update && apt -y upgrade 
echo "Updating EDX"
cd /opt/EDX && git pull && cd Endox/src && chmod +x leveldb/build_detect_platform && chmod +x secp256k1/autogen.sh && make -f makefile.unix USE_UPNP=- && strip Endox-Coind && cp Endox-Coind /usr/local/bin && echo "Cleaning up" && make -f makefile.unix clean && cd && Endox-Coind

echo "Switching to node monitor mode. Press ctl-c to exit."
watch Endox-Coind getinfo
echo "Get Endox!!" 
