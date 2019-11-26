Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130FC109C29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2019 11:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfKZKTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Nov 2019 05:19:17 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:47150
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727388AbfKZKTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Nov 2019 05:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574763556;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=r2jfJ3xIyQaWw6GeuGN6e4VsK0IHe0LCmCTCkRi8THg=;
        b=UqzLIrwBAkhE7kr3tCMJ12Xc694KCoGD9ZgnFXvK11csc4aRAVZwt70gx7PzjGn4
        nkQhMYsTpiDRbxZYyaPwrcPKsf37AkUq73MneNe0WahiSqteCAAUfjXlfhHllEmkhNU
        +YwaKbiP+4aVf/HwmxeCK9czsb/8VkDwHjlScY+0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574763556;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=r2jfJ3xIyQaWw6GeuGN6e4VsK0IHe0LCmCTCkRi8THg=;
        b=EQwm0w1yyp6dLtSgdr1+r393x61kzXR+F4YeOBlxrjJ1Da9qvg/FgUhW0dBpBVqQ
        n0691WbgBnl4H3gmxKisWxTP6GahZ4BWG4xCLl/opFaM8bRx5VtnzdmgxNtHRNu7eal
        cGsoHeH0H2o7zaEHDzYq6aJl696P1rjHC6XlxmQU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2813C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH] mmc: sdhci-msm: Correct the offset and value for DDR_CONFIG register
Date:   Tue, 26 Nov 2019 10:19:16 +0000
Message-ID: <0101016ea738ec72-fa0f852d-20f8-474a-80b2-4b0ef63b132c-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.11.26-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DDR_CONFIG register offset got updated after a specific
minor version of sdcc V4. This offset change has not been properly
taken care of while updating register changes for sdcc V5.

Correcting proper offset for this register.
Also updating this register value to reflect the recommended RCLK
delay.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b75c82d..3d0bb5e 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -99,7 +99,7 @@
 
 #define CORE_PWRSAVE_DLL	BIT(3)
 
-#define DDR_CONFIG_POR_VAL	0x80040853
+#define DDR_CONFIG_POR_VAL	0x80040873
 
 
 #define INVALID_TUNING_PHASE	-1
@@ -148,8 +148,9 @@ struct sdhci_msm_offset {
 	u32 core_ddr_200_cfg;
 	u32 core_vendor_spec3;
 	u32 core_dll_config_2;
+	u32 core_dll_config_3;
+	u32 core_ddr_config_old; /* Applicable to sdcc minor ver < 0x49 */
 	u32 core_ddr_config;
-	u32 core_ddr_config_2;
 };
 
 static const struct sdhci_msm_offset sdhci_msm_v5_offset = {
@@ -177,8 +178,8 @@ struct sdhci_msm_offset {
 	.core_ddr_200_cfg = 0x224,
 	.core_vendor_spec3 = 0x250,
 	.core_dll_config_2 = 0x254,
-	.core_ddr_config = 0x258,
-	.core_ddr_config_2 = 0x25c,
+	.core_dll_config_3 = 0x258,
+	.core_ddr_config = 0x25c,
 };
 
 static const struct sdhci_msm_offset sdhci_msm_mci_offset = {
@@ -207,8 +208,8 @@ struct sdhci_msm_offset {
 	.core_ddr_200_cfg = 0x184,
 	.core_vendor_spec3 = 0x1b0,
 	.core_dll_config_2 = 0x1b4,
-	.core_ddr_config = 0x1b8,
-	.core_ddr_config_2 = 0x1bc,
+	.core_ddr_config_old = 0x1b8,
+	.core_ddr_config = 0x1bc,
 };
 
 struct sdhci_msm_variant_ops {
@@ -253,6 +254,7 @@ struct sdhci_msm_host {
 	const struct sdhci_msm_offset *offset;
 	bool use_cdr;
 	u32 transfer_mode;
+	bool updated_ddr_cfg;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -924,8 +926,10 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
 static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
 {
 	struct mmc_host *mmc = host->mmc;
-	u32 dll_status, config;
+	u32 dll_status, config, ddr_cfg_offset;
 	int ret;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	const struct sdhci_msm_offset *msm_offset =
 					sdhci_priv_msm_offset(host);
 
@@ -938,8 +942,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
 	 * bootloaders. In the future, if this changes, then the desired
 	 * values will need to be programmed appropriately.
 	 */
-	writel_relaxed(DDR_CONFIG_POR_VAL, host->ioaddr +
-			msm_offset->core_ddr_config);
+	if (msm_host->updated_ddr_cfg)
+		ddr_cfg_offset = msm_offset->core_ddr_config;
+	else
+		ddr_cfg_offset = msm_offset->core_ddr_config_old;
+	writel_relaxed(DDR_CONFIG_POR_VAL, host->ioaddr + ddr_cfg_offset);
 
 	if (mmc->ios.enhanced_strobe) {
 		config = readl_relaxed(host->ioaddr +
@@ -1899,6 +1906,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 				msm_offset->core_vendor_spec_capabilities0);
 	}
 
+	if (core_major == 1 && core_minor >= 0x49)
+		msm_host->updated_ddr_cfg = true;
+
 	/*
 	 * Power on reset state may trigger power irq if previous status of
 	 * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

