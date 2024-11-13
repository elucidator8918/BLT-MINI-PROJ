// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ProductRegistry is AccessControl {
    // Changed to private to save gas
    bytes32 private constant REGISTRAR_ROLE = keccak256("REGISTRAR_ROLE");

    struct Product {
        string name;
        string manufacturer;
        bool isRegistered;
        bool exists;
    }

    mapping(string => Product) private products;

    // Added events for actions like adding/removing registrars
    event ProductRegistered(
        string indexed productId,
        string indexed name,
        address indexed registrar
    );

    event ProductVerified(
        string indexed productId,
        bool isAuthentic
    );

    event RegistrarAdded(address indexed registrar);
    event RegistrarRemoved(address indexed registrar);

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(REGISTRAR_ROLE, msg.sender);
    }

    function registerProduct(
        string calldata _productId,
        string calldata _name,
        string calldata _manufacturer
    ) public onlyRole(REGISTRAR_ROLE) {
        // Input validation
        require(bytes(_productId).length != 0, "Product ID cannot be empty");
        require(bytes(_name).length != 0, "Name cannot be empty");
        require(bytes(_manufacturer).length != 0, "Manufacturer cannot be empty");

        // Check if product already exists
        require(!products[_productId].exists, "Product already registered");

        // Optimized struct assignment
        Product storage product = products[_productId];
        product.name = _name;
        product.manufacturer = _manufacturer;
        product.isRegistered = true;
        product.exists = true;

        emit ProductRegistered(_productId, _name, msg.sender);
    }

    function verifyProduct(string calldata _productId) 
        public 
        view 
        returns (bool, string memory, string memory) 
    {
        // Cache storage variable
        Product storage product = products[_productId];
        require(product.exists, "Product not found");

        return (product.isRegistered, product.name, product.manufacturer);
    }

    function isProductRegistered(string calldata _productId) 
        public 
        view 
        returns (bool) 
    {
        // Cache storage variable
        Product storage product = products[_productId];
        return product.exists && product.isRegistered;
    }

    // Admin function to add new registrars
    function addRegistrar(address _registrar) 
        public 
        onlyRole(DEFAULT_ADMIN_ROLE) 
    {
        grantRole(REGISTRAR_ROLE, _registrar);
        emit RegistrarAdded(_registrar); // Emit event when registrar is added
    }

    // Admin function to remove registrars
    function removeRegistrar(address _registrar) 
        public 
        onlyRole(DEFAULT_ADMIN_ROLE) 
    {
        revokeRole(REGISTRAR_ROLE, _registrar);
        emit RegistrarRemoved(_registrar); // Emit event when registrar is removed
    }
}
