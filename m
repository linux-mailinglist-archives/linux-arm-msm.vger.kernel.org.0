Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5FF51C18E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 15:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354470AbiEEN57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380131AbiEEN5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:57:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B200457980
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 06:54:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j4so7607280lfh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pL/05pqvORVzFnLhsNkYW/L7SMLwKtI/1exh83l2l2w=;
        b=jQEataUFYehZFKuBpC0Gz3E9yipeUz0SZBdPRI3nNgyeat4GnM6jty2bo58IoAaww7
         7aV3rEZK8Ya+19sr9CBmPRxibPzfWbBV1rBGXgLpcHNk+S/svRvzcB8UCdMCRUzDiIeL
         kz+r+60qkLty+utzifIgI++PKVi3OYh5AIpfCtMYh4WoqHSx4w+j4cfyzcXthcxYdFCD
         pLj6XqFhF9ei72DKTQf+xGacUfOamS9F1o+Zq77kVj9I1CfkZtGZJzp2b80ogYzVQ11z
         YWvSllX9lQHzhGZYFDLO4romGcbP6CCnU8MzIKks+3DKL7/Ld0WFOLHLAsHtSHEgQhlb
         NFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pL/05pqvORVzFnLhsNkYW/L7SMLwKtI/1exh83l2l2w=;
        b=ylDp1JR6doj65tcU8Zx2DfERKTweYHI/AtkOPGF7h2BCv2bdqyL2hHPEmpqVxgo5Ev
         4XM9+mP0liewySsO3erw+RNv/rx+NDEClJQ0v1YLgA5rAF5eX5ciAOknSHMHThBwkrHb
         fgfvrnVZDypVCLvQPjc5vWXohIcjrk7qefjFR6sptXIm2YCPwZvGgfKfwrELPJ8G0Z5n
         OoYiKa+9wjmoegdmdPD52WzosOaYzLvQtYNOGGT4VYhD7kUBHu1eKxfyNpCspMNBAmRa
         D2VGD1GC1oWDFjqj2DCaOr+GabvXmHxDH0ZcZMtPZq8tjgsFKIQ9zN8rSXL6a11pBmjX
         hHmg==
X-Gm-Message-State: AOAM531vDo3+7lNKsb9eMnDT+hhQycmjqhb40Flbyr4f25zE37KyCGmE
        9ffDHXFyC/2b0ZdHuWRL6oMLYOPSl9R3vg==
X-Google-Smtp-Source: ABdhPJy9qGb9q7C2jf6FXMV/2KhF7Ac5OXvpXKwl65U3UtqrET2ObAVXyb8Zh5T6/31j4t62qbE26Q==
X-Received: by 2002:a05:6512:3405:b0:473:a5e5:1659 with SMTP id i5-20020a056512340500b00473a5e51659mr9595315lfr.379.1651758848967;
        Thu, 05 May 2022 06:54:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z24-20020ac25df8000000b0047255d211ccsm221788lfq.251.2022.05.05.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:54:08 -0700 (PDT)
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
Subject: [PATCH v7 1/7] PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8 endpoints"
Date:   Thu,  5 May 2022 16:54:01 +0300
Message-Id: <20220505135407.1352382-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505135407.1352382-1-dmitry.baryshkov@linaro.org>
References: <20220505135407.1352382-1-dmitry.baryshkov@linaro.org>
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

I have replied with my Tested-by to the patch at [2], which has landed
in the linux-next as the commit 20f1bfb8dd62 ("PCI: qcom:
Add support for handling MSIs from 8 endpoints"). However lately I
noticed that during the tests I still had 'pcie_pme=nomsi', so the
device was not forced to use higher MSI vectors.

After removing this option I noticed that hight MSI vectors are not
delivered on tested platforms. Additional research pointed to
a patch in msm-4.14 ([1]), which describes that each group of MSI
vectors is mapped to the separate interrupt.

Without these changes specifying num_verctors can lead to missing MSI
interrupts and thus to devices malfunction.

Fixes: 20f1bfb8dd62 ("PCI: qcom: Add support for handling MSIs from 8 endpoints")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c940e67d831c..375f27ab9403 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1593,7 +1593,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
 	pp = &pci->pp;
-	pp->num_vectors = MAX_MSI_IRQS;
 
 	pcie->pci = pci;
 
-- 
2.35.1

