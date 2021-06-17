Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8E23ABE27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFQVdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 17:33:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26031 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbhFQVdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 17:33:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623965467; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LyoRvPmeXINcf5fpY1eZPM09MeDUQlyocKaVnRpCW1A=; b=N7VILP12KacoiWSNojIBvk5LtbiDCAouJWslPhhmesH8SJCHP68ACvdbgIvy8L/XT16X8oJc
 FKkkKqRxe7XhLfMmLJpmSrIjliw2yn64b8qdhmMC40+pwBQ16FlOAgwoyuQWuRlrY8SW9acK
 FrtFHjVXzMwyD31EXvliQ1bzKbQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60cbbf032eaeb98b5e248f65 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 21:30:43
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31DA7C43217; Thu, 17 Jun 2021 21:30:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD18BC4338A;
        Thu, 17 Jun 2021 21:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD18BC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 1/4] bus: mhi: core: Add support for processing priority of event ring
Date:   Thu, 17 Jun 2021 14:30:32 -0700
Message-Id: <1623965435-30224-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
References: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Event ring priorities are currently set to 1 and are unused.
Default processing priority for event rings is set to regular
tasklet. Controllers can choose to use high priority tasklet
scheduling for certain event rings critical for processing such
as ones transporting control information if they wish to avoid
with system scheduling delays for those packets. In order to
support these use cases, allow controllers to set event ring
priority to high. This patch only adds support and does not
enable usage of these priorities.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h |  2 +-
 drivers/bus/mhi/core/main.c     | 19 ++++++++++++++++---
 include/linux/mhi.h             | 14 ++++++++++++--
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 672052f..666e102 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -535,7 +535,7 @@ struct mhi_event {
 	u32 intmod;
 	u32 irq;
 	int chan; /* this event ring is dedicated to a channel (optional) */
-	u32 priority;
+	enum mhi_er_priority priority;
 	enum mhi_er_data_type data_type;
 	struct mhi_ring ring;
 	struct db_cfg db_cfg;
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 8ac73f9..bfc9776 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -425,10 +425,11 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 	}
 }
 
-irqreturn_t mhi_irq_handler(int irq_number, void *dev)
+irqreturn_t mhi_irq_handler(int irq_number, void *priv)
 {
-	struct mhi_event *mhi_event = dev;
+	struct mhi_event *mhi_event = priv;
 	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	struct mhi_event_ctxt *er_ctxt =
 		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
 	struct mhi_ring *ev_ring = &mhi_event->ring;
@@ -454,8 +455,20 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 
 		if (mhi_dev)
 			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
-	} else {
+
+		return IRQ_HANDLED;
+	}
+
+	switch (mhi_event->priority) {
+	case MHI_ER_PRIORITY_HI:
+		tasklet_hi_schedule(&mhi_event->task);
+		break;
+	case MHI_ER_PRIORITY_DEFAULT:
 		tasklet_schedule(&mhi_event->task);
+		break;
+	default:
+		dev_err(dev, "Skip event of unknown priority\n");
+		break;
 	}
 
 	return IRQ_HANDLED;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 86cea52..25ee312 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -198,6 +198,16 @@ enum mhi_er_data_type {
 };
 
 /**
+ * enum mhi_er_priority - Event ring processing priority
+ * @MHI_ER_PRIORITY_HI: processed by hi-priority tasklet
+ * @MHI_ER_PRIORITY_DEFAULT: processed by regular tasklet
+ */
+enum mhi_er_priority {
+	MHI_ER_PRIORITY_HI,
+	MHI_ER_PRIORITY_DEFAULT,
+};
+
+/**
  * enum mhi_db_brst_mode - Doorbell mode
  * @MHI_DB_BRST_DISABLE: Burst mode disable
  * @MHI_DB_BRST_ENABLE: Burst mode enable
@@ -250,7 +260,7 @@ struct mhi_channel_config {
  * @irq_moderation_ms: Delay irq for additional events to be aggregated
  * @irq: IRQ associated with this ring
  * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
- * @priority: Priority of this ring. Use 1 for now
+ * @priority: Processing priority of this ring.
  * @mode: Doorbell mode
  * @data_type: Type of data this ring will process
  * @hardware_event: This ring is associated with hardware channels
@@ -262,7 +272,7 @@ struct mhi_event_config {
 	u32 irq_moderation_ms;
 	u32 irq;
 	u32 channel;
-	u32 priority;
+	enum mhi_er_priority priority;
 	enum mhi_db_brst_mode mode;
 	enum mhi_er_data_type data_type;
 	bool hardware_event;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

