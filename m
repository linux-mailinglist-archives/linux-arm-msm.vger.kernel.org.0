Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5463872417B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 13:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbjFFL67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 07:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237334AbjFFL6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 07:58:48 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1DF10D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 04:58:41 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b18474cbb6so34816365ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686052721; x=1688644721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSuQM0THipDEP2i9dNDRBKcix0JZAp6WucW0BLJeVqs=;
        b=av5pSkpMGWwB+gjsplExziRRl2vWGKeK7VTU0gUqSGLsl+UpZk31i2qWkjVO4OMDkv
         /pfazZzANZa51p+tVdu7PCsnye3KRaDmsFqYxKQAJTXc6JlheOmf55IAnlyxZRVN1Wie
         wDhXvlxlVyHm/fmb4qjkBSPr3r0EOPeOBHS14DZ6/FktuhIZhaqYMiZ1jCPe0KnV0MNO
         jngMp7CGJaT8KdjCyZV9FXeBh2J2sH+wyfVGBCMMTk38o5Ysby8v4fhrOJfqU1LoSxjo
         /HR/PmBRYoLioHjptJzJqh0XCNYAZsZ+UB2c3oc2DXKVlQhPwTukU+f4x/sDAdcB9YBR
         ijqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686052721; x=1688644721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSuQM0THipDEP2i9dNDRBKcix0JZAp6WucW0BLJeVqs=;
        b=hw1pmZf5n2zx0WzsqFgo2dyde264HTzlMrkd5ssiAva6O7fBcQL+SX6P2a63HTFRsC
         kFX6F173P1WlG9PPKq+S52fXk5jVgMGZc2wjvivoQo1N2WCzOfaBrv3uaOKlB40x9uoG
         FuvFUhGaIQg+v5ihFQxrctvjjXGR94Aw6eJY220g+9vIfvOMVCmIeczN35a0vhSAgudy
         5UXOM6qLBH+7OMe65C0X+rxSRcYLje51jvgfJSBf3+Sd4mCFbUif+j/I47Ig80RepY9z
         EALs7/teE+CF0nxeXORjz4wfF0fHW8q149vnjFZ+ysldHLgqqhfLFBe5x9cgWnVKZk7I
         3yQw==
X-Gm-Message-State: AC+VfDxNL//w42B7jsJ+6H2babPhy9LMZ86qtcHx8LL+hDw0qS/JCyQS
        k8fAwc+Eh+u/9s9tVX3lhjD8
X-Google-Smtp-Source: ACHHUZ7LNXlBa5f/Tjre/u7kDvJfy2leGepA6Z6gilmsMdPCsHWSNiqG+Sdy+MKC5LNbcihH/AfDLQ==
X-Received: by 2002:a17:903:1207:b0:1aa:feca:b616 with SMTP id l7-20020a170903120700b001aafecab616mr1846986plh.65.1686052720780;
        Tue, 06 Jun 2023 04:58:40 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b001acaf7e22bdsm8419226plh.14.2023.06.06.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:58:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/7] PCI: qcom-ep: Add eDMA support
Date:   Tue,  6 Jun 2023 17:28:10 +0530
Message-Id: <20230606115814.53319-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
References: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm PCIe Endpoint controllers have the in-built Embedded DMA (eDMA)
peripheral for offloading the data transfer between PCIe bus and memory.

Let's add the support for it by enabling the eDMA IRQ in the driver.
Rest of the functionality will be handled by the eDMA DMA Engine driver.

Since the eDMA on Qualcomm platforms only uses a single IRQ for all
channels, use 1 for edma.nr_irqs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index cd378ce58b22..ea350bb2660d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -74,6 +74,7 @@
 #define PARF_INT_ALL_PLS_ERR			BIT(15)
 #define PARF_INT_ALL_PME_LEGACY			BIT(16)
 #define PARF_INT_ALL_PLS_PME			BIT(17)
+#define PARF_INT_ALL_EDMA			BIT(22)
 
 /* PARF_BDF_TO_SID_CFG register fields */
 #define PARF_BDF_TO_SID_BYPASS			BIT(0)
@@ -395,7 +396,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	writel_relaxed(0, pcie_ep->parf + PARF_INT_ALL_MASK);
 	val = PARF_INT_ALL_LINK_DOWN | PARF_INT_ALL_BME |
 	      PARF_INT_ALL_PM_TURNOFF | PARF_INT_ALL_DSTATE_CHANGE |
-	      PARF_INT_ALL_LINK_UP;
+	      PARF_INT_ALL_LINK_UP | PARF_INT_ALL_EDMA;
 	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_MASK);
 
 	ret = dw_pcie_ep_init_complete(&pcie_ep->pci.ep);
@@ -744,6 +745,7 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	pcie_ep->pci.dev = dev;
 	pcie_ep->pci.ops = &pci_ops;
 	pcie_ep->pci.ep.ops = &pci_ep_ops;
+	pcie_ep->pci.edma.nr_irqs = 1;
 	platform_set_drvdata(pdev, pcie_ep);
 
 	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
-- 
2.25.1

