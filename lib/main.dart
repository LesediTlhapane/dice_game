import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceChallengeApp());
}

class DiceChallengeApp extends StatelessWidget {
  const DiceChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'South African Dice Game',
      theme: ThemeData(useMaterial3: true),
      home: const MainMenuPage(),
    );
  }
}

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A5AE0), Color(0xFF8B65FF), Color(0xFFB75CFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "South African Dice",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Traditional Street Dice Game",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 60),
              
              // Game Mode Buttons
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiceChallengePage(
                              gameMode: GameMode.singlePlayer,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        minimumSize: const Size(250, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        "Single Player",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiceChallengePage(
                              gameMode: GameMode.multiplayer,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(250, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        "Multiplayer",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HowToPlayPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(250, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: const Text(
                        "How to Play",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Traditional South African Street Dice",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A5AE0), Color(0xFF8B65FF), Color(0xFFB75CFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "How to Play",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRuleItem("🎯 Objective", "Correctly predict whether the sum of two dice will be HIGH (8-12), LOW (2-6), or SEVENS (7)."),
                        const SizedBox(height: 20),
                        _buildRuleItem("💰 Betting", "Choose your bet type and amount. Place your bet before rolling."),
                        const SizedBox(height: 20),
                        _buildRuleItem("🎲 Payouts", "HIGH/LOW: 1-to-1 (double your money)\nSEVENS: 4-to-1 (4 times your money)"),
                        const SizedBox(height: 20),
                        _buildRuleItem("⭐ Special Rule", "Rolling a 7 changes the turn to the next player in multiplayer mode."),
                        const SizedBox(height: 20),
                        _buildRuleItem("🏦 Bank", "The bank pays winning bets. If the bank runs out of money, players win!"),
                        const SizedBox(height: 20),
                        _buildRuleItem("👥 Multiplayer", "Take turns being the caster. The dice pass to the next player when a 7 is rolled."),
                      ],
                    ),
                  ),
                ),
                
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text("Got It!"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildRuleItem(String title, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

enum GameMode { singlePlayer, multiplayer }

class Player {
  String name;
  int balance;
  bool isCurrent;

  Player({
    required this.name,
    required this.balance,
    required this.isCurrent,
  });
}

class DiceChallengePage extends StatefulWidget {
  final GameMode gameMode;
  
  const DiceChallengePage({super.key, required this.gameMode});

  @override
  State<DiceChallengePage> createState() => _DiceChallengePageState();
}

class _DiceChallengePageState extends State<DiceChallengePage> {
  final Random _rng = Random();

  int _die1 = 1;
  int _die2 = 1;
  int _currentBet = 0;
  String _selectedBet = '';
  bool _isRolling = false;
  String _message = "Place your bet!";
  int _bankBalance = 10000;
  int _currentPlayerIndex = 0;
  List<Player> _players = [];
  List<int> _chipValues = [10, 25, 50, 100, 250, 500, 1000];
  int _customBetAmount = 0;
  bool _showCustomBetDialog = false;

  @override
  void initState() {
    super.initState();
    _initializePlayers();
  }

  void _initializePlayers() {
    _players = [
      Player(name: "Player 1", balance: 5000, isCurrent: true),
    ];
    
    if (widget.gameMode == GameMode.multiplayer) {
      _players.addAll([
        Player(name: "Player 2", balance: 5000, isCurrent: false),
        Player(name: "Player 3", balance: 5000, isCurrent: false),
      ]);
    }
  }

  void _placeBet(String betType, int amount) {
    if (_currentBet > 0) {
      setState(() {
        _message = "You already placed a bet!";
      });
      return;
    }

    final currentPlayer = _players[_currentPlayerIndex];
    
    if (currentPlayer.balance < amount) {
      setState(() {
        _message = "Insufficient funds!";
      });
      return;
    }

    setState(() {
      _currentBet = amount;
      _selectedBet = betType;
      currentPlayer.balance -= amount;
      _message = "${currentPlayer.name} bet R$amount on ${betType.toUpperCase()}";
    });
  }

  void _rollDice() async {
    final currentPlayer = _players[_currentPlayerIndex];
    
    if (_isRolling || _currentBet == 0) return;
    
    setState(() => _isRolling = true);

    // Animated rolling
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {
          _die1 = _rng.nextInt(6) + 1;
          _die2 = _rng.nextInt(6) + 1;
        });
      }
    }

    final d1 = _rng.nextInt(6) + 1;
    final d2 = _rng.nextInt(6) + 1;
    final sum = d1 + d2;

    setState(() {
      _die1 = d1;
      _die2 = d2;

      // SOUTH AFRICAN DICE GAME LOGIC:
      String result = '';
      int winnings = 0;

      if (sum >= 8 && sum <= 12) {
        result = 'high';
      } else if (sum >= 2 && sum <= 6) {
        result = 'low';
      } else if (sum == 7) {
        result = 'sevens';
      }

      // Check if player won
      if (_selectedBet == result) {
        if (result == 'sevens') {
          // 4-to-1 payout for sevens
          winnings = _currentBet * 4;
          _message = "SEVENS! ${currentPlayer.name} wins R$winnings! 🎉";
        } else {
          // 1-to-1 payout for high/low
          winnings = _currentBet * 2;
          _message = "${result.toUpperCase()}! ${currentPlayer.name} wins R${_currentBet}!";
        }
        currentPlayer.balance += winnings;
        _bankBalance -= (winnings - _currentBet);
      } else {
        _message = "${result.toUpperCase()}! ${currentPlayer.name} loses R$_currentBet";
        _bankBalance += _currentBet;
      }

      // Special rule: Rolling 7 changes player turn (in multiplayer)
      if (sum == 7 && widget.gameMode == GameMode.multiplayer) {
        _nextPlayer();
        _message += "\nSeven rolled! Turn passes to ${_players[_currentPlayerIndex].name}";
      }

      // Reset for next round
      _currentBet = 0;
      _selectedBet = '';
      _isRolling = false;

      // Check if bank is bust
      if (_bankBalance <= 0) {
        _message = "Bank is bust! ${currentPlayer.name} wins the game!";
      }

      // Check if player is bust
      if (currentPlayer.balance <= 0) {
        _message = "${currentPlayer.name} is bust! Game over!";
        if (widget.gameMode == GameMode.multiplayer) {
          _nextPlayer();
        }
      }
    });
  }

  void _nextPlayer() {
    setState(() {
      _players[_currentPlayerIndex].isCurrent = false;
      _currentPlayerIndex = (_currentPlayerIndex + 1) % _players.length;
      _players[_currentPlayerIndex].isCurrent = true;
      _currentBet = 0;
      _selectedBet = '';
      _message = "${_players[_currentPlayerIndex].name}'s turn. Place your bet!";
    });
  }

  void _reset() {
    setState(() {
      _die1 = 1;
      _die2 = 1;
      _currentBet = 0;
      _selectedBet = '';
      _bankBalance = 10000;
      _currentPlayerIndex = 0;
      _message = "Game reset. Place your bet!";
      _initializePlayers();
    });
  }

  void _showCustomBet() {
    setState(() {
      _showCustomBetDialog = true;
      _customBetAmount = 0;
    });
  }

  void _placeCustomBet() {
    if (_customBetAmount > 0) {
      _placeBet(_selectedBet, _customBetAmount);
    }
    setState(() {
      _showCustomBetDialog = false;
    });
  }

  Widget _buildChip(int value, Color color) {
    return GestureDetector(
      onTap: () => _placeBet(_selectedBet, value),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "R$value",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildBetButton(String type, String label, Color color) {
    bool isSelected = _selectedBet == type;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedBet = type;
          _message = "Selected: $label. Choose your bet amount.";
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? color.withOpacity(0.8) : color,
        foregroundColor: Colors.white,
        minimumSize: const Size(110, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? Colors.yellow : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildPlayerInfo(Player player, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: player.isCurrent ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: player.isCurrent ? Colors.yellow : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            player.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: player.isCurrent ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          Text(
            "R${player.balance}",
            style: TextStyle(
              color: player.isCurrent ? Colors.yellow : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDice(int number) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: DiceFace(value: number),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayer = _players[_currentPlayerIndex];
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A5AE0), Color(0xFF8B65FF), Color(0xFFB75CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // App Bar with Back Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.gameMode == GameMode.multiplayer ? "Multiplayer Dice" : "Single Player Dice",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HowToPlayPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.help_outline, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  
                  // Player Info Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _players.map((player) => _buildPlayerInfo(player, _players.indexOf(player))).toList(),
                    ),
                  ),
                  
                  const SizedBox(height: 10),

                  // Bank Balance
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                    ),
                    child: Text(
                      "Bank: R$_bankBalance",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  
                  // Current Player and Message
                  Text(
                    "Current: ${currentPlayer.name}",
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      _message,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Current bet display
                  if (_currentBet > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Current Bet: R$_currentBet on ${_selectedBet.toUpperCase()}",
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),

                  // Dice row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDice(_die1),
                      const SizedBox(width: 20),
                      _buildDice(_die2),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Bet type selection
                  const Text(
                    "Choose your bet:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildBetButton('high', 'HIGH', Colors.green),
                      const SizedBox(width: 10),
                      _buildBetButton('low', 'LOW', Colors.blue),
                      const SizedBox(width: 10),
                      _buildBetButton('sevens', 'SEVENS', Colors.red),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Bet amount chips
                  const Text(
                    "Bet Amount:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  
                  // First row of chips
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildChip(10, Colors.orange),
                      const SizedBox(width: 10),
                      _buildChip(25, Colors.purple),
                      const SizedBox(width: 10),
                      _buildChip(50, Colors.teal),
                      const SizedBox(width: 10),
                      _buildChip(100, Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  // Second row of chips
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildChip(250, Colors.green),
                      const SizedBox(width: 10),
                      _buildChip(500, Colors.blue),
                      const SizedBox(width: 10),
                      _buildChip(1000, Colors.pink),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: _showCustomBet,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Center(
                            child: Icon(Icons.add, color: Colors.white, size: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Buttons
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: (_isRolling || _selectedBet.isEmpty || _currentBet == 0) 
                              ? null 
                              : _rollDice,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            minimumSize: const Size(200, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(_isRolling ? "Rolling..." : "Roll Dice"),
                        ),
                        const SizedBox(height: 10),
                        if (widget.gameMode == GameMode.multiplayer)
                          ElevatedButton(
                            onPressed: _nextPlayer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(200, 50),
                            ),
                            child: const Text("Pass Turn"),
                          ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: _reset,
                          child: const Text(
                            "Reset Game",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Custom Bet Dialog
          if (_showCustomBetDialog)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: Dialog(
                    backgroundColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6A5AE0),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Custom Bet Amount",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter amount",
                                prefixText: "R",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _customBetAmount = int.tryParse(value) ?? 0;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _showCustomBetDialog = false;
                                  });
                                },
                                child: const Text("Cancel", style: TextStyle(color: Colors.white)),
                              ),
                              ElevatedButton(
                                onPressed: _placeCustomBet,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.deepPurple,
                                ),
                                child: const Text("Place Bet"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------- REAL DICE FACE USING DOT POSITIONS ----------
class DiceFace extends StatelessWidget {
  final int value;
  const DiceFace({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        final dotPositions = {
          1: [4],
          2: [0, 8],
          3: [0, 4, 8],
          4: [0, 2, 6, 8],
          5: [0, 2, 4, 6, 8],
          6: [0, 2, 3, 5, 6, 8],
        };

        bool isDot = dotPositions[value]!.contains(index);

        return Center(
          child: isDot
              ? Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}