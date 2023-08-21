Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09BB2782478
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 09:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbjHUHaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 03:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbjHUHaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 03:30:23 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F45FB7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 00:30:21 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fee87dd251so12085555e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692603019; x=1693207819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BWXYfYmXiPh2HluZopL4dbAAxyko+YeqRS/FZmlWCQ=;
        b=s4wiAGes1tP+3FcI6leSk43tGEt/9yOjg+JDODOo5mdyCmUMMpv3xj5KCydB6qvpaX
         LeXubukvzLtEaVzt11+eKX9uLAXnvblvdsCvHzJtOkZjZEGzi6MMcUE3keYZ710EqnCQ
         Bu4V3rk7PYaBMbm94zaNvD/ZEf1CeCOFn6JAd70gIkSZ1JjI1lG5EkdQ5vz5gPw4L+M9
         IzDT6YrE9J6SwRJUzczFkUteiMGSWUvU69rZrLuHYRnSCQXRELx2AZRg9nuZR4awJBKY
         NxjU0grchx8jrvmw7BFrilOn1C+THPglwOAvwSrUwcWXL9j7ZnQDRiLKXfW6qCBi+ppx
         5CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692603019; x=1693207819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BWXYfYmXiPh2HluZopL4dbAAxyko+YeqRS/FZmlWCQ=;
        b=YMH6tMDR+VptEJ050+IjDi0VIZm9VeGALsSnC9x7wH51YYqBsCoRDMFlwk2E9XKnz9
         b4Lou82EfMxd1Ow3fqwl6c8fyyZAOTScP0qabjzDjvFZNw5itPh3HM3YRfbtsUv+1cJL
         V7mOxEthqjf/RIqJSB0oyrKzZG889yx5Z1JcOkZDfV3997sEFZWsWJ9oR/o8ihBwnlb9
         T3iqb2oUSQRnCDnvG2djSGrg/NEBCsj7FD5eufiXQcY5mtb+nc7Fqrvavavaz/cyOmIM
         LW3rNdaFFRgx2sXYV4MxkI4jD84L8TbJ8JTeNWmBNNV8gJX1hUP2bw8mUBcXU/2e8qcS
         LvOg==
X-Gm-Message-State: AOJu0YzJAhsc7lQ+IE2Mrx7DSTDvsGAssa7kSjBpeH5qMyuj16BY/Ax6
        UtNz6McToWhwdJLf4ilX4aBgfKbHGk6weG866zMlBw==
X-Google-Smtp-Source: AGHT+IFW9zlBHZwxhQXbUjNQ89/X6t7SSIa8luqBGpvNO3NOYr9djAdi8EZtZZpgTo9zVAh2L4BPwA==
X-Received: by 2002:a1c:4c15:0:b0:3fe:1d13:4663 with SMTP id z21-20020a1c4c15000000b003fe1d134663mr4457756wmf.1.1692603019678;
        Mon, 21 Aug 2023 00:30:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b003fe0a0e03fcsm15137789wmm.12.2023.08.21.00.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 00:30:19 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 21 Aug 2023 09:30:17 +0200
Subject: [PATCH] irqchip/qcom-pdc: add support for v3.2 HW
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230821-topic-sm8x50-upstream-pdc-ver-v1-1-6d7f4dd95719@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIgS42QC/x3MQQqDQAwF0KtI1g1MpgrSq5Qu7Pi1WahDYkUQ7
 +7g8m3eQQ5TOL2qgwybui5zgTwqSr9uHsHaF1MM8RnaKLwuWRP71O5N4H/21dBNnPvEG4xF6oR
 v3UAAKkc2DLrf//tznhc6ohnVbwAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4572;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SBzbuwbrRAXKpVAsBz6neyqp15YBunMl5davlV3f3jU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk4xKKZuYPitaKLrIEbpksz2eP59MCf/8gJnN+umUn
 L5YdQsSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZOMSigAKCRB33NvayMhJ0eEID/
 oCZTutLjAtmvgAEZPu4h8bhSMh1Y+CAl1nnIaZo5j7Clpi1oHNlkwOlbLhZsUK9wRXtdyxeUW9d462
 irgvvVl00zIcJ/Lgj2T3i+EZZ0yPb+jV5IeP5EA17P/PvNnrhA4+AVSaWdPcaED9fSvo0YZbC6ZjGo
 yjjIqzVwxMJfsnhgj25SsipfAlJ5r0NxiAbSygWM4LtaSkyqGatMvr3zJVEmKHwUGNtvQQ7dnoMVu/
 nZFYhb8jD+UCTYXPiMNvLeq2X/qn1jqPh8hNg8KFJRRt3q3CKs5ZC8szb7+Zx/i96fdcbe5WEpwyVI
 3AdP9VxoYA1fSkqDWc2gMmkMEZ3F7w4PGzyQvrHPLoCROTpG6YZt6R1Ony+sz5gCYxwg/UL9bL4Q8U
 OmjCAXKmioBnd5dicM0RHivdElbTR5PiAe57zKGB3DlLgSjswO2DK7fP4N+RyK1V1pHMaCMJ5x3Yoq
 uPHA68zDjYqEj3MVASzQGB//sfZJKuaImRa28zu5+hKj5yssVwHKwejc7OFT4sEBFp7Ue+zeIFBVk1
 ntlN4P2eJNsC4yXb8WzbN0qO3xAchLZxN3/D8K58s4pmmnq8QyjeX4jKCieZiSH0+utSvQU8N3NalO
 ZKERObgkuPxhCvMTVUTqaJLjPAh1yWpN9tTUvJyTmOK92YNhp/RmaRHbeh+w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PDC Hw version 3.2 and later doesn't have the enable registers
