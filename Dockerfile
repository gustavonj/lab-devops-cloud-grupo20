# Imagem Official do Python
FROM python:rc-slim

# Declarando a váriavel do nome do arquivo de configuração do NewRelic
ENV NEW_RELIC_CONFIG_FILE=newrelic.ini  NEW_RELIC_LICENSE_KEY=licensekey


# Diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Comando que iniciará a aplicação.
CMD ["newrelic-admin", "run-program", "gunicorn", "app:app"]