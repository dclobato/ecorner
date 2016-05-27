#!/usr/bin/python

from flask import Flask
import mysql.connector

app = Flask(__name__)

db = mysql.connector.connect(host='localhost',user='root',passwd='Ecorner@2016',db='BDECorner')

@app.route('/localizar/<uid>')
def localizar(uid):

	sql="select Localizacao.* from Localizacao, Estacao where Estacao.Estacao_Localizacao=Localizacao.Localizacao_ID and Estacao.Estacao_ID = '%s'" % uid
	cur = db.cursor()
	cur.execute(sql)
	results = cur.fetchall()
	dados = 'Dados de retorno: '
	for row in results:
		dados = dados+str(row[0])+', '+str(row[1])+', '+str(row[2])+', '+str(row[3])+', '+str(row[4])+', '+str(row[5])+', '+str(row[6])+', '+str(row[7])
	return dados

@app.route('/')
def teste():
	var_teste='teste'
	return 'eCorner web service!'


if __name__ == '__main__':
	app.run(host='0.0.0.0')
