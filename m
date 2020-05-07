Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C381C8430
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 10:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgEGIDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 04:03:41 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:9303 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgEGIDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 04:03:41 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 May 2020 13:33:38 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 May 2020 13:33:37 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id D4A9A261C; Thu,  7 May 2020 13:33:36 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V1 3/7] mmc: sdhci-msm: Update dll_config_3 as per HSR
Date:   Thu,  7 May 2020 13:32:10 +0530
Message-Id: <1588838535-6050-4-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update dll_config_3 as per the host clock frequency as specified in the
DLL Hardware Reference Guide.

Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index dad008e..0f7baaf 100644
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

