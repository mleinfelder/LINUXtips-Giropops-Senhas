FROM python:3.9-alpine
WORKDIR /app
COPY . ./
ENV REDIS_HOST=172.17.0.2
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD flask run --host=0.0.0.0
HEALTHCHECK --timeout=2s CMD curl -f http://localhost:5000 || exit 1
