Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429F67073F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 23:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjEQVTX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 17:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjEQVTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 17:19:11 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9208D2CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:18:51 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso943725b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358307; x=1686950307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szw6rk2+gFj7vYEVvOOd5Ny6+rbVHSROGpb0XG2hv4I=;
        b=ziTQjl4Ke58Ocul1+yc7jlQWYDxi8GCKsUOF5CM7rsXnZlf7Vqi3X3UFqs2Ocnpwoc
         h1qIOm2fC1vt/1jdQmBG/udg229cKT+X4qC5XxHNVaFJDlVA4Dm2cjdwrGnaABdvL4Ow
         m6qRHpwkMaCkpaF8fpQQ8mhy+VdKlrhuisp/lz3hDdZe5wWc8JBJ5qmNTEBw4wXGx5mc
         PMD1vj9vqTlWxOv8TM++QOEEnuPXMXYYfQ2n+UCxHnyak/KLmyEDb8YheKmDE5aa0q6b
         zEnFHMdwTHqCAJj4tKgSfJjwvuoK/9E0xb3nQmYpYz7GVxt/y1laZZM28X0VPgoFQdIA
         z02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358307; x=1686950307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szw6rk2+gFj7vYEVvOOd5Ny6+rbVHSROGpb0XG2hv4I=;
        b=FcAZAxgcSg9nhoUpTInJ950RQYctJKRjnYRX7nnqHiI5eGwjc53qOdnxPxCpxcR7sQ
         i34L3MeQHBYL3snnmawmjrvz5DCneUqvypeJXTnfrVecIagd3/gCP5pE8bFzaAhT4TGM
         Ej7UE9qdUGcgXcOkdC847IaSTp7qxNsO2/IEuFQd63IwDjNl+EaDBG8MTeaT/hPUtbxF
         AtCo954yCMm+967zO+NfrB4OevgNXMxVCgXD3mNL1dSjeQpyuErGevaoR+5TVSByFYJw
         zCnQIXO5yPXOd/PKfa1CyMg3nEPDIs8Avx1C4gJf85BUSdx5Xid6mgToWB+4QINi3Eql
         3IXQ==
X-Gm-Message-State: AC+VfDzHfkH4AHSn6sdVBl8+37goMZIxc7BWxPjrB3YwkaBGSi736J9o
        COxjZSG0xegLrw+L/fivWmSZAlHUYB1OtKlBzE8=
X-Google-Smtp-Source: ACHHUZ4ePWH0/Lpm50DEaZ9lKpOySB0LAG8tYtTvdVKqBbhQ+c1wyRVts8XRsXqI4Erp8E9+s3jIMg==
X-Received: by 2002:a05:6a00:1749:b0:64a:c673:d064 with SMTP id j9-20020a056a00174900b0064ac673d064mr1487529pfc.17.1684358307040;
        Wed, 17 May 2023 14:18:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79052000000b0064cb6206463sm4359210pfo.85.2023.05.17.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:18:26 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org
Subject: [PATCH v6 4/6] usb: misc: eud: Add driver support for SM6115 / SM4250
Date:   Thu, 18 May 2023 02:47:54 +0530
Message-Id: <20230517211756.2483552-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
References: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM6115 / SM4250 SoC EUD support in qcom_eud driver.

On some SoCs (like the SM6115 / SM4250 SoC), the mode manager
needs to be accessed only via the secure world (through 'scm'
calls).

Also, the enable bit inside 'tcsr_check_reg' needs to be set
first to set the eud in 'enable' mode on these SoCs.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/usb/misc/Kconfig    |  2 +-
 drivers/usb/misc/qcom_eud.c | 65 ++++++++++++++++++++++++++++++++++---
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 99b15b77dfd5..51eb5140caa1 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -146,7 +146,7 @@ config USB_APPLEDISPLAY
 
 config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
-	depends on ARCH_QCOM || COMPILE_TEST
+	depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
 	select USB_ROLE_SWITCH
 	help
 	  This module enables support for Qualcomm Technologies, Inc.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 74f2aeaccdcb..6face21b7fb7 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,9 +11,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/usb/role.h>
 
 #define EUD_REG_INT1_EN_MASK	0x0024
@@ -30,15 +32,25 @@
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
 
+#define EUD_EN2_EN		BIT(0)
+#define EUD_EN2_DISABLE		(0)
+#define TCSR_CHECK_EN		BIT(0)
+
+struct eud_soc_cfg {
+	u32 tcsr_check_offset;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
+	const struct eud_soc_cfg	*eud_cfg;
 	void __iomem			*base;
 	void __iomem			*mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	phys_addr_t			secure_mode_mgr;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -46,7 +58,11 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
-	writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
+
+	if (priv->secure_mode_mgr)
+		qcom_scm_io_writel(priv->secure_mode_mgr + EUD_REG_EUD_EN2, EUD_EN2_EN);
+	else
+		writel(EUD_EN2_EN, priv->mode_mgr + EUD_REG_EUD_EN2);
 
 	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
 }
@@ -54,7 +70,11 @@ static int enable_eud(struct eud_chip *priv)
 static void disable_eud(struct eud_chip *priv)
 {
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
-	writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
+
+	if (priv->secure_mode_mgr)
+		qcom_scm_io_writel(priv->secure_mode_mgr + EUD_REG_EUD_EN2, EUD_EN2_DISABLE);
+	else
+		writel(EUD_EN2_DISABLE, priv->mode_mgr + EUD_REG_EUD_EN2);
 }
 
 static ssize_t enable_show(struct device *dev,
@@ -178,6 +198,8 @@ static void eud_role_switch_release(void *data)
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
+	struct resource *res;
+	phys_addr_t tcsr_check;
 	int ret;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
@@ -200,9 +222,37 @@ static int eud_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(chip->mode_mgr))
-		return PTR_ERR(chip->mode_mgr);
+	/*
+	 * EUD block on a few Qualcomm SoCs needs secure register access.
+	 * Check for the same.
+	 */
+	if (of_device_is_compatible(chip->dev->of_node, "qcom,sm6115-eud")) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		if (!res)
+			return dev_err_probe(chip->dev, -ENODEV,
+					     "failed to get secure_mode_mgr reg base\n");
+
+		chip->secure_mode_mgr = res->start;
+	} else {
+		chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(chip->mode_mgr))
+			return PTR_ERR(chip->mode_mgr);
+	}
+
+	/* Check for any SoC specific config data */
+	chip->eud_cfg = of_device_get_match_data(&pdev->dev);
+	if (chip->eud_cfg) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tcsr-base");
+		if (!res)
+			return dev_err_probe(chip->dev, -ENODEV,
+					     "failed to get tcsr reg base\n");
+
+		tcsr_check = res->start + chip->eud_cfg->tcsr_check_offset;
+
+		ret = qcom_scm_io_writel(tcsr_check, TCSR_CHECK_EN);
+		if (ret)
+			return dev_err_probe(chip->dev, ret, "failed to write tcsr check reg\n");
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	ret = devm_request_threaded_irq(&pdev->dev, chip->irq, handle_eud_irq,
@@ -230,8 +280,13 @@ static int eud_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct eud_soc_cfg sm6115_eud_cfg = {
+	.tcsr_check_offset = 0x25018,
+};
+
 static const struct of_device_id eud_dt_match[] = {
 	{ .compatible = "qcom,sc7280-eud" },
+	{ .compatible = "qcom,sm6115-eud", .data = &sm6115_eud_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, eud_dt_match);
-- 
2.38.1

