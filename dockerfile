# syntax=docker/dockerfile:1
FROM python:3.7-alpine

#Creación de un directorio de trabajo en Docker
WORKDIR /code

#variables de entorno de flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#Ejecución
RUN apk add --no-cache gcc musl-dev linux-headers

#Instalación de independencias de flask y redis que esta en app.py
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

#Exponemos el puerto a usar
EXPOSE 5000

#Copiar el código dentro de la imagen
COPY . .

#Ejutamos el codigo
CMD ["flask", "run"]
