Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9566A781E30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjHTOZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbjHTOZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:28 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B383C24
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bbac8ec902so40000281fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541247; x=1693146047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KEkYqMdAbHMi6vBV67jxZzP8Kyhh1PgadXNVXNLmeY=;
        b=DNVYSp0AZPp1UvlVDfamWDHLPRJT89lfGtsYjs5dAPnp1A+AAqfouccm6xpwuwAciJ
         eB4nXNVE25h1H17nsU1jHzJ803r60GhDHFMfi77SBOzm2j3a7srrRciJkKPwDr4gtLjv
         uGmMP5q7B/AYa6BswGecWMixaquPiqUgQ/FYdpOFHyjY9D+gzsZ21qtfcs4bkDKHxUhB
         XZO7kyOpumYzHKO6Zj6iOmVr5WzE1JLLtN9kWzbsvnZgykjlDSVATHgMo5szkfBjGEEX
         Ayt8D8IQlCTsGv3h9EylG7OWyY3Jx2Cmwz/v+l8/KirTr5tlJxia1p9yZMNytbmyybl4
         piYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541247; x=1693146047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KEkYqMdAbHMi6vBV67jxZzP8Kyhh1PgadXNVXNLmeY=;
        b=fWiPCMKB016v9XKd3oJU6YWfgPZiRpJVnLyxP04wzAP5e19m1xoo1ZCCgUyQhTlSnq
         rcGElw50UZodMyinnw5tBwgWTRLsHVZHjUpsr7vWUMrcmA5N11yl/Yu5G3IhIfu635on
         X1H3h24EBtUrpB/qGhke64k/DWv7cxVm+kdWC2L9Cml5NB3+Dg9TB6qXiWO402E4fKdB
         QpsvOokCHXe0bdtv5pGC6ssPdsnu389/fL1YVAqEIlXw7YbvB0hMXeNpYLVFJF7DsLGB
         sCzlGLvu4Va4h306qDP9khXUkt8n+FlqvIErlmwddTxOLLvJtna/8bkRRG3onolEFW/z
         iHKg==
X-Gm-Message-State: AOJu0Yz7a6UabF5OFE2ct7rGkAv6pPkKCgoWm1eo9BCvCQATF+tWx4+H
        yi01mCOcrhQN2khB5VWHGLWYLA==
X-Google-Smtp-Source: AGHT+IEDpAOGnWOCyXhtuGfBwaX5JxmJIJdpvQqLnwsebfsP4dQLPL6xqWOhj0mjIQ6BOYTeYwS7RA==
X-Received: by 2002:a2e:920b:0:b0:2bb:94e4:490 with SMTP id k11-20020a2e920b000000b002bb94e40490mr3241832ljg.23.1692541247186;
        Sun, 20 Aug 2023 07:20:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:46 -0700 (PDT)
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
Subject: [PATCH v3 12/18] arm64: dts: qcom: sc8180x: switch PCIe QMP PHY to new style of bindings
Date:   Sun, 20 Aug 2023 17:20:29 +0300
Message-Id: <20230820142035.89903-13-dmitry.baryshkov@linaro.org>
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
resource region, no per-PHY subnodes). While we are at it, rename PHY
nodes to `phy@`.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 148 ++++++++++----------------
 1 file changed, 55 insertions(+), 93 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index e058b0cf84c0..1277bca49653 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1749,23 +1749,28 @@ pcie0: pci@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_lane>;
+			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
 		};
 
