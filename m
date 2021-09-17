Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADF940FDF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 18:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbhIQQdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 12:33:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34132 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231649AbhIQQd3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 12:33:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631896326; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bC6WW1HCqOHoLARuCxv4vK+SHjilrqIcRBQKaBuMPto=; b=BnLO7tlcczznxExaqhDAfmkfB0zr23CD5swOQ2FsbDaPmh9PGgYvFIj+DkTd/EzSGKeuRRlg
 cb/+CSlVrHGTVS7b2pn1H7RD6nftpwx4ln55PrGEpH0pWJJtQK6iP2J0D3L//Zq670RbjiNT
 kpwsDBUq30Qr8q0G3OKdnD6squ4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6144c306b585cc7d243210d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 16:32:06
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD68EC43616; Fri, 17 Sep 2021 16:32:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9A08C4338F;
        Fri, 17 Sep 2021 16:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D9A08C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V3 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
Date:   Fri, 17 Sep 2021 22:01:28 +0530
Message-Id: <1631896288-17281-1-git-send-email-deesin@codeaurora.org>
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
by default and leaves it to user space to enable it according to its
requirement.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smp2p.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 2df4883..5f8ba96 100644
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
+		set_wake_irq_fail;
 
 	return 0;
 
+set_wake_irq_fail:
+	dev_pm_clear_wake_irq(&pdev->dev);
+
 unwind_interfaces:
 	list_for_each_entry(entry, &smp2p->inbound, node)
 		irq_domain_remove(entry->domain);
@@ -565,6 +583,9 @@ static int qcom_smp2p_remove(struct platform_device *pdev)
 	struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
 	struct smp2p_entry *entry;
 
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+
 	list_for_each_entry(entry, &smp2p->inbound, node)
 		irq_domain_remove(entry->domain);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

