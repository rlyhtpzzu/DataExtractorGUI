# 🔍 数据安全提取工具 (Data Security Extractor)

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)

一个专为CTF比赛和数据安全领域设计的智能数据提取工具，支持从文件中快速提取多种敏感信息。

## ✨ 特性功能

### 🎯 核心功能
- **多格式支持**: 支持 txt、js、css、html、json、xml、log 等文本文件
- **批量处理**: 支持单个文件和整个目录的递归扫描
- **严格匹配**: 精确的正则表达式匹配，避免误提取
- **分类输出**: 按数据类型分别保存为独立的文本文件

### 📊 支持的数据类型

#### 个人身份与标识类
- 📱 手机号 (11位数字，严格验证运营商号段)
- 🆔 身份证号 (18位，包含校验码验证)
- 👤 中文姓名 (2-4个汉字，支持少数民族姓名)
- 👥 用户名/账号 (4-20位字母数字下划线)

#### 网络与通信类
- 🌐 IPv4地址 (严格验证0-255范围)
- 📧 邮箱地址 (标准邮箱格式验证)
- 🔗 URL链接 (http/https协议)
- 🔌 MAC地址 (冒号或横杠分隔格式)

#### 时间与日期类
- 📅 日期 (YYYY-MM-DD, YYYY/MM/DD, YYYY年MM月DD日)
- ⏰ 时间 (HH:MM:SS 或 HH:MM)

#### 代码与序列类
- 🔒 MD5哈希值 (32位十六进制)
- 🔒 SHA1哈希值 (40位十六进制)
- 📄 Base64编码 (严格验证等号填充)

### 🎨 界面特色
- **现代化GUI**: 基于Tkinter的优雅界面设计
- **直观操作**: 三步完成数据提取任务
- **实时进度**: 可视化进度条和状态提示
- **详细日志**: 完整的操作记录和结果统计

## 🚀 快速开始

### 方法一：使用预编译版本 (推荐)

1. 从 [Releases](https://github.com/yourusername/data-security-extractor/releases) 页面下载最新版本
2. 解压到任意目录
3. 双击运行 `DataExtractorGUI.exe`
4. 按照界面提示操作即可

### 方法二：从源码运行

#### 环境要求
- Python 3.8+
- 以下Python库：
  ```bash
  pip install tkinter
  ```

#### 运行步骤
1. 克隆仓库
   ```bash
   git clone https://github.com/yourusername/data-security-extractor.git
   cd data-security-extractor
   ```

2. 运行主程序
   ```bash
   python data_extractor_gui.py
   ```

### 方法三：自行打包
```bash
# 安装依赖
pip install pyinstaller

# 打包为可执行文件
python build.bat
# 或手动打包
pyinstaller --onefile --name DataExtractorGUI --add-data "config.json;." --add-data "app.ico;." --windowed data_extractor_gui.py
```

## 📖 使用指南

### 基本操作流程

1. **选择扫描目标**
   - 选择单个文件或整个目录
   - 可选递归扫描子目录

2. **选择数据类型**
   - 勾选需要提取的数据类型
   - 支持全选/全不选快捷操作

3. **设置输出目录**
   - 指定结果保存位置
   - 默认为当前目录下的output文件夹

4. **开始扫描**
   - 点击"开始扫描"按钮
   - 查看实时进度和日志输出

### 输出文件格式

扫描完成后，在输出目录中会生成以下文件：

```
output/
├── phone.txt          # 手机号数组
├── email.txt          # 邮箱地址数组  
├── id_card.txt        # 身份证号数组
├── ipv4.txt           # IP地址数组
├── username.txt       # 用户名数组
├── url.txt           # URL链接数组
└── scan_summary.txt   # 扫描统计报告
```

每个数据文件都是JSON数组格式：
```json
["13800138000","13912345678","15700001111"]
```

## 🛠️ 配置文件

工具使用 `config.json` 文件来定义数据提取规则，你可以根据需要自定义正则表达式：

```json
{
    "patterns": {
        "phone": {
            "pattern": "(?<!\\d)1[3-9]\\d{9}(?!\\d)",
            "description": "手机号",
            "icon": "📱"
        }
        // 更多模式...
    }
}
```

## 📸 界面预览

![主界面](screenshots/main-window.png)
*简洁直观的主界面*

![扫描结果](screenshots/scan-results.png)  
*详细的扫描结果和进度显示*

## 🎯 应用场景

### 🏆 CTF比赛
- 从日志文件中提取flag
- 分析网络流量数据
- 处理内存转储文件
- 扫描配置文件中的敏感信息

### 🔐 数据安全
- 安全审计和渗透测试
- 日志分析和取证
- 敏感信息泄露检测
- 数据脱敏验证

### 💼 开发测试
- 测试数据生成和验证
- 日志文件分析
- 配置文件检查
- 数据格式验证

## 🤝 贡献指南

我们欢迎各种形式的贡献！


### 提交代码
1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

感谢以下开源项目提供的灵感：
- [regex101](https://regex101.com/) - 正则表达式测试工具
- [TKinter](https://docs.python.org/3/library/tkinter.html) - Python GUI框架

## 📞 联系支持

- 🐛 **问题反馈**: [GitHub Issues]
- 📧 **邮箱联系**: rlyhtpltz@gmail.com

## ⭐ 如果觉得有用...

如果这个工具对你有帮助，请给个⭐Star支持一下！

---

**注意**: 本工具仅用于合法授权的安全测试和教育目的。使用者应遵守相关法律法规，不得用于非法用途。