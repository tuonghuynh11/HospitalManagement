//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Seeds
{
    using System;
    using System.Collections.Generic;
    
    public partial class TOA
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TOA()
        {
            this.TANGs = new HashSet<TANG>();
        }
    
        public int IDTOA { get; set; }
        public Nullable<int> SOTOA { get; set; }
        public string DISPLAYNAME { get; set; }
        public Nullable<int> SLTANG { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TANG> TANGs { get; set; }
    }
}
