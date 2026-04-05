#!/bin/bash

# 食品废物提案部署脚本
# 使用方法: ./deploy_to_github.sh [您的GitHub用户名] [仓库名]

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 MyGreenPlus食品废物提案部署脚本${NC}"
echo "=========================================="

# 检查参数
if [ $# -lt 2 ]; then
    echo -e "${YELLOW}使用方法: $0 [GitHub用户名] [仓库名]${NC}"
    echo "示例: $0 Alfredli6226 hma-food-waste-proposal"
    echo ""
    echo -e "${YELLOW}或者手动部署:${NC}"
    echo "1. 访问 https://github.com/new"
    echo "2. 创建仓库: hma-food-waste-proposal"
    echo "3. 运行: ./deploy_to_github.sh Alfredli6226 hma-food-waste-proposal"
    exit 1
fi

GITHUB_USER="$1"
REPO_NAME="$2"
REPO_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo -e "${GREEN}📦 准备部署到: ${REPO_URL}${NC}"

# 检查Git是否安装
if ! command -v git &> /dev/null; then
    echo -e "${RED}错误: Git未安装${NC}"
    exit 1
fi

# 检查当前目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${GREEN}📁 当前目录: $(pwd)${NC}"

# 检查文件是否存在
if [ ! -f "index_english.html" ]; then
    echo -e "${RED}错误: 找不到提案文件${NC}"
    exit 1
fi

echo -e "${GREEN}✅ 找到提案文件:${NC}"
ls -la *.html

# 创建临时目录
TEMP_DIR="/tmp/food-waste-deploy-$(date +%s)"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

echo -e "${GREEN}🔄 克隆仓库...${NC}"

# 尝试克隆仓库
if git clone "$REPO_URL" . 2>/dev/null; then
    echo -e "${GREEN}✅ 仓库克隆成功${NC}"
else
    echo -e "${YELLOW}⚠️  仓库不存在或无法访问${NC}"
    echo -e "${YELLOW}请先创建仓库:${NC}"
    echo "1. 访问 https://github.com/new"
    echo "2. 仓库名: $REPO_NAME"
    echo "3. 描述: MyGreenPlus Kitchen Oil Recovery System - Professional Proposal"
    echo "4. 选择: Public"
    echo "5. 不要初始化README"
    echo "6. 点击: Create repository"
    echo ""
    echo -e "${YELLOW}创建后重新运行此脚本${NC}"
    exit 1
fi

# 复制文件
echo -e "${GREEN}📋 复制提案文件...${NC}"
cp -r "$SCRIPT_DIR"/* . 2>/dev/null || true

# 检查文件
echo -e "${GREEN}📄 文件列表:${NC}"
ls -la *.html

# 配置Git
git config user.name "OpenClaw Assistant"
git config user.email "assistant@openclaw.ai"

# 添加文件
echo -e "${GREEN}➕ 添加文件到Git...${NC}"
git add .

# 提交更改
echo -e "${GREEN}💾 提交更改...${NC}"
git commit -m "添加MyGreenPlus食品废物提案 - $(date '+%Y-%m-%d %H:%M:%S')" || {
    echo -e "${YELLOW}⚠️  没有更改需要提交${NC}"
}

# 推送更改
echo -e "${GREEN}🚀 推送到GitHub...${NC}"
if git push origin main; then
    echo -e "${GREEN}✅ 推送成功！${NC}"
else
    echo -e "${RED}❌ 推送失败${NC}"
    echo -e "${YELLOW}请检查:${NC}"
    echo "1. GitHub权限"
    echo "2. 网络连接"
    echo "3. 仓库是否存在"
    exit 1
fi

# 清理
cd "$SCRIPT_DIR"
rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}🎉 部署完成！${NC}"
echo "=========================================="
echo -e "${YELLOW}下一步: 启用GitHub Pages${NC}"
echo ""
echo "1. 访问: https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo "2. 在'Source'部分选择: main branch"
echo "3. 点击: Save"
echo "4. 等待1-2分钟部署完成"
echo ""
echo -e "${GREEN}🌐 您的提案将在以下地址可用:${NC}"
echo "主链接: https://${GITHUB_USER}.github.io/${REPO_NAME}/"
echo ""
echo -e "${GREEN}📱 三个版本:${NC}"
echo "1. 英文版: https://${GITHUB_USER}.github.io/${REPO_NAME}/index_english.html"
echo "2. 中文版: https://${GITHUB_USER}.github.io/${REPO_NAME}/index_chinese.html"
echo "3. 双语版: https://${GITHUB_USER}.github.io/${REPO_NAME}/index_complete.html"
echo ""
echo -e "${GREEN}🚀 立即测试:${NC}"
echo "open https://${GITHUB_USER}.github.io/${REPO_NAME}/index_english.html"
echo ""
echo -e "${YELLOW}💡 提示: 如果遇到404，请等待几分钟让GitHub Pages部署完成${NC}"

# 创建快速测试命令
echo ""
echo -e "${GREEN}📝 快速测试命令:${NC}"
cat > /tmp/test_food_waste.sh << EOF
#!/bin/bash
echo "测试食品废物提案链接:"
echo "英文版: https://${GITHUB_USER}.github.io/${REPO_NAME}/index_english.html"
echo "中文版: https://${GITHUB_USER}.github.io/${REPO_NAME}/index_chinese.html"
echo "双语版: https://${GITHUB_USER}.github.io/${REPO_NAME}/index_complete.html"
echo ""
echo "一键打开英文版:"
echo "open https://${GITHUB_USER}.github.io/${REPO_NAME}/index_english.html"
EOF

chmod +x /tmp/test_food_waste.sh
echo "测试脚本已保存: /tmp/test_food_waste.sh"