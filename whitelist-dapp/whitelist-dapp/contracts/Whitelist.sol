// SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

contract Whitelist {
    // Maximum number of whitelisted address
    uint256 public maxWhitelistedAddresses;

    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Already whitelisted");

        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Whitelist limit reached"
        );

        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
