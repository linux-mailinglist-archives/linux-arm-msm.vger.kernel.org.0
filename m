Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7913D4B43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhGYDWB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhGYDV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:21:57 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D37C061760
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:02:26 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id x15so6837493oic.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdmG3WG+Fl0BSnXJiqQEACHTkoffgPGp8XBicBQYpOo=;
        b=bUyKH/yL3uKMbRoFBycdV+AfDTE8ss1Qs1/Iw/icuLQwu0o4EOMDP7GIRMNwKcr9kW
         TI689VHRtv20TGBCCfe8QuPkiTDNYfaDpm4xbygf5xNYpF4L01c/QeVtBXhDpqxFeuiz
         dgvdUIOW6fmhDCjZSPqduzmtRWmExefdakj4p3o0RbSUhQu+mGrk+nggXMFUOeb481cQ
         JFPJdoh+CivVAFlrOF70psrME2PALWFTsqKG9GxYCzIGecNlisqhJvwRv7bTnnxyPael
         w+GNjKNDJbfaDWklYcEOAZw5MxZSL1sGyQy8sZgkCeqLL2mU8A1UkbZJWmCzwHMyjVUP
         3a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdmG3WG+Fl0BSnXJiqQEACHTkoffgPGp8XBicBQYpOo=;
        b=do1prbco+p+GBYyNUvXYHHG0cyjyyB6/xnUI4wZE8xhXaXgolLHRMocJdPgdkTL3Zi
         bJpMl1N7AKIzwAgbfuKzXLJASIrHVZODuEThXRfFVGF9AkLXISO3FZfkLHxxWbr8OGMU
         Ef6lGQFtSssQh5PaUPOLIoQAgOCBlmP+Zt1dO/ZBW/vjupvxb1kGzLYwyy+dVqup+3Lx
         w7CZ8QG8fZz3o6ucmb+B4wUdIjjym7tAuy0w7chGRU/V+H0BLHeMRjYsUri+RTDio7l+
         709/CL7XaNeD4+ynhuYEmHQzCASnntMzQFYDADWtCtmqRGF8aDAYBDdQY0xi3xIwWBeA
         l4CA==
X-Gm-Message-State: AOAM530aixadOKjUL2cxVwCyL1MgjbfHEpTX3X5v+aBiAwFvet/mM5CM
        w4fEkSqfB/aRTSZ5i3gvpXd7BA==
X-Google-Smtp-Source: ABdhPJxiSm3YKhhzQd0mf+xM5ydNpnne/06tpn6+NFdCOwlVcrOLgOqNnXz8RgxQYmcA67KpD7pjOQ==
X-Received: by 2002:aca:4355:: with SMTP id q82mr13228367oia.165.1627185746154;
        Sat, 24 Jul 2021 21:02:26 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q20sm872910otv.50.2021.07.24.21.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:02:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] PCI: qcom: Introduce enable/disable resource ops
Date:   Sat, 24 Jul 2021 21:00:36 -0700
Message-Id: <20210725040038.3966348-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210725040038.3966348-1-bjorn.andersson@linaro.org>
References: <20210725040038.3966348-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current model of doing resource enablement and controller
initialization in a single "init" function invoked after
dw_pcie_host_init() is invoked might result in clocks not being enabled
at the time the "msi" interrupt fires.

One such case happens reliably on the SC8180x (8cx) Snapdragon laptops,
where it's seems like the bootloader touches PCIe and leaves things in a
state that the "msi" interrupt will fire before we have a change to
enable the clocks, resulting in an access of unclocked hardware.

Introduce a two new callbacks, allowing the individual resource handling
functions to be split between enable/init and deinit/disable.

Helper functions for enable, disable and deinit are introduced to handle
the fact that these functions may now be left without implementation.
init is given a wrapper for symmetry.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 42 +++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..8a64a126de2b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -181,9 +181,11 @@ struct qcom_pcie;
 
 struct qcom_pcie_ops {
 	int (*get_resources)(struct qcom_pcie *pcie);
+	int (*enable_resources)(struct qcom_pcie *pcie);
 	int (*init)(struct qcom_pcie *pcie);
 	int (*post_init)(struct qcom_pcie *pcie);
 	void (*deinit)(struct qcom_pcie *pcie);
+	void (*disable_resources)(struct qcom_pcie *pcie);
 	void (*post_deinit)(struct qcom_pcie *pcie);
 	void (*ltssm_enable)(struct qcom_pcie *pcie);
 	int (*config_sid)(struct qcom_pcie *pcie);
@@ -1345,6 +1347,31 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_enable_resources(struct qcom_pcie *pcie)
+{
+	if (pcie->ops->enable_resources)
+		return pcie->ops->enable_resources(pcie);
+
+	return 0;
+}
+
+static int qcom_pcie_init(struct qcom_pcie *pcie)
+{
+	return pcie->ops->init(pcie);
+}
+
+static void qcom_pcie_deinit(struct qcom_pcie *pcie)
+{
+	if (pcie->ops->deinit)
+		pcie->ops->deinit(pcie);
+}
+
+static void qcom_pcie_disable_resources(struct qcom_pcie *pcie)
+{
+	if (pcie->ops->disable_resources)
+		pcie->ops->disable_resources(pcie);
+}
+
 static int qcom_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1353,7 +1380,7 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 
 	qcom_ep_reset_assert(pcie);
 
-	ret = pcie->ops->init(pcie);
+	ret = qcom_pcie_init(pcie);
 	if (ret)
 		return ret;
 
@@ -1384,7 +1411,7 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 err_disable_phy:
 	phy_power_off(pcie->phy);
 err_deinit:
-	pcie->ops->deinit(pcie);
+	qcom_pcie_deinit(pcie);
 
 	return ret;
 }
@@ -1520,10 +1547,14 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	ret = qcom_pcie_enable_resources(pcie);
+	if (ret)
+		goto err_pm_runtime_put;
+
 	ret = phy_init(pcie->phy);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
-		goto err_pm_runtime_put;
+		goto err_disable_resources;
 	}
 
 	platform_set_drvdata(pdev, pcie);
@@ -1532,11 +1563,14 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "cannot initialize host\n");
 		pm_runtime_disable(&pdev->dev);
-		goto err_pm_runtime_put;
+		goto err_disable_resources;
 	}
 
 	return 0;
 
+err_disable_resources:
+	qcom_pcie_disable_resources(pcie);
+
 err_pm_runtime_put:
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
-- 
2.29.2