anymore, get the HW version from registers and stop accessing those
registers starting at this version.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/qcom-pdc.c | 64 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index d96916cf6a41..620efb9fcc96 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -26,6 +26,13 @@
 #define IRQ_ENABLE_BANK		0x10
 #define IRQ_i_CFG		0x110
 
+#define PDC_VERSION		0x1000
+
+/* Notable PDC versions */
+enum {
+	PDC_VERSION_3_2	= 0x30200,
+};
+
 struct pdc_pin_region {
 	u32 pin_base;
 	u32 parent_base;
@@ -38,6 +45,7 @@ static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
+static unsigned int pdc_version;
 
 static void pdc_reg_write(int reg, u32 i, u32 val)
 {
@@ -183,6 +191,25 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
 
+static struct irq_chip qcom_pdc_gic_chip_3_2 = {
+	.name			= "PDC",
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= irq_chip_disable_parent,
+	.irq_enable		= irq_chip_enable_parent,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= qcom_pdc_gic_set_type,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
+	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
 static struct pdc_pin_region *get_pin_region(int pin)
 {
 	int i;
@@ -202,6 +229,7 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 	struct irq_fwspec *fwspec = data;
 	struct irq_fwspec parent_fwspec;
 	struct pdc_pin_region *region;
+	struct irq_chip *chip;
 	irq_hw_number_t hwirq;
 	unsigned int type;
 	int ret;
@@ -213,8 +241,12 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 	if (hwirq == GPIO_NO_WAKE_IRQ)
 		return irq_domain_disconnect_hierarchy(domain, virq);
 
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
-					    &qcom_pdc_gic_chip, NULL);
+	if (pdc_version >= PDC_VERSION_3_2)
+		chip = &qcom_pdc_gic_chip_3_2;
+	else
+		chip = &qcom_pdc_gic_chip;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, chip, NULL);
 	if (ret)
 		return ret;
 
@@ -244,10 +276,23 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-static int pdc_setup_pin_mapping(struct device_node *np)
+static void pdc_enable_region(unsigned int n)
 {
-	int ret, n, i;
 	u32 irq_index, reg_index, val;
+	int i;
+
+	for (i = 0; i < pdc_region[n].cnt; i++) {
+		reg_index = (i + pdc_region[n].pin_base) >> 5;
+		irq_index = (i + pdc_region[n].pin_base) & 0x1f;
+		val = pdc_reg_read(IRQ_ENABLE_BANK, reg_index);
+		val &= ~BIT(irq_index);
+		pdc_reg_write(IRQ_ENABLE_BANK, reg_index, val);
+	}
+}
+
+static int pdc_setup_pin_mapping(struct device_node *np)
+{
+	int ret, n;
 
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
 	if (n <= 0 || n % 3)
@@ -277,13 +322,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc_region[n].cnt; i++) {
-			reg_index = (i + pdc_region[n].pin_base) >> 5;
-			irq_index = (i + pdc_region[n].pin_base) & 0x1f;
-			val = pdc_reg_read(IRQ_ENABLE_BANK, reg_index);
-			val &= ~BIT(irq_index);
-			pdc_reg_write(IRQ_ENABLE_BANK, reg_index, val);
-		}
+		if (pdc_version < PDC_VERSION_3_2)
+			pdc_enable_region(n);
 	}
 
 	return 0;
@@ -300,6 +340,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		return -ENXIO;
 	}
 
+	pdc_version = pdc_reg_read(PDC_VERSION, 0);
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);

---
base-commit: 47d9bb711707d15b19fad18c8e2b4b027a264a3a
change-id: 20230821-topic-sm8x50-upstream-pdc-ver-114ceb45e1ee

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

