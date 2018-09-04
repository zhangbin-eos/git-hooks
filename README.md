# git-hooks

# 文件说明

- config-localhooks.sh:配置文件
- hooks/\*:钩子文件


# how to use
1. 将config-localhooks.sh和hooks/拷贝到仓库的根目录(不使用哪个钩子就不要拷贝)
2. 运行`./config-localhooks.sh`

**完成**

**注意**:pre-commit仅适用于C代码工程,其中indent工具仅对c语音代码进行检测


# 效果
## pre-commit
1. 检测文件末尾的空行
```
README.md:75: new blank line at EOF.
```
2. 检测文件行尾空格
```
README.md:24: trailing whitespace.
+2. 检测文件行尾空格
```
3. 检测non-ASCII文件名
```
Error: Attempt to add a non-ASCII file name.

This can cause problems if you want to work with people on other platforms.

To be portable it is advisable to rename the file.

If you know what you are doing you can disable this check using:

  git config hooks.allownonascii true
```
4. 检测C代码(.c.h.cpp.hpp.cxx.hxx)格式
```
lig_pip.c bad

you need used

        'indent -linux -bls -blf -bl -bli0 lig_pip.c '
or

        'cat lig_pip.c | indent -linux -bls -blf -bl -bli0 -o lig_pip.c'
```


## commit-msg
1. 第一行格式错误提示
```
##############################################################################
##                                                                          ##
## Commit message style check                                               ##
##                                                                          ##
## Example:                                                                 ##
##     <type>(<scope>): <subject>                                           ##
##                                                                          ##
##           <body>                                                         ##
##                                                                          ##
##     <footer>                                                             ##
##                                                                          ##
## <type>      Must be follow one :                                         ##
##               "feat","fix","docs","style","refactor","test","chore"      ##
##                                                                          ##
## <scope>     用于说明 commit影响范围                                      ##
##                                                                          ##
## <subject>   commit 目的的简短描述,不超过50个字符                         ##
##                                                                          ##
## <Footer>    如果当前代码与上一个版本不兼容                               ##
##             则 Footer 部分以BREAKING CHANGE开头                          ##
##                                                                          ##
## <Revert>    如果当前 commit 用于撤销以前的 commit                        ##
##             则必须以revert:开头,后面跟着被撤销 Commit 的 Header          ##
##                                                                          ##
##                                                                          ##
##############################################################################
commit massage error

```
2. 第二行非空提示
```
第二行必须是空行
commit massage error

```


# 依赖

**pre-commit:**
- indent:代码格式话工具,windows/linux均可运行.[indent for windows](http://gnuwin32.sourceforge.net/packages/indent.htm)


**commit-msg:**
- grep: gitbash中会带,linux上是默认安装的
- sed:同上
