Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F490787A35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243647AbjHXVU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243651AbjHXVUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596371BC9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5007c8308c3so393392e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912000; x=1693516800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4/HaBQdmop51bI5KAdwerODTyagveuUw1HWmRGvWSw=;
        b=xGg3ECOhpPNdOxz+2WJe/XFKW15owi51pUWdjauluWt0m6O6If2OQzZ5TfZ3eBdtiX
         Ap5eVyDHZv5SLatgVnX2yAOuatH5nJbGPbHLTc0nGziP+ygkWxtM0zJZrX7VtX1IV0o2
         smqVUKKqD/7tgSZfUxKdqP4lBRpv6Sv6ymEIjOwHHgVGOUDLz6OL4q8mAH9+lJBWvnKp
         Uye+2wFu3LsVIdYpPhNmiiI2E2SfYsFAPOTiLQ1gL3pxqO3/2yAAy2LydqF1po/ACp7O
         AxPs3qzK+XEd96NWPHEmA0dEUUqKvo9kiBDhBYaMybwRGUyAT9hlYDGlflpgBfRvFe2F
         lhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912000; x=1693516800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4/HaBQdmop51bI5KAdwerODTyagveuUw1HWmRGvWSw=;
        b=OJC4MhYs1ArV5IBvdXK25+Z4wHilCcJVxgwJUBuzqsBWmstsnUBbCf64+NqT8r1Cj6
         mRohqKsj1ySuve9939odMqQicI6Tj5JKsK1PgNTkGa4xMQp8V29UgqZuPbtwwLyhwg3d
         UScVF6dJLrZQZHwF80CJWMKg879B1yizeM0lKKpuoG7srr5HWj3VQjAfguGkL5dEVb5W
         NhwpioN7Sx+ciuAuWQ/gQ5pgWdJ0T7RcZWSS5cTcGtyjhbjVGAIDfEQtBqqkYV+m2bud
         rdDNQc5Qmt9nbbKCzbxYT1YKYOT6GdHDRpnYOgYPKEKRaet+INieYK8Cgzg10yIqABem
         6o0Q==
X-Gm-Message-State: AOJu0Yygm4X2IdSEjeIYzxku+ZU/OJrbjdvDOWxvcFSC0Sq6rXqdSqHV
        El2G2/SO9Jpnml2vE3Is47zTxw==
X-Google-Smtp-Source: AGHT+IEwIdj5aiNTBoZCRdVHgEIMB5N+PRsu2Y+JbGrKxRF8A7/Y6IEdkffhPxxvBMPSQp6+twXqWg==
X-Received: by 2002:a05:6512:ad2:b0:4fe:4f8:8e75 with SMTP id n18-20020a0565120ad200b004fe04f88e75mr14330790lfu.68.1692912000739;
        Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:20:00 -0700 (PDT)
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
Subject: [PATCH v3 08/16] arm64: dts: qcom: ipq8074: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:44 +0300
Message-Id: <20230824211952.1397699-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 76 +++++++++++----------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 3350804a2f62..e113f5eec8e6 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -125,32 +125,26 @@ soc: soc@0 {
 
 		ssphy_1: phy@58000 {
 			compatible = "qcom,ipq8074-qmp-usb3-phy";
-			reg = <0x00058000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00058000 0x1000>;
 
 			clocks = <&gcc GCC_USB1_AUX_CLK>,
-				<&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
-				<&xo>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&xo>,
+				 <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB1_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3phy_1_cc_pipe_clk";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB1_PHY_BCR>,
-				<&gcc GCC_USB3PHY_1_PHY_BCR>;
-			reset-names = "phy","common";
-			status = "disabled";
+				 <&gcc GCC_USB3PHY_1_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
-			usb1_ssphy: phy@58200 {
-				reg = <0x00058200 0x130>,     /* Tx */
-				      <0x00058400 0x200>,     /* Rx */
-				      <0x00058800 0x1f8>,     /* PCS */
-				      <0x00058600 0x044>;     /* PCS misc */
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB1_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3phy_1_cc_pipe_clk";
-			};
+			status = "disabled";
 		};
 
 		qusb_phy_1: phy@59000 {
@@ -168,32 +162,26 @@ qusb_phy_1: phy@59000 {
 
 		ssphy_0: phy@78000 {
 			compatible = "qcom,ipq8074-qmp-usb3-phy";
-			reg = <0x00078000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00078000 0x1000>;
 
 			clocks = <&gcc GCC_USB0_AUX_CLK>,
-				<&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
-				<&xo>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&xo>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3phy_0_cc_pipe_clk";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB0_PHY_BCR>,
-				<&gcc GCC_USB3PHY_0_PHY_BCR>;
-			reset-names = "phy","common";
-			status = "disabled";
+				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
-			usb0_ssphy: phy@78200 {
-				reg = <0x00078200 0x130>,     /* Tx */
-				      <0x00078400 0x200>,     /* Rx */
-				      <0x00078800 0x1f8>,     /* PCS */
-				      <0x00078600 0x044>;     /* PCS misc */
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB0_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3phy_0_cc_pipe_clk";
-			};
+			status = "disabled";
 		};
 
 		qusb_phy_0: phy@79000 {
@@ -628,7 +616,7 @@ dwc_0: usb@8a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8a00000 0xcd00>;
 				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_0>, <&usb0_ssphy>;
+				phys = <&qusb_phy_0>, <&ssphy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
@@ -670,7 +658,7 @@ dwc_1: usb@8c00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8c00000 0xcd00>;
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&qusb_phy_1>, <&usb1_ssphy>;
+				phys = <&qusb_phy_1>, <&ssphy_1>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,is-utmi-l1-suspend;
 				snps,hird-threshold = /bits/ 8 <0x0>;
-- 
2.39.2

