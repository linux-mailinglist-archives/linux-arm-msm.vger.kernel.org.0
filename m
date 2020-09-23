Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50B32758CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 15:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIWNer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 09:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgIWNeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 09:34:46 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EB3C0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 06:34:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v12so55584wmh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=v0xgMsKOo0srHM0WaUm2AUrjClDDo5GopVkHljRQAZ4=;
        b=cje5wuOBXeTeEFHQfu6OxbkI7oE/1j5NH4KlOoHQkP+k4xnrVyVnOzKrdsp77fi4fL
         xxtfcayGBtLi+LZENehZT7R/oC2jrRS9xPfuV0cszpMIz6PsYN8byj3l4Gw3pfqXtMj0
         pFxswQ9wbdiR0ZePV+FHCS8gnlV78q+yE5ymctuakcO6ojQJ/q4/WWtlT8/kR1OUaWwj
         M+x1/zkaaRLMBU95RdboGgKYPz43/OgEO2yHPKenG+0CvWxqQTBTcDGQwj9PFNgvvL71
         EK2rYwq4XCwMuUmELIjL87laR8l6PN2YTDBW6MQvHwFk4VBLOCHH9DqEt6nSrAVS9svc
         Y7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=v0xgMsKOo0srHM0WaUm2AUrjClDDo5GopVkHljRQAZ4=;
        b=FQkMDEkjJ6KnTvcO/Bhf2WU7sbTZdXrar2z1kIIF/iKIvrkyOXZsrKqrE9VSaa3bSk
         iGasatmbFOWqK9VviTL5Ad7qbnV/BLw5a9GaJhqQxSJWayv5n/zVw4Tt7NDP/t89jqBs
         Wvc6+6lAMH59/bkvd2ywRWg1VEZZrZxKVPvFyQ2S/9BAei4wRVfZFin/z3GFm/5KQiEo
         QrclA/i3S+PVpmtfcJ5WKMK5iTzJjXK1YOTIVdYRDOdEO31TdVbn6a6156p1lHORl/XD
         +k6/oKnFwFv3YT/Yb/PqgrUzUHKChr7gWzH4AIUgxsqw5CuZLDxeSCts+lpDxE0FUQGu
         uQ1Q==
X-Gm-Message-State: AOAM533OWJY7pdvKIzOyU6RYWXigk+80dWpXL5Qn87FrEWS93GaSdW5P
        x7aPYl4E5T28snbKW+2/N4moLg==
X-Google-Smtp-Source: ABdhPJzRHmfo1Pxh6zXfLuw6JcEry4tdC0Jl+wRjMv2hNVglQDqlO4KZ7hntzhAnwsycgesA70QKSg==
X-Received: by 2002:a1c:7514:: with SMTP id o20mr6417761wmc.76.1600868085189;
        Wed, 23 Sep 2020 06:34:45 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id s17sm32073822wrr.40.2020.09.23.06.34.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 06:34:44 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] bus: mhi: Add MHI PCI support
Date:   Wed, 23 Sep 2020 15:40:32 +0200
Message-Id: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a generic MHI-over-PCI controller driver for MHI only devices
such as QCOM modems. For now it supports registering of Qualcomm SDX55
based PCIe modules. The MHI channels have been extracted from mhi
downstream driver.

This driver is easily extendable to support other MHI PCI devices like
different modem hw or OEM superset.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/Kconfig                      |   7 +
 drivers/bus/mhi/Makefile                     |   1 +
 drivers/bus/mhi/controllers/Makefile         |   1 +
 drivers/bus/mhi/controllers/mhi_pci_common.c | 339 +++++++++++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 drivers/bus/mhi/controllers/Makefile
 create mode 100644 drivers/bus/mhi/controllers/mhi_pci_common.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index e841c10..ef66527 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -20,3 +20,10 @@ config MHI_BUS_DEBUG
 	  Enable debugfs support for use with the MHI transport. Allows
 	  reading and/or modifying some values within the MHI controller
 	  for debug and test purposes.
+
+config MHI_BUS_PCI
+	tristate "Modem Host Interface (MHI) bus over PCI"
+	depends on MHI_BUS
+	depends on PCI
+	help
+	  This driver provides support for MHI controller drivers over PCI.
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 19e6443..2f1a20c 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -1,2 +1,3 @@
 # core layer
 obj-y += core/
