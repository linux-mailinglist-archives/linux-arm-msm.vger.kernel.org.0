Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BAF1D0408
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 02:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732103AbgEMAzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 20:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732101AbgEMAze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 20:55:34 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48462C05BD0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 17:55:34 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u5so4386343pgn.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IJgmgp+rAG9yo6xgDF6A6HsX/YJQRAULhH1j2GR7SRM=;
        b=Obk+GLq7mPdNLuSKVXt+w4hZtdZOkNLL0ym8RfMxo7FOKemI8JHgWOcUuFTjBvJZ6F
         ZzW+T+i5tbYOxvfKD5iWbPgSk03q2lKwsJTsmRd/FMWksMT7Dn0Nv0HoWAkbVzv4oNDC
         GHpGDGFIsSe5oJoZBRxNZ0EWQBuCte0QR3vsFFq03BM5Sw7PhqlFrZWEEIj+sLiMY8QV
         JzyvhiPjFr8uBs+7S6Ly8fdfHTjmYyI7vokL1G1XVjV8cKSXpOtWFxn4kfVFBAce+9mY
         OVxpMQjAuETZoUZSa9H9/0t8gF5+1hAFSoAY1HlY5XgjQgx2j8g6Vjh+PNvMN+bOn7wN
         xz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJgmgp+rAG9yo6xgDF6A6HsX/YJQRAULhH1j2GR7SRM=;
        b=RbUDNaSOqMEIe4wOAvVzbuxXRxASDJi1ubx46jfB4Sx9SQTJp4Rr9HYJ5wXR/BfUsQ
         zuxiFYRxpWRC6+xT1EzKyeN5Mf3aPqSiMfrbZyQd17BoSN0lZIZBl7WIrL+upmh/PEpy
         6+FJSBMlFQ2E1k236h66CyiE+MxB/KHKoxMAKigNwJlWEak+s1L1VZXZjDWjXuMlmm5V
         1766sI4pKTTZWZp4trjktz8Snkz5dzXkVX5HZcNkyxjf1rwQ+VCT+FRT05rvONyi0TRV
         ZwCRDin8zkWT2dcJSxPb3ujjC72+6TeOCNA+bMcIRQPOL1z8lF4fD80kPCP+wfhXamEr
         htlw==
X-Gm-Message-State: AGi0PuZFjMYGX28OZ29l4OS5Hm+J8zIUOAKp6FbebUzEJ4FtwbZMBaHm
        k3HOdIIQNMqvnH+nw2J2t+7E3g==
X-Google-Smtp-Source: APiQypKQLqTmC2XNYMJYtH04QLcBuxoFt5pyarA2fbzxE3VIK6BdwN7UEXA2mMb4WdCAWnBPWyiZmQ==
X-Received: by 2002:a62:6dc3:: with SMTP id i186mr22501928pfc.273.1589331333749;
        Tue, 12 May 2020 17:55:33 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] hwspinlock: qcom: Allow mmio usage in addition to syscon
Date:   Tue, 12 May 2020 17:54:40 -0700
Message-Id: <20200513005441.1102586-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In all modern Qualcomm platforms the mutex region of the TCSR is forked
off into its own block, all with a offset of 0 and stride of 4096. So
add support for directly memory mapping this register space, to avoid
the need to represent this block using a syscon.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 72 +++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index f0da544b14d2..d8d4d729816c 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -70,41 +70,81 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
 
-static int qcom_hwspinlock_probe(struct platform_device *pdev)
+static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
+						   u32 *base, u32 *stride)
 {
-	struct hwspinlock_device *bank;
 	struct device_node *syscon;
-	struct reg_field field;
 	struct regmap *regmap;
-	size_t array_size;
-	u32 stride;
-	u32 base;
 	int ret;
-	int i;
 
 	syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
-	if (!syscon) {
-		dev_err(&pdev->dev, "no syscon property\n");
-		return -ENODEV;
-	}
+	if (!syscon)
+		return ERR_PTR(-ENODEV);
 
 	regmap = syscon_node_to_regmap(syscon);
 	of_node_put(syscon);
 	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+		return regmap;
 
-	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
+	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "no offset in syscon\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
-	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
+	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "no stride syscon\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
+	return regmap;
+}
+
+static const struct regmap_config tcsr_mutex_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x40000,
+	.fast_io		= true,
+};
+
+static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
+						 u32 *offset, u32 *stride)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+
+	/* All modern platform has offset 0 and stride of 4k */
+	*offset = 0;
+	*stride = 0x1000;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	return devm_regmap_init_mmio(dev, base, &tcsr_mutex_config);
+}
+
+static int qcom_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct hwspinlock_device *bank;
+	struct reg_field field;
+	struct regmap *regmap;
+	size_t array_size;
+	u32 stride;
+	u32 base;
+	int i;
+
+	regmap = qcom_hwspinlock_probe_syscon(pdev, &base, &stride);
+	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
+		regmap = qcom_hwspinlock_probe_mmio(pdev, &base, &stride);
+
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
 	array_size = QCOM_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
 	bank = devm_kzalloc(&pdev->dev, sizeof(*bank) + array_size, GFP_KERNEL);
 	if (!bank)
-- 
2.26.2

