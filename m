Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5ED7198170
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 18:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgC3Qle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 12:41:34 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25760 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726497AbgC3Qld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 12:41:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585586492; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SET+wvNgxuRLvLMyFVqrdey9GNdOJ5MZE69IVGtvv3E=; b=vYD7caY3vKuEdAVW6cFHTM21Chk1OypwRsgFnjyPvQIxJkY6BNG6SNW1o40kGf0TvHwtb9ev
 rmwclL5VncOMNICeskANmi4tAAeqfRRlnBp44UUsgwkUh5QXyG6rpdcn6pAbJssZFEeVTklm
 789BDwuMopDdDPz4rmlh66vpf34=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e822139.7fed6b9d00a0-smtp-out-n04;
 Mon, 30 Mar 2020 16:41:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A046DC433BA; Mon, 30 Mar 2020 16:41:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94640C433F2;
        Mon, 30 Mar 2020 16:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94640C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
Date:   Mon, 30 Mar 2020 22:11:00 +0530
Message-Id: <1585586460-3272-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org>
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to differentiate enabled and wakeup capable interrupts in SW
to support drivers which disable the wakeup capable interrupt in SW during
suspend while irqchip HW expects it to leave enabled in HW during suspend.

Change the way interrupts get enabled at HW in wakeup capable PDC irq chip
during suspend. Introduce .irq_set_wake call which lets interrupts marked
as wakeup capable. Such interrupts in PDC domain and PDC gpio domain are
checked from PDC's CPU PM notification to enable them in HW at PDC and its
parent GIC if its marked as wakeup capable but are disabled in SW.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 271 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 256 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 6ae9e1f..c43715b 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/err.h>
+#include <linux/cpu_pm.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -17,6 +18,7 @@
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
+#include <linux/suspend.h>
 #include <linux/types.h>
 
 #define PDC_MAX_IRQS		168
@@ -36,6 +38,23 @@ struct pdc_pin_region {
 	u32 cnt;
 };
 
+struct pdc_pm_data {
+	struct cpumask cpus_in_pc;
+	spinlock_t pm_lock;
+	bool suspend_start;
+	bool from_pdc_suspend;
+	struct notifier_block pdc_pm_nfb;
+	struct notifier_block pdc_cpu_pm_nfb;
+
+	DECLARE_BITMAP(pdc_domain_enabled_irqs, PDC_MAX_IRQS);
+	DECLARE_BITMAP(pdc_domain_wake_irqs, PDC_MAX_IRQS);
+	DECLARE_BITMAP(pdc_gpio_domain_enabled_irqs, PDC_MAX_GPIO_IRQS);
+	DECLARE_BITMAP(pdc_gpio_domain_wake_irqs, PDC_MAX_GPIO_IRQS);
+
+	struct irq_domain *pdc_domain;
+	struct irq_domain *pdc_gpio_domain;
+};
+
 static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
 static struct pdc_pin_region *pdc_region;
@@ -89,18 +108,38 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
+	struct pdc_pm_data *p;
+
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	p = irq_data_get_irq_chip_data(d);
+	if (!p->from_pdc_suspend) {
+		if (irq_domain_qcom_handle_wakeup(d->domain))
+			clear_bit(d->hwirq, p->pdc_gpio_domain_enabled_irqs);
+		else
+			clear_bit(d->hwirq, p->pdc_domain_enabled_irqs);
+	}
+
 	pdc_enable_intr(d, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
+	struct pdc_pm_data *p;
+
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	p = irq_data_get_irq_chip_data(d);
+	if (!p->from_pdc_suspend) {
+		if (irq_domain_qcom_handle_wakeup(d->domain))
+			set_bit(d->hwirq, p->pdc_gpio_domain_enabled_irqs);
+		else
+			set_bit(d->hwirq, p->pdc_domain_enabled_irqs);
+	}
+
 	pdc_enable_intr(d, true);
 	irq_chip_enable_parent(d);
 }
