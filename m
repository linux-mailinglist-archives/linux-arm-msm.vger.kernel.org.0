Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E809269F7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 16:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbjBVPd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 10:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbjBVPd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 10:33:59 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1DD38B5F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 07:33:29 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id s15so3154443pfg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 07:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4e6XJvimzjayIq2V7Cw6k05l1eYQZOtV1NQM7gOwgU=;
        b=hc/0ExDqHBp6yqsX7IqrWw+7tV0Rgf/3zfN97gO83nbPY7XBsfNQ6W0nnoK12uYa/P
         1Dwx9ULAD5d6/rDoc3DYeEhGVcmXr0Qf9piCCF2RS6Fi7/uD1b7ZafNn0Rzp6+leQGCo
         eVu96IJVQ6ihIBC/U4DeSEIQ9EPT/eUdrX/4KlUqFGAVIofNkPJ/eKOu7L+sLJVdJWWB
         QVjkKA7I/Q+PO6NGT7uA3ELxItst/t1z1HmQDVltHcn1r4rIefkqpGoeMkmQF/MH9RO6
         qvSCia105WspwsmDSMBs7leaqvCfLyxlFjvXUNQKJm/hFLkBPACAu/mLBWk5Du0dhChl
         pSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4e6XJvimzjayIq2V7Cw6k05l1eYQZOtV1NQM7gOwgU=;
        b=lMIK6DdmkuCOrS1s7bLeALeMMnbfGWlgoK7vX9CtYCx7653xBEuOEIqCZ8jN+SA/xd
         COv+6ZARvNh7zBWdcUs1thnn07C6AYgYRYFE5PD+t5Eo047YZOz/OHVkw48C1DPJs1Ha
         uB0N5t5dHddotXQ8Q7l1cqpV7J6GJk6GuteIaSSprGl1Rlf+SBOkhh4IWdAmWXxBfB79
         Dj81KpsLyFsVvqOEktDFtQ4gJ32Fn7i0B3Zq62/+zyKPtGk3dY5xbIDCH5HxeGLn2frs
         3uAYSFZ3zv7OnAwdehVVE7GfxvRjac8Q1Rd5AiDl1FDkuZ5ICrB+lHPy42nVrmasPLCl
         BFMw==
X-Gm-Message-State: AO0yUKVISPlkiSAHaIK7/RNznxTE9mVHnihNmyq9o1EOArWL3bo/xsXn
        jqtEenBiukD1rG1rtYaoqMVO
X-Google-Smtp-Source: AK7set8V+18ixdqMsCw6Vz279XJTCqXYx+Iloje8RWLhufTW0y1tKLnBJDHeueSNrBUwzepJ80M4/g==
X-Received: by 2002:a62:1d4b:0:b0:5a8:a250:bc16 with SMTP id d72-20020a621d4b000000b005a8a250bc16mr6422800pfd.3.1677080008710;
        Wed, 22 Feb 2023 07:33:28 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.15])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b005ac419804d3sm5222482pfd.186.2023.02.22.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 07:33:28 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/11] ARM: dts: qcom: sdx55: Fix the unit address of PCIe EP node
Date:   Wed, 22 Feb 2023 21:02:45 +0530
Message-Id: <20230222153251.254492-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
References: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unit address of PCIe EP node should be 0x1c00000 as it has to match the
first address specified in the reg property.

This also requires sorting the node in the ascending order.

Fixes: 31c9ef002580 ("dt-bindings: PCI: Add Qualcomm PCIe Endpoint controller")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 78 +++++++++++++++----------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 93d71aff3fab..e84ca795cae6 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -303,6 +303,45 @@ qpic_nand: nand-controller@1b30000 {
 			status = "disabled";
 		};
 
+		pcie_ep: pcie-ep@1c00000 {
+			compatible = "qcom,sdx55-pcie-ep";
+			reg = <0x01c00000 0x3000>,
+			      <0x40000000 0xf1d>,
+			      <0x40000f20 0xc8>,
+			      <0x40001000 0x1000>,
+			      <0x40200000 0x100000>,
+			      <0x01c03000 0x3000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio";
+
+			qcom,perst-regs = <&tcsr 0xb258 0xb270>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLEEP_CLK>,
+				 <&gcc GCC_PCIE_0_CLKREF_CLK>;
+			clock-names = "aux", "cfg", "bus_master", "bus_slave",
+				      "slave_q2a", "sleep", "ref";
+
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell";
+			reset-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+			resets = <&gcc GCC_PCIE_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_GDSC>;
+			phys = <&pcie0_lane>;
+			phy-names = "pciephy";
+			max-link-speed = <3>;
+			num-lanes = <2>;
+
+			status = "disabled";
+		};
+
 		pcie0_phy: phy@1c07000 {
 			compatible = "qcom,sdx55-qmp-pcie-phy";
 			reg = <0x01c07000 0x1c4>;
@@ -400,45 +439,6 @@ sdhc_1: mmc@8804000 {
 			status = "disabled";
 		};
 
-		pcie_ep: pcie-ep@40000000 {
-			compatible = "qcom,sdx55-pcie-ep";
-			reg = <0x01c00000 0x3000>,
-			      <0x40000000 0xf1d>,
-			      <0x40000f20 0xc8>,
-			      <0x40001000 0x1000>,
-			      <0x40200000 0x100000>,
-			      <0x01c03000 0x3000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-				    "mmio";
-
-			qcom,perst-regs = <&tcsr 0xb258 0xb270>;
-
-			clocks = <&gcc GCC_PCIE_AUX_CLK>,
-				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
-				 <&gcc GCC_PCIE_SLV_AXI_CLK>,
-				 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
-				 <&gcc GCC_PCIE_SLEEP_CLK>,
-				 <&gcc GCC_PCIE_0_CLKREF_CLK>;
-			clock-names = "aux", "cfg", "bus_master", "bus_slave",
-				      "slave_q2a", "sleep", "ref";
-
-			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "global", "doorbell";
-			reset-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
-			resets = <&gcc GCC_PCIE_BCR>;
-			reset-names = "core";
-			power-domains = <&gcc PCIE_GDSC>;
-			phys = <&pcie0_lane>;
-			phy-names = "pciephy";
-			max-link-speed = <3>;
-			num-lanes = <2>;
-
-			status = "disabled";
-		};
-
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sdx55-mpss-pas";
 			reg = <0x04080000 0x4040>;
-- 
2.25.1

