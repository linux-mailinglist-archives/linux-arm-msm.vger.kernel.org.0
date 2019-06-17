Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A50C4830D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 14:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfFQMvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 08:51:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41006 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfFQMvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 08:51:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so9814593wrm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZYares2Zb0CMG5aj1Aq17AxyznnInv9luLnQDrDhVlk=;
        b=r5dCfxbvH3U5b5C4s33cPxDL1vD/tiW6V96ulvZngp0n/hqT3oktaEclOpyvDC+R58
         SUfga9aWqbblZtMjr1jj22q46oZc0+qKFJJy1aIwr4ioiZXw8JKRWjnzTglMlhSmvRNj
         FVCMZY11tsUacCETtgDReiUPN8Om7954wN6SXEkjDtExGnUmuVdTekdpD4US9VRnT5QK
         i9DLIIfQpyKMQ7VZs5zCI/sBlpMqVBcEZB+9OtVbGIefAMiOnHCEX5mS3c7uu2R1dWb5
         ggotZKzJpFMA5Mmyzcjj0yPYPWAlMpFx7OZ+P1ZMGP9dwu1u4tj4YPT/IVry3dFV/Yv8
         YuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZYares2Zb0CMG5aj1Aq17AxyznnInv9luLnQDrDhVlk=;
        b=byU8LmqenZCjcLAm0fAQQD6iJxedr8erLu74am2jeqZ5DfzWohwRlft3+2UnwaaTFP
         Eq23PuRYjCsfG+bU+L+VE7K0xV4lw7eeeHUYPU8LyvCS23fdocHBeEh+eUMCqsQOLEIi
         4NEGVJOqEuuO9Ri9yERThYnYq99mw16kJz3U6KPXix0ouFSLbWK62lp7PrT2HptZPLWw
         5gt7NoMcPAjDUwznNibkQO9NichGovDnBaOTW+L2EGyRl3cTaG/95/ILP1iakLCmGTIk
         iAGHWX3CZUKAooQSrVauKWveUw9uhPn69ZK2FN0BkKRi48IvEdiZN/+2Efoxv1zKooms
         8o8w==
X-Gm-Message-State: APjAAAX0gup/zCO0TpWjAbv2d9PNuxkqFwsTXaGUi7S2CypBqeDKPdFN
        AjgFwsjDDe73aeuB61FiGFyKYA==
X-Google-Smtp-Source: APXvYqw4tU4zKvNxRkTtQHBbmrMwW6oDHDoXraOjSJrJg7Vgc+uuvKDECbAHi2x2yB80DzNCJv6ODQ==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr24077969wrv.207.1560775870686;
        Mon, 17 Jun 2019 05:51:10 -0700 (PDT)
Received: from dell.watershed.co.uk ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o11sm10477852wmh.37.2019.06.17.05.51.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:51:10 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 2/4] usb: dwc3: qcom: Add support for booting with ACPI
Date:   Mon, 17 Jun 2019 13:51:03 +0100
Message-Id: <20190617125105.6186-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125105.6186-1-lee.jones@linaro.org>
References: <20190617125105.6186-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In Linux, the DWC3 core exists as its own independent platform device.
Thus when describing relationships in Device Tree, the current default
boot configuration table option, the DWC3 core often resides as a child
of the platform specific node.  Both of which are given their own
address space descriptions and the drivers can be mostly agnostic to
each other.

However, other Operating Systems have taken a more monolithic approach,
which is evident in the configuration ACPI tables for the Qualcomm
Snapdragon SDM850, where all DWC3 (core and platform) components are
described under a single IO memory region.

To ensure successful booting using the supplied ACPI tables, we need to
devise a way to chop up the address regions provided and subsequently
register the DWC3 core with the resultant information, which is
precisely what this patch aims to achieve.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/Kconfig     |   2 +-
 drivers/usb/dwc3/dwc3-qcom.c | 206 ++++++++++++++++++++++++++++++-----
 2 files changed, 179 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 4a62045cc812..89abc6078703 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -128,7 +128,7 @@ config USB_DWC3_QCOM
 	tristate "Qualcomm Platform"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on EXTCON || !EXTCON
-	depends on OF
+	depends on (OF || ACPI)
 	default USB_DWC3
 	help
 	  Some Qualcomm SoCs use DesignWare Core IP for USB2/3
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 184df4daa590..0cb63f6c92d9 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -4,6 +4,7 @@
  * Inspired by dwc3-of-simple.c
  */
 
