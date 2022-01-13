FROM python:3.9
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /code/requirements.txt
#ENV DBURL=postgres://movie:password@172.20.0.5:5432/dbmovie
ENV PYTHONPATH /code
COPY ./movieapi /code/movieapi
EXPOSE 8888
CMD ["uvicorn", "movieapi.main:app", "--host", "0.0.0.0", "--port", "8888"]
