# This is the provider used to spin up the gcloud instance
provider "google" {
 
  project = "rakeshlab"
  region  = "us-east1"
  credentials = file("terraform.json")
}

resource "google_compute_instance" "vm-instance" {
  name         = "cde-vm"
  machine_type = "f1-micro"
  zone         = "us-east1-b"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
    
  network_interface {
    network = "terraform-networks"

    access_config {
      // Ephemeral IP
    }
  }
}


