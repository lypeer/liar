#!/bin/bash

echo -e "\033[36mStep1: Input the range you want, default is \033[1;32m365:\033[0m"
read RANGE

if [ "${RANGE}" = "" ]
then
  RANGE=365
fi

echo -e ${RANGE}

cat <<EOF >log.txt
  count         date            msg
EOF

for ((i = 1; i <= ${RANGE}; i++))
do
tempDate=`date -v -${i}d +%Y-%m-%d`
cat <<EOF >>log.txt
commit ${i}     ${tempDate}     ${tempDate}
EOF
git add .
git commit --date=${tempDate} -am ${tempDate}
done