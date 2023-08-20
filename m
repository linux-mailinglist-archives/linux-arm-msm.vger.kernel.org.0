Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A63781E2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbjHTOZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjHTOZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5C73C16
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:47 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bbac8ec902so40000121fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541246; x=1693146046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TArgQnUK7j9nkLUqHv2y1T1IJwhipKOL29cPJl3BqI=;
        b=pPVYH0Rjpj2adT6Bg5mApLF4HS6CbxyWkG6wAG9hD6lTSHOmqCZX+AExWpjNzxTuGs
         q7R3EjZD4eHv8JG7bXKu+yfn0R7zZ9JjY192WT6qDBuTs33GD49wjidqr9UXMCtFd3pg
         xfVFGUwGaozoj6iIwJngChWamCEtTgJEqyzXTFte6S3qLG0M3K9+gX5GxLmfaFD3SQVi
         5m9kX3337izW1u11gx4Art/+l1lhurHW9Yt8ojUucZTx6W/elNIMlDpjZJZ5UWCgKLwb
         Iwx7k5jjZcYLYSwEofN/Am8TKelupC+7+MWzH3rES4mQhchRd5/8r0ptw6AvjKXC/Juw
         raGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541246; x=1693146046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TArgQnUK7j9nkLUqHv2y1T1IJwhipKOL29cPJl3BqI=;
        b=WG1EzTvLVb0Z6ofbw0h2ubKfGZ8ia04QS7d0fMo5QVnbZLcJp1palmQhFDDL55aYw8
         gBsRf5vbgEz8pJXPB3eaLOlaVibKU7CHaCKuZxnTohnfuHfqxKzimfVjSdqGCd+rgMRz
         5DbApPlKPDj2qAlGCjoLRlzC/IDTQn8l/KrTMRXOr5YJq+v2sQvZOWcr409uz1WBe+3v
         pl4cyEh6nSSPeyweB40QY5R9ejZnU1NesPAqO2VWRQLFBsIHw96hyn77zpUMmGLVMbRq
         HI5Lc33HMSaqtnguRT0UjsJlFbyLM5SfoRyMFE6xq4k/woRx2cRE2hlWyt8XEdzj7kVj
         gN9Q==
X-Gm-Message-State: AOJu0YzVSprHKy8NmoQf1Pci9uIShqzzg5EVb1MdazwUUnwaE73IXtvN
        hXzDRu/XCIlw9aipInpGi2DWSQ==
X-Google-Smtp-Source: AGHT+IFDfeRM2sOdVe+CQ9UKJVHJELx9qdU/6AcrwHa25asufnyxGok6kQy7xzw0/IqqneP2RuYKpg==
X-Received: by 2002:a2e:82d5:0:b0:2bb:9710:9d89 with SMTP id n21-20020a2e82d5000000b002bb97109d89mr2895311ljh.10.1692541246365;
        Sun, 20 Aug 2023 07:20:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:45 -0700 (PDT)
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
Subject: [PATCH v3 11/18] arm64: dts: qcom: sc7280: switch PCIe QMP PHY to new style of bindings
Date:   Sun, 20 Aug 2023 17:20:28 +0300
Message-Id: <20230820142035.89903-12-dmitry.baryshkov@linaro.org>
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
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 40 +++++++++++-----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4353f7265877..169cf38c77d3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -869,7 +869,7 @@ gcc: clock-controller@100000 {
 			reg = <0 0x00100000 0 0x1f0000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
-				 <0>, <&pcie1_lane>,
+				 <0>, <&pcie1_phy>,
 				 <0>, <0>, <0>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
@@ -2121,7 +2121,7 @@ pcie1: pci@1c08000 {
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
-				 <&pcie1_lane>,
+				 <&pcie1_phy>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
@@ -2155,7 +2155,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc GCC_PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			pinctrl-names = "default";
@@ -2171,15 +2171,22 @@ pcie1: pci@1c08000 {
 
 		pcie1_phy: phy@1c0e000 {
 			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
-			reg = <0 0x01c0e000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01c0e000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_CLKREF_EN>,
-				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "refgen";
+				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>,
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
@@ -2188,21 +2195,6 @@ pcie1_phy: phy@1c0e000 {
 			assigned-clock-rates = <100000000>;
 
 			status = "disabled";
-
-			pcie1_lane: phy@1c0e200 {
-				reg = <0 0x01c0e200 0 0x170>,
-				      <0 0x01c0e400 0 0x200>,
-				      <0 0x01c0ea00 0 0x1f0>,
-				      <0 0x01c0e600 0 0x170>,
-				      <0 0x01c0e800 0 0x200>,
-				      <0 0x01c0ee00 0 0xf4>;
-				clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
-				clock-names = "pipe0";
-
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clock-output-names = "pcie_1_pipe_clk";
-			};
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.39.2

