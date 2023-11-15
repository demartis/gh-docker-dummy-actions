cat $MCR_MASTER_PATH/VersionInfo.xml

XMLTAG=release
result=`sed -n "/$XMLTAG/{s/.*<$XMLTAG>//;s/<\/$XMLTAG.*//;p;}" $MCR_MASTER_PATH/VersionInfo.xml`

echo "Checking MCR version. It must be $1"
if [[ "$result" == "$1" ]]; then
  echo "OK"
else
  echo -e '\033[31m' "Error. Version found: $result" '\033[0m'
  exit 1
fi