+#include <linux/acpi.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clk.h>
@@ -38,6 +39,20 @@
 #define PWR_EVNT_LPM_IN_L2_MASK			BIT(4)
 #define PWR_EVNT_LPM_OUT_L2_MASK		BIT(5)
 
+#define SDM845_QSCRATCH_BASE_OFFSET		0xf8800
+#define SDM845_QSCRATCH_SIZE			0x400
+#define SDM845_DWC3_CORE_SIZE			0xcd00
+
+struct dwc3_acpi_pdata {
+	u32			qscratch_base_offset;
+	u32			qscratch_base_size;
+	u32			dwc3_core_base_size;
+	int			hs_phy_irq_index;
+	int			dp_hs_phy_irq_index;
+	int			dm_hs_phy_irq_index;
+	int			ss_phy_irq_index;
+};
+
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
@@ -56,6 +71,8 @@ struct dwc3_qcom {
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
 
+	const struct dwc3_acpi_pdata *acpi_pdata;
+
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
@@ -300,12 +317,27 @@ static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
 			  PIPE_UTMI_CLK_DIS);
 }
 
+static int dwc3_qcom_get_irq(struct platform_device *pdev,
+			     const char *name, int num)
+{
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+
+	if (np)
+		ret = platform_get_irq_byname(pdev, name);
+	else
+		ret = platform_get_irq(pdev, num);
+
+	return ret;
+}
+
 static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	const struct dwc3_acpi_pdata *pdata = qcom->acpi_pdata;
 	int irq, ret;
-
-	irq = platform_get_irq_byname(pdev, "hs_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "hs_phy_irq",
+				pdata ? pdata->hs_phy_irq_index : -1);
 	if (irq > 0) {
 		/* Keep wakeup interrupts disabled until suspend */
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
@@ -320,7 +352,8 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		qcom->hs_phy_irq = irq;
 	}
 
-	irq = platform_get_irq_byname(pdev, "dp_hs_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "dp_hs_phy_irq",
+				pdata ? pdata->dp_hs_phy_irq_index : -1);
 	if (irq > 0) {
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
@@ -334,7 +367,8 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		qcom->dp_hs_phy_irq = irq;
 	}
 
-	irq = platform_get_irq_byname(pdev, "dm_hs_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "dm_hs_phy_irq",
+				pdata ? pdata->dm_hs_phy_irq_index : -1);
 	if (irq > 0) {
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
@@ -348,7 +382,8 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 		qcom->dm_hs_phy_irq = irq;
 	}
 
-	irq = platform_get_irq_byname(pdev, "ss_phy_irq");
+	irq = dwc3_qcom_get_irq(pdev, "ss_phy_irq",
+				pdata ? pdata->ss_phy_irq_index : -1);
 	if (irq > 0) {
 		irq_set_status_flags(irq, IRQ_NOAUTOEN);
 		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
@@ -371,11 +406,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	struct device_node	*np = dev->of_node;
 	int			i;
 
-	qcom->num_clocks = count;
-
-	if (!count)
+	if (!np || !count)
 		return 0;
 
+	qcom->num_clocks = count;
+
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
 				  sizeof(struct clk *), GFP_KERNEL);
 	if (!qcom->clks)
