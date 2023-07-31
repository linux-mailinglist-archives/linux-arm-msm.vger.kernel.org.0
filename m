Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA387693EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjGaK65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjGaK6h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB527123
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so7003496e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801088; x=1691405888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDOhHwZWkAhicHC3OLEnAOANOKWbC4wnLOIX7VH1icU=;
        b=jr+2XZi2Mt0x9HoKDqKpk1BIrBRJfk39UvhyKgts7YSvzlsmN21Av72yY6vNDkMUrJ
         nFULN7jSp71Rn2oK6wBwQ2aGfWoGiDO0DZgPk/ZaSfPOosx76HHT8A8PAGtg/+19gwjT
         1UcGOUqCOXq9jXxM9K96o4CR1swn6oOCvf1RtIEKzRLNM45dGZSGBUDhZwfBPjEI3pvg
         QR2+NOjnja/wcUba6FqYcHi24uFx3TwPqSgpj5a4kxxf2wEqcO1JvLyvG+JO6puzF4Zt
         Tl1xbOu3vFDF59+Wd2rFE/+J30twG6j2POQtEDaEo9ECZ63wHZhCfYqy6hg+EZn61HEU
         cxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801088; x=1691405888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDOhHwZWkAhicHC3OLEnAOANOKWbC4wnLOIX7VH1icU=;
        b=Y7JID/ub63PdwfxAFAYPp7rhXbY24ePyT+C2B9bvadRdqMfLQkUa3PYXLWoGit7MR+
         qWt6Z3GXmwGWuq2TflymSHpUvN5uTeZRlG7zeZM6CfHky1OiA/aqFRU78HL1fTOSaQFo
         SmxKcqhCdyiktmuNTmYIKg4PX6CaHw54CZY1tev0Ad/+VOdLWAQyS5rutNggQmDsymbE
         Fz+OlXfkGbiktCi2YDHQ9xlyhu9Tk8uRFf6yS4xIrn2BLYewz6ZEjuTMHGgonkwDAtO6
         8UMPq0yjB4OdgdPk64MrktvbHOJ8zNsKp9eP/og0eVZHECUC172GjyvpjvY1f6r8sgAs
         dqoQ==
X-Gm-Message-State: ABy/qLZpGDkTafjUmZ4R++EPLZl1SpkMdDUsEtJzmOHGJJXWbe4RBSfQ
        rhJjOjh7PufxNbXNazfyYWAp3g==
X-Google-Smtp-Source: APBJJlH3WwkveEf7J9A8sKAICZeoSew5U4uU6PG2Vdx5F0yl5Qlnzsp9CWpoiYsFtCr2R5vU7oeQFg==
X-Received: by 2002:a19:6d0a:0:b0:4f8:71bf:a259 with SMTP id i10-20020a196d0a000000b004f871bfa259mr4777157lfc.67.1690801087832;
        Mon, 31 Jul 2023 03:58:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:07 -0700 (PDT)
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
Subject: [PATCH v2 09/13] arm64: dts: qcom: sdm845: switch PCIe QMP PHY to new style of bindings
Date:   Mon, 31 Jul 2023 13:57:55 +0300
Message-Id: <20230731105759.3997549-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 71 ++++++++++++----------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 3d4050548f3a..ef7b6994fdab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1198,8 +1198,8 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <&pcie0_lane>,
-				 <&pcie1_lane>;
+				 <&pcie0_phy>,
+				 <&pcie1_phy>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk",
@@ -2371,7 +2371,7 @@ pcie0: pci@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_lane>;
+			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
@@ -2379,15 +2379,22 @@ pcie0: pci@1c00000 {
 
 		pcie0_phy: phy@1c06000 {
 			compatible = "qcom,sdm845-qmp-pcie-phy";
-			reg = <0 0x01c06000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c06000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
-				 <&gcc GCC_PCIE_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE_PHY_REFGEN_CLK>,
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
@@ -2396,19 +2403,6 @@ pcie0_phy: phy@1c06000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie0_lane: phy@1c06200 {
-				reg = <0 0x01c06200 0 0x128>,
-				      <0 0x01c06400 0 0x1fc>,
-				      <0 0x01c06800 0 0x218>,
-				      <0 0x01c06600 0 0x70>;
-				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clock-output-names = "pcie_0_pipe_clk";
-			};
 		};
 
 		pcie1: pci@1c08000 {
@@ -2481,7 +2475,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
@@ -2489,15 +2483,22 @@ pcie1: pci@1c08000 {
 
 		pcie1_phy: phy@1c0a000 {
 			compatible = "qcom,sdm845-qhp-pcie-phy";
-			reg = <0 0x01c0a000 0 0x800>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c0a000 0 0x2000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
-				 <&gcc GCC_PCIE_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE_PHY_REFGEN_CLK>,
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
@@ -2506,18 +2507,6 @@ pcie1_phy: phy@1c0a000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie1_lane: phy@1c06200 {
-				reg = <0 0x01c0a800 0 0x800>,
-				      <0 0x01c0a800 0 0x800>,
-				      <0 0x01c0b800 0 0x400>;
-				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#clock-cells = <0>;
-				#phy-cells = <0>;
-				clock-output-names = "pcie_1_pipe_clk";
-			};
 		};
 
 		mem_noc: interconnect@1380000 {
-- 
2.39.2

