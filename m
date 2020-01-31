Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1CA14EDDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAaNu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:50:28 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35725 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbgAaNu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:27 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so2766218plt.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NCpr62evldRil0BNp1+OUy9fXgpl96xkSGgpVffKjck=;
        b=k1Y4CFE/jFYtzsKCxjnTxKDyJzFHc63kFxz+KCoMS6lgqSaB6x3gXDxYXh/4OeetrW
         uyDN1EUrztd8bkh/yWEPP3FaT+A1COCrakmVRbZTq+McaniKUQrN9YrCxrTEWZlLVcWF
         E+E6ZDDimgzdzsHhs7RPKYkyf/TI301tsS/3LnvsmIV0Dh/fx7BcHVSKeBVg9rykspO0
         xOLS8F4GsVVZatH/SUYqMM+pmhjT610gQz5pYdp1MGIg4M5H65zkRyQkAUDU8+F8H48S
         bot5wMpnNq6IlyfXjnYtWVL4Q8hxFspWRbRRXRnaE+AGTXYXc/2cZewwhHZ/e2rfVNDO
         9+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NCpr62evldRil0BNp1+OUy9fXgpl96xkSGgpVffKjck=;
        b=dkGj08PhB1sYK/4uk8XyDAfUb/WlKplBCGCat+XwdpdwwNvFtI1i7KkLmY28VvpJyA
         9U+tG13vYF8aCb4kw/Lh8ZwO0hWT2KW6WVgKd4XvxZNZiGPRLZsqhFloup/xnLovelSf
         8W2a0ZHbFYd2gJe9LqEaKsZkmb5T6srJaXLOb2SUQdSm8qlLLEsHTNZwQEjj67b1vENM
         9NgGF/bJDgjMBTkc1qdntLexSYn5p6EQW6GMFgcC+86R7g8aQ8fe3FItlslGntU8Xy3W
         n0Qw5HslSRfXmm2BJQGiBeWoxRiPgzaVEUDKJUd3Kl4yEyqNGyxjqjvKSzRSVB7YPMnu
         9HnA==
X-Gm-Message-State: APjAAAXGLJD+CyHf0bVcW+gyASStyilCJbGcBxE+uGwa1qXvQwfaKc5a
        aM9GVCEBNhVSZHCs/LPRkSdmPAy0Argp
X-Google-Smtp-Source: APXvYqw9J7NUWtkVBr5vWoNbLkv7qNGA8A5wfe6vGslzptiWoD+JbWoZYPm0ps7HATGD6kKr1Bt+eQ==
X-Received: by 2002:a17:902:9b93:: with SMTP id y19mr10214958plp.89.1580478626403;
        Fri, 31 Jan 2020 05:50:26 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI controllers
Date:   Fri, 31 Jan 2020 19:19:55 +0530
Message-Id: <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for registering MHI controller drivers with
the MHI stack. MHI controller drivers manages the interaction with the
MHI client devices such as the external modems and WiFi chipsets. They
are also the MHI bus master in charge of managing the physical link
between the host and client device.