@@ -145,6 +184,39 @@ enum pdc_irq_config_bits {
 };
 
 /**
+ * qcom_pdc_gic_set_wake: Mark IRQ as wakeup capable
+ *
+ * @d: the interrupt data
+ * @on: enable or disable wakeup capability
+ *
+ * Mark IRQ as wake up capable at either pdc_domain or pdc_gpio_domain.
+ * This will be used when entering to suspend where if any wakeup capable
+ * IRQ is already disabled in SW, such IRQ needs to be re-enabled at HW.
+ */
+static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct pdc_pm_data *p;
+
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	p = irq_data_get_irq_chip_data(d);
+	if (on) {
+		if (irq_domain_qcom_handle_wakeup(d->domain))
+			set_bit(d->hwirq, p->pdc_gpio_domain_wake_irqs);
+		else
+			set_bit(d->hwirq, p->pdc_domain_wake_irqs);
+	} else {
+		if (irq_domain_qcom_handle_wakeup(d->domain))
+			clear_bit(d->hwirq, p->pdc_gpio_domain_wake_irqs);
+		else
+			clear_bit(d->hwirq, p->pdc_domain_wake_irqs);
+	}
+
+	return irq_chip_set_wake_parent(d, on);
+}
+
+/**
  * qcom_pdc_gic_set_type: Configure PDC for the interrupt
  *
  * @d: the interrupt data
@@ -202,14 +274,162 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_get_irqchip_state	= qcom_pdc_gic_get_irqchip_state,
 	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_wake		= qcom_pdc_gic_set_wake,
 	.irq_set_type		= qcom_pdc_gic_set_type,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
-				  IRQCHIP_SET_TYPE_MASKED |
-				  IRQCHIP_SKIP_SET_WAKE,
+				  IRQCHIP_SET_TYPE_MASKED,
 	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
 
+static struct irq_data *pdc_find_irq_data(struct irq_domain *domain,
+					  int wake_irq)
+{
+	int irq = irq_find_mapping(domain, wake_irq);
+	struct irq_desc *desc = irq_to_desc(irq);
+
+	return &desc->irq_data;
+}
+
+/**
+ * pdc_suspend: Enable IRQs marked for wakeup
+ *
+ * @p: pdc_pm_data
+ *
+ * The SW expects that an IRQ that's disabled with disable_irq() can still
+ * wake the system from sleep states such as "suspend to RAM", if it has
+ * been marked for wakeup.
+ *
+ * While the SW may choose to differ status for "wake" and "enabled" interrupts,
+ * its not the case with HW. There is no dedicated config in HW to differ "wake"
+ * and "enabled". Same is case for PDC's parent irq_chip (ARM GIC) which has
+ * only GICD_ISENABLER to indicate "enabled" or "disabled" status.
+ *
+ * So, the HW ONLY understands either "enabled" or "disabled".
+ * The final status in HW should be an "OR" of "enable" and "wake" status.
+ * i.e. PDC (and GIC) irq enable in HW = irq enable | irq wake in SW
+ */
+static void pdc_suspend(struct pdc_pm_data *p)
+{
+	int wake_irq;
+	bool enabled;
+	struct irq_data *d;
+
+	p->from_pdc_suspend = true;
+	for_each_set_bit(wake_irq, p->pdc_domain_wake_irqs, PDC_MAX_IRQS) {
+		enabled = test_bit(wake_irq, p->pdc_domain_enabled_irqs);
+		if (!enabled) {
+			d = pdc_find_irq_data(p->pdc_domain, wake_irq);
+
+			pdc_enable_intr(d, true);
+			irq_chip_enable_parent(d);
+		}
+	}
+
+	for_each_set_bit(wake_irq, p->pdc_gpio_domain_wake_irqs,
+			 PDC_MAX_GPIO_IRQS) {
+		enabled = test_bit(wake_irq, p->pdc_gpio_domain_enabled_irqs);
+		if (!enabled) {
+			d = pdc_find_irq_data(p->pdc_gpio_domain, wake_irq);
+
+			irq_chip_enable_parent(d);
+		}
+	}
+}
+
+static void pdc_resume(struct pdc_pm_data *p)
+{
+	int wake_irq;
+	bool enabled, pending;
+	struct irq_data *d;
+
+	for_each_set_bit(wake_irq, p->pdc_domain_wake_irqs, PDC_MAX_IRQS) {
+		enabled = test_bit(wake_irq, p->pdc_domain_enabled_irqs);
+		if (!enabled) {
+			d = pdc_find_irq_data(p->pdc_domain, wake_irq);
+
+			pdc_enable_intr(d, false);
+			irq_chip_disable_parent(d);
+		}
+	}
+
+	for_each_set_bit(wake_irq, p->pdc_gpio_domain_wake_irqs,
+			 PDC_MAX_GPIO_IRQS) {
+		enabled = test_bit(wake_irq, p->pdc_gpio_domain_enabled_irqs);
+		if (!enabled) {
+			d = pdc_find_irq_data(p->pdc_gpio_domain, wake_irq);
+
+			/*
+			 * When the drivers invoke enablie_irq() on a GPIO IRQ,
+			 * the pending interrupt gets cleared at GIC before
+			 * enabling it from msm_gpio_irq_enable(). So CPU will
+			 * never see pending IRQ after resume if we disable them
+			 * here.
+			 *
+			 * If wakeup is due to GPIO interrupt do not disable it.
+			 * By not disabling, The IRQ will be delivered to CPU
+			 * and when driver invokes enable_irq(), The softirq
+			 * tasklet does resend_irqs() to call irq handler.
+			 */
+			irq_chip_get_parent_state(d, IRQCHIP_STATE_PENDING,
+						  &pending);
+			if (pending) {
+				pending = false;
+				continue;
+			}
+
+			irq_chip_disable_parent(d);
+		}
+	}
+	p->from_pdc_suspend = false;
+}
+
+static int pdc_cpu_pm_callback(struct notifier_block *nfb,
+			       unsigned long action, void *v)
+{
+	struct pdc_pm_data *p = container_of(nfb, struct pdc_pm_data,
+					     pdc_cpu_pm_nfb);
+	unsigned long flags;
+
+	if (!p->suspend_start)
+		return NOTIFY_OK;
+
+	spin_lock_irqsave(&p->pm_lock, flags);
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpumask_set_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
+		if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
+			pdc_suspend(p);
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		if (cpumask_equal(&p->cpus_in_pc, cpu_online_mask))
+			pdc_resume(p);
+		cpumask_clear_cpu(raw_smp_processor_id(), &p->cpus_in_pc);
+		break;
+	}
+	spin_unlock_irqrestore(&p->pm_lock, flags);
+
+	return NOTIFY_OK;
+}
+
+static int pdc_pm_callback(struct notifier_block *nfb,
+			   unsigned long event, void *unused)
+{
+	struct pdc_pm_data *p = container_of(nfb, struct pdc_pm_data,
+					     pdc_pm_nfb);
+	switch (event) {
+	case PM_SUSPEND_PREPARE:
+		p->suspend_start = true;
+		break;
+	case PM_POST_SUSPEND:
+		p->suspend_start = false;
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
 static irq_hw_number_t get_parent_hwirq(int pin)
 {
 	int i;
@@ -254,7 +474,8 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 		return ret;
 
 	ret  = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
-					     &qcom_pdc_gic_chip, NULL);
+					     &qcom_pdc_gic_chip,
+					     domain->host_data);
 	if (ret)
 		return ret;
 
@@ -298,7 +519,8 @@ static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
 		return ret;
 
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
-					    &qcom_pdc_gic_chip, NULL);
+					    &qcom_pdc_gic_chip,
+					    domain->host_data);
 	if (ret)
 		return ret;
 
