Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28647693F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjGaK67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjGaK6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD9D199
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:12 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe1c285690so5804424e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801090; x=1691405890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TgQueK3/uQvVobd2EvrYhwR6ZFnqzSrsZ0Yi98Vg28=;
        b=Z+wBjWb9Ttgc8Dl53xaGn99ROFYCnXDAW8dq5cVsWdyGi8zs+YTkwFZEs7mi4wKPIH
         pWBjVuRs0wWec0zTOvqqh9Y1BKvfVSdMviR31aMLNuNwmmowP+HTR25Pt/99nE/6iY/t
         gX8OTshRqwefZfyFlQ/7Ajvc+NmsuJg1ygN3J+O8RCWBU80C5KC/F9JpSjE99vtu09pv
         E+gMdUpbmDbEO02MV86SK0qpH3bIZM0Eq4MuEiELvOeF8xG2nS6aABdi5n149VJnNcOE
         RQyCd4hqh9mnJxaQD045cYqKAoXwQ1ze+Y+oNlOYPepgHC1n8UaGBJ7Ya0pvm+FH47xU
         whKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801090; x=1691405890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TgQueK3/uQvVobd2EvrYhwR6ZFnqzSrsZ0Yi98Vg28=;
        b=iAcHSDNChwNqBBR/jW0CKp7CmCq/eaCiey6ZNA0y7XEf2P7r5Jyx+K3tHL48q9UCtk
         8g+OmcdTV18ueCdOQJMVL3x+ZdE3rXt4vJESV9Kqx9kvIOWxWU3HTDqu7q8z4RK7QVDb
         QPvdN5XMDKDdDWDmPRKEuYp7rC++p//PYXXuJbob6D92ANP3S3QlX+xaYcOVmkGfxb4T
         QqVBmkci0OCSVnTUpU0zAYQ23uoY+iR2JpGTTTd551P1UzXUAgmFUjF8aWgZe+BBhzs7
         LEqKYDmNYM+x9PwOVAYW5b05/07LTJSyoKJhHPBS2P0MSRJyg3qV0lDC9bEndX+Tonwq
         /+Dw==
X-Gm-Message-State: ABy/qLah8/+g3R8wj/32pjpzpVzG4BURTZrlT0r+XUPGHJNcq7fuwFBv
        BvgFu0o6ZrYeVgCj0AU3n/N3dA==
X-Google-Smtp-Source: APBJJlGyanc6hK7anoIxm79l+wel/dbIrN5rOBPgB2deup9ZWfNMmJz/fXJsTY5fROZmEYxGt+EtLA==
X-Received: by 2002:a05:6512:3583:b0:4f9:b649:23d2 with SMTP id m3-20020a056512358300b004f9b64923d2mr5058611lfr.42.1690801090373;
        Mon, 31 Jul 2023 03:58:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:09 -0700 (PDT)
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
Subject: [PATCH v2 12/13] arm64: dts: qcom: sm8450: switch PCIe QMP PHY to new style of bindings
Date:   Mon, 31 Jul 2023 13:57:58 +0300
Message-Id: <20230731105759.3997549-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
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

Change the PCIe QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes). As a part of this conversion also
change the "refgen" name to more correct "rchng".

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 82 ++++++++++++----------------
 1 file changed, 35 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8c58b7747ff9..02153f6cb274 100644
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
@@ -1775,7 +1775,7 @@ pcie0: pci@1c00000 {
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_PIPE_CLK_SRC>,
-				 <&pcie0_lane>,
+				 <&pcie0_phy>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
@@ -1806,7 +1806,7 @@ pcie0: pci@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_lane>;
+			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -1820,15 +1820,23 @@ pcie0: pci@1c00000 {
 
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
@@ -1837,19 +1845,6 @@ pcie0_phy: phy@1c06000 {
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
@@ -1889,7 +1884,7 @@ pcie1: pci@1c08000 {
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
-				 <&pcie1_lane>,
+				 <&pcie1_phy>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
@@ -1918,7 +1913,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
@@ -1930,17 +1925,25 @@ pcie1: pci@1c08000 {
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
@@ -1949,21 +1952,6 @@ pcie1_phy: phy@1c0f000 {
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

