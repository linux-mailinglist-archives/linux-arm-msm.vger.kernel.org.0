Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604CE705995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 23:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjEPVdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 17:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjEPVdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 17:33:36 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2548695
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:31 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ae4f28454bso1127245ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684272811; x=1686864811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isCRYKDQmcH19jmnOQqaS/mWmP7wBBVhIJQm9nlZAdo=;
        b=WHSNVYfBxkic09NwIms4G7M6tAacaPF3nKjEqG11dBeOSr9BkPCzZniUJG08whokn5
         hzXM4tIBMfcwd2teW2ccFvu0ItY9VJ+5NA++Gq3RbLNnK3ss0JtMdM6HTyfLkSV2rae5
         2iYC9yvb0k6la6g28MfZZxXKu6Pg3pcFLFqRz6tL9lao3GeH1DpTbQODi7+4EiaMVS+3
         KiG1zPk4w9SsMLiqWlLwS47DVOEf8XGfUkvfw8QoORt/GgoZivVLi4r0o7XQBl/f3hSi
         UcrVdsM0WKKlrdNKVo8jCJpjIOkDQWz0N0fxDsLxnKvxaAkP+YhOl7hlL5Y9LCWXNZP9
         Kqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684272811; x=1686864811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isCRYKDQmcH19jmnOQqaS/mWmP7wBBVhIJQm9nlZAdo=;
        b=WUBYNUTbzjIvn1sca+5Mh0O46XK9aSXAv4QFLUsXZX8TwHh/Pxy1OPqiUJaLYtksok
         /lABspbNt3uf2HdlwdvmdPBPyS4WKfG/OlKOF3nUpHol4t9Ba2c7i4fOgf9jTaAHKDgO
         i3wG8j6blbKUOkfzPaWWtQ20oC0XSy8064/mJSHXxSMOvYD6nOtdAw2afMEJQBFWEpK8
         U5MtpJn9YxzIkGXVs1JjpBNCjEH4ShG6fJD+2GH27Yao8XTHkW+oRIGYX19DNXYkEK66
         ZaubC0UrRPUfOr1Dn+hyOvlaCMJsJdAMxzM9qFdQy2xzVCdxrHt1Ve3xOfYu2EpsX+NX
         /rrA==
X-Gm-Message-State: AC+VfDypnND7F4zGP1Ssfoi0GgJpLy0WRLMEWO8y3mUiap8S9X3TzhI4
        6qdndy0/BomGXpZL32Wz8Hz9Pb1LbRRo1+sMAsY=
X-Google-Smtp-Source: ACHHUZ7UlQmEYIj0c6ApLxqq1cgxE7sVcbJNGG+lWQ24CmKWhSYuR5rsadr0y/UU8rZVCD/5rpLZmg==
X-Received: by 2002:a17:903:32c5:b0:1aa:e5cd:647a with SMTP id i5-20020a17090332c500b001aae5cd647amr53686778plr.23.1684272810674;
        Tue, 16 May 2023 14:33:30 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001ac7af57fd4sm16027676plb.86.2023.05.16.14.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:33:30 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v5 3/5] usb: misc: eud: Add driver support for SM6115 / SM4250
Date:   Wed, 17 May 2023 03:03:06 +0530
Message-Id: <20230516213308.2432018-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
References: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
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
 drivers/usb/misc/Kconfig    |  1 +
 drivers/usb/misc/qcom_eud.c | 69 +++++++++++++++++++++++++++++++++----
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 99b15b77dfd5..fe1b5fec1dfc 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
 config USB_QCOM_EUD
 	tristate "QCOM Embedded USB Debugger(EUD) Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
+	select QCOM_SCM
 	select USB_ROLE_SWITCH
 	help
 	  This module enables support for Qualcomm Technologies, Inc.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b7f13df00764..10d194604d4c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -5,12 +5,14 @@
 
 #include <linux/bitops.h>
 #include <linux/err.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -22,23 +24,33 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
-#define EUD_REG_EUD_EN2        0x0000
+#define EUD_REG_EUD_EN2		0x0000
 
 #define EUD_ENABLE		BIT(0)
-#define EUD_INT_PET_EUD	BIT(0)
+#define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
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

