Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D402926D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 13:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgJSLyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 07:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgJSLyq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 07:54:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A40AC0613CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 04:54:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d81so10013713wmc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HjoMNo644Sr8eCUmi7HhfwOxvn5l/RAuDAQKVw0+Mmo=;
        b=Y+/wdjlyha3rz2DHjLW0A3A0IZ1WlUQc3p3DpVgbMR7IDyLzHecUYvMnm+tcJiFVyu
         s2EN66Pd7TNWu//f8brRT7U+vg9Wfib9MYU1qUUtS/m9l2Zh8KJB/Lox52oK+ASJPj04
         2Yk+ktYLhiUOVTTDAusvQMxHaZr4Mo//LMBxQdMqmih+kysUwq5wBM/7Rr+Wf4a7pjWc
         6OWb9zj6k6g5Dh++2uBgusuODESFhr02MU5rp5MLYnyEszlZC9V+V/tSsHZr666HDBc4
         Wz2x+2IXLJDYJYgvjW2AV92vYqYBZsbfkcORR/ZjFEPgfF3BwjDbqj+9YHOxV9t2cnYz
         9Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HjoMNo644Sr8eCUmi7HhfwOxvn5l/RAuDAQKVw0+Mmo=;
        b=lcpIhH68UWzFKnQD7EUtYS1N3J/dJvvSPj+tk6zUCgncGbRSzufVbfn0igTOMDh6M6
         cO5nuXc+q/r7D0dyLg5sPfCBw+YUkRWOR70DLvCvNQlMpSdR9r0EWy976/IR1/P4WmVQ
         JjrC2KI24hpm0AY2HDAmQrzkfDb4/HdDHdfY+dz9jrzTr8waui6Ktd8FMpV5RuwPHtW3
         FVedg7cKeWYwmJ23UXqsVGazGEdL1+0WkVgyDdaoDw8ccvCirF2f+19nxWPifNCyupen
         tj+r35knGTqqtuTdFc17zZx/7drbJT6r7F1kmoaVKjpYwZn8Lwo5TsrF5LJbTXqfxZiI
         8K3Q==
X-Gm-Message-State: AOAM532uS9H3LYlB60tYuaDE5G+/MbjhEZHkXrZp5Fe7RVzdT1LvjkWq
        hOENFdH/CjV3YGUGT4z9/q31rg==
X-Google-Smtp-Source: ABdhPJzj0WN4m3ZMmXuA1c2PXxRGvDtDZ0HgxXDRxwsMKvPPiGTwwOV/mWzi+xo21pApfGHrpFPpAQ==
X-Received: by 2002:a1c:98d2:: with SMTP id a201mr15643444wme.166.1603108484127;
        Mon, 19 Oct 2020 04:54:44 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id h206sm15712894wmf.47.2020.10.19.04.54.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 04:54:43 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        jhugo@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4] bus: mhi: Add MHI PCI support for WWAN modems
Date:   Mon, 19 Oct 2020 14:00:44 +0200
Message-Id: <1603108844-22286-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a generic MHI-over-PCI controller driver for MHI only devices
such as QCOM modems. For now it supports registering of Qualcomm SDX55
based PCIe modules. The MHI channels have been extracted from mhi
downstream driver.

This driver is for MHI-only devices which have all functionnalities
exposed through MHI channels and accessed by the corresponding MHI
device drivers (no out-of-band communication).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: - remove useless delay.h include
     - remove over-logging on error
     - remove controller subdir
     - rename to mhi_pci_modem.c
     - Fix mhi_pci_probe exit path on error
     - expand module description
     - drop module version
 v3: - Rename to mhi_pci_generic
     - Add hardware accelerated IP channel (IPA)
     - Added fw/edl names for sdx55m
 v4: - Configurable dma width access
     - Configurable PCI BAR number (default is 0)

 drivers/bus/mhi/Kconfig           |   9 +
 drivers/bus/mhi/Makefile          |   3 +
 drivers/bus/mhi/mhi_pci_generic.c | 336 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 drivers/bus/mhi/mhi_pci_generic.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index e841c10..daa8528 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -20,3 +20,12 @@ config MHI_BUS_DEBUG
 	  Enable debugfs support for use with the MHI transport. Allows
 	  reading and/or modifying some values within the MHI controller
 	  for debug and test purposes.
