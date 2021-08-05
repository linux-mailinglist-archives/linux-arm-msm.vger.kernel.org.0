Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693533E1957
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 18:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhHEQSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 12:18:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23689 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhHEQSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 12:18:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628180289; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=f7QeHYGYedbpUVOfkOQUuZQ076RMnfoiwQMDV5aROq0=; b=aTzFo7bMdFBufa0aIZFoThx/8lFaTUT4nhe+0qXxB1VOEi3xaiVgjxMhXZs4FfWP7oJC4F0L
 2bTyqos0AE7E2ZkTyjkz2myRQkcIqqIZK/Lt539XrSyCGJ+lIOzkCCpj+xVW7e77DlOhBW9E
 irC2tvNH+8PcAnkvt2hGtyaAY5c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 610c0f33ad1af63949d13d72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Aug 2021 16:17:55
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1F675C4360C; Thu,  5 Aug 2021 16:17:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68198C4338A;
        Thu,  5 Aug 2021 16:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68198C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
Date:   Thu,  5 Aug 2021 21:47:33 +0530
Message-Id: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some use cases require SMP2P interrupts to wake up the host
from suspend. Mark smp2p interrupt as wakeup capable to abort
the suspend.

Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/soc/qcom/smp2p.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 2df4883..f8659b0 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -18,6 +18,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
+#include <linux/pm_wakeirq.h>
 
 /*
  * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
@@ -538,9 +539,19 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		goto unwind_interfaces;
 	}
 
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

