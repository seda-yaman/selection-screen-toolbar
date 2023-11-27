*&---------------------------------------------------------------------*
*& Report ZOT_29_P_SS_TOOLBAR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsy_010_p_ss_toolbar.

TABLES sscrfields.

SELECTION-SCREEN FUNCTION KEY 1.
SELECTION-SCREEN FUNCTION KEY 2.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS p_matnr TYPE matnr.
SELECTION-SCREEN END OF BLOCK b1.

INITIALIZATION.
  CONCATENATE '@0Y@'
              'Tıkla!'
              INTO sscrfields-functxt_01 SEPARATED BY space.

  CONCATENATE '@09@'
              'Buton2'
              INTO sscrfields-functxt_02 SEPARATED BY space.


AT SELECTION-SCREEN.
  IF sscrfields-ucomm = 'FC01'.

    CALL FUNCTION 'DSYS_SHOW_FOR_F1HELP' "belge detayını içeren pencere açar
      EXPORTING
        dokclass         = 'RE' "'TX' "dışarı aktarma kısmını yapar tx olursa veri aktarma yapmaz
        dokname          = sy-repid
        short_text       = 'X'
      EXCEPTIONS
        class_unknown    = 1
        object_not_found = 2
        OTHERS           = 3.

  ELSEIF sscrfields-ucomm = 'FC02'.

  ENDIF.

START-OF-SELECTION.
  WRITE : /  p_matnr.
