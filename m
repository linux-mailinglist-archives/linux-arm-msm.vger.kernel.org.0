Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC8D16C76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfEGUl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53206 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfEGUk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7F3B461214; Tue,  7 May 2019 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261657;
        bh=YIbjFbNVciKsIGLcV/krAz25GJ1zEgehK0arLR9Zof8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kkpR9wH0NUXYhbjf/ScVbk4cw+gXVYm+4HoFpIojPtQ/TiAzvQoJHjr/2yqLbDiYu
         Q8RGaPrJ7OIfz+H+P53KckRvCgJk+6P+K6rcTaPooeB1khoRqo1PxOPSVfLcpYGjdh
         n0SE25miUDVgyLnQdghnpuVO/M5MzM6GquVrzA58=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B32716119F;
        Tue,  7 May 2019 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261656;
        bh=YIbjFbNVciKsIGLcV/krAz25GJ1zEgehK0arLR9Zof8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B3NwokQa2yh4R+r6BWlJfTiMJuUThx6bhOW5t9EMh5bwvYZnsXuSkq3GopYHzaTk+
         iYOrFKDqumD8m50/nyiuKTOqOQp1hZGACvalCAxRvb8feV3SUwPis7Y71KMHkMQv6j
         BZVLFzOENAJf2nOLR0EvZGfskOm2npZxeTG97Rtg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B32716119F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 06/11] drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
Date:   Tue,  7 May 2019 14:37:44 -0600
Message-Id: <20190507203749.3384-7-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a new domain for wakeup capable GPIOs. The domain can be
requested using the bus token DOMAIN_BUS_WAKEUP. In the following
patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
irqchip. Requesting a wakeup GPIO will setup the GPIO and the
corresponding PDC interrupt as its parent.

Co-developed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v5:
	- Define invalid wakeup interrupt
Changes in v4:
	- Remove vestigial changes from v2
Changes in v3:
	- Remove PDC GPIO map data (moved to DT)
	- hwirq passed in .alloc() is a PDC pin now
Changes in v2:
	- Remove separate file for PDC GPIO map data
	- Error checks and return
	- Whitespace fixes
---
 drivers/irqchip/qcom-pdc.c   | 98 ++++++++++++++++++++++++++++++++----
 include/linux/soc/qcom/irq.h | 25 +++++++++
 2 files changed, 114 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/soc/qcom/irq.h

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index faa7d61b9d6c..ef0135fbc41a 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -13,12 +13,13 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
 #define PDC_MAX_IRQS		126
+#define PDC_MAX_GPIO_IRQS	256
 
 #define CLEAR_INTR(reg, intr)	(reg & ~(1 << intr))
 #define ENABLE_INTR(reg, intr)	(reg | (1 << intr))
@@ -26,6 +27,8 @@
 #define IRQ_ENABLE_BANK		0x10
 #define IRQ_i_CFG		0x110
 
+#define PDC_NO_PARENT_IRQ	~0UL
+
 struct pdc_pin_region {
 	u32 pin_base;
 	u32 parent_base;
@@ -65,12 +68,18 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 
 static void qcom_pdc_gic_mask(struct irq_data *d)
 {
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
 	pdc_enable_intr(d, false);
 	irq_chip_mask_parent(d);
 }
 
 static void qcom_pdc_gic_unmask(struct irq_data *d)
 {
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
 	pdc_enable_intr(d, true);
 	irq_chip_unmask_parent(d);
 }
@@ -114,6 +123,9 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 	int pin_out = d->hwirq;
 	enum pdc_irq_config_bits pdc_type;
 
+	if (pin_out == GPIO_NO_WAKE_IRQ)
+		return 0;
+
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		pdc_type = PDC_EDGE_RISING;
@@ -169,8 +181,7 @@ static irq_hw_number_t get_parent_hwirq(int pin)
 			return (region->parent_base + pin - region->pin_base);
 	}
 
-	WARN_ON(1);
-	return ~0UL;
+	return PDC_NO_PARENT_IRQ;
 }
 
 static int qcom_pdc_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
@@ -199,17 +210,17 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 
 	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
 	if (ret)
-		return -EINVAL;
-
-	parent_hwirq = get_parent_hwirq(hwirq);
-	if (parent_hwirq == ~0UL)
-		return -EINVAL;
+		return ret;
 
 	ret  = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
 					     &qcom_pdc_gic_chip, NULL);
 	if (ret)
 		return ret;
 
+	parent_hwirq = get_parent_hwirq(hwirq);
+	if (parent_hwirq == PDC_NO_PARENT_IRQ)
+		return 0;
+
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		type = IRQ_TYPE_EDGE_RISING;
 
@@ -232,6 +243,63 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
+static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
+			       unsigned int nr_irqs, void *data)
+{
+	struct qcom_irq_fwspec *qcom_fwspec = data;
+	struct irq_fwspec *fwspec = &qcom_fwspec->fwspec;
+	struct irq_fwspec parent_fwspec;
+	irq_hw_number_t hwirq, parent_hwirq;
+	unsigned int type;
+	int ret;
+
+	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &qcom_pdc_gic_chip, NULL);
+	if (ret)
+		return ret;
+
+	if (hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	parent_hwirq = get_parent_hwirq(hwirq);
+	if (parent_hwirq == PDC_NO_PARENT_IRQ)
+		return 0;
+
+	qcom_fwspec->mask = true;
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
+static int qcom_pdc_gpio_domain_select(struct irq_domain *d,
+				       struct irq_fwspec *fwspec,
+				       enum irq_domain_bus_token bus_token)
+{
+	return (bus_token == DOMAIN_BUS_WAKEUP);
+}
+
+static const struct irq_domain_ops qcom_pdc_gpio_ops = {
+	.select		= qcom_pdc_gpio_domain_select,
+	.alloc		= qcom_pdc_gpio_alloc,
+	.free		= irq_domain_free_irqs_common,
+};
+
 static int pdc_setup_pin_mapping(struct device_node *np)
 {
 	int ret, n;
@@ -270,7 +338,7 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 
 static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 {
-	struct irq_domain *parent_domain, *pdc_domain;
+	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
 	int ret;
 
 	pdc_base = of_iomap(node, 0);
@@ -301,6 +369,18 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		goto fail;
 	}
 
+	pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain, 0,
+						      PDC_MAX_GPIO_IRQS,
+						      of_fwnode_handle(node),
+						      &qcom_pdc_gpio_ops, NULL);
+	if (!pdc_gpio_domain) {
+		pr_err("%pOF: GIC domain add failed for GPIO domain\n", node);
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
+
 	return 0;
 
 fail:
diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
new file mode 100644
index 000000000000..468a811141ad
--- /dev/null
+++ b/include/linux/soc/qcom/irq.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __QCOM_IRQ_H
+#define __QCOM_IRQ_H
+
+#include <linux/irqdomain.h>
+
+#define GPIO_NO_WAKE_IRQ	~0U
+
+/**
+ * struct qcom_irq_fwspec - qcom specific irq fwspec wrapper
+ * @fwspec: irq fwspec
+ * @mask: if true, keep the irq masked in the gpio controller
+ *
+ * Use this structure to communicate between the parent irq chip, MPM or PDC,
+ * to the gpio chip, TLMM, about the gpio being allocated in the parent
+ * and if the gpio chip should keep the line masked because the parent irq
+ * chip is handling everything about the irq line.
+ */
+struct qcom_irq_fwspec {
+	struct irq_fwspec fwspec;
+	bool mask;
+};
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