+
+config MHI_BUS_PCI_GENERIC
+	tristate "MHI PCI controller driver"
+	depends on MHI_BUS
+	depends on PCI
+	help
+	  This driver provides Modem Host Interface (MHI) PCI controller driver
+	  for devices such as Qualcomm SDX55 based PCIe modems.
+
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 19e6443..d1a4ef3 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -1,2 +1,5 @@
 # core layer
 obj-y += core/
+
+obj-$(CONFIG_MHI_BUS_PCI_GENERIC) := mhi_pci_generic.o
+
diff --git a/drivers/bus/mhi/mhi_pci_generic.c b/drivers/bus/mhi/mhi_pci_generic.c
new file mode 100644
index 0000000..dcd6c1a
--- /dev/null
+++ b/drivers/bus/mhi/mhi_pci_generic.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MHI PCI driver - MHI over PCI controller driver
+ *
+ * This module is a generic driver for registering MHI-over-PCI devices,
+ * such as PCIe QCOM modems.
+ *
+ * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#define MHI_PCI_DEFAULT_BAR_NUM 0
+
+struct mhi_pci_dev_info {
+	const struct mhi_controller_config *config;
+	const char *name;
+	const char *fw;
+	const char *edl;
+	unsigned int bar_num;
+	unsigned int dma_data_width;
+};
+
+#define MHI_CHANNEL_CONFIG_UL(cnum, cname, elems, event)	\
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
+	}							\
+
+#define MHI_CHANNEL_CONFIG_DL(cnum, cname, elems, event)	\
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
+	}
+
+#define MHI_EVENT_CONFIG_CTRL(enum)		\
+	{					\
+		.num_elements = 64,		\
+		.irq_moderation_ms = 0,		\
+		.irq = (enum) + 1,		\
+		.priority = 1,			\
+		.mode = MHI_DB_BRST_DISABLE,	\
+		.data_type = MHI_ER_CTRL,	\
+		.hardware_event = false,	\
+		.client_managed = false,	\
+		.offload_channel = false,	\
+	}
+
+#define MHI_EVENT_CONFIG_DATA(enum)		\
+	{					\
+		.num_elements = 128,		\
+		.irq_moderation_ms = 5,		\
+		.irq = (enum) + 1,		\
+		.priority = 1,			\
+		.mode = MHI_DB_BRST_DISABLE,	\
+		.data_type = MHI_ER_DATA,	\
+		.hardware_event = false,	\
+		.client_managed = false,	\
+		.offload_channel = false,	\
+	}
+
+#define MHI_EVENT_CONFIG_HW_DATA(enum, cnum)	\
+	{					\
+		.num_elements = 128,		\
+		.irq_moderation_ms = 5,		\
+		.irq = (enum) + 1,		\
+		.priority = 1,			\
+		.mode = MHI_DB_BRST_DISABLE,	\
+		.data_type = MHI_ER_DATA,	\
+		.hardware_event = true,		\
+		.client_managed = false,	\
+		.offload_channel = false,	\
+		.channel = cnum,		\
+	}
+
+static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
+	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
+	MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
+};
+
+static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
+	/* first ring is control+data ring */
+	MHI_EVENT_CONFIG_CTRL(0),
+	/* Hardware channels request dedicated hardware event rings */
+	MHI_EVENT_CONFIG_HW_DATA(1, 100),
+	MHI_EVENT_CONFIG_HW_DATA(2, 101)
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
+	.name = "qcom-sdx55m",
+	.fw = "qcom/sdx55m/sbl1.mbn",
+	.edl = "qcom/sdx55m/edl.mbn",
+	.config = &modem_qcom_v1_mhi_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32
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
+	*out = readl(addr);
+	return 0;
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
+static int mhi_pci_claim(struct mhi_controller *mhic, unsigned int bar_num,
+			 u64 dma_mask)
+{
+	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
+	int err;
+
+	err = pci_assign_resource(pdev, bar_num);
+	if (err)
+		return err;
+
+	err = pcim_enable_device(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
+		return err;
+	}
+
+	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
+	if (err) {
+		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
+		return err;
+	}
+	mhic->regs = pcim_iomap_table(pdev)[bar_num];
+
+	err = pci_set_dma_mask(pdev, dma_mask);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot set proper DMA mask\n");
+		return err;
+	}
+
+	err = pci_set_consistent_dma_mask(pdev, dma_mask);
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
+	int nr_vectors, i;
+	int *irq;
+
+	/*
+	 * Alloc one MSI vector for BHI + one vector per event ring, ideally...
+	 * No explicit pci_free_irq_vectors required, done by pcim_release.
+	 */
+	mhic->nr_irqs = 1 + mhic_config->num_events;
+
+	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhic->nr_irqs, PCI_IRQ_MSI);
+	if (nr_vectors < 0) {
+		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
+			nr_vectors);
+		return nr_vectors;
+	}
+
+	if (nr_vectors < mhic->nr_irqs) {
+		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d)\n",
+			 nr_vectors, mhic_config->num_events);
+		/* continue... use shared IRQ */
+	}
+
+	irq = devm_kcalloc(&pdev->dev, mhic->nr_irqs, sizeof(int), GFP_KERNEL);
+	if (!irq)
+		return -ENOMEM;
+
+	for (i = 0; i < mhic->nr_irqs; i++) {
+		int vector = i >= nr_vectors ? (nr_vectors - 1) : i;
+
+		irq[i] = pci_irq_vector(pdev, vector);
+	}
+
+	mhic->irq = irq;
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
+	if (!mhic)
+		return -ENOMEM;
+
+	mhic_config = info->config;
+	mhic->cntrl_dev = &pdev->dev;
+	mhic->iova_start = 0;
+	mhic->iova_stop = DMA_BIT_MASK(info->dma_data_width);
+	mhic->fw_image = info->fw;
+	mhic->edl_image = info->edl;
+
+	mhic->read_reg = mhi_pci_read_reg;
+	mhic->write_reg = mhi_pci_write_reg;
+	mhic->status_cb = mhi_pci_status_cb;
+	mhic->runtime_get = mhi_pci_runtime_get;
+	mhic->runtime_put = mhi_pci_runtime_put;
+
+	err = mhi_pci_claim(mhic, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
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
+	if (err)
+		return err;
+
+	/* MHI bus does not power up the controller by default */
+	err = mhi_prepare_for_power_up(mhic);
+	if (err) {
+		dev_err(&pdev->dev, "failed to prepare MHI controller\n");
+		goto err_unregister;
+	}
+
+	err = mhi_sync_power_up(mhic);
+	if (err) {
+		dev_err(&pdev->dev, "failed to power up MHI controller\n");
+		goto err_unprepare;
+	}
+
+	return 0;
+
+err_unprepare:
+	mhi_unprepare_after_power_down(mhic);
+
+err_unregister:
+	mhi_unregister_controller(mhic);
+
+	return err;
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
+	.name		= "mhi-pci-generic",
+	.id_table	= mhi_pci_id_table,
+	.probe		= mhi_pci_probe,
+	.remove		= mhi_pci_remove
+};
+module_pci_driver(mhi_pci_driver);
+
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
+MODULE_DESCRIPTION("Modem Host Interface (MHI) PCI controller driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

