#!/usr/bin/env bash

# Jalapeno = 4500
# Little Single SC = 30000
# Single SC = 60000
yourHashRateInMhash=30000

while true
do
    blockReward=$(curl -s  https://blockexplorer.com/q/bcperblock)
    currentDifficulty=$(curl -s https://blockexplorer.com/q/getdifficulty)
    echo ""
    echo "The current difficulty is $currentDifficulty"
    btcAday=`echo "$yourHashRateInMhash*$blockReward/$currentDifficulty*(60*60*24*65535*10^6/2^48)" | bc -l`
    echo "You will make $btcAday BTC in the next 24 hours at this rate"
    echo ""
    echo ${btcAday:0:10} `date +%Y-%m-%d-%H:%M` >> flatDB.txt
    sleep 1800
done

#All the best
#Onryo (Erik Adler)
#gpg --keyserver pgp.mit.edu --recv-keys 0x2B4B58FE