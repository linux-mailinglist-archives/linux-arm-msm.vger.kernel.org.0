Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5106D4C136C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 13:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240701AbiBWM6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 07:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240734AbiBWM55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 07:57:57 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1851012AA0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 04:57:24 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 139so19853055pge.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 04:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K7Rr8/niGD4rtxLI5fSjQGfLtd7shjRvWSJcdBvDXf0=;
        b=OmW04qAeKTLK5gNfn+UMQOr6ani9SvibaggC2RhCbuJVbgWiZf8MtlvXa5U/qyKb2l
         DluXRDFPAAyG/eFlQZF29kuHl3X0NqvTwSJcbY+BnhLPHQUoCwlqBsrfhrWaIoOMokIL
         EMHvhaFHHZXfawbbvi3D1CQjhY/5gb/mmHU+Tlaetb9HmBrXGFyOhZZzWAXTPiVGepBZ
         8iTGRcmZEWAjwjGAhrkaHIB+AZvM6Hd9QqDQlJxIvWP+jbu5nJz5yb5ywAUJjgTzBsWW
         Zvd+vT77az1Q9sfvQLy2vWX4vCqqxMcs9Yad8nwf3EJO8Ol1L3YpfHPLtpEiJGJ8XahV
         6+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K7Rr8/niGD4rtxLI5fSjQGfLtd7shjRvWSJcdBvDXf0=;
        b=vVBuFCfhVJgRvexltY0dxNY58GvwNqAoDo0gAGkREooE6ZElbKo4nlfjn5GT6FU65N
         FBuui4CAj1QLlN1ZvMXZv1Sg5IuJOTU8S3DOv4PnKYRZMtY4t62XSoymIWBEHg3/QbAG
         8bs0QwRTTXH3kHVQB5GsIQIcPBJKKAdDSrVrvue6jH6M/iFxS2zan2BcskifI9MSk4/1
         lH+81vCjGa8Zy25HzAn7fxz8KZhP4XxF7dd3uyme5+idC4LERDW9Zbhb0H0FUxIdW8ZM
         2vHBqcAd16iSz9tk64Vdef4PtwAr8lsZcb7D73xzT9R6L9CWvki4BWdC4jBEuV7DfXsc
         4rwQ==
X-Gm-Message-State: AOAM533UeS9ke4aRGr/4tf20bMdNMuV6ppvIipL+FdePAkUPU+io11Zb
        C6OMybtZRCctGltditxo8C6iSA==
X-Google-Smtp-Source: ABdhPJy8radjQVdI9VlARhq2fTMR7N1XkSupEcw3vOErOyPzl6FDeQbZtIYj21PaXYURbcGpraoq2A==
X-Received: by 2002:a62:7c11:0:b0:4e1:7ede:9ca9 with SMTP id x17-20020a627c11000000b004e17ede9ca9mr29669069pfc.84.1645621043429;
        Wed, 23 Feb 2022 04:57:23 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z23sm22136243pfj.87.2022.02.23.04.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 04:57:22 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v6 3/3] irqchip: Add Qualcomm MPM controller driver
Date:   Wed, 23 Feb 2022 20:55:36 +0800
Message-Id: <20220223125536.230224-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223125536.230224-1-shawn.guo@linaro.org>
References: <20220223125536.230224-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm SoCs based on the RPM architecture have a MSM Power Manager (MPM)
in always-on domain. In addition to managing resources during sleep, the
hardware also has an interrupt controller that monitors the interrupts
when the system is asleep, wakes up the APSS when one of these interrupts
occur and replays it to GIC after it becomes operational.

It adds an irqchip driver for this interrupt controller, and here are
a couple of notes about it.

- For given SoC, a fixed number of MPM pins are supported, e.g. 96 pins
  on QCM2290.  Each of these MPM pins can be either a MPM_GIC pin or
  a MPM_GPIO pin. The mapping between MPM_GIC pin and GIC interrupt
  is defined by SoC, as well as the mapping between MPM_GPIO pin and
  GPIO number.  The former mapping is retrieved from device tree, while
  the latter is defined in TLMM pinctrl driver.

