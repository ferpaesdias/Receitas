# Imagem base de Python      
FROM python:3.13

# Diretório de trabalho no container      
WORKDIR /app 

# Copia o arquivo requirements.txt
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt 

# Configuração de variáveis de ambiente
ENV DJANGO_SETTINGS_MODULE=receitas.settings
ENV PYTHONUNBUFFERED=1 

# Copia o código da aplicação
COPY . .

RUN django-admin startproject receitas

VOLUME /app

EXPOSE 8000

# Comando para iniciar o servidor Django
CMD ["python", "receitas/manage.py", "runserver", "0.0.0.0:8000"]