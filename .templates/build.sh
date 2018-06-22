#!/bin/bash

navbarTpl="$(cat navbar.tpl)";

for html in *.html; do 
    awk -v navbarTpl="$navbarTpl" '{ if ($0 ~ /<!-- navbar -->/) { print navbarTpl; } else {print $0;} }' < $html > ../$html
done;
