#!/bin/bash
# Отправить каталог программ на GitHub (сайт https://pavelb-22.github.io/)
#   bash publish.sh
set -e
cd "$(dirname "$0")"
mkdir -p .github/workflows
cp ci/post-intro.yml .github/workflows/post-intro.yml

[ -d .git ] || git init -b main
git add -A
git commit -m "Каталог $(date '+%Y-%m-%d %H:%M')" || echo "(нет новых изменений)"
git remote | grep -q origin || git remote add origin https://github.com/PavelB-22/PavelB-22.github.io.git
git push -u origin main
echo
echo "✅ Готово. Через 1–2 минуты сайт обновится: https://pavelb-22.github.io/"
