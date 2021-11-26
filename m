Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B132645EA91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 10:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376457AbhKZJop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 04:44:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376390AbhKZJmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 04:42:45 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AAAC061758
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 01:36:01 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id r138so7641005pgr.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 01:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/8z1MPsG3RxsmPZSIKIcOmZ5/8G0EQJpbpkBNUt0CwQ=;
        b=okOPbV2vjzzTmEF+k5vtlCoIMc4HVHy0b1KwEkrQDMCvfJGC6gh7oIYsXa0PM/LN/s
         E6wynCVy1fhDwdxq/fAgLNvTYrMENKPzPr2grYfamjCMBCQrG1Il3HGbfwd9/q6W5T1h
         GFE3BEHpns6+cXHJNC3rEj+Fg2HStp7/T8MaOwpfJ+eSIyzpE4rsfPeotHW5K6STqoiU
         zGc1RwyItsPEcyztL+Q5cRbhNU6TzWakf8qhEOYp3A2bvNrH7OWh1agZ2DqDntwGYkY4
         1kI7KLn1PhZbeRzdfWwE/MtbDU4MpH4Vop9U2zT2RqkRjbm+eCYocLmx5yAjvE08vs4D
         GbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/8z1MPsG3RxsmPZSIKIcOmZ5/8G0EQJpbpkBNUt0CwQ=;
        b=7lVt4vhDuEFphfKdi8qS/VoCGRzeGy2W+NoN4jH6R90A7kHyRn1f7B4wSTFE/MR+CV
         VGH4vqFlsbkHOPQ6nt/AVPC5wVsDcZfrsWlfzvMsELAZtEsqrQaa++e2Po3I3MFeSU+k
         NYKDPoFMAVooaDJLqjHEzd7zjerRNC0JL2AndeEqGGiinSyoT8rmk2/Pi9fAQ5ZkGARW
         dQXjz0mq1uoPy9DvqWQa0CdxvZu/LM6WQGRpfSAZuIkPcUZ5f9FaT6mbo9Hchp2QN+5K
         c3mk6P98PYIinntsltu3RTeBzMknUXlmPzbIKwSFlxUmTYprMxxE+58PnR45oBjEabrJ
         UdhQ==
X-Gm-Message-State: AOAM533GESsCLZiE9h363RVZG2/8NlkYh/dvcUc0pasn7pHzMrMewfXj
        ICc/0mPThAJGU+/9aHIsVpGhDg==
X-Google-Smtp-Source: ABdhPJxA24XqtmUa8B3CYFPxN/JAkZwN366xaiXoikPeVV64w2XcnJ2cCIIMNd3b3OvxeSZ3RdmSxg==
X-Received: by 2002:a63:550a:: with SMTP id j10mr861702pgb.400.1637919360462;
        Fri, 26 Nov 2021 01:36:00 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q11sm6079647pfk.192.2021.11.26.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 01:36:00 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
Date:   Fri, 26 Nov 2021 17:35:29 +0800
Message-Id: <20211126093529.31661-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211126093529.31661-1-shawn.guo@linaro.org>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm SoCs based on the RPM architecture have a MSM Power Manager (MPM)
in always-on domain. In addition to managing resources during sleep, the
hardware also has an interrupt controller that monitors the interrupts
when the system is asleep, wakes up the APSS when one of these interrupts
occur and replays it to GIC after it becomes operational.

It adds an irqchip driver for this interrupt controller, and here are
some notes about it.

- For given SoC, a fixed number of MPM pins are supported, e.g. 96 pins
  on QCM2290.  Each of these MPM pins can be either a MPM_GIC pin or
  a MPM_GPIO pin. The mapping between MPM_GIC pin and GIC interrupt
  is defined by SoC, as well as the mapping between MPM_GPIO pin and
  GPIO number.  The former mapping can be found as the SoC data in this
  MPM driver, while the latter can be found as the msm_gpio_wakeirq_map[]
  in TLMM driver.

