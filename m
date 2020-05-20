Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37291DADEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 10:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgETItO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 04:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgETItN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 04:49:13 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BBFC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q16so1050054plr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvYWluKKU2UolMcgxVEDaLNEXzIqtO8nLMad0lDCN5A=;
        b=ZcUyInzRF+hh8DD7fDkFTJDebaujTMJpmKVxnQnW7rOJBZskvFLLteC2sCsl13wj2w
         VM/l0rXZ+4wAW7PYTwNZbyADeOeXQ403QriqLcUdpjBf1L5EICk5lmB8tfQaadAMpVC7
         Uid8u+u6t81XBVHiPganieFyR1nrE1+xyrS1mFEqi3ND+LqfiDxn+fwgyASjuBf7E1na
         PvjXJshrKwAnD6RHMDMfuwliLGECAEENYaUqhV/CN/Pr2+DHFU5zWJeETCVP/kTKaqLh
         pg0lOVcASA0vv6nVy4VOPL2rUxD0kVVtMX/pVT1WyvESAQ/qvDOJA13vEsezVlhLg8Mz
         3+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvYWluKKU2UolMcgxVEDaLNEXzIqtO8nLMad0lDCN5A=;
        b=XJr7ExIlGVlBaVn0vQkPN3ywq7M/DSUunrY5bi9Q6Y1YXVD6VbZh1NHX3JVBe2OjTw
         wdZVcAidvA6A/ZbH/rXk/CmCjEOPsrc7RTpmId3H7VQ2oUxjuc/X2Pe5iRCaMAdKtc/w
         Spo7zYyyP+aB5pXsTfvP0aC3ZvrPLn8FRuHSbzYk3R2blv/H60YXR6iLXfd72ATnvsAN
         eCa0gxgcSWGrrUSuQmFc/902PhF1Q4BFoH9/ckDiTZbJtW1F7LnS42uVKABRo449M92Z
         Bh/sNAacQhLe3IIDuWxX6ssYvkEWuF2WUZkL2lSIWkioumFWb65isTvzOWaWyeHTdVjB
         0Q8Q==
X-Gm-Message-State: AOAM5337xvuAJJ/uMfc9+1pS5XARWQD5hWdT2I8GC6ESKoVJQ5Tj1gAo
        dAgDDZw6ToS1mPFMf45Ca39z
X-Google-Smtp-Source: ABdhPJwM7obwLShdC2UbmccZEkgi2STqWmoKlfq/DbLhH364vgHdpVGUXk8pjnlRTFb3lnfUw46y9w==
X-Received: by 2002:a17:902:7088:: with SMTP id z8mr3446767plk.71.1589964553198;
        Wed, 20 May 2020 01:49:13 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:91e:dd0a:7c30:1f7e:ebdb:aa2a])
        by smtp.gmail.com with ESMTPSA id a5sm1629332pfk.210.2020.05.20.01.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:49:12 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH v3 2/3] mailbox: Add support for Qualcomm IPCC
Date:   Wed, 20 May 2020 14:18:53 +0530
Message-Id: <20200520084854.19729-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Inter-Processor Communication Controller (IPCC)
block from Qualcomm that coordinates the interrupts (inbound & outbound)
for Multiprocessor (MPROC), COMPUTE-Level0 (COMPUTE-L0) & COMPUTE-Level1
(COMPUTE-L1) protocols for the Application Processor Subsystem (APSS).

This driver is modeled as an irqchip+mailbox driver. The irqchip part
helps in receiving the interrupts from the IPCC clients such as modems,
DSPs, PCI-E etc... and forwards them to respective entities in APSS.

On the other hand, the mailbox part is used to send interrupts to the IPCC
clients from the entities of APSS.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[mani: moved to mailbox, added static mbox channels and cleanups]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mailbox/Kconfig     |  10 ++
 drivers/mailbox/Makefile    |   2 +
 drivers/mailbox/qcom-ipcc.c | 286 ++++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)
 create mode 100644 drivers/mailbox/qcom-ipcc.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 5a577a6734cf..8e1ebdbf8eab 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -236,4 +236,14 @@ config SUN6I_MSGBOX
 	  various Allwinner SoCs. This mailbox is used for communication
 	  between the application CPUs and the power management coprocessor.
 
