# Sử dụng hình ảnh Ubuntu mới nhất
FROM ubuntu:latest

# Thông tin tác giả
MAINTAINER Tuan Thai "tuanthai@example.com"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Thêm mã nguồn vào trong container
ADD . /flask_app

# Đặt thư mục làm việc
WORKDIR /flask_app

# Tạo môi trường ảo
RUN python3 -m venv venv

# Cập nhật pip trong môi trường ảo
RUN ./venv/bin/python -m pip install --upgrade pip

# Cài đặt gói từ requirements.txt
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Lệnh để chạy ứng dụng
CMD ["./venv/bin/python", "flask_docker.py"]

