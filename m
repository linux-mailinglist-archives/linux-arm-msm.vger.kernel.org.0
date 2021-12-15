Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83444751A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239734AbhLOEfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239735AbhLOEfE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:04 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1051BC06173F;
        Tue, 14 Dec 2021 20:35:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B1812CE1BFB;
        Wed, 15 Dec 2021 04:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609ADC3460B;
        Wed, 15 Dec 2021 04:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542899;
        bh=ew2ogF06dXNGi9pAo0OWriibGYCVYjyM2fN8TTJwYQM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vf6dZfgE5Ixs7NA8Eo8bjwYubQ1QD6jZIeRIlBdaap7UsZL+dos98zqCw5GAHu8ES
         iP9JDhcKVqllBGXQ3NhVGchxg7zk0A7G2NTcq29GY6JeZlGQax6RER+tZI/U2R73Nr
         NefBpADVHVTgHvM/uNmF/pkCFZ2nPUmi6VkMLkHwEAgkdMo7B4qsJR4s/y2yxI4Uwe
         K5xMCkHIF1iTiJbITBXSnSnlsjhoexktga3NJUph6h5XthPUaQi5fGyjM4PStW9ccQ
         V+BoK84GMtdTpIqQHtuErErMbZ5xm42Qkwr3Ws5jEhoY3l/k71AHyqwJypt3fcRrDz
         FdFdAnJqP1f2w==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 02/11] arm64: dts: qcom: sm8450: Add tlmm nodes
Date:   Wed, 15 Dec 2021 10:04:31 +0530
Message-Id: <20211215043440.605624-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add tlmm node found in SM8450 SoC and uart pin configuration

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 96fbf4be3f89..fb93d53d3433 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -343,6 +343,8 @@ uart7: serial@99c000 {
 				reg = <0 0x0099c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -366,6 +368,32 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sm8450-tlmm";
+			reg = <0 0x0f100000 0 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 211>;
+			wakeup-parent = <&pdc>;
+
+			qup_uart7_rx: qup-uart7-rx {
+				pins = "gpio26";
+				function = "qup7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			qup_uart7_tx: qup-uart7-tx {
+				pins = "gpio27";
+				function = "qup7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		intc: interrupt-controller@17100000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.31.1

