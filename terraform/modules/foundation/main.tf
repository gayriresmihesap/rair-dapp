locals {
  avaliablity_zones = {
    a = "${var.region}-a",
    b = "${var.region}-b",
    c = "${var.region}-c"
  }
  users = {
    brian_fogg = {
      email: "brian@rair.tech"
    }
  }
}

resource "google_compute_resource_policy" "daily_backup" {
  name   = "every-day-4am"
  region = "us-central1"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "04:00"
      }
    }
  }
}