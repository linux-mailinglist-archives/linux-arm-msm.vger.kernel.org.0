Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04907693F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjGaK7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjGaK6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138461B8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe383c1a26so1069529e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801091; x=1691405891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfVD0ReDE+afeEDVkr9DHXfR2daYWUMok3vB8NkGUyU=;
        b=Rf3TvuUi8pvwXHXz8Wm6gSl0rG295QSKN8I5i52/5kgG67fhgcsPRx4DFDLyOs88cS
         PMLt0TFKTrjVneyoXA6FueAo6mnfp8RSff5mrG+GFK8tdh7wCIxKnikgm7M85knjooC1
         5XjL2EDbqdXM/8ZylXJP+nHwOXbMno2dUa4eVrPb5B++J+INsDJuINvvM9aw3yeuMdI2
         FMU8KunFFxUSa70j4x2Jbomf+anQ91M6Euy+M+66MkwRQ83a7cPZIJxQifMn6LoMmHrP
         M+8AofN9k/SRtYe6IyJpFKlb2rr6upLNPQzR7LrElx4PaXwDvNdUBOhj2/JOWtU16nWi
         9v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801091; x=1691405891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfVD0ReDE+afeEDVkr9DHXfR2daYWUMok3vB8NkGUyU=;
        b=MDWBbGbtLNZQm7TJBD/bNZMP7KY5uttzemt2d3ThpbX7EO7zWbAPeIn7NqDcgxaDiG
         nFSHrKPozhFzFG+3/7/YxpaDRgsdtOP/6sFDNHQ43WCUC3nGSZ/hdw4PkV6zpjeDkY6K
         i1d0wHFLuzQuM6bcn1oa2Cm29Ry2SCcfbTNKRDhU53CN8H5K5ndUi/cixZwhx1ZYryYA
         pTgWkd9sY7qvmaM+QY4Lt/W+sS+VQ3O9DRpo+M78ggKi0TRzprVmDQFiucdBmZq+5lP0
         grWIxq94ZWHOCnU6PTnM/rvJpdtVVX/uczuUi/VkjxM5QJ3oWvLlKJdHEdV29OSqaJ8d
         uWxg==
X-Gm-Message-State: ABy/qLaI7pqLKJhZidwjgmbyfAT4zYTx0KNxZiYspsa3nTiYMmf5+RmG
        /16r3xtwAbsaI7pStA1bwo/MuIY2dcrSCavM/ls=
X-Google-Smtp-Source: APBJJlGgXXnYuz6h6j5X73uGOl6giTP3wtGeaYMpIBgspE96MyJd6VIcEAI24qlCeSyu7kmwU3IsZw==
X-Received: by 2002:a05:6512:5ca:b0:4fe:3724:fdb1 with SMTP id o10-20020a05651205ca00b004fe3724fdb1mr1224698lfo.41.1690801091216;
        Mon, 31 Jul 2023 03:58:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:10 -0700 (PDT)
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
Subject: [PATCH v2 13/13] ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings
Date:   Mon, 31 Jul 2023 13:57:59 +0300
Message-Id: <20230731105759.3997549-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 31 ++++++++++----------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 55ce87b75253..4b0039ccd0da 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -379,7 +379,7 @@ pcie_rc: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_GDSC>;
 
-			phys = <&pcie_lane>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 
 			status = "disabled";
@@ -428,7 +428,7 @@ pcie_ep: pcie-ep@1c00000 {
 			resets = <&gcc GCC_PCIE_BCR>;
 			reset-names = "core";
 			power-domains = <&gcc PCIE_GDSC>;
-			phys = <&pcie_lane>;
+			phys = <&pcie_phy>;
 			phy-names = "pciephy";
 			max-link-speed = <3>;
 			num-lanes = <2>;
@@ -438,18 +438,25 @@ pcie_ep: pcie-ep@1c00000 {
 
 		pcie_phy: phy@1c07000 {
 			compatible = "qcom,sdx55-qmp-pcie-phy";
-			reg = <0x01c07000 0x1c4>;
+			reg = <0x01c07000 0x2000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 			clocks = <&gcc GCC_PCIE_AUX_PHY_CLK_SRC>,
 				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
-				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>;
+				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>,
+				 <&gcc GCC_PCIE_PIPE_CLK>;
 			clock-names = "aux",
 				      "cfg_ahb",
 				      "ref",
-				      "refgen";
+				      "refgen",
+				      "pipe";
+
+			clock-output-names = "pcie_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_PHY_BCR>;
 			reset-names = "phy";
@@ -458,20 +465,6 @@ pcie_phy: phy@1c07000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie_lane: lanes@1c06000 {
-				reg = <0x01c06000 0x104>, /* tx0 */
-				      <0x01c06200 0x328>, /* rx0 */
-				      <0x01c07200 0x1e8>, /* pcs */
-				      <0x01c06800 0x104>, /* tx1 */
-				      <0x01c06a00 0x328>, /* rx1 */
-				      <0x01c07600 0x800>; /* pcs_misc */
-				clocks = <&gcc GCC_PCIE_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#phy-cells = <0>;
-				clock-output-names = "pcie_pipe_clk";
-			};
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.39.2