- Two irq domains are created for a single irq_chip to handle MPM_GIC
  and MPM_GPIO pins respectively, i.e. MPM_GIC domain and MPM_GPIO domain.
  The former is a child domain of GIC irq domain, while the latter is
  a parent domain of TLMM/GPIO irq domain.

- All the register settings are done by APSS on the an internal memory
  region called vMPM, and RPM will flush them into hardware after it
  receives a mailbox/IPC notification from APSS.

- When SoC gets awake from sleep mode, the driver will receive an
  interrupt from RPM, so that it can replay interrupt for particular
  polarity.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/irqchip/Kconfig    |   8 +
 drivers/irqchip/Makefile   |   1 +
 drivers/irqchip/qcom-mpm.c | 487 +++++++++++++++++++++++++++++++++++++
 3 files changed, 496 insertions(+)
 create mode 100644 drivers/irqchip/qcom-mpm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7038957f4a77..e126b19190ef 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -430,6 +430,14 @@ config QCOM_PDC
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
 
+config QCOM_MPM
+	bool "QCOM MPM"
+	depends on ARCH_QCOM
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  MSM Power Manager driver to manage and configure wakeup
+	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
+
 config CSKY_MPINTC
 	bool
 	depends on CSKY
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index c1f611cbfbf8..0e2e10467e28 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -94,6 +94,7 @@ obj-$(CONFIG_MESON_IRQ_GPIO)		+= irq-meson-gpio.o
 obj-$(CONFIG_GOLDFISH_PIC) 		+= irq-goldfish-pic.o
 obj-$(CONFIG_NDS32)			+= irq-ativic32.o
 obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
