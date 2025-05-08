
# Trabalho 3 DM - Aplicativo Flutter com Splash Screen e Onboarding

Este é um protótipo de aplicativo Flutter que inclui uma **Splash Screen** animada e um fluxo de **Onboarding** com animações personalizadas. O projeto utiliza pacotes como `flutter_native_splash` e `lottie` para criar uma experiência de usuário visualmente atraente.

## Requisitos

Antes de executar o aplicativo, certifique-se de ter os seguintes requisitos instalados:

- **Flutter** (versão 2.0 ou superior)
- **Dart**
- **Android Studio** (para emulação Android)
- **Xcode** (para emulação iOS, caso necessário)

## Instalação

### 1. Clone o repositório:

```
git clone https://github.com/RicardoHSimoni/Trabalho-3-DM.git
cd Trabalho-3-DM
```
2. Instale as dependências:
No diretório do projeto, execute:
```
flutter pub get
```

3. Instale o plugin para Splash Screen:
Este projeto usa o flutter_native_splash para criar a Splash Screen animada. Para garantir que as configurações estão corretas, execute:
```

flutter pub run flutter_native_splash:create
```
Isso irá gerar as configurações da splash na inicialização do app.


4. Como executar o app
Para executar o app em um dispositivo Android ou iOS, use o comando:

```
flutter run

```

--------------------------------------------------------
Fluxo do Aplicativo
O aplicativo segue o fluxo descrito abaixo:

Splash Screen: Ao iniciar o app, a Splash Screen animada será exibida, com uma transição suave para a tela de Onboarding.

Tela de Onboarding: O usuário será guiado por um processo de introdução com animações suaves (usando o pacote lottie), onde ele poderá ver os recursos do aplicativo e prosseguir para a tela principal.

Animações
Este app utiliza animações para melhorar a experiência do usuário:

Splash Screen: Uma animação simples é exibida ao carregar o app.

Onboarding: Cada tela de onboarding tem animações personalizadas feitas com o pacote lottie para ilustrar os recursos do app.


Personalização:

Você pode personalizar a Splash Screen ajustando a animação e a tela inicial no arquivo android/app/src/main/res/drawable/launch_background.xml.

As animações do Onboarding podem ser personalizadas usando arquivos Lottie no diretório assets.

Dependências:

O projeto utiliza as seguintes dependências principais

flutter_native_splash: Para configurar a Splash Screen.

lottie: Para animações no onboarding.

provider: Para gerenciamento de estado (caso necessário).

shared_preferences: Para armazenar preferências do usuário.


🧑‍💻 Autores:

Ricardo Henrique Simo

João Victor Pires Novaes

