Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF2A5316E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 22:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbiEWSAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 14:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244194AbiEWR55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 13:57:57 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B781DC5E6D;
        Mon, 23 May 2022 10:43:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,246,1647270000"; 
   d="scan'208";a="121975212"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 May 2022 02:43:01 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A583E400E8FD;
        Tue, 24 May 2022 02:42:55 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/5] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
Date:   Mon, 23 May 2022 18:42:35 +0100
Message-Id: <20220523174238.28942-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a driver for the Renesas RZ/G2L Interrupt Controller.

This supports external pins being used as interrupts. It supports
one line for NMI, 8 external pins and 32 GPIO pins (out of 123)
to be used as IRQ lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/Kconfig             |   8 +
 drivers/irqchip/Makefile            |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c | 425 ++++++++++++++++++++++++++++
 3 files changed, 434 insertions(+)
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 15edb9a6fcae..f3d071422f3b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -242,6 +242,14 @@ config RENESAS_RZA1_IRQC
 	  Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
 	  to 8 external interrupts with configurable sense select.
 
+config RENESAS_RZG2L_IRQC
+	bool "Renesas RZ/G2L (and alike SoC) IRQC support" if COMPILE_TEST
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Enable support for the Renesas RZ/G2L (and alike SoC) Interrupt Controller
+	  for external devices.
+
 config SL28CPLD_INTC
 	bool "Kontron sl28cpld IRQ controller"
 	depends on MFD_SL28CPLD=y || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 160a1d8ceaa9..eaa56eec2b23 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