+config QCOM_IPCC
+	bool "Qualcomm Technologies, Inc. IPCC driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Qualcomm Technologies, Inc. Inter-Processor Communication Controller
+	  (IPCC) driver for MSM devices. The driver provides mailbox support for
+	  sending interrupts to the clients. On the other hand, the driver also
+	  acts as an interrupt controller for receiving interrupts from clients.
+	  Say Y here if you want to build this driver.
+
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 2e4364ef5c47..20b66b2219aa 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -50,3 +50,5 @@ obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
+
+obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
new file mode 100644
index 000000000000..2d13c72944c6
--- /dev/null
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+
+#define IPCC_MBOX_MAX_CHAN		48
+
+/* IPCC Register offsets */
+#define IPCC_REG_SEND_ID		0x0c
+#define IPCC_REG_RECV_ID		0x10
+#define IPCC_REG_RECV_SIGNAL_ENABLE	0x14
+#define IPCC_REG_RECV_SIGNAL_DISABLE	0x18
+#define IPCC_REG_RECV_SIGNAL_CLEAR	0x1c
+#define IPCC_REG_CLIENT_CLEAR		0x38
+
+#define IPCC_SIGNAL_ID_MASK		GENMASK(15, 0)
+#define IPCC_CLIENT_ID_MASK		GENMASK(31, 16)
+
+#define IPCC_NO_PENDING_IRQ		GENMASK(31, 0)
+
+/**
+ * struct qcom_ipcc_chan_info - Per-mailbox-channel info
+ * @client_id:	The client-id to which the interrupt has to be triggered
+ * @signal_id:	The signal-id to which the interrupt has to be triggered
+ */
+struct qcom_ipcc_chan_info {
+	u16 client_id;
+	u16 signal_id;
+};
+
+/**
+ * struct qcom_ipcc - Holder for the mailbox driver
+ * @dev:		Device associated with this instance
+ * @base:		Base address of the IPCC frame associated to APSS
+ * @irq_domain:		The irq_domain associated with this instance
+ * @chan:		The mailbox channels array
+ * @mchan:		The per-mailbox channel info array
+ * @mbox:		The mailbox controller
+ * @irq:		Summary irq
+ */
+struct qcom_ipcc {
+	struct device *dev;
+	void __iomem *base;
+	struct irq_domain *irq_domain;
+	struct mbox_chan chan[IPCC_MBOX_MAX_CHAN];
+	struct qcom_ipcc_chan_info mchan[IPCC_MBOX_MAX_CHAN];
+	struct mbox_controller mbox;
+	int irq;
+};
+
+static inline struct qcom_ipcc *to_qcom_ipcc(struct mbox_controller *mbox)
+{
+	return container_of(mbox, struct qcom_ipcc, mbox);
+}
+
+static inline u32 qcom_ipcc_get_hwirq(u16 client_id, u16 signal_id)
+{
+	return FIELD_PREP(IPCC_CLIENT_ID_MASK, client_id) |
+	       FIELD_PREP(IPCC_SIGNAL_ID_MASK, signal_id);
+}
+
+static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
+{
+	struct qcom_ipcc *ipcc = data;
+	u32 hwirq;
+	int virq;
+
+	for (;;) {
+		hwirq = readl(ipcc->base + IPCC_REG_RECV_ID);
+		if (hwirq == IPCC_NO_PENDING_IRQ)
+			break;
+
+		virq = irq_find_mapping(ipcc->irq_domain, hwirq);
+		writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_CLEAR);
+		generic_handle_irq(virq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void qcom_ipcc_mask_irq(struct irq_data *irqd)
+{
+	struct qcom_ipcc *ipcc = irq_data_get_irq_chip_data(irqd);
+	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
+
+	writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_DISABLE);
+}
+
+static void qcom_ipcc_unmask_irq(struct irq_data *irqd)
+{
+	struct qcom_ipcc *ipcc = irq_data_get_irq_chip_data(irqd);
+	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
+
+	writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_ENABLE);
+}
+
+static struct irq_chip qcom_ipcc_irq_chip = {
+	.name = "ipcc",
+	.irq_mask = qcom_ipcc_mask_irq,
+	.irq_unmask = qcom_ipcc_unmask_irq,
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int qcom_ipcc_domain_map(struct irq_domain *d, unsigned int irq,
+				irq_hw_number_t hw)
+{
+	struct qcom_ipcc *ipcc = d->host_data;
+
+	irq_set_chip_and_handler(irq, &qcom_ipcc_irq_chip, handle_level_irq);
+	irq_set_chip_data(irq, ipcc);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static int qcom_ipcc_domain_xlate(struct irq_domain *d,
+				  struct device_node *node, const u32 *intspec,
+				  unsigned int intsize,
+				  unsigned long *out_hwirq,
+				  unsigned int *out_type)
+{
+	if (intsize != 3)
+		return -EINVAL;
+
+	*out_hwirq = qcom_ipcc_get_hwirq(intspec[0], intspec[1]);
+	*out_type = intspec[2] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
+}
+
+static const struct irq_domain_ops qcom_ipcc_irq_ops = {
+	.map = qcom_ipcc_domain_map,
+	.xlate = qcom_ipcc_domain_xlate,
+};
+
+static int qcom_ipcc_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct qcom_ipcc *ipcc = to_qcom_ipcc(chan->mbox);
+	struct qcom_ipcc_chan_info *mchan = chan->con_priv;
+	u32 hwirq;
+
+	hwirq = qcom_ipcc_get_hwirq(mchan->client_id, mchan->signal_id);
+	writel(hwirq, ipcc->base + IPCC_REG_SEND_ID);
+
+	return 0;
+}
+
+static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
+					const struct of_phandle_args *ph)
+{
+	struct qcom_ipcc *ipcc = to_qcom_ipcc(mbox);
+	struct qcom_ipcc_chan_info *mchan;
+	struct mbox_chan *chan;
+	unsigned int i;
+
+	if (ph->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < IPCC_MBOX_MAX_CHAN; i++) {
+		chan = &ipcc->chan[i];
+		if (!chan->con_priv) {
+			mchan = &ipcc->mchan[i];
+			mchan->client_id = ph->args[0];
+			mchan->signal_id = ph->args[1];
+			chan->con_priv = mchan;
+			break;
+		}
+
+		chan = NULL;
+	}
+
+	return chan ?: ERR_PTR(-EBUSY);
+}
+
+static const struct mbox_chan_ops ipcc_mbox_chan_ops = {
+	.send_data = qcom_ipcc_mbox_send_data,
+};
+
+static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc)
+{
+	struct mbox_controller *mbox;
+	struct device *dev = ipcc->dev;
+
+	mbox = &ipcc->mbox;
+	mbox->dev = dev;
+	mbox->num_chans = IPCC_MBOX_MAX_CHAN;
+	mbox->chans = ipcc->chan;
+	mbox->ops = &ipcc_mbox_chan_ops;
+	mbox->of_xlate = qcom_ipcc_mbox_xlate;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = false;
+
+	return devm_mbox_controller_register(dev, mbox);
+}
+
+static int qcom_ipcc_probe(struct platform_device *pdev)
+{
+	struct qcom_ipcc *ipcc;
+	int ret;
+
+	ipcc = devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
+	if (!ipcc)
+		return -ENOMEM;
+
+	ipcc->dev = &pdev->dev;
+
+	ipcc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ipcc->base))
+		return PTR_ERR(ipcc->base);
+
+	ipcc->irq = platform_get_irq(pdev, 0);
+	if (ipcc->irq < 0)
+		return ipcc->irq;
+
+	ipcc->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
+					       &qcom_ipcc_irq_ops, ipcc);
+	if (!ipcc->irq_domain)
+		return -ENOMEM;
+
+	ret = qcom_ipcc_setup_mbox(ipcc);
+	if (ret)
+		goto err_mbox;
+
+	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
+			       IRQF_TRIGGER_HIGH, "ipcc", ipcc);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
+		goto err_mbox;
+	}
+
+	enable_irq_wake(ipcc->irq);
+	platform_set_drvdata(pdev, ipcc);
+
+	return 0;
+
+err_mbox:
+	irq_domain_remove(ipcc->irq_domain);
+
+	return ret;
+}
+
+static int qcom_ipcc_remove(struct platform_device *pdev)
+{
+	struct qcom_ipcc *ipcc = platform_get_drvdata(pdev);
+
+	disable_irq_wake(ipcc->irq);
+	irq_domain_remove(ipcc->irq_domain);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_ipcc_of_match[] = {
+	{ .compatible = "qcom,ipcc"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_ipcc_of_match);
+
+static struct platform_driver qcom_ipcc_driver = {
+	.probe = qcom_ipcc_probe,
+	.remove = qcom_ipcc_remove,
+	.driver = {
+		.name = "qcom-ipcc",
+		.of_match_table = qcom_ipcc_of_match,
+	},
+};
+
+static int __init qcom_ipcc_init(void)
+{
+	return platform_driver_register(&qcom_ipcc_driver);
+}
+arch_initcall(qcom_ipcc_init);
+
+MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>");
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPCC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.GIT

