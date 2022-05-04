
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
