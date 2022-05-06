
# Trabalhando com textos - rvest -------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data do script: 30/04/22 -----------------------------------------------------------------------------------------------------------------
# Referência: Curso Udemy ------------------------------------------------------------------------------------------------------------------

# Pacotes necessários ------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(rvest) 

# Lendo páginas ----------------------------------------------------------------------------------------------------------------------------

x <- "https://pt.wikipedia.org/wiki/Os_Simpsons"
pagina <- read_html(x)

texto <- pagina %>%
  html_nodes("h2 , p , #firstHeading") %>% # Partes do texto que serão extraídas para análises
  html_text()

### Todos os textos em amarelo e verde da página selecionados através da extensão do 
### Google Chrome são extraídos e numerados em partes.

texto
texto[65]

# Extraindo textos e links -----------------------------------------------------------------------------------------------------------------

link_texto <- pagina %>%
  html_nodes("p a") %>%
  html_text()
link_texto # Todos os textos dos links da página

link <- pagina %>%
  html_nodes("p a") %>%
  html_attr("href")
link # Todos os links

simpsons_links <- data.frame("Texto" = link_texto, "Links" = link)
view(simpsons_links)

# Extraindo tabelas ------------------------------------------------------------------------------------------------------------------------

tabela <- pagina %>%
  html_table(fill = TRUE)
class(tabela)
view(tabela[5])

# Extraindo várias páginas de uma vez ------------------------------------------------------------------------------------------------------

### Letras de músicas dos Beatles

y <- "https://www.vagalume.com.br/the-beatles/"

t1 <- y %>%
  read_html() %>%
  html_nodes(".lineColLeft") %>%
  html_text

l1 <- y %>%
  read_html() %>%
  html_nodes(".nameMusic") %>%
  html_attr("href")

beatles_link <- data.frame("texto" = t1, "link" = l1)
view(beatles_link)
