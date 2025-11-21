📌 Foundry DeFi Stablecoin (DSC)

A fully on-chain, over-collateralized, crypto-backed stablecoin system built using Foundry, designed to mimic the architecture and safety principles behind protocols like DAI (MakerDAO) — but implemented in a cleaner, modular, modern way.

🚀 Overview

This project implements a decentralized stablecoin system where users can:

Deposit collateral (WETH / WBTC…)

Mint a stablecoin pegged to USD

Maintain a health factor based on collateral value

Face liquidation if collateral becomes insufficient

Built with security-first principles, the system includes:

Price-feed staleness protection (via OracleLib)

Over-collateralization enforcement

Liquidation bonus mechanics

Deterministic and invariant testing

Fuzzing to detect edge-case failures

This project demonstrates strong understanding of DeFi protocol architecture, Solidity security, and Foundry’s advanced testing toolkit.

🧱 Key Features
🛡 1. Over-Collateralized Stablecoin

Users must always maintain sufficient collateral or face liquidation.

🧮 2. Robust Oracle System

Chainlink oracle data is validated through a custom library:

Rejects stale prices

Rejects incomplete rounds

Ensures protocol freezes during oracle failure

⚡ 3. DSC Engine

Core contract responsible for:

Minting & burning stablecoins

Tracking collateral

Liquidation logic

Health factor calculations

🔍 4. Advanced Testing

This project heavily uses Foundry’s testing features:

Unit Tests

Fuzz Tests

Invariant Tests (Stateful Testing)

Mocks for ORacles & tokens

This mirrors real-world audit-level testing.
```
📂 Project Structure
Foundry-defi-Stablecoin/
│── lib/                   # Chainlink, OpenZeppelin, Foundry Std
│── script/                # Deploy + Helper scripts
│── src/
│   ├── libraries/
│   │    └── OracleLib.sol
│   ├── DecentralizedStableCoin.sol
│   └── DSCEngine.sol
│── test/
│   ├── Unit/
│   ├── Fuzz/
│   ├── mocks/
│── foundry.toml
│── .gitmodules
│── README.md
```
🏛 Architecture
Core Contracts
🪙 DecentralizedStableCoin.sol

ERC20-based stablecoin contract. Minting/burning controlled by DSCEngine.

⚙️ DSCEngine.sol

Responsible for:

Vault creation

Collateralization logic

Minting stablecoin

Liquidations

Oracle integration

Health factor enforcement

📡 OracleLib.sol

Adds a safety layer on top of Chainlink to ensure:

No stale prices

No invalid answered rounds

Protocol freezes during oracle failure

🔥 Security Mechanisms

This project implements several protections common in production-grade DeFi:

Oracle Staleness Protection

Collateralization Ratio Enforcement

Liquidation Bonus

Invariant Testing (protocol must never be undercollateralized)

Fuzzing for unexpected states

Separation of concerns in contract design

🧪 Testing
✔ Unit Tests

For engine logic, price conversions, mint/burn rules, and invariants.

✔ Fuzz Tests

Randomized input testing to catch edge cases.

✔ Stateful Invariant Tests

Ensures global properties always hold:

Protocol never becomes insolvent

Users with bad HF are always liquidatable

Users cannot mint beyond allowed collateral

✔ Mocks

Mock ERC20

Mock Aggregator (Chainlink)

Run all tests:
```
forge test -vvv
```
📦 Installation

Clone the repo:
```
git clone https://github.com/Harshydv123/Foundry-defi-Stablecoin
cd Foundry-defi-Stablecoin
```

Install dependencies:
```
forge install
```
🔧 Running the Project

Compile:
```
forge build
```

Test:
```
forge test -vvv
```


🚀 Deploying

Deploy to a local Anvil chain:
```
forge script script/DeployDSC.s.sol --broadcast --rpc-url http://localhost:8545
```

Deploy to testnet:
```
forge script script/DeployDSC.s.sol --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```
🛠 Tech Stack

Solidity 0.8.19

Foundry (Forge, Anvil, Cast)

Chainlink Price Feeds

OpenZeppelin Contracts

Advanced DeFi engineering patterns

🌟 Why This Project Matters

This project shows:

Deep understanding of DeFi protocol engineering

Ability to build stablecoin systems from scratch

Mastery of Solidity, Foundry, and smart contract testing

Knowledge of oracle failure modes

Practical experience with liquidation logic & risk management

Experience writing secure, production-grade code

📌 Future Improvements

Multi-collateral support

Stability fee / interest rate

Governance module

Peg arbitrage module

TWAP oracle fallback

Gas optimization pass

Frontend dashboard

👤 Author

Harsh Yadav
Smart Contract Developer
