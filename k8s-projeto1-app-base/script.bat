echo "Criando as imagens......"

docker build -t slrer/projeto-backend:1.0 backend/.
docker build -t slrer/projeto-database:1.0 database/.

echo "Realizando push das imagens......"

docker push slrer/projeto-backend:1.0
docker push slrer/projeto-database:1.0

echo "Criando serviços no cluster kubernetes......"

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl apply -f ./deployments.yml