Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E285D3D98AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhG1W1B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:27:01 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:57103 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbhG1W0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:35 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 459442006B;
        Thu, 29 Jul 2021 00:26:30 +0200 (CEST)
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
Subject: [PATCH 34/39] arm64: dts: qcom: sdm630-nile: Add Synaptics touchscreen.
Date:   Thu, 29 Jul 2021 00:25:37 +0200
Message-Id: <20210728222542.54269-35-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Delete the node on Ganges devices, as they use a different one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |  2 ++
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 36 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
index aea949265a2d..a4e1fb8ca52d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
@@ -20,4 +20,6 @@ framebuffer@9d400000 {
 	};
 };
 
+/* Ganges devices feature a Novatek touchscreen instead. */
+/delete-node/ &touchscreen;
 /delete-node/ &vreg_l18a_1v8;
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 39636690aa34..e589b6c0b78e 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -161,7 +161,29 @@ extcon_usb: extcon-usb {
 &blsp_i2c1 {
 	status = "okay";
 
-	/* Synaptics touchscreen */
+	touchscreen: synaptics-rmi4-i2c@70 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts-extended = <&tlmm 45 0x2008>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_active &ts_lcd_id_active>;
+
+		syna,reset-delay-ms = <200>;
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
 
 &blsp_i2c2 {
@@ -541,6 +563,18 @@ &sdhc_1 {
 &tlmm {
 	gpio-reserved-ranges = <8 4>;
 
+	ts_int_active: ts-int-active {
+		pins = "gpio45";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_lcd_id_active: ts-lcd-id-active {
+		pins = "gpio56";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	imx300_vana_default: imx300-vana-default {
 		pins = "gpio50";
 		function = "gpio";
-- 
2.32.0

