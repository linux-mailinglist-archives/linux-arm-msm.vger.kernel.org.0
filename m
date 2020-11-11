Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C5A2AF8EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 20:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgKKTWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 14:22:02 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:31535 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727667AbgKKTVY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 14:21:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605122483; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ns2o0NGC2V4kXRlZQjTDCfkw5h6fvbIeBhpfPdZ+Jak=; b=lligCFoxMF+hKmKlVUpbKc2yLBBu+93sFfcvF+eniYIu8gXy1aEfRSYtldCimW3SHmGLTAEs
 zxAhGMGvDuVNI8Abt3Sf2MNHW1t4bht/w4fJWwpi27Y4GtdIB/IQeqKtHgYvSCZvMnsZdVcp
 ZXmwQXxdyxurfKiXcBFJ+zhUgaw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fac39b140d444612588dd15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 19:21:21
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91BE3C433C6; Wed, 11 Nov 2020 19:21:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 786F1C433F0;
        Wed, 11 Nov 2020 19:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 786F1C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 2/6] bus: mhi: core: Improvements to the channel handling state machine
Date:   Wed, 11 Nov 2020 11:21:09 -0800
Message-Id: <1605122473-12179-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable sending the stop channel command and
improve the channel handling state machine such that all commands
go through a common function. This can help ensure that the state
machine is not violated in any way and adheres to the MHI
specification.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c     |   6 ++
 drivers/bus/mhi/core/internal.h |  12 +++
 drivers/bus/mhi/core/main.c     | 163 ++++++++++++++++++++++++----------------
 3 files changed, 116 insertions(+), 65 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 4d34d62..c9b1de8 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -51,6 +51,12 @@ const char * const mhi_state_str[MHI_STATE_MAX] = {
 	[MHI_STATE_SYS_ERR] = "SYS_ERR",
 };
 
+const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
+	[MHI_CH_STATE_TYPE_RESET] = "RESET",
+	[MHI_CH_STATE_TYPE_STOP] = "STOP",
+	[MHI_CH_STATE_TYPE_START] = "START",
+};
+
 static const char * const mhi_pm_state_str[] = {
 	[MHI_PM_STATE_DISABLE] = "DISABLE",
 	[MHI_PM_STATE_POR] = "POR",
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 2df8de5..f4efb15 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -369,6 +369,18 @@ enum mhi_ch_state {
 	MHI_CH_STATE_ERROR = 0x5,
 };
 
+enum mhi_ch_state_type {
+	MHI_CH_STATE_TYPE_RESET,
+	MHI_CH_STATE_TYPE_STOP,
+	MHI_CH_STATE_TYPE_START,
+	MHI_CH_STATE_TYPE_MAX,
+};
+
+extern const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX];
+#define TO_CH_STATE_TYPE_STR(state) (((state) >= MHI_CH_STATE_TYPE_MAX) ? \
+				     "INVALID_STATE" : \
+				     mhi_ch_state_type_str[state])
+
 #define MHI_INVALID_BRSTMODE(mode) (mode != MHI_DB_BRST_DISABLE && \
 				    mode != MHI_DB_BRST_ENABLE)
 
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index ad881a1..1226933 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1220,56 +1220,120 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
-static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
-				    struct mhi_chan *mhi_chan)
+static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
+				    struct mhi_chan *mhi_chan,
+				    enum mhi_ch_state_type to_state)
 {
-	int ret;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_cmd_type cmd = MHI_CMD_NOP;
+	int ret = -EIO;
+
+	dev_dbg(dev, "Updating channel %s(%d) state to: %s\n", mhi_chan->name,
+		mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
+
+	switch (to_state) {
+	case MHI_CH_STATE_TYPE_RESET:
+		write_lock_irq(&mhi_chan->lock);
+		if (mhi_chan->ch_state != MHI_CH_STATE_STOP &&
+		    mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
+		    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
+			write_unlock_irq(&mhi_chan->lock);
+			goto exit_invalid_state;
+		}
+		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
+		write_unlock_irq(&mhi_chan->lock);
 
-	dev_dbg(dev, "Entered: unprepare channel:%d\n", mhi_chan->chan);
+		cmd = MHI_CMD_RESET_CHAN;
+		break;
+	case MHI_CH_STATE_TYPE_STOP:
+		if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
+			goto exit_invalid_state;
 
-	/* no more processing events for this channel */
-	mutex_lock(&mhi_chan->mutex);
-	write_lock_irq(&mhi_chan->lock);
-	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
-	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
-		write_unlock_irq(&mhi_chan->lock);
-		mutex_unlock(&mhi_chan->mutex);
-		return;
+		cmd = MHI_CMD_STOP_CHAN;
+		break;
+	case MHI_CH_STATE_TYPE_START:
+		if (mhi_chan->ch_state != MHI_CH_STATE_STOP &&
+		    mhi_chan->ch_state != MHI_CH_STATE_DISABLED)
+			goto exit_invalid_state;
+
+		cmd = MHI_CMD_START_CHAN;
+		break;
+	default:
+		goto exit_invalid_state;
 	}
 
-	mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
-	write_unlock_irq(&mhi_chan->lock);
+	/* bring host and device out of suspended states */
+	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
+	if (ret)
+		return ret;
+	mhi_cntrl->runtime_get(mhi_cntrl);
 
 	reinit_completion(&mhi_chan->completion);
-	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
-		read_unlock_bh(&mhi_cntrl->pm_lock);
-		goto error_invalid_state;
+	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
+	if (ret) {
+		dev_err(dev, "Failed to send %s(%d) %s command\n",
+			mhi_chan->name, mhi_chan->chan,
+			TO_CH_STATE_TYPE_STR(to_state));
+		goto exit_command_failure;
 	}
 
-	mhi_cntrl->wake_toggle(mhi_cntrl);
-	read_unlock_bh(&mhi_cntrl->pm_lock);
+	ret = wait_for_completion_timeout(&mhi_chan->completion,
+				       msecs_to_jiffies(mhi_cntrl->timeout_ms));
+	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS) {
+		dev_err(dev, "Failed to receive %s(%d) %s command completion\n",
+			mhi_chan->name, mhi_chan->chan,
+			TO_CH_STATE_TYPE_STR(to_state));
+		ret = -EIO;
+		goto exit_command_failure;
+	}
 
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	ret = 0;
+
+	if (to_state != MHI_CH_STATE_TYPE_RESET) {
+		write_lock_irq(&mhi_chan->lock);
+		mhi_chan->ch_state = (to_state == MHI_CH_STATE_TYPE_START) ?
+				      MHI_CH_STATE_ENABLED : MHI_CH_STATE_STOP;
+		write_unlock_irq(&mhi_chan->lock);
+	}
+
+	dev_dbg(dev, "Channel %s(%d) state change to %s successful\n",
+		mhi_chan->name, mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
+
+exit_command_failure:
 	mhi_cntrl->runtime_put(mhi_cntrl);
-	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_RESET_CHAN);
-	if (ret)
-		goto error_invalid_state;
+	mhi_device_put(mhi_cntrl->mhi_dev);
 
-	/* even if it fails we will still reset */
-	ret = wait_for_completion_timeout(&mhi_chan->completion,
-				msecs_to_jiffies(mhi_cntrl->timeout_ms));
-	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS)
-		dev_err(dev,
-			"Failed to receive cmd completion, still resetting\n");
+	return ret;
+
+exit_invalid_state:
+	dev_err(dev, "Channel %s(%d) update to %s not allowed\n",
+		mhi_chan->name, mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
+
+	return -EINVAL;
+}
+
+static void __mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
+				    struct mhi_chan *mhi_chan)
+{
+	int ret;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+
+	dev_dbg(dev, "Entered: unprepare channel:%d\n", mhi_chan->chan);
+
+	/* no more processing events for this channel */
+	mutex_lock(&mhi_chan->mutex);
+
+	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
+				       MHI_CH_STATE_TYPE_RESET);
+	if (ret)
+		dev_err(dev, "Failed to reset channel, still resetting\n");
 
