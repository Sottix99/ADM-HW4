#!/bin/bash

#1.Which location has the maximum number of purchases been made?

awk -F ',' '{print $5}' bank_transactions.csv | sort | uniq -c | sort -nr | head -1


#2.In the dataset provided, did females spend more than males, or vice versa?

echo 'females purchases: '
awk -F ',' '$4=="F"{sum+=$9}END{print sum}' bank_transactions.csv

echo 'males purchases: '
awk -F ',' '$4=="M"{sum+=$9}END{print sum}' bank_transactions.csv


#3. Report the customer with the highest average transaction amount in the dataset.

awk -F ',' '{seen[$2]+=$9; count[$2]++} END{for (x in seen)print  seen[x]/count[x],x}' bank_transactions.csv | sort -nr | head -n 1