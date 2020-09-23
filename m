Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CC9275E81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 19:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgIWRUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 13:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIWRUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 13:20:50 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C5BC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 10:20:49 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so899833wrt.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ppsSrKsJpSGtV0nWzFRWMI3bsahzPi5lBIsO5/kbuSk=;
        b=GfX+kfSl28lG2oUPzAsu3NkzWaibnYrs/skYBBomUWjplV3wuZwOGvYuoFplelhgkI
         ThmQ8pCuuR0p48aF+ZcCiqPMYLoWMGkUMuUxuid89OWQgiKjbbinst5drBHRZ2O/MEed
         ZJC2HC4+FGxbVUmS6LTQU/W6Oeh9Pv7eVCRyZwd52DA/72fKE6RrtIz9NHZi52LU3qBt
         c1TTlZ8ct4pHSodpGQ7LKQ+435ni9ROGcMYRNhgJymKxxru9bLt9QsY81hP7ckKCdx7e
         036PuUOf567ays15XorzXAWSahxQrkYxh9s2LONA019LvApAzRGNZjdDfm8YeqPiuabe
         tbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ppsSrKsJpSGtV0nWzFRWMI3bsahzPi5lBIsO5/kbuSk=;
        b=MZB+4gPU59Ea5dryQXRb+rOW33VkbDF3Q3hWInxQ0gQbkeHyfJUfdiawQaZrZ1hicB
         nu6Czn79NZ1kmONcagBwTFjR4INXST77zY6fqNOBaRZYNIKgWI7BGhHkgtambE34J5ev
         3Fvbi9KSX8hFeCWA9pfPbUq8M+3M7f0byotd9QLpNlfIhKAXfZWxISn9v1VIxBwe/WBo
         ZGmW1E/68bu0NI2F+ePqad0eZYtF2Orv6Po1t4nUf8GmjEprV5SF0Ls5KHCVFwFTT/Tc
         QdlIOYBwhL2keNh7cE0ZSxlnYjrP9i3Vrem8Ay8Pap+GFdGZrnVaXX0KhDrFoDIgAfFI
         7ZIw==
X-Gm-Message-State: AOAM533KYDk0uPJ7OiOg1ZclZXWWHQDeo9rE9lAeWwSsrn78dy24JXHk
        UAKIhUM6o2z5BGQph5b8JOItREetBGdxPQ==
X-Google-Smtp-Source: ABdhPJzLgmNs3Alatpi82/mmv0aDewSoU20Ym8n8vnoHx8YKQtWh8ql7jTtNiUWJUo0/jGN9fVguuA==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr682753wrn.45.1600881648460;
        Wed, 23 Sep 2020 10:20:48 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id i83sm485567wma.22.2020.09.23.10.20.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 10:20:47 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] bus: mhi: Add MHI PCI support for WWAN modems
Date:   Wed, 23 Sep 2020 19:26:30 +0200
Message-Id: <1600881990-12349-1-git-send-email-loic.poulain@linaro.org>
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

 drivers/bus/mhi/Kconfig         |   8 +
 drivers/bus/mhi/Makefile        |   2 +
 drivers/bus/mhi/mhi_pci_modem.c | 313 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/bus/mhi/mhi_pci_modem.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index e841c10..300b2db 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -20,3 +20,11 @@ config MHI_BUS_DEBUG
 	  Enable debugfs support for use with the MHI transport. Allows
 	  reading and/or modifying some values within the MHI controller
 	  for debug and test purposes.
+
+config MHI_BUS_PCI_MODEM
+	tristate "MHI WWAN modem PCI controller driver"
+	depends on MHI_BUS
+	depends on PCI
+	help
+	  This driver provides PCI controller driver for MHI WWAN modem
+	  devices such as Qualcomm SDX55 based PCIe modems.
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 19e6443..94ca2aa 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -1,2 +1,4 @@
 # core layer
 obj-y += core/
+
+obj-$(CONFIG_MHI_BUS_PCI_MODEM) := mhi_pci_modem.o
diff --git a/drivers/bus/mhi/mhi_pci_modem.c b/drivers/bus/mhi/mhi_pci_modem.c
new file mode 100644
index 0000000..b69b5ad
--- /dev/null
+++ b/drivers/bus/mhi/mhi_pci_modem.c
@@ -0,0 +1,313 @@
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
+
+#define MHI_PCI_BAR_NUM 0
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
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(12, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(13, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(14, "QMI", 4, 0),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(15, "QMI", 4, 0),
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(20, "IPCR", 16, 0),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(21, "IPCR", 4, 0),
+	MHI_CHANNEL_CONFIG_SIMPLE_TX(34, "IP_SW0", 16, 1),
+	MHI_CHANNEL_CONFIG_SIMPLE_RX(35, "IP_SW0", 16, 1)
+};
+
+static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
+	/* first ring is control+data ring */
+	MHI_EVENT_CONFIG_SIMPLE_CTRL(0),
+	/* dedicated ring for IP data */
+	MHI_EVENT_CONFIG_SIMPLE_DATA(1)
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
+	int num_vectors, i;
+	int *irq;
+
+	/*
+	 * Alloc one MSI vector per event ring, ideally...
+	 * No explicit pci_free_irq_vectors required, done by pcim_release
+	 */
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
+	if (!mhic)
+		return -ENOMEM;
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
+	.name		= "mhi-pci-modem",
+	.id_table	= mhi_pci_id_table,
+	.probe		= mhi_pci_probe,
+	.remove		= mhi_pci_remove
+};
+module_pci_driver(mhi_pci_driver);
+
+MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro,org>");
+MODULE_DESCRIPTION("MHI WWAN modem PCI controller driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

