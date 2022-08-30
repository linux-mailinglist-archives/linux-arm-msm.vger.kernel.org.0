Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299695A68FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 18:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiH3Q7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 12:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbiH3Q7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 12:59:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D2BB9FAA
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:58:59 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mj6so6669407pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cXVSIoAXy4k6GvjO7JA/nhvOJMAK8QRnMR9+cTCkOGs=;
        b=F4+Mue9z8/NIh0/+GyY0e1oPUlENhniRHuhgypYQDNG726pVNN9PqSm0K9SII7gpmW
         CnTBN3cXEHt8anqhFTIaybBZcnVpabrwDqr6mStCTpsoGan5/mUAgYkNRAdib1/sb9Pe
         sT7yBAPlpoZFu+hXmRCqH7FrOlfCObGN7G8+d/zSHgHuAbV9LSZSn6trx0qiiKE+CQyJ
         NrkBTa+dhvfcQk0Mw68TxLWCSSSkcRegu3a+VZ89gLktL/mRNc2P4d4lT8PU+u6bbaOJ
         yyDFWju7dO7pJrfmFpNSs1VWvLZYplYUnkY9ZoidMR0YRK+Z3LbNl2mg5hUpwV3VA4Di
         dAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cXVSIoAXy4k6GvjO7JA/nhvOJMAK8QRnMR9+cTCkOGs=;
        b=xsvYrGArIJ7IsInc7WgoA3ZTu1PrNdkxTc3hBpRoLzCCR9e2kMDc2apD7i+31iiLRs
         L80mAXaUA9dasLs/UeTnog3vjBnTN5xTXAlukbHDBjl0u1BPKh95ELPDtg/9RvO5CKa8
         r8eBiCCO4eZncVbNhLNw2LzWbK/0JkqtjRGhFXxu4IzVo37xx6Z0l1rsSnGhJcc8LMo2
         DRX7O4ghOMD+9+ZxsqN4Oa1SAXnBRZDgK7pIcdhQKMG7HUViVeVdhuTAwZrXTZ8UztJ7
         Dv/zKS9Ma7NVCghRDwcCHlElzh92QMDEyqCWtUgEGb22q6UspLaM+Y7UWFwpT3kYy5MO
         yXQg==
X-Gm-Message-State: ACgBeo01QNHOqN9T1R8ILPAch49CtA6b7TpSBRZelEtZoov13g2qdU91
        Rx0A5FcwxOiu8pObBis/qAGR
X-Google-Smtp-Source: AA6agR6OpJc0TAmDAvBCfMYtPNFVC1gjNXQxUiq1H+/Y8Gzp6uHO29zaPd5s51mVRE7Jt2R0MdqJ1Q==
X-Received: by 2002:a17:90a:318f:b0:1fa:a374:f565 with SMTP id j15-20020a17090a318f00b001faa374f565mr24569940pjb.146.1661878739057;
        Tue, 30 Aug 2022 09:58:59 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id n59-20020a17090a5ac100b001f510175984sm8841261pji.41.2022.08.30.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:58:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 03/11] PCI: qcom-ep: Make use of the cached dev pointer
Date:   Tue, 30 Aug 2022 22:28:09 +0530
Message-Id: <20220830165817.183571-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
References: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
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

In the qcom_pcie_ep_get_resources() function, dev pointer is already
cached in a local variable. So let's make use of it instead of getting
the dev pointer again from pdev struct.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 34c498d581de..1e09eca5b3b2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -483,7 +483,7 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
 
 	ret = qcom_pcie_ep_get_io_resources(pdev, pcie_ep);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to get io resources %d\n", ret);
+		dev_err(dev, "Failed to get io resources %d\n", ret);
 		return ret;
 	}
 
@@ -505,7 +505,7 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
 	if (IS_ERR(pcie_ep->wake))
 		return PTR_ERR(pcie_ep->wake);
 
-	pcie_ep->phy = devm_phy_optional_get(&pdev->dev, "pciephy");
+	pcie_ep->phy = devm_phy_optional_get(dev, "pciephy");
 	if (IS_ERR(pcie_ep->phy))
 		ret = PTR_ERR(pcie_ep->phy);
 
-- 
2.25.1

