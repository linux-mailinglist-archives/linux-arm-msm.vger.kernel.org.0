Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048BC1D88C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 22:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgERUEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 16:04:11 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:53884 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726643AbgERUEK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 16:04:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589832250; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WtCai6MGhxuzdSIhzrBk8peP2PRVG7nGN65j0w8gzus=; b=xgqwpuT+0Wa8z53FaL++PUSmtAwixvT3xy5XemtNLbsCAREGQB/UOLzJ2msrtJMZeakPLkyR
 pa+cQH36vbOfy6NdSGKXhZQrjNHpXQ5tvu+m2/EscS7oHlqFR9VrxqEXAINRlOyFYRRFOT1c
 jQqiGX1HByimZrKIRaF/jiAEJYQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec2ea39.7f5ff57b73e8-smtp-out-n02;
 Mon, 18 May 2020 20:04:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2DC50C44791; Mon, 18 May 2020 20:04:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 459D4C43636;
        Mon, 18 May 2020 20:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 459D4C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 3/7] bus: mhi: core: Use generic name field for an MHI device
Date:   Mon, 18 May 2020 13:03:57 -0700
Message-Id: <1589832241-13867-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An MHI device is not necessarily associated with only channels as we can
have one associated with the controller itself. Hence, the chan_name
field within the mhi_device structure should instead be replaced with a
generic name to accurately reflect any type of MHI device.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 5 +++--
 drivers/bus/mhi/core/main.c | 6 +++---
 include/linux/mhi.h         | 8 ++++----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index b7b5f7f..0d39779 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -904,6 +904,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
 	mhi_dev->mhi_cntrl = mhi_cntrl;
 	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->cntrl_dev));
+	mhi_dev->name = dev_name(mhi_cntrl->cntrl_dev);
 
 	/* Init wakeup source */
 	device_init_wakeup(&mhi_dev->dev, true);
@@ -1252,7 +1253,7 @@ static int mhi_uevent(struct device *dev, struct kobj_uevent_env *env)
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 
 	return add_uevent_var(env, "MODALIAS=" MHI_DEVICE_MODALIAS_FMT,
-					mhi_dev->chan_name);
+					mhi_dev->name);
 }
 
 static int mhi_match(struct device *dev, struct device_driver *drv)
@@ -1269,7 +1270,7 @@ static int mhi_match(struct device *dev, struct device_driver *drv)
 		return 0;
 
 	for (id = mhi_drv->id_table; id->chan[0]; id++)
-		if (!strcmp(mhi_dev->chan_name, id->chan)) {
+		if (!strcmp(mhi_dev->name, id->chan)) {
 			mhi_dev->id = id;
 			return 1;
 		}
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 1f622ce..bafc12a 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -249,7 +249,7 @@ int mhi_destroy_device(struct device *dev, void *data)
 		put_device(&mhi_dev->dl_chan->mhi_dev->dev);
 
 	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
-		 mhi_dev->chan_name);
+		 mhi_dev->name);
 
 	/* Notify the client and remove the device from MHI bus */
 	device_del(dev);
@@ -327,10 +327,10 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 		}
 
 		/* Channel name is same for both UL and DL */
-		mhi_dev->chan_name = mhi_chan->name;
+		mhi_dev->name = mhi_chan->name;
 		dev_set_name(&mhi_dev->dev, "%s_%s",
 			     dev_name(mhi_cntrl->cntrl_dev),
-			     mhi_dev->chan_name);
+			     mhi_dev->name);
 
 		/* Init wakeup source if available */
 		if (mhi_dev->dl_chan && mhi_dev->dl_chan->wake_capable)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 10fcb52..9b7bf28 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -439,10 +439,10 @@ struct mhi_controller {
 };
 
 /**
- * struct mhi_device - Structure representing a MHI device which binds
- *                     to channels
+ * struct mhi_device - Structure representing an MHI device which binds
+ *                     to channels or is associated with controllers
  * @id: Pointer to MHI device ID struct
- * @chan_name: Name of the channel to which the device binds
+ * @name: Name of the associated MHI device
  * @mhi_cntrl: Controller the device belongs to
  * @ul_chan: UL channel for the device
  * @dl_chan: DL channel for the device
@@ -454,7 +454,7 @@ struct mhi_controller {
  */
 struct mhi_device {
 	const struct mhi_device_id *id;
-	const char *chan_name;
+	const char *name;
 	struct mhi_controller *mhi_cntrl;
 	struct mhi_chan *ul_chan;
 	struct mhi_chan *dl_chan;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
