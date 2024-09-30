// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Mytoken is ERC20 {

    // Mapping of item names (gaming tools) to required token amounts
    mapping(string => uint256) public itemPrices;

    constructor() ERC20("TORQUE", "TOU") {
        // Initialize item prices
        itemPrices["Health Potion"] = 100 * 10 ** decimals(); // 100 tokens
        itemPrices["Mana Potion"] = 150 * 10 ** decimals();   // 150 tokens
        itemPrices["Magic Sword"] = 300 * 10 ** decimals();   // 300 tokens
        itemPrices["Shield of Valor"] = 250 * 10 ** decimals(); // 250 tokens
        itemPrices["Epic Bow"] = 400 * 10 ** decimals();       // 400 tokens
    }

    function decimals() public pure override returns (uint8) {
        return 10;
    }

    // Mint tokens to an address
    function mintTokens(address to, uint256 amount) public {
        _mint(to, amount);
    }

    // Burn tokens from an address
    function burnTokens(address from, uint256 amount) public {
        _burn(from, amount);
    }

    // Check balance of the caller
    function checkBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Transfer tokens to another address
    function transferTokens(address to, uint256 amount) public {
        transfer(to, amount);
    }

    // Redeem tokens (burn tokens from the caller)
    function redeemTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    // Redeem an item for a specific amount of tokens
    function redeemItem(string memory itemName) public {
        uint256 price = itemPrices[itemName];
        require(price > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= price, "Insufficient balance to redeem this item");

        // Burn the required amount of tokens
        _burn(msg.sender, price);
    }
}
