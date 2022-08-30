Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 546005A68F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 18:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiH3Q6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 12:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiH3Q6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 12:58:49 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3573FB3B2B
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:58:48 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id i7-20020a17090adc0700b001fd7ccbec3cso1928440pjv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gbwg87hG3tf6Wqw8hsoPn0QdO74QME7etMAVFms+/pw=;
        b=rGdcnEx5mVRMRbRAmSUEw4c5Jk5Kni1WJSvZVgMsW5hol47AAPyc8g+IcPBJ3Ngv+g
         Z/As66hGpY/53FTdpnikonp0vOM9xlBZDHGTkpeuCV4SRaCntxbe+VWpV/k2SMOEm6La
         34XAKW5/6F4EqnGdXGTOuqve0eJltrdu7qWqXwfsT+ygVNwyn8BFywzOX0FpMMEUMTOT
         lMhuy6aPUbZ1VxLym/YRrPqzQ2uo5GNf73m6O9ZAHB46GH7ph/v07GAylEEzFkoOVfm4
         E7VQTrQN4yNOVcCFcTGGwj/3fwkcFf8Xu0nGWBFNI2Ez9f1ow/28tAwgdb3ISBH1bw5w
         Sc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gbwg87hG3tf6Wqw8hsoPn0QdO74QME7etMAVFms+/pw=;
        b=KiwEWI/EHh2jqGz5x3f4Vss+2DX8EQI3c4owCfWYOJ6TyI4UVnIbpYQ0tXQ6T5X5hn
         FQiXsIGfCSXI9W1Bk10F99I/8sQ7CBf4XzCtb7uryFyF1GvsqxPTZRvqE0Lz/7VHp4JZ
         UOVH06OEOaVgowK+8sTF8Qcuqrcw1gzEv9OD9u3jMdh748nlHEfyquIDWlSFcz+LupsA
         Etstj1ODvLbsrSAJ9RUGMuhJb5ELsphNNMahS9d6ELtdc3U/i+zaKvNQnRfweha5jXhJ
         M0IZxUy0cmQEHI8N/2t8T00Wfmp21OPgiUmvAdF6cRwBYIbRwlehvm37w/7bVsFAnxKw
         nfyQ==
X-Gm-Message-State: ACgBeo10yq2NLRt4nlWBMqfGXXwW9fdMNplDY5YgyMx6eCI7rgkVTuy8
        aZcFNT/YHIkjzRol5ZuQr5Z6
X-Google-Smtp-Source: AA6agR4UB0bExNneHRVAvmaritzLE6hDn7Q0sJjqGFMq90N2ed65DimUyZzwRUKSnHX4Cx/U6I/2nA==
X-Received: by 2002:a17:90b:4f4e:b0:1f5:8a65:9192 with SMTP id pj14-20020a17090b4f4e00b001f58a659192mr23922544pjb.224.1661878727685;
        Tue, 30 Aug 2022 09:58:47 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id n59-20020a17090a5ac100b001f510175984sm8841261pji.41.2022.08.30.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:58:47 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 01/11] PCI: qcom-ep: Add kernel-doc for qcom_pcie_ep structure
Date:   Tue, 30 Aug 2022 22:28:07 +0530
Message-Id: <20220830165817.183571-2-manivannan.sadhasivam@linaro.org>
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

Add kernel-doc for qcom_pcie_ep structure.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 9f92d53da81a..27b7c9710b5f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -140,6 +140,23 @@ static struct clk_bulk_data qcom_pcie_ep_clks[] = {
 	{ .id = "slave_q2a" },
 };
 
+/**
+ * struct qcom_pcie_ep - Qualcomm PCIe Endpoint Controller
+ * @pci: Designware PCIe controller struct
+ * @parf: Qualcomm PCIe specific PARF register base
+ * @elbi: Designware PCIe specific ELBI register base
+ * @perst_map: PERST regmap
+ * @mmio_res: MMIO region resource
+ * @core_reset: PCIe Endpoint core reset
+ * @reset: PERST# GPIO
+ * @wake: WAKE# GPIO
+ * @phy: PHY controller block
+ * @perst_en: Flag for PERST enable
+ * @perst_sep_en: Flag for PERST separation enable
+ * @link_status: PCIe Link status
+ * @global_irq: Qualcomm PCIe specific Global IRQ
+ * @perst_irq: PERST# IRQ
+ */
 struct qcom_pcie_ep {
 	struct dw_pcie pci;
 
-- 
2.25.1

