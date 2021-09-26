Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CF1418539
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 01:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhIYXpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 19:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbhIYXpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 19:45:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0C6C061570
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 16:43:36 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b20so58015954lfv.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 16:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DFfd/JC8j9IHp/sLtvzbrtqJqzkPd2x9x4ilWlw0QQQ=;
        b=VaWe42CK/Kkmpgu3dZBdwaNMfpD8UE5AzhPlNISdB0DmdfvEd5Nl3H6ImY0yohfzQY
         xZL87ihnXph0w1L0Srywvt+Y5/PDgtiDe+2rIjyBp11W0QBI1SICMImPCt0ZMmSX6pFZ
         rZANo9RMReqZiCLqbN2AT7Iilokz0/e/DSyPC3O/m9zcnhqT6/JcH4gN563MAoLonII+
         rNDsjoyToN7ad9r8CLz1IGR4KawHStQAgyyMcP3q7DrVp1qF4v+Y+uMjFLtOaua/3U8z
         oEOGx59jD072WnOZ7xlQJ+dyxyBkEacmV4Uz5Vv5Z7mYzMGJ5+XlUIf02HN3/S9s34X0
         OmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DFfd/JC8j9IHp/sLtvzbrtqJqzkPd2x9x4ilWlw0QQQ=;
        b=q6+Vy5K9ub9BvPRQ+PPkbOSWd14Hf5FYIUrzTWjiSNljUcVoJfh5rZOIPftY1Kv+Jo
         En0ZOKMKqU7ij9NhWELlK9GnuUACQAxIVK4jsyoTdeGarNSGECJce1/1NW2l86vA2FrO
         6zvnARz77otVwM6DxZjO28OwqJ6nOelxG/iP1bBPc0CCY3V2ILS4/4XzPmM17RLLXyTX
         KeSjKQn3kLliJ/+BS2Z+IUMXOx4XaUkwc/8NyyTOxSBYM6fNHyQmq2aGwub1F/OUS9PW
         FGvibbkdUZsiTUeox9k5qkJk72MW7vURHJDglxNSGnzRMiMsWnBg903qApyOf7AlzLFj
         Of1Q==
X-Gm-Message-State: AOAM530E3vytnjXut3QcaZohl42vYvJU3JnCrnm7gj99egTMzs0gObGR
        pg/eKeWGLi3OndmY4l+bCUC1Ap9aR8gqgQ==
X-Google-Smtp-Source: ABdhPJxec27/OOZ3609xNOodUpRfzg9ar7dHrvZfszLlzdZ0RNwe/VpZoEkX1mmIM4jHSD6UOOE5Gg==
X-Received: by 2002:a2e:8097:: with SMTP id i23mr20693184ljg.66.1632613414750;
        Sat, 25 Sep 2021 16:43:34 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v1sm1144360lfp.215.2021.09.25.16.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 16:43:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