+obj-$(CONFIG_QCOM_MPM)			+= qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
diff --git a/drivers/irqchip/qcom-mpm.c b/drivers/irqchip/qcom-mpm.c
new file mode 100644
index 000000000000..1880c734155f
--- /dev/null
+++ b/drivers/irqchip/qcom-mpm.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Linaro Limited
+ * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/arm-gic-v3.h>
+#include <linux/irqdomain.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+/*
+ * vMPM register layout:
+ *
+ *    31                              0
+ *    +--------------------------------+
+ *    |            TIMER0              | 0x00
+ *    +--------------------------------+
+ *    |            TIMER1              | 0x04
+ *    +--------------------------------+
+ *    |            ENABLE0             | 0x08
+ *    +--------------------------------+
+ *    |              ...               | ...
+ *    +--------------------------------+
+ *    |            ENABLEn             |
+ *    +--------------------------------+
+ *    |          FALLING_EDGE0         |
+ *    +--------------------------------+
+ *    |              ...               |
+ *    +--------------------------------+
+ *    |            STATUSn             |
+ *    +--------------------------------+
+ *
+ * n = DIV_ROUND_UP(pin_num, 32)
+ *
+ */
+#define MPM_REG_ENABLE		0
+#define MPM_REG_FALLING_EDGE	1
+#define MPM_REG_RISING_EDGE	2
+#define MPM_REG_POLARITY	3
+#define MPM_REG_STATUS		4
+
+#define MPM_NO_PARENT_IRQ	~0UL
+
+/* MPM pin and its GIC hwirq */
+struct mpm_pin {
+	int pin;
+	irq_hw_number_t hwirq;
+};
+
+struct mpm_data {
+	unsigned int pin_num;
+	const struct mpm_pin *gic_pins;
+};
+
+struct qcom_mpm_priv {
+	void __iomem *base;
+	spinlock_t lock;
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+	const struct mpm_data *data;
+	unsigned int reg_stride;
+
+	/* MPM pin to Linux irq number */
+	unsigned int *pin_to_irq;
+};
+
+static inline u32
+qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg, unsigned int index)
+{
+	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+
+	return readl(priv->base + offset);
+}
+
+static inline void
+qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+	       unsigned int index, u32 val)
+{
+	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	u32 r_val;
+
+	writel(val, priv->base + offset);
+
+	do {
+		r_val = readl(priv->base + offset);
+		udelay(5);
+	} while (r_val != val);
+}
+
+static inline void qcom_mpm_enable_irq(struct irq_data *d, bool en)
+{
+	struct qcom_mpm_priv *priv = d->domain->host_data;
+	int pin = d->hwirq;
+	unsigned int index = pin / 32;
+	unsigned int shift = pin % 32;
+	unsigned long flags;
+	u32 val;
+
+	priv->pin_to_irq[pin] = d->irq;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	val = qcom_mpm_read(priv, MPM_REG_ENABLE, index);
+	if (en)
+		val |= 1 << shift;
+	else
+		val &= ~(1 << shift);
+	qcom_mpm_write(priv, MPM_REG_ENABLE, index, val);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void qcom_mpm_mask(struct irq_data *d)
+{
+	qcom_mpm_enable_irq(d, false);
+
+	if (d->parent_data)
+		irq_chip_mask_parent(d);
+}
+
+static void qcom_mpm_unmask(struct irq_data *d)
+{
+	qcom_mpm_enable_irq(d, true);
+
+	if (d->parent_data)
+		irq_chip_unmask_parent(d);
+}
+
+static inline void
+mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+	     unsigned int index, unsigned int shift)
+{
+	u32 val;
+
+	val = qcom_mpm_read(priv, reg, index);
+	if (set)
+		val |= 1 << shift;
+	else
+		val &= ~(1 << shift);
+	qcom_mpm_write(priv, reg, index, val);
+}
+
+static int qcom_mpm_set_type(struct irq_data *d, unsigned int type)
+{
+	struct qcom_mpm_priv *priv = d->domain->host_data;
+	int pin = d->hwirq;
+	unsigned int index = pin / 32;
+	unsigned int shift = pin % 32;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	mpm_set_type(priv, (type & IRQ_TYPE_EDGE_RISING) ? 1 : 0,
+		     MPM_REG_RISING_EDGE, index, shift);
+	mpm_set_type(priv, (type & IRQ_TYPE_EDGE_FALLING) ? 1 : 0,
+		     MPM_REG_FALLING_EDGE, index, shift);
+	mpm_set_type(priv, (type & IRQ_TYPE_LEVEL_HIGH) ? 1 : 0,
+		     MPM_REG_POLARITY, index, shift);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	if (!d->parent_data)
+		return 0;
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		type = IRQ_TYPE_EDGE_RISING;
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		type = IRQ_TYPE_LEVEL_HIGH;
+
+	return irq_chip_set_type_parent(d, type);
+}
+
+static struct irq_chip qcom_mpm_chip = {
+	.name = "mpm",
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_mask = qcom_mpm_mask,
+	.irq_disable = qcom_mpm_mask,
+	.irq_unmask = qcom_mpm_unmask,
+	.irq_retrigger = irq_chip_retrigger_hierarchy,
+	.irq_set_type = qcom_mpm_set_type,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,
+	.irq_set_affinity = irq_chip_set_affinity_parent,
+};
+
+static irq_hw_number_t get_parent_hwirq(struct qcom_mpm_priv *priv, int pin)
+{
+	const struct mpm_pin *gic_pins = priv->data->gic_pins;
+	int i;
+
+	for (i = 0; gic_pins[i].pin >= 0; i++) {
+		int p = gic_pins[i].pin;
+
+		if (p < 0)
+			break;
+
+		if (p == pin)
+			return gic_pins[i].hwirq;
+	}
+
+	return MPM_NO_PARENT_IRQ;
+}
+
+static int
+qcom_mpm_translate(struct irq_domain *domain, struct irq_fwspec *fwspec,
+		   unsigned long *hwirq, unsigned int *type)
+{
+	if (is_of_node(fwspec->fwnode)) {
+		if (fwspec->param_count != 2)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[0];
+		*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int qcom_mpm_gic_alloc(struct irq_domain *domain, unsigned int virq,
+			      unsigned int nr_irqs, void *data)
+{
+	struct qcom_mpm_priv *priv = domain->host_data;
+	struct irq_fwspec *fwspec = data;
+	struct irq_fwspec parent_fwspec;
+	irq_hw_number_t parent_hwirq;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int  ret;
+
+	ret = qcom_mpm_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &qcom_mpm_chip, NULL);
+	if (ret)
+		return ret;
+
+	parent_hwirq = get_parent_hwirq(priv, hwirq);
+	if (parent_hwirq == MPM_NO_PARENT_IRQ)
+		return irq_domain_disconnect_hierarchy(domain->parent, virq);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		type = IRQ_TYPE_EDGE_RISING;
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		type = IRQ_TYPE_LEVEL_HIGH;
+
+	parent_fwspec.fwnode      = domain->parent->fwnode;
+	parent_fwspec.param_count = 3;
+	parent_fwspec.param[0]    = 0;
+	parent_fwspec.param[1]    = parent_hwirq;
+	parent_fwspec.param[2]    = type;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
+					    &parent_fwspec);
+}
+
+static const struct irq_domain_ops qcom_mpm_gic_ops = {
+	.alloc = qcom_mpm_gic_alloc,
+	.free = irq_domain_free_irqs_common,
+	.translate = qcom_mpm_translate,
+};
+
+static int qcom_mpm_gpio_alloc(struct irq_domain *domain, unsigned int virq,
+			       unsigned int nr_irqs, void *data)
+{
+	struct irq_fwspec *fwspec = data;
+	unsigned int type = IRQ_TYPE_NONE;
+	irq_hw_number_t hwirq;
+	int ret;
+
+	ret = qcom_mpm_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	return irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					     &qcom_mpm_chip, NULL);
+}
+
+static int qcom_mpm_gpio_domain_select(struct irq_domain *domain,
+				       struct irq_fwspec *fwspec,
+				       enum irq_domain_bus_token bus_token)
+{
+	return bus_token == DOMAIN_BUS_WAKEUP;
+}
+
+static const struct irq_domain_ops qcom_mpm_gpio_ops = {
+	.select = qcom_mpm_gpio_domain_select,
+	.alloc = qcom_mpm_gpio_alloc,
+	.free = irq_domain_free_irqs_common,
+	.translate = qcom_mpm_translate,
+};
+
+/* Triggered by RPM when system resumes from deep sleep */
+static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
+{
+	struct qcom_mpm_priv *priv = dev_id;
+	unsigned long enable, pending;
+	int i, j;
+
+	for (i = 0; i < priv->reg_stride; i++) {
+		enable = qcom_mpm_read(priv, MPM_REG_ENABLE, i);
+		pending = qcom_mpm_read(priv, MPM_REG_STATUS, i);
+		pending &= enable;
+
+		for_each_set_bit(j, &pending, 32) {
+			unsigned int pin = 32 * i + j;
+			int irq = priv->pin_to_irq[pin];
+			struct irq_desc *desc = irq ? irq_to_desc(irq) : NULL;
+
+			if (desc && !irqd_is_level_type(&desc->irq_data))
+				irq_set_irqchip_state(irq,
+						IRQCHIP_STATE_PENDING, true);
+
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_mpm_probe(struct platform_device *pdev)
+{
+	struct irq_domain *parent_domain, *mpm_gic_domain, *mpm_gpio_domain;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *parent = of_irq_find_parent(np);
+	struct qcom_mpm_priv *priv;
+	unsigned int pin_num;
+	int irq;
+	int ret;
+
+	/* See comments in platform_irqchip_probe() */
+	if (parent && !irq_find_matching_host(parent, DOMAIN_BUS_ANY))
+		return -EPROBE_DEFER;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->data = of_device_get_match_data(dev);
+	if (!priv->data)
+		return -ENODEV;
+
+	pin_num = priv->data->pin_num;
+	priv->pin_to_irq = devm_kcalloc(dev, pin_num, sizeof(*priv->pin_to_irq),
+					GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg_stride = DIV_ROUND_UP(pin_num, 32);
+	spin_lock_init(&priv->lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (!priv->base)
+		return PTR_ERR(priv->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		dev_err(dev, "failed to find MPM parent domain\n");
+		return -ENXIO;
+	}
+
+	mpm_gic_domain = irq_domain_create_hierarchy(parent_domain, 0, pin_num,
+				of_node_to_fwnode(np), &qcom_mpm_gic_ops, priv);
+	if (!mpm_gic_domain) {
+		dev_err(dev, "failed to create GIC domain\n");
+		return -ENOMEM;
+	}
+
+	mpm_gpio_domain = irq_domain_create_linear(of_node_to_fwnode(np),
+				pin_num, &qcom_mpm_gpio_ops, priv);
+	if (!mpm_gpio_domain) {
+		dev_err(dev, "failed to create GPIO domain\n");
+		goto remove_gic_domain;
+	}
+
+	irq_domain_update_bus_token(mpm_gpio_domain, DOMAIN_BUS_WAKEUP);
+
+	priv->mbox_client.dev = dev;
+	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
+	if (IS_ERR(priv->mbox_chan)) {
+		ret = PTR_ERR(priv->mbox_chan);
+		dev_err(dev, "failed to acquire IPC channel: %d\n", ret);
+		goto remove_gpio_domain;
+	}
+
+	ret = devm_request_irq(dev, irq, qcom_mpm_handler,
+			       IRQF_TRIGGER_RISING | IRQF_NO_SUSPEND,
+			       "qcom_mpm", priv);
+	if (ret) {
+		dev_err(dev, "failed to request irq: %d\n", ret);
+		goto free_mbox;
+	}
+
+	dev_set_drvdata(dev, priv);
+
+	return 0;
+
+free_mbox:
+	mbox_free_channel(priv->mbox_chan);
+remove_gpio_domain:
+	irq_domain_remove(mpm_gpio_domain);
+remove_gic_domain:
+	irq_domain_remove(mpm_gic_domain);
+	return ret;
+}
+
+static int __maybe_unused qcom_mpm_suspend_late(struct device *dev)
+{
+	struct qcom_mpm_priv *priv = dev_get_drvdata(dev);
+	int i, ret;
+
+	for (i = 0; i < priv->reg_stride; i++)
+		qcom_mpm_write(priv, MPM_REG_STATUS, i, 0);
+
+	/* Notify RPM to write vMPM into HW */
+	ret = mbox_send_message(priv->mbox_chan, NULL);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int __maybe_unused qcom_mpm_resume_early(struct device *dev)
+{
+	/* Nothing to do for now */
+	return 0;
+}
+
+static const struct dev_pm_ops qcom_mpm_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mpm_suspend_late,
+				     qcom_mpm_resume_early)
+};
+
+/* Taken from downstream qcom-mpm-scuba.c with hwirq number minus 32 */
+const struct mpm_pin qcm2290_gic_pins[] = {
+	{ 2, 275 },	/* tsens0_tsens_upper_lower_int */
+	{ 5, 296 },	/* lpass_irq_out_sdc */
+	{ 12, 422 },	/* b3_lfps_rxterm_irq */
+	{ 24, 79 },	/* bi_px_lpi_1_aoss_mx */
+	{ 86, 183 },	/* mpm_wake,spmi_m */
+	{ 90, 260 },	/* eud_p0_dpse_int_mx */
+	{ 91, 260 },	/* eud_p0_dmse_int_mx */
+	{ -1 },
+};
+
+const struct mpm_data qcm2290_data = {
+	.pin_num = 96,
+	.gic_pins = qcm2290_gic_pins,
+};
+
+static const struct of_device_id qcom_mpm_match_table[] = {
+	{ .compatible = "qcom,qcm2290-mpm", &qcm2290_data, },
+	{ },
+};
+
+static struct platform_driver qcom_mpm_driver = {
+	.driver = {
+		.name = "qcom_mpm",
+		.owner = THIS_MODULE,
+		.of_match_table = qcom_mpm_match_table,
+		.pm = &qcom_mpm_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe  = qcom_mpm_probe,
+};
+builtin_platform_driver(qcom_mpm_driver)
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. MSM Power Manager");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

