# 🏥 Pharmacy API with Google Maps Integration

A comprehensive Spring Boot REST API for managing pharmacy operations with integrated Google Maps functionality for location-based services.

## 🚀 Features

### Core Pharmacy Management
- **Medicine CRUD Operations**: Create, read, update, delete medicines
- **Inventory Management**: Track medicine stock levels and pricing
- **Category Management**: Organize medicines by categories

### Google Maps Integration
- **Geocoding**: Convert addresses to coordinates automatically
- **Nearby Pharmacy Search**: Find pharmacies within specified radius
- **Distance Calculation**: Calculate distance between user and pharmacy
- **Google Maps Directions**: Generate directions URLs for navigation
- **Location-based Services**: Filter pharmacies by location

### Advanced Features
- **Real-time Distance Calculations**: Using Haversine formula
- **Automatic Coordinate Generation**: From address input
- **Open/Closed Status**: Track pharmacy operating hours
- **Search Functionality**: Find pharmacies by name
- **RESTful API Design**: Standard HTTP methods and status codes

## 🛠️ Technology Stack

- **Backend**: Spring Boot 4.0.0-SNAPSHOT
- **Database**: MySQL 8.0+
- **ORM**: Spring Data JPA with Hibernate
- **Maps API**: Google Maps Services 2.2.0
- **Build Tool**: Maven
- **Java Version**: 17

## 📋 Prerequisites

- Java 17 or higher
- MySQL 8.0 or higher
- Google Maps API Key
- Maven 3.6+

## 🔧 Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd pharmacy-api
```

### 2. Database Setup
```sql
-- Create database
CREATE DATABASE pharmacy;

-- Import schema and sample data
mysql -u root -p pharmacy < pharmacy-api.sql
```

### 3. Environment Configuration
Create `.env` file in the root directory:
```env
# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_NAME=pharmacy
DB_USERNAME=root
DB_PASSWORD=your_password

# Google Maps API
GOOGLE_MAPS_API_KEY=your_google_maps_api_key

# Server Configuration
SERVER_PORT=8080
```

### 4. Update Application Properties
Edit `src/main/resources/application.properties`:
```properties
# Replace with your actual values
spring.datasource.password=${DB_PASSWORD}
google.maps.api.key=${GOOGLE_MAPS_API_KEY}
```

### 5. Build and Run
```bash
# Clean and build
mvn clean install

# Run the application
mvn spring-boot:run
```

### 6. Verify Installation
- API: http://localhost:8080/api/medicines
- Demo UI: http://localhost:8080/index.html
- Health Check: http://localhost:8080/actuator/health

## 📚 API Documentation

### Base URL
```
http://localhost:8080/api
```

### Medicine Endpoints

#### Get All Medicines
```http
GET /api/medicines
```
**Response:**
```json
[
  {
    "id": 1,
    "name": "Paracetamol",
    "category": "Painkiller",
    "price": 12.50,
    "stock": 100
  }
]
```

#### Create Medicine
```http
POST /api/medicines
Content-Type: application/json

{
  "name": "Ibuprofen",
  "category": "Painkiller",
  "price": 15.00,
  "stock": 75
}
```

### Pharmacy Endpoints

#### Get All Pharmacies
```http
GET /api/pharmacies
```

#### Create Pharmacy
```http
POST /api/pharmacies
Content-Type: application/json

{
  "name": "City Pharmacy",
  "address": "123 Main Street, New York, NY 10001",
  "phone": "+1-555-0123",
  "operatingHours": "9 AM - 6 PM",
  "isOpen": true
}
```

#### Find Nearby Pharmacies
```http
GET /api/pharmacies/nearby?latitude=40.7128&longitude=-74.0060&radius=10
```

#### Get Distance to Pharmacy
```http
GET /api/pharmacies/{id}/distance?latitude=40.7128&longitude=-74.0060
```

#### Get Directions to Pharmacy
```http
GET /api/pharmacies/{id}/directions?latitude=40.7128&longitude=-74.0060
```

#### Search Pharmacies by Name
```http
GET /api/pharmacies/search?name=City
```

#### Get Open Pharmacies
```http
GET /api/pharmacies/open
```

## 🗄️ Database Schema

### Medicine Table
```sql
CREATE TABLE medicine (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    price DECIMAL(10,2),
    stock INT
);
```

### Pharmacy Table
```sql
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
```

## 🧪 Testing

### Sample API Requests

#### Create a Medicine
```bash
curl -X POST http://localhost:8080/api/medicines \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Aspirin",
    "category": "Painkiller",
    "price": 8.50,
    "stock": 200
  }'
```

#### Create a Pharmacy
```bash
curl -X POST http://localhost:8080/api/pharmacies \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Downtown Pharmacy",
    "address": "456 Broadway, New York, NY 10013",
    "phone": "+1-555-0456",
    "operatingHours": "8 AM - 8 PM",
    "isOpen": true
  }'
```

#### Find Nearby Pharmacies
```bash
curl "http://localhost:8080/api/pharmacies/nearby?latitude=40.7128&longitude=-74.0060&radius=5"
```

## 🎯 Design Decisions

### Architecture
- **Layered Architecture**: Controller → Service → Repository → Database
- **RESTful Design**: Standard HTTP methods and status codes
- **Separation of Concerns**: Each layer has specific responsibilities

### Google Maps Integration
- **Automatic Geocoding**: Addresses are converted to coordinates on creation
- **Distance Calculation**: Uses Haversine formula for accurate distance calculation
- **Directions Integration**: Generates Google Maps URLs for navigation

### Database Design
- **Normalized Schema**: Separate tables for medicines and pharmacies
- **Location Storage**: Latitude/longitude for spatial queries
- **Indexing**: Optimized for location-based searches

### Security Considerations
- **API Key Management**: Google Maps API key stored in environment variables
- **Input Validation**: All inputs are validated before processing
- **Error Handling**: Comprehensive error responses

## 🚨 Troubleshooting

### Common Issues

#### Database Connection Error
```
Error: Could not create connection to database server
```
**Solution**: Ensure MySQL is running and credentials are correct in `.env`

#### Google Maps API Error
```
Error: Could not geocode address
```
**Solution**: Verify Google Maps API key is valid and has Geocoding API enabled

#### Port Already in Use
```
Error: Web server failed to start. Port 8080 was already in use
```
**Solution**: Change port in `application.properties` or stop other services

### Logs
Check application logs for detailed error information:
```bash
tail -f logs/application.log
```

## 📝 Sample Data

The application includes sample data for testing:

### Sample Medicines
- Paracetamol (Painkiller) - $12.50
- Amoxicillin (Antibiotic) - $18.00
- Aspirin (Painkiller) - $8.50

### Sample Pharmacies
- City Pharmacy - 123 Main Street, New York
- Downtown Pharmacy - 456 Broadway, New York

## 🔄 API Versioning

Current API version: v1
- Base path: `/api`
- All endpoints are backward compatible

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact: [shuklashivani1001@gmail.com]

---

**Note**: This API requires a valid Google Maps API key for full functionality. Make sure to enable the Geocoding API in your Google Cloud Console.

