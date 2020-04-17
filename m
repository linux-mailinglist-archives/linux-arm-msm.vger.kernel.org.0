Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537011ADF4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731040AbgDQOGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:06:08 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23788 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731042AbgDQOF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:05:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587132357; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=NrSzihczVmZejj8htXqrLK1JzynBAY/NU6Xo96wnYYE=; b=k3BBAwTlktbQ6JmOqMfcvL+G4Q0hDwp/5y+AUML3rfunwQWjlGl1OA+ZeEZ4mJfZ6eoGmObn
 +vWAngUO70k4kzhyfObvDqugxWtN8RgIhKNWe1E9Qs1kJ/F8a73E08qxlI10EeMmvdyyL8Ly
 z7z873TtUik4C6cyNllfFa++jOY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99b7c4.7fc2ff60b030-smtp-out-n04;
 Fri, 17 Apr 2020 14:05:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE9CFC19433; Fri, 17 Apr 2020 14:05:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0A67C447A1;
        Fri, 17 Apr 2020 14:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0A67C447A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        linux-mmc@vger.kernel.org
Subject: [PATCH v2 09/17] mmc: sdhci-msm: Use OPP API to set clk/perf state
Date:   Fri, 17 Apr 2020 19:34:31 +0530
Message-Id: <1587132279-27659-10-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
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
Cc: linux-mmc@vger.kernel.org
---
 drivers/mmc/host/sdhci-msm.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 09ff731..cf27480 100644
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
@@ -243,6 +244,8 @@ struct sdhci_msm_host {
 	struct clk_bulk_data bulk_clks[4]; /* core, iface, cal, sleep clocks */
 	unsigned long clk_rate;
 	struct mmc_host *mmc;
+	struct opp_table *opp;
+	bool opp_table;
 	bool use_14lpp_dll_reset;
 	bool tuning_done;
 	bool calibration_done;
@@ -332,7 +335,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	int rc;
 
 	clock = msm_get_clock_rate_for_bus_mode(host, clock);
-	rc = clk_set_rate(core_clk, clock);
+	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
 		       mmc_hostname(host->mmc), clock,
@@ -1962,8 +1965,18 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 	msm_host->bulk_clks[0].clk = clk;
 
+	msm_host->opp = dev_pm_opp_set_clkname(&pdev->dev, "core");
+	if (IS_ERR(msm_host->opp)) {
+		ret = PTR_ERR(msm_host->opp);
+		goto bus_clk_disable;
+	}
+
+	/* OPP table is optional */
+	if (!dev_pm_opp_of_add_table(&pdev->dev))
+		msm_host->opp_table = true;
+
 	/* Vote for maximum clock rate for maximum performance */
-	ret = clk_set_rate(clk, INT_MAX);
+	ret = dev_pm_opp_set_rate(&pdev->dev, INT_MAX);
 	if (ret)
 		dev_warn(&pdev->dev, "core clock boost failed\n");
 
@@ -1980,7 +1993,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
 				      msm_host->bulk_clks);
 	if (ret)
-		goto bus_clk_disable;
+		goto opp_cleanup;
 
 	/*
 	 * xo clock is needed for FLL feature of cm_dll.
@@ -2115,6 +2128,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
+opp_cleanup:
+	if (msm_host->opp_table)
+		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_put_clkname(msm_host->opp);
 bus_clk_disable:
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
@@ -2133,6 +2150,9 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 
 	sdhci_remove_host(host, dead);
 
+	if (msm_host->opp_table)
+		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_put_clkname(msm_host->opp);
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -2151,6 +2171,8 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 
+	/* Drop the performance vote */
+	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
 
@@ -2173,9 +2195,11 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
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
