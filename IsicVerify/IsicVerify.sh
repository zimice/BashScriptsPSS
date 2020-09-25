#!/bin/sh

verifyCard=$1

if [ -z "${verifyCard}" ]; then echo "No argument supplied"; exit 1; fi

curl -o response-file 'https://www.isic.org/verify/' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: https://www.isic.org' -H 'Connection: keep-alive' -H 'Referer: https://www.isic.org/verify/' -H 'Cookie: PHPSESSID=46plnh6b31e2pusv1do6thfbm7; AWSELB=AF73034F18B38D7DCED6DEDC728D31BA3F3A73F96747FEE7FA7C4F7A74BC9954E5928CBDDD5C053FFB2A37CE37136C4BA008B15163192B34CFA04D35BEC4ED0D0D2913A2FB; AWSELBCORS=AF73034F18B38D7DCED6DEDC728D31BA3F3A73F96747FEE7FA7C4F7A74BC9954E5928CBDDD5C053FFB2A37CE37136C4BA008B15163192B34CFA04D35BEC4ED0D0D2913A2FB; _ga=GA1.2.650910486.1600495658; _gid=GA1.2.731428038.1600495658; _gat=1' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'verify_card_number=${$verifyCard}'

output=$(grep -o '<div class="error-icon">[^<]*' response-file | grep -o '[^>]*$')

rm response-file

echo "$output"
