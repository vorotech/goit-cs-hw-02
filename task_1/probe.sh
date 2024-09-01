#!/bin/bash

# Масив з URL вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
log_file="website_status.log"

# Очищення попереднього файлу логів, якщо він існує
> $log_file

# Цикл для перевірки кожного вебсайту у списку
for website in "${websites[@]}"; do
    # Виконання HTTP GET запиту з переадресацією і отримання статус-коду
    http_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$website")

    # Перевірка статус-коду
    if [ "$http_code" -eq 200 ]; then
        echo "$website is UP" | tee -a $log_file
    else
        echo "$website is DOWN" | tee -a $log_file
    fi
done

# Виведення повідомлення про завершення перевірки
echo "Результати записані у файл логів: $log_file"
