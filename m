Return-Path: <linux-arm-msm+bounces-1107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A67F0DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56145B20EE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE5F210F;
	Mon, 20 Nov 2023 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GrzGFcsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C509E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:40:37 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cb7951d713so663722b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700469636; x=1701074436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzhddvXC6cI/X85xHzqd3aV1zDt2NEPQsub4e4mhWPM=;
        b=GrzGFcsTE7E0OSD0KPfcnsc3hPHxUMa9PwkgiRBYKVEQgQumYz6QmuQw/4vabufGaT
         oR2iAYz5SRvIZpUlO+fpBhFQMAp+wavzIOoyF3ibbKhm/l0Vf6PJ+eKRwXPz1jB+sWQ0
         4PTtuhRJNdX3Ij7pRQc7YY+HVBMxCWDjbEHf1taEkRorAU3Grrri5OTv/92R6FBJkGnt
         60Zx+Irnj3HV1uL3MGjPvSXVq6gv+Nob+2fRBIHv3yI9ZBpzkLpVBgMiQgXawhVXLO8R
         q56/CgnNNOLY9p7auTKI9juLx7YC0IPfcbDNh+gm60aVNDN8s/73javJ/3/Cxdxqg2jM
         WVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469636; x=1701074436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzhddvXC6cI/X85xHzqd3aV1zDt2NEPQsub4e4mhWPM=;
        b=Nc3Yojt8w1E2VV43muQj1UiDmRmMzHMoQkqkDCQRclG8nskXVL4a+gCt1q6A38iRsE
         i3fiVLtibV4mrq3qbtS+lUjPozSLLzx9th62Gr8rf7x4Zm66s7btvtaTwuY7wtYNBoEx
         RDPq+tHJ5WzUjEPySr+YdjJY6xD4WSnN4ic4irbd4QnseRA1ZJK1YWLJIFVqM+1Z9wog
         oaSAOavRrUx9KPg/elcwpaFqIF9n8DkPcRSq9g1t4Gn3HJXr67LRSyzw47Q5umzQM6X5
         nwSOe4h/lNjjwauQFmmR4lYYhCeAsAwasg/+ij8CEtx/2bf/sH76myypKA5yL6rnpzrk
         9XZg==
X-Gm-Message-State: AOJu0Yyi0QVDbJ4Kmi8uL9yajyLhTBBx+sL2dCcLupy0BHzvfsTE2FoB
	cs83bTwSpa9Bt5Tizc9txILN
X-Google-Smtp-Source: AGHT+IEkJYS/cK3xWs4QajqygLgZGgqKY/XJaKKfd2aJxYCNj68mUvW+/8cvZW7Cgnl1LXFr7ygXVQ==
X-Received: by 2002:a05:6a00:870d:b0:68f:a92a:8509 with SMTP id hj13-20020a056a00870d00b0068fa92a8509mr14956671pfb.7.1700469636618;
        Mon, 20 Nov 2023 00:40:36 -0800 (PST)
Received: from localhost.localdomain ([117.248.2.5])
        by smtp.gmail.com with ESMTPSA id e24-20020a62ee18000000b00694ebe2b0d4sm5567019pfi.191.2023.11.20.00.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:40:35 -0800 (PST)
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
Subject: [PATCH v7 1/2] PCI: designware-ep: Fix DBI access before core init
Date: Mon, 20 Nov 2023 14:10:13 +0530
Message-Id: <20231120084014.108274-2-manivannan.sadhasivam@linaro.org>
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

The drivers for platforms requiring reference clock from the PCIe host for
initializing their PCIe EP core, make use of the 'core_init_notifier'
feature exposed by the DWC common code. On these platforms, access to the
hw registers like DBI before completing the core initialization will result
in a whole system hang. But the current DWC EP driver tries to access DBI
registers during dw_pcie_ep_init() without waiting for core initialization
and it results in system hang on platforms making use of
'core_init_notifier' such as Tegra194 and Qcom SM8450.

To workaround this issue, users of the above mentioned platforms have to
maintain the dependency with the PCIe host by booting the PCIe EP after
host boot. But this won't provide a good user experience, since PCIe EP is
_one_ of the features of those platforms and it doesn't make sense to
delay the whole platform booting due to the PCIe dependency.

So to fix this issue, let's move all the DBI access during
dw_pcie_ep_init() in the DWC EP driver to the dw_pcie_ep_init_complete()
API that gets called only after core initialization on these platforms.
This makes sure that the DBI register accesses are skipped during
dw_pcie_ep_init() and accessed later once the core initialization happens.

For the rest of the platforms, DBI access happens as usual.

Co-developed-by: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 139 ++++++++++++------
 1 file changed, 91 insertions(+), 48 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index f6207989fc6a..b1c79cd8e25f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -662,14 +662,19 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
-int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+static int dw_pcie_ep_late_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct dw_pcie_ep_func *ep_func;
+	struct device *dev = pci->dev;
+	struct pci_epc *epc = ep->epc;
 	unsigned int offset, ptm_cap_base;
 	unsigned int nbars;
 	u8 hdr_type;
+	u8 func_no;
+	int i, ret;
+	void *addr;
 	u32 reg;
-	int i;
 
 	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
 		   PCI_HEADER_TYPE_MASK;
