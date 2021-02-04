Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8703F30FE5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240186AbhBDUaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:30:21 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:14987 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240153AbhBDU3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:29:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612470535; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tlu7PWAMGVt9HqTkQiUIvlC9WqfOxu6gg/Q4MJVA5eE=; b=LQ5T95d9N0dzo8DKOemcctOB3CzYk50NphxtxAqMogZ2UFN0zz/muYS3loHDN6ehsV2Gxdt3
 VCJc2CLaGWpsx/1JYJKHhy16uzJwHIZY2dOzuGSODPxijaTefg/vmfKdoLtn9P2hyWfS57lA
 BYlBlB42XbSquYV6xUiVXV5JqT8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 601c58e08e43a988b7525f7f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 20:28:16
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9A992C43463; Thu,  4 Feb 2021 20:28:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D31D0C43464;
        Thu,  4 Feb 2021 20:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D31D0C43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 5/8] bus: mhi: core: Check channel execution environment before issuing reset
Date:   Thu,  4 Feb 2021 12:28:03 -0800
Message-Id: <1612470486-10440-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
References: <1612470486-10440-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A client can attempt to unprepare certain channels for transfer even
after the execution environment they are supposed to run in has changed.
In the event that happens, the device need not be notified of the reset
and the host can proceed with clean up for the channel context and
memory allocated for it on the host as the device will no longer be able
to respond to such a request.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 2f6fdb2..f511e3a 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1283,6 +1283,12 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 
 	mutex_lock(&mhi_chan->mutex);
 
+	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
+		dev_dbg(dev, "Current EE: %s Required EE Mask: 0x%x\n",
+			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask);
+		goto exit_unprepare_channel;
+	}
+
 	/* no more processing events for this channel */
 	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
 				       MHI_CH_STATE_TYPE_RESET);
@@ -1290,6 +1296,11 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 		dev_err(dev, "%d: Failed to reset channel, still resetting\n",
 			mhi_chan->chan);
 
+exit_unprepare_channel:
+	write_lock_irq(&mhi_chan->lock);
+	mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
+	write_unlock_irq(&mhi_chan->lock);
+
 	if (!mhi_chan->offload_ch) {
 		mhi_reset_chan(mhi_cntrl, mhi_chan);
 		mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

