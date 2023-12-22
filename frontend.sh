echo -e " \e[32m installing nginx \e[0m"
dnf install nginx -y &>>/tmp/expense.log

echo -e " \e[32m copy expense config files \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense.log

echo -e " \e[32m clean old nginx content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log

echo -e " \e[32m download frontend application code \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log

echo -e " \e[32m extract downloaded application content\e[0m"
cd /usr/share/nginx/html &>>/tmp/expense.log
unzip /tmp/frontend.zip &>>/tmp/expense.log


echo -e " \e[32m starting nginx \e[0m"
systemctl enable nginx &>>/tmp/expense.log
systemctl restart nginx &>>/tmp/expense.log