@@ -409,12 +444,103 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_probe(struct platform_device *pdev)
+static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
+	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
+	struct device		*dev = &pdev->dev;
+	struct resource		*res, *child_res = NULL;
+	int			irq;
+	int			ret;
+
+	qcom->dwc3 = platform_device_alloc("dwc3", PLATFORM_DEVID_AUTO);
+	if (!qcom->dwc3)
+		return -ENOMEM;
+
+	qcom->dwc3->dev.parent = dev;
+	qcom->dwc3->dev.type = dev->type;
+	qcom->dwc3->dev.dma_mask = dev->dma_mask;
+	qcom->dwc3->dev.dma_parms = dev->dma_parms;
+	qcom->dwc3->dev.coherent_dma_mask = dev->coherent_dma_mask;
+
+	child_res = kcalloc(2, sizeof(*child_res), GFP_KERNEL);
+	if (!child_res)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get memory resource\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	child_res[0].flags = res->flags;
+	child_res[0].start = res->start;
+	child_res[0].end = child_res[0].start +
+		qcom->acpi_pdata->dwc3_core_base_size;
+
+	irq = platform_get_irq(pdev, 0);
+	child_res[1].flags = IORESOURCE_IRQ;
+	child_res[1].start = child_res[1].end = irq;
+
+	ret = platform_device_add_resources(qcom->dwc3, child_res, 2);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add resources\n");
+		goto out;
+	}
+
+	ret = platform_device_add(qcom->dwc3);
+	if (ret)
+		dev_err(&pdev->dev, "failed to add device\n");
+
+out:
+	kfree(child_res);
+	return ret;
+}
+
+static int dwc3_qcom_of_register_core(struct platform_device *pdev)
+{
+	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
+	int			ret;
+
+	dwc3_np = of_get_child_by_name(np, "dwc3");
+	if (!dwc3_np) {
+		dev_err(dev, "failed to find dwc3 core child\n");
+		return -ENODEV;
+	}
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
+		return ret;
+	}
+
+	qcom->dwc3 = of_find_device_by_node(dwc3_np);
+	if (!qcom->dwc3) {
+		dev_err(dev, "failed to get dwc3 platform device\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
+	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
+	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
+	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
+	.hs_phy_irq_index = 1,
+	.dp_hs_phy_irq_index = 4,
+	.dm_hs_phy_irq_index = 3,
+	.ss_phy_irq_index = 2
+};
+
+static int dwc3_qcom_probe(struct platform_device *pdev)
+{
+	struct device_node	*np = pdev->dev.of_node;
+	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
-	struct resource		*res;
+	struct resource		*res, *parent_res = NULL;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 
@@ -425,6 +551,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
+	if (has_acpi_companion(dev)) {
+		qcom->acpi_pdata = acpi_device_get_match_data(dev);
+		if (!qcom->acpi_pdata) {
+			dev_err(&pdev->dev, "no supporting ACPI device data\n");
+			return -EINVAL;
+		}
+	}
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		ret = PTR_ERR(qcom->resets);
@@ -454,7 +588,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	qcom->qscratch_base = devm_ioremap_resource(dev, res);
+
+	if (np) {
+		parent_res = res;
+	} else {
+		parent_res = kmemdup(res, sizeof(struct resource), GFP_KERNEL);
+		if (!parent_res)
+			return -ENOMEM;
+
+		parent_res->start = res->start +
+			qcom->acpi_pdata->qscratch_base_offset;
+		parent_res->end = parent_res->start +
+			qcom->acpi_pdata->qscratch_base_size;
+	}
+
+	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
 	if (IS_ERR(qcom->qscratch_base)) {
 		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
 		ret = PTR_ERR(qcom->qscratch_base);
@@ -462,13 +610,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	ret = dwc3_qcom_setup_irq(pdev);
-	if (ret)
-		goto clk_disable;
-
-	dwc3_np = of_get_child_by_name(np, "dwc3");
-	if (!dwc3_np) {
-		dev_err(dev, "failed to find dwc3 core child\n");
-		ret = -ENODEV;
+	if (ret) {
+		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
 		goto clk_disable;
 	}
 
@@ -481,16 +624,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-		goto clk_disable;
-	}
+	if (np)
+		ret = dwc3_qcom_of_register_core(pdev);
+	else
+		ret = dwc3_qcom_acpi_register_core(pdev);
 
-	qcom->dwc3 = of_find_device_by_node(dwc3_np);
-	if (!qcom->dwc3) {
-		dev_err(&pdev->dev, "failed to get dwc3 platform device\n");
-		ret = -ENODEV;
+	if (ret) {
+		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
 		goto depopulate;
 	}
 
@@ -514,7 +654,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	return 0;
 
 depopulate:
-	of_platform_depopulate(&pdev->dev);
+	if (np)
+		of_platform_depopulate(&pdev->dev);
+	else
+		platform_device_put(pdev);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -601,6 +744,12 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
 
+static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
+	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
+
 static struct platform_driver dwc3_qcom_driver = {
 	.probe		= dwc3_qcom_probe,
 	.remove		= dwc3_qcom_remove,
@@ -608,6 +757,7 @@ static struct platform_driver dwc3_qcom_driver = {
 		.name	= "dwc3-qcom",
 		.pm	= &dwc3_qcom_dev_pm_ops,
 		.of_match_table	= dwc3_qcom_of_match,
+		.acpi_match_table = ACPI_PTR(dwc3_qcom_acpi_match),
 	},
 };
 
-- 
2.17.1

