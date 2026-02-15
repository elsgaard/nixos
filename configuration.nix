{ modulesPath, config, lib, pkgs, ... }: {
imports = [
(modulesPath + "/installer/scan/not-detected.nix")
(modulesPath + "/profiles/qemu-guest.nix")
./disk-config.nix
];

boot.loader.grub = {
efiSupport = true;
efiInstallAsRemovable = true;
};

services.openssh.enable = true;

   nix.settings = {
     experimental-features = "nix-command flakes";
   };
   
time.timeZone = "Europe/Copenhagen";
i18n.defaultLocale = "en_US.UTF-8";
console.keyMap = "dk";

environment.systemPackages = [
pkgs.curl
pkgs.gitMinimal
];

users.users.root.openssh.authorizedKeys.keys = [
"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKeqZmlYFxsg1BqomySG+hRdJLcM3Q0YqGf13okIvzO4 eddsa-key-20260207"
];

system.stateVersion = "25.11";
}
