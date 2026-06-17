# TaskFlow — CI/CD Pipeline (DevOps Fundamentals, Assignment 04, Spring 2026)

TaskFlow is a lightweight 5-page task-management web application, containerized
with Docker (nginx) and delivered through a chained GitHub Actions CI/CD pipeline
that deploys automatically to Render.

## Pages
| File | Page |
|------|------|
| `index.html` | Home / Dashboard |
| `add-task.html` | Add Task |
| `task-list.html` | Task List |
| `task-detail.html` | Task Detail |
| `about.html` | About / Help |
| `style.css` | Shared stylesheet |

## Pipeline
- **CI** (`.github/workflows/ci.yml`) — runs on a pull request targeting `develop`:
  checkout → Docker Hub login → build → tag (`latest` + short SHA) → push to Docker Hub.
- **CD** (`.github/workflows/cd.yml`) — runs on a push to `develop` (PR merge):
  checkout → uses the `development` environment → `curl` POST to the Render deploy hook → timestamped confirmation.

## Secrets (created by Team Lead only)
| Scope | Secret |
|-------|--------|
| Repository | `DOCKERHUB_USERNAME` |
| Repository | `DOCKERHUB_TOKEN` |
| Environment (`development`) | `RENDER_DEPLOY_HOOK_URL` |

## Branching
- `main` — stable base.
- `develop` — default working branch (protected: requires CI pass + 1 review).
- `feature/<github-username>/<page-name>` — per-member feature branches.

## Team
| Role | Name | GitHub |
|------|------|--------|
| Team Lead | Afnan Raees (L1S23BSSE0024) | AfnanRaees |
| Member | Abaidullah Zakki (L1S23BSSE0009) | muhammadabaidullahzaki |

## Run locally
```bash
docker build -t taskflow-cicd .
docker run --rm -p 8080:80 taskflow-cicd
# open http://localhost:8080
```
