---
---
---

# Rstudio 记录

该project主要记录Rstudio 一些常见的 File Type 和 Application：Quarto 和 Shiny。

## my_first_quarto_project

> 官方文档：Quarto is a multi-language, next-generation version of R Markdown from Posit and includes dozens of new features and capabilities while at the same being able to render most existing Rmd files without modification.

可见Quarto相当于加强版的.Rmd，不仅能够兼容并渲染已有的Rmd文件为多种格式的文档（pdf、html、word），而且还支持多种语言，此外同LaTex一样用于编写正规的文档（说明、论文等），但这种一般用不到。值的说明的是：R notebook 相较 R markdown不仅仅是记录，同时还具有代码运行的特点，类似于Jupyter notebook。而Quarto则强在兼容合并markdown和notebook的特点，能多用于说明文档，一般教程的编写等。

对于README文档的编写，均只能采用Rmd。对于Quarto编写说明文档，可以采用讲Quarto文档编译的HTML文档发布到GitHub Pages中形成一个可以被其他人访问的网页，具体实现步骤：[发布到GitHub Pages](https://github.com/djhcod/Quarto-foundation.github.io/tree/main?tab=readme-ov-file#%E5%8F%91%E5%B8%83%E5%88%B0github-pages)

my_first_quarto_project 见：[说明例子](https://github.com/djhcod/Quarto-foundation.github.io/tree/main?tab=readme-ov-file#%E5%8F%91%E5%B8%83%E5%88%B0github-pages)

**参考：**[Quarto.org](https://quarto.org/docs/get-started/hello/rstudio.html)

## my_first_shiny_project

没什么说的，Shiny功能很强大，通过网页，让用户通过web browser对数据进行实时交互，虽然底层还是R（或许还能是其它语言），但用户的体验感很好。

目前，不太清楚如何轻应用共享，上传到could？，后续再看，同时也作一个记录，方便后续有Shiny application开发的需求。

Shiny.R 的一般样式如下：

```{r}
library(shiny)

# Define UI ----
ui <- fluidPage(
  
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
```

**参考：**

[简书：开发一个Rshiny应用（基础）](https://www.jianshu.com/p/2b7688a6b7a7)

[知乎：shiny \| 使用R创建一个网页应用（Web App）](https://zhuanlan.zhihu.com/p/567950867)