Date:   Sun, 26 Sep 2021 02:43:33 +0300
Message-Id: <20210925234333.2430755-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
(see 461c1a7d4733 ("gpiolib: override irq_enable/disable"))
as in this path the IRQ resources are not allocated (and thus the
corresponding GPIO is not marked as used for the IRQ. Use request_irq so
that the IRQ resources are proprely setup.

[ 0.803271] ------------[ cut here ]------------
[ 0.803338] WARNING: CPU: 3 PID: 1 at drivers/gpio/gpiolib.c:3207 gpiochip_enable_irq+0xa4/0xa8
[ 0.803470] Modules linked in:
[ 0.803542] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc6-next-20210820-postmarketos-qcom-apq8064+ #1
[ 0.803645] Hardware name: Generic DT based system
[ 0.803710] Backtrace:
[ 0.803777] [<c0e3493c>] (dump_backtrace) from [<c0e34d00>] (show_stack+0x20/0x24)
[ 0.803911] r7:00000c87 r6:c07062dc r5:60000093 r4:c11d0f54
[ 0.803980] [<c0e34ce0>] (show_stack) from [<c0e38314>] (dump_stack_lvl+0x48/0x54)
[ 0.804097] [<c0e382cc>] (dump_stack_lvl) from [<c0e38338>] (dump_stack+0x18/0x1c)
[ 0.804217] r5:00000009 r4:c11fe208
[ 0.804274] [<c0e38320>] (dump_stack) from [<c03219c8>] (__warn+0xfc/0x114)
[ 0.804387] [<c03218cc>] (__warn) from [<c0e35334>] (warn_slowpath_fmt+0x74/0xd0)
[ 0.804509] r7:c07062dc r6:00000c87 r5:c11fe208 r4:00000000
[ 0.804577] [<c0e352c4>] (warn_slowpath_fmt) from [<c07062dc>] (gpiochip_enable_irq+0xa4/0xa8)
[ 0.804716] r8:c27b6200 r7:c27aec00 r6:c27aec18 r5:cf77a448 r4:c02225f0
[ 0.804789] [<c0706238>] (gpiochip_enable_irq) from [<c0706348>] (gpiochip_irq_enable+0x28/0x38)
[ 0.804921] r5:cf77a448 r4:c27aec18
[ 0.804977] [<c0706320>] (gpiochip_irq_enable) from [<c03897a0>] (irq_enable+0x48/0x78)
[ 0.805111] r5:00000000 r4:c27aec00
[ 0.805167] [<c0389758>] (irq_enable) from [<c0389850>] (__irq_startup+0x80/0xbc)
[ 0.805286] r5:00000000 r4:c27aec00
[ 0.805343] [<c03897d0>] (__irq_startup) from [<c038996c>] (irq_startup+0xe0/0x18c)
[ 0.805468] r7:c27aec00 r6:00000001 r5:00000000 r4:c27aec00
[ 0.805535] [<c038988c>] (irq_startup) from [<c0389a54>] (irq_activate_and_startup+0x3c/0x74)
[ 0.805669] r7:c27aec00 r6:00000001 r5:c27aec00 r4:00000000
[ 0.805736] [<c0389a18>] (irq_activate_and_startup) from [<c0389b58>] (__irq_do_set_handler+0xcc/0x1c0)
[ 0.805875] r7:c27aec00 r6:c0383710 r5:c08a16b0 r4:00000001
[ 0.805943] [<c0389a8c>] (__irq_do_set_handler) from [<c0389d80>] (irq_set_chained_handler_and_data+0x60/0x98)
[ 0.806087] r7:c27b5c10 r6:c27aed40 r5:c08a16b0 r4:c27aec00
[ 0.806154] [<c0389d20>] (irq_set_chained_handler_and_data) from [<c08a1660>] (pm8xxx_probe+0x1fc/0x24c)
[ 0.806298] r6:0000003a r5:0000003a r4:c27b5c00
[ 0.806359] [<c08a1464>] (pm8xxx_probe) from [<c0871420>] (platform_probe+0x6c/0xc8)
[ 0.806495] r10:c2507080 r9:e8bea2cc r8:c165e0e0 r7:c165e0e0 r6:c15f08f8 r5:c27b5c10
[ 0.806582] r4:00000000
[ 0.806632] [<c08713b4>] (platform_probe) from [<c086e280>] (really_probe+0xe8/0x460)
[ 0.806769] r7:c165e0e0 r6:c15f08f8 r5:00000000 r4:c27b5c10
[ 0.806837] [<c086e198>] (really_probe) from [<c086e6a8>] (__driver_probe_device+0xb0/0x22c)
[ 0.806975] r7:c27b5c10 r6:cf70fba4 r5:c15f08f8 r4:c27b5c10
[ 0.807042] [<c086e5f8>] (__driver_probe_device) from [<c086e868>] (driver_probe_device+0x44/0xe0)
[ 0.807188] r9:e8bea2cc r8:00000000 r7:c27b5c10 r6:cf70fba4 r5:c16ae4b4 r4:c16ae4b0
[ 0.807271] [<c086e824>] (driver_probe_device) from [<c086ecd8>] (__device_attach_driver+0xb4/0x12c)
[ 0.807421] r9:e8bea2cc r8:c15eec08 r7:c27b5c10 r6:cf70fba4 r5:c15f08f8 r4:00000001
[ 0.807506] [<c086ec24>] (__device_attach_driver) from [<c086c06c>] (bus_for_each_drv+0x94/0xe4)
[ 0.807651] r7:c16ae484 r6:c086ec24 r5:cf70fba4 r4:00000000
[ 0.807718] [<c086bfd8>] (bus_for_each_drv) from [<c086e0e0>] (__device_attach+0x104/0x19c)
[ 0.807852] r6:00000001 r5:c27b5c54 r4:c27b5c10
[ 0.807913] [<c086dfdc>] (__device_attach) from [<c086eef4>] (device_initial_probe+0x1c/0x20)
[ 0.808050] r6:c27b5c10 r5:c15ef1b0 r4:c27b5c10
[ 0.808111] [<c086eed8>] (device_initial_probe) from [<c086d00c>] (bus_probe_device+0x94/0x9c)
[ 0.808240] [<c086cf78>] (bus_probe_device) from [<c086a60c>] (device_add+0x404/0x8f4)
[ 0.808370] r7:c16ae484 r6:c251ba10 r5:00000000 r4:c27b5c10
[ 0.808439] [<c086a208>] (device_add) from [<c0a82f50>] (of_device_add+0x44/0x4c)
[ 0.808581] r10:c144c854 r9:00000001 r8:e8bea314 r7:c251ba10 r6:00000000 r5:00000000
[ 0.808669] r4:c27b5c00
[ 0.808718] [<c0a82f0c>] (of_device_add) from [<c0a836cc>] (of_platform_device_create_pdata+0xa0/0xc8)
[ 0.808850] [<c0a8362c>] (of_platform_device_create_pdata) from [<c0a83908>] (of_platform_bus_create+0x1f0/0x514)
[ 0.809005] r9:00000001 r8:c251ba10 r7:00000000 r6:00000000 r5:00000000 r4:e8bea2b0
[ 0.809086] [<c0a83718>] (of_platform_bus_create) from [<c0a83e04>] (of_platform_populate+0x98/0x128)
[ 0.809233] r10:c144c854 r9:00000001 r8:c251ba10 r7:00000000 r6:00000000 r5:e8bea170
[ 0.809321] r4:e8bea2b0
[ 0.809371] [<c0a83d6c>] (of_platform_populate) from [<c0a83f20>] (devm_of_platform_populate+0x60/0xa8)
[ 0.809521] r9:0000011d r8:c165e0e0 r7:e8bea170 r6:c2c34f40 r5:c2cac140 r4:c251ba10
[ 0.809604] [<c0a83ec0>] (devm_of_platform_populate) from [<c08a212c>] (ssbi_probe+0x138/0x16c)
[ 0.809738] r6:c2c34f40 r5:c251ba10 r4:ff822700
[ 0.809800] [<c08a1ff4>] (ssbi_probe) from [<c0871420>] (platform_probe+0x6c/0xc8)
[ 0.809923] r7:c165e0e0 r6:c15f0a80 r5:c251ba10 r4:00000000
[ 0.809989] [<c08713b4>] (platform_probe) from [<c086e280>] (really_probe+0xe8/0x460)
[ 0.810120] r7:c165e0e0 r6:c15f0a80 r5:00000000 r4:c251ba10
[ 0.810187] [<c086e198>] (really_probe) from [<c086e6a8>] (__driver_probe_device+0xb0/0x22c)
[ 0.810325] r7:c251ba10 r6:c15f0a80 r5:c15f0a80 r4:c251ba10
[ 0.810393] [<c086e5f8>] (__driver_probe_device) from [<c086e868>] (driver_probe_device+0x44/0xe0)
[ 0.810539] r9:0000011d r8:00000000 r7:c251ba10 r6:c15f0a80 r5:c16ae4b4 r4:c16ae4b0
[ 0.810623] [<c086e824>] (driver_probe_device) from [<c086ee2c>] (__driver_attach+0xdc/0x188)
[ 0.810766] r9:0000011d r8:c144c834 r7:00000000 r6:c15f0a80 r5:c251ba10 r4:00000000
[ 0.810849] [<c086ed50>] (__driver_attach) from [<c086bf60>] (bus_for_each_dev+0x88/0xd4)
[ 0.810985] r7:00000000 r6:c086ed50 r5:c15f0a80 r4:00000000
[ 0.811052] [<c086bed8>] (bus_for_each_dev) from [<c086dad4>] (driver_attach+0x2c/0x30)
[ 0.811182] r6:c15ef1b0 r5:c2c34e80 r4:c15f0a80
[ 0.811243] [<c086daa8>] (driver_attach) from [<c086d2dc>] (bus_add_driver+0x180/0x21c)
[ 0.811364] [<c086d15c>] (bus_add_driver) from [<c086fa6c>] (driver_register+0x84/0x118)
[ 0.811492] r7:00000000 r6:ffffe000 r5:c1428210 r4:c15f0a80
[ 0.811558] [<c086f9e8>] (driver_register) from [<c0871174>] (__platform_driver_register+0x2c/0x34)
[ 0.811683] r5:c1428210 r4:c16524a0
[ 0.811739] [<c0871148>] (__platform_driver_register) from [<c1428234>] (ssbi_driver_init+0x24/0x28)
[ 0.811868] [<c1428210>] (ssbi_driver_init) from [<c0302394>] (do_one_initcall+0x68/0x2c8)
[ 0.811990] [<c030232c>] (do_one_initcall) from [<c140147c>] (kernel_init_freeable+0x1dc/0x23c)
[ 0.812135] r7:cf7b0400 r6:c130339c r5:00000007 r4:c147f6a0
[ 0.812204] [<c14012a0>] (kernel_init_freeable) from [<c0e40e60>] (kernel_init+0x20/0x138)
[ 0.812345] r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0e40e40
[ 0.812433] r4:00000000
[ 0.812483] [<c0e40e40>] (kernel_init) from [<c0300150>] (ret_from_fork+0x14/0x24)
[ 0.812596] Exception stack(0xcf70ffb0 to 0xcf70fff8)
[ 0.812684] ffa0: 00000000 00000000 00000000 00000000
[ 0.812809] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[ 0.812923] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 0.813008] r5:c0e40e40 r4:00000000
[ 0.813075] ---[ end trace ad2443eee078d094 ]---

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: David Heidelberg <david@ixit.cz>
---
Changes since v1:
 - Expanded commit message to include warning text and gpiolib details
 - No code changes

