<?php
class Spendings {
  private $pdo;
  private $spendings;
  
  public function __construct($pdo) {
    $this->pdo = $pdo;
  }
  
  private function fetchSpendings() {
    $sql = "SELECT * FROM spendings";
    $statement = $this->pdo->prepare($sql);
    $statement->execute();
    $this->spendings = $statement->fetchAll(PDO::FETCH_ASSOC);
  }
  
  public function getTotalSpendingsByMonth() {
    $this->fetchSpendings();
    $totalSpendingsAmounts = array();
    for ($i = 1; $i <= 12; $i++) {
      $totalSpendingsAmounts[$i] = 0;
    }
    foreach($this->spendings as $spending) {
      $date = explode('-', $spending["accrual_date"]);
      $month = abs($date[1]);
      $totalSpendingsAmounts[$month] += $spending["amount"];
    }
    return $totalSpendingsAmounts;
  }
  
  public function getSpendingDifferenceByMonth() {
    $totalSpendingsAmounts = $this->getTotalSpendingsByMonth();
    $spendingDifferences = array();
    for ($i = 1; $i < 12; $i++) {
      $spendingDifferences[$i] = abs($totalSpendingsAmounts[$i + 1] -  $totalSpendingsAmounts[$i]);
    }
    return $spendingDifferences;
  }
}


$dbUserName = "root";
$dbPassword = "password";
$pdo = new PDO("mysql:host=mysql; dbname=tq_quest; charset=utf8", $dbUserName, $dbPassword);
$spendings = new Spendings($pdo);
$spendingTotals = $spendings->getTotalSpendingsByMonth();
$spendingDifferences = $spendings->getSpendingDifferenceByMonth();


foreach($spendingDifferences as $month => $difference) {
  echo $month . "月と" . ($month + 1) . "月の差分: " . $difference . "円<br />";
}

