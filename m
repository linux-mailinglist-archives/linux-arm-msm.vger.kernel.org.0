Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AB9464885
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 08:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347663AbhLAHde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 02:33:34 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:55602 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347664AbhLAHd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 02:33:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E65D5CE1D76
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94376C53FD0;
        Wed,  1 Dec 2021 07:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638343805;
        bh=fOecN1+zYsm6d7VARL+K91hTDCpiK30taxsF9RNJCIs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zm/IauwsG7f2K0HZWHzC6WMGGlR626m26E+qpb68NZXEAGbsrCHLoZZ78GtP/++zb
         4xtybBJO7asIVTF7v95U4o1kW4hCqSkyS7RnjpahYYiqBrsdevN8GD5lpE8Oby9+84
         0lfOkMWMuKddCUnJNpOCd2BnFQkW36GF3PaLu3NO0l5E8Xl4geCN6TaSTdxk3xTOH2
         xD1Q4ejSQmSIFMcuODQDgPPrHC8PG392gr5/p8Pc7oeV5mPBTIJ4ZfqLthXzbMRn8y
         /BzREmlbe9Oc6w7TY1lhcuDXc6HR4sL9hcvsea0mfuC345lh7v0E+YVdV5ch4X9kEe
         TFYN2gehCOnyQ==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 15/15] arm64: dts: qcom: sm8450: add i2c13 and i2c14 device nodes
Date:   Wed,  1 Dec 2021 12:59:15 +0530
Message-Id: <20211201072915.3969178-16-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201072915.3969178-1-vkoul@kernel.org>
References: <20211201072915.3969178-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add device tree nodes for two i2c blocks: i2c13 and i2c14.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 64 ++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 29c5abcfa074..40c739b842ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -587,6 +587,44 @@ uart7: serial@99c000 {
 			};
 		};
 
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x00ac0000 0x0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			i2c13: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c13_default_state>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c14: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a98000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c14_default_state>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		config_noc: interconnect@1500000 {
 			compatible = "qcom,sm8450-config-noc";
 			reg = <0 0x01500000 0 0x1c000>;
@@ -687,6 +725,32 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 211>;
 			wakeup-parent = <&pdc>;
 
+			qup_i2c13_default_state: qup-i2c13-default-state {
+				mux {
+					pins = "gpio48", "gpio49";
+					function = "qup13";
+				};
+
+				config {
+					pins = "gpio48", "gpio49";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			qup_i2c14_default_state: qup-i2c14-default-state {
+				mux {
+					pins = "gpio52", "gpio53";
+					function = "qup14";
+				};
+
+				config {
+					pins = "gpio49", "gpio50";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
 			qup_uart7_default_state: qup-uart3-default-state {
 				rx {
 					pins = "gpio26";
-- 
2.31.1

