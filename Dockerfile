FROM nginx:stable-alpine
# Copy the pre-built files from your dist folder to the Nginx html directory
COPY dist /usr/share/nginx/html
# Expose port 80 internally
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
