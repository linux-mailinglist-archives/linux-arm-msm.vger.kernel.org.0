Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9271A2379
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgDHNsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:48:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50843 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729359AbgDHNsI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:48:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353687; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=D2cYIBvDICqcglTSXXtUO6r86gjQu4uxEWBa7lU9kL8=; b=sUnleAPjRCbynTf2+rzMH6Hr1o4rHBdbZmirJDpZrIrIzADI8xcHWOIx8qlYWjnFR+hW+nMZ
 A3NV52zVkz8I2Ylqj3LCVABpJ200JWGuV5+MK/lDgLSnAtKpNdbGuNcTGx7rG5nGusCwV3aL
 eO79Y60P844t7xcqJsBBjcQ5XlI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd614.7fea484ce0a0-smtp-out-n03;
 Wed, 08 Apr 2020 13:48:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74DDEC072B7; Wed,  8 Apr 2020 13:48:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65784C44BC3;
        Wed,  8 Apr 2020 13:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65784C44BC3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        linux-mmc@vger.kernel.org
Subject: [PATCH 13/21] mmc: sdhci-msm: Use OPP API to set clk/perf state
Date:   Wed,  8 Apr 2020 19:16:39 +0530
Message-Id: <1586353607-32222-14-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some qualcomm SoCs we need to vote on a performance state of a power
domain depending on the clock rates. Hence move to using OPP api to set
the clock rate and performance state specified in the OPP table.
On platforms without an OPP table, dev_pm_opp_set_rate() is eqvivalent to
clk_set_rate()

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Pradeep P V K <ppvk@codeaurora.org>
Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc: Subhash Jadavani <subhashj@codeaurora.org>
Cc: linux-mmc@vger.kernel.org
---
 drivers/mmc/host/sdhci-msm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 09ff731..d82075a 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/mmc/mmc.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
@@ -242,6 +243,7 @@ struct sdhci_msm_host {
 	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
 	struct clk_bulk_data bulk_clks[4]; /* core, iface, cal, sleep clocks */
 	unsigned long clk_rate;
+	struct opp_table *opp;
 	struct mmc_host *mmc;
 	bool use_14lpp_dll_reset;
 	bool tuning_done;
@@ -332,7 +334,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	int rc;
 
 	clock = msm_get_clock_rate_for_bus_mode(host, clock);
-	rc = clk_set_rate(core_clk, clock);
+	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
 		       mmc_hostname(host->mmc), clock,
@@ -1963,7 +1965,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->bulk_clks[0].clk = clk;
 
 	/* Vote for maximum clock rate for maximum performance */
-	ret = clk_set_rate(clk, INT_MAX);
+	ret = dev_pm_opp_set_rate(&pdev->dev, INT_MAX);
 	if (ret)
 		dev_warn(&pdev->dev, "core clock boost failed\n");
 
@@ -2087,6 +2089,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
+	msm_host->opp = dev_pm_opp_set_clkname(&pdev->dev, "core");
+	dev_pm_opp_of_add_table(&pdev->dev);
+
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -2109,10 +2114,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	return 0;
 
 pm_runtime_disable:
+	dev_pm_opp_of_remove_table(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 clk_disable:
+	dev_pm_opp_set_rate(&pdev->dev, 0);
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
 bus_clk_disable:
@@ -2133,10 +2140,12 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 
 	sdhci_remove_host(host, dead);
 
+	dev_pm_opp_of_remove_table(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 
+	dev_pm_opp_set_rate(&pdev->dev, 0);
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
 	if (!IS_ERR(msm_host->bus_clk))
@@ -2151,6 +2160,7 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 
+	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
 
@@ -2173,9 +2183,11 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	 * restore the SDR DLL settings when the clock is ungated.
 	 */
 	if (msm_host->restore_dll_config && msm_host->clk_rate)
-		return sdhci_msm_restore_sdr_dll_config(host);
+		ret = sdhci_msm_restore_sdr_dll_config(host);
 
-	return 0;
+	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
+
+	return ret;
 }
 
 static const struct dev_pm_ops sdhci_msm_pm_ops = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
