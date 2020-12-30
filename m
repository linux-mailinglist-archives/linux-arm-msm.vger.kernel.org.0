Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6992E78AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 13:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgL3MuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 07:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgL3MuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 07:50:18 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716FCC06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:49:38 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id w5so11332338pgj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4QXq92NoxzM0UANAe9MUt462GjUbA9XMONuk/bFybLc=;
        b=cnVQVgC45+Tj3uiAF7C26Ozxd0h/X32CMKWZE7b9n50LfvRYvAoU0rOUIZwtaB72Qv
         MTkkzbNqYenXME4PkEXK9oYnoVPBZ22Z3yQVtdDc8TfLw2kmsSivFTgX4fKdth7l56b7
         DSuCOhnAwh9UYnmVcblEV0GhGMFIqardbKomWthV4DamA1eaio6L1VrbJTQYfMXazrWT
         00CbYY3pP9O8dvU1JLekLDC80Y0oKDORethpTlRQo8mKyeVpYfJgNqct8rafmoJzhEmb
         17zgXHESj3OJvSgZZrg7WIlKf0c3ohmv06rEdiswKdHEIyl6t5RQT4dUfrS5HEFLXvLJ
         l1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4QXq92NoxzM0UANAe9MUt462GjUbA9XMONuk/bFybLc=;
        b=NrggRgBhwVXE+JqguMjk86aRayPkOLlNzIGPbB/fX2szTiYRj3w5Np2trPUYTIYCca
         J0VUSlP3jKaE1AzvvaEFot/IxlGw24dy+exd5iLQZ32SG0MqsIqnlMNV9IiBc9U7aRkD
         md21ekDZdY1qEknNj6x8xR87oHQk3snVtb3lOIzCvGenw5lGz/y1eCgHZPTSDruVK/mj
         9ELuIrr1Z5OVSQ6j8AEBaEEu1Bn2KCc5iUgdOa9bOy9ag0ZtvN51SE79hVdD3CT8PC9B
         1k/RlIYCAXFiprjn+8OmBVNMqhii6l9y99w77AG56dgS3aQIJiZ9LMUNe3HTcbMaj0nV
         z2Dg==
X-Gm-Message-State: AOAM531KCdnbXJt6004Fx8pRF07e9CK262IiOIq8kN4idyjPFOh9wnQE
        rdmkb01+y4CVS4GaXaeyoGzpuA==
X-Google-Smtp-Source: ABdhPJy61iC8qyu9q2zvYZdgfUZqmdmTicB3HaaO8g61Vw3urgo/4UUC5WRuJUEM6eWdXkGfwCH2Dw==
X-Received: by 2002:a65:458d:: with SMTP id o13mr13919547pgq.450.1609332577967;
        Wed, 30 Dec 2020 04:49:37 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c18sm41265922pfj.200.2020.12.30.04.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 04:49:37 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot
Date:   Wed, 30 Dec 2020 20:49:25 +0800
Message-Id: <20201230124925.19260-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For sdm845 ACPI boot, the URS (USB Role Switch) node in ACPI DSDT table
holds the memory resource, while interrupt resources reside in the child
nodes USB0 and UFN0.  It adds USB0 host support by probing URS node,
creating platform device for USB0 node, and then retrieve interrupt
resources from USB0 platform device.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 50 +++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c703d552bbcf..5b70d34e75ab 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -60,12 +60,14 @@ struct dwc3_acpi_pdata {
 	int			dp_hs_phy_irq_index;
 	int			dm_hs_phy_irq_index;
 	int			ss_phy_irq_index;
+	bool			is_urs;
 };
 
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
 	struct platform_device	*dwc3;
+	struct platform_device	*urs_usb;
 	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
@@ -429,13 +431,15 @@ static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
 static int dwc3_qcom_get_irq(struct platform_device *pdev,
 			     const char *name, int num)
 {
+	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	struct platform_device *pdev_irq = qcom->urs_usb ? qcom->urs_usb : pdev;
 	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
 	if (np)
-		ret = platform_get_irq_byname(pdev, name);
+		ret = platform_get_irq_byname(pdev_irq, name);
 	else
-		ret = platform_get_irq(pdev, num);
+		ret = platform_get_irq(pdev_irq, num);
 
 	return ret;
 }
@@ -568,6 +572,8 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device		*dev = &pdev->dev;
 	struct resource		*res, *child_res = NULL;
+	struct platform_device	*pdev_irq = qcom->urs_usb ? qcom->urs_usb :
+							    pdev;
 	int			irq;
 	int			ret;
 
@@ -597,7 +603,7 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 	child_res[0].end = child_res[0].start +
 		qcom->acpi_pdata->dwc3_core_base_size;
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq(pdev_irq, 0);
 	child_res[1].flags = IORESOURCE_IRQ;
 	child_res[1].start = child_res[1].end = irq;
 
@@ -651,6 +657,24 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	return 0;
 }
 
+static struct platform_device *
+dwc3_qcom_create_urs_usb_platdev(struct device *dev)
+{
+	struct fwnode_handle *fwh;
+	struct acpi_device *adev;
+
+	/* Find the first child of URS node */
+	fwh = fwnode_call_ptr_op(dev->fwnode, get_next_child_node, NULL);
+	if (!fwh)
+		return NULL;
+
+	adev = to_acpi_device_node(fwh);
+	if (!adev)
+		return NULL;
+
+	return acpi_create_platform_device(adev, NULL);
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -715,6 +739,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->acpi_pdata->qscratch_base_offset;
 		parent_res->end = parent_res->start +
 			qcom->acpi_pdata->qscratch_base_size;
+
+		if (qcom->acpi_pdata->is_urs) {
+			qcom->urs_usb = dwc3_qcom_create_urs_usb_platdev(dev);
+			if (!qcom->urs_usb) {
+				dev_err(dev, "failed to create URS USB platdev\n");
+				return -ENODEV;
+			}
+		}
 	}
 
 	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
@@ -877,8 +909,20 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static const struct dwc3_acpi_pdata sdm845_acpi_urs_pdata = {
+	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
+	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
+	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
+	.hs_phy_irq_index = 1,
+	.dp_hs_phy_irq_index = 4,
+	.dm_hs_phy_irq_index = 3,
+	.ss_phy_irq_index = 2,
+	.is_urs = true,
+};
+
 static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
 	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
+	{ "QCOM0304", (unsigned long)&sdm845_acpi_urs_pdata },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
-- 
2.17.1

