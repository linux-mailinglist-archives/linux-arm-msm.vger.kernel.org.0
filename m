Return-Path: <linux-arm-msm+bounces-14090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670387B8CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 08:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888F51C22052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 07:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9063C5D477;
	Thu, 14 Mar 2024 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCQ+nPhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50055CDEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710402552; cv=none; b=sRsOnMUCHaTdUJbKKgMYnC2qVXItjzK2hktzKYM7lxGETuLJwDfpyO/sE/qKvojmc83fkLo+5GmcM/Cdd+Sbvq5qU3VDlJGnPYGSYsmpN6D2rltf0siTRYdgBRGGxM08lH2qUKJ6nIoqymCvKigtBit9DHLgNGKGeniQZ0qUGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710402552; c=relaxed/simple;
	bh=xsjHspxX1CV5a/PNQIIpN2qqaOyZ6qCrQpHaOAVI8vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfPf35LQfQkJgphTHl3Cs4y9Lak4iSGUZ6q0VkEAyKWTuELUEIUJir4kU+D7AUNw2yzQ6vCe7rV1xb0s7mb/NYs6Do4sE0kZ6wMiOS5D+KyS1hLaHT16TVkpaejZoZ1T6V4U6adY+69zOIz7jMvc3uN/K67PrlCnQ1hF6C/YJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCQ+nPhP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ddbad11823so6476875ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402550; x=1711007350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLQ2KY/kANrWdOgp5ipvhdWtB1DtlDn3QKL/poDghcc=;
        b=SCQ+nPhPJ54KQWW24uDycUNF6rwNM7aEPcqDruG+uEnJELhe8cGUHTkUk5U/VRT6pi
         52c6pBX7qTy82uNX5g8qwPiciOazB2H9vpitK6UJccvSpUWnUKhvtKnPm0+z/5+zKYal
         CluIRyP8A1KqxamhOs2IRU193hGCM6B5ArlMGzVdLRnjW6Ns+joLQLnszKmqWPskIebd
         aX/iPDnlHrFISxeL9HFaxljTKPSBS643ojd1wQICW6yXws3Qs6H4UgetT9lO4OXO8TW1
         JlwELG3subf/M0yylmNnJ5TAX1yPMH7THC3j/CI77OBIf+ZldaaaA8JO7V0qqrTGxZq0
         O0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402550; x=1711007350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLQ2KY/kANrWdOgp5ipvhdWtB1DtlDn3QKL/poDghcc=;
        b=Ab5fnDy0jI2AAMBkZTAORNl5XCpbgv6A97ceDnaNWraSWrTc4JiP2LG01qyAJpdz/j
         kx5HKUWoTHdgEjlOsWt0/F8prATgKKLfWsV/bXSqqjSe3diqCG13YNAhKfUpczGjVmYR
         AKEj+Eg1uDi3LFexIS8j8tBocEHUKltlalUT0WfFaNXikWMy+VEJcl7++sAh49YPyBgM
         +ZgnV/vHxIhlk2pVpvoP4m0MfB1j2Sb6YCvPzp8Ti/lO/nk5i7A+4DwmoQdL9p8v6WGW
         OdznZkzQC5yBWLmTK0EVBY3fz3aTVANwlLHdQJiQafJh6ekZMa1BLghyGYNdmZYyUxdq
         syMw==
X-Forwarded-Encrypted: i=1; AJvYcCUA2FWuW8cxoNsJHX7s4o0apsA2BPjiSi2qAY5XATLbV3k0sDtR9PHnH4umzY2KEJMUdyC7CD/Qh6ZyR6Y4KFK7+/uaMUw7khAp+kE5rw==
X-Gm-Message-State: AOJu0YxeosKvOR0Snxl99EF3u05ag6LWqlRYyZsesOCihUixJXpN5x6g
	K8CahDHcRJfuMttPht1FhH5d/9vjL9qJ5hLB8D1r82GyR1bGwHZ+C6HByPDrQA==
X-Google-Smtp-Source: AGHT+IFYvmfYgM7sWJlof+mWb61oPVgXgHOR80HYiC6JOqx6NSAb/CqWWl4bQ11DqtqgthTezjMdxg==
X-Received: by 2002:a17:902:c948:b0:1dd:96e5:d22b with SMTP id i8-20020a170902c94800b001dd96e5d22bmr1258333pla.49.1710402550108;
        Thu, 14 Mar 2024 00:49:10 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:02 +0530
Subject: [PATCH v10 4/8] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-4-14a45c5a938e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=xsjHspxX1CV5a/PNQIIpN2qqaOyZ6qCrQpHaOAVI8vQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvDf8pBXbcUEuMIVKIO3iY+ebIXNKafJg2SD
 qjBAB48zVaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwwAKCRBVnxHm/pHO
 9VMdB/4w5XM3nZossE+g1Y9kutB/G4YuWV+ui3XuLWZ5QV+q9vZsrcKcvgXbYgC4y3USJvS6RoH
 gbN27js52vfVgNpWoqgg4Dopg85NIf15o1fn6vskl39RJOQuInaolGJK6/Qe/x/UNFcpaRg0Qll
 J9NzOhG554dAC2UA+n09TLYKWS2TCrWkycYefgi+sugdEPc6a5V5zDcw3sat+38XKeA/YhH/zpu
 73YqSC3RHt2g+FNp9Zo0yX6SQARN8nK9/REMXa48zyqXAc0k/rb1qdYhuZ9lpy3OC9Cg7O5y/9W
 AgZ4OAPk5J2xNK5Z8V4RDZ6/Q7s9iY+lT1nU1vXwdfcfPsi5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index e59e35fd7251..fa7b26da8718 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -619,13 +619,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 /**
- * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * dw_pcie_ep_deinit - Deinitialize the endpoint device
  * @ep: DWC EP device
  *
  * Deinitialize the endpoint device. EPC device is not destroyed since that will
  * taken care by Devres.
  */
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -637,7 +637,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1


