Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4192F327260
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhB1NJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:09:54 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:50159 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhB1NJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:52 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 7158C1F548;
        Sun, 28 Feb 2021 14:08:48 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: qcom: msm8996: Add BLSP2_I2C5 and BLSP2_I2C6
Date:   Sun, 28 Feb 2021 14:08:23 +0100
Message-Id: <20210228130831.203765-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the fifth and sixth I2C host on the second BLSP, used for
various board-specific peripherals.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c45350cefdc8..5bc9473551ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2438,6 +2438,35 @@ blsp2_i2c2: i2c@75b6000 {
 			status = "disabled";
 		};
 
+		blsp2_i2c5: i2c@75b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x75b9000 0x1000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				<&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp2_i2c5_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_i2c6: i2c@75ba000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x75ba000 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				<&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c6_default>;
+			pinctrl-1 = <&blsp2_i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_spi6: spi@75ba000{
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x075ba000 0x600>;
-- 
2.30.1