This is based on the patch submitted by Sujeev Dias:
https://lkml.org/lkml/2018/7/9/987

Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
[jhugo: added static config for controllers and fixed several bugs]
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
[mani: removed DT dependency, splitted and cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/Kconfig             |   1 +
 drivers/bus/Makefile            |   3 +
 drivers/bus/mhi/Kconfig         |  14 ++
 drivers/bus/mhi/Makefile        |   2 +
 drivers/bus/mhi/core/Makefile   |   3 +
 drivers/bus/mhi/core/init.c     | 407 +++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h | 163 +++++++++++++
 include/linux/mhi.h             | 420 ++++++++++++++++++++++++++++++++
 include/linux/mod_devicetable.h |  12 +
 9 files changed, 1025 insertions(+)
 create mode 100644 drivers/bus/mhi/Kconfig
 create mode 100644 drivers/bus/mhi/Makefile
 create mode 100644 drivers/bus/mhi/core/Makefile
 create mode 100644 drivers/bus/mhi/core/init.c
 create mode 100644 drivers/bus/mhi/core/internal.h
 create mode 100644 include/linux/mhi.h

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 50200d1c06ea..383934e54786 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -202,5 +202,6 @@ config DA8XX_MSTPRI
 	  peripherals.
 
 source "drivers/bus/fsl-mc/Kconfig"
+source "drivers/bus/mhi/Kconfig"
 
 endmenu
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 1320bcf9fa9d..05f32cd694a4 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -34,3 +34,6 @@ obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+= uniphier-system-bus.o
 obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
 
 obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
+
+# MHI
+obj-$(CONFIG_MHI_BUS)		+= mhi/
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
new file mode 100644
index 000000000000..a8bd9bd7db7c
--- /dev/null
+++ b/drivers/bus/mhi/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# MHI bus
+#
+# Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+#
+
+config MHI_BUS
+       tristate "Modem Host Interface (MHI) bus"
+       help
+	 Bus driver for MHI protocol. Modem Host Interface (MHI) is a
+	 communication protocol used by the host processors to control
+	 and communicate with modem devices over a high speed peripheral
+	 bus or shared memory.
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
new file mode 100644
index 000000000000..19e6443b72df
--- /dev/null
+++ b/drivers/bus/mhi/Makefile
@@ -0,0 +1,2 @@
+# core layer
+obj-y += core/
diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
new file mode 100644
index 000000000000..2db32697c67f
--- /dev/null
+++ b/drivers/bus/mhi/core/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_MHI_BUS) := mhi.o
+
+mhi-y := init.o
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
new file mode 100644
index 000000000000..a00f1547d252
--- /dev/null
+++ b/drivers/bus/mhi/core/init.c
@@ -0,0 +1,407 @@
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
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/wait.h>
+#include "internal.h"
+
+static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
+			struct mhi_controller_config *config)
+{
+	int i, num;
+	struct mhi_event *mhi_event;
+	struct mhi_event_config *event_cfg;
+
+	num = config->num_events;
+	mhi_cntrl->total_ev_rings = num;
+	mhi_cntrl->mhi_event = kcalloc(num, sizeof(*mhi_cntrl->mhi_event),
+				       GFP_KERNEL);
+	if (!mhi_cntrl->mhi_event)
+		return -ENOMEM;
+
+	/* Populate event ring */
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < num; i++) {
+		event_cfg = &config->event_cfg[i];
+
+		mhi_event->er_index = i;
+		mhi_event->ring.elements = event_cfg->num_elements;
+		mhi_event->intmod = event_cfg->irq_moderation_ms;
+		mhi_event->irq = event_cfg->irq;
+
+		if (event_cfg->channel != U32_MAX) {
+			/* This event ring has a dedicated channel */
+			mhi_event->chan = event_cfg->channel;
+			if (mhi_event->chan >= mhi_cntrl->max_chan) {
+				dev_err(mhi_cntrl->dev,
+					"Event Ring channel not available\n");
+				goto error_ev_cfg;
+			}
+
+			mhi_event->mhi_chan =
+				&mhi_cntrl->mhi_chan[mhi_event->chan];
+		}
+
+		/* Priority is fixed to 1 for now */
+		mhi_event->priority = 1;
+
+		mhi_event->db_cfg.brstmode = event_cfg->mode;
+		if (MHI_INVALID_BRSTMODE(mhi_event->db_cfg.brstmode))
+			goto error_ev_cfg;
+
+		mhi_event->data_type = event_cfg->data_type;
+
+		mhi_event->hw_ring = event_cfg->hardware_event;
+		if (mhi_event->hw_ring)
+			mhi_cntrl->hw_ev_rings++;
+		else
+			mhi_cntrl->sw_ev_rings++;
+
+		mhi_event->cl_manage = event_cfg->client_managed;
+		mhi_event->offload_ev = event_cfg->offload_channel;
+		mhi_event++;
+	}
+
+	/* We need IRQ for each event ring + additional one for BHI */
+	mhi_cntrl->nr_irqs_req = mhi_cntrl->total_ev_rings + 1;
+
+	return 0;
+
+error_ev_cfg:
+
+	kfree(mhi_cntrl->mhi_event);
+	return -EINVAL;
+}
+
+static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
+			struct mhi_controller_config *config)
+{
+	int i;
+	u32 chan;
+	struct mhi_channel_config *ch_cfg;
+
+	mhi_cntrl->max_chan = config->max_channels;
+
+	/*
+	 * The allocation of MHI channels can exceed 32KB in some scenarios,
+	 * so to avoid any memory possible allocation failures, vzalloc is
+	 * used here
+	 */
+	mhi_cntrl->mhi_chan = vzalloc(mhi_cntrl->max_chan *
+				      sizeof(*mhi_cntrl->mhi_chan));
+	if (!mhi_cntrl->mhi_chan)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&mhi_cntrl->lpm_chans);
+
+	/* Populate channel configurations */
+	for (i = 0; i < config->num_channels; i++) {
+		struct mhi_chan *mhi_chan;
+
+		ch_cfg = &config->ch_cfg[i];
+
+		chan = ch_cfg->num;
+		if (chan >= mhi_cntrl->max_chan) {
+			dev_err(mhi_cntrl->dev,
+				"Channel %d not available\n", chan);
+			goto error_chan_cfg;
+		}
+
+		mhi_chan = &mhi_cntrl->mhi_chan[chan];
+		mhi_chan->name = ch_cfg->name;
+		mhi_chan->chan = chan;
+
+		mhi_chan->tre_ring.elements = ch_cfg->num_elements;
+		if (!mhi_chan->tre_ring.elements)
+			goto error_chan_cfg;
+
+		/*
+		 * For some channels, local ring length should be bigger than
+		 * the transfer ring length due to internal logical channels
+		 * in device. So host can queue much more buffers than transfer
+		 * ring length. Example, RSC channels should have a larger local
+		 * channel length than transfer ring length.
+		 */
+		mhi_chan->buf_ring.elements = ch_cfg->local_elements;
+		if (!mhi_chan->buf_ring.elements)
+			mhi_chan->buf_ring.elements = mhi_chan->tre_ring.elements;
+		mhi_chan->er_index = ch_cfg->event_ring;
+		mhi_chan->dir = ch_cfg->dir;
+
+		/*
+		 * For most channels, chtype is identical to channel directions.
+		 * So, if it is not defined then assign channel direction to
+		 * chtype
+		 */
+		mhi_chan->type = ch_cfg->type;
+		if (!mhi_chan->type)
+			mhi_chan->type = (enum mhi_ch_type)mhi_chan->dir;
+
+		mhi_chan->ee_mask = ch_cfg->ee_mask;
+
+		mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
+		mhi_chan->xfer_type = ch_cfg->data_type;
+
+		mhi_chan->lpm_notify = ch_cfg->lpm_notify;
+		mhi_chan->offload_ch = ch_cfg->offload_channel;
+		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
+		mhi_chan->pre_alloc = ch_cfg->auto_queue;
+		mhi_chan->auto_start = ch_cfg->auto_start;
+
+		/*
+		 * If MHI host allocates buffers, then the channel direction
+		 * should be DMA_FROM_DEVICE and the buffer type should be
+		 * MHI_BUF_RAW
+		 */
+		if (mhi_chan->pre_alloc && (mhi_chan->dir != DMA_FROM_DEVICE ||
+				mhi_chan->xfer_type != MHI_BUF_RAW)) {
+			dev_err(mhi_cntrl->dev,
+				"Invalid channel configuration\n");
+			goto error_chan_cfg;
+		}
+
+		/*
+		 * Bi-directional and direction less channel must be an
+		 * offload channel
+		 */
+		if ((mhi_chan->dir == DMA_BIDIRECTIONAL ||
+		     mhi_chan->dir == DMA_NONE) && !mhi_chan->offload_ch) {
+			dev_err(mhi_cntrl->dev,
+				"Invalid channel configuration\n");
+			goto error_chan_cfg;
+		}
+
+		if (!mhi_chan->offload_ch) {
+			mhi_chan->db_cfg.brstmode = ch_cfg->doorbell;
+			if (MHI_INVALID_BRSTMODE(mhi_chan->db_cfg.brstmode)) {
+				dev_err(mhi_cntrl->dev,
+					"Invalid Door bell mode\n");
+				goto error_chan_cfg;
+			}
+		}
+
+		mhi_chan->configured = true;
+
+		if (mhi_chan->lpm_notify)
+			list_add_tail(&mhi_chan->node, &mhi_cntrl->lpm_chans);
+	}
+
+	return 0;
+
+error_chan_cfg:
+	vfree(mhi_cntrl->mhi_chan);
+
+	return -EINVAL;
+}
+
+static int parse_config(struct mhi_controller *mhi_cntrl,
+			struct mhi_controller_config *config)
+{
+	int ret;
+
+	/* Parse MHI channel configuration */
+	ret = parse_ch_cfg(mhi_cntrl, config);
+	if (ret)
+		return ret;
+
+	/* Parse MHI event configuration */
+	ret = parse_ev_cfg(mhi_cntrl, config);
+	if (ret)
+		goto error_ev_cfg;
+
+	mhi_cntrl->timeout_ms = config->timeout_ms;
+	if (!mhi_cntrl->timeout_ms)
+		mhi_cntrl->timeout_ms = MHI_TIMEOUT_MS;
+
+	mhi_cntrl->bounce_buf = config->use_bounce_buf;
+	mhi_cntrl->buffer_len = config->buf_len;
+	if (!mhi_cntrl->buffer_len)
+		mhi_cntrl->buffer_len = MHI_MAX_MTU;
+
+	return 0;
+
+error_ev_cfg:
+	vfree(mhi_cntrl->mhi_chan);
+
+	return ret;
+}
+
+int mhi_register_controller(struct mhi_controller *mhi_cntrl,
+			    struct mhi_controller_config *config)
+{
+	int ret;
+	int i;
+	struct mhi_event *mhi_event;
+	struct mhi_chan *mhi_chan;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_device *mhi_dev;
+
+	if (!mhi_cntrl)
+		return -EINVAL;
+
+	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
+		return -EINVAL;
+
+	if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
+		return -EINVAL;
+
+	ret = parse_config(mhi_cntrl, config);
+	if (ret)
+		return -EINVAL;
+
+	mhi_cntrl->mhi_cmd = kcalloc(NR_OF_CMD_RINGS,
+				     sizeof(*mhi_cntrl->mhi_cmd), GFP_KERNEL);
+	if (!mhi_cntrl->mhi_cmd) {
+		ret = -ENOMEM;
+		goto error_alloc_cmd;
+	}
+
+	INIT_LIST_HEAD(&mhi_cntrl->transition_list);
+	spin_lock_init(&mhi_cntrl->transition_lock);
+	spin_lock_init(&mhi_cntrl->wlock);
+	init_waitqueue_head(&mhi_cntrl->state_event);
+
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
+		spin_lock_init(&mhi_cmd->lock);
+
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		/* Skip for offload events */
+		if (mhi_event->offload_ev)
+			continue;
+
+		mhi_event->mhi_cntrl = mhi_cntrl;
+		spin_lock_init(&mhi_event->lock);
+	}
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		mutex_init(&mhi_chan->mutex);
+		init_completion(&mhi_chan->completion);
+		rwlock_init(&mhi_chan->lock);
+	}
+
+	/* Register controller with MHI bus */
+	mhi_dev = mhi_alloc_device(mhi_cntrl);
+	if (IS_ERR(mhi_dev)) {
+		dev_err(mhi_cntrl->dev, "Failed to allocate device\n");
+		ret = PTR_ERR(mhi_dev);
+		goto error_alloc_dev;
+	}
+
+	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
+	mhi_dev->mhi_cntrl = mhi_cntrl;
+	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->dev));
+
+	/* Init wakeup source */
+	device_init_wakeup(&mhi_dev->dev, true);
+
+	ret = device_add(&mhi_dev->dev);
+	if (ret)
+		goto error_add_dev;
+
+	mhi_cntrl->mhi_dev = mhi_dev;
+
+	return 0;
+
+error_add_dev:
+	mhi_dealloc_device(mhi_cntrl, mhi_dev);
+
+error_alloc_dev:
+	kfree(mhi_cntrl->mhi_cmd);
+
+error_alloc_cmd:
+	vfree(mhi_cntrl->mhi_chan);
+	kfree(mhi_cntrl->mhi_event);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_register_controller);
+
+void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+
+	kfree(mhi_cntrl->mhi_cmd);
+	kfree(mhi_cntrl->mhi_event);
+	vfree(mhi_cntrl->mhi_chan);
+
+	device_del(&mhi_dev->dev);
+	put_device(&mhi_dev->dev);
+}
+EXPORT_SYMBOL_GPL(mhi_unregister_controller);
+
+static void mhi_release_device(struct device *dev)
+{
+	struct mhi_device *mhi_dev = to_mhi_device(dev);
+
+	if (mhi_dev->ul_chan)
+		mhi_dev->ul_chan->mhi_dev = NULL;
+
+	if (mhi_dev->dl_chan)
+		mhi_dev->dl_chan->mhi_dev = NULL;
+
+	kfree(mhi_dev);
+}
+
+struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_device *mhi_dev;
+	struct device *dev;
+
+	mhi_dev = kzalloc(sizeof(*mhi_dev), GFP_KERNEL);
+	if (!mhi_dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev = &mhi_dev->dev;
+	device_initialize(dev);
+	dev->bus = &mhi_bus_type;
+	dev->release = mhi_release_device;
+	dev->parent = mhi_cntrl->dev;
+	mhi_dev->mhi_cntrl = mhi_cntrl;
+	mhi_dev->dev_wake = 0;
+
+	return mhi_dev;
+}
+
+static int mhi_match(struct device *dev, struct device_driver *drv)
+{
+	return 0;
+};
+
+struct bus_type mhi_bus_type = {
+	.name = "mhi",
+	.dev_name = "mhi",
+	.match = mhi_match,
+};
+
+static int __init mhi_init(void)
+{
+	return bus_register(&mhi_bus_type);
+}
+
+static void __exit mhi_exit(void)
+{
+	bus_unregister(&mhi_bus_type);
+}
+
+postcore_initcall(mhi_init);
+module_exit(mhi_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI Host Interface");
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
new file mode 100644
index 000000000000..86a07be2e038
--- /dev/null
+++ b/drivers/bus/mhi/core/internal.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#ifndef _MHI_INT_H
+#define _MHI_INT_H
+
+#include <linux/mhi.h>
+
+extern struct bus_type mhi_bus_type;
+
+/* MHI transfer completion events */
+enum mhi_ev_ccs {
+	MHI_EV_CC_INVALID = 0x0,
+	MHI_EV_CC_SUCCESS = 0x1,
+	MHI_EV_CC_EOT = 0x2, /* End of transfer event */
+	MHI_EV_CC_OVERFLOW = 0x3,
+	MHI_EV_CC_EOB = 0x4, /* End of block event */
+	MHI_EV_CC_OOB = 0x5, /* Out of block event */
+	MHI_EV_CC_DB_MODE = 0x6,
+	MHI_EV_CC_UNDEFINED_ERR = 0x10,
+	MHI_EV_CC_BAD_TRE = 0x11,
+};
+
+enum mhi_ch_state {
+	MHI_CH_STATE_DISABLED = 0x0,
+	MHI_CH_STATE_ENABLED = 0x1,
+	MHI_CH_STATE_RUNNING = 0x2,
+	MHI_CH_STATE_SUSPENDED = 0x3,
+	MHI_CH_STATE_STOP = 0x4,
+	MHI_CH_STATE_ERROR = 0x5,
+};
+
+#define MHI_INVALID_BRSTMODE(mode) (mode != MHI_DB_BRST_DISABLE && \
+				    mode != MHI_DB_BRST_ENABLE)
+
+#define NR_OF_CMD_RINGS			1
+#define CMD_EL_PER_RING			128
+#define PRIMARY_CMD_RING		0
+#define MHI_MAX_MTU			0xffff
+
+enum mhi_er_type {
+	MHI_ER_TYPE_INVALID = 0x0,
+	MHI_ER_TYPE_VALID = 0x1,
+};
+
+struct db_cfg {
+	bool reset_req;
+	bool db_mode;
+	u32 pollcfg;
+	enum mhi_db_brst_mode brstmode;
+	dma_addr_t db_val;
+	void (*process_db)(struct mhi_controller *mhi_cntrl,
+			   struct db_cfg *db_cfg, void __iomem *io_addr,
+			   dma_addr_t db_val);
+};
+
+struct mhi_ring {
+	dma_addr_t dma_handle;
+	dma_addr_t iommu_base;
+	u64 *ctxt_wp; /* point to ctxt wp */
+	void *pre_aligned;
+	void *base;
+	void *rp;
+	void *wp;
+	size_t el_size;
+	size_t len;
+	size_t elements;
+	size_t alloc_size;
+	void __iomem *db_addr;
+};
+
+struct mhi_cmd {
+	struct mhi_ring ring;
+	spinlock_t lock;
+};
+
+struct mhi_buf_info {
+	void *v_addr;
+	void *bb_addr;
+	void *wp;
+	void *cb_buf;
+	dma_addr_t p_addr;
+	size_t len;
+	enum dma_data_direction dir;
+};
+
+struct mhi_event {
+	struct mhi_controller *mhi_cntrl;
+	struct mhi_chan *mhi_chan; /* dedicated to channel */
+	u32 er_index;
+	u32 intmod;
+	u32 irq;
+	int chan; /* this event ring is dedicated to a channel (optional) */
+	u32 priority;
+	enum mhi_er_data_type data_type;
+	struct mhi_ring ring;
+	struct db_cfg db_cfg;
+	struct tasklet_struct task;
+	spinlock_t lock;
+	int (*process_event)(struct mhi_controller *mhi_cntrl,
+			     struct mhi_event *mhi_event,
+			     u32 event_quota);
+	bool hw_ring;
+	bool cl_manage;
+	bool offload_ev; /* managed by a device driver */
+};
+
+struct mhi_chan {
+	const char *name;
+	/*
+	 * Important: When consuming, increment tre_ring first and when
+	 * releasing, decrement buf_ring first. If tre_ring has space, buf_ring
+	 * is guranteed to have space so we do not need to check both rings.
+	 */
+	struct mhi_ring buf_ring;
+	struct mhi_ring tre_ring;
+	u32 chan;
+	u32 er_index;
+	u32 intmod;
+	enum mhi_ch_type type;
+	enum dma_data_direction dir;
+	struct db_cfg db_cfg;
+	enum mhi_ch_ee_mask ee_mask;
+	enum mhi_buf_type xfer_type;
+	enum mhi_ch_state ch_state;
+	enum mhi_ev_ccs ccs;
+	int (*gen_tre)(struct mhi_controller *mhi_cntrl,
+		       struct mhi_chan *mhi_chan, void *buf, void *cb,
+		       size_t len, enum mhi_flags flags);
+	int (*queue_xfer)(struct mhi_device *mhi_dev, struct mhi_chan *mhi_chan,
+			  void *buf, size_t len, enum mhi_flags mflags);
+	struct mhi_device *mhi_dev;
+	void (*xfer_cb)(struct mhi_device *mhi_dev, struct mhi_result *result);
+	struct mutex mutex;
+	struct completion completion;
+	rwlock_t lock;
+	struct list_head node;
+	bool lpm_notify;
+	bool configured;
+	bool offload_ch;
+	bool pre_alloc;
+	bool auto_start;
+	bool wake_capable;
+};
+
+/* Default MHI timeout */
+#define MHI_TIMEOUT_MS (1000)
+
+struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl);
+static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
+				      struct mhi_device *mhi_dev)
+{
+	put_device(&mhi_dev->dev);
+	kfree(mhi_dev);
+}
+
+int mhi_destroy_device(struct device *dev, void *data);
+void mhi_create_devices(struct mhi_controller *mhi_cntrl);
+
+#endif /* _MHI_INT_H */
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
new file mode 100644
index 000000000000..02330236ced8
--- /dev/null
+++ b/include/linux/mhi.h
@@ -0,0 +1,420 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
+#ifndef _MHI_H_
+#define _MHI_H_
+
+#include <linux/device.h>
+#include <linux/dma-direction.h>
+#include <linux/mutex.h>
+#include <linux/rwlock_types.h>
+#include <linux/slab.h>
+#include <linux/spinlock_types.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+struct mhi_chan;
+struct mhi_event;
+struct mhi_ctxt;
+struct mhi_cmd;
+struct mhi_buf_info;
+
+/**
+ * enum mhi_callback - MHI callback
+ * @MHI_CB_IDLE: MHI entered idle state
+ * @MHI_CB_PENDING_DATA: New data available for client to process
+ * @MHI_CB_LPM_ENTER: MHI host entered low power mode
+ * @MHI_CB_LPM_EXIT: MHI host about to exit low power mode
+ * @MHI_CB_EE_RDDM: MHI device entered RDDM exec env
+ * @MHI_CB_EE_MISSION_MODE: MHI device entered Mission Mode exec env
+ * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
+ * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
+ */
+enum mhi_callback {
+	MHI_CB_IDLE,
+	MHI_CB_PENDING_DATA,
+	MHI_CB_LPM_ENTER,
+	MHI_CB_LPM_EXIT,
+	MHI_CB_EE_RDDM,
+	MHI_CB_EE_MISSION_MODE,
+	MHI_CB_SYS_ERROR,
+	MHI_CB_FATAL_ERROR,
+};
+
+/**
+ * enum mhi_flags - Transfer flags
+ * @MHI_EOB: End of buffer for bulk transfer
+ * @MHI_EOT: End of transfer
+ * @MHI_CHAIN: Linked transfer
+ */
+enum mhi_flags {
+	MHI_EOB,
+	MHI_EOT,
+	MHI_CHAIN,
+};
+
+/**
+ * enum mhi_device_type - Device types
+ * @MHI_DEVICE_XFER: Handles data transfer
+ * @MHI_DEVICE_TIMESYNC: Use for timesync feature
+ * @MHI_DEVICE_CONTROLLER: Control device
+ */
+enum mhi_device_type {
+	MHI_DEVICE_XFER,
+	MHI_DEVICE_TIMESYNC,
+	MHI_DEVICE_CONTROLLER,
+};
+
+/**
+ * enum mhi_ch_type - Channel types
+ * @MHI_CH_TYPE_INVALID: Invalid channel type
+ * @MHI_CH_TYPE_OUTBOUND: Outbound channel to the device
+ * @MHI_CH_TYPE_INBOUND: Inbound channel from the device
+ * @MHI_CH_TYPE_INBOUND_COALESCED: Coalesced channel for the device to combine
+ *				   multiple packets and send them as a single
+ *				   large packet to reduce CPU consumption
+ */
+enum mhi_ch_type {
+	MHI_CH_TYPE_INVALID = 0,
+	MHI_CH_TYPE_OUTBOUND = DMA_TO_DEVICE,
+	MHI_CH_TYPE_INBOUND = DMA_FROM_DEVICE,
+	MHI_CH_TYPE_INBOUND_COALESCED = 3,
+};
+
+/**
+ * enum mhi_ee_type - Execution environment types
+ * @MHI_EE_PBL: Primary Bootloader
+ * @MHI_EE_SBL: Secondary Bootloader
+ * @MHI_EE_AMSS: Modem, aka the primary runtime EE
+ * @MHI_EE_RDDM: Ram dump download mode
+ * @MHI_EE_WFW: WLAN firmware mode
+ * @MHI_EE_PTHRU: Passthrough
+ * @MHI_EE_EDL: Embedded downloader
+ */
+enum mhi_ee_type {
+	MHI_EE_PBL,
+	MHI_EE_SBL,
+	MHI_EE_AMSS,
+	MHI_EE_RDDM,
+	MHI_EE_WFW,
+	MHI_EE_PTHRU,
+	MHI_EE_EDL,
+	MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
+	MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
+	MHI_EE_NOT_SUPPORTED,
+	MHI_EE_MAX,
+};
+
+/**
+ * enum mhi_buf_type - Accepted buffer type for the channel
+ * @MHI_BUF_RAW: Raw buffer
+ * @MHI_BUF_SKB: SKB struct
+ * @MHI_BUF_SCLIST: Scatter-gather list
+ * @MHI_BUF_NOP: CPU offload channel, host does not accept transfer
+ * @MHI_BUF_DMA: Receive DMA address mapped by client
+ * @MHI_BUF_RSC_DMA: Reserved Side Coalesced (RSC) type premapped buffer
+ */
+enum mhi_buf_type {
+	MHI_BUF_RAW,
+	MHI_BUF_SKB,
+	MHI_BUF_SCLIST,
+	MHI_BUF_NOP,
+	MHI_BUF_DMA,
+	MHI_BUF_RSC_DMA,
+};
+
+/**
+ * enum mhi_ch_ee_mask - Execution environment mask for channel
+ * @MHI_CH_EE_PBL: Allow channel to be used in PBL EE
+ * @MHI_CH_EE_SBL: Allow channel to be used in SBL EE
+ * @MHI_CH_EE_AMSS: Allow channel to be used in AMSS EE
+ * @MHI_CH_EE_RDDM: Allow channel to be used in RDDM EE
+ * @MHI_CH_EE_PTHRU: Allow channel to be used in PTHRU EE
+ * @MHI_CH_EE_WFW: Allow channel to be used in WFW EE
+ * @MHI_CH_EE_EDL: Allow channel to be used in EDL EE
+ */
+enum mhi_ch_ee_mask {
+	MHI_CH_EE_PBL = BIT(MHI_EE_PBL),
+	MHI_CH_EE_SBL = BIT(MHI_EE_SBL),
+	MHI_CH_EE_AMSS = BIT(MHI_EE_AMSS),
+	MHI_CH_EE_RDDM = BIT(MHI_EE_RDDM),
+	MHI_CH_EE_PTHRU = BIT(MHI_EE_PTHRU),
+	MHI_CH_EE_WFW = BIT(MHI_EE_WFW),
+	MHI_CH_EE_EDL = BIT(MHI_EE_EDL),
+};
+
+/**
+ * enum mhi_er_data_type - Event ring data types
+ * @MHI_ER_DATA: Only client data over this ring
+ * @MHI_ER_CTRL: MHI control data and client data
+ * @MHI_ER_TSYNC: Time sync events
+ */
+enum mhi_er_data_type {
+	MHI_ER_DATA,
+	MHI_ER_CTRL,
+	MHI_ER_TSYNC,
+};
+
+/**
+ * enum mhi_db_brst_mode - Doorbell mode
+ * @MHI_DB_BRST_DISABLE: Burst mode disable
+ * @MHI_DB_BRST_ENABLE: Burst mode enable
+ */
+enum mhi_db_brst_mode {
+	MHI_DB_BRST_DISABLE = 0x2,
+	MHI_DB_BRST_ENABLE = 0x3,
+};
+
+/**
+ * struct mhi_channel_config - Channel configuration structure for controller
+ * @name: The name of this channel
+ * @num: The number assigned to this channel
+ * @num_elements: The number of elements that can be queued to this channel
+ * @local_elements: The local ring length of the channel
+ * @event_ring: The event rung index that services this channel
+ * @dir: Direction that data may flow on this channel
+ * @type: Channel type
+ * @ee_mask: Execution Environment mask for this channel
+ * @pollcfg: Polling configuration for burst mode.  0 is default.  milliseconds
+	     for UL channels, multiple of 8 ring elements for DL channels
+ * @data_type: Data type accepted by this channel
+ * @doorbell: Doorbell mode
+ * @lpm_notify: The channel master requires low power mode notifications
+ * @offload_channel: The client manages the channel completely
+ * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transition
+ * @auto_queue: Framework will automatically queue buffers for DL traffic
+ * @auto_start: Automatically start (open) this channel
+ */
+struct mhi_channel_config {
+	char *name;
+	u32 num;
+	u32 num_elements;
+	u32 local_elements;
+	u32 event_ring;
+	enum dma_data_direction dir;
+	enum mhi_ch_type type;
+	u32 ee_mask;
+	u32 pollcfg;
+	enum mhi_buf_type data_type;
+	enum mhi_db_brst_mode doorbell;
+	bool lpm_notify;
+	bool offload_channel;
+	bool doorbell_mode_switch;
+	bool auto_queue;
+	bool auto_start;
+};
+
+/**
+ * struct mhi_event_config - Event ring configuration structure for controller
+ * @num_elements: The number of elements that can be queued to this ring
+ * @irq_moderation_ms: Delay irq for additional events to be aggregated
+ * @irq: IRQ associated with this ring
+ * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
+ * @priority: Priority of this ring. Use 1 for now
+ * @mode: Doorbell mode
+ * @data_type: Type of data this ring will process
+ * @hardware_event: This ring is associated with hardware channels
+ * @client_managed: This ring is client managed
+ * @offload_channel: This ring is associated with an offloaded channel
+ */
+struct mhi_event_config {
+	u32 num_elements;
+	u32 irq_moderation_ms;
+	u32 irq;
+	u32 channel;
+	u32 priority;
+	enum mhi_db_brst_mode mode;
+	enum mhi_er_data_type data_type;
+	bool hardware_event;
+	bool client_managed;
+	bool offload_channel;
+};
+
+/**
+ * struct mhi_controller_config - Root MHI controller configuration
+ * @max_channels: Maximum number of channels supported
+ * @timeout_ms: Timeout value for operations. 0 means use default
+ * @buf_len: Size of automatically allocated buffers. 0 means use default
+ * @num_channels: Number of channels defined in @ch_cfg
+ * @ch_cfg: Array of defined channels
+ * @num_events: Number of event rings defined in @event_cfg
+ * @event_cfg: Array of defined event rings
+ * @use_bounce_buf: Use a bounce buffer pool due to limited DDR access
+ * @m2_no_db: Host is not allowed to ring DB in M2 state
+ */
+struct mhi_controller_config {
+	u32 max_channels;
+	u32 timeout_ms;
+	u32 buf_len;
+	u32 num_channels;
+	struct mhi_channel_config *ch_cfg;
+	u32 num_events;
+	struct mhi_event_config *event_cfg;
+	bool use_bounce_buf;
+	bool m2_no_db;
+};
+
+/**
+ * struct mhi_controller - Master MHI controller structure
+ * @dev: Driver model device node for the controller (required)
+ * @mhi_dev: MHI device instance for the controller
+ * @regs: Base address of MHI MMIO register space (required)
+ * @iova_start: IOMMU starting address for data (required)
+ * @iova_stop: IOMMU stop address for data (required)
+ * @fw_image: Firmware image name for normal booting (required)
+ * @edl_image: Firmware image name for emergency download mode (optional)
+ * @sbl_size: SBL image size downloaded through BHIe (optional)
+ * @seg_len: BHIe vector size (optional)
+ * @mhi_chan: Points to the channel configuration table
+ * @lpm_chans: List of channels that require LPM notifications
+ * @irq: base irq # to request (required)
+ * @max_chan: Maximum number of channels the controller supports
+ * @total_ev_rings: Total # of event rings allocated
+ * @hw_ev_rings: Number of hardware event rings
+ * @sw_ev_rings: Number of software event rings
+ * @nr_irqs_req: Number of IRQs required to operate (optional)
+ * @nr_irqs: Number of IRQ allocated by bus master (required)
+ * @mhi_event: MHI event ring configurations table
+ * @mhi_cmd: MHI command ring configurations table
+ * @mhi_ctxt: MHI device context, shared memory between host and device
+ * @pm_mutex: Mutex for suspend/resume operation
+ * @pm_lock: Lock for protecting MHI power management state
+ * @timeout_ms: Timeout in ms for state transitions
+ * @pm_state: MHI power management state
+ * @db_access: DB access states
+ * @ee: MHI device execution environment
+ * @dev_wake: Device wakeup count
+ * @pending_pkts: Pending packets for the controller
+ * @transition_list: List of MHI state transitions
+ * @transition_lock: Lock for protecting MHI state transition list
+ * @wlock: Lock for protecting device wakeup
+ * @st_worker: State transition worker
+ * @fw_worker: Firmware download worker
+ * @syserr_worker: System error worker
+ * @state_event: State change event
+ * @status_cb: CB function to notify power states of the device (required)
+ * @link_status: CB function to query link status of the device (required)
+ * @wake_get: CB function to assert device wake (optional)
+ * @wake_put: CB function to de-assert device wake (optional)
+ * @wake_toggle: CB function to assert and de-assert device wake (optional)
+ * @runtime_get: CB function to controller runtime resume (required)
+ * @runtimet_put: CB function to decrement pm usage (required)
+ * @buffer_len: Bounce buffer length
+ * @bounce_buf: Use of bounce buffer
+ * @fbc_download: MHI host needs to do complete image transfer (optional)
+ * @pre_init: MHI host needs to do pre-initialization before power up
+ * @wake_set: Device wakeup set flag
+ */
+struct mhi_controller {
+	struct device *dev;
+	struct mhi_device *mhi_dev;
+	void __iomem *regs;
+	dma_addr_t iova_start;
+	dma_addr_t iova_stop;
+	const char *fw_image;
+	const char *edl_image;
+	size_t sbl_size;
+	size_t seg_len;
+	struct mhi_chan *mhi_chan;
+	struct list_head lpm_chans;
+	int *irq;
+	u32 max_chan;
+	u32 total_ev_rings;
+	u32 hw_ev_rings;
+	u32 sw_ev_rings;
+	u32 nr_irqs_req;
+	u32 nr_irqs;
+
+	struct mhi_event *mhi_event;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_ctxt *mhi_ctxt;
+
+	struct mutex pm_mutex;
+	rwlock_t pm_lock;
+	u32 timeout_ms;
+	u32 pm_state;
+	u32 db_access;
+	enum mhi_ee_type ee;
+	atomic_t dev_wake;
+	atomic_t pending_pkts;
+	struct list_head transition_list;
+	spinlock_t transition_lock;
+	spinlock_t wlock;
+	struct work_struct st_worker;
+	struct work_struct fw_worker;
+	struct work_struct syserr_worker;
+	wait_queue_head_t state_event;
+
+	void (*status_cb)(struct mhi_controller *mhi_cntrl, enum mhi_callback cb);
+	int (*link_status)(struct mhi_controller *mhi_cntrl);
+	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
+	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
+	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
+	int (*runtime_get)(struct mhi_controller *mhi_cntrl);
+	void (*runtime_put)(struct mhi_controller *mhi_cntrl);
+
+	size_t buffer_len;
+	bool bounce_buf;
+	bool fbc_download;
+	bool pre_init;
+	bool wake_set;
+};
+
+/**
+ * struct mhi_device - Structure representing a MHI device which binds
+ *                     to channels
+ * @id: Pointer to MHI device ID struct
+ * @chan_name: Name of the channel to which the device binds
+ * @mhi_cntrl: Controller the device belongs to
+ * @ul_chan: UL channel for the device
+ * @dl_chan: DL channel for the device
+ * @dev: Driver model device node for the MHI device
+ * @dev_type: MHI device type
+ * @tiocm: Device current terminal settings
+ * @dev_wake: Device wakeup counter
+ */
+struct mhi_device {
+	const struct mhi_device_id *id;
+	const char *chan_name;
+	struct mhi_controller *mhi_cntrl;
+	struct mhi_chan *ul_chan;
+	struct mhi_chan *dl_chan;
+	struct device dev;
+	enum mhi_device_type dev_type;
+	u32 tiocm;
+	u32 dev_wake;
+};
+
+/**
+ * struct mhi_result - Completed buffer information
+ * @buf_addr: Address of data buffer
+ * @bytes_xferd: # of bytes transferred
+ * @dir: Channel direction
+ * @transaction_status: Status of last transaction
+ */
+struct mhi_result {
+	void *buf_addr;
+	size_t bytes_xferd;
+	enum dma_data_direction dir;
+	int transaction_status;
+};
+
+#define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
+
+/**
+ * mhi_register_controller - Register MHI controller
+ * @mhi_cntrl: MHI controller to register
+ * @config: Configuration to use for the controller
+ */
+int mhi_register_controller(struct mhi_controller *mhi_cntrl,
+			    struct mhi_controller_config *config);
+
+/**
+ * mhi_unregister_controller - Unregister MHI controller
+ * @mhi_cntrl: MHI controller to unregister
+ */
+void mhi_unregister_controller(struct mhi_controller *mhi_cntrl);
+
+#endif /* _MHI_H_ */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index e3596db077dc..be15e997fe39 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -821,4 +821,16 @@ struct wmi_device_id {
 	const void *context;
 };
 
+#define MHI_NAME_SIZE 32
+
+/**
+ * struct mhi_device_id - MHI device identification
+ * @chan: MHI channel name
+ * @driver_data: driver data;
+ */
+struct mhi_device_id {
+	const char chan[MHI_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
-- 
2.17.1

