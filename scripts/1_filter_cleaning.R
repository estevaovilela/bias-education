# Rules
# CO_UF = 31: Minas Gerais
# TP_DEPENDENCIA = 2 OU 3: rede estadual ou rede municipal
# TP_TIPO_TURMA = 0 OU 1 OU 2 OU 3: Não possui atendimento diferenciado; Classe hospitalar;
# Unidade de atendimento socioeducativo; Unidade prisional. 

# Library -------------------------------------------------------------

library(data.table)
library(tidyverse)

# Censo 2018 --------------------------------------------------------------

df_censo_18 <- fread("./data/raw/MATRICULA_SUDESTE_2018.csv",
                     select = c("ID_ALUNO", "NU_IDADE_REFERENCIA",
                                "NU_DIA", "NU_MES", "NU_ANO",
                                "TP_SEXO", "TP_COR_RACA",
                                "TP_ZONA_RESIDENCIAL", "TP_ETAPA_ENSINO", "TP_DEPENDENCIA", "CO_ENTIDADE",
                                "CO_MUNICIPIO", "CO_UF", "TP_TIPO_TURMA", "IN_EDUCACAO_INDIGENA"))

df_censo_18 <- df_censo_18 %>% 
  filter(CO_UF == 31) %>% 
  filter(TP_TIPO_TURMA %in% c(0,1,2,3))

write.table(df_censo_18, "./data/treated/minas_gerais_18.csv", 
            sep = "|", row.names = FALSE)

# Censo 2019 --------------------------------------------------------------

df_censo_19 <- fread("./data/raw/MATRICULA_SUDESTE_2019.csv",
                     select = c("ID_ALUNO", "NU_IDADE_REFERENCIA", 
                                "TP_SEXO", "TP_COR_RACA",
                                "TP_ZONA_RESIDENCIAL", "TP_ETAPA_ENSINO", "TP_DEPENDENCIA", "CO_ENTIDADE",
                                "CO_MUNICIPIO", "CO_UF", "TP_TIPO_ATENDIMENTO_TURMA", "IN_EDUCACAO_INDIGENA"))

df_censo_19 <- df_censo_19 %>% 
  filter(CO_UF == 31) %>% 
  filter(TP_TIPO_ATENDIMENTO_TURMA == 1)

write.table(df_censo_19, "./data/treated/minas_gerais_19.csv", 
            sep = "|", row.names = FALSE)
