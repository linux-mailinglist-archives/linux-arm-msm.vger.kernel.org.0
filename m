Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980E334DE03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhC3CMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:12:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53954 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230286AbhC3CMN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:12:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617070333; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=gQdSqYza0ml6Zvareli8ZWmmqC8V0OnIZwmqqaQ5MVI=; b=MMoINW9ZfBK8o/pm9akQqmhFm89XKDi9JX0sSEnu0mfFS6FpVCA+MoBgVBFE7EtIOFgQB/RM
 E3t0yNTmtTIeHbROnb9t98HkFJNo0E5IWXAvj5gUzBbv4T+UYczevF5z0+VumMPOL1A6aWTo
 osfPXH8nXol116r0pX39MBWhiy0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 606288fd0a4a07ffda6ac2a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 02:12:13
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30891C43461; Tue, 30 Mar 2021 02:12:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E72B8C43461;
        Tue, 30 Mar 2021 02:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E72B8C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v7 5/7] bus: mhi: core: Check channel execution environment before issuing reset
Date:   Mon, 29 Mar 2021 19:11:45 -0700
Message-Id: <1617070307-5775-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617070307-5775-1-git-send-email-bbhatt@codeaurora.org>
References: <1617070307-5775-1-git-send-email-bbhatt@codeaurora.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 6c3234e..f34f8f6 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1303,6 +1303,12 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 
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
@@ -1310,6 +1316,11 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
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

