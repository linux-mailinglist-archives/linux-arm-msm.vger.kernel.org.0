Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AADC2165AC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 10:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgBTJ70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 04:59:26 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35501 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgBTJ70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 04:59:26 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so1367671plt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aerIspTcQuvTy6TBw8QpvvhIG4B1oskXhQQ/p9S+DRU=;
        b=eJNpZQnbdyMJoUMxUqOHB+fOUgKXJ9+LnfhKK9svtBL/CMQSx39dkSYSWFAdHu/408
         +1UeU8MR3npKOuHXLQtRmrsNIyMUicLviw01/JLehUTEj6yVWJJ7xSQoyPaOHN0gIlvb
         uo49pJNCJWCkJWPnVsZtRXawAaxYOuuVzMRmjY7C0pyjPgCn9FMHKFwIf77hx9Hn/MDs
         fELKKx0TKmKQmg4Oq3COcItcMt7+eQPO//U2YZyjC1G/7WNNJALEmI8RGy86g+KAV92z
         fwMSDP83JaZuv42R1yJ9bU+gOfAVLCQBgDxWWZgwR1F3mmNdwkakQi1XbbfXm2ilYduv
         gpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aerIspTcQuvTy6TBw8QpvvhIG4B1oskXhQQ/p9S+DRU=;
        b=DhigM89752LnrVUSEkoK2VEljuIdif6ApDTZz+P3WhIexFg0dEKaP0/tE2zGncRzZi
         SqnVN/lPZVQYjNpRv6Sk/Jjr2YqoG5M81ahwS+QkU2gfR8XxPhMSMgQNwXPIskYpVrjU
         fIpuAuYqDqpEe3rzPPTKW8lWGk1GBQjHFu6KTAdysc410+W5As3WxQ5bpZ1Qa95VWfd4
         p5nTYyeSmD/dRRVcM9QVra56wuiVcBW7gtPO8tzBrugtZXuiEvrOXbI6i2IO7cFtAM+T
         xMCY5W9kA0vhHYU34Z0Un08dDRqk6dlL+l/W34PQ41q2D5nRbYgOfLFE6AP/SNAudGRW
         QeCg==
X-Gm-Message-State: APjAAAU4HAluXBEmoooSBPezrrKxdvLsP/Zaa1g7rIczIoBXy4JJcYOG
        PnOvx+Sz5DDhR4EHOr8PKV1k
X-Google-Smtp-Source: APXvYqwudhukGq/0/0oKK+MoqFDXtFDIDhhUzCPKwG2/GM/zlpBba8PqTiEuwfuE07r7Xhqmu4zfww==
X-Received: by 2002:a17:90a:cf11:: with SMTP id h17mr2663344pju.103.1582192765200;
        Thu, 20 Feb 2020 01:59:25 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:315:9501:edda:4222:88ae:442f])
        by smtp.gmail.com with ESMTPSA id b3sm2678644pjo.30.2020.02.20.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 01:59:24 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 04/16] bus: mhi: core: Add support for creating and destroying MHI devices
Date:   Thu, 20 Feb 2020 15:28:42 +0530
Message-Id: <20200220095854.4804-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for creating and destroying MHI devices. The
MHI devices binds to the MHI channels and are used to transfer data
between MHI host and client device.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/989

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[mani: splitted from pm patch and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/Makefile |   2 +-
 drivers/bus/mhi/core/main.c   | 123 ++++++++++++++++++++++++++++++++++
 include/linux/mhi.h           |   2 +
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/mhi/core/main.c

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 2db32697c67f..77f7730da4bf 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_MHI_BUS) := mhi.o
 
