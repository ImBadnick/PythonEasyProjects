import numpy as np
import pymysql
import datetime
import matplotlib.pyplot as plt

resultlist = []
connection = pymysql.connect(host='127.0.0.1', user='root',db='COVID')
try:
    with connection.cursor() as cursor:
        rows=cursor.execute("SELECT DISTINCT CountryName FROM `DATA`")
        if (rows==0): print("ERROR: Nessun CountryName")
        else:
            rows = cursor.fetchall()
            for row in rows:
                valuerows=cursor.execute("SELECT * FROM `DATA` WHERE CountryName = " + "\"" + row[0] + "\"" + " ORDER BY ReportName ASC")
                if (valuerows == 0): print("ERROR: No rows for the CountryName: " + row.CountryName)
                else:
                    valuerows = cursor.fetchall()
                    resultlist.append(valuerows)
    connection.commit()
    # with connection.cursor() as cursor:
    #     time = []
    #     dates=cursor.execute("SELECT DISTINCT ReportName FROM `DATA` ORDER BY ReportName ASC")
    #     if (rows==0): print("ERROR: Nessuna data da analizzare")
    #     else:
    #         dates = cursor.fetchall()
    #         for date in dates:
    #             split = date[0].split('-')
    #             tmp = split.pop()
    #             tmp = tmp.split('.')
    #             split.append(tmp[0])
    #             time.append(datetime.date(int(split[2]), int(split[0]), int(split[1])))
finally:
    connection.close()
time = []
values = []
for x in resultlist[0]:
    if (x[3] == 'Hebei'): 
        split = x[1].split('-')
        tmp = split.pop()
        tmp = tmp.split('.')
        split.append(tmp[0])
        time.append(datetime.date(int(split[2]), int(split[0]), int(split[1])))
        if (x[4] == None): values.append(0)
        else: values.append(x[4])
#print(len(time))

plt.plot(time,values)
plt.gcf().autofmt_xdate()
plt.show()
# dates = matplotlib.dates.date2num(time)
# matplotlib.pyplot.plot_date(dates, values)

#         split = date[1].split('-')
#         tmp = split.pop()
#         tmp = tmp.split('.')
#         split.append(tmp[0])
#         time.append = datetime.date(int(split[2]), int(split[0]), int(split[1]))

# print(time)



