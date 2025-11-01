import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { Contract } from "ethers";

/**
 * Deploys a contract named "YXMToken" using the deployer account
 *
 * @param hre HardhatRuntimeEnvironment object.
 */
const deployMockERC20: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  await deploy("ERC20Test", {
    from: deployer,
    // Contract constructor arguments
    args: [],
    log: true,

    autoMine: true,
  });

  // Get the deployed contract to interact with it after deploying.
  const yxmToken = await hre.ethers.getContract<Contract>("ERC20Test", deployer);
  console.log("✅ YXMToken deployed at:", await yxmToken.getAddress());
};

export default deployMockERC20;

deployMockERC20.tags = ["ERC20LWJ202330550891"];
