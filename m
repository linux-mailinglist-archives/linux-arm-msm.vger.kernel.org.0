Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C8852686F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 19:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382984AbiEMR0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 13:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382987AbiEMR02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 13:26:28 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BD56FA35
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:27 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i10so15615445lfg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a4LZO7nOvZAxEv3sjVx7hc+qBpA6kJoq69HVRvs8naE=;
        b=k3Y66CivbUyamm6Dr6v/HU03UKOszTYwbwBUXFkmm+fk2c9leNznZWMLMujX84+zHA
         96w5IbPGL9/0+YlyAnk9VwBuX3yWxb0We6ZqF+YTzSGbP+BLzEjJ+IZRKnGMM+N+5KEu
         3/PcAR7Oa1WMzjcMyJh5HzVxuFy/4J2UWAfre3w7HaSKgcsnsgjmrjBCRAeShl0Rg80t
         DMbfu2E8WEaNCyQJR6aoJLCNm5rDIMgkI1SBHnF6UbmKkkm2qupRv+00LngXCoAViheX
         fxGjKtOUz7K1ODkYa3eXjYbW8T1vIxFtuiGrlniUUQeppHMyBhmGaJBp9n7p0GDZLW7u
         xR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a4LZO7nOvZAxEv3sjVx7hc+qBpA6kJoq69HVRvs8naE=;
        b=AJtX/I7/v22Rxtvlz8vZfGCaB/VRNB9NwuV9m4SoCyZUyVHpsVQ3GGK1VpAeGFOPFW
         hqfn3pnNfqVbfPwevyEwqy+oVQHPERvDPqa+Fsj96kXwhOdTDVxeCd87I2m/z0yPjmzA
         Qgt7LTjEFZ3LRgVy7EeVC9L/XpqatUFvWDlM87iv0YK/bCEFpaE1AzJTbwsjsApJWPDh
         gcwZcBd4flNymGG7N9eTxZWVDm10UlTZQcAlO2oyBUElEihnx4tdxZj38htcptqN/s7R
         hYKwk39vkbcT7sY06uu+rFCtK+6anZmytqScPF0+3KUxqNb4A1W91RefOrm50T6p2mM7
         T3og==
X-Gm-Message-State: AOAM531Z2QxsSeyPy3d7QOZC9oD2CO0808Ie8gMkScJf1QiwqhP6yvCW
        iYan7thrpbbU5c1HUvhN4Xr/tw==
X-Google-Smtp-Source: ABdhPJxft5/Gmt24JuHkLQ1pAIoIEz/IeE2IsMbsWOLImcNHqZXHToCqBrvdyUe0HUvMsjCGJytDbw==
X-Received: by 2002:ac2:5101:0:b0:471:fdd7:4c9c with SMTP id q1-20020ac25101000000b00471fdd74c9cmr4104550lfb.49.1652462786070;
        Fri, 13 May 2022 10:26:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e8183000000b0024f3d1daec0sm511157ljg.72.2022.05.13.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 10:26:25 -0700 (PDT)
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 03/10] PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
Date:   Fri, 13 May 2022 20:26:15 +0300
Message-Id: <20220513172622.2968887-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
References: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
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

The subdrivers pass -ESOMETHING if they do not want the core to touch
MSI IRQ. dw_pcie_host_init() also checks if (msi_irq > 0) rather than
just if (msi_irq). So let's make dw_pcie_free_msi() also check that
msi_irq is greater than zero.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a9a31e9e7b6e..1874a09fb8fb 100644
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

