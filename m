Return-Path: <linux-arm-msm+bounces-14163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C598E87C01C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 16:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B11928441E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F8B757FA;
	Thu, 14 Mar 2024 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ne+eCzQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB9B74E05
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429898; cv=none; b=hQJrMYAynaJ7WF0a9eCjz2CcYBEx8nC7bZMHCNclBBC6cJ300KpnIqPxxh5KLkSyCVv4C3kLQYy5Dkx85tnSXCCVegEk7xqeHEQM4zCiNgBSUNzHqPCKmStWC4GRGrqiMwMadWWe47V2DI3Ew1sN0dQCRMXtBaJVmInLx5hO3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429898; c=relaxed/simple;
	bh=vvIRN7ZBKQkTFnoIHX/YU42aYhGdx8c3NJ1/9vK0fxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HV4tuwsDM7IqQV2hnyINUAIQWEUyi+4fOCZY6/lE4pMOw0yIvFfE0fJUJ5onz3Sx/H125QHY/CM6ZwteiA2nUbWPNYj23QuQuLe65Af2mdG8QcYMgg6dEF1dG6VV8vcnkScMHbMNLbLG62SFtOrZEX/XmuqhiWKhjfS+Sdx09PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ne+eCzQ7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso676101b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429896; x=1711034696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmIxA+VBny71iA9Jy1KHGto+GTLx5DDrGCoZw8mb/UA=;
        b=ne+eCzQ7vkkF5J50mCBp4N13U7QvYi7TuwxCXkVqJbMJEcX1Wgw+Id+qHeDPEh470S
         nqAbOFCX84aL/sWK/xqSb942NHYzhIUAPi0AvGSl5MGWwWj80HWbGeCzDxwCNFKEVB31
         bttgf8ArbmTzFWHF2Zr6GOIuXkUCnltDTFOjuz5u+wUsc9iT4Cx0nC9c0/HcNRglFXYk
         SbJbnlxG0I7othxM50ueFayf6eQss5qQ6e3nnIjxF15RDLdHzFlWfashF+rjNrksEM5g
         oJuyE6xpBTDvtVeF5G5U7jvFlyEsYirsPOdZRMAZFTkoJijlauAPL9p+097DuHsyPqwu
         KgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429896; x=1711034696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmIxA+VBny71iA9Jy1KHGto+GTLx5DDrGCoZw8mb/UA=;
        b=ctOtl4Us9bQpwmkLNCCqFc9ECmd+A2sA98KEaXo3t7RHQkVWdYmmktqjbzdUOTaj/h
         PJs7YXjVrYuwEGDzunKKUUli5gA+w9seIWrAwE7gY051U64P8gyaPJ292h2Ol6lcFc7z
         Bw+ZwyoiytsrgaRc9rcHaWUfORPu29gSB0BPD8fqHHCF524VNspb7CWMmK81YP5Txsoa
         ycc3HzScxjiSwK3TIHRRj4zGadFtufdd51QAt8uVdaFS8hEQKgIS3yKwlroO9VRndY2k
         L6wVypaTUWmbN9ERh2q03uRFXDR5eaQxcip7zFYS48cW50XbWFJGUBZ6bQjHlTdxiZoZ
         h/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVsTFpZMCYSDhHDg1L2L8bs82YF/dsjXVbcqLpAd2V83tgL5dh/njWSqyP5kDfCI4OjThlMVvfNhG4HA9/NXxq+XzCQ776VHTZmujgvLw==
X-Gm-Message-State: AOJu0YxlRNa4S9xwWP5u97NqlDjTnxwfH+/zvFL1TXDa9FQiSWSRkYat
	0UTsFjLUgwcRAV4ySLUlGodCTLXDAlieE5zMiQCAVnkPm6llkHWSMblm0oy4aA==
X-Google-Smtp-Source: AGHT+IG2peiit6xwcjpcw9vql2fJguzg+I2xNUy/9EetKehF958tqEIaolzuG1KSOVbZPjbZAJd13g==
X-Received: by 2002:a05:6a20:2d2b:b0:1a3:3ab7:d736 with SMTP id g43-20020a056a202d2b00b001a33ab7d736mr2249535pzl.43.1710429895604;
        Thu, 14 Mar 2024 08:24:55 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a63ed44000000b005e438ea2a5asm824021pgk.53.2024.03.14.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:24:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 20:53:50 +0530