@@ -376,7 +598,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 
 static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 {
-	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
+	struct pdc_pm_data *p;
+	struct irq_domain *parent_domain;
 	int ret;
 
 	pdc_base = of_iomap(node, 0);
@@ -385,6 +608,10 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		return -ENXIO;
 	}
 
+	p = kzalloc(sizeof(struct pdc_pm_data), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);
@@ -398,33 +625,47 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		goto fail;
 	}
 
-	pdc_domain = irq_domain_create_hierarchy(parent_domain, 0, PDC_MAX_IRQS,
-						 of_fwnode_handle(node),
-						 &qcom_pdc_ops, NULL);
-	if (!pdc_domain) {
+	p->pdc_domain = irq_domain_create_hierarchy(parent_domain, 0,
+						    PDC_MAX_IRQS,
+						    of_fwnode_handle(node),
+						    &qcom_pdc_ops, p);
+	if (!p->pdc_domain) {
 		pr_err("%pOF: GIC domain add failed\n", node);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
-	pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
+	p->pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
 					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
 					PDC_MAX_GPIO_IRQS,
 					of_fwnode_handle(node),
-					&qcom_pdc_gpio_ops, NULL);
-	if (!pdc_gpio_domain) {
+					&qcom_pdc_gpio_ops, p);
+	if (!p->pdc_gpio_domain) {
 		pr_err("%pOF: PDC domain add failed for GPIO domain\n", node);
 		ret = -ENOMEM;
 		goto remove;
 	}
 
-	irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
+	irq_domain_update_bus_token(p->pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
+
+	/* Register for PM-transition events */
+	p->pdc_pm_nfb.notifier_call = pdc_pm_callback;
+	ret = register_pm_notifier(&p->pdc_pm_nfb);
+	if (ret)
+		goto remove;
+
+	spin_lock_init(&p->pm_lock);
+
+	/* Register for CPU PM notifications */
+	p->pdc_cpu_pm_nfb.notifier_call = pdc_cpu_pm_callback;
+	cpu_pm_register_notifier(&p->pdc_cpu_pm_nfb);
 
 	return 0;
 
 remove:
-	irq_domain_remove(pdc_domain);
+	irq_domain_remove(p->pdc_domain);
 fail:
+	kfree(p);
 	kfree(pdc_region);
 	iounmap(pdc_base);
 	return ret;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
