Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38BC4751BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239754AbhLOEfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239752AbhLOEfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:31 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C90C06173F;
        Tue, 14 Dec 2021 20:35:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id ED944CE19FE;
        Wed, 15 Dec 2021 04:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEEDC34604;
        Wed, 15 Dec 2021 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542927;
        bh=s9qdFU5s4Bc7u1OfBiWw3v8lMOxZJV5ftKA5FqmSElo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WIcYykmRBOl2SAo8NI9b3Ya9Pv9wQBQw2O/o5/DcCY2eRRVjmOjpPxkUjRwDLQFQe
         Nudxhr/kcRbfwsEmhkQzsvH7i/ICyHMynL1oItXFXhxShj/v5J1pOMjvfyS8KqzEbe
         +tKBy5KkZHaUtHjGPhwcOQItAE9YHXeAjHPawXLalvAWqvTyW0FK27mCUEAvi8yHtw
         E/yX2f/tADaEER7EGuzxW2Z218GbZR+bghU/DTh+rQLQ24LMg3ywwwe5kY24Sx4nCp
         xIByNWQ6wgugnkML8iFXGYwdDJFgvRhvnyzeCahaA7bWhtpQtOD+OlLvTffDnh0p0A
         FFJ8f/177xKWg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 11/11] arm64: dts: qcom: sm8450: add i2c13 and i2c14 device nodes
Date:   Wed, 15 Dec 2021 10:04:40 +0530
Message-Id: <20211215043440.605624-12-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add device tree nodes for two i2c blocks: i2c13 and i2c14.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56e3e8f771bd..62082ed5335d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -582,6 +582,44 @@ uart7: serial@99c000 {
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
+				pinctrl-0 = <&qup_i2c13_data_clk>;
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
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
@@ -609,6 +647,20 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 211>;
 			wakeup-parent = <&pdc>;
 
+			qup_i2c13_data_clk: qup-i2c13-data-clk {
+				pins = "gpio48", "gpio49";
+				function = "qup13";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk {
+				pins = "gpio52", "gpio53";
+				function = "qup14";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_uart7_rx: qup-uart7-rx {
 				pins = "gpio26";
 				function = "qup7";
-- 
2.31.1

