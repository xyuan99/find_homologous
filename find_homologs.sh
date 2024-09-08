queryFile=$1
subjectFile=$2
outputFile=$3

# run blast
tblastn -query queryFile -subject subjectFile -outfmt "6 std qlen" -out raw_match
awk '$3==100.000 && $4==$13' raw_match > $3
rm raw_match
filename=$(echo $3|cut -d. -f1)
wc -l $3 |awk '{print "There are "$1" perfect matches in file "$2}' > $filename.stdout