- When SoC gets awake from sleep mode, the driver will receive an
  interrupt from RPM, so that it can replay interrupt for particular
  polarity.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/irqchip/Kconfig    |   8 +
 drivers/irqchip/Makefile   |   1 +
 drivers/irqchip/qcom-mpm.c | 439 +++++++++++++++++++++++++++++++++++++
 3 files changed, 448 insertions(+)
 create mode 100644 drivers/irqchip/qcom-mpm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7038957f4a77..680d2fcf2686 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -430,6 +430,14 @@ config QCOM_PDC
 	  Power Domain Controller driver to manage and configure wakeup
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
 
+config QCOM_MPM
+	tristate "QCOM MPM"
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
index 000000000000..8e142873a99a
--- /dev/null
+++ b/drivers/irqchip/qcom-mpm.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Linaro Limited
+ * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/cpu_pm.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
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
+#include <linux/soc/qcom/irq.h>
+#include <linux/spinlock.h>
+
+/*
+ * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
+ * which is commonly found on Qualcomm SoCs built on the RPM architecture.
+ * Sitting in always-on domain, MPM monitors the wakeup interrupts when SoC is
+ * asleep, and wakes up the AP when one of those interrupts occurs.  This driver
+ * doesn't directly access physical MPM registers though.  Instead, the access
+ * is bridged via a piece of internal memory (SRAM) that is accessible to both
+ * AP and RPM.  This piece of memory is called 'vMPM' in the driver.
+ *
+ * When SoC is awake, the vMPM is owned by AP and the register setup by this
+ * driver all happens on vMPM.  When AP is about to get power collapsed, the
+ * driver sends a mailbox notification to RPM, which will take over the vMPM
+ * ownership and dump vMPM into physical MPM registers.  On wakeup, AP is woken
+ * up by a MPM pin/interrupt, and RPM will copy STATUS registers into vMPM.
+ * Then AP start owning vMPM again.
+ *
+ * vMPM register map:
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
+ *    n = DIV_ROUND_UP(pin_cnt, 32)
+ *
+ */
+
+#define MPM_REG_ENABLE		0
+#define MPM_REG_FALLING_EDGE	1
+#define MPM_REG_RISING_EDGE	2
+#define MPM_REG_POLARITY	3
+#define MPM_REG_STATUS		4
+
+/* MPM pin map to GIC hwirq */
+struct mpm_gic_map {
+	int pin;
+	irq_hw_number_t hwirq;
+};
+
+struct qcom_mpm_priv {
+	void __iomem *base;
+	raw_spinlock_t lock;
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+	struct mpm_gic_map *maps;
+	unsigned int map_cnt;
+	unsigned int reg_stride;
+	struct irq_domain *domain;
+	struct notifier_block pm_nb;
+};
+
+static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
+			 unsigned int index)
+{
+	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+
+	return readl_relaxed(priv->base + offset);
+}
+
+static void qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+			   unsigned int index, u32 val)
+{
+	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+
+	writel_relaxed(val, priv->base + offset);
+
+	/* Ensure the write is completed */
+	wmb();
+}
+
+static void qcom_mpm_enable_irq(struct irq_data *d, bool en)
+{
+	struct qcom_mpm_priv *priv = d->chip_data;
+	int pin = d->hwirq;
+	unsigned int index = pin / 32;
+	unsigned int shift = pin % 32;
+	unsigned long flags;
+	u32 val;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	val = qcom_mpm_read(priv, MPM_REG_ENABLE, index);
+	if (en)
+		val |= BIT(shift);
+	else
+		val &= ~BIT(shift);
+	qcom_mpm_write(priv, MPM_REG_ENABLE, index, val);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
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
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+			 unsigned int index, unsigned int shift)
+{
+	unsigned long flags;
+	u32 val;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	val = qcom_mpm_read(priv, reg, index);
+	if (set)
+		val |= BIT(shift);
+	else
+		val &= ~BIT(shift);
+	qcom_mpm_write(priv, reg, index, val);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static int qcom_mpm_set_type(struct irq_data *d, unsigned int type)
+{
+	struct qcom_mpm_priv *priv = d->chip_data;
+	int pin = d->hwirq;
+	unsigned int index = pin / 32;
+	unsigned int shift = pin % 32;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		mpm_set_type(priv, !!(type & IRQ_TYPE_EDGE_RISING),
+			     MPM_REG_RISING_EDGE, index, shift);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		mpm_set_type(priv, !!(type & IRQ_TYPE_EDGE_FALLING),
+			     MPM_REG_FALLING_EDGE, index, shift);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		mpm_set_type(priv, !!(type & IRQ_TYPE_LEVEL_HIGH),
+			     MPM_REG_POLARITY, index, shift);
+		break;
+	}
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
+	.name			= "mpm",
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_mask		= qcom_mpm_mask,
+	.irq_unmask		= qcom_mpm_unmask,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= qcom_mpm_set_type,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
+struct mpm_gic_map *get_mpm_gic_map(struct qcom_mpm_priv *priv, int pin)
+{
+	struct mpm_gic_map *maps = priv->maps;
+	int i;
+
+	for (i = 0; i < priv->map_cnt; i++) {
+		if (maps[i].pin == pin)
+			return &maps[i];
+	}
+
+	return NULL;
+}
+
+static int qcom_mpm_alloc(struct irq_domain *domain, unsigned int virq,
+			  unsigned int nr_irqs, void *data)
+{
+	struct qcom_mpm_priv *priv = domain->host_data;
+	struct irq_fwspec *fwspec = data;
+	struct irq_fwspec parent_fwspec;
+	struct mpm_gic_map *map;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int  ret;
+
+	ret = irq_domain_translate_twocell(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &qcom_mpm_chip, priv);
+	if (ret)
+		return ret;
+
+	map = get_mpm_gic_map(priv, hwirq);
+	if (map == NULL)
+		return irq_domain_disconnect_hierarchy(domain->parent, virq);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		type = IRQ_TYPE_EDGE_RISING;
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		type = IRQ_TYPE_LEVEL_HIGH;
+
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param_count = 3;
+	parent_fwspec.param[0] = 0;
+	parent_fwspec.param[1] = map->hwirq;
+	parent_fwspec.param[2] = type;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
+					    &parent_fwspec);
+}
+
+static const struct irq_domain_ops qcom_mpm_ops = {
+	.alloc		= qcom_mpm_alloc,
+	.free		= irq_domain_free_irqs_common,
+	.translate	= irq_domain_translate_twocell,
+};
+
+/* Triggered by RPM when system resumes from deep sleep */
+static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
+{
+	struct qcom_mpm_priv *priv = dev_id;
+	unsigned long enable, pending;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	int i, j;
+
+	for (i = 0; i < priv->reg_stride; i++) {
+		raw_spin_lock_irqsave(&priv->lock, flags);
+		enable = qcom_mpm_read(priv, MPM_REG_ENABLE, i);
+		pending = qcom_mpm_read(priv, MPM_REG_STATUS, i);
+		pending &= enable;
+		raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+		for_each_set_bit(j, &pending, 32) {
+			unsigned int pin = 32 * i + j;
+			struct irq_desc *desc = irq_resolve_mapping(priv->domain, pin);
+			struct irq_data *d = &desc->irq_data;
+
+			if (!irqd_is_level_type(d))
+				irq_set_irqchip_state(d->irq,
+						IRQCHIP_STATE_PENDING, true);
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+static int qcom_mpm_enter_sleep(struct qcom_mpm_priv *priv)
+{
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
+static int qcom_mpm_cpu_pm_callback(struct notifier_block *nb,
+				    unsigned long action, void *data)
+{
+	struct qcom_mpm_priv *priv = container_of(nb, struct qcom_mpm_priv,
+						  pm_nb);
+	int ret = NOTIFY_OK;
+
+	switch (action) {
+	case CPU_LAST_PM_ENTER:
+		if (qcom_mpm_enter_sleep(priv))
+			ret = NOTIFY_BAD;
+		break;
+	default:
+		ret = NOTIFY_DONE;
+	}
+
+	return ret;
+}
+
+static int qcom_mpm_init(struct device_node *np, struct device_node *parent)
+{
+	struct platform_device *pdev = of_find_device_by_node(np);
+	struct device *dev = &pdev->dev;
+	struct irq_domain *parent_domain;
+	struct qcom_mpm_priv *priv;
+	unsigned int pin_cnt;
+	int i, irq;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
+	if (ret) {
+		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);
+		return ret;
+	}
+
+	priv->reg_stride = DIV_ROUND_UP(pin_cnt, 32);
+
+	ret = of_property_count_u32_elems(np, "qcom,mpm-pin-map");
+	if (ret < 0) {
+		dev_err(dev, "failed to read qcom,mpm-pin-map: %d\n", ret);
+		return ret;
+	}
+
+	if (ret % 2) {
+		dev_err(dev, "invalid qcom,mpm-pin-map\n");
+		return -EINVAL;
+	}
+
+	priv->map_cnt = ret / 2;
+	priv->maps = devm_kcalloc(dev, priv->map_cnt, sizeof(*priv->maps),
+				  GFP_KERNEL);
+	if (!priv->maps)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->map_cnt; i++) {
+		of_property_read_u32_index(np, "qcom,mpm-pin-map", i * 2,
+					   &priv->maps[i].pin);
+		of_property_read_u32_index(np, "qcom,mpm-pin-map", i * 2 + 1,
+					   (u32 *) &priv->maps[i].hwirq);
+	}
+
+	raw_spin_lock_init(&priv->lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (!priv->base)
+		return PTR_ERR(priv->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	priv->mbox_client.dev = dev;
+	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
+	if (IS_ERR(priv->mbox_chan)) {
+		ret = PTR_ERR(priv->mbox_chan);
+		dev_err(dev, "failed to acquire IPC channel: %d\n", ret);
+		return ret;
+	}
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		dev_err(dev, "failed to find MPM parent domain\n");
+		ret = -ENXIO;
+		goto free_mbox;
+	}
+
+	priv->domain = irq_domain_create_hierarchy(parent_domain,
+				IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP, pin_cnt,
+				of_node_to_fwnode(np), &qcom_mpm_ops, priv);
+	if (!priv->domain) {
+		dev_err(dev, "failed to create MPM domain\n");
+		ret = -ENOMEM;
+		goto free_mbox;
+	}
+
+	irq_domain_update_bus_token(priv->domain, DOMAIN_BUS_WAKEUP);
+
+	ret = devm_request_irq(dev, irq, qcom_mpm_handler, IRQF_NO_SUSPEND,
+			       "qcom_mpm", priv);
+	if (ret) {
+		dev_err(dev, "failed to request irq: %d\n", ret);
+		goto remove_domain;
+	}
+
+	priv->pm_nb.notifier_call = qcom_mpm_cpu_pm_callback;
+	cpu_pm_register_notifier(&priv->pm_nb);
+
+	return 0;
+
+remove_domain:
+	irq_domain_remove(priv->domain);
+free_mbox:
+	mbox_free_channel(priv->mbox_chan);
+	return ret;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_mpm)
+IRQCHIP_MATCH("qcom,mpm", qcom_mpm_init)
+IRQCHIP_PLATFORM_DRIVER_END(qcom_mpm)
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. MSM Power Manager");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

