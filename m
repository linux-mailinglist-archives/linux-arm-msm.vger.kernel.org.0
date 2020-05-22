Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B5C1DE347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 11:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbgEVJhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 05:37:51 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:46402 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729580AbgEVJht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 05:37:49 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 May 2020 15:07:43 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 May 2020 15:07:43 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 496CC179E; Fri, 22 May 2020 15:07:42 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V2 4/8] mmc: sdhci-msm: Update dll_config_3 as per HSR
Date:   Fri, 22 May 2020 15:02:26 +0530
Message-Id: <1590139950-7288-5-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
 <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update dll_config_3 as per the host clock frequency as specified in the
DLL Hardware Reference Guide.

Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-msm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 6588077..054b151 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -62,6 +62,9 @@
 #define FINE_TUNE_MODE_EN	BIT(27)
 #define BIAS_OK_SIGNAL		BIT(29)
 
+#define DLL_CONFIG_3_LOW_FREQ_VAL	0x08
+#define DLL_CONFIG_3_HIGH_FREQ_VAL	0x10
+
 #define CORE_VENDOR_SPEC_POR_VAL 0xa9c
 #define CORE_CLK_PWRSAVE	BIT(1)
 #define CORE_HC_MCLK_SEL_DFLT	(2 << 8)
@@ -695,6 +698,16 @@ static int msm_init_cm_dll(struct sdhci_host *host)
 			ENABLE_DLL_LOCK_STATUS | BIAS_OK_SIGNAL;
 		writel_relaxed(config, host->ioaddr +
 				msm_offset->core_dll_usr_ctl);
+
+		config = readl_relaxed(host->ioaddr +
+				msm_offset->core_dll_config_3);
+		config &= ~0xFF;
+		if (msm_host->clk_rate < 150000000)
+			config |= DLL_CONFIG_3_LOW_FREQ_VAL;
+		else
+			config |= DLL_CONFIG_3_HIGH_FREQ_VAL;
+		writel_relaxed(config, host->ioaddr +
+			msm_offset->core_dll_config_3);
 	}
 
 	config = readl_relaxed(host->ioaddr +
-- 
2.7.4

