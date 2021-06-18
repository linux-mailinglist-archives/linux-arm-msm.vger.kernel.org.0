Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39043AD4C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 00:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbhFRWH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 18:07:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:16655 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhFRWH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 18:07:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624053918; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TASDdCAuTLzpjOUv0B88DHj8D0grvdgek7WAhCsp5F0=; b=s9uD26X3GK2nVJNQmjMmqnQ737Q2uVp6HxEs/SamDFws+Zb9eh9ap6B5aIjX9LRyun2izBf4
 dFEACJ34x8LMa684LXM/O7UTrJCYiXNuXgvBV93BWDwswMficsKj5D1Cd1zFrc8laP5diLTJ
 N0766EiiN3EHyTu+o1b0xoNlC1U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60cd189dea2aacd7290e0ed8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 22:05:17
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD216C43460; Fri, 18 Jun 2021 22:05:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7899C433F1;
        Fri, 18 Jun 2021 22:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7899C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2] bus: mhi: core: Add support for processing priority of event ring
Date:   Fri, 18 Jun 2021 15:05:03 -0700
Message-Id: <1624053903-24653-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624053903-24653-1-git-send-email-bbhatt@codeaurora.org>
References: <1624053903-24653-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Event ring priorities are currently set to 1 and are unused.
Default processing priority for event rings is set to regular
tasklet. Controllers can choose to use high priority tasklet
scheduling for certain event rings critical for processing such
as ones transporting control information if they wish to avoid
system scheduling delays for those packets. In order to support
these use cases, allow controllers to set event ring priority to
high.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 3 +--
 drivers/bus/mhi/core/main.c | 9 +++++++--
 include/linux/mhi.h         | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c81b377..4446760 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -673,8 +673,7 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 				&mhi_cntrl->mhi_chan[mhi_event->chan];
 		}
 
-		/* Priority is fixed to 1 for now */
-		mhi_event->priority = 1;
+		mhi_event->priority = event_cfg->priority;
 
 		mhi_event->db_cfg.brstmode = event_cfg->mode;
 		if (MHI_INVALID_BRSTMODE(mhi_event->db_cfg.brstmode))
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 8ac73f9..3775c77 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -454,10 +454,15 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 
 		if (mhi_dev)
 			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
-	} else {
-		tasklet_schedule(&mhi_event->task);
+
+		return IRQ_HANDLED;
 	}
 
+	if (!mhi_event->priority)
+		tasklet_hi_schedule(&mhi_event->task);
+	else
+		tasklet_schedule(&mhi_event->task);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 86cea52..bf23c21 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -250,7 +250,7 @@ struct mhi_channel_config {
  * @irq_moderation_ms: Delay irq for additional events to be aggregated
  * @irq: IRQ associated with this ring
  * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
- * @priority: Priority of this ring. Use 1 for now
+ * @priority: Processing priority of this ring. 0 is high and 1 is regular
  * @mode: Doorbell mode
  * @data_type: Type of data this ring will process
  * @hardware_event: This ring is associated with hardware channels
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

