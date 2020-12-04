Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0523F2CE50C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 02:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389527AbgLDBYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 20:24:25 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:54248 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389512AbgLDBYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 20:24:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607045044; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jmElnHe1+2l43h1858NanLu6cQMTtzEJ0rhF1HXaBNs=; b=wd9Bd4eS21f9EuTikrjBf33/I302toG/5uSYVBKYWgkBFqH4XUnX5ybXEm7CRBWP5cTta4o8
 /cuF23Tjk81YdlqEUEAvr47lVFHTp1sh2v11R8l+FF4xvLLZcAMIMVLkmJLRZSNx30I7VEcW
 /zt6QvLOrY+NFUHvGlgJeVdCIsw=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fc98f91c0eb5c23b3d8db32 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Dec 2020 01:23:29
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78E6EC433CA; Fri,  4 Dec 2020 01:23:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A7FFC43461;
        Fri,  4 Dec 2020 01:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A7FFC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 5/8] bus: mhi: core: Add support to stop or start channel data transfers
Date:   Thu,  3 Dec 2020 17:23:14 -0800
Message-Id: <1607044997-19577-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607044997-19577-1-git-send-email-bbhatt@codeaurora.org>
References: <1607044997-19577-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some MHI client drivers may want to request a pause or halt of
data transfer activity on their channels. Support for this does
not exist and must be introduced, wherein the channel context is
not reset or cleared but only the STOP channel command is issued.
This would need to be paired with an API that allows resuming the
data transfer activity on channels by use of the START channel
command. Enable this using two new APIs, mhi_start_transfer() and
mhi_stop_transfer().

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         | 19 +++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 4cc5ced..064f313 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1552,6 +1552,56 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
 
+static int mhi_update_transfer_state(strquct mhi_device *mhi_dev,
+				     enum mhi_ch_state_type to_state)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_chan *mhi_chan;
+	struct mhi_chan_ctxt *chan_ctxt;
+	int dir, ret;
+
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		/*
+		 * Bail out if one of the channels fails as client will reset
+		 * both upon failure
+		 */
+		mutex_lock(&mhi_chan->mutex);
+		chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
+		if (!(chan_ctxt->chcfg & CHAN_CTX_CHSTATE_MASK)) {
+			mutex_unlock(&mhi_chan->mutex);
+			dev_err(dev, "Channel %s(%u) context not initialized\n",
+				mhi_chan->name, mhi_chan->chan);
+			return -EINVAL;
+		}
+		ret = mhi_update_channel_state(mhi_cntrl, mhi_chan, to_state);
+		if (ret) {
+			mutex_unlock(&mhi_chan->mutex);
+			return ret;
+		}
+		mutex_unlock(&mhi_chan->mutex);
+	}
+
+	return 0;
+}
+
+int mhi_stop_transfer(struct mhi_device *mhi_dev)
+{
+	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
+}
+EXPORT_SYMBOL_GPL(mhi_stop_transfer);
+
+int mhi_start_transfer(struct mhi_device *mhi_dev)
+{
+	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
+}
+EXPORT_SYMBOL_GPL(mhi_start_transfer);
+
 int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index aa9757e..35779a0 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -704,6 +704,25 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
 
 /**
+ * mhi_stop_transfer - Pauses ongoing channel activity by issuing the STOP
+ *                     channel command to both UL and DL channels. This command
+ *                     does not reset the channel context and the client drivers
+ *                     can issue mhi_start_transfer to resume activity.
+ * @mhi_dev: Device associated with the channels
+ */
+int mhi_stop_transfer(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_start_transfer - Resumes channel activity by issuing the START channel
+ *                      command to both UL and DL channels. This command assumes
+ *                      the channel context is already setup and the client
+ *                      drivers can issue mhi_stop_transfer to pause activity if
+ *                      required.
+ * @mhi_dev: Device associated with the channels
+ */
+int mhi_start_transfer(struct mhi_device *mhi_dev);
+
+/**
  * mhi_poll - Poll for any available data in DL direction
  * @mhi_dev: Device associated with the channels
  * @budget: # of events to process
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

