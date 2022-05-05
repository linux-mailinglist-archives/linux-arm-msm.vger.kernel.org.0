Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D307351BB95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 11:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351901AbiEEJQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 05:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351866AbiEEJQP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 05:16:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B754E4C782
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 02:12:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b18so6426390lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5fpTEUNCvgnc9AMwKVJD3wLMKlj8TQ48QZUL6p2NQR8=;
        b=aStDZhXoHaHsQskhisuS1in5V+S+1Pj9TNHgy7QB15Nv1NP4wYjoH/jzUj1HTe7ct4
         oDPa/+uQ8lgfr4Fh8S8osXYUoTNmzrtiEVk+Jp0zhSGKAWD2nshHGj/pvriF/GQ+H+eL
         ILX8FA25Ma255iCSD5fVuuYOm20qmV2afmEeLwFruSxNpP0ZM+4+NWpBYpYbca1B8dZM
         4dljL+fe2dXhyc5UliaS6HhQK7DWTDFhMyEH+FCwgVwDhYDCqoNQhRPB5oqSqkVJdHqd
         XOZmf5ZXqVU/ECUipJPbtcAQPfM0C4WYYLshblAnXQMeijq+v0yynSRs8fSbuaZs7/ak
         sh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5fpTEUNCvgnc9AMwKVJD3wLMKlj8TQ48QZUL6p2NQR8=;
        b=H17+zogVba4XAMPWFs4SJex50g+DveosxVA+Mf5tDQ0ky7hNou9VCd4jHyn3Bmm8AX
         6f9/Wv3hvPJnd/QNkh/esESGBwHbns18e0wLx6Xe6GCHZjAhLfjEmL0EVI0AdbxlDbzE
         c8+jBSXQg3o2bWoSb1NH0yIDmMzaps718yLGt0txPPX9+H2T9oOrnK8z4o0N6xqmG+RQ
         x8QRY4ajbS6h39JgNDqd7Cb0yu3uDsptASv5PIiMrdWhrfF4G4Mtmv/hJpodbcALPgzI
         /f7quxDKTQLfjvvSOWDLe4NfDC7HxYrcFJqe8cvBqzMRPuoTslm1k790oLccb802tjOi
         Nwfw==
X-Gm-Message-State: AOAM5320vwNhHIB+Y+jx0rXaUX88AAQ1ufaGJVUK2kT6yphvss9UrEzB
        GkVRhhtKeA9wb+anLMYuzh2obg==
X-Google-Smtp-Source: ABdhPJyDOzYizTE65HxMKlAObhHhsydD59/aI2ct3w2qud0gjNmE0lvd7l1OW4pnb9pWi6uO+4NRbQ==
X-Received: by 2002:ac2:57c7:0:b0:472:208d:926f with SMTP id k7-20020ac257c7000000b00472208d926fmr16627243lfo.224.1651741954093;
        Thu, 05 May 2022 02:12:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2593a000000b0047255d211e8sm133564lfi.279.2022.05.05.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 02:12:33 -0700 (PDT)
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
Subject: [PATCH v6 3/7] PCI: dwc: Add msi_host_deinit callback
Date:   Thu,  5 May 2022 12:12:27 +0300
Message-Id: <20220505091231.1308963-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505091231.1308963-1-dmitry.baryshkov@linaro.org>
References: <20220505091231.1308963-1-dmitry.baryshkov@linaro.org>
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

