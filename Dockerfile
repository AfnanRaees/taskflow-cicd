# TaskFlow - static site served by nginx
FROM nginx:alpine

# Remove the default nginx site
RUN rm -rf /usr/share/nginx/html/*

# Copy the static application into nginx's web root.
# A glob is used so the image builds correctly as pages are added incrementally
# through feature-branch pull requests (every PR before the last has a partial set).
COPY *.html style.css /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
