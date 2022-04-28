Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A7E513342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 14:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345883AbiD1MC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 08:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239355AbiD1MCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 08:02:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A35AAE16
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:59:39 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x17so8160201lfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5fpTEUNCvgnc9AMwKVJD3wLMKlj8TQ48QZUL6p2NQR8=;
        b=qKwtczFvSsc2atLN3ON0tzwB9mkdVLwXWco5ngw2tI/7dxl8zbMl9Y2N3teH5Vxuzk
         wy1mdIddQH5ui0pVBQctg+fybLGGjzZVO1RjoKj8KOTZQhmSjZlkQGMjzdW7q+PYn3iJ
         N1SGQmRQdVH3911lV29DHGyScsvBRPTMjCXmL/lu6HwGDM3jqdORkZ6rXuLUTwp8qkib
         1LZv0/lQDHsbSRlCIZw8GCmBN8FZ0WGwHmDxnEdjA02WE1ks1sLBMYiCJR2ZazvOk8on
         4LjI21DRUn/85zAOow8T/MPxzYcP+4vltpIr4U5+M0jGrKNkANgFxjzVOnJSuzdLterq
         Lclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5fpTEUNCvgnc9AMwKVJD3wLMKlj8TQ48QZUL6p2NQR8=;
        b=C0w0VwMyU+AC1AAMCgglELBidU3VlDTGXzArxmb/xZP+V7MQe6qMQKklhutyD3gEY1
         3WrX4sFor6ofsGBVWsuoZXmMFtaxDhRnqZQwJOzgfh4SN5g2SjSBknzFeVZof9N2lf9R
         esnCx/KRS9/0Bs+R5DW+fjIXII99mktekj2XjuqKGAd/3dxoVzTwpofl0ej/ucSO18L5
         APWNhzh5F0yQfPGHUxfWblkGpkEdSIClhIaAFWKg5bjlmLRpfUorhJGIpJNY9inrvTeq
         DADCjr+DSY5tSki8vC6eZqt3vYLagKa2jI5GEqDm/Jg0ZLLqeqWFjnReBKjHcRp8g2xv
         xw5A==
X-Gm-Message-State: AOAM532yFV5riYjeytGDM04MVqSDsIKg8iUWrxICGOAmlxhwAwxtx9tV
        c16cLiwItSwokEj80Zh1sI9Xcg==
X-Google-Smtp-Source: ABdhPJx4HfqgwkR6uRE0ZHf8jqNai5tFxXGQseO7Hyh5q9WdExNHOFpJtjNvzXsERBN0Fwy9SvNPyg==
X-Received: by 2002:ac2:5f74:0:b0:471:fe5b:8f03 with SMTP id c20-20020ac25f74000000b00471fe5b8f03mr18046120lfc.444.1651147178049;
        Thu, 28 Apr 2022 04:59:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1-20020a2e1f01000000b0024602522b5dsm2069137ljf.120.2022.04.28.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 04:59:37 -0700 (PDT)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 3/7] PCI: dwc: Add msi_host_deinit callback
Date:   Thu, 28 Apr 2022 14:59:30 +0300
Message-Id: <20220428115934.3414641-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428115934.3414641-1-dmitry.baryshkov@linaro.org>
References: <20220428115934.3414641-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add msi_host_deinit() callback as a counterpart to msi_host_init(). It
will tear down MSI support in case host has to run host-specific ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++--
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 43d1d6116007..92dcaeabe2bf 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -424,7 +424,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		return 0;
 
 err_free_msi:
-	if (pp->has_msi_ctrl)
+	if (pp->ops->msi_host_deinit)
+		pp->ops->msi_host_deinit(pp);
+	else if (pp->has_msi_ctrl)
 		dw_pcie_free_msi(pp);
 	return ret;
 }
@@ -434,7 +436,9 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
 {
 	pci_stop_root_bus(pp->bridge->bus);
 	pci_remove_root_bus(pp->bridge->bus);
-	if (pp->has_msi_ctrl)
+	if (pp->ops->msi_host_deinit)
+		pp->ops->msi_host_deinit(pp);
+	else if (pp->has_msi_ctrl)
 		dw_pcie_free_msi(pp);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 7d6e9b7576be..e1c48b71e0d2 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -175,6 +175,7 @@ enum dw_pcie_device_mode {
 struct dw_pcie_host_ops {
 	int (*host_init)(struct pcie_port *pp);
 	int (*msi_host_init)(struct pcie_port *pp);
+	void (*msi_host_deinit)(struct pcie_port *pp);
 };
 
 struct pcie_port {
-- 
2.35.1

