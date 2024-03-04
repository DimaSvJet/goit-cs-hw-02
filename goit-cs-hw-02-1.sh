#!/bin/bash

# Список веб-сайтов
websites=('https://google.com' 'https://facebook.com' 'https://twitter.com')

# Создание файла
site_file="websites_status.log"

# Очистка файла перед каждым запуском
> "$site_file"

# Проверка каждого сайта
for site in "${websites[@]}"
do
    # Использование команды curl для проверки доступности каждого сайта
    if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep '200' > /dev/null; then
        echo "$site is UP" >> "$site_file"
    else
        echo "$site is DOWN" >> "$site_file"
    fi
done

# Вывод результата
echo "Results written in $site_file"