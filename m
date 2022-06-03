Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E71953C670
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 09:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242614AbiFCHln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 03:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242474AbiFCHlm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 03:41:42 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6878C3703F
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 00:41:41 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id l18so284637lje.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JPW5UrM16VIb0V7/sU8bftbljN5lwsuQwzROP9bFs3c=;
        b=CW2YUeh55xKh9tEpj2fpTZon1srKMhV5Y8R+otNWuBwhLtz5YmeAaPc+IJ6P0g6d6R
         JRpMU2QOm9xgQU6tmXzq7wxbubQthkRTEtt9E/mSvkd4w98sD5SnrlKq6DNIkKsHYNDW
         LM6kV9ekwrTDglmodQTigYt6AN1IISu581SvcRy2AcNGUs0nvv+VdvUTy918hBXITKgn
         bY3V82C6oBdSN68E4PGu47xCezs/fAKZPnvpMBQ7Waz50h1QKhNhTXK9qrB8SLK1FJKI
         YOuBa7003mqJ+imIa6R+uNm5btZEaNvRESbSkpwUu9VDN40z6RCRF+J+9NCTj9C1CNzT
         0ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JPW5UrM16VIb0V7/sU8bftbljN5lwsuQwzROP9bFs3c=;
        b=JLaQBSJ7xPQEai5ad9w7mfVAE5QVdhhnRyRbzDjF/YEdjFXaoSNaqqRGwowOmp3xSu
         RnKiBoZsdYd4z7osfrNw8fJdI8GyRZxW87Zf2RzzptnnwaASrHO39DOsvaZJ2pkN8VON
         OLSbAEIOvZPGZX7w40RDRXMx9Yt7toACClRpX0yY3sHBTnicodGKUz36Den80HNq3f7q
         YzH7joseYLXY0zofc9flxLMQBrjmmjg+D2dc8MaWXhIbcXl7hZcD30RyU1rg/K1l5sBu
         Dze2shRMVBcu0RM8mjlaO6rYZqnZVVWi3kr7AFYhJyzBkxSyXjRps3u1AhQoND54Qaao
         oieA==
X-Gm-Message-State: AOAM530YXECwE52CHaotkhR2FcP2QEA+XbW+Zzfaz+oCWvPVwCp9R/2Q
        7CZiP6mTuyxJl5np5ModAwKXbA==
X-Google-Smtp-Source: ABdhPJwuFq1roF4qS46U2um4SppmLIQ9dVmJKUpdrNyrjljp0GBwZTLaCbas0Fhiv+nTYmI+fKcrWg==
X-Received: by 2002:a05:651c:901:b0:255:7340:fd04 with SMTP id e1-20020a05651c090100b002557340fd04mr4437857ljq.50.1654242099678;
        Fri, 03 Jun 2022 00:41:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6-20020ac24886000000b00477b11144e9sm1450023lfc.66.2022.06.03.00.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 00:41:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v13 1/7] PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
Date:   Fri,  3 Jun 2022 10:41:31 +0300
Message-Id: <20220603074137.1849892-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603074137.1849892-1-dmitry.baryshkov@linaro.org>
References: <20220603074137.1849892-1-dmitry.baryshkov@linaro.org>
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

The subdrivers pass -ESOMETHING if they do not want the core to touch
MSI IRQ. dw_pcie_host_init() also checks if (msi_irq > 0) rather than
just if (msi_irq). So let's make dw_pcie_free_msi() also check that
msi_irq is greater than zero.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9979302532b7..af91fe69f542 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -257,7 +257,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 
 static void dw_pcie_free_msi(struct pcie_port *pp)
 {
-	if (pp->msi_irq)
+	if (pp->msi_irq > 0)
 		irq_set_chained_handler_and_data(pp->msi_irq, NULL, NULL);
 
 	irq_domain_remove(pp->msi_domain);
-- 
2.35.1

