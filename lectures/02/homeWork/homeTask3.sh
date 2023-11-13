#Напишите скрипт, который по переданной директории будет проходить по всем файлам логов и 
#выводить uid самого активного пользователя за день (по количеству запросов).

#!/bin/bash
cd data
for file in $(ls | grep .log)
do
  echo "$file = $(cat "$file"  | jq .uid | sort -n | uniq -c | sort -n -k 1 | tail -n 1 | awk '{print $2}')" 
done