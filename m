Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8340C787A43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243681AbjHXVU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243671AbjHXVUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121F21BC9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:09 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so3507041fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912007; x=1693516807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2cQbFAa2dZ8daCARAy1nE0Yfl5a2H4VUsq7LUs1D2Q=;
        b=V2snjtbLmf4S+8yNVPkHG0ezZhmiEjEIE6sP3FJTjUyMedWm5lXKPvUiZlR7pFe0VQ
         /AuDAAbOfDFr5nGai9Y2VVu1XavXBKp2cAshCmpw2fLIsqragsKGc32zoazGobiniGiD
         UkC8mAFXG2cruDSoyX5wEKc8ryhEQn2Ep8RjaZjgJ0V5Tq+h9uKqBH/NzPdONuxHeEzy
         /ZGHzSCJ/6NJa/lJJCP6YTxMPM+jdeye+uXYJRxNnFUgkNELx1FDm4ne3MzkP/Y7U/Ip
         UkJjj80+b18MxQdZk0kBbw8jEdc3F/+l6RXna4RlPtvFGVTb8S7R+4UdhPboGZIfGXCK
         ucpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912007; x=1693516807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2cQbFAa2dZ8daCARAy1nE0Yfl5a2H4VUsq7LUs1D2Q=;
        b=AmB11ojrU42M8izcgv59fAuDsRp1zQKQDNnyGK/54FwHAxjCxFP6x4sNx6ad1QAczq
         OZnyejzs62irbawjXdlv3Easpjm0RdlMw2umf6IBehx7+ZkEj33v5mZU6u7Av/h/5Fz+
         OpXKzYpnZomI9V8AOPymRtmfvkt7bPcWWfRVHrIGs63T765eqzpwKaRQgpwMZlDK+N63
         6uIxqThcGzAogCe8p5wb9v2ZUVUkO+eHsF2sDQllJpWXpEcK8NP8mB9E6llv4eEmFAcx
         l9IrrsYeR+HiNdzP3ghlIA0Vxk1ga79XC5OkbIMbH+rspczaX4TEsUpMI8+ccqWM61+1
         YUGQ==
X-Gm-Message-State: AOJu0YzUgKQ+/cDjCIeNxFoJkjDqiO1WcCiAT07hZmnX0FYpPvxLhWVB
        lecaoBk/+PO8QknnRlzp7/G4+w==
X-Google-Smtp-Source: AGHT+IGOtvbHAfKUQzmXtpMF+lbgcH2+b2VWk4P465JPvUYZs+fN5kZkjSwf23XjGk/kHkN9ZQqS9Q==
X-Received: by 2002:a05:6512:3da7:b0:4fb:7cea:882a with SMTP id k39-20020a0565123da700b004fb7cea882amr14760939lfv.3.1692912007470;
        Thu, 24 Aug 2023 14:20:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:20:07 -0700 (PDT)
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
Subject: [PATCH v3 16/16] ARM: dts: qcom-sdx65: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:52 +0300
Message-Id: <20230824211952.1397699-17-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 35 +++++++++++---------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 1a3583029a64..27e2cc84c363 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -233,32 +233,27 @@ usb_hsphy: phy@ff4000 {
 
 		usb_qmpphy: phy@ff6000 {
 			compatible = "qcom,sdx65-qmp-usb3-uni-phy";
-			reg = <0x00ff6000 0x1c8>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x00ff6000 0x2000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_PRIM_CLKREF_EN>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
-			resets = <&gcc GCC_USB3PHY_PHY_BCR>,
-				 <&gcc GCC_USB3_PHY_BCR>;
-			reset-names = "phy", "common";
+			resets = <&gcc GCC_USB3_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
 
 			status = "disabled";
 
-			usb_ssphy: phy@ff6200 {
-				reg = <0x00ff6e00 0x160>,
-				      <0x00ff7000 0x1ec>,
-				      <0x00ff6200 0x1e00>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		system_noc: interconnect@1620000 {
@@ -520,7 +515,7 @@ usb_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x1a0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_hsphy>, <&usb_ssphy>;
+				phys = <&usb_hsphy>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.39.2

