Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4EA7820DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Aug 2023 02:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbjHUAZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 20:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjHUAZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 20:25:48 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EF2A3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:46 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9c0391749so45328021fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 17:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692577545; x=1693182345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRFue1T8d7jR28oiKkWulLduMD9W04zC4SIMVMD0pKU=;
        b=flOcc9/tSlJh3P2sT8uJXUB/Ir9Wx5USwHfAp/hBd///fpKKkEXY7c2ngEBpod12rn
         Tf1VkApKX3DAfXAMsQu8YC8eedF0BB0XGtS3N43/KIPoGmbgb3R2F0yFsqcKGUOUVQcd
         lxzRlGpZ19+QLhRAvIuaamaU0BCocJb4WqQBAo7XZceOY+/6Feq5nIjTN5kQAc6baU/T
         t3G09u8gg0zu90P7WMDee7HRPgATDBK4GrRrjMCU97VFgUrcx1Sf5sEnjpAI0atznTza
         DV+k7fLFb51qRrp1pM9qIMo8C6AV1lpZbSDv98sXb+rGlstuD8T0jqXjp6FC/b3jDyeJ
         QSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692577545; x=1693182345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRFue1T8d7jR28oiKkWulLduMD9W04zC4SIMVMD0pKU=;
        b=fAGNON3Qx0rjIKF0DC+H86ASBi/IH6NsKajJs2y68YnC1v04HuvvBbUDqyxDp1PaJM
         6s/ubB+gDSHEMZCqv3wjt0JCUj6ZDKprFJl355bcYr6mWbOwf9cbsALU85iDeoQJ1FJf
         WLms3X4PZAhnBckL7yI+k9oH3MdNTT32JGRQOOJF+uGs1pELhq/YfexX3ffKdbx64ZM3
         jTbIfTBydJVqrPuVOnEopiNtrkqojnPwFPrVvQy9OAnPK6aU+BeL97XbwGzy3/VYQjYO
         a5MqLb/8YTS7r12my2Ty7umTqeo5JIyy2SghL6EBQaaYuXErh2wCTwQhwPsO5wZMaK5o
         ly1g==
X-Gm-Message-State: AOJu0Yz5Zd8TBqyV7dTqAhbRVvjZgZsSR4RMJh5VR8SCOMXo44j3Xwgf
        hL5LZ4Yps5EvHnA5qpiyA1BppA==
X-Google-Smtp-Source: AGHT+IETXVv+WpO/STDARkfABjKjVrty4oMUUQAY3f2XfuRPfzinE7rTWTOMagyuYPtveUsy72WQlA==
X-Received: by 2002:a2e:300f:0:b0:2b7:3a8a:4d5f with SMTP id w15-20020a2e300f000000b002b73a8a4d5fmr3767441ljw.0.1692577545091;
        Sun, 20 Aug 2023 17:25:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b002b6fe751b6esm1964923ljl.124.2023.08.20.17.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 17:25:44 -0700 (PDT)
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
Subject: [PATCH v2 10/16] arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
Date:   Mon, 21 Aug 2023 03:25:29 +0300
Message-Id: <20230821002535.585660-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
References: <20230821002535.585660-1-dmitry.baryshkov@linaro.org>
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

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 39 +++++++++++----------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 30d8730fa4de..46a6ef0e454b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -979,12 +979,12 @@ pcie_phy: phy@1c06000 {
 			status = "disabled";
 
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
-				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_CLKREF_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_0_PIPE_CLK>;
 			clock-names = "aux",
-				      "cfg_ahb",
 				      "ref",
+				      "cfg_ahb",
 				      "pipe";
 
 			clock-output-names = "pcie_0_pipe_clk_src";
@@ -2138,7 +2138,7 @@ usb3_dwc3: usb@a800000 {
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&qusb2phy>, <&usb1_ssphy>;
+				phys = <&qusb2phy>, <&usb3phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
@@ -2147,33 +2147,26 @@ usb3_dwc3: usb@a800000 {
 
 		usb3phy: phy@c010000 {
 			compatible = "qcom,msm8998-qmp-usb3-phy";
-			reg = <0x0c010000 0x18c>;
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x0c010000 0x1000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_CLKREF_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3_PHY_BCR>,
 				 <&gcc GCC_USB3PHY_PHY_BCR>;
-			reset-names = "phy", "common";
+			reset-names = "phy",
+				      "phy_phy";
 
-			usb1_ssphy: phy@c010200 {
-				reg = <0xc010200 0x128>,
-				      <0xc010400 0x200>,
-				      <0xc010c00 0x20c>,
-				      <0xc010600 0x128>,
-				      <0xc010800 0x200>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
+			status = "disabled";
 		};
 
 		qusb2phy: phy@c012000 {
-- 
2.39.2