-		pcie0_phy: phy-wrapper@1c06000 {
+		pcie0_phy: phy@1c06000 {
 			compatible = "qcom,sc8180x-qmp-pcie-phy";
-			reg = <0 0x1c06000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c06000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
-				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+			#clock-cells = <0>;
+			clock-output-names = "pcie_0_pipe_clk";
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
 			reset-names = "phy";
@@ -1774,21 +1779,6 @@ pcie0_phy: phy-wrapper@1c06000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie0_lane: phy@1c06200 {
-				reg = <0 0x1c06200 0 0x170>, /* tx0 */
-				      <0 0x1c06400 0 0x200>, /* rx0 */
-				      <0 0x1c06a00 0 0x1f0>, /* pcs */
-				      <0 0x1c06600 0 0x170>, /* tx1 */
-				      <0 0x1c06800 0 0x200>, /* rx1 */
-				      <0 0x1c06e00 0 0xf4>; /* pcs_com */
-				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				clock-output-names = "pcie_0_pipe_clk";
-				#phy-cells = <0>;
-			};
 		};
 
 		pcie3: pci@1c08000 {
@@ -1856,23 +1846,29 @@ pcie3: pci@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_lane>;
+			phys = <&pcie3_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
 		};
 
-		pcie3_phy: phy-wrapper@1c0c000 {
+		pcie3_phy: phy@1c0c000 {
 			compatible = "qcom,sc8180x-qmp-pcie-phy";
-			reg = <0 0x1c0c000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c0c000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_3_CLKREF_CLK>,
-				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_3_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+			#clock-cells = <0>;
+			clock-output-names = "pcie_3_pipe_clk";
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_3_PHY_BCR>;
 			reset-names = "phy";
@@ -1881,21 +1877,6 @@ pcie3_phy: phy-wrapper@1c0c000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie3_lane: phy@1c0c200 {
-				reg = <0 0x1c0c200 0 0x170>, /* tx0 */
-				      <0 0x1c0c400 0 0x200>, /* rx0 */
-				      <0 0x1c0ca00 0 0x1f0>, /* pcs */
-				      <0 0x1c0c600 0 0x170>, /* tx1 */
-				      <0 0x1c0c800 0 0x200>, /* rx1 */
-				      <0 0x1c0ce00 0 0xf4>; /* pcs_com */
-				clocks = <&gcc GCC_PCIE_3_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				clock-output-names = "pcie_3_pipe_clk";
-				#phy-cells = <0>;
-			};
 		};
 
 		pcie1: pci@1c10000 {
@@ -1963,23 +1944,29 @@ pcie1: pci@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
 		};
 
-		pcie1_phy: phy-wrapper@1c16000 {
+		pcie1_phy: phy@1c16000 {
 			compatible = "qcom,sc8180x-qmp-pcie-phy";
-			reg = <0 0x1c16000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c16000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
-				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+			#clock-cells = <0>;
+			clock-output-names = "pcie_1_pipe_clk";
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
 			reset-names = "phy";
@@ -1988,21 +1975,6 @@ pcie1_phy: phy-wrapper@1c16000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie1_lane: phy@1c0e200 {
-				reg = <0 0x1c16200 0 0x170>, /* tx0 */
-				      <0 0x1c16400 0 0x200>, /* rx0 */
-				      <0 0x1c16a00 0 0x1f0>, /* pcs */
-				      <0 0x1c16600 0 0x170>, /* tx1 */
-				      <0 0x1c16800 0 0x200>, /* rx1 */
-				      <0 0x1c16e00 0 0xf4>; /* pcs_com */
-				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
-				clock-names = "pipe0";
-				#clock-cells = <0>;
-				clock-output-names = "pcie_1_pipe_clk";
-
-				#phy-cells = <0>;
-			};
 		};
 
 		pcie2: pci@1c18000 {
@@ -2070,23 +2042,29 @@ pcie2: pci@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_lane>;
+			phys = <&pcie2_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
 		};
 
-		pcie2_phy: phy-wrapper@1c1c000 {
+		pcie2_phy: phy@1c1c000 {
 			compatible = "qcom,sc8180x-qmp-pcie-phy";
-			reg = <0 0x1c1c000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c1c000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_2_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_2_CLKREF_CLK>,
-				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_2_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+			#clock-cells = <0>;
+			clock-output-names = "pcie_3_pipe_clk";
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_2_PHY_BCR>;
 			reset-names = "phy";
@@ -2095,22 +2073,6 @@ pcie2_phy: phy-wrapper@1c1c000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie2_lane: phy@1c0e200 {
-				reg = <0 0x1c1c200 0 0x170>, /* tx0 */
-				      <0 0x1c1c400 0 0x200>, /* rx0 */
-				      <0 0x1c1ca00 0 0x1f0>, /* pcs */
-				      <0 0x1c1c600 0 0x170>, /* tx1 */
-				      <0 0x1c1c800 0 0x200>, /* rx1 */
-				      <0 0x1c1ce00 0 0xf4>; /* pcs_com */
-				clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				clock-output-names = "pcie_2_pipe_clk";
-
-				#phy-cells = <0>;
-			};
 		};
 
 		ufs_mem_hc: ufshc@1d84000 {
-- 
2.39.2

