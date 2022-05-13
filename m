Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190B95262CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 15:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380604AbiEMNRI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 09:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380631AbiEMNRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 09:17:05 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54B2BE15
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:17:03 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s27so10281284ljd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRYJPVJv1hi6J6A2zsgmEhYbUKM6k3uZCz5kyvsYztA=;
        b=H8kXfvsiYqj8tqFyFGJkD8lxAxGYzlqCyG04TWIZzhaExHBZKDmCidG7Qp0jdjeYH4
         x61B42Q0/CPqdO0PibHDQ4DT2WMJqax6Vxf80Vt4ApWz10Kip+xdQIdOiqu9EqywJY2l
         mne4CTR0IxM7VQnI/xH4o9ro/roxITu7MnMpvlmJaAnh54xu6vBeHqGWHjg0KMW9cyUd
         qw2JvFelfYd/mZZWq+idCkFcERnOB1qrWTBG55rup3/IVfY/yrEhgq3YdqfB/KoC+RHM
         2HZOUtZ+ikDsCjOemIykzOiL1EUc3UpwZxvViHsePkehCvHPSvBu/0w7C6JzUUO9GZIE
         79Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRYJPVJv1hi6J6A2zsgmEhYbUKM6k3uZCz5kyvsYztA=;
        b=m0eD0deASG6aTHAO6286FMGSZURz86uK/O0a3n6MlC6AAXpPlof40oFIq3249fmdl/
         e6jBkBwWvbIKaYaNG17GwTeQYWXRpxGw2a094wN3f1YTu0CSYF1eBER3H8E6kP37kfR0
         n5ADIwirrdBmK+SLhx2SkHudqC1xU+tUqTeQpKLAT5hzZ/8ZBd+AnN6cagQh3kVm4NjP
         4a4XN4CAgHmc/1yBiriWlTuZwRw6+/fXaejW+9GwpaoPZZLwBK/WdMGRZQxOTE7ypSvl
         sSsqoyhLIoYqUR+644B7nsY3DxK/aNLiSIQ7Xt+IZGrCK1rQdTzpNz5lnZJtHmMNMCmA
         A8LA==
X-Gm-Message-State: AOAM530mgiN1UpXPgzjofOwGRkIKJ8mtnF4oVWlr+a1WgKdnEC95aKmz
        PqVbOvA4EluWeE+d5JGxQmP+XQ==
X-Google-Smtp-Source: ABdhPJwZZU43Luhy9EZ1zjEYN1TNO5pTlPtXpnipLqDItsNtrNQ6tMyHOA0MzZrRMwARvQ+0UtMHxQ==
X-Received: by 2002:a2e:8557:0:b0:24f:f3d:c526 with SMTP id u23-20020a2e8557000000b0024f0f3dc526mr2966682ljj.350.1652447821961;
        Fri, 13 May 2022 06:17:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u22-20020a2ea176000000b0024f3d1dae8fsm436991ljl.23.2022.05.13.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:17:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 05/10] PCI: dwc: split MSI IRQ parsing/allocation to a separate function
Date:   Fri, 13 May 2022 16:16:50 +0300
Message-Id: <20220513131655.2927616-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513131655.2927616-1-dmitry.baryshkov@linaro.org>
References: <20220513131655.2927616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split handling of MSI host IRQs to a separate dw_pcie_msi_host_init()
function. The code is complex enough to warrant a separate function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 97 +++++++++++--------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 5f6590929319..983fff735d7e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -288,6 +288,59 @@ static void dw_pcie_msi_init(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
 }
 
+static int dw_pcie_msi_host_init(struct pcie_port *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct platform_device *pdev = to_platform_device(pci->dev);
+	int ret;
+	u32 ctrl, num_ctrls;
+
+	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
+	for (ctrl = 0; ctrl < num_ctrls; ctrl++)
+		pp->irq_mask[ctrl] = ~0;
+
+	if (!pp->msi_irq[0]) {
+		int irq = platform_get_irq_byname_optional(pdev, "msi");
+
+		if (irq < 0) {
+			irq = platform_get_irq(pdev, 0);
+			if (irq < 0)
+				return irq;
+		}
+		pp->msi_irq[0] = irq;
+	}
+
+	pp->msi_irq_chip = &dw_pci_msi_bottom_irq_chip;
+
+	ret = dw_pcie_allocate_domains(pp);
+	if (ret)
+		return ret;
+
+	for (ctrl = 0; ctrl < num_ctrls; ctrl++)
+		if (pp->msi_irq[ctrl] > 0)
+			irq_set_chained_handler_and_data(pp->msi_irq[ctrl],
+							 dw_chained_msi_isr,
+							 pp);
+
+	ret = dma_set_mask(pci->dev, DMA_BIT_MASK(32));
+	if (ret)
+		dev_warn(pci->dev, "Failed to set DMA mask to 32-bit. Devices with only 32-bit MSI support may not work properly\n");
+
+	pp->msi_data = dma_map_single_attrs(pci->dev, &pp->msi_msg,
+					    sizeof(pp->msi_msg),
+					    DMA_FROM_DEVICE,
+					    DMA_ATTR_SKIP_CPU_SYNC);
+	ret = dma_mapping_error(pci->dev, pp->msi_data);
+	if (ret) {
+		dev_err(pci->dev, "Failed to map MSI data: %d\n", ret);
+		pp->msi_data = 0;
+		dw_pcie_free_msi(pp);
+		return ret;
+	}
+
+	return 0;
+}
+
 int dw_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -365,49 +418,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			if (ret < 0)
 				return ret;
 		} else if (pp->has_msi_ctrl) {
-			u32 ctrl, num_ctrls;
-
-			num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
-			for (ctrl = 0; ctrl < num_ctrls; ctrl++)
-				pp->irq_mask[ctrl] = ~0;
-
-			if (!pp->msi_irq[0]) {
-				int irq = platform_get_irq_byname_optional(pdev, "msi");
-
-				if (irq < 0) {
-					irq = platform_get_irq(pdev, 0);
-					if (irq < 0)
-						return irq;
-				}
-				pp->msi_irq[0] = irq;
-			}
-
-			pp->msi_irq_chip = &dw_pci_msi_bottom_irq_chip;
-
-			ret = dw_pcie_allocate_domains(pp);
-			if (ret)
+			ret = dw_pcie_msi_host_init(pp);
+			if (ret < 0)
 				return ret;
-
-			for (ctrl = 0; ctrl < num_ctrls; ctrl++)
-				if (pp->msi_irq[ctrl] > 0)
-					irq_set_chained_handler_and_data(pp->msi_irq[ctrl],
-									 dw_chained_msi_isr,
-									 pp);
-
-			ret = dma_set_mask(pci->dev, DMA_BIT_MASK(32));
-			if (ret)
-				dev_warn(pci->dev, "Failed to set DMA mask to 32-bit. Devices with only 32-bit MSI support may not work properly\n");
-
-			pp->msi_data = dma_map_single_attrs(pci->dev, &pp->msi_msg,
-						      sizeof(pp->msi_msg),
-						      DMA_FROM_DEVICE,
-						      DMA_ATTR_SKIP_CPU_SYNC);
-			ret = dma_mapping_error(pci->dev, pp->msi_data);
-			if (ret) {
-				dev_err(pci->dev, "Failed to map MSI data: %d\n", ret);
-				pp->msi_data = 0;
-				goto err_free_msi;
-			}
 		}
 	}
 
-- 
2.35.1

