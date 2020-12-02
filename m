Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAE02CCA9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 00:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgLBXlq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 18:41:46 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:37025 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728745AbgLBXlo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 18:41:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606952479; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MyL4yGoUux7OD/Qa2VquWaUqKLRV4yAEWaAEF7F3WXg=; b=oLCxEZj1mhKLF20cOv+E1B3PbiyMM7aNGLRNKTiRZ+9VvUWO8NMQwdToIwAMfd2wNWq3/rr2
 xBNJzmBcKsclev95SGfLyaGAi+G+ecvpekK70zwAXVebXBpYX8ix4NGU6zrVwAUrJRIyT+Re
 6Efjib5qec6FKSm0/fjPRXBIiQY=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fc826057e5eb22240f680a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 23:40:53
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A094DC433ED; Wed,  2 Dec 2020 23:40:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA333C43461;
        Wed,  2 Dec 2020 23:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA333C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 6/7] bus: mhi: core: Remove __ prefix for MHI channel unprepare function
Date:   Wed,  2 Dec 2020 15:40:37 -0800
Message-Id: <1606952438-15321-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
References: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The __mhi_unprepare_channel() API does not require the __ prefix.
Get rid of it and make the internal function consistent with the
other function names.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 40d15ef..566507d 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1311,8 +1311,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	return -EINVAL;
 }
 
-static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
-				    struct mhi_chan *mhi_chan)
+static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
+				  struct mhi_chan *mhi_chan)
 {
 	int ret;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -1425,7 +1425,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 
 error_pre_alloc:
 	mutex_unlock(&mhi_chan->mutex);
-	__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+	mhi_unprepare_channel(mhi_cntrl, mhi_chan);
 
 	return ret;
 }
@@ -1542,7 +1542,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+		mhi_unprepare_channel(mhi_cntrl, mhi_chan);
 	}
 
 	return ret;
@@ -1560,7 +1560,7 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+		mhi_unprepare_channel(mhi_cntrl, mhi_chan);
 	}
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

