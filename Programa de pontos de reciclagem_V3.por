programa {
  inclua biblioteca Util -->U
  //Constante quantidade maxima de Usuários
  const inteiro MAX_USUARIOS = 5

  //Declaração de variaveis e estrutura de dados
  cadeia usuarios[MAX_USUARIOS][2]
  real saldos[MAX_USUARIOS]  
  inteiro totalUsuarios = 0
  logico logado = falso
  cadeia usuarioAtual = ""

  //Função que cadastra os Usuários do sistema
  funcao cadastrarUsuarios() {
    se (totalUsuarios == MAX_USUARIOS){
      escreva("\nLimite de usuários atingido!")
    } senao {
      escreva("\nDigite seu nome de usuário: ")
      leia(usuarios[totalUsuarios][0])
      escreva("Digite sua senha: ")
      leia(usuarios[totalUsuarios][1])
      saldos[totalUsuarios] = 0  
      totalUsuarios = totalUsuarios + 1
      escreva("\nUsuário cadastrado com sucesso!")
    }
  }

  //Função que faz o Login dos Usuários no Sistema
  funcao logico login() {
    cadeia nome, senha
    para (inteiro tentativas = 1; tentativas <= 3; tentativas++) {
      escreva("Digite seu nome de usuário: ")
      leia(nome)
      escreva("Digite a senha: ")
      leia(senha)

      para (inteiro i = 0; i < totalUsuarios; i++) {
        se (usuarios[i][0] == nome e usuarios[i][1] == senha) {
          usuarioAtual = nome
          logado = verdadeiro
          escreva("\nLogin efetuado com sucesso!\n")
          retorne verdadeiro
          
        }
      }

      se (tentativas < 3) {
        escreva("\nUsuário ou senha incorretos.\n")
        se (tentativas == 2) {
          escreva("\nAtenção!! Resta apenas uma tentativa!!\n")
          
        }
      }
    }
    escreva("\nNúmero máximo de tentativas atingido. Encerrando login.\n")
    retorne falso
  }

  //Função que Pesquisa o Indice de Usuários
  funcao inteiro encontrarIndiceUsuario(cadeia nome) {
    para (inteiro i = 0; i < totalUsuarios; i++) {
      se (usuarios[i][0] == nome) {
        retorne i
      }
    }
    retorne -1
  }

  //Função que Gerencia o Menu Reciclar
  funcao reciclar( ){
    inteiro opcao
    real kG=0, pontos
    limpa()
    
    faca {
      escreva("\nO que você gostaria de reciclar hoje?\n")
      escreva("1 - Plástico \n")
      escreva("2 - Papel\n")
      escreva("3 - Vidro\n")
      escreva("4 - Metal\n")
      escreva("5 - Retornar ao Menu Inicial\n")
      escreva("Escolha uma opção: ")
      leia(opcao)
      inteiro ind = encontrarIndiceUsuario(usuarioAtual)

      se(opcao<1 ou opcao>5){
        escreva("\nOpção inválida. Tente novamente.\n")
      }

      escolha (opcao) {
        caso 1:
          limpa()
          escreva("\nDigite a Quantidade de plástico em (Kg) de deseja reciclar: ")
          leia(kG)
          escreva("Material reciclado com sucesso!")
          pontos = kG*10
          saldos[ind] = saldos[ind]+ pontos
          escreva("Voce recebeu ",pontos," pontos")
          pare

        caso 2:
          limpa()
          escreva("\nDigite a Quantidade papel em (Kg) de deseja reciclar: ")
          leia(kG)
          escreva("Material reciclado com sucesso!")
          pontos = kG*20
          saldos[ind] = saldos[ind]+ pontos
          escreva("Voce recebeu ",pontos," pontos")
          pare

        caso 3:
          limpa()
          escreva("\nDigite a Quantidade de virdo em (Kg) de deseja reciclar: ")
          leia(kG)
          escreva("Material reciclado com sucesso!")
          pontos = kG*30
          saldos[ind] = saldos[ind]+ pontos
          escreva("Voce recebeu ",pontos," pontos")
          pare
        caso 4:
          limpa()
          escreva("\nDigite a Quantidade metal em (Kg) de deseja reciclar: ")
          leia(kG)
          escreva("Material reciclado com sucesso!")
          pontos = kG*40
          saldos[ind] = saldos[ind]+ pontos
          escreva("Voce recebeu ",pontos," pontos")
          pare
      }
      U.aguarde(2000)
      limpa()
    } enquanto (opcao !=5)
    escreva("Retornando ao Menu incial ...")
    U.aguarde(2000)
    limpa()
  }

  //Função que Gerencia a Troca de pontos por produtos
  funcao real trocarPontos( ){
    inteiro indice = encontrarIndiceUsuario(usuarioAtual)
    se (indice == -1) {
      escreva("Erro: usuário não encontrado.\n")
      retorne 0
    }
    real pontos
    inteiro opcao
    limpa()
    
    faca {
      escreva("\nQual Produto Você gostaria que resgatar hoje?\n")
      escreva("1 - Eco-Bag por 500 pontos \n")
      escreva("2 - Talhers de bambu 400 pontos \n")
      escreva("3 - Garrafa Ecológica 300 pontos \n")
      escreva("4 - Canudo Metálico Reutilizável 200 pontos \n")
      escreva("5 - Suculenta no vaso Reciclável 100 pontos \n")
      escreva("6 - Retornar ao Menu incial \n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      se(opcao<1 ou opcao>6){
        escreva("\nOpção inválida. Tente novamente.\n")
      }

      escolha (opcao) {
        caso 1:
          limpa()
          escreva("Eco-Bag por 500 pontos \n")
          escreva("Digite a quantidade de pontos que deseja trocar: ")
          leia(pontos)
          se (pontos == 500 e saldos[indice]>= pontos ){
          saldos[indice] = saldos[indice] - pontos
          escreva("Sucesso! Você resgatou a Eco-Bag!! \n")
          }senao{
            escreva("Troca de pontos inválida. Verifique se já resgatou os pontos anteriores ou se possui os pontos necessários! \n")
            U.aguarde(2000)
          }
          pare

        caso 2:
          limpa()
          escreva("Talhers de bambu 400 pontos \n")
          escreva("Digite a quantidade de pontos que deseja trocar: ")
          leia(pontos)
          se (pontos == 400 e saldos[indice]>= pontos ){
          saldos[indice] = saldos[indice] - pontos
          escreva("Sucesso! Você resgatou Talhers de bambu!! \n")
          }senao{
            escreva("Troca de pontos inválida. Verifique se já resgatou os pontos anteriores ou se possui os pontos necessários! \n")
            U.aguarde(2000)
          }
          pare

        caso 3:
          limpa()
          escreva("Garrafa Ecológica 300 pontos \n")
          escreva("Digite a quantidade de pontos que deseja trocar: ")
          leia(pontos)
          se (pontos == 300 e saldos[indice]>= pontos ){
          saldos[indice] = saldos[indice] - pontos
          escreva("Sucesso! Você resgatou a Garrafa Ecológica!! \n")
          }senao{
            escreva("troca de pontos inválida. Verifique se já resgatou os pontos anteriores ou se possui os pontos necessários! \n")
            U.aguarde(2000)
          }
          pare

        caso 4:
          limpa()
          escreva("Canudo Metálico Reutilizável 200 pontos \n")
          escreva("Digite a quantidade de pontos que deseja trocar: ")
          leia(pontos)
          se (pontos == 200 e saldos[indice]>= pontos ){
          saldos[indice] = saldos[indice] - pontos
          escreva("Sucesso! Você resgatou o Canudo Metálico Reutilizável!! \n")
          }senao{
            escreva("Troca de pontos inválida. Verifique se já resgatou os pontos anteriores ou se possui os pontos necessários! \n")
            U.aguarde(2000)
          }
          pare

        caso 5:
          limpa()
          escreva("Suculenta no vaso Reciclável 100 pontos \n")
          escreva("Digite a quantidade de pontos que deseja trocar: ")
          leia(pontos)
          se (pontos == 100 e saldos[indice]>= pontos ){
          saldos[indice] = saldos[indice] - pontos
          escreva("Sucesso! Você resgatou a Suculenta no vaso Reciclável!! \n")
          }senao{
            escreva("Troca de pontos inválida. Verifique se já resgatou os pontos anteriores ou se possui os pontos necessários! \n")
            U.aguarde(2000)
          }
          pare
      }
      U.aguarde(2000)
      limpa()
    } enquanto (opcao !=6)
    escreva("\nRetornando ao Menu incial ...")
    U.aguarde(2000)
    limpa()
  }

  //Função que Apresenta os pontos acumulados pelo Usuário
  funcao real exibirPontos() {
    inteiro indice = encontrarIndiceUsuario(usuarioAtual)
    se (indice == -1) {
      escreva("Erro: usuário não encontrado.")
      retorne 0
    }

    escreva("Sua quantidade de eco pontos é: ", saldos[indice], " Pontos.")
    retorne saldos[indice]
  }

   //Função que apresenta o Menu Inicial do Sistema de Reciclagem
  funcao menuInicial() {
    inteiro opcao
    limpa()

    faca {
      escreva("\n*********Menu Inicial*********\n")
      escreva("1 - Reciclar\n")
      escreva("2 - Trocar pontos\n")
      escreva("3 - Exibir pontos\n")
      escreva("4 - Sair\n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha (opcao) {
        caso 1:
          reciclar()
          pare
        caso 2:
          trocarPontos()
          pare
        caso 3:
          exibirPontos()
          U.aguarde(3000)
          pare
        caso 4:
          escreva("Saindo do sistema...\n")
          logado = falso
          pare
        caso contrario:
          escreva("Opção inválida. Tente novamente.\n")
      }
      U.aguarde(100)
      limpa()
    } enquanto (logado)
  }  

  funcao inicio() {
    inteiro opcao

    faca {
      escreva("\n=== Bem-vindo ao Eco Logic ===\n")
      escreva("1 - Cadastrar usuário\n")
      escreva("2 - Fazer login\n")
      escreva("3 - Sair\n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha (opcao) {
        caso 1:
          cadastrarUsuarios()
          U.aguarde(3000)
          limpa()
          pare
        caso 2:
          se (login()) {
            menuInicial()
            limpa()
          }
          pare
        caso 3:
          escreva("\nEncerrando o programa.\n")
          U.aguarde(2000)
          limpa()
          pare
        caso contrario:
          escreva("\nOpção inválida.\n")
      }
      limpa()
    } enquanto (opcao != 3)
    escreva("Desenvolvido e Produzido por 'EQUIPE ECO LOGIC'.\n")
    escreva("COPYRIGHT, TODOS OS DIREITO RESERVADOS.")
    U.aguarde(10000)
    
  }
}
