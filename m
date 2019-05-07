Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A129D16C6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfEGUlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53420 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbfEGUlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:41:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5F7276110F; Tue,  7 May 2019 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261660;
        bh=vv8CGD1fPg7X6zwEqq4Gef0YORTyCZGY7ipdgxxTf0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ohhw61LIB3cnvVVmn5F3n+D1E+CCtWiF3YB3fGjb6g+fDSOp6iJrllPp+XtxAbkgu
         87mYJx8gaf/bGeCRdAGM3MJK8Ef3zkT22/Rnewe+Iw7M5VF292+Er6m7m0eXWdA/tA
         xSLD2Q/U/YwjlTGtmsm6ZAeV3/FUx67XdkBxKsHc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE42C61215;
        Tue,  7 May 2019 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261658;
        bh=vv8CGD1fPg7X6zwEqq4Gef0YORTyCZGY7ipdgxxTf0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qgif6aqGUzfbBV59NthQwIfw3oKo/JXpeWdfjPFAywfR2pNol3I+HnolJrpi8GLCl
         KnaFij9hY1lqQzPZ6PjeBuK+RPwSlZm1EGvt8eEItQCLBfJa0Ov2iybKaj0cY8LSsn
         CG3mNCspIUhDTOKl447w7r7rePNtvB/PJu4GmkAE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE42C61215
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 08/11] drivers: pinctrl: msm: setup GPIO irqchip hierarchy
Date:   Tue,  7 May 2019 14:37:46 -0600
Message-Id: <20190507203749.3384-9-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To allow GPIOs to wakeup the system from suspend or deep idle, the
wakeup capable GPIOs are setup in hierarchy with interrupts from the
wakeup-parent irqchip.

In older SoC's, the TLMM will handover detection to the parent irqchip
and in newer SoC's, the parent irqchip may also be active as well as the
TLMM and therefore the GPIOs need to be masked at TLMM to avoid
duplicate interrupts. To enable both these configurations to exist,
allow the parent irqchip to dictate the TLMM irqchip's behavior when
masking/unmasking the interrupt.

Co-developed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v5:
	- Fix when GPIO does not have a wakeup interrupt parent
Changes in v4:
	- Remove irq_set_wake() on summary IRQ interrupt
Changes in v3:
	- Use of_irq_domain_map() and pass PDC pin to parent irqdomain
Changes in v2:
	- Call parent mask when masking GPIO interrupt
Changes in v1:
	- Fix bug when unmasking PDC interrupt
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 137 ++++++++++++++++++++++++-----
 1 file changed, 114 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee8119879c4c..e52c1c300bcc 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -27,6 +28,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
+#include <linux/soc/qcom/irq.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
 #include <linux/log2.h>
