@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Records of Printing'
define root view entity ZR_ZT_PRT_RECORD
  as select from zzt_prt_record as Record
  association [0..1] to ZR_ZT_PRT_TEMPLATE as _Template on $projection.TemplateUUID = _Template.UUID
{
  key uuid                      as UUID,
      @Consumption.valueHelpDefinition: [{  entity: {   name: 'ZC_ZT_PRT_TEMPLATE' ,
                                                            element: 'UUID'  }     }]
      template_uuid             as TemplateUUID,
      is_external_provided_data as IsExternalProvidedData,
      @Semantics.largeObject:
      {
        mimeType: 'MimeTypeData',
      fileName: 'DataFileName',
      contentDispositionPreference: #ATTACHMENT }
      external_provided_data    as ExternalProvidedData,
      @Semantics.mimeType: true
      mime_type_data            as MimeTypeData,
      data_file_name            as DataFileName,
      provided_keys             as ProvidedKeys,
      @Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'FileName',
      contentDispositionPreference: #ATTACHMENT }
      pdf                       as Pdf,
      @Semantics.mimeType: true
      mime_type                 as MimeType,
      file_name                 as FileName,
      send_to_print_queue       as SendToPrintQueue,
      print_queue               as PrintQueue,
      number_of_copies          as NumberOfCopies,
      @Semantics.user.createdBy: true
      created_by                as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by           as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at           as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at     as LocalLastChangedAt,
      _Template

}
