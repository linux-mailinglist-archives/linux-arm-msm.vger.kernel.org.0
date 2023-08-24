Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAA0787A3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243659AbjHXVU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243656AbjHXVUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:05 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEF11BCA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50098cc8967so387932e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912001; x=1693516801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eil83J6swtIZs9wN/isJUA8e6KGbFpAZ1S8rsr3xUpM=;
        b=s5I6cbnMOKFvbCWbHaXyJ02vjxi13VFaSebEMkahMMeBA295bJSf4eI8G60goOCH26
         tsYt2sYYhdjlCJ4/fyWn4sYKaEtjxWxMvT2kd75fIXx7kFJEe+jFMiZTW1hW696w4gFv
         vt3KpDrChsnxSwMFkWzcfot3sKeDzZYqIFSd+a5zYZLF05emJCHuC1FX0dZHbfgF37ID
         eJvxEpsMBDnclH0G5b7lzGlH3vjEfj7JxGSJDCFPcqSaWQVeuWKNQXkMR3xND/rtWpI/
         gIMmtRuFc4tTLShagDW5189o1V4jUGHPfTdBGA2QWy62KGElwDtZM/wSmRVrST6cDunc
         JBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912001; x=1693516801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eil83J6swtIZs9wN/isJUA8e6KGbFpAZ1S8rsr3xUpM=;
        b=RbLOnxvN1qTJLO/8BAmuKOzaaY2mXuL/05IcsxUzKyT0HwcjN/2Dso34Tw7KvGJhK7
         0jI34Q+W1weCWdhXrhR3Sau9Z0WEo8dMSlS5OjdQAl3I7bugWpdEj60090AM2xOXod7w
         yKpqDZhs85jgNjR6hlR3skK+Ur4IkWxAfV+jFeOJLdB6YBs5nMI4gdH7o7fNL2msjgrI
         PV1BKcKenyi1EOSekIupVqBQNVdX9jBcsMrCAMjfUoKCD8JSjt4AJBdkMS1NR2XOQgMW
         fAnJ+gNy81KYC6n3v+RALXR5hTdb+/OFgqm135/6tE796Q+rNrUmNDf45+VB+60cidoA
         oBrA==
X-Gm-Message-State: AOJu0YyNYi+VrH7+3vASQXcXoOYdFV3R+bwwPPdX5YO/Lunyhn5P+0gM
        h+t4aHjcK0abqMnWD1jh3Ufuog==
X-Google-Smtp-Source: AGHT+IHd0dWBQmcVzl/Sc09z8470seW2mqUteQANveV8Wyi8oC4WS7A3tRbDXqtrjVMvSavtO1/+6Q==
X-Received: by 2002:a19:5f43:0:b0:4ff:70d2:4512 with SMTP id a3-20020a195f43000000b004ff70d24512mr9407798lfj.23.1692912001555;
        Thu, 24 Aug 2023 14:20:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:20:01 -0700 (PDT)
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
Subject: [PATCH v3 09/16] arm64: dts: qcom: msm8996: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:45 +0300
Message-Id: <20230824211952.1397699-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 40 ++++++++++++---------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 44298912b3a3..cdf00d22c3bb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -778,7 +778,7 @@ gcc: clock-controller@300000 {
 				 <&pciephy_0>,
 				 <&pciephy_1>,
 				 <&pciephy_2>,
-				 <&ssusb_phy_0>,
+				 <&usb3phy>,
 				 <&ufsphy 0>,
 				 <&ufsphy 1>,
 				 <&ufsphy 2>;
@@ -3048,7 +3048,7 @@ usb3_dwc3: usb@6a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x06a00000 0xcc00>;
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
+				phys = <&hsusb_phy1>, <&usb3phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 				snps,dis_u2_susphy_quirk;
@@ -3060,32 +3060,26 @@ usb3_dwc3: usb@6a00000 {
 
 		usb3phy: phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
-			reg = <0x07410000 0x1c4>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x07410000 0x1000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
-				<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_USB3_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_CLKREF_CLK>,
+				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3_PHY_BCR>,
-				<&gcc GCC_USB3PHY_PHY_BCR>;
-			reset-names = "phy", "common";
-			status = "disabled";
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
-			ssusb_phy_0: phy@7410200 {
-				reg = <0x07410200 0x200>,
-				      <0x07410400 0x130>,
-				      <0x07410600 0x1a8>;
-				#phy-cells = <0>;
-
-				#clock-cells = <0>;
-				clock-output-names = "usb3_phy_pipe_clk_src";
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-			};
+			status = "disabled";
 		};
 
 		hsusb_phy1: phy@7411000 {
-- 
2.39.2

