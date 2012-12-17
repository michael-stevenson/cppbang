tmp=`mktemp ${PWD}/bang.XXXXXXXXXXX`
chmod 777 ${tmp}
tail -n +2 "$1" | g++ -std=c++0x -o "$tmp" -xc++ - 2>&1 | sed s/\<stdin\>/${1##*/}/g
shift
time "$tmp" "$@"; result=$?
rm -rf "$tmp"
exit $result
