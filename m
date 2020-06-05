Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203281F01D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 23:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgFEVed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 17:34:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37290 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728519AbgFEVec (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 17:34:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591392872; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tNpNYJfeY31tX6QoJHuekSR2zEnXnTIqNOEEGa1XSlQ=; b=Z/mM6ZpLyJuXu/xLHPsAF84OWtGzy8xzNhUgmAYYI67fDDTV/ggPb19sIkCC7hmvaHrCKJui
 bn7/29NKZpeoqRH6ikN6+bfQSqZ/bz0yDrA17X4W2gP/MdzsKf7arJE3KgjYFVkJmJmrG9UV
 2c/DNrJEBEpl78lizUscPHM5vWM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5edaba5976fccbb4c87aa0e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 21:34:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86D1FC4339C; Fri,  5 Jun 2020 21:34:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D37DCC433CA;
        Fri,  5 Jun 2020 21:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D37DCC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, mka@chromium.org
Cc:     nm@ti.com, bjorn.andersson@linaro.org, agross@kernel.org,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, lukasz.luba@arm.com,
        sudeep.holla@arm.com, smasetty@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6 5/5] cpufreq: qcom: Disable fast switch when scaling DDR/L3
Date:   Sat,  6 Jun 2020 03:03:32 +0530
Message-Id: <20200605213332.609-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200605213332.609-1-sibis@codeaurora.org>
References: <20200605213332.609-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable fast switch when the opp-tables required for scaling DDR/L3
are populated.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v6:
 * No change

v5:
 * Drop dev_pm_opp_get_path_count [Saravana]

 drivers/cpufreq/qcom-cpufreq-hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 8fa6ab6e0e4b6..56f01049fd3a3 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -158,6 +158,8 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	} else if (ret != -ENODEV) {
 		dev_err(cpu_dev, "Invalid opp table in device tree\n");
 		return ret;
+	} else {
+		policy->fast_switch_possible = true;
 	}
 
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
@@ -307,8 +309,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 
 	dev_pm_opp_of_register_em(policy->cpus);
 
-	policy->fast_switch_possible = true;
-
 	return 0;
 error:
 	devm_iounmap(dev, base);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

