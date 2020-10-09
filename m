Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47974288D02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 17:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389135AbgJIPpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 11:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbgJIPpA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 11:45:00 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF729C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 08:44:58 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 13so10295461wmf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BuH0gNY3oVkwXkvD3wGv06XTgYoZtIzVUj+jVRDteJ4=;
        b=tT6jdy9jKzKlEsOPTPkuPR4B/fcsjH0271eos5/53mPwPhSebF6hGOeI7MNx3D/MOZ
         Gr4gScghMgAt+hjZMVa0tabAvTrshGAE8GKHtIOomxY1NEdNkknHjXZ9VJUwK93bz2Q3
         q3yEHPxGFRkhJKrRorKrx8hZOG6f0OZtLBLIA5R6/uo246oQc0XPlbVbxigqpg5LGin3
         JeGwKy8v0FUR0TImaK0pMqtc3ga0eykpQpD7KE03Fwsc+t9jkL8uY4ZsKiLQmlROFiFp
         JBUkn9S2pw96YefLD//XagHtI7BKP9vhdo/51sBATAhs4fYc8w02IAjXvbKvCcXMs9ip
         MLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BuH0gNY3oVkwXkvD3wGv06XTgYoZtIzVUj+jVRDteJ4=;
        b=jLFL4GTMdaXz+HuyYID/JmPmjDKu+hB8+2AZ6X2DrVFqydnWjEKKziHQWUvgIOG6cy
         GRRc3zxCW/Uxhs4vgOUEEz8+ASOzB4mKHv+RbUX0TWBlbniMLNPjbfu9VIry3YqG6+7W
         NVvm0/0D9nmM4MrYl1Miatls/EWo7MyOSgJK36WkWn3BN2xlSvSgNOhN76rmLSd5tSQ9
         NzIuHa3qIsqEmgVVpw2e50qzsMC6nPUYpLYHfH6xEh2+bf+/HQnLUDcoHX1h43qY8Lrv
         0LnHCzgQnximhxhGwCjAQfuuAGDIDhSJaMX44g213P7emmNCPNiow7oWZrYRHWAQYDII
         WAgA==
X-Gm-Message-State: AOAM533XZn4EAIUy6VZp70Os53mKbuAHdIZXfhqmpXcBLtl05xK4pBOz
        AgKRpePpbzyQE4qDz+l/RhcFWk24/NeVVw==
X-Google-Smtp-Source: ABdhPJw3av8swXDNfueIj1HryXqsES86u8HwqBbAViXSUkczwr8q3+j8j0pF8thL+ruspXEJvG+xJw==
X-Received: by 2002:a7b:c01a:: with SMTP id c26mr13806489wmb.35.1602258297188;
        Fri, 09 Oct 2020 08:44:57 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id g14sm12629976wrx.22.2020.10.09.08.44.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2020 08:44:56 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        jhugo@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4] bus: mhi: Add MHI PCI support for WWAN modems
Date:   Fri,  9 Oct 2020 17:51:04 +0200
Message-Id: <1602258664-9980-1-git-send-email-loic.poulain@linaro.org>
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
 v4: - Rename MHI channel macros to UL/DL
     - Reserve MSI 0 as dedicated BHI vector
     - Increase IP_HW0 elements to 128 (max)  

 drivers/bus/mhi/Kconfig           |   9 ++
 drivers/bus/mhi/Makefile          |   3 +
 drivers/bus/mhi/mhi_pci_generic.c | 331 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)
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
index 0000000..145df1f
--- /dev/null
+++ b/drivers/bus/mhi/mhi_pci_generic.c
@@ -0,0 +1,331 @@
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
+#define MHI_PCI_BAR_NUM 0
+
+struct mhi_pci_dev_info {
+	const struct mhi_controller_config *config;
+	const char *name;
+	const char *fw;
+	const char *edl;
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
+static int mhi_pci_claim(struct mhi_controller *mhic)
+{
+	struct pci_dev *pdev = to_pci_dev(mhic->cntrl_dev);
+	int err;
+
+	err = pci_assign_resource(pdev, MHI_PCI_BAR_NUM);
+	if (err)
+		return err;
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
+	mhic->iova_stop = 0xffffffff;
+	mhic->fw_image = info->fw;
+	mhic->edl_image = info->edl;
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
+	mhi_power_down(mhic, false);
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

