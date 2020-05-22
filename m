Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F27C1DE34C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 11:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgEVJh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 05:37:59 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:15370 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729580AbgEVJhz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 05:37:55 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 May 2020 15:07:53 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 May 2020 15:07:53 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id DE1C4179E; Fri, 22 May 2020 15:07:51 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V2 6/8] mmc: sdhci-msm: Read and use DLL Config property from device tree file
Date:   Fri, 22 May 2020 15:02:28 +0530
Message-Id: <1590139950-7288-7-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
 <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 1e406f5..61cf0f1 100644
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

