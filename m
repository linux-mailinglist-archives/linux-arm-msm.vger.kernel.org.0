Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB361BF053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 08:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgD3GbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 02:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgD3GbP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 02:31:15 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6131EC035494
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 23:31:15 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so1872023plr.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 23:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YDsBwtoE922lbRRIN21POeyzZH3vm5ty0Me3gsX2XEY=;
        b=xOcSlXivtgma2oM87dsSHm+GEvbYm5YedlqW+BGP8V/lUo6aHSXnrCAnVy56m85yZ7
         pdU3B8FVd8J6hx9S/Jm4jivcCwYkO9DjeIYYBllXGzYArQM8h/f7nWUObuxYDhJd1GkQ
         em7VfB2kF3Jgp7EZRx89NWysWFYnsk/ZEALSjouM19yZxtbuTcq90qbRbZOEHCwiYAnb
         x4xTnKlVshn2NlWkxKVX81FNDutYOk+r0GcHZ9MucFY9lrlI4oS0sVcKbpXhk2iCsD1t
         qJyrNdj96FEGkGhTGytmBFCODbiXzsuqwa1NXR3xQ0tpYVdRXEWd6PmJIbQUnFsgJ+Ki
         2eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YDsBwtoE922lbRRIN21POeyzZH3vm5ty0Me3gsX2XEY=;
        b=gg/+JSmrP6EwXH69Yfn3Dx5OPUUsa1IRsn22eTIh3s1+aCGHlqGXtyJ3rQAOAxOlWm
         INeyRVOGhj4cqXzrTeEGdeH+Jii7xW+FaDfo9SV8qjdIx/P08droYWzG89SgfsvpkVPL
         /NGyKupa3ltnZv4h6kR+yrrR86A+chZ735tTaJGOX1pTNhDrRIvcece+DaEfzo1f7XQY
         Bh/9EURv9eoSRufbvRfyNRt8hLPlqB8xS5H+CuuBdRzEWkkbUEXsnvm/MwqIny4mtOug
         LcBvgbWoaYUpilkTasby7ReaMXNgVT1EwTe5wF8Kiq9Jhxo/pcMBLy8Cz/qC8kyAzXvk
         n3WQ==
X-Gm-Message-State: AGi0PuanCuhbsLr2esT+L87dDRvEZjkH1SGvc9AMPZ35xPUr9Gg+0LOz
        jhGGQSOgvx1S8yFM52HoDtLV
X-Google-Smtp-Source: APiQypIHCeNpHrBsL6I7gv5SM1DwdIeF8yB5XIBGV1kz4WVFhwyj22oB1wgZzd5HBROOgTPO/+RZNg==
X-Received: by 2002:a17:902:a515:: with SMTP id s21mr2288460plq.41.1588228274573;
        Wed, 29 Apr 2020 23:31:14 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id m7sm2676772pfb.48.2020.04.29.23.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 23:31:14 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] soc: qcom: ipcc: Add support for IPCC controller
Date:   Thu, 30 Apr 2020 12:00:54 +0530
Message-Id: <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>

Add support for the Inter-Processor Communication Controller (IPCC)
driver that coordinates the interrupts (inbound & outbound) for
Multiprocessor (MPROC), COMPUTE-Level0 (COMPUTE-L0) & COMPUTE-Level1
(COMPUTE-L1) protocols for the Application Processor Subsystem (APSS).

As a part of its inbound communication, the driver would be responsible
for forwarding the interrupts from various clients, such as Modem, DSPs,
PCIe, and so on, to the entities running on the APPS. As a result, it's
implemented as an irq_chip driver.

