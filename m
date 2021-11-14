Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CC844F613
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbhKNBbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236252AbhKNBbO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:14 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BFEC061204;
        Sat, 13 Nov 2021 17:28:21 -0800 (PST)
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 4931D3EE3F;
        Sun, 14 Nov 2021 02:28:19 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] arm64: dts: qcom: sm8350-sagami: Enable and populate I2C/SPI nodes
Date:   Sun, 14 Nov 2021 02:27:53 +0100
Message-Id: <20211114012755.112226-14-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on current driver availability, add either nodes or comments regarding
peripherals connected via I2C/SPI.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index b50f04ffee95..c44376aa0742 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -75,6 +75,93 @@ ramoops@ffc00000 {
 	};
 };
 
+&i2c1 {
+	status = "okay";
+	clock-frequency = <1000000>;
+
+	/* Some subset of SONY IMX663 camera sensor @ 38 */
+};
+
+&i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	/* Richwave RTC6226 FM Radio Receiver @ 64 */
+};
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	/* Samsung Touchscreen (needs I2C GPI DMA) @ 48 */
+};
+
+&i2c11 {
+	status = "okay";
+	clock-frequency = <1000000>;
+
+	cs35l41_l: cs35l41@40 {
+		compatible = "cirrus,cs35l41";
+		reg = <0x40>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <36 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		cirrus,boost-peak-milliamp = <4000>;
+		cirrus,boost-ind-nanohenry = <1000>;
+		cirrus,boost-cap-microfarad = <15>;
+		cirrus,asp-sdout-hiz = <3>;
+		cirrus,gpio2-src-select = <2>;
+		cirrus,gpio2-output-enable;
+		#sound-dai-cells = <1>;
+	};
+
+	cs35l41_r: cs35l41@41 {
+		compatible = "cirrus,cs35l41";
+		reg = <0x41>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <36 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		cirrus,boost-peak-milliamp = <4000>;
+		cirrus,boost-ind-nanohenry = <1000>;
+		cirrus,boost-cap-microfarad = <15>;
+		cirrus,asp-sdout-hiz = <3>;
+		cirrus,gpio2-src-select = <2>;
+		cirrus,gpio2-output-enable;
+		#sound-dai-cells = <1>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	/* Clock frequency was not specified downstream, let's park it to 100 KHz */
+	clock-frequency = <100000>;
+
+	/* AMS TCS3490 RGB+IR color sensor @ 72 */
+};
+
+&i2c13 {
+	status = "okay";
+	/* Clock frequency was not specified downstream, let's park it to 100 KHz */
+	clock-frequency = <100000>;
+
+	/* Qualcomm PM8008i/PM8008j (?) @ 8, 9, c, d */
+	/* Dialog SLG51000 CMIC @ 75 */
+};
+
+&i2c15 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	/* NXP SN1X0 NFC @ 28 */
+};
+
+&i2c17 {
+	status = "okay";
+	clock-frequency = <1000000>;
+
+	/* Cirrus Logic CS40L25A boosted haptics driver @ 40 */
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
@@ -100,8 +187,22 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&spi14 {
+	status = "okay";
+
+	/* NXP SN1X0 NFC Secure Element @ 0 */
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>;
+
+	ts_int_default: ts-int-default {
+		pin = "gpio23";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
 };
 
 /* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
-- 
2.33.1

