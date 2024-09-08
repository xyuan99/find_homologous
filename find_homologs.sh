queryFile=$1
subjectFile=$2
outputFile=$3

# run blast
tblastn -query $queryFile -subject $subjectFile -outfmt "6 std qlen" -out raw_match

# filter raw output
awk '$3 > 30.000 && $4 / $13 > 0.9' raw_match > $outputFile
rm raw_match
filename=$(echo $3|cut -d. -f1)
wc -l $3 |awk '{print "There are "$1" perfect matches in file "$2}' > $filename.stdout
