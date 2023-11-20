Return-Path: <linux-arm-msm+bounces-1108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B19D47F0DBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693A228156A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930375255;
	Mon, 20 Nov 2023 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXqmwKK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D267126
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:40:47 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so2318166a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700469646; x=1701074446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA4et5DEe58CvaUPaUoVn2JhyhKCxIJLdzNc+n4DX2I=;
        b=FXqmwKK2EVv6oFkDad7iQc9A3S53jV1tk7MOfvqm2FUJ+pncZHWTXUPhM6875sYCwT
         mYMiq4uLb2fqOTVfqlLPFTw3oJXCIj7yrz6Ss1eQP06zzwIS/xTWNonZGUFh508bYnIF
         cOYxYIm5nh953R7UEfqUsXOxKqeWTKuTUgSnszeI1eYbRYwIHlzaFAO4Z5tGS1ffUrQ7
         pOOx7dvJ7fATTAb7gawGXNZ5Koq2lns7rKHwAN5M39USxiGEyIq4CeognX1oHdSgZs/T
         voy4OXWXw7b0PBE57Tv7kk+3TuH7Ni+OrAfv+XsSOEgcP3nR99rhY67CqVAq9CI/jq+U
         5HYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469646; x=1701074446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA4et5DEe58CvaUPaUoVn2JhyhKCxIJLdzNc+n4DX2I=;
        b=A/JY582SPzdgN8Y4DER2HIdwyD2eQiZIZs0TpygA9l8iQZQDrFWAUKULKGbGJPH0Yw
         HWSPOite6piBiQPKDiYSKyAWD88621KI9Ph4EeVNgWyID993H6e8bHmp2El7FN3CNyGJ
         Oc89FXy+lLubkDiYY0NViw7OnMEp1tk65N52vFkS2uslg9tiNWqGFftCn/cNfd+1yy6v
         ROtk7zqH51ux/6SlB20K0mYwMiIDMrIZN15EAkVHezlO6jsgygo4tBJ3dV9DH/skest3
         8bo+IiYNKv4VxmAsQ43yMw3m+3SkNsI35y03N5zIOMcz/ZCbJJlrDg+cFX0Ue9r9KGxg
         FSzw==
X-Gm-Message-State: AOJu0Yxd4mO9HehLc6KY57db4fx1sg3vwn6RYiY3pE1KZLaOccJy40UR
	0KupAoiJVJ9wPEM+uyRR1xFR
X-Google-Smtp-Source: AGHT+IElVewiVppHRvMO+lPS3lN61OStbKOmnNSX89BRCubPBY4/WTTj8C1eQ+g8SFtw8K29OgPTfQ==
X-Received: by 2002:a05:6a21:9209:b0:174:7f7:d049 with SMTP id tl9-20020a056a21920900b0017407f7d049mr5987907pzb.9.1700469646494;
        Mon, 20 Nov 2023 00:40:46 -0800 (PST)
Received: from localhost.localdomain ([117.248.2.5])
        by smtp.gmail.com with ESMTPSA id e24-20020a62ee18000000b00694ebe2b0d4sm5567019pfi.191.2023.11.20.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:40:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jingoohan1@gmail.com,
	gustavo.pimentel@synopsys.com,
	lpieralisi@kernel.org,
	robh@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_bjorande@quicinc.com,
	fancer.lancer@gmail.com,
	vidyas@nvidia.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 2/2] PCI: designware-ep: Move pci_epc_init_notify() inside dw_pcie_ep_init_complete()
Date: Mon, 20 Nov 2023 14:10:14 +0530
Message-Id: <20231120084014.108274-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120084014.108274-1-manivannan.sadhasivam@linaro.org>
References: <20231120084014.108274-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since pci_epc_init_notify() API is getting called right after the
dw_pcie_ep_init_complete() API in the DWC glue drivers, let's move it
inside dw_pcie_ep_init_complete() API as there is no compelling reason to
call it separately.

Co-developed-by: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 10 ++--------
 drivers/pci/controller/dwc/pcie-designware.h    |  5 -----
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  2 --
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 --
 4 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index b1c79cd8e25f..63bb99d1c48f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -22,14 +22,6 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
-void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
-{
-	struct pci_epc *epc = ep->epc;
-
-	pci_epc_init_notify(epc);
-}
-EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
-
 struct dw_pcie_ep_func *
 dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 {
@@ -784,6 +776,8 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 	if (ret)
 		goto err_cleanup;
 
+	pci_epc_init_notify(epc);
+
 	return 0;
 
 err_cleanup:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 55ff76e3d384..53bf38989eea 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -578,7 +578,6 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
-void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
@@ -605,10 +604,6 @@ static inline int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 	return 0;
 }
 
-static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
-{
-}
-
 static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 {
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 9e58f055199a..4a8119779a29 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -482,8 +482,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	val &= ~PARF_MSTR_AXI_CLK_EN;
 	writel_relaxed(val, pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
 
-	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
-
 	/* Enable LTSSM */
 	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
 	val |= BIT(8);
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0fe113598ebb..1126d1f5830c 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1901,8 +1901,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		goto fail_init_complete;
 	}
 
-	dw_pcie_ep_init_notify(ep);
-
 	/* Program the private control to allow sending LTR upstream */
 	if (pcie->of_data->has_ltr_req_fix) {
 		val = appl_readl(pcie, APPL_LTR_MSG_2);
-- 
2.25.1


