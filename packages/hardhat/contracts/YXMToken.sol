// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

// 引入 OpenZeppelin 的 ERC20 与 ERC20Permit 实现
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/// @title YXMToken - 基于 ERC20 标准的测试代币
/// @author
/// @notice 实现 ERC20 标准接口，并扩展 mint / burn 功能
contract ERC20Test is ERC20, ERC20Permit {
    /// @notice 构造函数，初始化代币名称与符号
    constructor() ERC20("YXMToken", "YXM") ERC20Permit("YXMToken") {}

    /// @notice 发行代币（铸币）
    /// @param value 要发行的代币数量（单位：最小精度单位）
    function mint(uint256 value) public {
        _mint(msg.sender, value);
    }

    /// @notice 销毁代币（燃烧）
    /// @param value 要销毁的代币数量（单位：最小精度单位）
    function burn(uint256 value) public {
        _burn(msg.sender, value);
    }
}
