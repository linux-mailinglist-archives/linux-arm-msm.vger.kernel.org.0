Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A05E1D322E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgENOIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:08:20 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32971 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727844AbgENOIT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:08:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589465297; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YP16lxYcbrByAMMIjI3P5ZXGtFFhmfo/5iwjIyb9Icc=; b=Goj1tLt3v1eSAQwJwGwC1wg9dZftsuJpYLK1xusnfeO3bkAx2HAGlKhyoGgUnIrtCep49CW2
 Z2ZMSgKn0bcxKwKsFzipI+jft2naHze85vsw6l2FZ7JKwE/4zw3WpbrdkBJEDjwTOfWqtd67
 4dHNP3/sb8s1FIVZAQ7IHAQ71W8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd50d0.7f4e6a32f110-smtp-out-n03;
 Thu, 14 May 2020 14:08:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 447ECC4478C; Thu, 14 May 2020 14:08:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA7B2C432C2;
        Thu, 14 May 2020 14:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA7B2C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC PATCH 2/8] qaic: Add and init a basic mhi controller
Date:   Thu, 14 May 2020 08:07:40 -0600
Message-Id: <1589465266-20056-3-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

An mhi controller is the "driver" for a specific mhi device with the mhi
bus framework.  Add a basic controller for the AIC100 device, and
supporting code to init the controller.  This will enable the PCIE device,
init the mhi hardware, bring it to ready state, and use BHI to load the
SBL image.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/misc/qaic/Makefile         |   4 +-
 drivers/misc/qaic/mhi_controller.c | 495 +++++++++++++++++++++++++++++++++++++
 drivers/misc/qaic/mhi_controller.h |  14 ++
 drivers/misc/qaic/qaic.h           |  18 ++
 drivers/misc/qaic/qaic_drv.c       | 110 +++++++++
 5 files changed, 639 insertions(+), 2 deletions(-)
 create mode 100644 drivers/misc/qaic/mhi_controller.c
 create mode 100644 drivers/misc/qaic/mhi_controller.h
 create mode 100644 drivers/misc/qaic/qaic.h

diff --git a/drivers/misc/qaic/Makefile b/drivers/misc/qaic/Makefile
index 42149ac..b5fd819 100644
--- a/drivers/misc/qaic/Makefile
+++ b/drivers/misc/qaic/Makefile
@@ -3,8 +3,8 @@
 # Makefile for Qualcomm Cloud AI 100 accelerators driver
 #
 
-
 obj-$(CONFIG_QAIC)	:= qaic.o
 
 qaic-y := \
