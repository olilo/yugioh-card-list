#!/bin/bash

echo "Starte die Anwendung parallel (Server mit SUDO)..."

echo "Installiere Abhängigkeiten..."
npm install

echo "Starte den Frontend-Entwicklungsserver im Hintergrund..."
cd frontend
npm run dev &
FRONTEND_PID=$!
echo "Frontend-Entwicklungsserver gestartet mit PID: $FRONTEND_PID"
cd ../

echo "Starte den Backend-Server mit SUDO im Hintergrund..."
cd server
sudo node server.cjs &
BACKEND_PID=$!
echo "Backend-Server gestartet mit SUDO und PID: $BACKEND_PID"
cd ../

echo "Frontend und Backend gestartet. Der Backend-Server läuft mit Root-Rechten (SUDO)."
echo "Du kannst die Prozesse mit den PIDs oben überwachen oder beenden."

# Optional: Füge hier weitere Befehle hinzu, die nach dem Starten beider Server ausgeführt werden sollen.

# Optional: Um das Hauptterminalfenster offen zu halten:
# tail -f /dev/null