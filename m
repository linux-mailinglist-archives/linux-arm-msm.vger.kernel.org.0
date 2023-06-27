Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9F173F071
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjF0BYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjF0BYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012E0173C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:35 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f8775126d3so5349108e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829073; x=1690421073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtAvGH3FnqWQ64352UQkgjfZz+txB6mEdhghTnkTdQA=;
        b=GHhODoL+4nQmOcnjpZd6IzMBgeoo57e1JE5fPH5mjklXOt+YgsiWDPFOcnJLUNejqq
         27rbbViSAM1Sd1V2iLODrqYDDNkqvXTImdoc1yMvQDpGYdfkeQdlACahhwoR/GG78aWk
         IzMa/FVfmgsz8Jg11ysRNiCmLjl4x4hJycX0qbWHPI9qh/J+8mL7VgHSBHqK9j5H/z0V
         J5MjeVDRbVEb3808shKwC3+t4Gm7MI/VJkxBNF1OCxA214uCI/3tOQYenow9OELXpdxg
         iaXEzEZgkvI1NKA+MbNYtvCRwUlzEDIHKJ+Ro7yPWaHzqpxwIIxndBo5MOhXlCZYc92v
         Vsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829073; x=1690421073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtAvGH3FnqWQ64352UQkgjfZz+txB6mEdhghTnkTdQA=;
        b=I1avyRBcssy8Nh/m6ELCyH/crU3VTqnEQ2q1Reequ9ZBjY28KL/FIN5xL028tuwU9p
         /7udvfPLsDscTLqBVlIbFgRLNWcl/uI6hphsJ/8iFd0Ybw87GSTQP3dSs9q8wBfoWtC3
         qHQM2b1MNE9ctFaGDsND43mBi9omXOlfYZuapIqf+9dN5iKKTZQ27QZYb6llF+iSg64/
         pViHQxH2BuIl5oszeBCsdy0dAthlGB903Kql66BBsyHiMZx4gO/FiSyKqZmI3UbapJPx
         dGs8tipFlyzXxAV1a3AZRyF66zKAepSobQuYKgTaAzP0TveHYDQgoTQqDv6f8QnugeWT
         unhA==
X-Gm-Message-State: AC+VfDy77QSLgIatAlfgX5fbvl3lTB9+n7pg6m9DfwAYAZJVs+d86+yV
        eVVmLuVZLcEBFww5p53uHwKTzQ==
X-Google-Smtp-Source: ACHHUZ7/coRnD2oqheNzgYa+HYrZdPlhZePGNd8AiwTL3yEF1HzJTxE5b8ZhtoGfsNN8XJ5Hm5oPlg==
X-Received: by 2002:a05:6512:ea7:b0:4f4:c6ab:f119 with SMTP id bi39-20020a0565120ea700b004f4c6abf119mr22526204lfb.64.1687829073033;
        Mon, 26 Jun 2023 18:24:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 12/15] ARM: dts: qcom: apq8064: move RPM regulators to board files
