Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E2A1C8436
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 10:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgEGIDx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 04:03:53 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:63882 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgEGIDx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 04:03:53 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 May 2020 13:33:50 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 May 2020 13:33:50 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 695F3261C; Thu,  7 May 2020 13:33:49 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V1 5/7] mmc: sdhci-msm: Read and use DLL Config property from device tree file
Date:   Thu,  7 May 2020 13:32:12 +0530
Message-Id: <1588838535-6050-6-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Certain platforms require different settings in the
SDCC_HC_REG_DLL_CONFIG register. This setting can change from platform
to platform. So the driver should check whether a particular platform
require a different setting by reading the DT file and use it.

Also use msm_cm_dll_set_freq only when DLL not supplied.

Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b879806..598880a 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -275,6 +275,7 @@ struct sdhci_msm_host {
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
 	bool uses_tassadar_dll;
+	u32 dll_config;
 	u32 ddr_config;
 };
 
@@ -617,6 +618,9 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 	config &= ~CORE_CLK_PWRSAVE;
 	writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
 
+	config = msm_host->dll_config;
+	writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config);
+
 	if (msm_host->use_14lpp_dll_reset) {
 		config = readl_relaxed(host->ioaddr +
 				msm_offset->core_dll_config);
@@ -642,7 +646,9 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 	config |= CORE_DLL_PDN;
 	writel_relaxed(config, host->ioaddr +
 			msm_offset->core_dll_config);
-	msm_cm_dll_set_freq(host);
+
+	if (!msm_host->dll_config)
+		msm_cm_dll_set_freq(host);
 
 	if (msm_host->use_14lpp_dll_reset &&
 	    !IS_ERR_OR_NULL(msm_host->xo_clk)) {
@@ -682,7 +688,8 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 			msm_offset->core_dll_config);
 
 	if (msm_host->use_14lpp_dll_reset) {
-		msm_cm_dll_set_freq(host);
+		if (!msm_host->dll_config)
+			msm_cm_dll_set_freq(host);
 		config = readl_relaxed(host->ioaddr +
 				msm_offset->core_dll_config_2);
 		config &= ~CORE_DLL_CLOCK_DISABLE;
@@ -1944,6 +1951,8 @@ static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
 	if (of_property_read_u32(node, "qcom,ddr-config",
 				&msm_host->ddr_config))
 		msm_host->ddr_config = DDR_CONFIG_POR_VAL;
+
+	of_property_read_u32(node, "qcom,dll-config", &msm_host->dll_config);
 }
 
 
-- 
2.7.4

