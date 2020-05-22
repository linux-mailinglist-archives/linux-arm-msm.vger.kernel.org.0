Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D59B1DE344
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 11:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbgEVJhr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 05:37:47 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:46402 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728068AbgEVJhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 05:37:46 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 May 2020 15:07:42 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 May 2020 15:07:39 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 41351179E; Fri, 22 May 2020 15:07:38 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V2 3/8] mmc: host: sdhci-msm: Configure dll-user-control in dll init sequence
Date:   Fri, 22 May 2020 15:02:25 +0530
Message-Id: <1590139950-7288-4-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
 <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

With SDCC v5.1.0, additional setting needed for enabling DLL output.
The dll-user-control register need to be configured during dll
initialization for getting proper dll output.

Without this configuration, we don't get the DLL lock status properly.
Also update the DLL register settings according to the SDCC Hardware
Programming Guide.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 97758fa..6588077 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -57,6 +57,11 @@
 #define CORE_FLL_CYCLE_CNT	BIT(18)
 #define CORE_DLL_CLOCK_DISABLE	BIT(21)
 
+#define DLL_USR_CTL_POR_VAL	0x10800
+#define ENABLE_DLL_LOCK_STATUS	BIT(26)
+#define FINE_TUNE_MODE_EN	BIT(27)
+#define BIAS_OK_SIGNAL		BIT(29)
+
 #define CORE_VENDOR_SPEC_POR_VAL 0xa9c
 #define CORE_CLK_PWRSAVE	BIT(1)
 #define CORE_HC_MCLK_SEL_DFLT	(2 << 8)
@@ -157,6 +162,7 @@ struct sdhci_msm_offset {
 	u32 core_dll_config_3;
 	u32 core_ddr_config_old; /* Applicable to sdcc minor ver < 0x49 */
 	u32 core_ddr_config;
+	u32 core_dll_usr_ctl; /* Present on SDCC5.1 onwards */
 };
 
 static const struct sdhci_msm_offset sdhci_msm_v5_offset = {
@@ -186,6 +192,7 @@ static const struct sdhci_msm_offset sdhci_msm_v5_offset = {
 	.core_dll_config_2 = 0x254,
 	.core_dll_config_3 = 0x258,
 	.core_ddr_config = 0x25c,
+	.core_dll_usr_ctl = 0x388,
 };
 
 static const struct sdhci_msm_offset sdhci_msm_mci_offset = {
@@ -231,6 +238,7 @@ struct sdhci_msm_variant_ops {
 struct sdhci_msm_variant_info {
 	bool mci_removed;
 	bool restore_dll_config;
+	bool uses_tassadar_dll;
 	const struct sdhci_msm_variant_ops *var_ops;
 	const struct sdhci_msm_offset *offset;
 };
@@ -263,6 +271,7 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	bool uses_tassadar_dll;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -677,6 +686,17 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 				msm_offset->core_dll_config_2);
 	}
 
+	/*
+	 * Configure DLL user control register to enable DLL status.
+	 * This setting is applicable to SDCC v5.1 onwards only.
+	 */
+	if (msm_host->uses_tassadar_dll) {
+		config = DLL_USR_CTL_POR_VAL | FINE_TUNE_MODE_EN |
+			ENABLE_DLL_LOCK_STATUS | BIAS_OK_SIGNAL;
+		writel_relaxed(config, host->ioaddr +
+				msm_offset->core_dll_usr_ctl);
+	}
+
 	config = readl_relaxed(host->ioaddr +
 			msm_offset->core_dll_config);
 	config |= CORE_DLL_EN;
@@ -1861,10 +1881,18 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
 	.offset = &sdhci_msm_v5_offset,
 };
 
+static const struct sdhci_msm_variant_info sm8250_sdhci_var = {
+	.mci_removed = true,
+	.uses_tassadar_dll = true,
+	.var_ops = &v5_var_ops,
+	.offset = &sdhci_msm_v5_offset,
+};
+
 static const struct of_device_id sdhci_msm_dt_match[] = {
 	{.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
 	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
 	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
+	{.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
 	{},
 };
 
@@ -1930,6 +1958,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->restore_dll_config = var_info->restore_dll_config;
 	msm_host->var_ops = var_info->var_ops;
 	msm_host->offset = var_info->offset;
+	msm_host->uses_tassadar_dll = var_info->uses_tassadar_dll;
 
 	msm_offset = msm_host->offset;
 
-- 
2.7.4