-error_invalid_state:
 	if (!mhi_chan->offload_ch) {
 		mhi_reset_chan(mhi_cntrl, mhi_chan);
 		mhi_deinit_chan_ctxt(mhi_cntrl, mhi_chan);
 	}
-	dev_dbg(dev, "chan:%d successfully resetted\n", mhi_chan->chan);
+	dev_dbg(dev, "chan:%d successfully reset\n", mhi_chan->chan);
+
 	mutex_unlock(&mhi_chan->mutex);
 }
 
@@ -1291,14 +1355,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 
 	mutex_lock(&mhi_chan->mutex);
 
-	/* If channel is not in disable state, do not allow it to start */
-	if (mhi_chan->ch_state != MHI_CH_STATE_DISABLED) {
-		ret = -EIO;
-		dev_dbg(dev, "channel: %d is not in disabled state\n",
-			mhi_chan->chan);
-		goto error_init_chan;
-	}
-
 	/* Check of client manages channel context for offload channels */
 	if (!mhi_chan->offload_ch) {
 		ret = mhi_init_chan_ctxt(mhi_cntrl, mhi_chan);
@@ -1306,34 +1362,11 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 			goto error_init_chan;
 	}
 
-	reinit_completion(&mhi_chan->completion);
-	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
-		read_unlock_bh(&mhi_cntrl->pm_lock);
-		ret = -EIO;
-		goto error_pm_state;
-	}
-
-	mhi_cntrl->wake_toggle(mhi_cntrl);
-	read_unlock_bh(&mhi_cntrl->pm_lock);
-	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
-
-	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, MHI_CMD_START_CHAN);
+	ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
+				       MHI_CH_STATE_TYPE_START);
 	if (ret)
 		goto error_pm_state;
 
-	ret = wait_for_completion_timeout(&mhi_chan->completion,
-				msecs_to_jiffies(mhi_cntrl->timeout_ms));
-	if (!ret || mhi_chan->ccs != MHI_EV_CC_SUCCESS) {
-		ret = -EIO;
-		goto error_pm_state;
-	}
-
-	write_lock_irq(&mhi_chan->lock);
-	mhi_chan->ch_state = MHI_CH_STATE_ENABLED;
-	write_unlock_irq(&mhi_chan->lock);
-
 	/* Pre-allocate buffer for xfer ring */
 	if (mhi_chan->pre_alloc) {
 		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