On the other hand, the driver also registers as a mailbox controller
that provides a mailbox interface to interrupt other clients connected
to the IPCC, acting as an outbound communication channel.

Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[mani: cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/Kconfig     |  11 +
 drivers/soc/qcom/Makefile    |   1 +
 drivers/soc/qcom/qcom_ipcc.c | 410 +++++++++++++++++++++++++++++++++++
 3 files changed, 422 insertions(+)
 create mode 100644 drivers/soc/qcom/qcom_ipcc.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index bf42a17a45de..97c380c3fa09 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -53,6 +53,17 @@ config QCOM_GSBI
 	  functions for connecting the underlying serial UART, SPI, and I2C
 	  devices to the output pins.
 
+config QCOM_IPCC
+	tristate "Qualcomm Technologies, Inc. IPCC driver"
+	depends on MAILBOX
+	help
+	  Qualcomm Technologies, Inc. IPCC driver for MSM devices. The drivers
+	  acts as an interrupt controller for the clients interested in
+	  talking to the IPCC (inbound-communication). On the other hand, the
+	  driver also provides a mailbox channel for outbound-communications.
+	  Say Y here to compile the driver as a part of kernel or M to compile
+	  as a module.
+
 config QCOM_LLCC
 	tristate "Qualcomm Technologies, Inc. LLCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 5d6b83dc58e8..b7658b007040 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -24,5 +24,6 @@ obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
 obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
+obj-$(CONFIG_QCOM_IPCC) += qcom_ipcc.o
 obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
 obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
diff --git a/drivers/soc/qcom/qcom_ipcc.c b/drivers/soc/qcom/qcom_ipcc.c
new file mode 100644
index 000000000000..5906a70220e0
--- /dev/null
+++ b/drivers/soc/qcom/qcom_ipcc.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/soc/qcom,ipcc.h>
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
+#define IPCC_CLIENT_ID_SHIFT		16
+
+#define IPCC_NO_PENDING_IRQ		0xffffffff
+
+/**
+ * struct qcom_ipcc_proto_data - Per-protocol data
+ * @irq_domain:		irq_domain associated with this protocol-id
+ * @mbox:		mailbox-controller interface
+ * @chans:		The mailbox clients channel array (created dynamically)
+ * @base:		Base address of the IPCC frame associated to APSS
+ * @dev:		Device associated with this instance
+ * @irq:		Summary irq
+ */
+struct qcom_ipcc_proto_data {
+	struct irq_domain *irq_domain;
+	struct mbox_controller mbox;
+	struct mbox_chan *chans;
+	void __iomem *base;
+	struct device *dev;
+	int irq;
+};
+
+/**
+ * struct qcom_ipcc_mbox_chan - Per-mailbox-channel data. Associated to
+ *				channel when requested by the clients
+ * @chan:	Points to this channel's array element for this protocol's
+ *		ipcc_protocol_data->chans[]
+ * @proto_data: The pointer to per-protocol data associated to this channel
+ * @client_id:	The client-id to which the interrupt has to be triggered
+ * @signal_id:	The signal-id to which the interrupt has to be triggered
+ */
+struct qcom_ipcc_mbox_chan {
+	struct mbox_chan *chan;
+	struct qcom_ipcc_proto_data *proto_data;
+	u16 client_id;
+	u16 signal_id;
+};
+
+static struct qcom_ipcc_proto_data *ipcc_proto_data;
+
+static inline u32 qcom_ipcc_get_packed_id(u16 client_id, u16 signal_id)
+{
+	return (client_id << IPCC_CLIENT_ID_SHIFT) | signal_id;
+}
+
+static inline u16 qcom_ipcc_get_client_id(u32 packed_id)
+{
+	return packed_id >> IPCC_CLIENT_ID_SHIFT;
+}
+
+static inline u16 qcom_ipcc_get_signal_id(u32 packed_id)
+{
+	return packed_id & IPCC_SIGNAL_ID_MASK;
+}
+
+static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
+{
+	struct qcom_ipcc_proto_data *proto_data = data;
+	u32 packed_id;
+	int virq;
+
+	for (;;) {
+		packed_id = readl(proto_data->base + IPCC_REG_RECV_ID);
+		if (packed_id == IPCC_NO_PENDING_IRQ)
+			break;
+
+		virq = irq_find_mapping(proto_data->irq_domain, packed_id);
+
+		dev_dbg(proto_data->dev,
+			"IRQ for client_id: %u; signal_id: %u; virq: %d\n",
+			qcom_ipcc_get_client_id(packed_id),
+			qcom_ipcc_get_signal_id(packed_id), virq);
+
+		writel(packed_id,
+		       proto_data->base + IPCC_REG_RECV_SIGNAL_CLEAR);
+
+		generic_handle_irq(virq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void qcom_ipcc_mask_irq(struct irq_data *irqd)
+{
+	struct qcom_ipcc_proto_data *proto_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
+	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
+	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);
+
+	proto_data = irq_data_get_irq_chip_data(irqd);
+
+	dev_dbg(proto_data->dev,
+		"Disabling interrupts for: client_id: %u; signal_id: %u\n",
+		sender_client_id, sender_signal_id);
+
+	writel(hwirq, proto_data->base + IPCC_REG_RECV_SIGNAL_DISABLE);
+}
+
+static void qcom_ipcc_unmask_irq(struct irq_data *irqd)
+{
+	struct qcom_ipcc_proto_data *proto_data;
+	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
+	u16 sender_client_id = qcom_ipcc_get_client_id(hwirq);
+	u16 sender_signal_id = qcom_ipcc_get_signal_id(hwirq);
+
+	proto_data = irq_data_get_irq_chip_data(irqd);
+
+	dev_dbg(proto_data->dev,
+		"Enabling interrupts for: client_id: %u; signal_id: %u\n",
+		sender_client_id, sender_signal_id);
+
+	writel(hwirq, proto_data->base + IPCC_REG_RECV_SIGNAL_ENABLE);
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
+	struct qcom_ipcc_proto_data *proto_data = d->host_data;
+
+	irq_set_chip_and_handler(irq, &qcom_ipcc_irq_chip, handle_level_irq);
+	irq_set_chip_data(irq, proto_data);
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
+	struct qcom_ipcc_proto_data *proto_data = d->host_data;
+	struct device *dev = proto_data->dev;
+
+	if (intsize != 3)
+		return -EINVAL;
+
+	*out_hwirq = qcom_ipcc_get_packed_id(intspec[0], intspec[1]);
+	*out_type = intspec[2] & IRQ_TYPE_SENSE_MASK;
+
+	dev_dbg(dev, "hwirq: 0x%lx\n", *out_hwirq);
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
+	struct qcom_ipcc_mbox_chan *ipcc_mbox_chan = chan->con_priv;
+	struct qcom_ipcc_proto_data *proto_data = ipcc_mbox_chan->proto_data;
+	u32 packed_id;
+
+	dev_dbg(proto_data->dev,
+		"Generating IRQ for client_id: %u; signal_id: %u\n",
+		ipcc_mbox_chan->client_id, ipcc_mbox_chan->signal_id);
+
+	packed_id = qcom_ipcc_get_packed_id(ipcc_mbox_chan->client_id,
+					    ipcc_mbox_chan->signal_id);
+	writel(packed_id, proto_data->base + IPCC_REG_SEND_ID);
+
+	return 0;
+}
+
+static void qcom_ipcc_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct qcom_ipcc_mbox_chan *ipcc_mbox_chan = chan->con_priv;
+
+	chan->con_priv = NULL;
+	kfree(ipcc_mbox_chan);
+}
+
+static struct mbox_chan *qcom_ipcc_mbox_xlate(struct mbox_controller *mbox,
+					const struct of_phandle_args *ph)
+{
+	struct device *dev;
+	struct qcom_ipcc_proto_data *proto_data;
+	struct qcom_ipcc_mbox_chan *ipcc_mbox_chan;
+	int chan_id;
+
+	proto_data = container_of(mbox, struct qcom_ipcc_proto_data, mbox);
+	if (WARN_ON(!proto_data))
+		return ERR_PTR(-EINVAL);
+
+	dev = proto_data->dev;
+
+	if (ph->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	/* Check whether the mbox channel is allocated or not */
+	for (chan_id = 0; chan_id < mbox->num_chans; chan_id++) {
+		ipcc_mbox_chan = proto_data->chans[chan_id].con_priv;
+
+		if (!ipcc_mbox_chan)
+			break;
+		else if (ipcc_mbox_chan->client_id == ph->args[0] &&
+			 ipcc_mbox_chan->signal_id == ph->args[1])
+			return ERR_PTR(-EBUSY);
+	}
+
+	if (chan_id >= mbox->num_chans)
+		return ERR_PTR(-EBUSY);
+
+	ipcc_mbox_chan = kzalloc(sizeof(*ipcc_mbox_chan), GFP_KERNEL);
+	if (!ipcc_mbox_chan)
+		return ERR_PTR(-ENOMEM);
+
+	ipcc_mbox_chan->client_id = ph->args[0];
+	ipcc_mbox_chan->signal_id = ph->args[1];
+	ipcc_mbox_chan->chan = &proto_data->chans[chan_id];
+	ipcc_mbox_chan->proto_data = proto_data;
+	ipcc_mbox_chan->chan->con_priv = ipcc_mbox_chan;
+
+	dev_dbg(dev,
+		"New mailbox channel: %u for client_id: %u; signal_id: %u\n",
+		chan_id, ipcc_mbox_chan->client_id,
+		ipcc_mbox_chan->signal_id);
+
+	return ipcc_mbox_chan->chan;
+}
+
+static const struct mbox_chan_ops ipcc_mbox_chan_ops = {
+	.send_data = qcom_ipcc_mbox_send_data,
+	.shutdown = qcom_ipcc_mbox_shutdown
+};
+
+static int qcom_ipcc_setup_mbox(struct qcom_ipcc_proto_data *proto_data,
+				struct device_node *controller_dn)
+{
+	struct mbox_controller *mbox;
+	struct device_node *client_dn;
+	struct device *dev = proto_data->dev;
+	struct of_phandle_args curr_ph;
+	int i, j, ret;
+	int num_chans = 0;
+
+	/*
+	 * Find out the number of clients interested in this mailbox
+	 * and create channels accordingly.
+	 */
+	for_each_node_with_property(client_dn, "mboxes") {
+		if (!of_device_is_available(client_dn))
+			continue;
+		i = of_count_phandle_with_args(client_dn,
+					       "mboxes", "#mbox-cells");
+		for (j = 0; j < i; j++) {
+			ret = of_parse_phandle_with_args(client_dn, "mboxes",
+							 "#mbox-cells", j,
+							 &curr_ph);
+			of_node_put(curr_ph.np);
+			if (!ret && curr_ph.np == controller_dn) {
+				num_chans++;
+				break;
+			}
+		}
+	}
+
+	/* If no clients are found, skip registering as a mbox controller */
+	if (!num_chans)
+		return 0;
+
+	proto_data->chans = devm_kcalloc(dev, num_chans,
+					 sizeof(struct mbox_chan), GFP_KERNEL);
+	if (!proto_data->chans)
+		return -ENOMEM;
+
+	mbox = &proto_data->mbox;
+	mbox->dev = dev;
+	mbox->num_chans = num_chans;
+	mbox->chans = proto_data->chans;
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
+	struct qcom_ipcc_proto_data *proto_data;
+	int ret;
+
+	proto_data = devm_kzalloc(&pdev->dev, sizeof(*proto_data), GFP_KERNEL);
+	if (!proto_data)
+		return -ENOMEM;
+
+	ipcc_proto_data = proto_data;
+	proto_data->dev = &pdev->dev;
+
+	proto_data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(proto_data->base)) {
+		dev_err(&pdev->dev, "Failed to ioremap the ipcc base addr\n");
+		return PTR_ERR(proto_data->base);
+	}
+
+	proto_data->irq = platform_get_irq(pdev, 0);
+	if (proto_data->irq < 0) {
+		dev_err(&pdev->dev, "Failed to get the IRQ\n");
+		return proto_data->irq;
+	}
+
+	/* Perform a SW reset on this client's protocol state */
+	writel(0x1, proto_data->base + IPCC_REG_CLIENT_CLEAR);
+
+	proto_data->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
+						     &qcom_ipcc_irq_ops,
+						     proto_data);
+	if (!proto_data->irq_domain) {
+		dev_err(&pdev->dev, "Failed to add irq_domain\n");
+		return -ENOMEM;
+	}
+
+	ret = qcom_ipcc_setup_mbox(proto_data, pdev->dev.of_node);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to create mailbox\n");
+		goto err_mbox;
+	}
+
+	ret = devm_request_irq(&pdev->dev, proto_data->irq, qcom_ipcc_irq_fn,
+			       IRQF_TRIGGER_HIGH, "ipcc", proto_data);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
+		goto err_mbox;
+	}
+
+	enable_irq_wake(proto_data->irq);
+	platform_set_drvdata(pdev, proto_data);
+
+	return 0;
+
+err_mbox:
+	irq_domain_remove(proto_data->irq_domain);
+
+	return ret;
+}
+
+static int qcom_ipcc_remove(struct platform_device *pdev)
+{
+	struct qcom_ipcc_proto_data *proto_data = platform_get_drvdata(pdev);
+
+	disable_irq_wake(proto_data->irq);
+	irq_domain_remove(proto_data->irq_domain);
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
+		.name = "qcom_ipcc",
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
+static void __exit qcom_ipcc_exit(void)
+{
+	platform_driver_unregister(&qcom_ipcc_driver);
+}
+module_exit(qcom_ipcc_exit);
+
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

