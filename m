Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E274B6C75B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjCXCZ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbjCXCZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921E5298D5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s8so396295lfr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzAlHITCzklZyxH5QcsRxcmP4Hg72quJXAG7V+AqE4E=;
        b=YmvW1PdwnFkU2QcwpqJGZqEE0NluH29HCIwLYuS1Iv+NwDuTYE5/+syv+DGegYjbK3
         1XhEvprOztgY4iqeFvZF2KbT9I4FG7ydwMl1nuh92zPDqVSF2lEgENxAKktUmRteqcK7
         q5tlXGk4LRldz7iJmW/53vZmrAyDscppc+kRcwWAzxr/hPFldb3tYJJ7MToaQM66uanN
         ni4ttzfgF6/FJFNZ0nrCJGaJrLU0TFlX+Ld8e6qz3p9pcW+tmF1yfARYu811s4IOvhGW
         F69zJaOzJeMC6mZv+nPPz3n1ozJx5prR3J8JQtPxNIsWDN3faDEg0QvrDNQM4JWz6Odo
         XR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzAlHITCzklZyxH5QcsRxcmP4Hg72quJXAG7V+AqE4E=;
        b=D2MWWgxbJL//U2oiy6nt62X0BotPk85lz8zrlx8AD9AVbX1vZwGhC3Xv78gh/vG/XU
         ggDoUGbkUIJOkBNlvhvC8VtKhib+W32EoyJ9pNYGJylleLW3QFhipFeHpLSAiC4bh7eZ
         2cOZErBBQyKaxGIUsff6KrtMhljNUn8C8Dnc9HB2bi4YFRF/C9P8xbIH54t7jossCMn0
         ghIpdk7caozEqzkQLkTQOh/g58GY8+rMWJptZO6wjjL3bIdOpDWJM1BI5jUv4Zrbybys
         71AV99VCHY8/glSO0vKk7Px5ELn/Q86Rm8mpxBxPmFUJiPqi//MJsdnWNNREAyWoatYj
         ObAQ==
X-Gm-Message-State: AAQBX9dzwLt4m8TwHdTLwncDmk2xPHrNNkD3v+YQZEpPvmo96H+ztBhd
        YUvupRQ1hnsog5V1DEKMFusMOg==
X-Google-Smtp-Source: AKy350aZXDg/IZHtl5Lo+f1sU+zl/bL4NvL4UWTc+CR+h7VOWySDmVRzzhZevn7Y2tYf0g9IfqKC6Q==
X-Received: by 2002:ac2:46f9:0:b0:4d8:57dc:fcdd with SMTP id q25-20020ac246f9000000b004d857dcfcddmr199460lfo.56.1679624751163;
        Thu, 23 Mar 2023 19:25:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 34/41] arm64: dts: qcom: sc7280: switch PCIe QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:07 +0300
Message-Id: <20230324022514.1800382-35-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 36 ++++++++++------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 62885ac3f11e..9d28b087c47b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -848,7 +848,7 @@ gcc: clock-controller@100000 {
 			reg = <0 0x00100000 0 0x1f0000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
-				 <0>, <&pcie1_lane>,
+				 <0>, <&pcie1_phy>,
 				 <0>, <0>, <0>, <0>;
 			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
 				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
@@ -2099,7 +2099,7 @@ pcie1: pci@1c08000 {
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
-				 <&pcie1_lane>,
+				 <&pcie1_phy>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
@@ -2133,7 +2133,7 @@ pcie1: pci@1c08000 {
 
 			power-domains = <&gcc GCC_PCIE_1_GDSC>;
 
-			phys = <&pcie1_lane>;
+			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
 			pinctrl-names = "default";
@@ -2151,15 +2151,18 @@ pcie1: pci@1c08000 {
 
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
+			clock-names = "aux", "cfg_ahb", "ref", "refgen", "pipe";
+
+			clock-output-names = "pcie_1_pipe_clk";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
 			reset-names = "phy";
@@ -2168,21 +2171,6 @@ pcie1_phy: phy@1c0e000 {
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
2.30.2