+obj-$(CONFIG_RENESAS_RZG2L_IRQC)	+= irq-renesas-rzg2l.o
 obj-$(CONFIG_VERSATILE_FPGA_IRQ)	+= irq-versatile-fpga.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
 obj-$(CONFIG_ARCH_VT8500)		+= irq-vt8500.o
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
new file mode 100644
index 000000000000..a846c6ee11d7
--- /dev/null
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L IRQC Driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation.
+ *
+ * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#define IRQC_IRQ_START			1
+#define IRQC_IRQ_COUNT			8
+#define IRQC_TINT_START			(IRQC_IRQ_START + IRQC_IRQ_COUNT)
+#define IRQC_TINT_COUNT			32
+#define IRQC_NUM_IRQ			(IRQC_TINT_START + IRQC_TINT_COUNT)
+
+#define ISCR				0x10
+#define IITSR				0x14
+#define TSCR				0x20
+#define TITSR0				0x24
+#define TITSR1				0x28
+#define TITSR0_MAX_INT			16
+#define TITSEL_WIDTH			0x2
+#define TSSR(n)				(0x30 + ((n) * 4))
+#define TIEN				BIT(7)
+#define TSSEL_SHIFT(n)			(8 * (n))
+#define TSSEL_MASK			GENMASK(7, 0)
+#define IRQ_MASK			0x3
+
+#define TSSR_OFFSET(n)			((n) % 4)
+#define TSSR_INDEX(n)			((n) / 4)
+
+#define TITSR_TITSEL_EDGE_RISING	0
+#define TITSR_TITSEL_EDGE_FALLING	1
+#define TITSR_TITSEL_LEVEL_HIGH		2
+#define TITSR_TITSEL_LEVEL_LOW		3
+
+#define IITSR_IITSEL(n, sense)		((sense) << ((n) * 2))
+#define IITSR_IITSEL_LEVEL_LOW		0
+#define IITSR_IITSEL_EDGE_FALLING	1
+#define IITSR_IITSEL_EDGE_RISING	2
+#define IITSR_IITSEL_EDGE_BOTH		3
+#define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
+
+#define TINT_EXTRACT_HWIRQ(x)           FIELD_GET(GENMASK(15, 0), (x))
+#define TINT_EXTRACT_GPIOINT(x)         FIELD_GET(GENMASK(31, 16), (x))
+
+struct rzg2l_irqc_priv {
+	void __iomem *base;
+	struct of_phandle_args map[IRQC_NUM_IRQ];
+	raw_spinlock_t lock;
+};
+
+struct rzg2l_irqc_chip_data {
+	int tint;
+};
+
+static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
+{
+	return data->domain->host_data;
+}
+
+static void rzg2l_irq_eoi(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	u32 bit = BIT(hw_irq);
+	u32 reg;
+
+	reg = readl_relaxed(priv->base + ISCR);
+	if (reg & bit)
+		writel_relaxed(reg & ~bit, priv->base + ISCR);
+}
+
+static void rzg2l_tint_eoi(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_TINT_START;
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	u32 bit = BIT(hw_irq);
+	u32 reg;
+
+	reg = readl_relaxed(priv->base + TSCR);
+	if (reg & bit)
+		writel_relaxed(reg & ~bit, priv->base + TSCR);
+}
+
+static void rzg2l_irqc_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	raw_spin_lock(&priv->lock);
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+		rzg2l_irq_eoi(d);
+	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+		rzg2l_tint_eoi(d);
+	raw_spin_unlock(&priv->lock);
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_irqc_irq_disable(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
+		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+		u32 offset = hw_irq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		raw_spin_lock(&priv->lock);
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		reg &= ~(TSSEL_MASK << tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		raw_spin_unlock(&priv->lock);
+	}
+	irq_chip_disable_parent(d);
+}
+
+static void rzg2l_irqc_irq_enable(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
+		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+		unsigned long chip_data = *(unsigned long *)d->chip_data;
+		u32 offset = hw_irq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		raw_spin_lock(&priv->lock);
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		reg |= (TIEN | chip_data) << TSSEL_SHIFT(tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		raw_spin_unlock(&priv->lock);
+	}
+	irq_chip_enable_parent(d);
+}
+
+static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	u16 sense, tmp;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_LEVEL_LOW:
+		sense = IITSR_IITSEL_LEVEL_LOW;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		sense = IITSR_IITSEL_EDGE_FALLING;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		sense = IITSR_IITSEL_EDGE_RISING;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		sense = IITSR_IITSEL_EDGE_BOTH;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	raw_spin_lock(&priv->lock);
+	tmp = readl_relaxed(priv->base + IITSR);
+	tmp &= ~IITSR_IITSEL_MASK(hw_irq);
+	tmp |= IITSR_IITSEL(hw_irq, sense);
+	writel_relaxed(tmp, priv->base + IITSR);
+	raw_spin_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+	u32 titseln = hwirq - IRQC_TINT_START;
+	u32 offset;
+	u8 sense;
+	u32 reg;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		sense = TITSR_TITSEL_EDGE_RISING;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		sense = TITSR_TITSEL_EDGE_FALLING;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	offset = TITSR0;
+	if (titseln >= TITSR0_MAX_INT) {
+		titseln -= TITSR0_MAX_INT;
+		offset = TITSR1;
+	}
+
+	raw_spin_lock(&priv->lock);
+	reg = readl_relaxed(priv->base + offset);
+	reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
+	reg |= sense << (titseln * TITSEL_WIDTH);
+	writel_relaxed(reg, priv->base + offset);
+	raw_spin_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	int ret = -EINVAL;
+
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+		ret = rzg2l_irq_set_type(d, type);
+	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
+		ret = rzg2l_tint_set_edge(d, type);
+	if (ret)
+		return ret;
+
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
+}
+
+static const struct irq_chip irqc_chip = {
+	.name			= "rzg2l-irqc",
+	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= rzg2l_irqc_irq_disable,
+	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= rzg2l_irqc_set_type,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
+			    unsigned int nr_irqs, void *arg)
+{
+	struct rzg2l_irqc_priv *priv = domain->host_data;
+	unsigned long *chip_data = NULL;
+	struct irq_fwspec spec;
+	irq_hw_number_t hwirq;
+	int tint = -EINVAL;
+	unsigned int type;
+	unsigned int i;
+	int ret;
+
+	ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	/*
+	 * For TINT interrupts ie where pinctrl driver is child of irqc domain
+	 * the hwirq and TINT are encoded in fwspec->param[0].
+	 * hwirq for TINT range from 9-40, hwirq is embedded 0-15 bits and TINT
+	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
+	 * in IRQC registers to enable a given gpio pin as interrupt.
+	 */
+	if (hwirq > IRQC_IRQ_COUNT) {
+		tint = TINT_EXTRACT_GPIOINT(hwirq);
+		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
+
+		if (hwirq < IRQC_TINT_START)
+			return -EINVAL;
+	}
+
+	if (hwirq > (IRQC_NUM_IRQ - 1))
+		return -EINVAL;
+
+	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
+	if (!chip_data)
+		return -ENOMEM;
+	*chip_data = tint;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &irqc_chip,
+					    chip_data);
+	if (ret) {
+		kfree(chip_data);
+		return ret;
+	}
+
+	spec.fwnode = domain->parent->fwnode;
+	spec.param_count = priv->map[hwirq].args_count;
+	for (i = 0; i < spec.param_count; i++)
+		spec.param[i] = priv->map[hwirq].args[i];
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &spec);
+	if (ret)
+		kfree(chip_data);
+
+	return ret;
+}
+
+static void rzg2l_irqc_domain_free(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	d = irq_domain_get_irq_data(domain, virq);
+	if (d)
+		kfree(d->chip_data);
+
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
+	.alloc = rzg2l_irqc_alloc,
+	.free = rzg2l_irqc_domain_free,
+	.translate = irq_domain_translate_twocell,
+};
+
+static int rzg2l_irqc_parse_map(struct rzg2l_irqc_priv *priv,
+				struct device_node *np)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+		ret = of_irq_parse_one(np, i, &priv->map[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
+{
+	struct irq_domain *irq_domain, *parent_domain;
+	struct platform_device *pdev;
+	struct reset_control *resetn;
+	struct rzg2l_irqc_priv *priv;
+	int ret;
+
+	pdev = of_find_device_by_node(node);
+	if (!pdev)
+		return -ENODEV;
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		dev_err(&pdev->dev, "cannot find parent domain\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	ret = rzg2l_irqc_parse_map(priv, node);
+	if (ret) {
+		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
+		return ret;
+	}
+
+	resetn = devm_reset_control_get_exclusive_by_index(&pdev->dev, 0);
+	if (IS_ERR(resetn))
+		return IS_ERR(resetn);
+
+	ret = reset_control_deassert(resetn);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
+		goto pm_disable;
+	}
+
+	raw_spin_lock_init(&priv->lock);
+
+	irq_domain = irq_domain_add_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
+					      node, &rzg2l_irqc_domain_ops,
+					      priv);
+	if (!irq_domain) {
+		dev_err(&pdev->dev, "failed to add irq domain\n");
+		ret = -ENOMEM;
+		goto pm_put;
+	}
+
+	return 0;
+
+pm_put:
+	pm_runtime_put(&pdev->dev);
+pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(resetn);
+	return ret;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
+IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_init)
+IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L IRQC Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

