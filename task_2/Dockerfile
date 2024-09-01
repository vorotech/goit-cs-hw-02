FROM python:3.10

# Встановимо змінну середовища
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Скопіюємо файл вимог до контейнера
COPY requirements.txt .

# Встановимо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Скопіюйємо решту коду програми в контейнер
COPY . .

# Відкриємо порт, на якому працюватиме програма FastAPI
EXPOSE 8000

# Запустимо програму FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
