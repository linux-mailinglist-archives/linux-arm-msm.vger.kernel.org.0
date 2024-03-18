Return-Path: <linux-arm-msm+bounces-14334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C988487E380
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 07:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2081C20D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FEB2263A;
	Mon, 18 Mar 2024 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJEeM9NN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F922561B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 06:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710741908; cv=none; b=rzytkRbbJ5JopjsnNle1dvo7zJffjnfEdI9Q+qXpxmgITYEkix7GAVpwWgKSH3moGxnzX6o0s3VezkdpokYi/XwJtYE4VU2gKJdCt0qNWEMckvzdEfSN9gbcXuUlFlkJbWEVCcton93eSyNorYP1zn1WBHreV26AAsua9oRyFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710741908; c=relaxed/simple;
	bh=4ZnKA2x084i8aSzeb+7VZUZvD2DTTkxxYBoxaNu0hmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFY14BnT8SxHIvo7RvwNA/Yj3OJ9Rcl/6ydCqCVeGoJIBd4Adk6rvjyDq3Zq7muFqYqUbWXF27n0Muc9tfZkjlNHm04mQylA4pjRPtp29kS1JqTqFp4ycrn1Le2qa+Y32NMLGiHm7sxo9I5/CDaPF8Qzu337DsQCRYqTrUFHU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJEeM9NN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e7224cb3f2so416640b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Mar 2024 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710741905; x=1711346705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wxOBAUjX0dYGb91gU5vDpZ+Txgxi8ueraivd/YvJ1A=;
        b=qJEeM9NNSeIlOftVfOAZTp6fCoTKKbOH58WoCQjJ91OMtoAthQf7oHUsRFh3qTzoFO
         VRTf/vfl7kBnCsjVw62yrhzQIGYFvTECo+GcHW5s5dqXXZr05Wnqik4LQLn+iJTCYhbS
         sj8y33gsFtekzLWazFQ4rA+T4Yo529hfYklDL1wKTjX3+aVnBCE3d3oukyR2zK/4nwPE
         X1hTPmmL7XGZHsaC87dVHnkvos++Xwu2QoOl7owIsiYgBk4/egJm5R1eHCjXfQM0xELa
         W2Z9vhmrMZthJhVBaef2NKDaveMkQr71czzBS8kqFEwJvGlN1dytXl3JS3VYNyP5uSWc
         RNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710741905; x=1711346705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wxOBAUjX0dYGb91gU5vDpZ+Txgxi8ueraivd/YvJ1A=;
        b=xT1EQO1ZFzO4tbg0J7wIhbJ374+Xz4B9zF+PauawVPOLb20ou4FMj9gt3Dixk5ZrEL
         jlpkAhmZ3IvZkl0px8IzFujv+PGGUaC+y8vetHhbrcI2MGoR5FOUse+2JXPoz340D3P4
         HARBsvc79K6POKMQrWkell4/tzcO4lepCeUv0cqFEkLh9xEkLYM/7cDZyrQTApoeFbkU
         WpN3CmpyOr5AuU3ZJmTOf4vJDH8X03m0RF0qjI75rkbb5xI6XYWc2dYO+dqHasmGGMWZ
         D5qepXSFieEOEzD0Sj6FXKY5xTBYF2xL3ATXOdYzMx5SALUm80jCQaj3E0rWVZUb4T3c
         gzgA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrr3wIoQbT7s6+oF9MnjHWx4s/HtiWTn731/P4oCVvyYUWo0rASA34W8GVLqCSdCuMb0PIP2E7lmQLPma7Pysq3ZMLhtBl8xSxfrjfw==
X-Gm-Message-State: AOJu0YxYvuBFA0IULOELgoeNG/PTipvz2Eexttt8GL7QnzrXC9uztmoC
	YK5/vjc/PjNwjqzzusw5nW5mEz7hI4APVrh4e+xyMJtNPaZOSikw52r4dP3SsA==
X-Google-Smtp-Source: AGHT+IEk+dNn6DKOz8aTqM8GsHbvQ5yRDB1s9I9uVpqhax542fbEGmhm+NrhXEG5gyUpZKu196dyKw==
X-Received: by 2002:a05:6a20:7da2:b0:1a3:63f4:1047 with SMTP id v34-20020a056a207da200b001a363f41047mr3047327pzj.5.1710741905135;
        Sun, 17 Mar 2024 23:05:05 -0700 (PDT)
