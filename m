Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C068C4131B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhIUKgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:36:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25925 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbhIUKgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:36:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632220482; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=p4JNkd3L2vIMEV9xY9yD46hmbqQPTnQlbKnuVphVbqI=; b=xNPschyMGB2k2WkCNT4/Vh4nBRxuh8Baz5WJkD2TDkOD9i+pbkY/TpdNfo7F+ZlCxPktP4Tg
 HzXtWm/wawDeeHuSQLjiinYYplV9AEmBBBmi7xS3O/kVL3BTB/w4WV7DOa0+kGtEiXQYiYF0
 kArlkcuIB0ljuTriAIxDdQvgX3E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6149b541bd6681d8ed43d32c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 10:34:41
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1B56C4360C; Tue, 21 Sep 2021 10:34:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2134C4338F;
        Tue, 21 Sep 2021 10:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B2134C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V5 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
Date:   Tue, 21 Sep 2021 16:04:27 +0530
Message-Id: <1632220467-27410-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remote susbsystems notify fatal crash throught smp2p interrupt.
When remoteproc crashes it can cause soc to come out of low power
state and may not allow again to enter in low power state until
crash is handled.

Mark smp2p interrupt wakeup capable so that interrupt handler is
executed and remoteproc crash can be handled in system  resume path.
This patch marks interrupt wakeup capable but keeps wakeup disabled
by default. User space can enable it based on its requirement for
wakeup from suspend.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smp2p.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 2df4883..38585a7 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
@@ -538,9 +539,26 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		goto unwind_interfaces;
 	}
 
+	/*
+	 * Treat smp2p interrupt as wakeup source, but keep it disabled
+	 * by default. User space can decide enabling it depending on its
+	 * use cases. For example if remoteproc crashes and device wants
+	 * to handle it immediatedly (e.g. to not miss phone calls) it can
+	 * enable wakeup source from user space, while other devices which
+	 * do not have proper autosleep feature may want to handle it with
+	 * other wakeup events (e.g. Power button) instead waking up immediately.
+	 */
+	device_set_wakeup_capable(&pdev->dev, true);
+
+	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	if (ret)
+		goto set_wake_irq_fail;
 
 	return 0;
 
+set_wake_irq_fail:
+	dev_pm_clear_wake_irq(&pdev->dev);
+
 unwind_interfaces:
 	list_for_each_entry(entry, &smp2p->inbound, node)
 		irq_domain_remove(entry->domain);
@@ -565,6 +583,8 @@ static int qcom_smp2p_remove(struct platform_device *pdev)
 	struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
 	struct smp2p_entry *entry;
 
+	dev_pm_clear_wake_irq(&pdev->dev);
+
 	list_for_each_entry(entry, &smp2p->inbound, node)
 		irq_domain_remove(entry->domain);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

