Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393881C47F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 22:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgEDUYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 16:24:16 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62452 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727833AbgEDUYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 16:24:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588623854; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o5gzCsKoIwbRSKGOFz/648tIfwZ0CgOqwNP1PqeCGww=; b=Uu9rzefcnDzefXwq43S7xoXOU5rkRg6t0DMKY2De/tLJI894SuruoehVqXdXqYw/MoXYxM98
 WEMHUNQJNcqHtZBVFeFYGqkzPngtsYG+UkY7dRN0MRFYe2HnCLl4qLPWKmQPlwFT/GjPtBbN
 boNFL0tMSNclKo9dEO7ffPA1yuw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb079ea.7f5e913abe30-smtp-out-n02;
 Mon, 04 May 2020 20:24:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4EED0C44792; Mon,  4 May 2020 20:24:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CCEDC43637;
        Mon,  4 May 2020 20:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CCEDC43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        saravanak@google.com, mka@chromium.org
Cc:     nm@ti.com, agross@kernel.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, ulf.hansson@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 03/12] cpufreq: blacklist SC7180 in cpufreq-dt-platdev
Date:   Tue,  5 May 2020 01:52:34 +0530
Message-Id: <20200504202243.5476-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200504202243.5476-1-sibis@codeaurora.org>
References: <20200504202243.5476-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SC7180 to cpufreq-dt-platdev blacklist since the actual scaling is
handled by the 'qcom-cpufreq-hw' driver.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v4:
 * Updated commit message [Matthias]
 * Picked up R-b from Matthias

 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 6ed68bc906f8d..15410b15015f4 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -131,6 +131,7 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "qcom,apq8096", },
 	{ .compatible = "qcom,msm8996", },
 	{ .compatible = "qcom,qcs404", },
+	{ .compatible = "qcom,sc7180", },
 	{ .compatible = "qcom,sdm845", },
 
 	{ .compatible = "st,stih407", },
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
