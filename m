Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F99183123
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 14:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgCLNX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 09:23:26 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:40782 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727072AbgCLNX0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 09:23:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584019405; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=A/3mpaZcld7SUksESIFySDDhwjutUcmBEyVAA2r+W5A=; b=lKrV9MWWnjl4x/XuF1KaL27zCTCaWjEN3QqApub2AlSAs4Igp74pViayeCxgRpAfun0KuwYK
 04UorXj6ZbSpPaxvCkn4zgplQGrqujtvJnbbn172yYhggE21Yh/f84FOn74iGklk0UuCIkOw
 5JB4x8u2QsP3FEOiI1Ul99BU4Es=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6a37ca.7fedda5b9148-smtp-out-n02;
 Thu, 12 Mar 2020 13:23:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08039C433D2; Thu, 12 Mar 2020 13:23:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33B22C43636;
        Thu, 12 Mar 2020 13:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33B22C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [RFC v2] irqchip: qcom: pdc: Introduce irq_set_wake call
Date:   Thu, 12 Mar 2020 18:52:59 +0530
Message-Id: <1584019379-12085-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584019379-12085-1-git-send-email-mkshah@codeaurora.org>
References: <1584019379-12085-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the way interrupts get enabled at wakeup capable PDC irq chip.

Introduce irq_set_wake call which lets interrupts enabled at PDC with
enable_irq_wake and disabled with disable_irq_wake with certain
conditions.

Interrupt will get enabled in HW at PDC and its parent GIC if they are
either enabled is SW or marked as wake up capable.

interrupt will get disabled in HW at PDC and its parent GIC only if its
disabled in SW and also marked as non-wake up capable.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 124 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 6ae9e1f..d698cec 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/err.h>
@@ -30,6 +30,9 @@
 
 #define PDC_NO_PARENT_IRQ	~0UL
 
+DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
+DECLARE_BITMAP(pdc_enabled_irqs, PDC_MAX_IRQS);
+
 struct pdc_pin_region {
 	u32 pin_base;
 	u32 parent_base;
@@ -80,20 +83,32 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 	index = pin_out / 32;
 	mask = pin_out % 32;
 
-	raw_spin_lock(&pdc_lock);
 	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
 	enable = on ? ENABLE_INTR(enable, mask) : CLEAR_INTR(enable, mask);
 	pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
-	raw_spin_unlock(&pdc_lock);
 }
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
+	bool wake_status;
+
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
-	pdc_enable_intr(d, false);
-	irq_chip_disable_parent(d);
+	raw_spin_lock(&pdc_lock);
+
+	clear_bit(d->hwirq, pdc_enabled_irqs);
+	wake_status = test_bit(d->hwirq, pdc_wake_irqs);
+
+	/* Disable at PDC HW if wake_status also says same */
+	if (!wake_status)
+		pdc_enable_intr(d, false);
+
+	raw_spin_unlock(&pdc_lock);
+
+	/* Disable at GIC HW if wake_status also says same */
+	if (!wake_status)
+		irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
@@ -101,7 +116,16 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	raw_spin_lock(&pdc_lock);
+
+	set_bit(d->hwirq, pdc_enabled_irqs);
+
+	/* We can blindly enable at PDC HW as we are already in enable path */
 	pdc_enable_intr(d, true);
+
+	raw_spin_unlock(&pdc_lock);
+
+	/* We can blindly enable at GIC HW as we are already in enable path */
 	irq_chip_enable_parent(d);
 }
 
@@ -121,6 +145,92 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
 	irq_chip_unmask_parent(d);
 }
 
+/**
+ * qcom_pdc_gic_set_wake: Enables/Disables interrupt at PDC and parent GIC
+ *
+ * @d: the interrupt data
+ * @on: enable or disable wakeup capability
+ *
+ * The SW expects that an irq that's disabled with disable_irq()
+ * can still wake the system from sleep states such as "suspend to RAM",
+ * if it has been marked for wakeup.
+ *
+ * While the SW may choose to differ status for "wake" and "enabled"
+ * interrupts, its not the case with HW. There is no dedicated
+ * configuration in HW to differ "wake" and "enabled". Same is
+ * case for PDC's parent irq_chip (ARM GIC) which has only GICD_ISENABLER
+ * to indicate "enabled" or "disabled" status and also there is no .irq_set_wake
+ * implemented in parent GIC irq_chip.
+ *
+ * So, the HW ONLY understands either "enabled" or "disabled".
+ *
+ * This function is introduced to handle cases where drivers may invoke
+ * below during suspend in SW on their irq, and expect to wake up from this
+ * interrupt.
+ *
+ * 1. enable_irq_wake()
+ * 2. disable_irq()
+ *
+ * and below during resume
+ *
+ * 3. disable_irq_wake()
+ * 4. enable_irq()
+ *
+ * if (2) is invoked in end and just before suspend, it currently leaves
+ * interrupt "disabled" at HW and hence not leading to resume.
+ *
+ * Note that the order of invoking (1) & (2) may interchange and similarly
+ * it can interchange for (3) & (4) as per driver's wish.
+ *
+ * if the driver call .irq_set_wake first it will enable at HW but later
+ * call with .irq_disable will disable at HW. so final result is again
+ * "disabled" at HW whereas the HW expectection is to keep it "enabled"
+ * since it understands only "enabled" or "disabled".
+ *
+ * Hence .irq_set_wake can not just go ahead and  "enable" or "disable"
+ * at HW blindly, it needs to take in account status of currently "enable"
+ * or "disable" as well.
+ *
+ * Introduce .irq_set_wake in PDC irq_chip to handle above issue.
+ * The final status in HW should be an "OR" of "enable" and "wake" calls.
+ * (i.e. same as below table)
+ * -------------------------------------------------|
+ * ENABLE in SW | WAKE in SW | PDC & GIC HW Status  |
+ *      0       |     0      |     0	            |
+ *      0	|     1      |     1	            |
+ *	1	|     0      |     1		    |
+ *	1	|     1      |     1		    |
+ *--------------------------------------------------|
+ */
+
+static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
+{
+	bool enabled_status;
+
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	raw_spin_lock(&pdc_lock);
+	enabled_status = test_bit(d->hwirq, pdc_enabled_irqs);
+	if (on) {
+		set_bit(d->hwirq, pdc_wake_irqs);
+		pdc_enable_intr(d, true);
+	} else {
+		clear_bit(d->hwirq, pdc_wake_irqs);
+		pdc_enable_intr(d, enabled_status);
+	}
+
+	raw_spin_unlock(&pdc_lock);
+
+	/* Either "wake" or "enabled" need same status at parent as well */
+	if (on || enabled_status)
+		irq_chip_enable_parent(d);
+	else
+		irq_chip_disable_parent(d);
+
+	return irq_chip_set_wake_parent(d, on);
+}
+
 /*
  * GIC does not handle falling edge or active low. To allow falling edge and
  * active low interrupts to be handled at GIC, PDC has an inverter that inverts
@@ -203,9 +313,9 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= qcom_pdc_gic_set_type,
+	.irq_set_wake		= qcom_pdc_gic_set_wake,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
-				  IRQCHIP_SET_TYPE_MASKED |
-				  IRQCHIP_SKIP_SET_WAKE,
+				  IRQCHIP_SET_TYPE_MASKED,
 	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
