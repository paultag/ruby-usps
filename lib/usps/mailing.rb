# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require "usps_intelligent_barcode"

module USPS
  class Mailing
    attr_accessor :barcode_id, :service_type, :mailer_id, :serial_number, :address

    def initialize(mailer_id:, serial_number:, address:)
      @barcode_id = "01"
      @service_type = "234"
      @mailer_id = mailer_id
      @serial_number = serial_number
      @address = address
    end

    def barcode
      Imb::Barcode.new(
        @barcode_id,
        @service_type,
        @mailer_id,
        @serial_number,
        @address.routing_code
      ).barcode_letters
    end
  end
end