Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7880841BDA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244051AbhI2Doz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244067AbhI2Dow (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:44:52 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A17C06174E
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:12 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y1so567326plk.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2S4yGClQSZgmuVRD9a/4dL7gNKQgoI+PuKk7owY775c=;
        b=qDP0JVLCFQwXgFCvkxBm9t4km3NTJAVZKlqpQnO/KJsDy8KsP/azvNJy4Wz2tR5pk4
         gJgY7FKZ+7znpP9yO/a8azdfpxZyCG392dujAWLfqIfTSLGMuKPmanLxjTfLPzmaWNqB
         lu652L6O0tktSNnOUQowzUk6MMPaU8OaHtz91L6+NTcRN3Zuo3E/TkwYXbdCkPF7ReI3
         kS4XbClJ7xSujJsMN1DqnCdOFlRJCx9HHMiFUZz1mFATJbaWdRwnvuo60d2jkExa2Z7d
         NH8UtkI2NhVpictLpB1qrd9FHYqvgDn5RcPBNite9RI9tak227hmNna2sT3X10VmBMFM
         +WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2S4yGClQSZgmuVRD9a/4dL7gNKQgoI+PuKk7owY775c=;
        b=e2sXGKrStlO3tIRcG4cBb4vRRS2cE5SgsrQclu1JzxUe17lRhj9Oev9K65KQv9rbm+
         EVEebPNWj5bG87xPtsrZlTeKBX7A57shiU0hvIZEBDd6sdxwm/3scDNSV1VZi/I+RKnF
         NpfmDtCKJsE10yfu/2lIEaLN4oErbglJddYyT8P8z8Mrx9cvrHRkdGv/3V7L1Afa5I6h
         R+9498sxfLlbRXfSt0fIMCddFE8af6jxyVz3G0BWxFrsXMogD1rDQTscGChpbidxiGvt
         eVBNKXD/g4IvhEePW9067Q55D6tpJbIseNU5MGcAppBHQk9vXEHCiLRXFlRYNYzZ7HOZ
         RVbA==
X-Gm-Message-State: AOAM530TXP/fTe1tCqzTjXwGCsFHH4CFoc4YMdtFjz4GxOqTnXkrMQ2i
        Vw+ii1qg12YtZnGGlqaw6Dk3vQ==
X-Google-Smtp-Source: ABdhPJwg9KsJ3amPlcAiziIFqnvDQf7ayJQhQETQytogxHh6/Otv4nk7iVdha8An6aRj2YEu1nDnCA==
X-Received: by 2002:a17:90b:4a09:: with SMTP id kk9mr3901602pjb.103.1632886992093;
        Tue, 28 Sep 2021 20:43:12 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:11 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 03/10] arm64: dts: qcom: msm8996: Move '#clock-cells' to QMP PHY child node
Date:   Wed, 29 Sep 2021 11:42:46 +0800
Message-Id: <20210929034253.24570-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'#clock-cells' is a required property of QMP PHY child node, not itself.
Move it to fix the dtbs_check warnings.

There are only '#clock-cells' removal from SM8350 QMP PHY nodes, because
child nodes already have the property.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 3 ---
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index db333001df4d..0c7dbdc861c1 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -91,7 +91,6 @@
 		ssphy_1: phy@58000 {
 			compatible = "qcom,ipq8074-qmp-usb3-phy";
 			reg = <0x00058000 0x1c4>;
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -112,6 +111,7 @@
 				      <0x00058800 0x1f8>,     /* PCS  */
 				      <0x00058600 0x044>;     /* PCS misc*/
 				#phy-cells = <0>;
+				#clock-cells = <1>;
 				clocks = <&gcc GCC_USB1_PIPE_CLK>;
 				clock-names = "pipe0";
 				clock-output-names = "gcc_usb1_pipe_clk_src";
@@ -134,7 +134,6 @@
 		ssphy_0: phy@78000 {
 			compatible = "qcom,ipq8074-qmp-usb3-phy";
 			reg = <0x00078000 0x1c4>;
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -155,6 +154,7 @@
 				      <0x00078800 0x1f8>,     /* PCS  */
 				      <0x00078600 0x044>;     /* PCS misc*/
 				#phy-cells = <0>;
+				#clock-cells = <1>;
 				clocks = <&gcc GCC_USB0_PIPE_CLK>;
 				clock-names = "pipe0";
 				clock-output-names = "gcc_usb0_pipe_clk_src";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 52df22ab3f6a..a190ed891a62 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -582,7 +582,6 @@
 		pcie_phy: phy@34000 {
 			compatible = "qcom,msm8996-qmp-pcie-phy";
 			reg = <0x00034000 0x488>;
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -604,6 +603,7 @@
 				      <0x00035400 0x1dc>;
 				#phy-cells = <0>;
 
+				#clock-cells = <1>;
 				clock-output-names = "pcie_0_pipe_clk_src";
 				clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
 				clock-names = "pipe0";
@@ -2586,7 +2586,6 @@
 		usb3phy: phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
 			reg = <0x07410000 0x1c4>;
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -2607,6 +2606,7 @@
 				      <0x07410600 0x1a8>;
 				#phy-cells = <0>;
 
+				#clock-cells = <1>;
 				clock-output-names = "usb3_phy_pipe_clk_src";
 				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 34039b5c8017..f3bd1197d65e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1981,7 +1981,6 @@
 			compatible = "qcom,msm8998-qmp-usb3-phy";
 			reg = <0x0c010000 0x18c>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -2002,6 +2001,7 @@
 				      <0xc010600 0x128>,
 				      <0xc010800 0x200>;
 				#phy-cells = <0>;
+				#clock-cells = <1>;
 				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
 				clock-output-names = "usb3_phy_pipe_clk_src";
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e91cd8a5e535..9c44e62a9cd9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1070,7 +1070,6 @@
 			reg = <0 0x01d87000 0 0xe10>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			#clock-cells = <1>;
 			ranges;
 			clock-names = "ref",
 				      "ref_aux";
@@ -1205,7 +1204,6 @@
 			      <0 0x088e8000 0 0x20>;
 			reg-names = "reg-base", "dp_com";
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -1238,7 +1236,6 @@
 			compatible = "qcom,sm8350-qmp-usb3-uni-phy";
 			reg = <0 0x088eb000 0 0x200>;
 			status = "disabled";
-			#clock-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
2.17.1

