Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4B72FA62E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406569AbhARQ3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:29:20 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:47277 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405683AbhARQ02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:26:28 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id AD8DB1FCB4;
        Mon, 18 Jan 2021 17:25:05 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] arm64: dts: qcom: msm8994-kitakami: Add Synaptics RMI touchscreen
Date:   Mon, 18 Jan 2021 17:24:26 +0100
Message-Id: <20210118162432.107275-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All Kitakami phones use Synaptics RMI4 touchscreens
attached to the same i2c bus. Configure and enable it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../msm8994-sony-xperia-kitakami-karin.dts    |  2 +
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 45 ++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
index 743a2a076552..4dcf42eafb3a 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -41,3 +41,5 @@ &pm8994_l25 {
 };
 
 /delete-node/ &pm8994_l32;
+/* Z4 tablets use a different touchscreen. */
+/delete-node/ &touchscreen;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index e31c31c2b936..33af174b78ab 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -147,7 +147,34 @@ &blsp_i2c5 {
 &blsp_i2c6 {
 	status = "okay";
 
-	/* Synaptics touchscreen */
+	touchscreen: rmi4-i2c-dev@2c {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <42 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_active &ts_reset_active>;
+
+		vdd-supply = <&pm8994_l22>;
+		vio-supply = <&pm8994_s4>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <220>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
 };
 
 &blsp1_uart2 {
@@ -433,3 +460,19 @@ &sdhc1 {
 	 * vqmmc-supply = <&pm8994_s4>;
 	 */
 };
+
+&tlmm {
+	ts_int_active: ts-int-active {
+		pins = "gpio42";
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
+
+	ts_reset_active: ts-reset-active {
+		pins = "gpio109";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};
-- 
2.29.2

