FROM python:3.11-slim

# рабочая директория
WORKDIR /app

# зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# код приложения
COPY app.py .

# создаём пользователя без root
RUN useradd -u 1001 -m appuser
USER appuser

# открываем порт
EXPOSE 5000

# запускаем gunicorn
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]

