Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92F2400498
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 20:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350399AbhICSKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 14:10:32 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:38001 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350383AbhICSKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 14:10:31 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4D8261F73C;
        Fri,  3 Sep 2021 20:09:27 +0200 (CEST)
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
Subject: [PATCH 6/7] arm64: dts: qcom: msm8998-xperia: Add camera regulators
Date:   Fri,  3 Sep 2021 20:09:23 +0200
Message-Id: <20210903180924.1006044-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All of the machines of the Sony Yoshino platform are equipped with
two cameras, sharing the same regulators configuration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 80c2cd7ae0eb..5fbe5abf4133 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -30,6 +30,38 @@ board_vbat: vbat-regulator {
 		regulator-boot-on;
 	};
 
+	cam0_vdig_vreg: cam0-vdig {
+		compatible = "regulator-fixed";
+		regulator-name = "cam0_vdig";
+		startup-delay-us = <0>;
+		enable-active-high;
+		gpio = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_vdig_default>;
+	};
+
+	cam1_vdig_vreg: cam1-vdig {
+		compatible = "regulator-fixed";
+		regulator-name = "cam1_vdig";
+		startup-delay-us = <0>;
+		enable-active-high;
+		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_vdig_default>;
+		vin-supply = <&vreg_s3a_1p35>;
+	};
+
+	cam_vio_vreg: cam-vio-vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_vio_vreg";
+		startup-delay-us = <0>;
+		enable-active-high;
+		gpio = <&pmi8998_gpio 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_vio_default>;
+		vin-supply = <&vreg_lvs1a_1p8>;
+	};
+
 	touch_vddio_vreg: touch-vddio-vreg {
 		compatible = "regulator-fixed";
 		regulator-name = "touch_vddio_vreg";
@@ -284,6 +316,16 @@ cam_snapshot_pin_a: cam-snapshot-btn-active {
 };
 
 &pmi8998_gpio {
+	cam_vio_default: cam-vio-active {
+		pins = "gpio1";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+		drive-push-pull;
+		output-low;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		power-source = <1>;
+	};
+
 	vib_default: vib-en {
 		pins = "gpio5";
 		function = PMIC_GPIO_FUNC_NORMAL;
@@ -547,6 +589,20 @@ cci1_default: cci1-default {
 		drive-strength = <2>;
 	};
 
+	cam0_vdig_default: cam0-vdig-default {
+		pins = "gpio21";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam1_vdig_default: cam1-vdig-default {
+		pins = "gpio25";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
 	hall_sensor0_default: acc-cover-open {
 		pins = "gpio124";
 		function = "gpio";
-- 
2.32.0

