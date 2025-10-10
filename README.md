# Conduit Frontend Project

## Table of Contents

1. [Introduction](#Introduction)
2. [Prerequisites](#Prerequisites)
3. [Quickstart](#Quickstart)
4. [Usage](#Usage)
   - [Installation with Docker](#Installation-with-Docker)
   - [Stop Container](#Stop-Container)
   - [Delete Container](#Delete-Container)
5. [Functions](#Functions)
   - [CI CD Pipeline](#CI-CD-Pipeline)
   - [Functionality Overview](#Functionality-overview)
   - [Making Requests to the Backend API](#Making-requests-to-the-backend-API)

## Introduction

This is a Readme Description of our Conduit Project.The Conduit is a Clone of <a href=https://medium.com/>Medium.com<a>

## Prerequisites

To Deploy your Conduit Frontend Project, you need the following:

- Docker
- Pyenv

## Quickstart:

1. Clone the following Repository:

```bash
git clone git@github.com:HerzogElias/conduit-frontend.git
```

2.Navigate to the correct Directory:

```bash
cd conduit-frontend
```

3. Start a local Dev Server:

```bash
ng serve --open
```

4. Open your local Frontend

```bash
<localhost:4200>
```

## Usage

### Installation-with-Docker

1. Clone the following Repository:

```bash
git clone git@github.com:HerzogElias/conduit-frontend.git
```

2.Navigate to the correct Directory:

```bash
cd conduit-frontend
```

3. Build your Dockerfile

```bash
docker build -t angular-conduit:latest .
```

4. Run your Docker Image:

```bash
docker run -d \
  --name angular-conduit \
  -p 8080:80 \
  angular-conduit:latest
```

4.You can start on Localhost:

```bash
http://localhost:8080
```

#### Stop-Container

Stop the Container with:

```bash
docker stop <container-name>
```

#### Delete-Container

After Stopping the Container you can delete this Container:

```bash
docker rm <container-name>
```

## Functions

### CI CD Pipeline

This project uses **GitHub Actions** to automate building and pushing Docker images to GitHub Container Registry (GHCR). The workflow runs on every push to `master` or manually via workflow dispatch.

**Pipeline Steps:**

1. **Checkout Repository**  
   Checks out the latest code from the repository.

2. **Login to GitHub Container Registry**  
   Authenticates with GHCR using the repository owner's credentials and GitHub token for image pushes.

3. **Setup QEMU for Multi-Architecture Support**  
   Prepares the environment to build Docker images for multiple CPU architectures (`amd64` and `arm64`).

4. **Setup Docker Buildx**  
   Configures Docker Buildx for multi-platform builds.

5. **Build and Push Docker Image**  
   Builds the Docker image for multiple architectures and pushes it to GHCR with the tag:

   ```bash
   ghcr.io/herzogelias/conduit-frontend:latest
   ```

### Functionality overview

The example application is a social blogging site (i.e. a Medium.com clone) called "Conduit". It uses a custom API for all requests, including authentication. You can view a live demo over at https://angular.realworld.io

**General functionality:**

- Authenticate users via JWT (login/signup pages + logout button on settings page)
- CRU\* users (sign up & settings page - no deleting required)
- CRUD Articles
- CR\*D Comments on articles (no updating required)
- GET and display paginated lists of articles
- Favorite articles
- Follow other users

**The general page breakdown looks like this:**

- Home page (URL: /#/ )
  - List of tags
  - List of articles pulled from either Feed, Global, or by Tag
  - Pagination for list of articles
- Sign in/Sign up pages (URL: /#/login, /#/register )
  - Uses JWT (store the token in localStorage)
  - Authentication can be easily switched to session/cookie based
- Settings page (URL: /#/settings )
- Editor page to create/edit articles (URL: /#/editor, /#/editor/article-slug-here )
- Article page (URL: /#/article/article-slug-here )
  - Delete article button (only shown to article's author)
  - Render markdown from server client side
  - Comments section at bottom of page
  - Delete comment button (only shown to comment's author)
- Profile page (URL: /#/profile/:username, /#/profile/:username/favorites )
  - Show basic user info
  - List of articles populated from author's created articles or author's favorited articles

<br />

[![Brought to you by Thinkster](https://raw.githubusercontent.com/gothinkster/realworld/master/media/end.png)](https://thinkster.io)

### Making requests to the backend API

For convenience, we have a live API server running at https://conduit.productionready.io/api for the application to make requests against. You can view [the API spec here](https://github.com/GoThinkster/productionready/blob/master/api) which contains all routes & responses for the server.

The source code for the backend server (available for Node, Rails and Django) can be found in the [main RealWorld repo](https://github.com/gothinkster/realworld).

If you want to change the API URL to a local server, simply edit `src/environments/environment.ts` and change `api_url` to the local server's URL (i.e. `localhost:3000/api`). Please note you will probably need to use a proxy in order to avoid Cross-Origin Resource (CORS) issues. (more info: [Proxying to a backend server](https://angular.io/guide/build#proxying-to-a-backend-server) )
