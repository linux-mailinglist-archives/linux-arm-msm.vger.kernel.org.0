Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05AF5B825E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiINHyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiINHyb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:54:31 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6DE73321
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:25 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id y127so14120135pfy.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xK6rQZk9RPmXG6rMhe5oBA83BpczBJE39eGNhUm9qAw=;
        b=eyCp0nexB3UmAfcdR3XWqu7f1E63DpnHWURGP0djm9lVIERmy+zhUEaipxpBzDxi5T
         TlXOUZuT5FOF3S56Wn8dfKGJzUmUng8wKJfah7s1EGe/CEBOy6T7QLD1unO+9zjL0YRk
         TdFN2pj6zNeONQPUR9rLI87Yyu4H2ms/528+iixQjZ4u8gTGDxMhsv2CRauCna7PdtoR
         OIrFI3TphvaRon5hch1jNEsGbzGjsI2Ax9Dhc/ST96qmjkxAIkiyTTkBTfI7vhWTM2Is
         GbNZcoDijA3FFkHZOaadeV8NplXr9BlV3WecY7FtKk0+NZiKC0ye0mffUyiCD0CL1x8S
         ZJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xK6rQZk9RPmXG6rMhe5oBA83BpczBJE39eGNhUm9qAw=;
        b=ToMy+fNU2ycmLr6S1mM3UFBpUjRXc+P7UC7OMSAMDwIs3RJSkancAR7G9N0LCNC1Mx
         loKFnX42uIJ0vRM8q7hvZETsquy1zaCus6QlDRNDU2N9cCi8YsVzG3NQ376KAIkG3p2o
         clilBSDrVw6rkhDbxoJXusqIOUomB5JjMqHecbrvCSTpO/F16c7AhS3jBWkx8k9aC/T+
         31oznNatVZZ+N8g38yR3wdfQXhbzc3jigMDSqUN5gJGvl/HHIAZn8FaSq10hLlo9HhrG
         WdyYFk25Yn8xFnmxE3o7aJhMrrp7CaSJzB9dhTQbu0NWdGlcxwgZMiO6DmaMMwM4RMUX
         H2og==
X-Gm-Message-State: ACgBeo1famv2fDgZeAFg4v7doDSplLEuUo3lLYMgx5FTBJpOcPrs+9oj
        Rb7QIOesH+4v4nMch0TUbVPY
X-Google-Smtp-Source: AA6agR6UN2GaGwQkQaxHTI5RSgoMjt5QB04yrPyARGzGLJF0Fi1c6KMWK6Q792VB0qXpbF13n9OE3A==
X-Received: by 2002:a05:6a00:e1b:b0:537:7c74:c405 with SMTP id bq27-20020a056a000e1b00b005377c74c405mr36025101pfb.43.1663142064806;
        Wed, 14 Sep 2022 00:54:24 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:54:24 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 04/12] PCI: qcom-ep: Disable IRQs during driver remove
Date:   Wed, 14 Sep 2022 13:23:42 +0530
Message-Id: <20220914075350.7992-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
References: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable the Global and PERST IRQs during driver remove to avoid getting
spurious IRQs after resource deallocation.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 1e09eca5b3b2..72eb6cacdb3a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -585,11 +585,11 @@ static int qcom_pcie_ep_enable_irq_resources(struct platform_device *pdev,
 {
 	int irq, ret;
 
-	irq = platform_get_irq_byname(pdev, "global");
-	if (irq < 0)
-		return irq;
+	pcie_ep->global_irq = platform_get_irq_byname(pdev, "global");
+	if (pcie_ep->global_irq < 0)
+		return pcie_ep->global_irq;
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+	ret = devm_request_threaded_irq(&pdev->dev, pcie_ep->global_irq, NULL,
 					qcom_pcie_ep_global_irq_thread,
 					IRQF_ONESHOT,
 					"global_irq", pcie_ep);
@@ -698,6 +698,9 @@ static int qcom_pcie_ep_remove(struct platform_device *pdev)
 {
 	struct qcom_pcie_ep *pcie_ep = platform_get_drvdata(pdev);
 
+	disable_irq(pcie_ep->global_irq);
+	disable_irq(pcie_ep->perst_irq);
+
 	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED)
 		return 0;
 
-- 
2.25.1