+obj-y += controllers/
diff --git a/drivers/bus/mhi/controllers/Makefile b/drivers/bus/mhi/controllers/Makefile
new file mode 100644
index 0000000..10cd4f9
--- /dev/null
+++ b/drivers/bus/mhi/controllers/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MHI_BUS_PCI) := mhi_pci_common.o
diff --git a/drivers/bus/mhi/controllers/mhi_pci_common.c b/drivers/bus/mhi/controllers/mhi_pci_common.c
new file mode 100644
index 0000000..705b283
--- /dev/null
+++ b/drivers/bus/mhi/controllers/mhi_pci_common.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MHI PCI driver - MHI over PCI controller driver
+ *
+ * This module is a generic driver for registering pure MHI-over-PCI devices,
+ * such as PCIe QCOM modems.
+ *
+ * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+
+#define MHI_PCI_BAR_NUM 0
+
+enum {
+	EV_RING_0,
+	EV_RING_1,
+	EV_RING_2,
+	EV_RING_3,
+};
+
+struct mhi_pci_dev_info {
+	const struct mhi_controller_config *config;
+	const char *name;
+};
+
+#define MHI_CHANNEL_CONFIG_SIMPLE_TX(cnum, cname, elems, event)	\
+	{							\
+		.num = cnum,					\
+		.name = cname,					\
+		.num_elements = elems,				\
+		.event_ring = event,				\
+		.dir = DMA_TO_DEVICE,				\
+		.ee_mask = BIT(MHI_EE_AMSS),			\
+		.pollcfg = 0,					\
+		.doorbell = MHI_DB_BRST_DISABLE,		\
+		.lpm_notify = false,				\
+		.offload_channel = false,			\
+		.doorbell_mode_switch = false,			\
+		.auto_queue = false,				\
+	}							\
+
+#define MHI_CHANNEL_CONFIG_SIMPLE_RX(cnum, cname, elems, event) \
+	{							\
+		.num = cnum,					\
+		.name = cname,					\
+		.num_elements = elems,				\
+		.event_ring = event,				\
+		.dir = DMA_FROM_DEVICE,				\
+		.ee_mask = BIT(MHI_EE_AMSS),			\
+		.pollcfg = 0,					\
+		.doorbell = MHI_DB_BRST_DISABLE,		\
+		.lpm_notify = false,				\
+		.offload_channel = false,			\
+		.doorbell_mode_switch = false,			\
+		.auto_queue = false,				\
+	}
+
+#define MHI_CHANNEL_CONFIG_PREALLOC_RX(cnum, cname, elems, event) \
+	{							\
+		.num = cnum,					\
+		.name = cname,					\
+		.num_elements = elems,				\
+		.event_ring = event,				\
+		.dir = DMA_FROM_DEVICE,				\
+		.ee_mask = BIT(MHI_EE_AMSS),			\
+		.pollcfg = 0,					\
+		.doorbell = MHI_DB_BRST_DISABLE,		\
+		.lpm_notify = false,				\
+		.offload_channel = false,			\
+		.doorbell_mode_switch = false,			\
+		.auto_queue = true,				\
+	}
+
+#define MHI_EVENT_CONFIG_SIMPLE_CTRL(enum)	\
+	{					\
+		.num_elements = 64,		\
+		.irq_moderation_ms = 5,		\
+		.irq = enum,			\
+		.priority = 1,			\
+		.mode = MHI_DB_BRST_DISABLE,	\
+		.data_type = MHI_ER_CTRL,	\
+		.hardware_event = false,	\
+		.client_managed = false,	\
+		.offload_channel = false,	\
+	}
+
+#define MHI_EVENT_CONFIG_SIMPLE_DATA(enum)	\
+	{					\
+		.num_elements = 64,		\
+		.irq_moderation_ms = 5,		\
+		.irq = enum,			\
+		.priority = 1,			\
+		.mode = MHI_DB_BRST_DISABLE,	\
+		.data_type = MHI_ER_DATA,	\
+		.hardware_event = false,	\
+		.client_managed = false,	\
+		.offload_channel = false,	\
+	}
+
+static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(12, "MBIM", 4, EV_RING_0),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(13, "MBIM", 4, EV_RING_0),
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(14, "QMI", 4, EV_RING_0),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(15, "QMI", 4, EV_RING_0),
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(20, "IPCR", 16, EV_RING_0),
+	/* qrtr-mhi expects pre-allocated/pre-queued RX buffers */
+	MHI_CHANNEL_CONFIG_PREALLOC_RX(21, "IPCR", 4, EV_RING_0),
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(34, "IP_SW0", 16, EV_RING_1),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(35, "IP_SW0", 16, EV_RING_1)
+};
+
+static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
+	/* first ring is control+data ring */
+	MHI_EVENT_CONFIG_SIMPLE_CTRL(EV_RING_0),
+	/* dedicated ring for IP data */
+	MHI_EVENT_CONFIG_SIMPLE_DATA(EV_RING_1)
+};
+
+static const struct mhi_controller_config modem_qcom_v1_mhi_config = {
+	.max_channels = 128,
+	.timeout_ms = 5000,
+	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
+	.ch_cfg = modem_qcom_v1_mhi_channels,
+	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
+	.event_cfg = modem_qcom_v1_mhi_events,
+};
+
+static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
+	.name = "qcom-sdx55",
+	.config = &modem_qcom_v1_mhi_config
+};
+
+static const struct pci_device_id mhi_pci_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	{  }
+};
+MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
+
+static int mhi_pci_read_reg(struct mhi_controller *mhic, void __iomem *addr,
+			    u32 *out)
+{
+	 *out = readl(addr);
+	 return 0;
+}
+
+static void mhi_pci_write_reg(struct mhi_controller *mhic, void __iomem *addr,
+			      u32 val)
+{
+	writel(val, addr);
+}
+
+static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
+			      enum mhi_callback cb)
+{
+	return;
+}
+
+static int mhi_pci_claim(struct mhi_controller *mhic)
+{
+	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
+	int err;
+
+	err = pci_assign_resource(pdev, MHI_PCI_BAR_NUM);
+	if (err) {
+		dev_err(&pdev->dev, "failed to assign pci resource: %d\n", err);
+		return err;
+	}
+
+	err = pcim_enable_device(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
+		return err;
+	}
+
+	err = pcim_iomap_regions(pdev, 1 << MHI_PCI_BAR_NUM, pci_name(pdev));
+	if (err) {
+		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
+		return err;
+	}
+	mhic->regs = pcim_iomap_table(pdev)[MHI_PCI_BAR_NUM];
+
+	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (err) {
+		dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
+		return err;
+	}
+
+	err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (err) {
+		dev_err(&pdev->dev, "set consistent dma mask failed\n");
+		return err;
+	}
+
+	pci_set_master(pdev);
+
+	return 0;
+}
+
+static int mhi_pci_get_irqs(struct mhi_controller *mhic,
+			    const struct mhi_controller_config *mhic_config)
+{
+	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
+	int num_vectors, i;
+	int *irq;
+
+	/* Alloc one MSI vector per event ring, ideally... */
+	num_vectors = pci_alloc_irq_vectors(pdev, 1, mhic_config->num_events,
+					    PCI_IRQ_MSI);
+	if (num_vectors < 0) {
+		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
+			num_vectors);
+		return num_vectors;
+	}
+
+	if (num_vectors < mhic_config->num_events) {
+		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d)\n",
+			 num_vectors, mhic_config->num_events);
+		/* use shared IRQ */
+	}
+
+	irq = devm_kcalloc(&pdev->dev, mhic_config->num_events, sizeof(int),
+			   GFP_KERNEL);
+	if (!irq)
+		return -ENOMEM;
+
+	for (i = 0; i < mhic_config->num_events; i++) {
+		int vector = i >= num_vectors ? (num_vectors - 1) : i;
+
+		irq[i] = pci_irq_vector(pdev, vector);
+	}
+
+	mhic->irq = irq;
+	mhic->nr_irqs = mhic_config->num_events;
+
+	return 0;
+}
+
+static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
+{
+	/* no PM for now */
+	return 0;
+}
+
+static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
+{
+	/* no PM for now */
+	return;
+}
+
+static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
+	const struct mhi_controller_config *mhic_config;
+	struct mhi_controller *mhic;
+	int err;
+
+	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
+
+	mhic = devm_kzalloc(&pdev->dev, sizeof(*mhic), GFP_KERNEL);
+	if (!mhic) {
+		dev_err(&pdev->dev, "failed to allocate mhi controller\n");
+		return -ENOMEM;
+	}
+
+	mhic_config = info->config;
+	mhic->cntrl_dev = &pdev->dev;
+	mhic->iova_start = 0;
+	mhic->iova_stop = 0xffffffff;
+	mhic->fw_image = NULL;
+	mhic->edl_image = NULL;
+
+	mhic->read_reg = mhi_pci_read_reg;
+	mhic->write_reg = mhi_pci_write_reg;
+	mhic->status_cb = mhi_pci_status_cb;
+	mhic->runtime_get = mhi_pci_runtime_get;
+	mhic->runtime_put = mhi_pci_runtime_put;
+
+	err = mhi_pci_claim(mhic);
+	if (err)
+		return err;
+
+	err = mhi_pci_get_irqs(mhic, mhic_config);
+	if (err)
+		return err;
+
+	pci_set_drvdata(pdev, mhic);
+
+	err = mhi_register_controller(mhic, mhic_config);
+	if (err) {
+		dev_err(&pdev->dev, "failed to register MHI controller\n");
+		pci_free_irq_vectors(pdev);
+		return err;
+	}
+
+	/* MHI bus does not power up the controller by default */
+	err = mhi_prepare_for_power_up(mhic);
+	if (err) {
+		dev_err(&pdev->dev, "failed to prepare MHI controller\n");
+		return err;
+	}
+
+	err = mhi_sync_power_up(mhic);
+	if (err) {
+		dev_err(&pdev->dev, "failed to power up MHI controller\n");
+		mhi_unprepare_after_power_down(mhic);
+		mhi_unregister_controller(mhic);
+		return err;
+	}
+
+	return 0;
+}
+
+static void mhi_pci_remove(struct pci_dev *pdev)
+{
+	struct mhi_controller *mhic = pci_get_drvdata(pdev);
+
+	mhi_power_down(mhic, true);
+	mhi_unprepare_after_power_down(mhic);
+	mhi_unregister_controller(mhic);
+}
+
+static struct pci_driver mhi_pci_driver = {
+	.name		= "mhi-pci",
+	.id_table	= mhi_pci_id_table,
+	.probe		= mhi_pci_probe,
+	.remove		= mhi_pci_remove
+};
+module_pci_driver(mhi_pci_driver);
+
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
+MODULE_DESCRIPTION("mhi-pci");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1");
-- 
2.7.4

