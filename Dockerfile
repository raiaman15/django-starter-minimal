FROM python:3
ENV PYTHONUNBUFFERED=1
RUN pip install --upgrade pip

RUN addgroup appuser
RUN useradd -g appuser appuser

RUN mkdir /code
RUN chown -R appuser /code/
WORKDIR /code

COPY requirements.txt /code/
RUN pip install -r requirements.txt

USER appuser
COPY . /code/

ENTRYPOINT ["/code/entrypoint.sh"]