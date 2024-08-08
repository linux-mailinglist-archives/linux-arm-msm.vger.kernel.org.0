Return-Path: <linux-arm-msm+bounces-28137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9194B6BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 08:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5DD7B23250
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 06:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D9C187870;
	Thu,  8 Aug 2024 06:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFRtuBlf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED15186294
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Aug 2024 06:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723098670; cv=none; b=q+WWLUXVQmS3PQvJmwbzuat1kHFhK5TINR+NoJ+W3axGmSKyrsVsIpyNjR9/1AWRn/ynpbjrF1iAZn3+CVV7nSXqiMSPDKYGeRdkaCqIjK023jpMFlyrNBo1tiQUO3NCq39mkbYj6RFishx+k39HdQctxsD5VDgi5RmU+Zbjwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723098670; c=relaxed/simple;
	bh=8tcV6h51qTImYpVkN/XYbqQUsKUdeQdzBSWpJGgvF2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OdHhh0v+vT3iYduhW0PSYJaPkqVBZODDGzf0e4rCMqFF1t3Xj8Z2753IvR+gocVW+I/DO4Z5sSQXCsoZJCBHCkGRcUO7L0eM8RWbidQpvqcntIUH4eKolpI1Gq+V1KnCN/xAW/D7/oBhBx3RIL8mKyKNN6z+zB0Tg0uYS+Qvjpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EFRtuBlf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fdd6d81812so6493905ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 23:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723098668; x=1723703468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uL02WkDHX6MB6U3tlx7TFw4sDSoGDOr7FVNC/xGND0g=;
        b=EFRtuBlfxR6nc4Hg3OD7yMr7IwCyft5fiUEENZvPoCJeGsEJHr7SbT6taKPblynriB
         ldBAmtanuIfDs3sKyDeYZmFK5U+DLQ/yjnfYCYfmp6XYMaqP4oYa6SgA4RsrMCoOA1oO
         uvnQZiMO8ltU5j2XoEhlH0LIe+0jQCHkYnNs3uaTh7Cb2JVPU02SwUOy1lAeASTdRg9X
         kUGu6RfpHMGAZFrDg9W9GCnxfz0p5HfJCGcmF2Z6GQ6W3SYuT8Nvlo7grFhrqQDpia9L
         nApdLqIuKrCR3NLax1S0MOkJbuGNngZb2g4k3IuVuqOlF5O1kBEllh6eeZgnfwTAWNgg
         kAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723098668; x=1723703468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uL02WkDHX6MB6U3tlx7TFw4sDSoGDOr7FVNC/xGND0g=;
        b=LRtGNAQIn7gdAWWH5vF5TwPCW9lf3fATMDciY5kzneY0fTLSMLIceZtzE0Vai3G13b
         Rd6jsRE5TE5nk/95pxuvQavZN/fjXvcRSBbZKj5cWw0+zwczI4riStEx2wr0J/KUt+FH
         lVz/0wd5yUUWzWc3/WugxFV+oAFFfnE49IE/QYw0IcR7zmaJJ1B8YKegXVLyFO9gNFk2
         dIrkM4E0R6+SXRwpksIqMTlCCNKTwdl5GwQPYiJh0twleNlgvKY58u+Wz7n+8CMYF3Vw
         QJZ3ogPBbe7SmD0ac8+C70qXf1zUI93oM26Ox4+ooNQuZioR7uWwcp9TlHcdKB+KAFPR
         PZdw==
X-Forwarded-Encrypted: i=1; AJvYcCWZclSNjBSAz7rGWzHCIxxfxO0GTSqPx1qHtxXj92sCoAWqF4QQSnevSYIEYw/5dY+h2n7t16IOHRlzaEwn6gKuW9XuRW9AGF+tPqiPmg==
X-Gm-Message-State: AOJu0Ywyy5B2Rf5J1nk92+3RpZRsziU79H1KykvobbuOO3k9s4KpMsTW
	Na0BXo2ozB1vgI4iBgnkYFW2cLrfdRPbS8Fi+oxRhX+wDLP+s1mNJ0F+C8Wrgw==
X-Google-Smtp-Source: AGHT+IGQt0i5NhwN7Ci91sWmaz9DV0yumS/TmjkZMx5oG6iE3KgHew5o9t+jkvkw0fUPz38IFnljNw==
X-Received: by 2002:a17:903:120b:b0:1fc:3daa:52 with SMTP id d9443c01a7336-20095224ad2mr14708325ad.11.1723098668125;
        Wed, 07 Aug 2024 23:31:08 -0700 (PDT)
Received: from localhost.localdomain ([120.60.136.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929ad84sm116520415ad.270.2024.08.07.23.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 23:31:07 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: robh@kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] PCI: qcom-ep: Disable MHI RAM data parity error interrupt for SA8775P SoC
Date: Thu,  8 Aug 2024 12:00:57 +0530
Message-Id: <20240808063057.7394-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SA8775P SoC has support for the hardware parity check feature on the MHI
RAM (entity that holds MHI registers etc...). But due to a hardware bug in
the parity check logic, the data parity error interrupt is getting
generated all the time when using MHI. So the hardware team has suggested
disabling the parity check error to workaround the hardware bug.

So let's mask the parity error interrupt in PARF_INT_ALL_5_MASK register.

Fixes: 58d0d3e032b3 ("PCI: qcom-ep: Add support for SA8775P SOC")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 236229f66c80..a9b263f749b6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -58,6 +58,7 @@
 #define PARF_DEBUG_CNT_AUX_CLK_IN_L1SUB_L2	0xc88
 #define PARF_DEVICE_TYPE			0x1000
 #define PARF_BDF_TO_SID_CFG			0x2c00
+#define PARF_INT_ALL_5_MASK			0x2dcc
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_DOWN			BIT(1)
@@ -127,6 +128,9 @@
 /* PARF_CFG_BITS register fields */
 #define PARF_CFG_BITS_REQ_EXIT_L1SS_MSI_LTR_EN	BIT(1)
 
+/* PARF_INT_ALL_5_MASK fields */
+#define PARF_INT_ALL_5_MHI_RAM_DATA_PARITY_ERR	BIT(0)
+
 /* ELBI registers */
 #define ELBI_SYS_STTS				0x08
 #define ELBI_CS2_ENABLE				0xa4
@@ -158,10 +162,12 @@ enum qcom_pcie_ep_link_status {
  * struct qcom_pcie_ep_cfg - Per SoC config struct
  * @hdma_support: HDMA support on this SoC
  * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache snooping
+ * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
 	bool override_no_snoop;
+	bool disable_mhi_ram_parity_check;
 };
 
 /**
@@ -480,6 +486,12 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	      PARF_INT_ALL_LINK_UP | PARF_INT_ALL_EDMA;
 	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_MASK);
 
+	if (pcie_ep->cfg && pcie_ep->cfg->disable_mhi_ram_parity_check) {
+		val = readl_relaxed(pcie_ep->parf + PARF_INT_ALL_5_MASK);
+		val &= ~PARF_INT_ALL_5_MHI_RAM_DATA_PARITY_ERR;
+		writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_5_MASK);
+	}
+
 	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
@@ -901,6 +913,7 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
 static const struct qcom_pcie_ep_cfg cfg_1_34_0 = {
 	.hdma_support = true,
 	.override_no_snoop = true,
+	.disable_mhi_ram_parity_check = true,
 };
 
 static const struct of_device_id qcom_pcie_ep_match[] = {
-- 
2.25.1


