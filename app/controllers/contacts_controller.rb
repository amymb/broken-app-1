class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
      #render :show, status: :created, location: @contact
    #else
      #render :new
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contact_url, notice: 'Contact was successfully destroyed.'
  end

  def new
    @contact = Contact.new
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params[:contact][:email]
      params[:contact][:name]
      params[:contact][:notes]
      params.require(:contact).permit(:name, :email, :notes)
    end
end
