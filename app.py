from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Your_Password",
    database="flight_database"
)
cursor = db.cursor()

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/search_destination", methods=["GET", "POST"])
def search_destination():
    if request.method == "POST":
        destination_name = request.form["destination"]
        cursor.execute("SELECT name, price FROM destinations WHERE name = %s", (destination_name,))
        destination = cursor.fetchone()
        if destination:
            return render_template("destination.html", destination=destination)
        else:
            return render_template("destination_not_found.html")
    return render_template("search_destination.html")

@app.route("/search_booking", methods=["GET", "POST"])
def search_booking():
    if request.method == "POST":
        customer_name = request.form["customer"]
        cursor.execute("SELECT bookings.customer_name, destinations.name, destinations.price FROM bookings JOIN destinations ON bookings.destination_id = destinations.id WHERE customer_name = %s", (customer_name,))
        bookings = cursor.fetchall()
        if bookings:
            return render_template("booking.html", bookings=bookings)
        else:
            return render_template("booking_not_found.html")
    return render_template("search_booking.html")

@app.route("/book_ticket", methods=["GET", "POST"])
def book_ticket():
    if request.method == "POST":
        # Retrieve form data
        fullname = request.form["fullname"]
        email = request.form["email"]
        destination = request.form["destination"]
        departure_date = request.form["departure_date"]
        passenger_count = request.form["passenger_count"]
        
        # Insert data into bookings table
        cursor.execute("SELECT id FROM destinations WHERE name = %s", (destination,))
        destination_id = cursor.fetchone()[0]
        cursor.execute("INSERT INTO bookings (customer_name, destination_id) VALUES (%s, %s)", (fullname, destination_id))
        db.commit()  # Commit the transaction
        
        return render_template("booking_success.html", fullname=fullname, destination=destination, departure_date=departure_date, passenger_count=passenger_count)
        
    return render_template("book_ticket.html")

@app.route("/confirm_booking", methods=["POST"])
def confirm_booking():
    if request.method == "POST":

        fullname = request.form["fullname"]
        email = request.form["email"]
        destination = request.form["destination"]
        departure_date = request.form["departure_date"]
        passenger_count = request.form["passenger_count"]
        
        cursor.execute("SELECT id FROM destinations WHERE name = %s", (destination,))
        destination_id = cursor.fetchone()[0]
        cursor.execute("INSERT INTO bookings (customer_name, destination_id) VALUES (%s, %s)", (fullname, destination_id))
        db.commit() 
        return render_template("booking_success.html", fullname=fullname, destination=destination, departure_date=departure_date, passenger_count=passenger_count)

if __name__ == "__main__":
    app.run(debug=True)
