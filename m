Return-Path: <linux-arm-msm+bounces-14092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F8087B8D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 08:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44BA9B23D0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 07:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270915F84C;
	Thu, 14 Mar 2024 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSJHOUBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F495F863
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710402572; cv=none; b=I1TE6aS3U7Ta+Z9rGdyXQ4yjqsPJ+94VFh3eh9rjYcjmhHUWmcQMZ0HH3aUVyDoIsGoQ2/PZ8Mq1kIZQwTgwlnFSLFsO0FnseF0tPAMWmChWl5QUQLoALF/in59VHWi1knD/+Rvd25TBC4ZfrdXPpSvNdjxyEK58eCIIPBRmpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710402572; c=relaxed/simple;
	bh=a51syM47ClPRjjK9nJZyqAiavM5OunFIsMImjH4DoPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a63nayljOjeAT1IIkzpkwx0/8a5VN2EU2yqF5cXeQ+XWxACqDsTGac500JkSNryDyTJobYkBTITkiqvGaTu0D7c9WQsgLzmQAmQ7RVFqG32ql9bL0aWBodombgfxMywnMWEFSra/it/MTqs+m5LdDlxamDtnSWHnUXQP0CU6tSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSJHOUBA; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so504030a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402570; x=1711007370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=En7dKEz8/ozmX3HuMMdU7IHb33r7hZjjGkDZD6oOuns=;
        b=sSJHOUBAHm0+EY3dSXyb0OBNeq+Qlfj5tNz4M4LZATLPCuqBUzLBd7kI1PSPgrP80B
         n8j5LBzVaiTgt0k9yEQvJfJnE1JMMlUud4Viey7hfmhelj7cLKtT/4UrI2uel5wH1ury
         re/kcJyC0ekf+y9wMk+uahTEd8M+uSmkzbdYHk2G4pwNNTQJdfidVEQ7oo9mpXduVXFS
         6nejJ/cIxGl/hMC8KmWnAfdOIMAldjkUkjRqYh1UofE+XWeSxkd+eQQKTZJNCGeUvp57
         AKcz1hSp5wP07ks9hC7AW4S+CmOjrAyV1X2r+d6LQZg13XvbJ12Z2wnljzoxL00yRAgC
         xWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402570; x=1711007370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En7dKEz8/ozmX3HuMMdU7IHb33r7hZjjGkDZD6oOuns=;
        b=WXYy3AMZO+bVfl7ZBUqk+koLb54NXHjvJdV/PfUpMUbM31Gn8zhm46OJqVpJwB8tog
         Pbkq9glMuEfDZYFzYB0aWZS87Yyi8/rzJnf1WAcprnMARZhwOOKxcHrCDla8A8XM0B0Y
         /ULIzbxqTJnhcKeqWMjTv53izBLo9MJxLvu8KVHG+qIX8tMGYtqXTeu1K3+oS9kg12xK
         xSBKNqrPBirL6c12hJg+PDIS9mepaE5scXJa227venJ4uk2zJ5mQFPTdFTvlmtXB8mAY
         fslox/U1iv7syOtU51UrUFFS8pylLI4J5yfZz44z4PWheykthlt2w2AFWsZzImB1qGxX
         2ZNg==
X-Forwarded-Encrypted: i=1; AJvYcCVc+c0pFPVItD3/RsmHOJemTIsLyuF4+slkfT9o9A7DjA6DapsUycPy5zD5LXIvLPVeZS851ltq6iEIW5xMtXYadA6y2T+aBU1FWNc6Ww==
X-Gm-Message-State: AOJu0YzYdYfbbrf2td1gaYSRZyWWVx2GtwuluxJNt1fm6WN4kseV4naq
	+yrEwVikI0r81HIUp2/Jn2HkA2V95pZY7i84AGuS/i7+jcjspsImzURPcaPqEA==
