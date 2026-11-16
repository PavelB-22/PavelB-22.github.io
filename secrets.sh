#!/bin/bash
# Добавить секреты для публикации поста ботом. Запуск: bash secrets.sh
URL="https://github.com/PavelB-22/PavelB-22.github.io/settings/secrets/actions"
open "$URL"
echo "Открыл страницу секретов. Нужно создать два секрета («New repository secret»):"
echo
echo "1) Name: TELEGRAM_BOT_TOKEN"
echo "   Secret: токен бота @bezpodpiski_soft_bot (из @BotFather → /mybots → бот → API Token)"
echo
read -p "Вставь сюда ссылку на любой пост из канала (ПКМ по посту → «Копировать ссылку»): " LINK
ID=$(echo "$LINK" | sed -nE 's#.*t\.me/c/([0-9]+)/.*#\1#p')
if [ -z "$ID" ]; then echo "❌ Не похоже на ссылку вида https://t.me/c/1234567890/5"; exit 1; fi
printf "%s" "-100$ID" | pbcopy
echo
echo "2) Name: TELEGRAM_CHAT_ID"
echo "   Secret: -100$ID   ← уже в буфере, просто ⌘V"
