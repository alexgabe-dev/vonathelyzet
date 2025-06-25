FROM nginx:latest
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

FROM python:3.11-slim
WORKDIR /app
COPY ./app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "mav:app"]
