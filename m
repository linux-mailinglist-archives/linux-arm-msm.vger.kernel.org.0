Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518DE524AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352818AbiELKq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352788AbiELKp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:45:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA8D7644
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:45:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u23so8324928lfc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sp0z0zbzm124r5VzMcThZA6X8OsGv4Biu665CesrsB8=;
        b=yHy8lDcaESw+p0BnPn5Wp8D+IXqpJLy+cudlOlL8rZlbcbrPYSwExMt3dNzEvQEoik
         kSYap/CQOsBLJCCGSWRfqEr1A+T3dH0U+iIWOJB1hxl9d+E71PC9CUbEHYwPEwWMvwwT
         I1DXyz262smDl19xwFJgEj80jS75/1fd3O+yiZcIHriA4+W/S2/P78lzCaWpsUDV5/Zv
         ZDp/2XL7vSoDXgzsj0hwiNFkhDBrnbWWkQKEhcVQyKhVvHTI1El8gTCejTas2JgrFHGz
         B+5sTdR46jLZPbpx1upviZmXycW7yFZr72Q/Ps4ZxJJ4K571+7g+2O/TJz9FYWEyD4hw
         /bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sp0z0zbzm124r5VzMcThZA6X8OsGv4Biu665CesrsB8=;
        b=g7Z34uUltl8qEZEwoKx1VzmGd+m5mecDWLnvThVfLQNyNX6b2/sQT857Ehum+Pe6w6
         cKbq0GCYgXUCrKcETeiIVgCZ6aUNtmFeIFuRAm6mwXlhWemBpQt4tRKtcWW5ANFGaPJe
         W3VOo0t4puofcvAJtfNWIMucbQNpuvShxMPidlmyMmzFkmQboPxQWGqqVHXtfJ96Zg1N
         yqs0HbGzdKUj5yW1WkEgFfwJL4bmZ6u1wTO7NumXI+zzX2O+oWHeY6VZqkS4Y0ITB6aK
         69SYlpuuFINt/mNLYMSTTQLMZX6To6dT1H9d/e7fgMDikvLeof1xmF2KpMEK/VsVhnLB
         e3Ug==
X-Gm-Message-State: AOAM5311xJ2XCkD2y/QV4mBfBtWI0eTV1sLdkn3IdVnIktsbrcaG1kuV
        yxZ/WAup3oy8qxt4olOv/SI7nA==
X-Google-Smtp-Source: ABdhPJzBpQHNvP4008PtJVbgzpPEj2bON4D+wPPw5TC2qmcWG8mUhSWcM4scaj6nAOn5L+oCfczt7g==
X-Received: by 2002:a05:6512:b07:b0:473:c26a:7095 with SMTP id w7-20020a0565120b0700b00473c26a7095mr23941683lfu.603.1652352347236;
        Thu, 12 May 2022 03:45:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q21-20020a2e9695000000b0024f3d1daeafsm831660lji.55.2022.05.12.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:45:46 -0700 (PDT)
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 01/10] PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8 endpoints"
Date:   Thu, 12 May 2022 13:45:36 +0300
Message-Id: <20220512104545.2204523-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512104545.2204523-1-dmitry.baryshkov@linaro.org>
References: <20220512104545.2204523-1-dmitry.baryshkov@linaro.org>
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

