# Show available commands
default:
    @just --list

# Set up development environment
setup:
    uv sync --extra test --extra lint

# Verify code formatting
check-format:
    .venv/bin/ruff format --check .

# Auto-format code
fix-format:
    .venv/bin/ruff format .

# Run tests with coverage; extra args are passed through, e.g. just test -k auth
test *ARGS:
    .venv/bin/pytest --cov=llm_ollama --cov-report=term-missing {{ARGS}}
