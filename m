Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAEA6DDCBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 15:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjDKNt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 09:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjDKNtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 09:49:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D1B1BDA
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:49:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r27so10542910lfe.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681220962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mj8ur59QbPiShKYjIzqXNIIKKVvhR7cR6mtjrYfL6LA=;
        b=ZuNq/wx7JgknFqATrbdzhtaGggW3L6wfnYBqKPa7wJfvhXHHvFooSfClMbyGqf3ny+
         Ic27mTkDGMbgS14Qll/yiEbz9cP+ME8GDlcT7Xh0IGLXvpToIhW4+VdwWacVB8QQVifU
         2v97vWs//jcg9b6MnXLA6NrSjxC3iUkvQlXnM8ZLSq3VVJ8s0qRV7l0+qNLdKah8dWRU
         5xTrFa4gaWiFCINzJioTy0+KgKqyezE33uiHnXXxrYQiPN106cJEcbYgqOopQwBjlIGI
         lbwcpnRIjv4Bxja1ac2P7vlgAmow7Mgt8bctoZsV9H+YP1NwXsCJoeVYU3FNqrye/bJW
         9a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681220962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mj8ur59QbPiShKYjIzqXNIIKKVvhR7cR6mtjrYfL6LA=;
        b=sfmqXd7oO9CEY+im9MU61Uta2igbFT4wYr8ArLzTHt+jVgMOt0r0xzF+0OTu5DGOVg
         wxHzJGoZt19Gvwtq1uYeYvgfpykWNuzh6BM0GalAktVcrQWyUkMxh9/ciuBboGg2Bhvz
         fHOjCSddhNuKvgL+Wlm3S53A3kYUXQkHG25pgzKF2jFlvFotjNgJb+ppbNMlEpADUCRz
         YpXHYSKlgTpdxJAnWu61DmU5QenYuglTpS+A88iHG2jAXD42oX7SJDcHrdQMD2Vm+6Zc
         wvpdbl/JqYQtxFceCPyHyX811UF0uIsyDCW0MxNKghNACNW84XsbHw19Z1wm8HB40muy
         nh1g==
X-Gm-Message-State: AAQBX9ebwPUo0bzxrYXWovi2C+F13+zfitTSeDpN/cQHRiBuy3BquDnJ
        ZJGe5vXeCTbaoDPtmI51S5orXQ==
X-Google-Smtp-Source: AKy350YAl2csQzDqATc/+xnxNNsoN6HWJGxFX77A9M5UC11sIDUiru+BH4WIaZfCBD7RSMyyyTLHhg==
X-Received: by 2002:a05:6512:6c8:b0:4eb:2b62:134f with SMTP id u8-20020a05651206c800b004eb2b62134fmr3739385lff.16.1681220962309;
        Tue, 11 Apr 2023 06:49:22 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id y9-20020ac255a9000000b004eb2d6160a4sm2563707lfg.32.2023.04.11.06.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:49:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Apr 2023 15:49:17 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sm8150-kumano: Set up camera fixed
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230315-topic-kumano_dts0-v1-3-f1852c2a2378@linaro.org>
References: <20230315-topic-kumano_dts0-v1-0-f1852c2a2378@linaro.org>
In-Reply-To: <20230315-topic-kumano_dts0-v1-0-f1852c2a2378@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681220957; l=3997;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=oVP7cBYQoOfROeLA/luuEMF40U5syFytYO2xaUCTnJ0=;
 b=pUQoVLDlZ6TXRgSv2Eqw6JOGG2yyO0INxHGwTEusIq5EfYsc+smOStt6PlNlX2dgUrxVhWk07czy
 wEcRHeW7BEUTpm+g5JFcfavyNxFkEcaew6qlNvyTzpPeO4+NdC8+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sony - as per usual - used a whole bunch of GPIO-gated fixed
voltage regulators for camera sensors on Kumano. Describe them
and the corresponding pins.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index d1a3ab836019..5fa0a83a4b2c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8150.dtsi"
 #include "pm8150.dtsi"
@@ -81,6 +82,66 @@ key-vol-down {
 		};
 	};
 
+	cam0_vdig_vreg: cam0-vdig-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "camera0_vdig_vreg";
+		gpio = <&tlmm 22 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&main_cam_pwr_en>;
+		pinctrl-names = "default";
+	};
+
+	cam1_vdig_vreg: cam1-vdig-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "camera1_vdig_vreg";
+		gpio = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&sub_cam_pwr_en>;
+		pinctrl-names = "default";
+	};
+
+	cam2_vdig_vreg: cam2-vdig-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "camera2_vdig_vreg";
+		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&chat_cam_pwr_en>;
+		pinctrl-names = "default";
+	};
+
+	cam3_vdig_vreg: cam3-vdig-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "camera3_vdig_vreg";
+		gpio = <&pm8150_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&supwc_pwr_en>;
+		pinctrl-names = "default";
+	};
+
+	cam_vmdr_vreg: cam-vmdr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vmdr_vreg";
+		gpio = <&pm8150l_gpios 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&main_cam_pwr_vmdr_en>;
+		pinctrl-names = "default";
+	};
+
+	rgbcir_vreg: rgbcir-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "rgbcir_vreg";
+		gpio = <&tlmm 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rgbc_ir_pwr_en>;
+		pinctrl-names = "default";
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -474,6 +535,15 @@ vol_down_n: vol-down-n-state {
 		bias-pull-up;
 		input-enable;
 	};
+
+	supwc_pwr_en: supwc-pwr-en-state {
+		pins = "gpio7";
+		function = "normal";
+		qcom,drive-strength = <1>;
+		power-source = <1>;
+		drive-push-pull;
+		output-low;
+	};
 };
 
 &pm8150b_gpios {
@@ -520,6 +590,15 @@ &pm8150l_gpios {
 			  "NC", /* GPIO_10 */
 			  "NC",
 			  "NC";
+
+	main_cam_pwr_vmdr_en: main-cam-pwr-vmdr-en-state {
+		pins = "gpio3";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <0>;
+		drive-push-pull;
+		output-low;
+	};
 };
 
 &pon_pwrkey {
@@ -716,6 +795,38 @@ &tlmm {
 			  "WL_CMD_DATA_CHAIN1",
 			  "WL_BT_COEX_CLK",
 			  "WL_BT_COEX_DATA";
+
+	main_cam_pwr_en: main-cam-pwr-en-state {
+		pins = "gpio22";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	chat_cam_pwr_en: chat-cam-pwr-en-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	rgbc_ir_pwr_en: rgbc-ir-pwr-en-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	sub_cam_pwr_en: sub-cam-pwr-en-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
 };
 
 &uart2 {

-- 
2.40.0

