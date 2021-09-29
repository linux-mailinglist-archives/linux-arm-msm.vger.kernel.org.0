Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECE641BDB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244104AbhI2DpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244108AbhI2DpK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:45:10 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1359FC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:25 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id g184so1305988pgc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SeF7BJ2kfzyMcFuJy1tahUObN4gbIL9fdiiRuZ+6b4Q=;
        b=KXCAU/zWygeg41b6v3T3RvyoXb/WdEEljCV5CbARJ2D7cw9O+w7WW0z62DxMUCzXtP
         4t1mJsjn3egUwmYDY2tvBLoj6IqGmO2oymTziz3rRFVcj0aVHuQu8mQqbkCt6Dq5wlAa
         AqUeJhnG/WF4gwffJJNCA/Zx1brVmmxVIawDsRKReuZJ3xU2wvsi7+AzY2+lszjeZMkZ
         kY7L9eq9affhWG4YNMySMO7quGi0dX8RBLDcIbPDeyaD8bCbMX3VAL0nEUaImVn/Gzkk
         DuCywCtZsamCNo7IZBDO/bLAyt+UL1aZo64SN6R+Rmxooe0zxO/h2Oauw8LdMZw5Jvmg
         +DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SeF7BJ2kfzyMcFuJy1tahUObN4gbIL9fdiiRuZ+6b4Q=;
        b=3dO5j6pP1mbdZZKClgIOajry7MIHerNYNVxi6upbLpe04xqYiieSxH32SVjHqfj6rA
         hubOmw3uknnEttCa8k5Ifm8j7WiCcQSsGgyyjhtL0/FZIw0HEU1dYBpxFzp6ZmJnKr20
         1DGpPyifo6rXlsTSSnDXt6AsdZbhmYk+aam2ovHlGfH89ZiE6oy3ZErf0jBxusTSIXEk
         wC6bynLjG5K87yd6/KHIhK5pr0wmfcCFcM3YXp8sumb2ezkHx00cQvWP0n39Ywg6zmgc
         4kUN9vqxBchAp0sFtCBwO3oMwbQvP44yhtSGScfRt9+0kNBPQRScC2MCSlNMoJY+GYhZ
         looQ==
X-Gm-Message-State: AOAM533yHeUr1gpXufpT8MK3KKIo+AwaxjzX1qJ+iXPtRQ3bFKYS1EJb
        qcy3B8LppnRN8s+KqUCUgEmzLUlnLVTBbw==
X-Google-Smtp-Source: ABdhPJx1vUxti7/4UYmdzW9rLoKWTHIn2tz0AoJQp/DEBrp1eE19HHiM9bthBHfcu4BXU9y8UdK7Ow==
X-Received: by 2002:a63:d30e:: with SMTP id b14mr7673299pgg.454.1632887004679;
        Tue, 28 Sep 2021 20:43:24 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:24 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 08/10] arm64: dts: qcom: Fix IPQ8074 PCIe PHY nodes
Date:   Wed, 29 Sep 2021 11:42:51 +0800
Message-Id: <20210929034253.24570-9-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 PCIe PHY nodes are broken in the many ways:

- '#address-cells', '#size-cells' and 'ranges' are missing.
- Child phy/lane node is missing, and the child properties like
  '#phy-cells' and 'clocks' are mistakenly put into parent node.
- The clocks properties for parent node are missing.

Fix them to get the nodes comply with the bindings schema.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 46 +++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 2e4e1399e276..dfdd3e4a4087 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -174,34 +174,60 @@
 			status = "disabled";
 		};
 
-		pcie_phy0: phy@86000 {
+		pcie_qmp0: phy@86000 {
 			compatible = "qcom,ipq8074-qmp-pcie-phy";
 			reg = <0x00086000 0x1000>;
-			#phy-cells = <0>;
-			clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
-			clock-names = "pipe_clk";
-			clock-output-names = "pcie20_phy0_pipe_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 
+			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
+				<&gcc GCC_PCIE0_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
 			resets = <&gcc GCC_PCIE0_PHY_BCR>,
 				<&gcc GCC_PCIE0PHY_PHY_BCR>;
 			reset-names = "phy",
 				      "common";
 			status = "disabled";
+
+			pcie_phy0: phy@86200 {
+				reg = <0x86200 0x16c>,
+				      <0x86400 0x200>,
+				      <0x86800 0x4f4>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "pcie_0_pipe_clk";
+			};
 		};
 
-		pcie_phy1: phy@8e000 {
+		pcie_qmp1: phy@8e000 {
 			compatible = "qcom,ipq8074-qmp-pcie-phy";
 			reg = <0x0008e000 0x1000>;
-			#phy-cells = <0>;
-			clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
-			clock-names = "pipe_clk";
-			clock-output-names = "pcie20_phy1_pipe_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 
+			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
+				<&gcc GCC_PCIE1_AHB_CLK>;
+			clock-names = "aux", "cfg_ahb";
 			resets = <&gcc GCC_PCIE1_PHY_BCR>,
 				<&gcc GCC_PCIE1PHY_PHY_BCR>;
 			reset-names = "phy",
 				      "common";
 			status = "disabled";
+
+			pcie_phy1: phy@8e200 {
+				reg = <0x8e200 0x16c>,
+				      <0x8e400 0x200>,
+				      <0x8e800 0x4f4>;
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+				clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "pcie_1_pipe_clk";
+			};
 		};
 
 		prng: rng@e3000 {
-- 
2.17.1

