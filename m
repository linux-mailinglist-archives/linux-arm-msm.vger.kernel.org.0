Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063C56C75B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjCXCZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjCXCZ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F83F2A174
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y20so424456lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrAPrHlqbaz5KNW85zGQXYeTMD5LurW00f1l1dGybus=;
        b=xZIPIVNpjbiX36w+OFtr65RU55lZWXXk+ryuGrPpYrbTW8LE/98qpw7qTut0YFN4Tf
         fI8F7qbh3a2FjatSM/skX7tN15RPiLIox2gWAj9h/+sC6EmCpQ001kOETjfxqMQdrfGs
         pnf/dDEdMkdxKZlQgDRHqqSkzK40xkLKqHOj/R38Lq9F6EtJe6wunhN8LFh3uQglQ88h
         KfJJB+s0fjbVDTHbDLxWOSTkYiPqssGzl4U61Hu14/ZvlXxc+Ggu1RdMxOlscNBr5g7z
         Qk0ML+oHXaEi1/t71Ss/u7yUAdoe4U/Sdq3Q5/gTwUA4hUU2IfuZiJ73EozbFrXHFhcq
         8TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrAPrHlqbaz5KNW85zGQXYeTMD5LurW00f1l1dGybus=;
        b=BSpYsirUNq8nO3e6njhhigzOWELAg00GRgv5bWkqGQTQ1pPdVxFKXrIC3RApgr3Xwz
         Yf50di/VPbilkAfswZ9Ky6j07U0IFH1CtRXVLjcZP6gXmi44TkyqwnI2yhKVbP23Mxpp
         0wW86o1dCNXp9G49Cl5N2ujZz/fq++Jur2DlUfK3RK/Y7nbQn2pvUOSQ8sXbE2p2vAID
         RyGQACdlypbocv19DNoQ3P/4W7tZcjl4FXH3ggomDk9GSLWGnw9378XGU4a8tu9JdTQn
         mOivziosENf2OvjLNRlJTsGZbY5fNjKCxWA0sMLdzXUkcV4To7aATCQPRVJGy8mHo3HH
         TX9g==
X-Gm-Message-State: AAQBX9cDG4+pBAAdA4zwLe+UnkbhGl/b7oxsN+HUy45YKFDRjREpI0Gf
        XDiFnRXfoAI3VQamI30XxZnABw==
X-Google-Smtp-Source: AKy350ZaD72xOOLC+n3IgeD+0Yssv8KT+mdvSq5O3IAMEg9jKTC8QFcarQHvtKeI2b3hRjX0mBzScQ==
X-Received: by 2002:a19:ad09:0:b0:4d1:7923:3b93 with SMTP id t9-20020a19ad09000000b004d179233b93mr162247lfc.59.1679624754034;
        Thu, 23 Mar 2023 19:25:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 37/41] arm64: dts: qcom: sm8250: switch PCIe QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:10 +0300
Message-Id: <20230324022514.1800382-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 112 +++++++++++----------------
 1 file changed, 45 insertions(+), 67 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1d13864e978a..9b53667a0243 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1888,7 +1888,7 @@ pcie0: pci@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_lane>;
+			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
@@ -1902,15 +1902,23 @@ pcie0: pci@1c00000 {
 
 		pcie0_phy: phy@1c06000 {
 			compatible = "qcom,sm8250-qmp-gen3x1-pcie-phy";
-			reg = <0 0x01c06000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c06000 0 0x1000>;
+
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_WIFI_CLKREF_EN>,
-				 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
 			reset-names = "phy";
@@ -1919,20 +1927,6 @@ pcie0_phy: phy@1c06000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie0_lane: phy@1c06200 {
-				reg = <0 0x01c06200 0 0x170>, /* tx */
-				      <0 0x01c06400 0 0x200>, /* rx */
-				      <0 0x01c06800 0 0x1f0>, /* pcs */
-				      <0 0x01c06c00 0 0xf4>; /* "pcs_lane" same as pcs_misc? */
-				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#phy-cells = <0>;
-
-				#clock-cells = <0>;
-				clock-output-names = "pcie_0_pipe_clk";
-			};
 		};
 
 		pcie1: pci@1c08000 {
@@ -1994,7 +1988,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
@@ -2008,15 +2002,23 @@ pcie1: pci@1c08000 {
 
 		pcie1_phy: phy@1c0e000 {
 			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
-			reg = <0 0x01c0e000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c0e000 0 0x1000>;
+
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_WIGIG_CLKREF_EN>,
-				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+
+			clock-output-names = "pcie_1_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
 			reset-names = "phy";
@@ -2025,22 +2027,6 @@ pcie1_phy: phy@1c0e000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie1_lane: phy@1c0e200 {
-				reg = <0 0x01c0e200 0 0x170>, /* tx0 */
-				      <0 0x01c0e400 0 0x200>, /* rx0 */
-				      <0 0x01c0ea00 0 0x1f0>, /* pcs */
-				      <0 0x01c0e600 0 0x170>, /* tx1 */
-				      <0 0x01c0e800 0 0x200>, /* rx1 */
-				      <0 0x01c0ee00 0 0xf4>; /* "pcs_com" same as pcs_misc? */
-				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#phy-cells = <0>;
-
-				#clock-cells = <0>;
-				clock-output-names = "pcie_1_pipe_clk";
-			};
 		};
 
 		pcie2: pci@1c10000 {
@@ -2102,7 +2088,7 @@ pcie2: pci@1c10000 {
 
 			power-domains = <&gcc PCIE_2_GDSC>;
 
-			phys = <&pcie2_lane>;
+			phys = <&pcie2_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
@@ -2116,15 +2102,23 @@ pcie2: pci@1c10000 {
 
 		pcie2_phy: phy@1c16000 {
 			compatible = "qcom,sm8250-qmp-modem-pcie-phy";
-			reg = <0 0x01c16000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c16000 0 0x1000>;
+
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_2_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_MDM_CLKREF_EN>,
-				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE2_PHY_REFGEN_CLK>,
+				 <&gcc GCC_PCIE_2_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+
+			clock-output-names = "pcie_2_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_2_PHY_BCR>;
 			reset-names = "phy";
@@ -2133,22 +2127,6 @@ pcie2_phy: phy@1c16000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie2_lane: phy@1c16200 {
-				reg = <0 0x01c16200 0 0x170>, /* tx0 */
-				      <0 0x01c16400 0 0x200>, /* rx0 */
-				      <0 0x01c16a00 0 0x1f0>, /* pcs */
-				      <0 0x01c16600 0 0x170>, /* tx1 */
-				      <0 0x01c16800 0 0x200>, /* rx1 */
-				      <0 0x01c16e00 0 0xf4>; /* "pcs_com" same as pcs_misc? */
-				clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#phy-cells = <0>;
-
-				#clock-cells = <0>;
-				clock-output-names = "pcie_2_pipe_clk";
-			};
 		};
 
 		ufs_mem_hc: ufshc@1d84000 {
-- 
2.30.2