Subject: [PATCH 11/11] PCI: tegra194: Rework {start/stop}_link() callbacks
 implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-epf-rework-v1-11-6134e6c1d491@linaro.org>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
In-Reply-To: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vidya Sagar <vidyas@nvidia.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2999;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=vvIRN7ZBKQkTFnoIHX/YU42aYhGdx8c3NJ1/9vK0fxY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8xaQGEjDj7V9nOkxQFG9KkzYhi7NMZ5fNY+WX
 /IyNnSDeqKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfMWkAAKCRBVnxHm/pHO
 9SzzB/0arBeoE0MTmN+C/QkksG5pbqe/k/wuAGkk2EO/pFuNZ20j163lecjuj4DJmfj5tmd3nQ1
 sAaCxZ9VlIvHRrPnsmX/3tFhHtVqyxOKzTOuhfn5I81q5drJ/txgjtjvFbhRwQINFlCTKg/5/wU
 HyMA4ky1/DL4Qm9TiHqzEXMp5dgKj0vDTJ/mu1zOoZKcyyQl7eXfFxkLrS6tc1RzIk/k+bFJBdl
 S9R94h+EwTv/Ug+F3LeXIqmMfV2zi0wTgZiGX6RfxVWHy9E5V+uiRUk87DcZwAfnti60B6mP36m
 LGER5WQ8R6URgGjyDvuAN+Txnfrra4uwGHRL0AKboqnPQ40S
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

DWC specific start_link() and stop_link() callbacks are supposed to start
and stop the link training of the PCIe bus. But the current endpoint
implementation of this driver enables/disables the PERST# IRQ.

Even though this is not causing any issues, this creates inconsistency
among the EP controller drivers. So for the sake of consistency, let's just
start/stop the link training in these callbacks.

Also, PERST# IRQ is now enabled from the start itself, thus allowing the
controller driver to initialize the registers when PERST# gets deasserted
without waiting for the user intervention though configfs.

Cc: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 3e6e08b321fb..03d6f248bc6f 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -964,7 +964,11 @@ static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
 	bool retry = true;
 
 	if (pcie->of_data->mode == DW_PCIE_EP_TYPE) {
-		enable_irq(pcie->pex_rst_irq);
+		/* Enable LTSSM */
+		val = appl_readl(pcie, APPL_CTRL);
+		val |= APPL_CTRL_LTSSM_EN;
+		appl_writel(pcie, val, APPL_CTRL);
+
 		return 0;
 	}
 
@@ -1049,8 +1053,12 @@ static int tegra_pcie_dw_link_up(struct dw_pcie *pci)
 static void tegra_pcie_dw_stop_link(struct dw_pcie *pci)
 {
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
+	u32 val;
 
-	disable_irq(pcie->pex_rst_irq);
+	/* Disable LTSSM */
+	val = appl_readl(pcie, APPL_CTRL);
+	val &= ~APPL_CTRL_LTSSM_EN;
+	appl_writel(pcie, val, APPL_CTRL);
 }
 
 static const struct dw_pcie_ops tegra_dw_pcie_ops = {
@@ -1702,11 +1710,6 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (pcie->ep_state == EP_STATE_DISABLED)
 		return;
 
-	/* Disable LTSSM */
-	val = appl_readl(pcie, APPL_CTRL);
-	val &= ~APPL_CTRL_LTSSM_EN;
-	appl_writel(pcie, val, APPL_CTRL);
-
 	ret = readl_poll_timeout(pcie->appl_base + APPL_DEBUG, val,
 				 ((val & APPL_DEBUG_LTSSM_STATE_MASK) >>
 				 APPL_DEBUG_LTSSM_STATE_SHIFT) ==
@@ -1913,11 +1916,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		appl_writel(pcie, val, APPL_LTR_MSG_2);
 	}
 
-	/* Enable LTSSM */
-	val = appl_readl(pcie, APPL_CTRL);
-	val |= APPL_CTRL_LTSSM_EN;
-	appl_writel(pcie, val, APPL_CTRL);
-
 	pcie->ep_state = EP_STATE_ENABLED;
 	dev_dbg(dev, "Initialization of endpoint is completed\n");
 
@@ -2060,8 +2058,6 @@ static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
 		return -ENOMEM;
 	}
 
-	irq_set_status_flags(pcie->pex_rst_irq, IRQ_NOAUTOEN);
-
 	pcie->ep_state = EP_STATE_DISABLED;
 
 	ret = devm_request_threaded_irq(dev, pcie->pex_rst_irq, NULL,

-- 
2.25.1


