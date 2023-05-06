Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8BB6F901A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 09:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjEFHcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 03:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjEFHca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 03:32:30 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F81611B54
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 00:32:11 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-643bb9cdd6eso192254b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683358330; x=1685950330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3aahhSvjykatbGenbflTiOGlibAhrS0dhFMwQB0VPM=;
        b=GxFQNpd05mDxAV0i9GMQOPTCgxqwLMZ+QK9AefNdLXF80KB5OghCE1RYK8vTXDPyCp
         sGqP0LDArubwzy0Gckf1gK+GiBxNS8vEBCtH7RYc5AmehMi8rNgDenMeXoTq8JvdjFFG
         QBfenFguebk02IJEAZCHHTm+SXLWdCEW8p08L+UiwTEX8Zh2sokw4If8lDoXFSfvID/g
         hN1DL/+mSc4aaxa+fSejtOXfuvx0IsZKDJZfOltyUJEXsh0haxlU763Vi1ZJQ+dS0bNV
         33JwolC7NdfzL5C6txOwkPBirgHiY5WJ++cxAP8jpTIJpx8/pnVHsqtRV7DfjK9Gas06
         MPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358330; x=1685950330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3aahhSvjykatbGenbflTiOGlibAhrS0dhFMwQB0VPM=;
        b=HbRxy/f5GmLpHVLT2cI78xT+PweSeMR4qi3xVLISscmH31DfTwGLZGePD8cgvGb9B2
         gJAyCPOhOh0HGiBwwjQcqOlwrW2Q62Qxq6Kns9X6Z1WGUQgABDlZztLUYABKq/dWBjRC
         rpBB67ulE3xaHAX2s3tzwYPmht7iDhTsMdxkyrdsEpsFbBFYyfPJ9yfRa4J1KSyW92XO
         CJAbYYmZQYL97Ur3ZlKBAc+OG8bt34N4cjmpHf9OISLGipoERCy5voh2PTMtErEfUmXi
         sYi9hbRyzYT0TWKbREkROc7yptkyLb6P/LTSXFQhhPL4lmFE0+1avMozZu637N8ge6gL
         /unA==
X-Gm-Message-State: AC+VfDyXVuomSnY6RbBP1xn6OBdqoz+o/grDIBxB/RiwHjTYMfH9DYcc
        y+Q8bF+8WCrajSv9N4LYuqt4
X-Google-Smtp-Source: ACHHUZ7Ap4SAy9+WUZiPqYq73TfFER0ITw2SNWk1WK3OGq9859vYq1So9FvwhZNybSn8DRpSoCM+yw==
X-Received: by 2002:a05:6a20:394d:b0:f2:5b9f:fe61 with SMTP id r13-20020a056a20394d00b000f25b9ffe61mr5361935pzg.34.1683358330410;
        Sat, 06 May 2023 00:32:10 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.87])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0062a56e51fd7sm2627373pfn.188.2023.05.06.00.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:10 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 6/8] PCI: qcom: Use post init sequence of IP v2.3.2 for v2.4.0
Date:   Sat,  6 May 2023 13:01:37 +0530
Message-Id: <20230506073139.8789-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The post init sequence of IP v2.4.0 is same as v2.3.2. So let's reuse the
v2.3.2 sequence which now also disables hotplug capability of the
controller as it is not at all supported on any SoCs making use of this IP.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 30 +-------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 33353be396ec..0c5e825c6360 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -697,34 +697,6 @@ static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
-static int qcom_pcie_post_init_2_4_0(struct qcom_pcie *pcie)
-{
-	u32 val;
-
-	/* enable PCIe clocks and resets */
-	val = readl(pcie->parf + PARF_PHY_CTRL);
-	val &= ~PHY_TEST_PWR_DOWN;
-	writel(val, pcie->parf + PARF_PHY_CTRL);
-
-	/* change DBI base address */
-	writel(0, pcie->parf + PARF_DBI_BASE_ADDR);
-
-	/* MAC PHY_POWERDOWN MUX DISABLE  */
-	val = readl(pcie->parf + PARF_SYS_CTRL);
-	val &= ~MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN;
-	writel(val, pcie->parf + PARF_SYS_CTRL);
-
-	val = readl(pcie->parf + PARF_MHI_CLOCK_RESET_CTRL);
-	val |= BYPASS;
-	writel(val, pcie->parf + PARF_MHI_CLOCK_RESET_CTRL);
-
-	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
-	val |= EN;
-	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
-
-	return 0;
-}
-
 static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
@@ -1280,7 +1252,7 @@ static const struct qcom_pcie_ops ops_2_3_2 = {
 static const struct qcom_pcie_ops ops_2_4_0 = {
 	.get_resources = qcom_pcie_get_resources_2_4_0,
 	.init = qcom_pcie_init_2_4_0,
-	.post_init = qcom_pcie_post_init_2_4_0,
+	.post_init = qcom_pcie_post_init_2_3_2,
 	.deinit = qcom_pcie_deinit_2_4_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
 };
-- 
2.25.1

