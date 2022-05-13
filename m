Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7FD52684E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 19:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382442AbiEMR03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 13:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382970AbiEMR01 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 13:26:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1830703DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b18so15639609lfv.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lFsusYv3a39AFVrKGs8AUQpmcs9BSd1N8sKJb+8VaT8=;
        b=WBfoYsdfMzXU2kGfudqa/v0jxVqo9JOrRsaY5HkekmUGEbhTBVmQzS/fp6dQ64SXjt
         hMPLy3pN4F73WoI8xWZrj46CMxbup33u3/xi6ST2olQvJOhpyy7xGss7ugqdU+Udr2Wm
         FM+8dbE69wjCjYsMqU75HBxNEjgNZgrUN1JTMZF/ESAF/sGYtFxjl3bYnrUyXQ0+K2tV
         9hLtNM+KOmHh7Ituu6Q+26CmrM+5jxrDReh5lVMMODvIerYm6gyHprgncimqWKT25xlR
         qxDkvBetbBQeZmXiB3piJCTzWqXeNm6NUsiHLVzQBiRhRRtq/ZkHHEgbMjpSXKJYLLhf
         +FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lFsusYv3a39AFVrKGs8AUQpmcs9BSd1N8sKJb+8VaT8=;
        b=TBE/YA/D2iSu67ITNAqwjKiCgzOsiSK+WnDk8Cl9M0SmE5rPLXlxKtpfP4q0DH+qGy
         XIqv/G7KMNHi3h1EymIOAmbdzqi6m/kNVOZOAF/7bPHpDeo3Cv2Hnev5EKS4PEI313Wy
         9Qtok//jPQ2sZLpgG5y+b37KElg0NAtS2x8adGsCgJoZ4tKMgegdo9uaHM8/Cirj8iTa
         wi/hLFH/fgR9Pc2FTSxZR53zCDfchnzLu7DO/ReHQza4yBpRV9NgxlYqEciRRAuOUx9x
         Ic8lfK2kngoSBSHO1xwNNUPUH4KRQ7n89FtDA82aC0eSKE0odGGU1XtWnwZnHXbYIcuY
         YgJg==
X-Gm-Message-State: AOAM533WSmPEuQyyeSlB1fANK3GNJRVyU2vM3tt7vLu6q77oVeP+7f4X
        i0U5R8eI2p0gwvDY6aceNnDXgQ==
X-Google-Smtp-Source: ABdhPJyXXi/FFYU6koUuAWjprgZAFDMa5RcEHpIS8ggoAd+Icwbqie+ygNH6DoHCp6qsbwCaYcGdyQ==
X-Received: by 2002:ac2:482f:0:b0:472:47d5:ef32 with SMTP id 15-20020ac2482f000000b0047247d5ef32mr4119383lft.344.1652462784312;
        Fri, 13 May 2022 10:26:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e8183000000b0024f3d1daec0sm511157ljg.72.2022.05.13.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 10:26:23 -0700 (PDT)
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
Subject: [PATCH v10 01/10] PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8 endpoints"
Date:   Fri, 13 May 2022 20:26:13 +0300
Message-Id: <20220513172622.2968887-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
References: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
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