Date:   Tue, 27 Jun 2023 04:24:19 +0300
Message-Id: <20230627012422.206077-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The set of regulators available over the RPM requests is not a property
of the SoC. Move them to board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |  49 ++++----
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  26 ++---
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  33 +++---
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   | 105 ++++++++++--------
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      |  63 -----------
 5 files changed, 115 insertions(+), 161 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index d5dee70620c2..1caa73e20bc9 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -192,22 +192,20 @@ &mdp_dsi1_out {
 &rpm {
 	regulators {
 		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
-		vin_lvs1_3_6-supply = <&pm8921_s4>;
-		vin_lvs4_5_7-supply = <&pm8921_s4>;
-
-
 		vdd_l24-supply = <&pm8921_s1>;
 		vdd_l25-supply = <&pm8921_s1>;
-		vin_lvs2-supply = <&pm8921_s1>;
-
 		vdd_l26-supply = <&pm8921_s7>;
 		vdd_l27-supply = <&pm8921_s7>;
 		vdd_l28-supply = <&pm8921_s7>;
 
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+
 		vdd_ncp-supply = <&pm8921_l6>;
 
 		/* Buck SMPS */
-		s1 {
+		pm8921_s1: s1 {
 			regulator-always-on;
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
@@ -216,7 +214,7 @@ s1 {
 		};
 
 		/* msm otg HSUSB_VDDCX */
-		s3 {
+		pm8921_s3: s3 {
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
@@ -229,55 +227,58 @@ s3 {
 		 * tabla2x-slim-CDC_VDD_CP
 		 * tabla2x-slim-VDDIO_CDC
 		 */
-		s4 {
+		pm8921_s4: s4 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <3200000>;
 			regulator-always-on;
 		};
 
-		s7 {
+		pm8921_s7: s7 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 			qcom,switch-mode-frequency = <3200000>;
 		};
 
 		/* mipi_dsi.1-dsi1_pll_vdda */
-		l2 {
+		pm8921_l2: l2 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-always-on;
 		};
 
 		/* msm_otg-HSUSB_3p3 */
-		l3 {
+		pm8921_l3: l3 {
 			regulator-min-microvolt = <3075000>;
 			regulator-max-microvolt = <3075000>;
 			bias-pull-down;
 		};
 
 		/* msm_otg-HSUSB_1p8 */
-		l4 {
+		pm8921_l4: l4 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
 
 		/* msm_sdcc.1-sdc_vdd */
-		l5 {
+		pm8921_l5: l5 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			regulator-always-on;
 			bias-pull-down;
 		};
 
-		l6 {
+		pm8921_l6: l6 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 		};
 
+		pm8921_l8: l8 {
+		};
+
 		/* mipi_dsi.1-dsi1_avdd */
-		l11 {
+		pm8921_l11: l11 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 			bias-pull-down;
@@ -285,14 +286,14 @@ l11 {
 		};
 
 		/* pwm_power for backlight */
-		l17 {
+		pm8921_l17: l17 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 			regulator-always-on;
 		};
 
 		/* camera, qdsp6 */
-		l23 {
+		pm8921_l23: l23 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
@@ -302,32 +303,32 @@ l23 {
 		 * tabla2x-slim-CDC_VDDA_A_1P2V
 		 * tabla2x-slim-VDDD_CDC_D
 		 */
-		l25 {
+		pm8921_l25: l25 {
 			regulator-min-microvolt = <1250000>;
 			regulator-max-microvolt = <1250000>;
 			bias-pull-down;
 		};
 
-		lvs1 {
+		pm8921_lvs1: lvs1 {
 			bias-pull-down;
 		};
 
-		lvs4 {
+		pm8921_lvs4: lvs4 {
 			bias-pull-down;
 		};
 
-		lvs5 {
+		pm8921_lvs5: lvs5 {
 			bias-pull-down;
 		};
 
-		lvs6 {
+		pm8921_lvs6: lvs6 {
 			bias-pull-down;
 		};
 		/*
 		 * mipi_dsi.1-dsi1_vddio
 		 * pil_riva-pll_vdd
 		 */
-		lvs7 {
+		pm8921_lvs7: lvs7 {
 			bias-pull-down;
 		};
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
index ffd654ab0b57..6472277d1c6d 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
@@ -85,10 +85,6 @@ pinconf {
 
 &rpm {
 	regulators {
-		vin_lvs1_3_6-supply = <&pm8921_s4>;
-		vin_lvs2-supply = <&pm8921_s1>;
-		vin_lvs4_5_7-supply = <&pm8921_s4>;
-
 		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
 		vdd_l24-supply = <&pm8921_s1>;
 		vdd_l25-supply = <&pm8921_s1>;
@@ -96,9 +92,12 @@ regulators {
 		vdd_l27-supply = <&pm8921_s7>;
 		vdd_l28-supply = <&pm8921_s7>;
 
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
 
 		/* Buck SMPS */
-		s1 {
+		pm8921_s1: s1 {
 			regulator-always-on;
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
@@ -106,52 +105,51 @@ s1 {
 			bias-pull-down;
 		};
 
-		s3 {
+		pm8921_s3: s3 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1400000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
 
-		s4 {
+		pm8921_s4: s4 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		s7 {
+		pm8921_s7: s7 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		l3 {
+		pm8921_l3: l3 {
 			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 			bias-pull-down;
 		};
 
-		l4 {
+		pm8921_l4: l4 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
 
-		l5 {
+		pm8921_l5: l5 {
 			regulator-min-microvolt = <2750000>;
 			regulator-max-microvolt = <3000000>;
 			bias-pull-down;
 		};
 
-		l23 {
+		pm8921_l23: l23 {
 			regulator-min-microvolt = <1700000>;
 			regulator-max-microvolt = <1900000>;
 			bias-pull-down;
 		};
 
-		lvs6 {
+		pm8921_lvs6: lvs6 {
 			bias-pull-down;
 		};
-
 	};
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index 12bf8ea3fb93..39c44fae9d14 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -196,10 +196,6 @@ pinconf {
 
 &rpm {
 	regulators {
-		vin_lvs1_3_6-supply = <&pm8921_s4>;
-		vin_lvs2-supply = <&pm8921_s1>;
-		vin_lvs4_5_7-supply = <&pm8921_s4>;
-
 		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
 		vdd_l24-supply = <&pm8921_s1>;
 		vdd_l25-supply = <&pm8921_s1>;
@@ -207,9 +203,12 @@ regulators {
 		vdd_l27-supply = <&pm8921_s7>;
 		vdd_l28-supply = <&pm8921_s7>;
 
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
 
 		/* Buck SMPS */
-		s1 {
+		pm8921_s1: s1 {
 			regulator-always-on;
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
@@ -217,59 +216,63 @@ s1 {
 			bias-pull-down;
 		};
 
-		s3 {
+		pm8921_s3: s3 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1400000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
 
-		s4 {
+		pm8921_s4: s4 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		s7 {
+		pm8921_s7: s7 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		l3 {
+		pm8921_l3: l3 {
 			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 			bias-pull-down;
 		};
 
-		l4 {
+		pm8921_l4: l4 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
 
-		l5 {
+		pm8921_l5: l5 {
 			regulator-min-microvolt = <2750000>;
 			regulator-max-microvolt = <3000000>;
 			bias-pull-down;
 		};
 
-		l6 {
+		pm8921_l6: l6 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			bias-pull-down;
 		};
 
-		l23 {
+		pm8921_l23: l23 {
 			regulator-min-microvolt = <1700000>;
 			regulator-max-microvolt = <1900000>;
 			bias-pull-down;
 		};
 
-		lvs1 {
+		pm8921_lvs1: lvs1 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs6: lvs6 {
 			bias-pull-down;
 		};
 
-		lvs6 {
+		pm8921_hdmi_switch: hdmi-switch {
 			bias-pull-down;
 		};
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 53dd9d79556f..6988bd212924 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -85,23 +85,36 @@ gpio_keys_pin_a: gpio-keys-active-state {
 &riva {
 	pinctrl-names = "default";
 	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
+
+	vddcx-supply = <&pm8921_s3>;
+	vddmx-supply = <&pm8921_l24>;
+	vddpx-supply = <&pm8921_s4>;
+
 	status = "okay";
+
+	iris {
+		vddxo-supply = <&pm8921_l4>;
+		vddrfa-supply = <&pm8921_s2>;
+		vddpa-supply = <&pm8921_l10>;
+		vdddig-supply = <&pm8921_lvs2>;
+	};
 };
 
 &rpm {
 	regulators {
 		vin_l1_l2_l12_l18-supply = <&pm8921_s4>;
-		vin_lvs_1_3_6-supply = <&pm8921_s4>;
-		vin_lvs_4_5_7-supply = <&pm8921_s4>;
-		vin_ncp-supply = <&pm8921_l6>;
-		vin_lvs2-supply = <&pm8921_s4>;
 		vin_l24-supply = <&pm8921_s1>;
 		vin_l25-supply = <&pm8921_s1>;
 		vin_l27-supply = <&pm8921_s7>;
 		vin_l28-supply = <&pm8921_s7>;
 
+		vin_lvs_1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s4>;
+		vin_lvs_4_5_7-supply = <&pm8921_s4>;
+		vin_ncp-supply = <&pm8921_l6>;
+
 		/* Buck SMPS */
-		s1 {
+		pm8921_s1: s1 {
 			regulator-always-on;
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
@@ -109,21 +122,21 @@ s1 {
 			bias-pull-down;
 		};
 
-		s2 {
+		pm8921_s2: s2 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 			qcom,switch-mode-frequency = <1600000>;
 			bias-pull-down;
 		};
 
-		s3 {
+		pm8921_s3: s3 {
 			regulator-min-microvolt = <500000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 			bias-pull-down;
 		};
 
-		s4 {
+		pm8921_s4: s4 {
 			regulator-always-on;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
@@ -132,205 +145,207 @@ s4 {
 			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
 		};
 
-		s7 {
+		pm8921_s7: s7 {
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		s8 {
+		pm8921_s8: s8 {
 			regulator-min-microvolt = <2200000>;
 			regulator-max-microvolt = <2200000>;
 			qcom,switch-mode-frequency = <1600000>;
 		};
 
 		/* PMOS LDO */
-		l1 {
+		pm8921_l1: l1 {
 			regulator-always-on;
 			regulator-min-microvolt = <1100000>;
 			regulator-max-microvolt = <1100000>;
 			bias-pull-down;
 		};
 
-		l2 {
+		pm8921_l2: l2 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
 
-		l3 {
+		pm8921_l3: l3 {
 			regulator-min-microvolt = <3075000>;
 			regulator-max-microvolt = <3075000>;
 			bias-pull-down;
 		};
 
-		l4 {
+		pm8921_l4: l4 {
 			regulator-always-on;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
 
-		l5 {
+		pm8921_l5: l5 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			bias-pull-down;
 		};
 
-		l6 {
+		pm8921_l6: l6 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			bias-pull-down;
 		};
 
-		l7 {
+		pm8921_l7: l7 {
 			regulator-min-microvolt = <1850000>;
 			regulator-max-microvolt = <2950000>;
 			bias-pull-down;
 		};
 
-		l8 {
+		pm8921_l8: l8 {
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
 			bias-pull-down;
 		};
 
-		l9 {
+		pm8921_l9: l9 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 			bias-pull-down;
 		};
 
-		l10 {
+		pm8921_l10: l10 {
 			regulator-min-microvolt = <2900000>;
 			regulator-max-microvolt = <2900000>;
 			bias-pull-down;
 		};
 
-		l11 {
+		pm8921_l11: l11 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 			bias-pull-down;
 		};
 
-		l12 {
+		pm8921_l12: l12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
 
-		l14 {
+		pm8921_l14: l14 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
 
-		l15 {
+		pm8921_l15: l15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 			bias-pull-down;
 		};
 
-		l16 {
+		pm8921_l16: l16 {
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
 			bias-pull-down;
 		};
 
-		l17 {
+		pm8921_l17: l17 {
 			regulator-min-microvolt = <2000000>;
 			regulator-max-microvolt = <2000000>;
 			bias-pull-down;
 		};
 
-		l18 {
+		pm8921_l18: l18 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			bias-pull-down;
 		};
 
-		l21 {
+		pm8921_l21: l21 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
 			bias-pull-down;
 		};
 
-		l22 {
+		pm8921_l22: l22 {
 			regulator-min-microvolt = <2600000>;
 			regulator-max-microvolt = <2600000>;
 			bias-pull-down;
 		};
 
-		l23 {
+		pm8921_l23: l23 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			bias-pull-down;
 		};
 
-		l24 {
+		pm8921_l24: l24 {
 			regulator-min-microvolt = <750000>;
 			regulator-max-microvolt = <1150000>;
 			bias-pull-down;
 		};
 
-		l25 {
+		pm8921_l25: l25 {
 			regulator-always-on;
 			regulator-min-microvolt = <1250000>;
 			regulator-max-microvolt = <1250000>;
 			bias-pull-down;
 		};
 
-		l27 {
+		pm8921_l27: l27 {
 			regulator-min-microvolt = <1100000>;
 			regulator-max-microvolt = <1100000>;
 		};
 
-		l28 {
+		pm8921_l28: l28 {
 			regulator-min-microvolt = <1050000>;
 			regulator-max-microvolt = <1050000>;
 			bias-pull-down;
 		};
 
-		l29 {
+		pm8921_l29: l29 {
 			regulator-min-microvolt = <2000000>;
 			regulator-max-microvolt = <2000000>;
 			bias-pull-down;
 		};
 
 		/* Low Voltage Switch */
-		lvs1 {
+		pm8921_lvs1: lvs1 {
 			bias-pull-down;
 		};
 
-		lvs2 {
+		pm8921_lvs2: lvs2 {
 			bias-pull-down;
 		};
 
-		lvs3 {
+		pm8921_lvs3: lvs3 {
 			bias-pull-down;
 		};
 
-		lvs4 {
+		pm8921_lvs4: lvs4 {
 			bias-pull-down;
 		};
 
-		lvs5 {
+		pm8921_lvs5: lvs5 {
 			bias-pull-down;
 		};
 
-		lvs6 {
+		pm8921_lvs6: lvs6 {
 			bias-pull-down;
 		};
 
-		lvs7 {
+		pm8921_lvs7: lvs7 {
 			bias-pull-down;
 		};
 
-		usb-switch {};
+		pm8921_usb_switch: usb-switch {};
 
-		hdmi-switch {};
+		pm8921_hdmi_switch: hdmi-switch {
+			bias-pull-down;
+		};
 
-		ncp {
+		pm8921_ncp: ncp {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			qcom,switch-mode-frequency = <1600000>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 2a5a3b2fb8e9..36c68ee5be65 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -795,60 +795,6 @@ rpmcc: clock-controller {
 				clocks = <&pxo_board>, <&cxo_board>;
 				clock-names = "pxo", "cxo";
 			};
-
-			regulators {
-				compatible = "qcom,rpm-pm8921-regulators";
-
-				pm8921_s1: s1 {};
-				pm8921_s2: s2 {};
-				pm8921_s3: s3 {};
-				pm8921_s4: s4 {};
-				pm8921_s7: s7 {};
-				pm8921_s8: s8 {};
-
-				pm8921_l1: l1 {};
-				pm8921_l2: l2 {};
-				pm8921_l3: l3 {};
-				pm8921_l4: l4 {};
-				pm8921_l5: l5 {};
-				pm8921_l6: l6 {};
-				pm8921_l7: l7 {};
-				pm8921_l8: l8 {};
-				pm8921_l9: l9 {};
-				pm8921_l10: l10 {};
-				pm8921_l11: l11 {};
-				pm8921_l12: l12 {};
-				pm8921_l14: l14 {};
-				pm8921_l15: l15 {};
-				pm8921_l16: l16 {};
-				pm8921_l17: l17 {};
-				pm8921_l18: l18 {};
-				pm8921_l21: l21 {};
-				pm8921_l22: l22 {};
-				pm8921_l23: l23 {};
-				pm8921_l24: l24 {};
-				pm8921_l25: l25 {};
-				pm8921_l26: l26 {};
-				pm8921_l27: l27 {};
-				pm8921_l28: l28 {};
-				pm8921_l29: l29 {};
-
-				pm8921_lvs1: lvs1 {};
-				pm8921_lvs2: lvs2 {};
-				pm8921_lvs3: lvs3 {};
-				pm8921_lvs4: lvs4 {};
-				pm8921_lvs5: lvs5 {};
-				pm8921_lvs6: lvs6 {};
-				pm8921_lvs7: lvs7 {};
-
-				pm8921_usb_switch: usb-switch {};
-
-				pm8921_hdmi_switch: hdmi-switch {
-					bias-pull-down;
-				};
-
-				pm8921_ncp: ncp {};
-			};
 		};
 
 		usb1: usb@12500000 {
@@ -1528,10 +1474,6 @@ riva: riva-pil@3200800 {
 
 			memory-region = <&wcnss_mem>;
 
-			vddcx-supply = <&pm8921_s3>;
-			vddmx-supply = <&pm8921_l24>;
-			vddpx-supply = <&pm8921_s4>;
-
 			status = "disabled";
 
 			iris {
@@ -1539,11 +1481,6 @@ iris {
 
 				clocks = <&cxo_board>;
 				clock-names = "xo";
-
-				vddxo-supply = <&pm8921_l4>;
-				vddrfa-supply = <&pm8921_s2>;
-				vddpa-supply = <&pm8921_l10>;
-				vdddig-supply = <&pm8921_lvs2>;
 			};
 
 			smd-edge {
-- 
2.39.2

