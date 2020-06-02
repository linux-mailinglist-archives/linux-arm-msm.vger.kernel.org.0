Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315901EB9DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFBKu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:50:26 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:57579 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726606AbgFBKu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:50:26 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Jun 2020 16:20:20 +0530
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Jun 2020 16:20:13 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 210404BF9; Tue,  2 Jun 2020 16:20:13 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V3 2/3] mmc: sdhci: Allow platform controlled voltage switching
Date:   Tue,  2 Jun 2020 16:17:55 +0530
Message-Id: <1591094883-11674-3-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591094883-11674-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1591094883-11674-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vijay Viswanath <vviswana@codeaurora.org>

If vendor platform drivers are controlling whole logic of voltage
switching, then sdhci driver no need control vqmmc regulator.
So skip enabling/disable vqmmc from SDHC driver.

Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci.c | 32 +++++++++++++++++++-------------
 drivers/mmc/host/sdhci.h |  1 +
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 37b1158c1c0c..e6275c2202b0 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -4105,6 +4105,7 @@ int sdhci_setup_host(struct sdhci_host *host)
 	unsigned int override_timeout_clk;
 	u32 max_clk;
 	int ret;
+	bool enable_vqmmc = false;
 
 	WARN_ON(host == NULL);
 	if (host == NULL)
@@ -4118,9 +4119,12 @@ int sdhci_setup_host(struct sdhci_host *host)
 	 * the host can take the appropriate action if regulators are not
 	 * available.
 	 */
-	ret = mmc_regulator_get_supply(mmc);
-	if (ret)
-		return ret;
+	if (!mmc->supply.vqmmc) {
+		ret = mmc_regulator_get_supply(mmc);
+		if (ret)
+			return ret;
+		enable_vqmmc  = true;
+	}
 
 	DBG("Version:   0x%08x | Present:  0x%08x\n",
 	    sdhci_readw(host, SDHCI_HOST_VERSION),
@@ -4377,7 +4381,15 @@ int sdhci_setup_host(struct sdhci_host *host)
 		mmc->caps |= MMC_CAP_NEEDS_POLL;
 
 	if (!IS_ERR(mmc->supply.vqmmc)) {
-		ret = regulator_enable(mmc->supply.vqmmc);
+		if (enable_vqmmc) {
+			ret = regulator_enable(mmc->supply.vqmmc);
+			if (ret) {
+				pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
+					mmc_hostname(mmc), ret);
+				mmc->supply.vqmmc = ERR_PTR(-EINVAL);
+			}
+			host->sdhci_core_to_disable_vqmmc = !ret;
+		}
 
 		/* If vqmmc provides no 1.8V signalling, then there's no UHS */
 		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 1700000,
@@ -4390,12 +4402,6 @@ int sdhci_setup_host(struct sdhci_host *host)
 		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 2700000,
 						    3600000))
 			host->flags &= ~SDHCI_SIGNALING_330;
-
-		if (ret) {
-			pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
-				mmc_hostname(mmc), ret);
-			mmc->supply.vqmmc = ERR_PTR(-EINVAL);
-		}
 	}
 
 	if (host->quirks2 & SDHCI_QUIRK2_NO_1_8_V) {
@@ -4626,7 +4632,7 @@ int sdhci_setup_host(struct sdhci_host *host)
 	return 0;
 
 unreg:
-	if (!IS_ERR(mmc->supply.vqmmc))
+	if (host->sdhci_core_to_disable_vqmmc)
 		regulator_disable(mmc->supply.vqmmc);
 undma:
 	if (host->align_buffer)
@@ -4644,7 +4650,7 @@ void sdhci_cleanup_host(struct sdhci_host *host)
 {
 	struct mmc_host *mmc = host->mmc;
 
-	if (!IS_ERR(mmc->supply.vqmmc))
+	if (host->sdhci_core_to_disable_vqmmc)
 		regulator_disable(mmc->supply.vqmmc);
 
 	if (host->align_buffer)
@@ -4787,7 +4793,7 @@ void sdhci_remove_host(struct sdhci_host *host, int dead)
 
 	destroy_workqueue(host->complete_wq);
 
-	if (!IS_ERR(mmc->supply.vqmmc))
+	if (host->sdhci_core_to_disable_vqmmc)
 		regulator_disable(mmc->supply.vqmmc);
 
 	if (host->align_buffer)
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 0008bbd27127..0770c036e2ff 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -567,6 +567,7 @@ struct sdhci_host {
 	u32 caps1;		/* CAPABILITY_1 */
 	bool read_caps;		/* Capability flags have been read */
 
+	bool sdhci_core_to_disable_vqmmc;  /* sdhci core can disable vqmmc */
 	unsigned int            ocr_avail_sdio;	/* OCR bit masks */
 	unsigned int            ocr_avail_sd;
 	unsigned int            ocr_avail_mmc;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

