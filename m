Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3751346FB18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 08:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbhLJHKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 02:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbhLJHKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 02:10:38 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCCCC0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 23:07:04 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id l18so2593098pgj.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 23:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/dQLnEh2Ps1sBa0Skws70D/cK3Q/WSmNsGUWpZrbG/A=;
        b=XQ6OibmOlk5JlVdQmWNPoO8Ju1Oy1svtjJOCaHrz8s1F/9xiGfRfJVJ+ELBDnIu3I5
         kWFn8a31Q1XG8njuiW23H/u5Trwz89hub2HHO9RSnSrybA2vmPuPd5m8Ni2VbNfN3wg3
         d0T/wg5qguqZd1XIM9KTGCSyekIGkxbUHNEsz3jlQ9sezR1yv5nux6b7i1ACAvsla4Z6
         TZFeWXl1pDDRk90mSwfXN4jkoDj7OuTP5NFsksPjECXYPeFPGG0Qn3ZE6ESxmgV1IRnV
         wjRmxLyUTXOGNchdlwGYLmmoneyXhajNlMGG4RduHSMkTHfEgdO1bl7zkhobkbt4cZa2
         7Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/dQLnEh2Ps1sBa0Skws70D/cK3Q/WSmNsGUWpZrbG/A=;
        b=NjZGZmIIedmqMAgx4bAV4S+qsj4OTwlbdICo4+mRsZdm5O+wAbxiRqwMgqGohN34yR
         uqbW2N/nLjCdA6AaTO5ikPvMu1XRdA4PrLOOaDLY/Sa28g6xWIiNfNJ8R2APuVvGWLdK
         1sMqpmrkmjRri8ZTRr+KQ/UgLuvUGBDAphYL/zXRrYMeiM/Jbm0udZ91gbPZT/bjZ0L6
         7xN/kUNjAKRUVQfgBYN9yIUfnUwnyJ1KKbOGVfOPF7SEMiEiI/QcgV4sxzUwl33npY1Y
         fBNnIOjzFR24FrtTZ7bnURehyGAZFfLJs+A0Fr3tiix0y+fRwsTOMHKwXUH9xrCDzOkc
         ubEw==
X-Gm-Message-State: AOAM532dCrmKXD1oJFb+t5O9HQILRJR9hJ/pXb9NPaYbX6DUUzI0UjVY
        IGR9RxXK6wE0CumDx6jq3evo
X-Google-Smtp-Source: ABdhPJx96kBOUOEL79P/rFK0J0v3F/7gqFaO9Jxv6fT0nwAfRoxhsTNLDFsercJ0LSOjJm6hPcSrYQ==
X-Received: by 2002:a65:558c:: with SMTP id j12mr30010773pgs.373.1639120023679;
        Thu, 09 Dec 2021 23:07:03 -0800 (PST)
Received: from localhost.localdomain ([202.21.42.75])
        by smtp.gmail.com with ESMTPSA id b10sm1823849pft.179.2021.12.09.23.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 23:07:03 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
        bhelgaas@google.com
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] PCI: qcom-ep: Move enable/disable resources code to common functions
Date:   Fri, 10 Dec 2021 12:36:56 +0530
Message-Id: <20211210070656.18988-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Remove code duplication by moving the code related to enabling/disabling
the resources (PHY, CLK, Reset) to common functions so that they can be
called from multiple places.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[mani: renamed the functions and reworded the commit message]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 86 ++++++++++++-----------
 1 file changed, 45 insertions(+), 41 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 05fa776615c0..f3f429e3192c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -222,11 +222,8 @@ static void qcom_pcie_dw_stop_link(struct dw_pcie *pci)
 	disable_irq(pcie_ep->perst_irq);
 }
 
-static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
+static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 {
-	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
-	struct device *dev = pci->dev;
-	u32 val, offset;
 	int ret;
 
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qcom_pcie_ep_clks),
@@ -246,6 +243,38 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	if (ret)
 		goto err_phy_exit;
 
+	return 0;
+
+err_phy_exit:
+	phy_exit(pcie_ep->phy);
+err_disable_clk:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(qcom_pcie_ep_clks),
+				   qcom_pcie_ep_clks);
+
+	return ret;
+}
+
+static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
+{
+	phy_power_off(pcie_ep->phy);
+	phy_exit(pcie_ep->phy);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(qcom_pcie_ep_clks),
+				   qcom_pcie_ep_clks);
+}
+
+static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
+{
+	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
+	struct device *dev = pci->dev;
+	u32 val, offset;
+	int ret;
+
+	ret = qcom_pcie_enable_resources(pcie_ep);
+	if (ret) {
+		dev_err(dev, "Failed to enable resources: %d\n", ret);
+		return ret;
+	}
+
 	/* Assert WAKE# to RC to indicate device is ready */
 	gpiod_set_value_cansleep(pcie_ep->wake, 1);
 	usleep_range(WAKE_DELAY_US, WAKE_DELAY_US + 500);
@@ -334,7 +363,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	ret = dw_pcie_ep_init_complete(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
-		goto err_phy_power_off;
+		goto err_disable_resources;
 	}
 
 	/*
@@ -354,13 +383,8 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 
 	return 0;
 
-err_phy_power_off:
-	phy_power_off(pcie_ep->phy);
-err_phy_exit:
-	phy_exit(pcie_ep->phy);
-err_disable_clk:
-	clk_bulk_disable_unprepare(ARRAY_SIZE(qcom_pcie_ep_clks),
-				   qcom_pcie_ep_clks);
+err_disable_resources:
+	qcom_pcie_disable_resources(pcie_ep);
 
 	return ret;
 }
@@ -375,10 +399,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 		return;
 	}
 
-	phy_power_off(pcie_ep->phy);
-	phy_exit(pcie_ep->phy);
-	clk_bulk_disable_unprepare(ARRAY_SIZE(qcom_pcie_ep_clks),
-				   qcom_pcie_ep_clks);
+	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
 }
 
@@ -646,43 +667,26 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qcom_pcie_ep_clks),
-				      qcom_pcie_ep_clks);
-	if (ret)
+	ret = qcom_pcie_enable_resources(pcie_ep);
+	if (ret) {
+		dev_err(dev, "Failed to enable resources: %d\n", ret);
 		return ret;
-
-	ret = qcom_pcie_ep_core_reset(pcie_ep);
-	if (ret)
-		goto err_disable_clk;
-
-	ret = phy_init(pcie_ep->phy);
-	if (ret)
-		goto err_disable_clk;
-
-	/* PHY needs to be powered on for dw_pcie_ep_init() */
-	ret = phy_power_on(pcie_ep->phy);
-	if (ret)
-		goto err_phy_exit;
+	}
 
 	ret = dw_pcie_ep_init(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to initialize endpoint: %d\n", ret);
-		goto err_phy_power_off;
+		goto err_disable_resources;
 	}
 
 	ret = qcom_pcie_ep_enable_irq_resources(pdev, pcie_ep);
 	if (ret)
-		goto err_phy_power_off;
+		goto err_disable_resources;
 
 	return 0;
 
-err_phy_power_off:
-	phy_power_off(pcie_ep->phy);
-err_phy_exit:
-	phy_exit(pcie_ep->phy);
-err_disable_clk:
-	clk_bulk_disable_unprepare(ARRAY_SIZE(qcom_pcie_ep_clks),
-				   qcom_pcie_ep_clks);
+err_disable_resources:
+	qcom_pcie_disable_resources(pcie_ep);
 
 	return ret;
 }
-- 
2.25.1

