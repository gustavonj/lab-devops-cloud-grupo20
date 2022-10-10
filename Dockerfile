# Imagem Official do Python
FROM python:rc-slim

# Diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Comando que iniciará a aplicação.
CMD ["gunicorn", "app:app"]