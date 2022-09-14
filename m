Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3669A5B8251
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiINHyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiINHyJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:54:09 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6A272ECD
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:07 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c2so14324561plo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gbwg87hG3tf6Wqw8hsoPn0QdO74QME7etMAVFms+/pw=;
        b=ljDxR322JltyV7F/QZun8KlOd5owh+tpFy2pY0cKU+zKsqRc50k4t5cyHvkM6i0xo3
         pq6ZR06hgYFaJfAHniPKBC0tFQAX6jWo4BLBjC+8MwffaTfyY5mRtUoc2MLbKB+EemR3
         XspmcR19OZ0B02d8lswcBsROs4SX/Yp4UHWhPt1VDV8hJKZO0CJTBVHTL+Y+LZD6F7fi
         G+Ud256J3h+fp070+YqAApIwLDIWKyUOfr3OdFJWDpx/lA3BhIhRF6vNcokWCN+1LIfE
         d6UJRpyLQp2d9bP2FgYosUkCk7J9p7BjAKNrKP/gt+SYNUnjtuFO+FJJPbkkzDi2JYx2
         kktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gbwg87hG3tf6Wqw8hsoPn0QdO74QME7etMAVFms+/pw=;
        b=lA3aJb98z2VSQkL+zKyHJr0ExO9i15SR2ghURO2/4oH01H9bC5/D5lhITQDyesHPV2
         tt+7zVT1Yn1vnobXcZZ9ttP6tw5cV3O9KoAFX//1rzKIltNMn8Ddncao66v7o0scDa0J
         O61xfTGTfaKeKOmsAkeXELpH+J5Ciq0IobAKkCWNfMUHO7mO6FsvStyP4CdsUQJIOnjq
         Od4jxuv5277OTZhwPnso2yGaER+msScFy/KXmn2U5NXWSxlyOchBlQUcp0llOqfDIFqT
         HnrjvwI+P+RzEWTbf6vEyWPYb4SpwgC7gVzeYk1LLSTQNxhsgX2d/fxwPOQzvrefClnK
         oqlw==
X-Gm-Message-State: ACgBeo0gvJ/cD538N4QRcAHl8LNWMllD6QaV80xVaSAyFoDRCJooApId
        eSz6JTb0iY7TQ6X8S6ZncOqO
X-Google-Smtp-Source: AA6agR687zf0LoatHaeWiGH4w815XItAduyFQasakKnQ/p68K4peAppr3Gu0UF/br24Pcir9Gx0E5A==
X-Received: by 2002:a17:902:b217:b0:172:bd6c:814d with SMTP id t23-20020a170902b21700b00172bd6c814dmr35664854plr.55.1663142047255;
        Wed, 14 Sep 2022 00:54:07 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:54:06 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 01/12] PCI: qcom-ep: Add kernel-doc for qcom_pcie_ep structure
Date:   Wed, 14 Sep 2022 13:23:39 +0530
Message-Id: <20220914075350.7992-2-manivannan.sadhasivam@linaro.org>
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

