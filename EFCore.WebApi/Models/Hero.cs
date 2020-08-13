using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.WebApi.Models
{
    public class Hero
    {
        public int Id { get; set; }
        public int Name { get; set; }
        public SecretIdentity SecretIdentity { get; set; }
        public List<Weapon> Weapons { get; set; }
        public List<HeroBattle> HeroesBattles { get; set; }
    }
}