-mhi-y := init.o
+mhi-y := init.o main.o
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
new file mode 100644
index 000000000000..7c35744ec0c0
--- /dev/null
+++ b/drivers/bus/mhi/core/main.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include "internal.h"
+
+int mhi_destroy_device(struct device *dev, void *data)
+{
+	struct mhi_device *mhi_dev;
+	struct mhi_controller *mhi_cntrl;
+
+	if (dev->bus != &mhi_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_device(dev);
+	mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	/* Only destroy virtual devices thats attached to bus */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
+		 mhi_dev->chan_name);
+
+	/* Notify the client and remove the device from MHI bus */
+	device_del(dev);
+	put_device(dev);
+
+	return 0;
+}
+
+static void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
+{
+	struct mhi_driver *mhi_drv;
+
+	if (!mhi_dev->dev.driver)
+		return;
+
+	mhi_drv = to_mhi_driver(mhi_dev->dev.driver);
+
+	if (mhi_drv->status_cb)
+		mhi_drv->status_cb(mhi_dev, cb_reason);
+}
+
+/* Bind MHI channels to MHI devices */
+void mhi_create_devices(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_chan *mhi_chan;
+	struct mhi_device *mhi_dev;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int i, ret;
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		if (!mhi_chan->configured || mhi_chan->mhi_dev ||
+		    !(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
+			continue;
+		mhi_dev = mhi_alloc_device(mhi_cntrl);
+		if (!mhi_dev)
+			return;
+
+		mhi_dev->dev_type = MHI_DEVICE_XFER;
+		switch (mhi_chan->dir) {
+		case DMA_TO_DEVICE:
+			mhi_dev->ul_chan = mhi_chan;
+			mhi_dev->ul_chan_id = mhi_chan->chan;
+			break;
+		case DMA_FROM_DEVICE:
+			/* We use dl_chan as offload channels */
+			mhi_dev->dl_chan = mhi_chan;
+			mhi_dev->dl_chan_id = mhi_chan->chan;
+			break;
+		default:
+			dev_err(dev, "Direction not supported\n");
+			put_device(&mhi_dev->dev);
+			return;
+		}
+
+		get_device(&mhi_dev->dev);
+		mhi_chan->mhi_dev = mhi_dev;
+
+		/* Check next channel if it matches */
+		if ((i + 1) < mhi_cntrl->max_chan && mhi_chan[1].configured) {
+			if (!strcmp(mhi_chan[1].name, mhi_chan->name)) {
+				i++;
+				mhi_chan++;
+				if (mhi_chan->dir == DMA_TO_DEVICE) {
+					mhi_dev->ul_chan = mhi_chan;
+					mhi_dev->ul_chan_id = mhi_chan->chan;
+				} else {
+					mhi_dev->dl_chan = mhi_chan;
+					mhi_dev->dl_chan_id = mhi_chan->chan;
+				}
+				get_device(&mhi_dev->dev);
+				mhi_chan->mhi_dev = mhi_dev;
+			}
+		}
+
+		/* Channel name is same for both UL and DL */
+		mhi_dev->chan_name = mhi_chan->name;
+		dev_set_name(&mhi_dev->dev, "%04x_%s", mhi_chan->chan,
+			     mhi_dev->chan_name);
+
+		/* Init wakeup source if available */
+		if (mhi_dev->dl_chan && mhi_dev->dl_chan->wake_capable)
+			device_init_wakeup(&mhi_dev->dev, true);
+
+		ret = device_add(&mhi_dev->dev);
+		if (ret)
+			put_device(&mhi_dev->dev);
+	}
+}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 7e6b7743c705..1ce2bdd5f2f4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -163,6 +163,7 @@ enum mhi_db_brst_mode {
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
  * @auto_queue: Framework will automatically queue buffers for DL traffic
  * @auto_start: Automatically start (open) this channel
+ * @wake-capable: Channel capable of waking up the system
  */
 struct mhi_channel_config {
 	char *name;
@@ -180,6 +181,7 @@ struct mhi_channel_config {
 	bool doorbell_mode_switch;
 	bool auto_queue;
 	bool auto_start;
+	bool wake_capable;
 };
 
 /**
-- 
2.17.1

