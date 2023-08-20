Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6ED4781E3A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjHTOZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbjHTOZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:31 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 606FC4204
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:53 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso39520681fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541251; x=1693146051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eQmKcwqlABP7sbOZ3MAdBNQtcUV0kJSVTTA//1gMuM=;
        b=TX+x0Dl7v80fmtHVHJ8lm0DjjbI2sA0aAlOEn5CE+1QHVoxjPLX9dwcvPS9K55oSUc
         zv1DgnNPqWnInfcx8Xef+0EdR7AvMQd/MvgrHLfLwvVtq7eosWVlKFwcI5ygkae2zSbu
         9ZtjGT7zMFtedG42PikOSseglYUwFQQTnERe+xPzlaUDmOlr/jFBUhYYyLhixnVI9imO
         dOmXrJHCXn5AGXTYXnLvSt0sPr8wHBa3tzEfJ1pRaV07+Zq9xi88ZVv7rN1HJ/FiDwrK
         wa1uJmEF+57xxSTbIamKuO/3psmtamCB2vFNty9x3kLMMw8cNGCaiIS0OfzAd8UFBmmB
         o4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541251; x=1693146051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eQmKcwqlABP7sbOZ3MAdBNQtcUV0kJSVTTA//1gMuM=;
        b=YT5+EDwkABRCdgqK4LA8ke/Ym8v9nB7JCdBaoyHe9SLSQEenSrOsxrLXDEgv15ljbT
         kP9Y9v9fvRHmt77RchFW77HIKoFJLtaKjNwLl06/8eJ1J8JcfFQJjqkWnJq5+S5v7Qe1
         46LWUtR9rAC9I4NhFeOAHWX38QlzElON8/qT6nUtdkq2cKM7/vzovddemynh/Mmc1kaf
         wxR3K7gMa4p4+a4qk2gAIQvTYk7c1xs8L/v/ZIjdVZx8cAv3dacMDsFiwg3v0f3f3vtR
         I1cG/OeRWMtKhBz/W2AmhNE2AXefE+oGoiWh0A0ruGTDToJqEyGykVdygorLLJfj9HcQ
         +M4Q==
X-Gm-Message-State: AOJu0YxNzclri8DNCkZmk1iHOvebR4Y9KHBxVRKhGrxixM8ajdUneOKZ
        //dNE/JdZAZ29M+n5/hzZjfi2A==
X-Google-Smtp-Source: AGHT+IFAyRux9oO+B/eTVl699ECC8tI/+C8Uu2vNNuTyVSrCxDdUHDajXjS0931j6RhD9/5JysA5ug==
X-Received: by 2002:a2e:991a:0:b0:2b9:54e1:6711 with SMTP id v26-20020a2e991a000000b002b954e16711mr2882117lji.7.1692541251773;
        Sun, 20 Aug 2023 07:20:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 17/18] arm64: dts: qcom: sm8450: switch PCIe QMP PHY to new style of bindings
Date:   Sun, 20 Aug 2023 17:20:34 +0300
Message-Id: <20230820142035.89903-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes). As a part of this conversion also
change the "refgen" name to more correct "rchng".

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 82 ++++++++++++----------------
 1 file changed, 35 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8ccad9e00265..eafd867ee9c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -750,8 +750,8 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
-				 <&pcie0_lane>,
-				 <&pcie1_lane>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
 				 <0>,
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
@@ -1780,7 +1780,7 @@ pcie0: pci@1c00000 {
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_PIPE_CLK_SRC>,
-				 <&pcie0_lane>,
+				 <&pcie0_phy>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -1811,7 +1811,7 @@ pcie0: pci@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_lane>;
+			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -1825,15 +1825,23 @@ pcie0: pci@1c00000 {
 
 		pcie0_phy: phy@1c06000 {
 			compatible = "qcom,sm8450-qmp-gen3x1-pcie-phy";
-			reg = <0 0x01c06000 0 0x200>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c06000 0 0x2000>;
+
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_0_CLKREF_EN>,
-				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
 			reset-names = "phy";
@@ -1842,19 +1850,6 @@ pcie0_phy: phy@1c06000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie0_lane: phy@1c06200 {
-				reg = <0 0x01c06e00 0 0x200>, /* tx */
-				      <0 0x01c07000 0 0x200>, /* rx */
-				      <0 0x01c06200 0 0x200>, /* pcs */
-				      <0 0x01c06600 0 0x200>; /* pcs_pcie */
-				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clock-output-names = "pcie_0_pipe_clk";
-			};
 		};
 
 		pcie1: pci@1c08000 {
@@ -1894,7 +1889,7 @@ pcie1: pci@1c08000 {
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
-				 <&pcie1_lane>,
+				 <&pcie1_phy>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
@@ -1923,7 +1918,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
@@ -1935,17 +1930,25 @@ pcie1: pci@1c08000 {
 			status = "disabled";
 		};
 
-		pcie1_phy: phy@1c0f000 {
+		pcie1_phy: phy@1c0e000 {
 			compatible = "qcom,sm8450-qmp-gen4x2-pcie-phy";
-			reg = <0 0x01c0f000 0 0x200>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c0e000 0 0x2000>;
+
 			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_1_CLKREF_EN>,
-				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe";
+
+			clock-output-names = "pcie_1_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
 			reset-names = "phy";
@@ -1954,21 +1957,6 @@ pcie1_phy: phy@1c0f000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie1_lane: phy@1c0e000 {
-				reg = <0 0x01c0e000 0 0x200>, /* tx */
-				      <0 0x01c0e200 0 0x300>, /* rx */
-				      <0 0x01c0f200 0 0x200>, /* pcs */
-				      <0 0x01c0e800 0 0x200>, /* tx */
-				      <0 0x01c0ea00 0 0x300>, /* rx */
-				      <0 0x01c0f400 0 0xc00>; /* pcs_pcie */
-				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clock-output-names = "pcie_1_pipe_clk";
-			};
 		};
 
 		config_noc: interconnect@1500000 {
-- 
2.39.2

