Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF95352169
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbhDAVQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:16:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33124 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234649AbhDAVQb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:16:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617311791; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pdpDO14UwF2Vs0wHRzOUe16xHfmqgtibnCCZkg/pBlo=; b=TL9FMvqfPVPusqtnEHmbDIOZPXX23RGcQ1iUyz3enDxI/iD6O42KIJE/VPE2k3mi3ZBhFiZI
 G1acNcuIhcBa+7HtRrLiXPkbySm8XT2PUS0GIp96vtruhKKkSI7bPHJ3Uf+FZ6xdHjg43ZAk
 hwtWCGDPifmc+L6XTFf8ZEE6lVo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6066382e74f773a66493fbc2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 21:16:30
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F22AC43463; Thu,  1 Apr 2021 21:16:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E922C43463;
        Thu,  1 Apr 2021 21:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0E922C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v8 5/9] bus: mhi: core: Hold device wake for channel update commands
Date:   Thu,  1 Apr 2021 14:16:14 -0700
Message-Id: <1617311778-1254-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI host can fail early if device is in a bad state by attempting
to assert device wake and holding the runtime PM vote before
sending a channel update command instead of performing a wake
toggle and waiting for a timeout if the send were to fail. This
can help improve the design and enable shorter wait periods for
device to respond as votes are already held.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 94fdbf7..989a2a8 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1278,16 +1278,18 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 		return -EINVAL;
 	}
 
-	mhi_cntrl->wake_toggle(mhi_cntrl);
+	/* bring host and device out of suspended states */
+	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
+	if (ret)
+		return ret;
 	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
 	if (ret) {
 		dev_err(dev, "%d: Failed to send %s channel command\n",
 			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
-		return ret;
+		goto exit_channel_update;
 	}
 
 	ret = wait_for_completion_timeout(&mhi_chan->completion,
@@ -1296,9 +1298,12 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 		dev_err(dev,
 			"%d: Failed to receive %s channel command completion\n",
 			mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
-		return -EIO;
+		ret = -EIO;
+		goto exit_channel_update;
 	}
 
+	ret = 0;
+
 	if (to_state != MHI_CH_STATE_TYPE_RESET) {
 		write_lock_irq(&mhi_chan->lock);
 		mhi_chan->ch_state = (to_state == MHI_CH_STATE_TYPE_START) ?
@@ -1309,7 +1314,11 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	dev_dbg(dev, "%d: Channel state change to %s successful\n",
 		mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
 
-	return 0;
+exit_channel_update:
+	mhi_cntrl->runtime_put(mhi_cntrl);
+	mhi_device_put(mhi_cntrl->mhi_dev);
+
+	return ret;
 }
 
 static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

