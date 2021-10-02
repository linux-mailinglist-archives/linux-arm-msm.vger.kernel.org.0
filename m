Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4391B41F8F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 03:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhJBBKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 21:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhJBBKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 21:10:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76F4C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 18:08:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y26so45355056lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TwnUq8SXZ8u06PKKxQfO24AMGZAo3ARGDD9smY+hrSo=;
        b=WBLFAXKP/avkEIJvCsu2UUbycozUidIo39NMEjAlaseENxcmjKucU7jw6ghx4sUcMJ
         sxGEu+/YATqNePzUBS9j4sv7l2W2M+YqciWA9+DKhBni8J0Rr7N4u3vcTtt92JbZyxjr
         fyH1oU040czfg6N/z7ThnmLXe+L3EiebUnSoSrDvgsWiG6Kf8spQeRC1w7hZsbKRPkUe
         qvk0tsl3TXU/NVKbEtqTM1iQNwuHE1IUIgb/hHV1nUkjX4dwEotfaZu0rw+nswafi1rI
         2PgKz9DNz6Offsf7ORTFGtPK05W4MajfL3RJJSHSVwBGBbjIcOgnIczhLCtLtZTFfA4F
         advg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TwnUq8SXZ8u06PKKxQfO24AMGZAo3ARGDD9smY+hrSo=;
        b=Bz/dNtEfdfQTuPD/GcLSYQDZ4kfL5DxquYFxjH2s8HbePM0FLGa1y6DWxwZTuk8Ts3
         H2e6l/1EZjLE4IqXZACwzfpic0F7awDuwlFqHuD57qgGnjciI4nDeJlbl/99VxzP0urL
         EeqJu52mWnOJIx9SbRcpZ0tLqZIa1AworJScLVtlJB/uqHwuJ9nWyBN7UODuLT7aS6+W
         HxxAJHaZ2f/6+jbC30G4GiSajvIcOhj2S2/z+HDwmzK7loxa95VM/nil4r6U+kwksmAc
         nuCKoEzyITdswGV7iuzvyAu+WusbpZvVpP3DTGDs0nIQnwlUlIElyO/VYmLbzdACEQvU
         8OxQ==
X-Gm-Message-State: AOAM53360Kfy1AqhwXtE2XuewN8BTg+rU49+q+W4cNbGK7UXK0PP/lZU
        vE0qrWnflqA6nOnBesnc+DUxtg==
X-Google-Smtp-Source: ABdhPJz1h8wdgSqieaJyrzejlho/AFEp+e7W+xkxBieMCy2DG0EWozlg2gvagfH74adYlaiexki1ug==
X-Received: by 2002:a2e:a4ca:: with SMTP id p10mr1048203ljm.379.1633136895276;
        Fri, 01 Oct 2021 18:08:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k17sm892673lfb.233.2021.10.01.18.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 18:08:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
Date:   Sat,  2 Oct 2021 04:08:12 +0300
Message-Id: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
2.33.0

