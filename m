Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BF1371253
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 10:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbhECIOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 04:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbhECIOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 04:14:42 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB87C06138D
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 01:13:49 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p17so2377381plf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=955BiMpV3PxxTlbeWzeYLgt/LzlJsdPGuHod6o4UA4E=;
        b=X97vfRTMZSRPBomlNkjB6efr8TTBpOaW7naOI2DtIlaReTurqYZAocxryK+VOyENWm
         WokG7Hh6F3+Q3L9dUHZbfIu0Xs30IPWFbVuKgUCLJaRhLFAb6p0+Eaintyl/gaCgL1il
         43rCzqHquXIYf1CAvdy8niOMiQXKKMIKB0OH2tq4967WkTtB5HArAZC4tbFB38p0tiCc
         +pZHj1tVB5h7nifN8gQJj74NVEAdXXI77kPDtb08qhSd4aWQKvpEhvB0NPYuYfj+5I06
         r3lbaYaVIbHcqLVMryj116lYEXEcD2OYIPM5AWGsBg9YHdbBBE8d3ayVwWym/Mh+nNHJ
         xmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=955BiMpV3PxxTlbeWzeYLgt/LzlJsdPGuHod6o4UA4E=;
        b=t2a+XEtpvexH1V1flGu8sO5Kdp3tu/1SggdCJxqmX9ZmsSw81kjH07j/ijaTInG5HV
         t2f1WIp0TP3GEkICTH2+I//o9oVDggi2mw/gcVzAlaFFshe6H9BFqLAFRQcGty8iuKmP
         WNUcyiknE6YzCZNdCgD2aX346bTCn2jLlhhd/NfuMo67in71oNqZhq3BlEwnDP7631j+
         +tu6Q6cFqM2GLUxCA5nqc7d/hObSnLnzsj/+U4L4YqT4CVWZcSSrEov0g3ehRrUjHWd0
         67oDuKagDh8313m7GgSPpbKnJ24jNEP6jQtd5fEef8YlbJKWwKoY9dVvVjAVMowCpEJ3
         jEnw==
X-Gm-Message-State: AOAM5321aw+1dy0R6NIJ7FshYWP8/jHf9+o78ixMjKr24+ZJ9mlLiEY6
        kdH7o4kI2KSU7FHPNiybBmCFjQ==
X-Google-Smtp-Source: ABdhPJyS1dxcmHjCU/RIV2HqfxsE8XyNao1S0c4YGeqjmxUUsa5CTLQs6mQtUMlJ2MftWQ71cf1QCg==
X-Received: by 2002:a17:90a:8b12:: with SMTP id y18mr391778pjn.153.1620029629129;
        Mon, 03 May 2021 01:13:49 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id fa17sm12031939pjb.17.2021.05.03.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 01:13:48 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/2] mailbox: qcom: Add MSM8939 APCS support
Date:   Mon,  3 May 2021 16:13:34 +0800
Message-Id: <20210503081334.17143-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210503081334.17143-1-shawn.guo@linaro.org>
References: <20210503081334.17143-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8939 has 3 APCS instances for Cluster0 (little cores), Cluster1 (big
cores) and CCI (Cache Coherent Interconnect).  Although only APCS of
Cluster0 and Cluster1 have IPC bits, each of 3 APCS has A53PLL clock
control bits.  That said, we need to register 3 'qcom-apcs-msm8916-clk'
devices to instantiate all 3 clocks.  Let's use PLATFORM_DEVID_AUTO
rather than PLATFORM_DEVID_NONE for platform_device_register_data()
call.  Otherwise, the second A53PLL clock registration will fail due
to duplicate device name.

[    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
...
[    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index f25324d03842..1699ec38bc3b 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -132,7 +132,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (apcs_data->clk_name) {
 		apcs->clk = platform_device_register_data(&pdev->dev,
 							  apcs_data->clk_name,
-							  PLATFORM_DEVID_NONE,
+							  PLATFORM_DEVID_AUTO,
 							  NULL, 0);
 		if (IS_ERR(apcs->clk))
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
@@ -158,6 +158,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
+	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
-- 
2.17.1

