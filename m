Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4061B4058C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 16:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344941AbhIIOSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 10:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344818AbhIIOSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 10:18:03 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8390C033279;
        Thu,  9 Sep 2021 05:37:38 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 88DC61FACC;
        Thu,  9 Sep 2021 14:37:36 +0200 (CEST)
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
Subject: [PATCH v2 6/7] arm64: dts: qcom: msm8998-xperia: Add camera regulators
Date:   Thu,  9 Sep 2021 14:37:32 +0200
Message-Id: <20210909123733.367248-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909123733.367248-1-angelogioacchino.delregno@somainline.org>
References: <20210909123733.367248-1-angelogioacchino.delregno@somainline.org>
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
index e2cccc8314be..2c609e2cfc4a 100644
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
@@ -278,6 +310,16 @@ cam_snapshot_pin_a: cam-snapshot-btn-active {
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
@@ -540,6 +582,20 @@ cci1_default: cci1-default {
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