@@ -69,6 +71,7 @@ struct msm_pinctrl {
 
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
+	DECLARE_BITMAP(wakeup_masked_irqs, MAX_NR_GPIO);
 
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs[MAX_NR_TILES];
@@ -703,6 +706,13 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 
 	g = &pctrl->soc->groups[d->hwirq];
 
+	if (d->parent_data)
+		irq_chip_mask_parent(d);
+
+	/* Monitored by parent wakeup controller?*/
+	if (test_bit(d->hwirq, pctrl->wakeup_masked_irqs))
+		return;
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = msm_readl_intr_cfg(pctrl, g);
@@ -747,6 +757,13 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 
 	g = &pctrl->soc->groups[d->hwirq];
 
+	if (d->parent_data)
+		irq_chip_unmask_parent(d);
+
+	/* Monitored by parent wakeup controller? Keep masked */
+	if (test_bit(d->hwirq, pctrl->wakeup_masked_irqs))
+		return;
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = msm_readl_intr_cfg(pctrl, g);
@@ -767,6 +784,10 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	/* Handled by parent wakeup controller? Do nothing */
+	if (test_bit(d->hwirq, pctrl->wakeup_masked_irqs))
+		return;
+
 	g = &pctrl->soc->groups[d->hwirq];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -794,6 +815,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	g = &pctrl->soc->groups[d->hwirq];
 
+	if (d->parent_data)
+		irq_chip_set_type_parent(d, type);
+
+	/* Monitored by parent wakeup controller? Keep masked */
+	if (test_bit(d->hwirq, pctrl->wakeup_masked_irqs))
+		return 0;
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	/*
@@ -880,17 +908,10 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&pctrl->lock, flags);
-
-	irq_set_irq_wake(pctrl->irq, on);
-
-	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+	if (d->parent_data)
+		return irq_chip_set_wake_parent(d, on);
 
-	return 0;
+	return -ENODEV;
 }
 
 static int msm_gpio_irq_reqres(struct irq_data *d)
@@ -967,11 +988,75 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
 }
 
+static int msm_gpio_domain_translate(struct irq_domain *d,
+				     struct irq_fwspec *fwspec,
+				     unsigned long *hwirq, unsigned int *type)
+{
+	if (is_of_node(fwspec->fwnode)) {
+		if (fwspec->param_count < 2)
+			return -EINVAL;
+		*hwirq = fwspec->param[0];
+		*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int msm_gpio_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				 unsigned int nr_irqs, void *arg)
+{
+	int ret;
+	irq_hw_number_t hwirq;
+	struct gpio_chip *gc = domain->host_data;
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct irq_fwspec *fwspec = arg;
+	struct qcom_irq_fwspec parent = { };
+	unsigned int type;
+
+	ret = msm_gpio_domain_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &pctrl->irq_chip, gc);
+	if (ret < 0)
+		return ret;
+
+	if (!domain->parent)
+		return 0;
+
+	parent.fwspec.param_count = 2;
+	parent.fwspec.param[0] = GPIO_NO_WAKE_IRQ;
+	parent.fwspec.param[1] = fwspec->param[1];
+	ret = of_irq_domain_map(fwspec, &parent.fwspec);
+	if (ret == -ENOMEM)
+		return ret;
+
+	parent.fwspec.fwnode = domain->parent->fwnode;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent);
+	if (ret)
+		return ret;
+
+	if (parent.mask)
+		set_bit(hwirq, pctrl->wakeup_masked_irqs);
+
+	return 0;
+}
+
+static const struct irq_domain_ops msm_gpio_domain_ops = {
+	.translate = msm_gpio_domain_translate,
+	.alloc     = msm_gpio_domain_alloc,
+	.free      = irq_domain_free_irqs_top,
+};
+
 static int msm_gpio_init(struct msm_pinctrl *pctrl)
 {
 	struct gpio_chip *chip;
 	int ret;
 	unsigned ngpio = pctrl->soc->ngpios;
+	struct device_node *dn;
 
 	if (WARN_ON(ngpio > MAX_NR_GPIO))
 		return -EINVAL;
@@ -986,6 +1071,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->need_valid_mask = msm_gpio_needs_valid_mask(pctrl);
 
 	pctrl->irq_chip.name = "msmgpio";
+	pctrl->irq_chip.irq_eoi	= irq_chip_eoi_parent;
 	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
 	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
@@ -994,6 +1080,20 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 
+	chip->irq.chip = &pctrl->irq_chip;
+	chip->irq.domain_ops = &msm_gpio_domain_ops;
+	chip->irq.handler = handle_edge_irq;
+	chip->irq.default_type = IRQ_TYPE_NONE;
+
+	dn = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
+	if (dn) {
+		chip->irq.parent_domain = irq_find_matching_host(dn,
+						 DOMAIN_BUS_WAKEUP);
+		of_node_put(dn);
+		if (!chip->irq.parent_domain)
+			return -EPROBE_DEFER;
+	}
+
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
@@ -1015,26 +1115,17 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
 			dev_err(pctrl->dev, "Failed to add pin range\n");
-			gpiochip_remove(&pctrl->chip);
-			return ret;
+			goto fail;
 		}
 	}
 
-	ret = gpiochip_irqchip_add(chip,
-				   &pctrl->irq_chip,
-				   0,
-				   handle_edge_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(pctrl->dev, "Failed to add irqchip to gpiochip\n");
-		gpiochip_remove(&pctrl->chip);
-		return -ENOSYS;
-	}
-
 	gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
 				     msm_gpio_irq_handler);
 
 	return 0;
+fail:
+	gpiochip_remove(&pctrl->chip);
+	return ret;
 }
 
 static int msm_ps_hold_restart(struct notifier_block *nb, unsigned long action,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

