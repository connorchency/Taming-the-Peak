import pandas as pd, pandasql as ps
from sys import argv
script, filename
data = read.csv("{}".filename)

data.columns = columns = [['LCLid','stdorToU',
'DateTime','Consumption','Acorn','Acorn_grouped']]

q = """SELECT DateTime, SUM(Consumption)
    FROM data
    Group By DateTime"""

output = ps.sqldf(q, globals())
