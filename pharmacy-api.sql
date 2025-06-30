-- Create database if not exists
CREATE DATABASE IF NOT EXISTS pharmacy;
USE pharmacy;

-- Drop tables if they exist
DROP TABLE IF EXISTS pharmacy;
DROP TABLE IF EXISTS medicine;

-- Create medicine table
CREATE TABLE medicine (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    price DECIMAL(10,2),
    stock INT
);

-- Create pharmacy table
CREATE TABLE pharmacy (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(500),
    phone VARCHAR(50),
    latitude DOUBLE,
    longitude DOUBLE,
    operating_hours VARCHAR(100),
    is_open BOOLEAN DEFAULT TRUE
);

-- Insert sample medicines
INSERT INTO medicine (name, category, price, stock) VALUES
('Paracetamol', 'Painkiller', 12.50, 100),
('Amoxicillin', 'Antibiotic', 18.00, 50),
('Aspirin', 'Painkiller', 8.50, 200),
('Ibuprofen', 'Painkiller', 15.00, 75),
('Omeprazole', 'Antacid', 25.00, 30),
('Cetirizine', 'Antihistamine', 10.00, 60),
('Metformin', 'Diabetes', 35.00, 40),
('Lisinopril', 'Blood Pressure', 28.00, 25),
('Atorvastatin', 'Cholesterol', 45.00, 20),
('Omeprazole', 'Antacid', 22.00, 35);

-- Insert sample pharmacies with coordinates
INSERT INTO pharmacy (name, address, phone, latitude, longitude, operating_hours, is_open) VALUES
('City Pharmacy', '123 Main Street, New York, NY 10001', '+1-555-0123', 40.7128, -74.0060, '9 AM - 6 PM', true),
('Downtown Pharmacy', '456 Broadway, New York, NY 10013', '+1-555-0456', 40.7589, -73.9851, '8 AM - 8 PM', true),
('Central Pharmacy', '789 5th Avenue, New York, NY 10022', '+1-555-0789', 40.7614, -73.9776, '7 AM - 9 PM', true),
('Westside Pharmacy', '321 West 42nd Street, New York, NY 10036', '+1-555-0321', 40.7562, -73.9875, '6 AM - 10 PM', true),
('Eastside Pharmacy', '654 East 34th Street, New York, NY 10016', '+1-555-0654', 40.7477, -73.9754, '8 AM - 7 PM', false),
('Uptown Pharmacy', '987 Park Avenue, New York, NY 10075', '+1-555-0987', 40.7736, -73.9712, '9 AM - 5 PM', true),
('Brooklyn Pharmacy', '147 Bedford Avenue, Brooklyn, NY 11211', '+1-555-0147', 40.7173, -73.9568, '8 AM - 8 PM', true),
('Queens Pharmacy', '258 Queens Boulevard, Queens, NY 11106', '+1-555-0258', 40.7505, -73.9934, '7 AM - 9 PM', true);

-- Create indexes for better performance
CREATE INDEX idx_medicine_category ON medicine(category);
CREATE INDEX idx_medicine_name ON medicine(name);
CREATE INDEX idx_pharmacy_location ON pharmacy(latitude, longitude);
CREATE INDEX idx_pharmacy_name ON pharmacy(name);
CREATE INDEX idx_pharmacy_open ON pharmacy(is_open);
