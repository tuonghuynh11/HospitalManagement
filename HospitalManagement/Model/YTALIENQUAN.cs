//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HospitalManagement.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class YTALIENQUAN
    {
        public int IDCONGVIEC { get; set; }
        public string CMND_CCCD { get; set; }
        public Nullable<bool> TIENDO { get; set; }
    
        public virtual CONGVIEC CONGVIEC { get; set; }
        public virtual YTA YTA { get; set; }
    }
}
