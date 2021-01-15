Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711E72F7133
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732699AbhAODwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732694AbhAODv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:51:59 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D7DC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:51:19 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id g15so133233pjd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pZZN8TlQoGEImBuRWQqjCZec0W9XcKh0pXC6ZS+4Fj0=;
        b=d7D+FYLmgZVP1slUW/1HLxzB3xYA6stErTw4SUV4fIP4qWjqBmGcF0q41ZB69v6wyg
         OZE8o/Lbjlt5pMJHYlTI4YBbcI/igOIAeuXdNGiWHuIGMGMTRSKQZ8ltAX4mgsCWxe4v
         EplS6SP/YQHZy0ST0HnNG6/dboB9/OrgdisVfMKfnIziUuB99zDwjBAWQShN2dUQIUi7
         Nc648Lv8q3nKu1+Vrlu1y0ntgKwhO9zMp1R/p6CHDGLjdXU9pKab5t85WoO7NlUvuQ9z
         5TEqdZK/XDx3zfusHrcVS5C0Kfcx1BDZg6l7TlsoIqHcWurCqDLF8X5t2Eyg5AEVEJs+
         tf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pZZN8TlQoGEImBuRWQqjCZec0W9XcKh0pXC6ZS+4Fj0=;
        b=hL2OHjjEwQipkyn4JxzgnyVvi4ACl/ehoNl6br8ljMHl3tTvtOQCeowXw+Rp1802m+
         zMUl51zS6u8etA754z0ehVIextwaYznzR/4Zx2ZMGCN6FlMFjbTQF3/tw9QAICkr1smP
         89nIuAj5qQkmavz3DvaCswCJGKitPAw4IJnhDUka6anBJKXVn9GEv5UGAZusBbFlKIFz
         oOgZwCKev8dSEWDnayR6M5GapdFpdT1qa1rDlsN0t2kd+6m8nK99BqwwdVV8RnH1wsar
         sMtE+8BClzD7lTLSbN+qA/i2KYnvzVN25QX1/kSeuUI6g/HZ0I7Ya3T8faFKoOOFESY+
         x+fA==
X-Gm-Message-State: AOAM532RD3D4IZLfaBwVYwAE7UbBSF9oWuI5+GdEyA99FcISheyhiSIk
        nuKEdvpajO7la+XMvR7Vl3mAyA==
X-Google-Smtp-Source: ABdhPJyIzcfdD7GcU4aStnRMuqHLfoUCezc+v5cDOcNN6x0aCMY5f5iNUx5VdS8RzN9nbt4gBk9ymA==
X-Received: by 2002:a17:902:7881:b029:de:2fb:99e with SMTP id q1-20020a1709027881b02900de02fb099emr10692954pll.53.1610682679026;
        Thu, 14 Jan 2021 19:51:19 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p16sm6510314pju.47.2021.01.14.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:51:18 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] usb: dwc3: qcom: add URS Host support for sdm845 ACPI boot
Date:   Fri, 15 Jan 2021 11:50:57 +0800
Message-Id: <20210115035057.10994-1-shawn.guo@linaro.org>
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
Changes for v2:
- Instead of assuming that USB0 is always the first child of URS0, find
  the child using node name.

 drivers/usb/dwc3/dwc3-qcom.c | 59 ++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c703d552bbcf..d803ee98c628 100644
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
 
@@ -651,6 +657,33 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	return 0;
 }
 
+static struct platform_device *
+dwc3_qcom_create_urs_usb_platdev(struct device *dev)
+{
+	struct fwnode_handle *fwh;
+	struct acpi_device *adev;
+	char name[8];
+	int ret;
+	int id;
+
+	/* Figure out device id */
+	ret = sscanf(fwnode_get_name(dev->fwnode), "URS%d", &id);
+	if (!ret)
+		return NULL;
+
+	/* Find the child using name */
+	snprintf(name, sizeof(name), "USB%d", id);
+	fwh = fwnode_get_named_child_node(dev->fwnode, name);
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
@@ -715,6 +748,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
@@ -877,8 +918,20 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
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

