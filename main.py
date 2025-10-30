from fastapi import FastAPI
from pydantic import BaseModel

# create app
app = FastAPI()

# this is just to test the app is running
@app.get("/")
def home():
    return {"message": "App is running, testing successful from cicd build"}

# --- add this below ---

# model for input
class InputData(BaseModel):
    text: str

# this endpoint takes input and prints it
@app.post("/print_input")
def print_input(data: InputData):
    print("User entered:", data.text)  # shows in terminal
    return {"you_sent": data.text}     # shows on web
