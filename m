Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B3564BCD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 20:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236792AbiLMTLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 14:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbiLMTKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 14:10:50 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691DE248FE
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 11:10:48 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id h10so4344761ljk.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 11:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts/j2CHYg1kPm6cKPUq2V9hf2EsZAdlZm5xdzR+Qb20=;
        b=F61no4iBYe7WADg1b5OwnJFFwNtT9IxMVRaCN4JwLtW7bINFK3JVPwj4fbgGE4lcv2
         fsRThwY7svqFVHUk+PJE5EuU0bLGxF/vRRy7CKw8f+1YmcOx67gIbBlEHcoCRyv9+nMM
         WWzHM8dGwc5gtS/wX2RZC76Hge1DxEG34cZqxYBOoWBXHLRYYm1S+p2kBWmaZWUZ2QhJ
         R4U/pAsR4ImQBGcCsrZKQDavD/sJnhuZEO2oziqDE+wVpEeEY4217kIJo6USUA0nfmbm
         Ywl6PgxfXyHl0LHHKAxGEzIaL+2pEsM/rH3dNkt8PgqSM1D9G61gvmG6Zov7TZYfrOx+
         t4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts/j2CHYg1kPm6cKPUq2V9hf2EsZAdlZm5xdzR+Qb20=;
        b=mO1vvVteD+wPuSX2zYH8mt+EUe2tcgJnlc5QvQbRPxkaYn8ctqIS59jO6s1tOaK1WJ
         ysluNyWJtdONwZvyDCXSkiZP2xLrYWO+ZVkMZrwyf+QH25ilmE8FyyMUiWuIoyqMjdJy
         MoJ0lgm8aA0fJ1eDLwZAKUJXWw5J3DXxr9TakNbpkEAHiuGJzj/LR7k5Wh4g7ksGe65M
         8CD7M2j4mjOCtP+S73SQoxAVdWUZP4xSugLT402JdmoeyYad7i++QwPH9+VFNrqr18I/
         yT4uuwX1/rYulLx5JnK19rrlUDt+txi6Fr4wXE3SO452hYixffeqsQ6GR5IXvwCJHZQe
         uRyw==
X-Gm-Message-State: ANoB5pmHAnqb2PWNlWWStA1PqEOgSVbKctafx4N3cqiuVGlfxzIWSKx9
        9JI2AjJeY7il2a6nJeHdP78zFTPMnWeT43kp
X-Google-Smtp-Source: AA0mqf4mkXFIBu8VurPY5NeKDJDXBMhBChTmgaDR0Mryrd8K8gEc0+m7U3UDMuUnxAFxfNaz4kkOLA==
X-Received: by 2002:a2e:be85:0:b0:26f:db34:a151 with SMTP id a5-20020a2ebe85000000b0026fdb34a151mr6879475ljr.20.1670958646572;
        Tue, 13 Dec 2022 11:10:46 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id w28-20020a05651c119c00b0026dfbdfc1ddsm372023ljo.11.2022.12.13.11.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:10:46 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sm8450-nagara: Set up camera regulators
Date:   Tue, 13 Dec 2022 20:10:34 +0100
Message-Id: <20221213191036.611241-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213191036.611241-1-konrad.dybcio@linaro.org>
References: <20221213191036.611241-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set up gpio-controlled fixed regulators for camera on PDX223 and fix
up the existing ones in common and PDX224 trees.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../qcom/sm8450-sony-xperia-nagara-pdx223.dts | 38 +++++++++++++++++++
 .../qcom/sm8450-sony-xperia-nagara-pdx224.dts | 15 +++++++-
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   | 16 +++++++-
 3 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
index 561cd4f09ab7..daf2f91f356e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
@@ -11,6 +11,26 @@
 / {
 	model = "Sony Xperia 1 IV";
 	compatible = "sony,pdx223", "qcom,sm8450";
+
+	imx316_lvdd_regulator: imx316-lvdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "imx316_lvdd_regulator";
+		gpio = <&pm8350b_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_pwr_ld_en>;
+	};
+
+	tcs3490_vdd_regulator: rgbcir-vdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "tcs3490_vdd_regulator";
+		gpio = <&pm8350c_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgbc_ir_pwr_en>;
+	};
 };
 
 &pm8350b_gpios {
@@ -22,6 +42,15 @@ &pm8350b_gpios {
 			  "CAM_PWR_LD_EN",
 			  "NC",
 			  "FOCUS_N";
+
+	cam_pwr_ld_en: cam-pwr-ld-en-state {
+		pins = "gpio6";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <0>;
+		drive-push-pull;
+		output-low;
+	};
 };
 
 &pm8350c_gpios {
@@ -34,6 +63,15 @@ &pm8350c_gpios {
 			  "NC",
 			  "NC",
 			  "WIDEC_PWR_EN";
+
+	rgbc_ir_pwr_en: rgbc-ir-pwr-en-state {
+		pins = "gpio6";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <1>;
+		drive-push-pull;
+		output-low;
+	};
 };
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts
index fc9d74d0f227..dc4de2d3fe48 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dts
@@ -12,11 +12,14 @@ / {
 	model = "Sony Xperia 5 IV";
 	compatible = "sony,pdx224", "qcom,sm8450";
 
-	imx563_vdig_vreg: imx563-vdig-regulator {
+	imx563_vdig_regulator: imx563-vdig-regulator {
 		compatible = "regulator-fixed";
-		regulator-name = "imx563_vdig_vreg";
+		regulator-name = "imx563_vdig_regulator";
 		gpio = <&tlmm 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&uwidec_pwr_en>;
 	};
 };
 
@@ -254,4 +257,12 @@ &tlmm {
 			  "APPS_I2C_0_SCL",
 			  "CCI_I2C3_SDA",
 			  "CCI_I2C3_SCL";
+
+	uwidec_pwr_en: uwidec-pwr-en-state {
+		pins = "gpio22";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index 3d96b6757aa3..e26bd077d3d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2022, Konrad Dybcio <konrad.dybcio@somainline.org>
  */
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8450.dtsi"
 #include "pm8350.dtsi"
@@ -93,11 +94,14 @@ ramoops@ffc00000 {
 	};
 
 	/* Sadly, the voltages for these GPIO regulators are unknown. */
-	imx650_vana_vreg: imx650-vana-regulator {
+	imx650_vana_regulator: imx650-vana-regulator {
 		compatible = "regulator-fixed";
-		regulator-name = "imx650_vana_vreg";
+		regulator-name = "imx650_vana_regulator";
 		gpio = <&tlmm 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&telec_pwr_en>;
 	};
 
 	vph_pwr: vph-pwr-regulator {
@@ -703,6 +707,14 @@ ts_int_default: ts-int-default-state {
 		input-enable;
 	};
 
+	telec_pwr_en: telec-pwr-en-state {
+		pins = "gpio23";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio92";
 		function = "gpio";
-- 
2.39.0