-	qaic_drv.o
+	qaic_drv.o \
+	mhi_controller.o
diff --git a/drivers/misc/qaic/mhi_controller.c b/drivers/misc/qaic/mhi_controller.c
new file mode 100644
index 0000000..ba4808c
--- /dev/null
+++ b/drivers/misc/qaic/mhi_controller.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
+
+#include <linux/err.h>
+#include <linux/mhi.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+
+static unsigned int mhi_timeout = 20000; /* 20 sec default */
+module_param(mhi_timeout, uint, 0600);
+
+static struct mhi_channel_config aic100_channels[] = {
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 0,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOOPBACK",
+		.num = 1,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 2,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SAHARA",
+		.num = 3,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_SBL,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DIAG",
+		.num = 4,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DIAG",
+		.num = 5,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 6,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_SSR",
+		.num = 7,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_QDSS",
+		.num = 8,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_QDSS",
+		.num = 9,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 10,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_CONTROL",
+		.num = 11,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 12,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_LOGGING",
+		.num = 13,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 14,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_STATUS",
+		.num = 15,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 16,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_TELEMETRY",
+		.num = 17,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DEBUG",
+		.num = 18,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.type = MHI_CH_TYPE_INBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "QAIC_DEBUG",
+		.num = 19,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.type = MHI_CH_TYPE_OUTBOUND,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.auto_start = false,
+		.wake_capable = false,
+	},
+};
+
+static struct mhi_event_config aic100_events[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 0,
+		.channel = 0,
+		.priority = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_CTRL,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+static struct mhi_controller_config aic100_config = {
+	.max_channels = 128,
+	.timeout_ms = 0, /* controlled by mhi_timeout */
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(aic100_channels),
+	.ch_cfg = aic100_channels,
+	.num_events = ARRAY_SIZE(aic100_events),
+	.event_cfg = aic100_events,
+	.use_bounce_buf = false,
+	.m2_no_db = false,
+};
+
+static int mhi_link_status(struct mhi_controller *mhi_cntl)
+{
+	struct pci_dev *pci_dev = to_pci_dev(mhi_cntl->cntrl_dev);
+	u16 dev_id;
+	int ret;
+
+	/* try reading device id, if dev id don't match, link is down */
+	ret = pci_read_config_word(pci_dev, PCI_DEVICE_ID, &dev_id);
+
+	return (ret || dev_id != pci_dev->device) ? -EIO : 0;
+}
+
+static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
+{
+	return 0;
+}
+
+static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
+{
+}
+
+static void mhi_status_cb(struct mhi_controller *mhi_cntl,
+			  enum mhi_callback reason)
+{
+}
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
+						    void *mhi_bar,
+						    int mhi_irq)
+{
+	struct mhi_controller *mhi_cntl;
+	int ret;
+
+	pci_dbg(pci_dev, "%s\n", __func__);
+
+	mhi_cntl = kzalloc(sizeof(*mhi_cntl), GFP_KERNEL);
+	if (!mhi_cntl)
+		return ERR_PTR(-ENOMEM);
+
+	mhi_cntl->cntrl_dev = &pci_dev->dev;
+
+	/*
+	 * Covers the entire possible physical ram region.  Remote side is
+	 * going to calculate a size of this range, so subtract 1 to prevent
+	 * rollover.
+	 */
+	mhi_cntl->iova_start = 0;
+	mhi_cntl->iova_stop = U64_MAX - 1;
+
+	mhi_cntl->status_cb = mhi_status_cb;
+	mhi_cntl->runtime_get = mhi_runtime_get;
+	mhi_cntl->runtime_put = mhi_runtime_put;
+	mhi_cntl->link_status = mhi_link_status;
+	mhi_cntl->regs = mhi_bar;
+	mhi_cntl->nr_irqs = 1;
+	mhi_cntl->irq = kmalloc(sizeof(*mhi_cntl->irq), GFP_KERNEL);
+
+	if (!mhi_cntl->irq)
+		return ERR_PTR(-ENOMEM);
+
+	mhi_cntl->irq[0] = mhi_irq;
+
+	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
+
+	/* use latest configured timeout */
+	aic100_config.timeout_ms = mhi_timeout;
+	ret = mhi_register_controller(mhi_cntl, &aic100_config);
+	if (ret) {
+		pci_err(pci_dev, "register_mhi_controller failed %d\n", ret);
+		kfree(mhi_cntl->irq);
+		kfree(mhi_cntl);
+		return ERR_PTR(ret);
+	}
+
+	ret = mhi_async_power_up(mhi_cntl);
+	if (ret) {
+		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
+		mhi_unregister_controller(mhi_cntl);
+		kfree(mhi_cntl->irq);
+		kfree(mhi_cntl);
+		return ERR_PTR(ret);
+	}
+
+	return mhi_cntl;
+}
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
+{
+	mhi_power_down(mhi_cntl, link_up);
+	mhi_unregister_controller(mhi_cntl);
+	kfree(mhi_cntl->irq);
+	kfree(mhi_cntl);
+}
diff --git a/drivers/misc/qaic/mhi_controller.h b/drivers/misc/qaic/mhi_controller.h
new file mode 100644
index 0000000..c81725e
--- /dev/null
+++ b/drivers/misc/qaic/mhi_controller.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef MHICONTROLLERQAIC_H_
+#define MHICONTROLLERQAIC_H_
+
+struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
+						    void *mhi_bar,
+						    int mhi_irq);
+
+void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
+#endif /* MHICONTROLLERQAIC_H_ */
diff --git a/drivers/misc/qaic/qaic.h b/drivers/misc/qaic/qaic.h
new file mode 100644
index 0000000..379aa82
--- /dev/null
+++ b/drivers/misc/qaic/qaic.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QAICINTERNAL_H_
+#define QAICINTERNAL_H_
+
+#include <linux/mhi.h>
+#include <linux/pci.h>
+
+struct qaic_device {
+	struct pci_dev		*pdev;
+	int			bars;
+	void __iomem		*bar_0;
+	struct mhi_controller	*mhi_cntl;
+};
+#endif /* QAICINTERNAL_H_ */
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index addd9ea..b624daa 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -3,24 +3,131 @@
 /* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
 
 #include <linux/module.h>
+#include <linux/msi.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 
+#include "mhi_controller.h"
+#include "qaic.h"
+
 #define PCI_DEV_AIC100			0xa100
 
 #define QAIC_NAME			"Qualcomm Cloud AI 100"
 
+static bool link_up;
+
 static int qaic_pci_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
 {
+	int ret;
+	int mhi_irq;
+	struct qaic_device *qdev;
+
 	pci_dbg(pdev, "%s\n", __func__);
+
+	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
+	if (!qdev) {
+		ret = -ENOMEM;
+		goto qdev_fail;
+	}
+
+	pci_set_drvdata(pdev, qdev);
+	qdev->pdev = pdev;
+
+	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
+
+	/* make sure the device has the expected BARs */
+	if (qdev->bars != (BIT(0) | BIT(2) | BIT(4))) {
+		pci_err(pdev, "%s: expected BARs 0, 2, and 4 not found in device.  Found 0x%x\n", __func__, qdev->bars);
+		ret = -EINVAL;
+		goto bar_fail;
+	}
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		goto enable_fail;
+
+	ret = pci_request_selected_regions(pdev, qdev->bars, "aic100");
+	if (ret)
+		goto request_regions_fail;
+
+	pci_set_master(pdev);
+
+	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+	if (ret)
+		goto dma_mask_fail;
+	ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
+	if (ret)
+		goto dma_mask_fail;
+
+	qdev->bar_0 = pci_ioremap_bar(pdev, 0);
+	if (!qdev->bar_0) {
+		ret = -ENOMEM;
+		goto ioremap_0_fail;
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
+	if (ret < 0)
+		goto alloc_irq_fail;
+
+	if (ret < 32) {
+		pci_err(pdev, "%s: Requested 32 MSIs.  Obtained %d MSIs which is less than the 32 required.\n", __func__, ret);
+		ret = -ENODEV;
+		goto invalid_msi_config;
+	}
+
+	mhi_irq = pci_irq_vector(pdev, 0);
+	if (mhi_irq < 0) {
+		ret = mhi_irq;
+		goto get_mhi_irq_fail;
+	}
+
+	qdev->mhi_cntl = qaic_mhi_register_controller(pdev, qdev->bar_0,
+						      mhi_irq);
+	if (IS_ERR(qdev->mhi_cntl)) {
+		ret = PTR_ERR(qdev->mhi_cntl);
+		goto mhi_register_fail;
+	}
+
 	pci_dbg(pdev, "%s: successful init\n", __func__);
 	return 0;
+
+mhi_register_fail:
+get_mhi_irq_fail:
+invalid_msi_config:
+	pci_free_irq_vectors(pdev);
+alloc_irq_fail:
+	iounmap(qdev->bar_0);
+ioremap_0_fail:
+dma_mask_fail:
+	pci_clear_master(pdev);
+	pci_release_selected_regions(pdev, qdev->bars);
+request_regions_fail:
+	pci_disable_device(pdev);
+enable_fail:
+	pci_set_drvdata(pdev, NULL);
+bar_fail:
+	kfree(qdev);
+qdev_fail:
+	return ret;
 }
 
 static void qaic_pci_remove(struct pci_dev *pdev)
 {
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
 	pci_dbg(pdev, "%s\n", __func__);
+	if (!qdev)
+		return;
+
+	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
+	pci_free_irq_vectors(pdev);
+	iounmap(qdev->bar_0);
+	pci_clear_master(pdev);
+	pci_release_selected_regions(pdev, qdev->bars);
+	pci_disable_device(pdev);
+	pci_set_drvdata(pdev, NULL);
+	kfree(qdev);
 }
 
 static const struct pci_device_id ids[] = {
@@ -44,12 +151,15 @@ static int __init qaic_init(void)
 
 	ret = pci_register_driver(&qaic_pci_driver);
 
+	pr_debug("qaic: init success\n");
+
 	return ret;
 }
 
 static void __exit qaic_exit(void)
 {
 	pr_debug("qaic: exit\n");
+	link_up = true;
 	pci_unregister_driver(&qaic_pci_driver);
 }
 
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
