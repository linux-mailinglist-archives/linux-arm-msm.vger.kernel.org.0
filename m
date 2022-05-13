Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208EF526850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 19:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382970AbiEMR0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 13:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382978AbiEMR02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 13:26:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC368703EC
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c24so6183496lfv.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E58QkXjEx+u+32umtNZ3ENARtSCSgYwXJPH8+EbS+fs=;
        b=Lm6zs/yxioiFsXlF8nqx/z8MAdva/7ozdJZ6sGkbwjFLACq885mg+xGbkEQBfLv/7v
         3q9y5xa+82tV/chQtBSZ3OwRxkxX0m/LW2SHrXQcYDAYe14BLNAePqAOOVkhhiB8z3Md
         X2QjxUnWIGOjL5HyJELeBTzoGsCTaNH3slJ3X2iQ1L9FEOvYSlzskqtVkvMwM5PZ+5NT
         7r7RxFvNJNdoH0Atg07Sv9IdHef6anf2rxbYjjEZMCkcFi8ayt2UOW24aktNu1pmGT4S
         GgAUa5Gtq69unYcun64T5CR4FGYPApDV5M4Vh+af8bjRSkgqDolwSZtZ+vCq2mjVE9A/
         okIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E58QkXjEx+u+32umtNZ3ENARtSCSgYwXJPH8+EbS+fs=;
        b=L4vmkbeVrdoEQ8073TsikMdDHCC/vt6+7fqphXHmOkdQ3jHQ4Qz4p0he1TPD9tbmGq
         AKeKOPdN/94Esl3PM1QR3t9bSv4oprr/pf7ZriYEhw76WzfAPFKw06BNmQ1Sta0KwfMk
         0R22T9jhfs4bEUQ1gehVIWq/kAcSJxcWiJrsmORvDJ7uY0+pPXQZHcsOVNan+QoVcO/5
         JmCxRaG+K6tgFJGjkwgzx+IjuFPQKWxwy2436s/F8UGRtpN9Wv7viIo1GCx4uJcBjwRU
         mlvYAOfqDOxLWB5bs4M8Bh37NKYSZvAEBoVv7ED/1TbJX+RLEbkoIZoEbBdo3OrFoSA2
         yEUQ==
X-Gm-Message-State: AOAM5330R7JBE69Qp+mLYxO1DifMAk/k3UCwpGlssbbvpO9iMgi5xl52
        UJmRXf5Yk8VfkXBjbzC9ZRrcLg==
X-Google-Smtp-Source: ABdhPJzCtGnUY5TE8KjHWieVRuHQgBTLpyGz37aAmDH3+fns1wP2vwBPFqeFW2Qqx+D1FmES8dKQLw==
X-Received: by 2002:a05:6512:1287:b0:473:b904:b27c with SMTP id u7-20020a056512128700b00473b904b27cmr4068552lfs.361.1652462785207;
        Fri, 13 May 2022 10:26:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e8183000000b0024f3d1daec0sm511157ljg.72.2022.05.13.10.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 10:26:24 -0700 (PDT)
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 02/10] PCI: dwc: Propagate error from dma_mapping_error()
Date:   Fri, 13 May 2022 20:26:14 +0300
Message-Id: <20220513172622.2968887-3-dmitry.baryshkov@linaro.org>
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

If dma mapping fails, dma_mapping_error() will return an error.
Propagate it to the dw_pcie_host_init() return value rather than
incorrectly returning 0 in this case.

Fixes: 07940c369a6b ("PCI: dwc: Fix MSI page leakage in suspend/resume")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 2fa86f32d964..a9a31e9e7b6e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -396,8 +396,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 						      sizeof(pp->msi_msg),
 						      DMA_FROM_DEVICE,
 						      DMA_ATTR_SKIP_CPU_SYNC);
-			if (dma_mapping_error(pci->dev, pp->msi_data)) {
-				dev_err(pci->dev, "Failed to map MSI data\n");
+			ret = dma_mapping_error(pci->dev, pp->msi_data);
+			if (ret) {
+				dev_err(pci->dev, "Failed to map MSI data: %d\n", ret);
 				pp->msi_data = 0;
 				goto err_free_msi;
 			}
-- 
2.35.1