---
 drivers/mfd/qcom-pm8xxx.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index ec18a04de355..2f2734ba5273 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -65,7 +65,7 @@
 struct pm_irq_data {
 	int num_irqs;
 	struct irq_chip *irq_chip;
-	void (*irq_handler)(struct irq_desc *desc);
+	irq_handler_t irq_handler;
 };
 
 struct pm_irq_chip {
@@ -169,19 +169,16 @@ static int pm8xxx_irq_master_handler(struct pm_irq_chip *chip, int master)
 	return ret;
 }
 
-static void pm8xxx_irq_handler(struct irq_desc *desc)
+static irqreturn_t pm8xxx_irq_handler(int irq, void *data)
 {
-	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	struct pm_irq_chip *chip = data;
 	unsigned int root;
 	int	i, ret, masters = 0;
 
-	chained_irq_enter(irq_chip, desc);
-
 	ret = regmap_read(chip->regmap, SSBI_REG_ADDR_IRQ_ROOT, &root);
 	if (ret) {
 		pr_err("Can't read root status ret=%d\n", ret);
-		return;
+		return IRQ_NONE;
 	}
 
 	/* on pm8xxx series masters start from bit 1 of the root */
@@ -192,7 +189,7 @@ static void pm8xxx_irq_handler(struct irq_desc *desc)
 		if (masters & (1 << i))
 			pm8xxx_irq_master_handler(chip, i);
 
-	chained_irq_exit(irq_chip, desc);
+	return IRQ_HANDLED;
 }
 
 static void pm8821_irq_block_handler(struct pm_irq_chip *chip,
@@ -230,19 +227,17 @@ static inline void pm8821_irq_master_handler(struct pm_irq_chip *chip,
 			pm8821_irq_block_handler(chip, master, block);
 }
 
-static void pm8821_irq_handler(struct irq_desc *desc)
+static irqreturn_t pm8821_irq_handler(int irq, void *data)
 {
-	struct pm_irq_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	struct pm_irq_chip *chip = data;
 	unsigned int master;
 	int ret;
 
-	chained_irq_enter(irq_chip, desc);
 	ret = regmap_read(chip->regmap,
 			  PM8821_SSBI_REG_ADDR_IRQ_MASTER0, &master);
 	if (ret) {
 		pr_err("Failed to read master 0 ret=%d\n", ret);
-		goto done;
+		return IRQ_NONE;
 	}
 
 	/* bits 1 through 7 marks the first 7 blocks in master 0 */
@@ -251,19 +246,18 @@ static void pm8821_irq_handler(struct irq_desc *desc)
 
 	/* bit 0 marks if master 1 contains any bits */
 	if (!(master & BIT(0)))
-		goto done;
+		return IRQ_NONE;
 
 	ret = regmap_read(chip->regmap,
 			  PM8821_SSBI_REG_ADDR_IRQ_MASTER1, &master);
 	if (ret) {
 		pr_err("Failed to read master 1 ret=%d\n", ret);
-		goto done;
+		return IRQ_NONE;
 	}
 
 	pm8821_irq_master_handler(chip, 1, master);
 
-done:
-	chained_irq_exit(irq_chip, desc);
+	return IRQ_HANDLED;
 }
 
 static void pm8xxx_irq_mask_ack(struct irq_data *d)
@@ -574,14 +568,15 @@ static int pm8xxx_probe(struct platform_device *pdev)
 	if (!chip->irqdomain)
 		return -ENODEV;
 
-	irq_set_chained_handler_and_data(irq, data->irq_handler, chip);
+	rc = devm_request_irq(&pdev->dev, irq, data->irq_handler, 0, dev_name(&pdev->dev), chip);
+	if (rc)
+		return rc;
+
 	irq_set_irq_wake(irq, 1);
 
 	rc = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (rc) {
-		irq_set_chained_handler_and_data(irq, NULL, NULL);
+	if (rc)
 		irq_domain_remove(chip->irqdomain);
-	}
 
 	return rc;
 }
@@ -594,11 +589,9 @@ static int pm8xxx_remove_child(struct device *dev, void *unused)
 
 static int pm8xxx_remove(struct platform_device *pdev)
 {
-	int irq = platform_get_irq(pdev, 0);
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
 	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
-	irq_set_chained_handler_and_data(irq, NULL, NULL);
 	irq_domain_remove(chip->irqdomain);
 
 	return 0;
-- 
2.30.2

