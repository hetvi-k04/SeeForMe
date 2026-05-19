# SeeForMe 👁️‍🗨️

**SeeForMe** is an AI-powered assistive mobile app built for visually impaired individuals to navigate the world around them with confidence and independence.

---

## 📱 Features

- 🔴 **Real-time Color Detection** — Detects object colors via camera and speaks them aloud.
- 📖 **Reading Assistance** — Reads printed text in real-time using text-to-speech.
- 💰 **Indian Currency Recognition** — Identifies INR notes and announces the total.
- 🖐️ **Gesture Recognition** — Enables AI-based hand gesture communication.


---
## 🖼️ Screenshots

| Home Screen | Color Detection | Currency Detection | Real-Time Currency Detection | Object Detection | Color Detection |
|-------------|------------------|---------------------|---------------------|---------------------|---------------------|
| ![Home](images/mp1.jpg) | ![Color](images/mp3.jpg) | ![Currency](images/mp4.jpg) | ![Real-Time Currency Detection](images/mp6.jpeg) |![Object Detection](images/mp7.jpeg) | ![Color Detection](images/mp8.jpeg)


## ⚙️ Tech Stack

- 📱 React Native + Expo
- 🧠 Python + Flask (backend for model serving)
- 🎨 TensorFlow / Mediapipe / OpenCV
- 🗂️ MongoDB (for face & user data)
- 🗣️ Text-to-Speech APIs
- 🔍 Image Processing & CV Models

---

## 🚀 Getting Started

### Frontend Setup

```bash
cd SeeForMe
npm install
npx expo start
```

### Backend Setup

```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py
```






