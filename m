Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C2B2EF9AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 21:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbhAHU4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 15:56:12 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:33067 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbhAHU4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 15:56:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610139353; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wZhhI3WIjbbH4RqH1eCzwajCfWCHwYPEW0BZAnQnUmE=; b=vamA1D/ZsElzX56WKu87s3w+w175C+NLkzBnvBCbp6l3lVJFmC5hVmcbB8I/uAifiT9Rufnn
 V0BHZ6sWo3rTJh5LuzAuDKv6XrhIXsP5z8vEwwbci9WN7y1N867bYNamttDk1NcuNcNa0IYz
 /Pcc7+Myx/sZz4mCxX5zlx8lfsw=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5ff8c6acd84bad35476d8d80 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 20:55:08
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EED7FC43464; Fri,  8 Jan 2021 20:55:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4862DC43462;
        Fri,  8 Jan 2021 20:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4862DC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v5 6/9] bus: mhi: core: Check channel execution environment before issuing reset
Date:   Fri,  8 Jan 2021 12:54:54 -0800
Message-Id: <1610139297-36435-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
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
 drivers/bus/mhi/core/main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index a84e6aa..ec720fe 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1351,11 +1351,24 @@ static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
 	/* no more processing events for this channel */
 	mutex_lock(&mhi_chan->mutex);
 
+	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
+		dev_err(dev,
+			"Current EE: %s Required EE Mask: 0x%x for chan: %s\n",
+			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask,
+			mhi_chan->name);
+		goto exit_unprepare_channel;
+	}
+
 	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
 				       MHI_CH_STATE_TYPE_RESET);
 	if (ret)
 		dev_err(dev, "Failed to reset channel, still resetting\n");
 
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

