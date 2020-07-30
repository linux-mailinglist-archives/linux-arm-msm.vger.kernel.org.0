Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FAC232B48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 07:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgG3FTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 01:19:17 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:47943 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728581AbgG3FTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 01:19:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596086356; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RWVNIsNr5OObCPeeXEL3doZhHd5fXLPECVyVT5z4kXA=; b=joyDGPCiA3iBmTNm+unGcMnyspNN1R0wcULhNsGAIVnowMhkfcW86pdaWcunIu5ka99QYgeB
 +WPKWaRG7iC2OI0huMJSgHsVI+p3PB2CWbqDiapwUT/shs7NnPZMyef0fmO6quSi/OO919zJ
 +mQKY+zyF1+TbyoZbBX+HC7XdBU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f225835aa44a6db05c5b872 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Jul 2020 05:18:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7192CC433CA; Thu, 30 Jul 2020 05:18:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A002C4339C;
        Thu, 30 Jul 2020 05:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A002C4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org
Cc:     mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V1 2/6] rpmsg: glink: Deny intent request if reusable intent fits
Date:   Thu, 30 Jul 2020 10:48:12 +0530
Message-Id: <1596086296-28529-3-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

In high traffic scenarios a remote may request extra intents to send
data faster. If the work thread that handles these intent requests is
starved of cpu time, then these requests can build up. Some remote
procs may not be able to handle this burst of built up intent requests.

In order to prevent intent build up, deny intent requests that can be
fulfilled by default intents that are reusable.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 2668c66..df3c608 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -734,9 +734,11 @@ static void qcom_glink_handle_rx_done(struct qcom_glink *glink,
 static void qcom_glink_handle_intent_req(struct qcom_glink *glink,
 					 u32 cid, size_t size)
 {
-	struct glink_core_rx_intent *intent;
+	struct glink_core_rx_intent *intent = NULL;
+	struct glink_core_rx_intent *tmp;
 	struct glink_channel *channel;
 	unsigned long flags;
+	int iid;
 
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, cid);
@@ -747,6 +749,19 @@ static void qcom_glink_handle_intent_req(struct qcom_glink *glink,
 		return;
 	}
 
+	spin_lock_irqsave(&channel->intent_lock, flags);
+	idr_for_each_entry(&channel->liids, tmp, iid) {
+		if (tmp->size >= size && tmp->reuse) {
+			intent = tmp;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&channel->intent_lock, flags);
+	if (intent) {
+		qcom_glink_send_intent_req_ack(glink, channel, !!intent);
+		return;
+	}
+
 	intent = qcom_glink_alloc_intent(glink, channel, size, false);
 	if (intent)
 		qcom_glink_advertise_intent(glink, channel, intent);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

