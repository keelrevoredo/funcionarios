class FuncionariosController < ApplicationController
    def create
      # Cria um novo contato com os dados retornados por contato_params.
      @Funcionario = Funcionario.new(funcionarios_params)
      
      # Salva o contato no banco de dados. A função save retorna um booleano indicando se
      # o salvamento foi feito com sucesso ou não.
      if @Funcionario.save
        # Caso o salvamento tenha sido feito com sucesso, responde com o JSON do contato e status 201 (Created)
        render json: @Funcionario, status: :created
      else
        # Caso o salvamento falhe, responde com um JSON com erros e o status 422 (Unprocessable entity)
        render json: @Funcionario.errors, status: :unprocessable_entity
      end
    end
    
    private
  
      def funcionarios_params
        params.require(:Funcionario).permit(:nome, :cpf, :email)
      end
  end

  def show
    # Busca no banco de dados um funcionario com um ID específico
    @funcionario = Funcionario.find(params[:id])
    # Responde com o JSON do funcionario
    render json: @funcionario
  end
  def index
    # Busca no banco de dados todos os contatos existentes
    @funcionario = Funcionario.all
    # Responde com o JSON de todos os contatos
    render json: @funcionario
  end
  def update
    # Busca no banco de dados um contato com um ID específico
    @funcionario = Funcionario.find(params[:id])
    
    # Atualiza o contato no banco de dados. A função update retorna um booleano
    # indicando se a atualização foi realizada com sucesso.
    if @funcionario.update(funcionarios_params)
      # Caso o contato tenha sido atualizado, responde a requisição com seu JSON e status 200 (Ok)
      render json: @funcionario
    else
      # Caso contrário, responde a requisição com erros em JSON e status 422 (Unprocessable entity)
      render json: @funcionario.errors, status: :unprocessable_entity
    end
  end
  def destroy
    # Busca no banco de dados um contato com um ID específico
    @funcionario = Funcionario.find(params[:id])
    # Apaga o contato do banco de dados
    @funcionario.destroy!
  end