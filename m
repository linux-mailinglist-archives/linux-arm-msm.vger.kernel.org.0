Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7DF77CB7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 13:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236553AbjHOLHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 07:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236747AbjHOLGy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 07:06:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94DF199E
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 04:06:35 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9e6cc93c6so80046931fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 04:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692097591; x=1692702391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QB9PMpIHxMSl15jEhQj2gUyUbqxC8jr5ruom3EkY7U=;
        b=uZ9Pyq7+10EJjDPyRf5UqN3TIkIWm3We9xpznQgvTiZKVHFezbTxkaYLE9RdXGeS4h
         kekfa+BbdjT83BQ9rZqKNj7Mg6ceouZx2aGeJPtfMBvsbU8m2Kaq43b6nTDdeb9uYBiy
         DwlcciUQPHv3h6pt2dUu7WZa5V6160P5vawx5gzqloB9zg155vY1hUo8Cn/CvhsJs22w
         NeGYb06D3FZc+qfrPRTRBMxEjrhFfFe+LP2Fv9Wkvfiq21nr1uyNirj4iEpRxE6epSYJ
         PuTeR8cO5XTnNeM2YCRnoa66nbT1xbmL6sGzLzJnkpq9vIqYSe4qr+aJEyYH7NLu8orG
         SB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692097591; x=1692702391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QB9PMpIHxMSl15jEhQj2gUyUbqxC8jr5ruom3EkY7U=;
        b=N8n3Xnn9aYwtI9q+ITBMQxrNYR5v9y5vOfAEBETYAprzOm0COwkI8lGDUQ9dgRjeuT
         2OE+e7OjwYqzFXZfeq1ttAQlTXdw7DGdNOPWF5lVS+JobJ7kaeFrUNoP29/obkjRQcVV
         oSrvhBX1U5dt6EWrqcg7/OmY4zTuKXs29UEZ+VT1j0vStbdlK960a5kjq39YtryWXSIf
         v9iIxEO+Fyuc/fM4I1HCdRGBxX0pqkzx+U+U8RFuJ+KVqGUsqdwHLak2Ny82t6bdTNXF
         iQyTOecOqah3EpI/gYqDEDaMzQ1PKpmoz9faCXP36eBYmtI5APFarejCaJPF7aXkslwW
         Cbrw==
X-Gm-Message-State: AOJu0YznGvGB/OWVoRj5wj8E5YaXWTQ/tWJD1agZs3rvi/2YumnxyoYK
        /dvDDc+4J9mxocSl7ZxIRH8K2zMAu8+UwqD6wRE=
X-Google-Smtp-Source: AGHT+IHFchTlULqciOQ9mFT5NakM1xgtrE/pnBhEiYjYqW2OdfYK6GfZqAb0ySIOgTvvuZ+tKjtkIw==
X-Received: by 2002:a2e:80d3:0:b0:2bb:8eea:755a with SMTP id r19-20020a2e80d3000000b002bb8eea755amr676100ljg.49.1692097591089;
        Tue, 15 Aug 2023 04:06:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id i23-20020a170906265700b00991bba473e2sm6852642ejc.85.2023.08.15.04.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 04:06:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: lpass-lpi: fix concurrent register updates
Date:   Tue, 15 Aug 2023 13:06:25 +0200
Message-Id: <20230815110625.317971-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm LPASS LPI pin controller driver uses one lock for guarding
Read-Modify-Write code for slew rate registers.  However the pin
configuration and muxing registers have exactly the same RMW code but
are not protected.

Pin controller framework does not provide locking here, thus it is
possible to trigger simultaneous change of pin configuration registers
resulting in non-atomic changes.

Protect from concurrent access by re-using the same lock used to cover
the slew rate register.  Using the same lock instead of adding second
one will make more sense, once we add support for newer Qualcomm SoC,
where slew rate is configured in the same register as pin
configuration/muxing.

Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index e5a418026ba3..0b2839d27fd6 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -32,7 +32,8 @@ struct lpi_pinctrl {
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
 	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
-	struct mutex slew_access_lock;
+	/* Protects from concurrent register updates */
+	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
 	const struct lpi_pinctrl_variant_data *data;
 };
@@ -103,6 +104,7 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	if (WARN_ON(i == g->nfuncs))
 		return -EINVAL;
 
+	mutex_lock(&pctrl->lock);
 	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
 
 	/*
@@ -128,6 +130,7 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
 	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+	mutex_unlock(&pctrl->lock);
 
 	return 0;
 }
@@ -233,14 +236,14 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			if (slew_offset == LPI_NO_SLEW)
 				break;
 
-			mutex_lock(&pctrl->slew_access_lock);
+			mutex_lock(&pctrl->lock);
 
 			sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
 			sval &= ~(LPI_SLEW_RATE_MASK << slew_offset);
 			sval |= arg << slew_offset;
 			iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
 
-			mutex_unlock(&pctrl->slew_access_lock);
+			mutex_unlock(&pctrl->lock);
 			break;
 		default:
 			return -EINVAL;
@@ -256,6 +259,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
 	}
 
+	mutex_lock(&pctrl->lock);
 	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
@@ -264,6 +268,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
 	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+	mutex_unlock(&pctrl->lock);
 
 	return 0;
 }
@@ -461,7 +466,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->chip.label = dev_name(dev);
 	pctrl->chip.can_sleep = false;
 
-	mutex_init(&pctrl->slew_access_lock);
+	mutex_init(&pctrl->lock);
 
 	pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
 	if (IS_ERR(pctrl->ctrl)) {
@@ -483,7 +488,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 
 err_pinctrl:
-	mutex_destroy(&pctrl->slew_access_lock);
+	mutex_destroy(&pctrl->lock);
 	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
@@ -495,7 +500,7 @@ int lpi_pinctrl_remove(struct platform_device *pdev)
 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
 	int i;
 
-	mutex_destroy(&pctrl->slew_access_lock);
+	mutex_destroy(&pctrl->lock);
 	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
-- 
2.34.1

