# Fake Product Identification System

A blockchain-based solution to ensure the authenticity of products using embedded 2D barcodes for tracking and verification.

## 🚀 Project Overview

This system embeds a 2D barcode on a product, which is tied to a secure blockchain network. It enables consumers and businesses to verify the authenticity of products, preventing counterfeit goods and ensuring supply chain transparency.

### Key Features:
- **Embedded 2D Barcode**: Each product is tagged with a unique 2D barcode containing product details and a cryptographic hash.
- **Blockchain Integration**: The barcode data is stored on a decentralized blockchain to ensure immutability and traceability.
- **Product Verification**: Consumers can scan the barcode using a mobile app or device to check the product's legitimacy.

## 🛠️ Technologies Used
- **Blockchain**: Ethereum (or any preferred blockchain platform)
- **Barcode**: 2D barcode generation (QR Code or Data Matrix)

## 🖥️ Installation

### Prerequisites:
- Node.js >= 16.0
- npm or yarn
- Blockchain account (e.g., Ganache)
- Python 3.11

## ⚙️ Usage

1. **Register a Product**:
    - Create a new product entry on the blockchain with product details and a unique barcode.
    - Example:
      - Product Name: "Genuine Watch"
      - Serial Number: "1234567890"
      - Barcode: A unique 2D code.
2. **Scan a Barcode**:
    - Use the mobile app to scan the product’s barcode.
    - The app checks the blockchain for product authenticity.
    - If the product is genuine, it shows product details and verification status.
3. **Verify Authenticity**:
    - Consumers can verify the product's details by comparing the information fetched from the blockchain with the product in hand.

## 📄 License

This project is licensed under the MIT License.
