#!/bin/bash
echo "MY TOOLS"
echo "--------"
echo ""
echo "1. Instan Recon"
echo "2. DirScan"
echo "2. Vuln Test"
echo "3. Vuln Test List"
echo -n "Pilih: "
read numb
case $numb in 
	1) 
	echo -n "Domain: "
	read dom
	subfinder -silent -d $dom | gau --blacklist --mc 200,301,302 png,woff2,jpg,jpeg,gif,ttf,svg,woff,css --o ~/Desktop/bugHunting/target/$dom-spidering.txt;;
	2)
	echo -n "Target: "
	read target
	python3 dirsearch.py -e php,htm,js,bak,zip,tgz,txt -u $target -t 30 -o ~/Desktop/bugHunting/target/result_dir.txt
	3)
	echo -n "URL: "
	read url
	nuclei -u $url -t ~/nuclei-templates/cves/ -t ~/nuclei-templates/vulnerabilities/ -t ~/nuclei-templates/exposures/ -severity low,medium,high,critical -o ~/Desktop/bugHunting/target/url-res.txt;;
	4)
	echo -n "URLs (files.txt): "
	read urls
	nuclei -l $urls -t ~/nuclei-templates/cves/ -t ~/nuclei-templates/vulnerabilities/ -t ~/nuclei-templates/exposures/ -severity low,medium,high,critical -o ~/Desktop/bugHunting/target/urls-res.txt;;
	*)
	echo "Unknown !";;
esac
