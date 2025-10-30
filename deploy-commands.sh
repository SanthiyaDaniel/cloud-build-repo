pkill -f uvicorn

gcloud builds submit --config cloudbuild.yaml .

gcloud run deploy fastapi-app \
  --image gcr.io/gcp-serverless-project-476012/fastapi-app \
  --platform managed \
  --region asia-south1 \
  --allow-unauthenticated

git init
git add .
git commit -m "first cloud build deploy"
git branch -M main
git remote add origin https://github.com/<your-username>/<repo-name>.git
git push -u origin main

#test it
git add .
git commit -m "test CI/CD trigger"
git push
