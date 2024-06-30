// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Mytoken is ERC20{

    constructor() ERC20("TORQUE", "TOU") {}

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
}

