Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA653ED199
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 12:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhHPKIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 06:08:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25909 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhHPKIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 06:08:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629108490; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=stLY7GkwYgSHcjhNXA7SopqN29wNOpHyzuWjB7u9WJA=; b=bZaaGkeJTLz/qytEH11MpAzdJ9f1xXl09rrnpzAGxWCgWXgoqwf9z1UYVhU4cpUyxSRcpyd3
 12Bi5JxpEHuLhqPa4QpSb8oHIoQKw17t0EUMtKmfIU/lLOSgKweXGO1UV/QeqzCDFaJNMURV
 v5ckCm5FZToU/N7Mv/h1FNbn6dA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 611a3883f746c298d97e22c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Aug 2021 10:05:55
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95F14C4360C; Mon, 16 Aug 2021 10:05:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED5FDC4338F;
        Mon, 16 Aug 2021 10:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org ED5FDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V2 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
Date:   Mon, 16 Aug 2021 15:35:35 +0530
Message-Id: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remote susbsystems notify fatal crash throught smp2p interrupt.
When modem/wifi crashes it can cause soc to come out of low power state
and may not allow again to enter in low power state until crash is handled.

Mark smp2p interrupt wakeup capable so that interrupt handler is executed
and remote susbsystem crash can be handled in system  resume path.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smp2p.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 2df4883..646848b 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -18,6 +18,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
+#include <linux/pm_wakeirq.h>
 
 /*
  * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
@@ -538,9 +539,20 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		goto unwind_interfaces;
 	}
 
+	/* Setup smp2p interrupt as wakeup source */
+	ret = device_init_wakeup(&pdev->dev, true);
+	if (ret)
+		goto unwind_interfaces;
+
+	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
+	if (ret)
+		goto set_wakeup_failed;
 
 	return 0;
 
+set_wakeup_failed:
+	device_init_wakeup(&pdev->dev, false);
+
 unwind_interfaces:
 	list_for_each_entry(entry, &smp2p->inbound, node)
 		irq_domain_remove(entry->domain);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

