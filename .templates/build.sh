#!/bin/bash

navbarTpl="$(cat navbar.tpl)";
trackingTpl="$(cat tracking.tpl)";

for html in *.html; do 
    awk -v navbarTpl="$navbarTpl" '{ if ($0 ~ /<!-- navbar -->/) { print navbarTpl; } else {print $0;} }' < $html > tmp
    awk -v trackingTpl="$trackingTpl" '{ if ($0 ~ /<!-- tracking -->/) { print trackingTpl; } else {print $0;} }' < tmp > ../$html
done;

rm tmp