@@ -680,6 +685,55 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 		return -EIO;
 	}
 
+	dw_pcie_version_detect(pci);
+
+	dw_pcie_iatu_detect(pci);
+
+	ret = dw_pcie_edma_detect(pci);
+	if (ret)
+		return ret;
+
+	if (!ep->ib_window_map) {
+		ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
+						       GFP_KERNEL);
+		if (!ep->ib_window_map)
+			goto err_remove_edma;
+	}
+
+	if (!ep->ob_window_map) {
+		ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
+						       GFP_KERNEL);
+		if (!ep->ob_window_map)
+			goto err_remove_edma;
+	}
+
+	if (!ep->outbound_addr) {
+		addr = devm_kcalloc(dev, pci->num_ob_windows, sizeof(phys_addr_t),
+				    GFP_KERNEL);
+		if (!addr)
+			goto err_remove_edma;
+		ep->outbound_addr = addr;
+	}
+
+	for (func_no = 0; func_no < epc->max_functions; func_no++) {
+
+		ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
+		if (ep_func)
+			continue;
+
+		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
+		if (!ep_func)
+			goto err_remove_edma;
+
+		ep_func->func_no = func_no;
+		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
+							      PCI_CAP_ID_MSI);
+		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
+							       PCI_CAP_ID_MSIX);
+
+		list_add_tail(&ep_func->list, &ep->func_list);
+	}
+
 	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
 	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
 
@@ -714,14 +768,38 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 	dw_pcie_dbi_ro_wr_dis(pci);
 
 	return 0;
+
+err_remove_edma:
+	dw_pcie_edma_remove(pci);
+
+	return ret;
+}
+
+int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
+{
+	struct pci_epc *epc = ep->epc;
+	int ret;
+
+	ret = dw_pcie_ep_late_init(ep);
+	if (ret)
+		goto err_cleanup;
+
+	return 0;
+
+err_cleanup:
+	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
+			      epc->mem->window.page_size);
+	pci_epc_mem_exit(epc);
+	if (ep->ops->deinit)
+		ep->ops->deinit(ep);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
 
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;
-	void *addr;
-	u8 func_no;
 	struct resource *res;
 	struct pci_epc *epc;
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -729,7 +807,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
 	const struct pci_epc_features *epc_features;
-	struct dw_pcie_ep_func *ep_func;
 
 	INIT_LIST_HEAD(&ep->func_list);
 
@@ -747,26 +824,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ep->ops->pre_init)
 		ep->ops->pre_init(ep);
 
-	dw_pcie_version_detect(pci);
-
-	dw_pcie_iatu_detect(pci);
-
-	ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
-					       GFP_KERNEL);
-	if (!ep->ib_window_map)
-		return -ENOMEM;
-
-	ep->ob_window_map = devm_bitmap_zalloc(dev, pci->num_ob_windows,
-					       GFP_KERNEL);
-	if (!ep->ob_window_map)
-		return -ENOMEM;
-
-	addr = devm_kcalloc(dev, pci->num_ob_windows, sizeof(phys_addr_t),
-			    GFP_KERNEL);
-	if (!addr)
-		return -ENOMEM;
-	ep->outbound_addr = addr;
-
 	epc = devm_pci_epc_create(dev, &epc_ops);
 	if (IS_ERR(epc)) {
 		dev_err(dev, "Failed to create epc device\n");
@@ -780,20 +837,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ret < 0)
 		epc->max_functions = 1;
 
-	for (func_no = 0; func_no < epc->max_functions; func_no++) {
-		ep_func = devm_kzalloc(dev, sizeof(*ep_func), GFP_KERNEL);
-		if (!ep_func)
-			return -ENOMEM;
-
-		ep_func->func_no = func_no;
-		ep_func->msi_cap = dw_pcie_ep_find_capability(ep, func_no,
-							      PCI_CAP_ID_MSI);
-		ep_func->msix_cap = dw_pcie_ep_find_capability(ep, func_no,
-							       PCI_CAP_ID_MSIX);
-
-		list_add_tail(&ep_func->list, &ep->func_list);
-	}
-
 	if (ep->ops->ep_init)
 		ep->ops->ep_init(ep);
 
@@ -812,25 +855,25 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		goto err_exit_epc_mem;
 	}
 
-	ret = dw_pcie_edma_detect(pci);
-	if (ret)
-		goto err_free_epc_mem;
-
 	if (ep->ops->get_features) {
 		epc_features = ep->ops->get_features(ep);
 		if (epc_features->core_init_notifier)
 			return 0;
 	}
 
-	ret = dw_pcie_ep_init_complete(ep);
+	/*
+	 * NOTE:- Avoid accessing the hardware (Ex:- DBI space) before this
+	 * step as platforms that implement 'core_init_notifier' feature may
+	 * not have the hardware ready (i.e. core initialized) for access
+	 * (Ex: tegra194). Any hardware access on such platforms result
+	 * in system hang.
+	 */
+	ret = dw_pcie_ep_late_init(ep);
 	if (ret)
-		goto err_remove_edma;
+		goto err_free_epc_mem;
 
 	return 0;
 
-err_remove_edma:
-	dw_pcie_edma_remove(pci);
-
 err_free_epc_mem:
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);
-- 
2.25.1


