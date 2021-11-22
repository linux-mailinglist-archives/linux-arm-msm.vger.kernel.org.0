Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FEE458A27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 08:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238827AbhKVHza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 02:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbhKVHz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 02:55:29 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11F4C06173E
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 23:52:22 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id gt5so13147704pjb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Nov 2021 23:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3d/XTtlPJ+ODrnqt+JwGkHGomGRDxNjXzWpQNtDqXGc=;
        b=t7qdz/dag1eBW834SfisxxdzL/+ikIgBDTz/xDZUEMxBgMBjb1FxvUeJy1ltWRWcyr
         1xIUCbL1rAXyB9gVK5sZ3Um+qKwIuv6wzaqs98VbuBYW8Eyr1o+kr/56DeiBV/gPfm9X
         SYDW/jMHp/5R0QthDfTqJN2HMeBbeTG4oJYHnmGsKCelTocH1X98JIHVfqniZiGMT6Rc
         npw1vC5okHWo/yUAWumiSvFzFT/5/hrUENQLR/GssGlBs0YcHoNRX6eePYwAMaNw98m4
         al65dbhpXttczx3Tn5teEdPqIyyu2ndJLa6tPaVKV/uFQdXJf8nyflkmCqf3AhAztIlr
         fTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3d/XTtlPJ+ODrnqt+JwGkHGomGRDxNjXzWpQNtDqXGc=;
        b=eM1o7oRN05PpuijDTN0JEjGDg13f8AraPh+7jKFpDc4VltRErjV19XFqAnnvFIxDwD
         lBgNXLb1F2c1Ce+fUJ8VW80junAhHiI+yIJOdLVS4F/Achrr305OjcYbJCNgcOv4xuVQ
         zfjjUJd5AA5XwDiKt+uFO31+VR7PNyQ9aaw/O0UtfNkaxCI6XNjVk51WXlBHYLrP7YBz
         G+iesfUFuxcOFshCp4elumD1eJlDbLqohgrbsgX6izbgBGZjdI2/XOpCWGn59FL/oyJe
         zbnwZUgvUWCKLbqwdWd+NbXZgVmDeiwIXuWWond6B3yQFxNq6nCT91jUy5mFF+GjVVmB
         BCVA==
X-Gm-Message-State: AOAM531KXzGlTXBwE0ZyhQ/CeQ4K7+i8Q09ErQH3i8EKT+sqTNKnhtkg
        33UPHHzKmlnu2FZ/gZmC612z+w==
X-Google-Smtp-Source: ABdhPJy0q+xo9S4FAsDDH3X6UXpeydFFBkV+Z+JBBV0BnGQ4MzsP5mLAXWLWaTy86zCKYtNt0JHK9A==
X-Received: by 2002:a17:902:ec8f:b0:142:11b8:eaaa with SMTP id x15-20020a170902ec8f00b0014211b8eaaamr104999347plg.81.1637567542258;
        Sun, 21 Nov 2021 23:52:22 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id bf13sm6355961pjb.47.2021.11.21.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:52:22 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] irqchip: Add Qualcomm MPM controller driver
