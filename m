Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBAF17BFE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 15:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCFOJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 09:09:53 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:43155 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726633AbgCFOJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 09:09:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583503792; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2/EtRiLOSPFwJJR37/eWuh6RdeAvYfzVAX/0xixoiTQ=; b=uioTuILYyl5ksF6gG2EpuPytCmiGbr4esznE9vSnzWWPeRn1TxqSvBnkJeaZEKc1rf+l8eES
 nyJa0VH0F9mriWpdu9aemihwishV6aw972khnZl0nsPsIjVohlcfn2EC0DwmspjrO/ABTM6A
 mlvu9fwYVGVg5VtjLdLmITIMavc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6259a1.7f74c6ba25e0-smtp-out-n01;
 Fri, 06 Mar 2020 14:09:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A195C4478F; Fri,  6 Mar 2020 14:09:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CBC3C433D2;
        Fri,  6 Mar 2020 14:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CBC3C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH V3 2/2] mmc: sdhci-msm: Deactivate CQE during SDHC reset
Date:   Fri,  6 Mar 2020 19:38:43 +0530
Message-Id: <1583503724-13943-3-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583503724-13943-1-git-send-email-vbadigan@codeaurora.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
 <1583503724-13943-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When SDHC gets reset (E.g. in runtime suspend path), CQE also gets
reset and goes to disable state. But s/w state still points it as CQE
is in enabled state. Since s/w and h/w states goes out of sync,
it results in s/w request timeout for subsequent CQE requests.

To synchronize CQE s/w and h/w state during SDHC reset,
explicitly deactivate CQE just before SDHC reset.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
Changes sicne V2:
	- Use cqhci_deactivate() instead of cqhci_disable().
	- Deactivate CQCHI just before SDHC reset.

Changes since V1:
	- Disable CQE only when SDHC undergoes s/w reset for all.
---
 drivers/mmc/host/sdhci-msm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 53b79ee..09ff731 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1823,6 +1823,13 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
 	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
 }
 
+static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
+{
+	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
+		cqhci_deactivate(host->mmc);
+	sdhci_reset(host, mask);
+}
+
 static const struct sdhci_msm_variant_ops mci_var_ops = {
 	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
 	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
@@ -1861,7 +1868,7 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
 MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
 
 static const struct sdhci_ops sdhci_msm_ops = {
-	.reset = sdhci_reset,
+	.reset = sdhci_msm_reset,
 	.set_clock = sdhci_msm_set_clock,
 	.get_min_clock = sdhci_msm_get_min_clock,
 	.get_max_clock = sdhci_msm_get_max_clock,
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
