Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF2E40049C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 20:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350384AbhICSKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 14:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350392AbhICSKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 14:10:31 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D82C061757;
        Fri,  3 Sep 2021 11:09:30 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 347121F54D;
        Fri,  3 Sep 2021 20:09:26 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/7] arm64: dts: qcom: msm8998-xperia: Add RMI4 touchscreen support
Date:   Fri,  3 Sep 2021 20:09:19 +0200
Message-Id: <20210903180924.1006044-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All of the devices in the Sony Yoshino platform are using a Synaptics
RMI4-compatible touch IC with identical pins and supplies: enable the
I2C-5 bus and add the rmi4-i2c node along with the required pin
configurations.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index b07cbc759807..2fe53e4675d5 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -30,6 +30,15 @@ board_vbat: vbat-regulator {
 		regulator-boot-on;
 	};
 
+	touch_vddio_vreg: touch-vddio-vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_vddio_vreg";
+		startup-delay-us = <10000>;
+		gpio = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_vddio_en>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -134,6 +143,42 @@ ramoops@ffc00000 {
 	};
 };
 
+&blsp1_i2c5 {
+	status = "okay";
+	clock-frequency = <355000>;
+
+	touchscreen: synaptics-rmi4-i2c@2c {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x2c>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_n>;
+
+		vdd-supply = <&vreg_l28_3p0>;
+		vio-supply = <&touch_vddio_vreg>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <1000>;
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
+};
+
+&blsp1_i2c5_sleep {
+	bias-disable;
+};
+
 &blsp2_uart1 {
 	status = "okay";
 };
@@ -448,6 +493,21 @@ hall_sensor0_default: acc-cover-open {
 		drive-strength = <2>;
 		input-enable;
 	};
+
+	ts_int_n: ts-int-n {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_vddio_en: ts-vddio-en-default {
+		pins = "gpio133";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+		output-low;
+	};
 };
 
 /*
-- 
2.32.0

