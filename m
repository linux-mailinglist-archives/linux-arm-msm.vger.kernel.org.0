Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965D03ABE2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhFQVda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 17:33:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39557 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232431AbhFQVdZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 17:33:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623965477; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qR6a8wItKF0YQfemAKYtKL0EZ9Ja7p6mTMcADOik0Ro=; b=rI/13VIBoiVnKqk998BnnMeF1/9JSmbDvsq5r2VxwCyDXZw1Vl0LH2E2Y7HrJT4m9c5I4tlP
 Y8I5xYARJg9oGkY9BuJWVJ4wMvUqN0Pjef8LB8ZfHdGJTv5R1bbhVFksY0yWia2DMFDsPhy7
 /D47GSJPTCRO1ypPc2z0Z3SND9M=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60cbbf03e570c05619857665 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 21:30:43
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A97BC4360C; Thu, 17 Jun 2021 21:30:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D922C43460;
        Thu, 17 Jun 2021 21:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D922C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 2/4] bus: mhi: pci_generic: Use enum entry for event ring priority
Date:   Thu, 17 Jun 2021 14:30:33 -0700
Message-Id: <1623965435-30224-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
References: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of using a default event ring priority of 1, use the enum
provided and set it to default.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 31360a2..5886547 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -74,17 +74,17 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
-#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
-	{					\
-		.num_elements = el_count,	\
-		.irq_moderation_ms = 0,		\
-		.irq = (ev_ring) + 1,		\
-		.priority = 1,			\
-		.mode = MHI_DB_BRST_DISABLE,	\
-		.data_type = MHI_ER_CTRL,	\
-		.hardware_event = false,	\
-		.client_managed = false,	\
-		.offload_channel = false,	\
+#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count)	\
+	{						\
+		.num_elements = el_count,		\
+		.irq_moderation_ms = 0,			\
+		.irq = (ev_ring) + 1,			\
+		.priority = MHI_ER_PRIORITY_DEFAULT,	\
+		.mode = MHI_DB_BRST_DISABLE,		\
+		.data_type = MHI_ER_CTRL,		\
+		.hardware_event = false,		\
+		.client_managed = false,		\
+		.offload_channel = false,		\
 	}
 
 #define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -177,31 +177,31 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
-#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
-	{					\
-		.num_elements = el_count,	\
-		.irq_moderation_ms = 5,		\
-		.irq = (ev_ring) + 1,		\
-		.priority = 1,			\
-		.mode = MHI_DB_BRST_DISABLE,	\
-		.data_type = MHI_ER_DATA,	\
-		.hardware_event = false,	\
-		.client_managed = false,	\
-		.offload_channel = false,	\
+#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count)	\
+	{						\
+		.num_elements = el_count,		\
+		.irq_moderation_ms = 5,			\
+		.irq = (ev_ring) + 1,			\
+		.priority = MHI_ER_PRIORITY_DEFAULT,	\
+		.mode = MHI_DB_BRST_DISABLE,		\
+		.data_type = MHI_ER_DATA,		\
+		.hardware_event = false,		\
+		.client_managed = false,		\
+		.offload_channel = false,		\
 	}
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
-	{					\
-		.num_elements = el_count,	\
-		.irq_moderation_ms = 1,		\
-		.irq = (ev_ring) + 1,		\
-		.priority = 1,			\
-		.mode = MHI_DB_BRST_DISABLE,	\
-		.data_type = MHI_ER_DATA,	\
-		.hardware_event = true,		\
-		.client_managed = false,	\
-		.offload_channel = false,	\
-		.channel = ch_num,		\
+	{						\
+		.num_elements = el_count,		\
+		.irq_moderation_ms = 1,			\
+		.irq = (ev_ring) + 1,			\
+		.priority = MHI_ER_PRIORITY_DEFAULT,	\
+		.mode = MHI_DB_BRST_DISABLE,		\
+		.data_type = MHI_ER_DATA,		\
+		.hardware_event = true,			\
+		.client_managed = false,		\
+		.offload_channel = false,		\
+		.channel = ch_num,			\
 	}
 
 static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

