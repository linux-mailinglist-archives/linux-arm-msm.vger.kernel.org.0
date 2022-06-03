Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD3453C67B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 09:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242620AbiFCHlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 03:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242645AbiFCHlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 03:41:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF1024B
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 00:41:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id l30so11345981lfj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 00:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lFsusYv3a39AFVrKGs8AUQpmcs9BSd1N8sKJb+8VaT8=;
        b=ixw28mMy3cuE9uN5yiyr9tWLypliH3/PjkIL2a7cNXIOP3hkqtNf8DpOd5Nitj3zsH
         svWgzJ2nDzKrA+wbjZzf/G2zWbiQCu8xw9426CBpzfb0HOr7rf1sAkZgr+lsNKG7oT0k
         4xleggXyL7PvWnKzt/+yVI/cw/1LxKlOmaORj+II8bvXYSXLWFOgWvbMjHPzEMYKCYrU
         zYNGrDrlbEag+fqe7+kY9AJkWC+1PhjS00SnhAFvCJpTKA+TWAlRNFaiG04QB7tntEoa
         e/looCZa7FOLM40cDzmV5WFIv79m6VaEqGHnfL+FZXnpZMlc3F/z7sX0r2tjoDz5wGV5
         PS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lFsusYv3a39AFVrKGs8AUQpmcs9BSd1N8sKJb+8VaT8=;
        b=FSMCcRNRfgMRl3QOsjcFWbnW2M0RiJJmlATUzXgDF3a9z741b9y/1u9n4s7iXcLzc0
         /NWyxgVbCaZ1InMB9LiM2fuHRmYGd84isHDog8ZUKDABfnZzOKZQo7koaXijgEWapulq
         u+YNUhgg7D4Xo4HrgJxXHHmK1jVZSDcGp3fQw78+5Y371BzCMqpjTbDm2M5wS0zQgvNo
         ty0srZIGLc5q8cO7XuFNmxoZnqLnaQ7TCb/SBA4CJGMknTlT9ZKeemWqEH0juIm6YpDo
         iyNN+Qsr+k0gvNTJWfbLYWLfkgW6HGa6d6qP6G+gEybsyxNmRzCprS6Q3Xf68YmDHzh5
         0+JA==
X-Gm-Message-State: AOAM533rNZqMzvZZIkcklXZX4qWm5ODrYNV7abigivltO3+fd2mXXdBQ
        ZOF+kNRKltmLtogvGzEx19FIPg==
X-Google-Smtp-Source: ABdhPJxDXg09fNPT7NjiCzLfrFAat7DmabLDuWbgkBA/RQbgIf9Aknavt0hpzwzEn7vgd3NfamStPA==
X-Received: by 2002:a05:6512:1041:b0:478:afc6:5846 with SMTP id c1-20020a056512104100b00478afc65846mr5888616lfb.132.1654242105122;
        Fri, 03 Jun 2022 00:41:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6-20020ac24886000000b00477b11144e9sm1450023lfc.66.2022.06.03.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 00:41:44 -0700 (PDT)
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
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v13 7/7] PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8 endpoints"
Date:   Fri,  3 Jun 2022 10:41:37 +0300
Message-Id: <20220603074137.1849892-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603074137.1849892-1-dmitry.baryshkov@linaro.org>
References: <20220603074137.1849892-1-dmitry.baryshkov@linaro.org>
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