Received: from [127.0.1.1] ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id p12-20020a62ab0c000000b006e6c5b065f5sm7064268pff.28.2024.03.17.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 23:05:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 18 Mar 2024 11:34:28 +0530
Subject: [PATCH v5 4/5] PCI: qcom-ep: Add HDMA support for SA8775P SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-dw-hdma-v5-4-f04c5cdde760@linaro.org>
References: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
In-Reply-To: <20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2836;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=P0A1uqJu0LyM0UHwxugMbNA2eTzT8rsr5vWTX7qvQq0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl99l4Ng6ek4mjev97JRFDrOczX8UqZTBYVTT5k
 A1YD8/M8DuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZffZeAAKCRBVnxHm/pHO
 9XzIB/wOS95jgpZpeTPuWfeek+uQdKEimI1XKAhmyMSj4VQx/9WUNZkLxtoHMiqC2eCjk04rjwJ
 fHNMXGIOgoxQ8TxLSlibxB6LrWDmbirK8oLHxHjzTtKIlOYd1ipQRMNmofMSZzLxqOjU5r+yc68
 Kcn50PeYtWsF2L9OBxYvZERBT40wFC4QbMilZM6qSmt55kIKm+GLbfTrW0GLGWz87MW4fM1ndUk
 zWuaIZTqSHtnDc9+rdyfKslXK+Siv7tvvfbXLGzTnUMEYCT7bCyomzRuJ8exos+GZr1Uvxm0kJ+
 6uQfNMV+dKJEvWQdI1NOV73GE3DosUBiZ4DiJtir5j+g6hrm
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Mrinmay Sarkar <quic_msarkar@quicinc.com>

SA8775P SoC supports the new Hyper DMA (HDMA) DMA Engine inside the DWC IP.
Let's add support for it by passing the mapping format and the number of
read/write channels count.

The PCIe EP controller used on this SoC is of version 1.34.0, so a separate
config struct is introduced for the sake of enabling HDMA conditionally.

It should be noted that for the eDMA support (predecessor of HDMA), there
are no mapping format and channels count specified. That is because eDMA
supports auto detection of both parameters, whereas HDMA doesn't.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
[mani: Reworded commit message, added kdoc, and minor cleanups]
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 45008e054e31..89d06a3e6e06 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -149,6 +149,14 @@ enum qcom_pcie_ep_link_status {
 	QCOM_PCIE_EP_LINK_DOWN,
 };
 
+/**
+ * struct qcom_pcie_ep_cfg - Per SoC config struct
+ * @hdma_support: HDMA support on this SoC
+ */
+struct qcom_pcie_ep_cfg {
+	bool hdma_support;
+};
+
 /**
  * struct qcom_pcie_ep - Qualcomm PCIe Endpoint Controller
  * @pci: Designware PCIe controller struct
@@ -803,6 +811,7 @@ static const struct dw_pcie_ep_ops pci_ep_ops = {
 
 static int qcom_pcie_ep_probe(struct platform_device *pdev)
 {
+	const struct qcom_pcie_ep_cfg *cfg;
 	struct device *dev = &pdev->dev;
 	struct qcom_pcie_ep *pcie_ep;
 	char *name;
@@ -816,6 +825,14 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	pcie_ep->pci.ops = &pci_ops;
 	pcie_ep->pci.ep.ops = &pci_ep_ops;
 	pcie_ep->pci.edma.nr_irqs = 1;
+
+	cfg = of_device_get_match_data(dev);
+	if (cfg && cfg->hdma_support) {
+		pcie_ep->pci.edma.ll_wr_cnt = 8;
+		pcie_ep->pci.edma.ll_rd_cnt = 8;
+		pcie_ep->pci.edma.mf = EDMA_MF_HDMA_NATIVE;
+	}
+
 	platform_set_drvdata(pdev, pcie_ep);
 
 	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
@@ -874,8 +891,12 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
 	qcom_pcie_disable_resources(pcie_ep);
 }
 
+static const struct qcom_pcie_ep_cfg cfg_1_34_0 = {
+	.hdma_support = true,
+};
+
 static const struct of_device_id qcom_pcie_ep_match[] = {
-	{ .compatible = "qcom,sa8775p-pcie-ep", },
+	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },
 	{ }

-- 
2.25.1


