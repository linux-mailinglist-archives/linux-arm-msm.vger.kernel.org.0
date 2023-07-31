Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6126E7693EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjGaK66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjGaK6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CBD18C
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso2392468e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801088; x=1691405888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OCthNqvSFsBwJHonQ0z7rqJs2ov63E+z34/DiWG2VU=;
        b=xPKXIBvS89qqpcICzlNca2SEMMNf+K/wsuW9Qwv88ydpisu+LGIqG0V6Aw7o0bJjyS
         ZWH08v6up7hgRyosrbILwLtbg+SNZYCeTiVRX8aBVsL+d+BJseolVkOZU4Qq0le/m5Uo
         2qBWH+NTJK1/lWrzt2qxs9HlNah/Uf/ZAZJQZjEbZTj+15ALcK5PCiE18KUWof8tz+Tu
         HInip0c9w1BGpnqnJak90GJNtQmggxLLE206N/RQHIKBxg8E05pLR0r3re6G4JA+je1h
         c+XIcaK6CcciCCVK/c10YNxJo+iZfDi8v0gXNv2cJ/rF7OkHNCB1d8mDvPO1JYaOy9/q
         Q26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801088; x=1691405888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OCthNqvSFsBwJHonQ0z7rqJs2ov63E+z34/DiWG2VU=;
        b=eJUNYQpZHPZsEjWvfYSq8ypVMlE3yDC5RYKIEGeisOjJ3CWJS3XBM5W61QXBk84kRn
         M+tJvuSYwSDZBp72jaipE6Oc9cTCoRoqqotc0gWKu1ln1sYnCXzyijNkHZlf8hrcdK91
         f0q31TaABLO1VugM51SjHJEtbzZsAe17Wooo6LjKNogdaVs5fNKY3rfZ52AbvWumC+rk
         QSs35u4FyY2kfz1WWwhafZgEcUVJiHoVJkZUMJiJibhiRhJ++6sYpmQ5WZnXyJxpMTun
         vtTTpiUpSb+0i60U8gDda8P5MoMx/O2GhQdUAwu/+BiNOEyqCpPH+20hi+EuGTNmF060
         M+TQ==
X-Gm-Message-State: ABy/qLbsrmNXgQ/KC+0hDMa9zDR+JxMgK5jE755pSwCM9nFI78XFfvuG
        cVOFMoE9a4eTeSs27c5Y3gmYdg==
X-Google-Smtp-Source: APBJJlHnfoJpgZgQbvCfrN/dHgXRL5qnROWTjtV3hXlRbZVg2kXEnujs47st70ySj+1M7pM67Qvqjg==
X-Received: by 2002:a05:6512:34cf:b0:4fe:1681:9377 with SMTP id w15-20020a05651234cf00b004fe16819377mr4809054lfr.44.1690801088651;
        Mon, 31 Jul 2023 03:58:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:08 -0700 (PDT)
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
Subject: [PATCH v2 10/13] arm64: dts: qcom: sm8150: switch PCIe QMP PHY to new style of bindings
Date:   Mon, 31 Jul 2023 13:57:56 +0300
Message-Id: <20230731105759.3997549-11-dmitry.baryshkov@linaro.org>
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
resource region, no per-PHY subnodes). As a part of this conversion also
add the missing "ref" clock to the PCIe PHY devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 70 ++++++++++++----------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 4381527da3fb..2baac91aecfb 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1874,7 +1874,7 @@ pcie0: pci@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_lane>;
+			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
 			perst-gpio = <&tlmm 35 GPIO_ACTIVE_HIGH>;
@@ -1888,14 +1888,22 @@ pcie0: pci@1c00000 {
 
 		pcie0_phy: phy@1c06000 {
 			compatible = "qcom,sm8150-qmp-gen3x1-pcie-phy";
-			reg = <0 0x01c06000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c06000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "refgen";
+				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
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
@@ -1904,18 +1912,6 @@ pcie0_phy: phy@1c06000 {
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
-				clock-output-names = "pcie_0_pipe_clk";
-			};
 		};
 
 		pcie1: pci@1c08000 {
@@ -1972,7 +1968,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			perst-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
@@ -1986,14 +1982,22 @@ pcie1: pci@1c08000 {
 
 		pcie1_phy: phy@1c0e000 {
 			compatible = "qcom,sm8150-qmp-gen3x2-pcie-phy";
-			reg = <0 0x01c0e000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c0e000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE1_PHY_REFGEN_CLK>;
-			clock-names = "aux", "cfg_ahb", "refgen";
+				 <&gcc GCC_PCIE_1_CLKREF_CLK>,
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
@@ -2002,20 +2006,6 @@ pcie1_phy: phy@1c0e000 {
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
-				clock-output-names = "pcie_1_pipe_clk";
-			};
 		};
 
 		ufs_mem_hc: ufshc@1d84000 {
-- 
2.39.2

