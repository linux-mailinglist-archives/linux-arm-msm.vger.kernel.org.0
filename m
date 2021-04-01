Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9394535217B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhDAVRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:17:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39061 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234745AbhDAVRP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:17:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617311835; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pEQHSbTu9yyRJG7rdnF6GRVzPSxwx5P/b0wocRHhruk=; b=v4fXBhxdpw16m4RP6lSCoCMR+VvxUT3rnNeb9pjI8Lt3HqihqiyuWmnGqqv7nLJO/X7aZ2YM
 kOUbXwYo7hlX2yU+X925VXohG4yTbU+6E+sQ75kbsio/6DLX2fQBa0oVOXGAmONx0FwGHTD+
 5rTxd0inorpCMSfrBaEsorYd2qk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6066382d03cfff3452bb4d4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 21:16:29
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4D4CC43461; Thu,  1 Apr 2021 21:16:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5169BC43461;
        Thu,  1 Apr 2021 21:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5169BC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v8 4/9] bus: mhi: core: Update debug messages to use client device
Date:   Thu,  1 Apr 2021 14:16:13 -0700
Message-Id: <1617311778-1254-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Debug messages dealing with client devices use the generic MHI
controller or parent device along with a channel number. It would
be better to instead use the client device directly and enable
better log messages for channel updates.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 710ca0f..94fdbf7 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1238,7 +1238,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 				    struct mhi_chan *mhi_chan,
 				    enum mhi_ch_state_type to_state)
 {
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = &mhi_chan->mhi_dev->dev;
 	enum mhi_cmd_type cmd = MHI_CMD_NOP;
 	int ret;
 
@@ -1316,7 +1316,7 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 				    struct mhi_chan *mhi_chan)
 {
 	int ret;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = &mhi_chan->mhi_dev->dev;
 
 	mutex_lock(&mhi_chan->mutex);
 
@@ -1340,13 +1340,11 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 			struct mhi_chan *mhi_chan)
 {
 	int ret = 0;
-	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct device *dev = &mhi_chan->mhi_dev->dev;
 
 	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
-		dev_err(dev,
-			"Current EE: %s Required EE Mask: 0x%x for chan: %s\n",
-			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask,
-			mhi_chan->name);
+		dev_err(dev, "Current EE: %s Required EE Mask: 0x%x\n",
+			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask);
 		return -ENOTCONN;
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

