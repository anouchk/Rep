library(data.table)

#set working directory
setwd('/Users/analutzky/Desktop')
Table_Hici=fread('/Users/analutzky/Desktop/Hici_2020.csv')

# showing it excel-like
View(Table_Hici)

#Relou, y'a plein de NA de la colonne 3 à 27. Je vérifie qu'il n'y vraiment rien par là :
# > sum(!is.na(Table_Hici$V3))
# [1] 0
# > sum(!is.na(Table_Hici$V4))
# [1] 0
# > sum(!is.na(Table_Hici$V25))
# [1] 0
# > sum(!is.na(Table_Hici$V26))
# [1] 0
# > sum(!is.na(Table_Hici$V27))
# [1] 0
# => good je peux les supprimer

# Garde-moi juste les 2 premières colonnes
Table_Hici=Table_Hici[,1:2]

# Je veux faire un dcast, or je n'ai pas de colonne id 
# => je veux créer une colonne id qui pour les 5 lignes d'un Hici donné, me mettra le même id.

Table_Hici[,row:=rep(1:(.N/5),each=5)]
# rep c'est repeat : répète-moi chaque élément de ce vecteur 5 fois. Si à la place de each on avait mis un truc genre "times", ça répèterait tout le vecteur 5 fois
# .N dans data.table ça veut dire "nb de lignes de ma table". On aurait pu mettre nrow(Table_Hici). En l'occurrence ici j'en ai 800
# (1:160 ) ça te crée un vecteur avec tous les chiffres entiers de 1 à 160

# Illustration :
# > 1:10
#  [1]  1  2  3  4  5  6  7  8  9 10
# > rep(1:10,2)
#  [1]  1  2  3  4  5  6  7  8  9 10  1  2  3  4  5  6  7  8  9 10
# > rep(1:10,each=2)
#  [1]  1  1  2  2  3  3  4  4  5  5  6  6  7  7  8  8  9  9 10 10

# Last but not least, y'a plein de lignes vides au-delà de l'id 160 => je les vire
Table_Hici=Table_Hici[row<=160,]

# Et pour finir le dcast qui va bien
######## RESHAPING #######
Table_Hici = dcast(Table_Hici,
				row~V1,
				value.var=c("V2"))

write.csv2(as.data.frame(Table_Hici),file='HiCi_reshaped.csv',fileEncoding = "UTF8")