X-Google-Smtp-Source: AGHT+IEGoczMod+dsnL7adnGmvhSh1eHjlM03Qs1NijvAz6fHHyauYMIQZcr1BsMS1R4JRu8iS/Smg==
X-Received: by 2002:a05:6a20:3d8a:b0:1a3:2b9c:9791 with SMTP id s10-20020a056a203d8a00b001a32b9c9791mr1421085pzi.13.1710402569518;
        Thu, 14 Mar 2024 00:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:04 +0530
Subject: [PATCH v10 6/8] PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to
 dw_pcie_ep_init_registers()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-6-14a45c5a938e@linaro.org>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
In-Reply-To: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4791;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=a51syM47ClPRjjK9nJZyqAiavM5OunFIsMImjH4DoPw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvDqHiRrZ60+xiRvuW7IFNGKavGN9Ic8X+L4
 1LSqO5+opuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwwAKCRBVnxHm/pHO
 9U5dCACcjLPUojUut4+RcYSTAPL+b1wo6pRrXFxNAQjfyMzNdnlMyQ72kbnygTj/hdL1jFbell9
 D9jtiTVWgqfKKthT43Pl9IvwekuN5xm2P2eLigs6SMyMOG0gluvaDIJOmJhw7HAZz/7PHC21tkS
 3/STFRRx++mrwsWFPF/bg0Gw4F3fix+dFhCtET2mLQskkHeUYl3hNhziW0e+oRvc2+q1dKrJmf9
 bTeWY+gVOFOTtqLJC2hBTykO/l6AbICZj5oHk2o0CcH8RzBAAHIco15rWGcuc6a/+4mF99kJVqK
 r3jTpmD+smOgHh1w48V3vMo+ytzSBMWQoxKccayBmibpujnb
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

The goal of the dw_pcie_ep_init_complete() API is to initialize the DWC
specific registers post registering the controller with the EP framework.

But the naming doesn't reflect its functionality and causes confusion. So,
let's rename it to dw_pcie_ep_init_registers() to make it clear that it
initializes the DWC specific registers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 14 +++++++-------
 drivers/pci/controller/dwc/pcie-designware.h    |  4 ++--
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 4c21a38245b6..9354671644b6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -673,14 +673,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 }
 
 /**
- * dw_pcie_ep_init_complete - Complete DWC EP initialization
+ * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
  *
- * Complete the initialization of the registers (CSRs) specific to DWC EP. This
- * API should be called only when the endpoint receives an active refclk (either
- * from host or generated locally).
+ * Initialize the registers (CSRs) specific to DWC EP. This API should be called
+ * only when the endpoint receives an active refclk (either from host or
+ * generated locally).
  */
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dw_pcie_ep_func *ep_func;
@@ -795,7 +795,7 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
 /**
  * dw_pcie_ep_init - Initialize the endpoint device
@@ -874,7 +874,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	 * (Ex: tegra194). Any hardware access on such platforms result
 	 * in system hang.
 	 */
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_registers(ep);
 	if (ret)
 		goto err_free_epc_mem;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 351d2fe3ea4d..f8e5431a207b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -669,7 +669,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 #ifdef CONFIG_PCIE_DW_EP
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
+int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
@@ -693,7 +693,7 @@ static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	return 0;
 }
 
-static inline int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+static inline int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 59b1c0110288..3697b4a944cc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -463,7 +463,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	      PARF_INT_ALL_LINK_UP | PARF_INT_ALL_EDMA;
 	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_MASK);
 
-	ret = dw_pcie_ep_init_complete(&pcie_ep->pci.ep);
+	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto err_disable_resources;
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 68bfeed3429b..264ee76bf008 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1897,7 +1897,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 	val = (upper_32_bits(ep->msi_mem_phys) & MSIX_ADDR_MATCH_HIGH_OFF_MASK);
 	dw_pcie_writel_dbi(pci, MSIX_ADDR_MATCH_HIGH_OFF, val);
 
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_registers(ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto fail_init_complete;

-- 
2.25.1


