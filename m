Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B092AF8EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 20:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgKKTVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 14:21:53 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:33184 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727690AbgKKTVZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 14:21:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605122485; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MFeuq/jM+czwRtZuRPr1+aKJgIIR8f/q33eaV7OheJ0=; b=TjzRvEqm6yQS1G4AiOnkTz4AxBpbfGwoE9+0fcH+sZMNIU+SAieZ0oqyjeRFxkpulWGiV7u4
 3ApUPoK7xfwGtUo6vSmtekQqO5DMF1SRkKVVN0EFFIr8dgwQcVK7gN67mGZF4tEa4ihWxUAY
 ogRHOmpAcksbJ/vnfs1cZnHjDL4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fac39b38bd2e3c2225e342c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 19:21:23
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69FE5C433C8; Wed, 11 Nov 2020 19:21:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9555EC433C9;
        Wed, 11 Nov 2020 19:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9555EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 5/6] bus: mhi: core: Remove __ prefix for MHI channel unprepare function
Date:   Wed, 11 Nov 2020 11:21:12 -0800
Message-Id: <1605122473-12179-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The __mhi_unprepare_channel() API does not require the __ prefix.
Get rid of it and make the internal function consistent with the
other function names.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index e8af85a..19156d4 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1312,8 +1312,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	return -EINVAL;
 }
 
-static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
-				    struct mhi_chan *mhi_chan)
+static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
+				  struct mhi_chan *mhi_chan)
 {
 	int ret;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -1433,7 +1433,7 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 
 error_pre_alloc:
 	mutex_unlock(&mhi_chan->mutex);
-	__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+	mhi_unprepare_channel(mhi_cntrl, mhi_chan);
 
 	return ret;
 }
@@ -1550,7 +1550,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
 		if (!mhi_chan)
 			continue;
 
-		__mhi_unprepare_channel(mhi_cntrl, mhi_chan);
+		mhi_unprepare_channel(mhi_cntrl, mhi_chan);
 	}
 
 	return ret;
@@ -1568,7 +1568,7 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
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

