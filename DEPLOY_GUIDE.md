# 食品废物提案部署指南

## 🚀 快速部署到GitHub Pages

### 步骤1: 创建GitHub仓库
1. 访问 https://github.com/new
2. 仓库名称: `hma-food-waste-proposal` (或您喜欢的名称)
3. 描述: "MyGreenPlus Kitchen Oil Recovery System - Professional Proposal"
4. 选择: Public
5. 不要初始化README
6. 点击"Create repository"

### 步骤2: 上传文件
```bash
# 1. 克隆仓库
cd ~/Desktop
git clone https://github.com/[您的用户名]/hma-food-waste-proposal.git
cd hma-food-waste-proposal

# 2. 复制提案文件
cp -r /Users/alfredli6226/.openclaw/workspace/food_waste_proposal/* .

# 3. 提交更改
git add .
git commit -m "添加MyGreenPlus食品废物提案"
git push origin main
```

### 步骤3: 启用GitHub Pages
1. 访问您的仓库: `https://github.com/[您的用户名]/hma-food-waste-proposal`
2. 点击"Settings" → "Pages"
3. 在"Source"部分选择: `main` branch
4. 点击"Save"
5. 等待1-2分钟部署完成

### 步骤4: 访问在线链接
您的提案将在以下地址可用:
```
https://[您的用户名].github.io/hma-food-waste-proposal/
```

## 🔗 在线链接

### 三个版本:
1. **英文版**: `https://[您的用户名].github.io/hma-food-waste-proposal/index_english.html`
2. **中文版**: `https://[您的用户名].github.io/hma-food-waste-proposal/index_chinese.html`
3. **双语版**: `https://[您的用户名].github.io/hma-food-waste-proposal/index_complete.html`

## 💻 本地测试

### 方法1: 直接打开
```bash
# 英文版
open index_english.html

# 中文版
open index_chinese.html

# 双语版
open index_complete.html
```

### 方法2: 本地服务器
```bash
# 在提案文件夹中运行
python3 -m http.server 8000
```
然后访问: `http://localhost:8000/index_english.html`

## 📱 功能测试

### 测试项目:
1. ✅ **响应式设计** - 在不同设备尺寸测试
2. ✅ **收入计算器** - 输入不同数值计算收入
3. ✅ **语言切换** - 点击右上角按钮切换语言
4. ✅ **主题切换** - 点击右下角按钮切换亮色/暗色主题
5. ✅ **导航链接** - 点击导航菜单跳转到对应章节
6. ✅ **打印功能** - 测试打印样式 (Cmd+P)

## 🎯 使用场景

### 英文版适合:
- 国际投资者会议
- 跨国公司合作
- 英文客户沟通
- 国际展会展示

### 中文版适合:
- 本地客户会议
- 政府机构提交
- 中文客户演示
- 团队内部培训

### 双语版适合:
- 混合客户群体
- 教育目的
- 参考对比

## 🔧 自定义修改

### 修改联系方式:
编辑每个HTML文件中的联系信息部分:
```html
<p><strong>Phone:</strong> +60 11-1072 8228</p>
<p><strong>WhatsApp:</strong> +60 11-1072 8228</p>
<p><strong>Email:</strong> admin@hmadigital.asia</p>
```

### 修改公司信息:
编辑文件头部和底部的公司信息。

## 📞 技术支持

如有问题或需要帮助:
- 联系: Alfred Li
- WhatsApp: +60 11-1072 8228
- Email: admin@hmadigital.asia

## 🎉 部署完成

成功部署后，您可以:
1. 分享链接给客户和投资者
2. 在会议中演示提案
3. 作为公司网站的服务页面
4. 培训销售团队使用

**祝您部署顺利！** 🚀