Date:   Mon, 22 Nov 2021 15:52:07 +0800
Message-Id: <20211122075207.20114-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122075207.20114-1-shawn.guo@linaro.org>
References: <20211122075207.20114-1-shawn.guo@linaro.org>
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
  number is defined as the SoC data in the driver.  The mapping between
  MPM_GPIO pin and GPIO number is defined by msm_gpio_wakeirq_map[] in
  TLMM driver.

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
 drivers/irqchip/qcom-mpm.c | 542 +++++++++++++++++++++++++++++++++++++
 3 files changed, 551 insertions(+)
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
index 000000000000..6b11db810048
--- /dev/null
+++ b/drivers/irqchip/qcom-mpm.c
@@ -0,0 +1,542 @@
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
+#define MPM_MAX_PIN_PER_IRQ	2
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
+static inline bool in_gpio_domain(struct irq_data *d)
+{
+	return d->domain->bus_token == DOMAIN_BUS_WAKEUP;
+}
+
+static void qcom_mpm_get_pin(struct irq_data *d, int *pins)
+{
+	struct qcom_mpm_priv *priv = d->domain->host_data;
+
+	if (in_gpio_domain(d)) {
+		pins[0] = d->hwirq;
+		priv->pin_to_irq[d->hwirq] = d->irq;
+	} else {
+		const struct mpm_pin *gic_pins = priv->data->gic_pins;
+		int i, j;
+
+		for (i = 0, j = 0; j < MPM_MAX_PIN_PER_IRQ; i++) {
+			int pin = gic_pins[i].pin;
+
+			if (pin < 0)
+				break;
+
+			if (gic_pins[i].hwirq == d->hwirq) {
+				/* Found MPM pin */
+				pins[j++] = pin;
+				/* Store Linux irq number */
+				priv->pin_to_irq[pin] = d->irq;
+			}
+		}
+	}
+}
+
+static inline void qcom_mpm_enable_irq(struct irq_data *d, bool en)
+{
+	struct qcom_mpm_priv *priv = d->domain->host_data;
+	int pins[MPM_MAX_PIN_PER_IRQ] = { -1, -1 };
+	int i;
+
+	qcom_mpm_get_pin(d, pins);
+
+	for (i = 0; i < MPM_MAX_PIN_PER_IRQ; i++) {
+		unsigned int index, shift;
+		unsigned long flags;
+		int pin = pins[i];
+		u32 val;
+
+		if (pin < 0)
+			return;
+
+		index = pin / 32;
+		shift = pin % 32;
+
+		spin_lock_irqsave(&priv->lock, flags);
+
+		val = qcom_mpm_read(priv, MPM_REG_ENABLE, index);
+		if (en)
+			val |= 1 << shift;
+		else
+			val &= ~(1 << shift);
+		qcom_mpm_write(priv, MPM_REG_ENABLE, index, val);
+
+		spin_unlock_irqrestore(&priv->lock, flags);
+	}
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
+static void qcom_mpm_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct qcom_mpm_priv *priv = d->domain->host_data;
+	int pins[MPM_MAX_PIN_PER_IRQ] = { -1, -1 };
+	int i;
+
+	qcom_mpm_get_pin(d, pins);
+
+	for (i = 0; i < MPM_MAX_PIN_PER_IRQ; i++) {
+		unsigned int index, shift;
+		unsigned long flags;
+		int pin = pins[i];
+
+		if (pin < 0)
+			return;
+
+		index = pin / 32;
+		shift = pin % 32;
+
+		spin_lock_irqsave(&priv->lock, flags);
+
+		mpm_set_type(priv, (type & IRQ_TYPE_EDGE_RISING) ? 1 : 0,
+			     MPM_REG_RISING_EDGE, index, shift);
+		mpm_set_type(priv, (type & IRQ_TYPE_EDGE_FALLING) ? 1 : 0,
+			     MPM_REG_FALLING_EDGE, index, shift);
+		mpm_set_type(priv, (type & IRQ_TYPE_LEVEL_HIGH) ? 1 : 0,
+			     MPM_REG_POLARITY, index, shift);
+
+		spin_unlock_irqrestore(&priv->lock, flags);
+	}
+}
+
+static int qcom_mpm_set_type(struct irq_data *d, unsigned int type)
+{
+	qcom_mpm_set_irq_type(d, type);
+
+	if (d->parent_data)
+		return irq_chip_set_type_parent(d, type);
+
+	return 0;
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
+static int
+qcom_mpm_gic_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+		       unsigned long *hwirq, unsigned int *type)
+{
+	if (is_of_node(fwspec->fwnode)) {
+		if (fwspec->param_count < 3)
+			return -EINVAL;
+
+		switch (fwspec->param[0]) {
+		case 0:			/* SPI */
+			*hwirq = fwspec->param[1] + 32;
+			break;
+		case 1:			/* PPI */
+			*hwirq = fwspec->param[1] + 16;
+			break;
+		case GIC_IRQ_TYPE_LPI:	/* LPI */
+			*hwirq = fwspec->param[1];
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	if (is_fwnode_irqchip(fwspec->fwnode)) {
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
+	struct irq_fwspec *fwspec = data;
+	struct irq_fwspec parent_fwspec;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int  ret;
+
+	ret = qcom_mpm_gic_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+				      &qcom_mpm_chip, NULL);
+
+	parent_fwspec = *fwspec;
+	parent_fwspec.fwnode = domain->parent->fwnode;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
+					    &parent_fwspec);
+}
+
+static const struct irq_domain_ops qcom_mpm_gic_ops = {
+	.alloc = qcom_mpm_gic_alloc,
+	.free = irq_domain_free_irqs_common,
+	.translate = qcom_mpm_gic_translate,
+};
+
+static int qcom_mpm_gpio_translate(struct irq_domain *domain,
+				   struct irq_fwspec *fwspec,
+				   unsigned long *hwirq, unsigned int *type)
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
+static int qcom_mpm_gpio_alloc(struct irq_domain *domain, unsigned int virq,
+			       unsigned int nr_irqs, void *data)
+{
+	struct irq_fwspec *fwspec = data;
+	unsigned int type = IRQ_TYPE_NONE;
+	irq_hw_number_t hwirq;
+	int ret;
+
+	ret = qcom_mpm_gpio_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	return irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					     &qcom_mpm_chip, NULL);
+}
+
+static int qcom_mpm_gpio_domain_select(struct irq_domain *d,
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
+	.translate = qcom_mpm_gpio_translate,
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
+const struct mpm_pin qcm2290_gic_pins[] = {
+	{ 2, 307 },	/* tsens0_tsens_upper_lower_int */
+	{ 5, 328 },	/* lpass_irq_out_sdc */
+	{ 12, 454 },	/* b3_lfps_rxterm_irq */
+	{ 24, 111 },	/* bi_px_lpi_1_aoss_mx */
+	{ 86, 215 },	/* mpm_wake,spmi_m */
+	{ 90, 292 },	/* eud_p0_dpse_int_mx */
+	{ 91, 292 },	/* eud_p0_dmse_int_mx */
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

