Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CF85262C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 15:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380623AbiEMNRD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 09:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380612AbiEMNRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 09:17:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CC8BC27
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:16:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u23so14491923lfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lFsusYv3a39AFVrKGs8AUQpmcs9BSd1N8sKJb+8VaT8=;
        b=A3179lU63szutmxhPvGslI9RJC7xFW3O4znMiwFdE9HbGhkQPHYLAURU0aVUwAOB45
         aZj5V872Ou5U9hHXnvxVyH73OxpCg1UJ8KX2RZiKbInwbU5VI5D8vP3HXX/s8a9KyaGT
         nz41YomRf7VwH6k9aKym80nM8Jlxmy21E3sIldeSkttS4+ivNNtzVjqfTp+ytcHYuM9U
         D3CY2erlpaCPiKYVtEa/3ZDWMQQ7WNdcop9XrXLse7ZLrqWe0zHuas7qBEsXGjYzeUE/
         H/mp4fGjCugJsGduHn0yRZYt8BoQHjyHDv0HTWv95/vHMoXqtc+Tf7iZ44g3WCkx09W/
         NkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lFsusYv3a39AFVrKGs8AUQpmcs9BSd1N8sKJb+8VaT8=;
        b=QuXBsVZEqPNHBtPFc+kL9EO1eQGhqpMVDqglwmwVGzJxE0h95l6DbJRAUD2bI8bVna
         UF7N1nat4c3B1ii0xT25w7r2U9AT/SJLrU1mgxYKwriuovo9vcgPPC6YW1HZja5S/SZo
         55tcUxe5cHE+jgXqpshs0J7LQ2zh9DT6NVqzb8trdzGejf7sNc2vJRxws+fVkn48dbc1
         HBSl/GTP7rsvuVZ3VUpnxoywaixMdqyZ63ZoXCpfyhvk9AUUISw785ztJxkEuYNGD3K8
         MBxzXJnDneU2yx70bRuhDg8ky/r5l+67/C8euZ33BQZbulpVPyopnqZaQByJpDVsiBQz
         UPaQ==
X-Gm-Message-State: AOAM531+HZsRbLY/TwhS1u4CETxDUVjOJ+CQH1j+ohMXutVodXvcnBiL
        3J9z7h8QkrSBHYVw1flStuZoLQ==
X-Google-Smtp-Source: ABdhPJyTmh7MD56QpxDuLJCZb27DBkeV4oCCjErOb9iEsu8weZ73LCEv6keKQQjgw8rx54H0jsYOxQ==
X-Received: by 2002:a05:6512:2215:b0:473:c124:434b with SMTP id h21-20020a056512221500b00473c124434bmr3498161lfu.24.1652447817796;
        Fri, 13 May 2022 06:16:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u22-20020a2ea176000000b0024f3d1dae8fsm436991ljl.23.2022.05.13.06.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:16:56 -0700 (PDT)
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
Subject: [PATCH v9 01/10] PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8 endpoints"
Date:   Fri, 13 May 2022 16:16:46 +0300
Message-Id: <20220513131655.2927616-2-dmitry.baryshkov@linaro.org>
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

I have replied with my Tested-by to the patch at [2], which has landed
in the linux-next as the commit 20f1bfb8dd62 ("PCI: qcom:
Add support for handling MSIs from 8 endpoints"). However lately I
noticed that during the tests I still had 'pcie_pme=nomsi', so the
device was not forced to use higher MSI vectors.

After removing this option I noticed that high MSI vectors are not
delivered on tested platforms. Additional research pointed to
a patch in msm-4.14 ([1]), which describes that each group of MSI
vectors is mapped to the separate interrupt.

Without these changes specifying num_vectors can lead to missing MSI
interrupts and thus to devices malfunction.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/commit/671a3d5f129f4bfe477152292ada2194c8440d22
[2] https://lore.kernel.org/linux-arm-msm/20211214101319.25258-1-manivannan.sadhasivam@linaro.org/

Fixes: 20f1bfb8dd62 ("PCI: qcom: Add support for handling MSIs from 8 endpoints")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index f9a61ad6d1f0..2e5464edc36e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1587,7 +1587,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
 	pp = &pci->pp;
-	pp->num_vectors = MAX_MSI_IRQS;
 
 	pcie->pci = pci;
 
-- 
2.35.1

