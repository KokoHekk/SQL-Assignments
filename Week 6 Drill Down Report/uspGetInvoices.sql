CREATE OR ALTER PROCEDURE dbo.uspGetInvoices
    @VendorID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        i.InvoiceID,
        i.VendorID,
        i.InvoiceNumber,
        i.InvoiceDate,
        i.InvoiceTotal,
        i.PaymentTotal,
        i.CreditTotal,
        i.InvoiceDueDate,
        i.PaymentDate,
        i.TermsID
    FROM Invoices AS i
    WHERE @VendorID IS NULL
       OR i.VendorID = @VendorID
    ORDER BY i.VendorID, i.InvoiceDate, i.InvoiceID;
END;
GO