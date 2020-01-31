Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5AF814EDDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728985AbgAaNuk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:50:40 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37474 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728941AbgAaNud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:33 -0500
Received: by mail-pg1-f193.google.com with SMTP id q127so3494264pga.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8dK9XNz2I3CaSJJsnAGZPCgGDYdi5uxrBA6u5jPVd5w=;
        b=gAX2ubVOAptk9tk/HM+pKjjUiCzeplaheMrM2x8ntCPgvgzJGmE9gkoeB/Qq1ChFxD
         m/HkkqsYWMY4G3bn8+dyIilaaqXr4fnuFWdIZ2PuHM+8KqxXwSpS/yj1rLK9qzcAv6wW
         0YTZDX3ugCX3gBGdBwVLY27w88T0yXkGMOwp8Arbl6mzSLqaUfx1nX3J4x8PG0cDFl2F
         XiU3fGXRmE46Om5FiRzFs9rda26BuXfauj7BmVaNPKVEQ3R5pQCt6H29CVUrQHhwRlAO
         fmJa40OtQ0wnLZ7DSSzOR8tBTdhUecqeFaFA1776i3g0PJQBH0NXfO2i6YPJqrOjVFBB
         MYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8dK9XNz2I3CaSJJsnAGZPCgGDYdi5uxrBA6u5jPVd5w=;
        b=BYPJozAreCgQPSSXkQ66K9fUGyKp3VRlgH6MPH0su+CqUebTxHpdNdrXhCrgUlaaZ6
         X2EvB05VsrLy48S/GWMPKmGxQieAnUOik/5OiN41N3s3VtnAwWlv2mAu/jhJ5wuv7j4u
         ckwaNE4IsxlVY5jOxNveWhcYipflS+NmO2bDQ+664IU1Y+EZbIy7rdTAFe17YFum/DKa
         uN5Or5fk3uxrvFdLJcxBLt9+Fhf+W2nnduQx6AZgmeNhm9RNAZgFqrRTLNom7j4l+Xuk
         OMP3k38ERvUeNoHQZ8acwZRZfH8RSSk278kGueBpy97fA6jgk2kBHwr4w5tX9stLMaQB
         rKdA==
X-Gm-Message-State: APjAAAWkt6yY09PAKinAZViaPxCmqd5f7kBqPD7co6Jm7yJDLLabv3SK
        3TzWffF5dScbCx2BBQrexbJV
X-Google-Smtp-Source: APXvYqyS6Eioog5W/koibnI5uVN3daQWkmi+/Cm+J4wszaeQPov6S7WobHMpbcZ8mFLIW5G/C4MO6A==
X-Received: by 2002:a63:f62:: with SMTP id 34mr10823918pgp.184.1580478633146;
        Fri, 31 Jan 2020 05:50:33 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:32 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 04/16] bus: mhi: core: Add support for creating and destroying MHI devices
Date:   Fri, 31 Jan 2020 19:19:57 +0530
Message-Id: <20200131135009.31477-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
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
index 000000000000..216fd8691140
--- /dev/null
+++ b/drivers/bus/mhi/core/main.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#define dev_fmt(fmt) "MHI: " fmt
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
+	if (mhi_dev->dev_type ==  MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	dev_dbg(mhi_cntrl->dev, "destroy device for chan:%s\n",
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
+	int i;
+	struct mhi_chan *mhi_chan;
+	struct mhi_device *mhi_dev;
+	int ret;
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
+			dev_err(mhi_cntrl->dev, "Direction not supported\n");
+			mhi_dealloc_device(mhi_cntrl, mhi_dev);
+			return;
+		}
+
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
+			mhi_dealloc_device(mhi_cntrl, mhi_dev);
+	}
+}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 137f1891701f..5cbc1e33829f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -186,6 +186,7 @@ enum mhi_db_brst_mode {
  * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
  * @auto_queue: Framework will automatically queue buffers for DL traffic
  * @auto_start: Automatically start (open) this channel
+ * @wake-capable: Channel capable of waking up the system
  */
 struct mhi_channel_config {
 	char *name;
@@ -204,6 +205,7 @@ struct mhi_channel_config {
 	bool doorbell_mode_switch;
 	bool auto_queue;
 	bool auto_start;
+	bool wake_capable;
 };
 
 /**
-- 
2.17.1

