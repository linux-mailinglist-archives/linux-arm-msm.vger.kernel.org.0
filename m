Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0E0413785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 18:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhIUQ0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 12:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhIUQ0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 12:26:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A4FC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 09:24:39 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b20so25355183lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oA9W6l8KRx2QluDseKYwcp4SAoPQajmJRCR/++O2IPM=;
        b=N9/NbaeUZbA778s4xRXZFBDEPBctPhOmDxgTG51I7UVzgANmVPfuYLsk1GMJuIDXVM
         sMx0Dv/PZFRwD/sRTpl0RqIJ7cXf7IOs3BL1MGksCo8s7oHWMG35wAUlKtDhqnnZQQzw
         oiW22s98XchV/zOeFo52JRY4lLQpFwQrAIXS5/IJHuU90kUvNfFnYsrKsy94jpwwr65W
         5vQ9cd9g+IGGm//iq5B0cTEXZAJCZE6I6jZ5/v2PFSYXVUva92+8MUjlW/r360qbxNEE
         D0X0k3ZUp9MubzAi7U1FtvdMgS6bGu3Z7lKjqwQHszRJcPSI/mGFUJWJ9cB+J4OxvUSu
         d8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oA9W6l8KRx2QluDseKYwcp4SAoPQajmJRCR/++O2IPM=;
        b=EBOsA+VZr1HxiH5M3e4UODvsEVVyzz7eCjxrxmLDZkpwohSRUEG8NMuzyJRJK+3G0o
         cOnI1fdRIjW6ycFoPorizFy6hhLb0q8upVxf2env4rEjvDBrE4Y8+gnQyqvqOBnyhkeE
         infSzJ3im2xxzPqkxAWXg8Sd1xwohh7DCl/xtODywvZyGeJzYZRXz8l3+s2dc1msSot+
         Wr4O0m1RN/Q06o66+Zqamn9u1VVSiUCAfJMqND3CjIueZiKYwCnN4kG7M2TkYQkIDaa7
         1AQa/5t5BXn4uQzdW2DBbOiUDUWwziiqY83LHBRk7zv3CDwjw+HDQTP1u0/8aWbrbrR7
         FJkA==
X-Gm-Message-State: AOAM53086sH+m2ynI7z6P7nDjHrcbqaQZrnthy29m6B3FkcCXMuHmvvL
        524Pc+DqrM5ZN/a3W+1k3ZqlEw==
X-Google-Smtp-Source: ABdhPJz8//pQL7rxkAQDCqlMPYURApFFcrlNJBBwuGAKnVevdB1SX4KGQFNwZrPfHdd+k4OY0UwNmQ==
X-Received: by 2002:a2e:a36c:: with SMTP id i12mr29555587ljn.427.1632241474286;
        Tue, 21 Sep 2021 09:24:34 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4sm1792058ljn.122.2021.09.21.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:24:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
Date:   Tue, 21 Sep 2021 19:24:33 +0300
Message-Id: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
as in this path the IRQ resources are not allocated (and thus the
corresponding GPIO is not marked as used for the IRQ. Use request_irq so
that the IRQ resources are proprely setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

