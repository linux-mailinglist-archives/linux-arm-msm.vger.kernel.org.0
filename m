Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3CBF165A0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 10:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgBTJV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 04:21:57 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:26654 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727095AbgBTJV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 04:21:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582190516; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=c85s8naSK3Xbvoo8BeI3imw+A0YDHtYgT9ZUdHxHtZM=; b=EgKpU6K/lqM7Y15jsjslLDTS0Cp070iDcaHOOvsV4n5NMk6PoYNJSDKaUZI0cl10SER5lnSl
 c4DVIG28BG1LpFOiUYxW30rvR4j9F2Hi5JS7kbNmrjmWKcqeexwLyUbMp7RjoG4FmM90cf38
 0g/p2A1ciQD6Q7XK7B8Fwj7J4qg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4e4fac.7fa66f6f9030-smtp-out-n02;
 Thu, 20 Feb 2020 09:21:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D67CC433A2; Thu, 20 Feb 2020 09:21:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sayalil-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sayalil)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1783C43383;
        Thu, 20 Feb 2020 09:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1783C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sayalil@codeaurora.org
From:   Sayali Lokhande <sayalil@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        ppvk@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Sayali Lokhande <sayalil@codeaurora.org>
Subject: [PATCH RFC] mmc: sdhci-msm: Toggle fifo write clk after ungating sdcc clk
Date:   Thu, 20 Feb 2020 14:50:46 +0530
Message-Id: <1582190446-4778-2-git-send-email-sayalil@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582190446-4778-1-git-send-email-sayalil@codeaurora.org>
References: <1582190446-4778-1-git-send-email-sayalil@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ram Prakash Gupta <rampraka@codeaurora.org>

During GCC level clock gating of MCLK, the async FIFO
gets into some hang condition, such that for the next
transfer after MCLK ungating, first bit of CMD response
doesn't get written in to the FIFO. This cause the CPSM
to hang eventually leading to SW timeout.

To fix the issue, toggle the FIFO write clock after
MCLK ungated to get the FIFO pointers and flags to
valid states.

Change-Id: Ibef2d1d283ac0b6983c609a4abc98bc574d31fa6
Signed-off-by: Ram Prakash Gupta <rampraka@codeaurora.org>
Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index c3a160c..eaa3e95 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -127,6 +127,8 @@
 #define CQHCI_VENDOR_CFG1	0xA00
 #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
 
+#define RCLK_TOGGLE 0x2
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -1554,6 +1556,43 @@ static void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 	sdhci_enable_clk(host, clk);
 }
 
+/*
+ * After MCLK ugating, toggle the FIFO write clock to get
+ * the FIFO pointers and flags to valid state.
+ */
+static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset =
+					msm_host->offset;
+	struct mmc_card *card = host->mmc->card;
+
+	if (msm_host->tuning_done ||
+			(card && card->ext_csd.strobe_support &&
+			card->host->ios.enhanced_strobe)) {
+		/*
+		 * set HC_REG_DLL_CONFIG_3[1] to select MCLK as
+		 * DLL input clock
+		 */
+		writel_relaxed(((readl_relaxed(host->ioaddr +
+			msm_offset->core_dll_config_3))
+			| RCLK_TOGGLE), host->ioaddr +
+			msm_offset->core_dll_config_3);
+		/* ensure above write as toggling same bit quickly */
+		wmb();
+		udelay(2);
+		/*
+		 * clear HC_REG_DLL_CONFIG_3[1] to select RCLK as
+		 * DLL input clock
+		 */
+		writel_relaxed(((readl_relaxed(host->ioaddr +
+			msm_offset->core_dll_config_3))
+			& ~RCLK_TOGGLE), host->ioaddr +
+			msm_offset->core_dll_config_3);
+	}
+}
+
 /* sdhci_msm_set_clock - Called with (host->lock) spinlock held. */
 static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 {
@@ -2149,6 +2188,10 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 				       msm_host->bulk_clks);
 	if (ret)
 		return ret;
+	if (host->mmc &&
+			(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
+		sdhci_msm_toggle_fifo_write_clk(host);
+
 	/*
 	 * Whenever core-clock is gated dynamically, it's needed to
 	 * restore the SDR DLL settings when the clock is ungated.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
