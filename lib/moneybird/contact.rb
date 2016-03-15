module Moneybird
  class Contact
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      company_name
      firstname
      lastname
      attention
      address1
      address2
      zipcode
      city
      country
      email
      phone
      delivery_method
      customer_id
      tax_number
      chamber_of_commerce
      bank_account
      send_invoices_to_attention
      send_invoices_to_email
      send_estimates_to_attention
      send_estimates_to_email
      sepa_active
      sepa_iban
      sepa_iban_account_name
      sepa_bic
      sepa_mandate_id
      sepa_mandate_date
      sepa_sequence_type
      credit_card_number
      credit_card_reference
      credit_card_type
      tax_number_validated_at
      created_at
      updated_at
      notes
      custom_fields
    )

    class Service
      attr_reader :client, :administation_id

      def initialize(client, administation_id)
        @client = client
        @administation_id = administation_id
      end

      def all
        result = client.get("#{administation_id}/contacts")

        JSON.parse(result.body).map do |invoice|
          Contact.new(self, invoice)
        end
      end
    end
  end
end

