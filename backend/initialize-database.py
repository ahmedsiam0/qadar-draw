import mysql.connector
import socket
from pathlib import Path
import os.path

con = mysql.connector.connect(
    host = socket.gethostname(),
    user = "root",
    password = "password",
    port = 3306
)

cur = con.cursor()

cur.execute("DROP DATABASE qadar_draw")

cur.execute("CREATE DATABASE qadar_draw")

cur.execute("USE qadar_draw")

schema = Path(f"{os.path.realpath(os.path.dirname(__file__))}/schema.sql").read_text()

cur.execute(schema)

# con.commit()

print("Success!")

cur.close()

con.close()