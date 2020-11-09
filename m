Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509EB2AC8C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 23:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgKIWo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 17:44:28 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:48032 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730562AbgKIWo1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 17:44:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604961866; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ozb4rXuUlXegWkzSJNNOhg+Z7MmnJTGsU18IDX4yicg=; b=pGBY0iB6qPL30w6AgMR0oy+tZO/DoS9trI1/t/1v70+7HqHwxMHDnJei5wpVmu+yboK+Tpjl
 gL1N4iil7NeF+RSW1bJVVDy428P7xqDzWgWB3zTDARv7rqhBlrEP0Kdtxpm0IPkdMWDsKIWw
 Tln7k5xtvLvMIO4sJN2yWJTn3/c=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fa9c6438723a97b70343709 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 22:44:19
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43C90C433C9; Mon,  9 Nov 2020 22:44:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C57BC433C8;
        Mon,  9 Nov 2020 22:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C57BC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 3/4] bus: mhi: core: Add support to pause or resume channel data transfers
Date:   Mon,  9 Nov 2020 14:44:09 -0800
Message-Id: <1604961850-27671-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org>
References: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some MHI clients may want to request for pausing or resuming of the
data transfers for their channels. Enable them to do so using the new
APIs provided for the same.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         | 16 ++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 1226933..01845c6 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
 }
 EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
 
+static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
+				     enum mhi_ch_state_type to_state)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan;
+	int dir, ret;
+
+	for (dir = 0; dir < 2; dir++) {
+		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
+
+		if (!mhi_chan)
+			continue;
+
+		/*
+		 * Bail out if one of the channels fail as client will reset
+		 * both upon failure
+		 */
+		mutex_lock(&mhi_chan->mutex);
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
+int mhi_pause_transfer(struct mhi_device *mhi_dev)
+{
+	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
+}
+EXPORT_SYMBOL_GPL(mhi_pause_transfer);
+
+int mhi_resume_transfer(struct mhi_device *mhi_dev)
+{
+	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
+}
+EXPORT_SYMBOL_GPL(mhi_resume_transfer);
+
 int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 52b3c60..4d48d49 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -702,6 +702,22 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
 
 /**
+ * mhi_pause_transfer - Pause ongoing channel activity
+ * Moves both UL and DL channels to STOP state to halt
+ * pending transfers.
+ * @mhi_dev: Device associated with the channels
+ */
+int mhi_pause_transfer(struct mhi_device *mhi_dev);
+
+/**
+ * mhi_resume_transfer - Resume channel activity
+ * Moves both UL and DL channels to START state to
+ * resume transfers.
+ * @mhi_dev: Device associated with the channels
+ */
+int mhi_resume_transfer(struct mhi_device *mhi_dev);
+
+/**
  * mhi_poll - Poll for any available data in DL direction
  * @mhi_dev: Device associated with the channels
  * @budget: # of events to process
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

