#!/bin/bash

echo -e "\033[36mStep1: Input the range you want, default is \033[1;32m365:\033[0m"
read RANGE

if [ "${RANGE}" = "" ] ;then
  RANGE=365
fi

cat <<EOF >log.txt
  count         date            msg
EOF

function writeLog() {
cat <<EOF >>log.txt
commit ${2}     ${1}     ${1}
EOF
git add .
git commit --date=${1} -am ${1}
}

for ((i = 1; i <= ${RANGE}; i++))
do
  tempDate=`date -v -${i}d +%Y-%m-%d`
  ran=$RANDOM
  if [ 10000 -ge ${ran} ]; then
    continue
  else
    writeLog ${tempDate} ${i}
  fi

  if [ 25000 -le ${ran} ]; then
    writeLog ${tempDate} ${i}
  fi

  if [ 30000 -le ${ran} ]; then
    writeLog ${tempDate} ${i}
  fi
done