# Project Settings

1. criar virtualenv
    ```
        python -m venv venv
    ```

2. ativar virtualenv

    - Windows
        ```
            venv\Scripts\activate
        ```
    - Linux/Mac
        ```
            source venv\bin\activate
        ```

3. criar arquivo `.gitignore`

    acesse [generate gitignore](https://www.toptal.com/developers/gitignore), pequise sistemas operacinais, IDEs e linguagens de programação relacionado ao seu projeto e click em Criar, após copie todo conteudo apresentado e cole no arquivo `.gitignore` do seu projeto.

4. [pylint](https://pylint.pycqa.org/en/latest/index.html)

    - instale o pylint
        ```
            pip install pylint
        ```

    - crie arquivo de configuração `.pylint`
        ```
            pylint --generate-rcfile > .pylintrc
        ```

    - configurar pylint no arquivo .pylintrc
        - adicione no inicio do arquivo após [MAIN] `disable=C0114 # missing-module-docstring`
        - modifique o max-line-length baseado na PEP8

5. [flake8](https://flake8.pycqa.org/en/latest/)
    - intale o flake8
        ```
            pip install flake8
        ```

    - crie arquivo de configuração `.flake8`
        - adicione a configuração basica abaixo no arquivo:
            ```
                [flake8]
                ignore = E722, W503
                max-line-length = 100
                per-file-ignore = __init__.py: F401
                exclude =
                    migrations
                    __pycache__
                    manage.py
                    settings.py
                    env
                    .env
            ```

6. [black](https://black.readthedocs.io/en/stable/)
    - instale o black
        ```
            pip install black
        ```

7. [pre-commit](https://pre-commit.com/)
    - instale o pre-commit
        ```
            pip install pre-commit
        ```

    - crie arquivo de configuração `.pre-commit-config.yaml`
        - adicione a configuração basica abaixo no arquivo:
            ```
                repos:
                -   repo: https://github.com/psf/black
                    rev: 22.12.0
                    hooks:
                    - id: black
                    language_version: python3.9
                    stages: [commit]
                -   repo: https://github.com/pycqa/flake8
                    rev: 6.0.0
                    hooks:
                    - id: flake8
                    stages: [commit]
                -   repo: local
                    hooks:
                    - id: pytest
                    name: pytest
                    language: system
                    entry: pytest -v
                    always_run: true
                    pass_filenames: false
                    stages: [commit]
                -   repo: local
                    hooks:
                    - id: requirements
                        name: requirements
                        entry: bash -c 'venv/Scripts/pip3 freeze > requirements.txt; git add requirements.txt'
                        language: system
                        pass_filenames: false
                        stages: [commit]
            ```

    - instale os hooks
        ```
            pre-commit install
        ```
