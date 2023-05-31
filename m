Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184CC7172F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbjEaBQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbjEaBQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:16:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0581810E
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:35 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso4529956e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685495794; x=1688087794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbsAZyU27eGiIY7Cnbju8/Nvcxc0+XDnAh4+N+PWw0M=;
        b=K9JxzYjJZSJJZp4yjd5Hg1RUlq3On79QkWwi/qCUM2S3Ko1vJAzwqSaBIvnbN6LNhJ
         QJ4pCxuKRKquYjmcUfe9kj2aN72KvZqSzfFVrMeoRXqcEcDkvuoqVBd3zm0RkmJEQtYL
         29SOadlHIz2/SnL9kG71USDOLOBfARehD4hD2g8tQbWFw6bv7gg71VuuzeMsddaYPg+L
         6RXsCW49oc7JTeXtn+y21aaguErvRWY9j8XnEGkWwLgIwOPUpZe7zd+IycMzoK9xKsD8
         bgr+pyi5c6jOwbtuCP8cdtayonOwv+935B4vnVjzqXL5FllpaIotVpuS+IQHRXueNIhX
         wSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495794; x=1688087794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbsAZyU27eGiIY7Cnbju8/Nvcxc0+XDnAh4+N+PWw0M=;
        b=LznDdtmkj29kJzlGvZY3tMfDX3ZndbNhmGrNU5cL7b6xWvPEY7UJHRJXh4D4240arH
         OBVwmf6W9M/4NNCL0Kr02yW9KXZUYnTb7jvDevYtZtXkQfRTJh6lFPwSq8geUO/69Tou
         59bs5pC6D9PWaulX2308IIFZSWAAWI0IIGCBFruAy7VHiDzcFQqOk99zyRJMaoJgRfnI
         tR5Xyj5TmIK0FYswQSRRKXR98mR7iiNs8P6fYvf4D3qaobFcthiLHAsBX/3+nOTDpHzl
         Ap2WDsMBPaPPKb9OS7+E1qztsN7iFG79WXoweuXpOLFUMoGKRmynSCD/sNHTD3o26IuS
         rSqA==
X-Gm-Message-State: AC+VfDzevt0N7JO29qcqvEdap1dNwo5znHSVgBF6BMc9LDPNXbJ3J5Tb
        NTr12YmzUwoBARDDhQFUfEUHEA==
X-Google-Smtp-Source: ACHHUZ5Fve4SUhmHbYaeEqHeCRjRgTAJV6fUaFLNP2YIqFeXJrYzr8g/lyMzy8FvWcFrfUZVC0N2Ig==
X-Received: by 2002:ac2:55bc:0:b0:4f4:bc9d:ca00 with SMTP id y28-20020ac255bc000000b004f4bc9dca00mr1470755lfg.39.1685495794077;
        Tue, 30 May 2023 18:16:34 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm505640lfd.128.2023.05.30.18.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:16:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 07/14] arm64: dts: qcom: sc7180: rename labels for DSI nodes
Date:   Wed, 31 May 2023 04:16:16 +0300
Message-Id: <20230531011623.3808538-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently in board files MDSS and DSI nodes stay apart, because labels
for DSI nodes do not have the mdss_ prefix. It was found that grouping
all display-related notes is more useful.

To keep all display-related nodes close in the board files, change DSI
node labels from dsi_* to mdss_dsi_*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sc7180-acer-aspire1.dts     | 32 ++++++------
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 14 ++---
 .../qcom/sc7180-trogdor-parade-ps8640.dtsi    | 10 ++--
 .../qcom/sc7180-trogdor-quackingstick-r0.dts  |  2 +-
 .../qcom/sc7180-trogdor-quackingstick.dtsi    | 52 +++++++++----------
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 10 ++--
 .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  2 +-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 46 ++++++++--------
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 28 +++++-----
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 22 ++++----
 10 files changed, 109 insertions(+), 109 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 2a80f4090085..b637b4270f88 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -143,21 +143,6 @@ reg_tp_3p3: touchpad-regulator {
 	};
 };
 
-&dsi0 {
-	vdda-supply = <&vreg_l3c_1p2>;
-	status = "okay";
-};
-
-&dsi0_out {
-	remote-endpoint = <&sn65dsi86_in>;
-	data-lanes = <0 1 2 3>;
-};
-
-&dsi_phy {
-	vdds-supply = <&vreg_l4a_0p8>;
-	status = "okay";
-};
-
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -269,7 +254,7 @@ port@0 {
 				reg = <0>;
 
 				sn65dsi86_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
@@ -313,6 +298,21 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3c_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi86_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a_0p8>;
+	status = "okay";
+};
+
 &pm6150_adc {
 	thermistor@4e {
 		reg = <ADC5_AMUX_THM2_100K_PU>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index bd9ed03159cf..546db0d90630 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -295,7 +295,11 @@ vreg_bob: bob {
 	};
 };
 
-&dsi0 {
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
 	status = "okay";
 
 	vdda-supply = <&vreg_l3c_1p2>;
@@ -314,7 +318,7 @@ panel@0 {
 
 		port {
 			panel0_in: endpoint {
-				remote-endpoint = <&dsi0_out>;
+				remote-endpoint = <&mdss_dsi0_out>;
 			};
 		};
 	};
@@ -329,15 +333,11 @@ endpoint {
 	};
 };
 
-&dsi_phy {
+&mdss_dsi0_phy {
 	status = "okay";
 	vdds-supply = <&vreg_l4a_0p8>;
 };
 
-&mdss {
-	status = "okay";
-};
-
 &qfprom {
 	vcc-supply = <&vreg_l11a_1p8>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
index 5aa7949b5328..bede23369fed 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
@@ -46,10 +46,6 @@ &pp3300_dx_edp {
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
-&dsi0_out {
-	remote-endpoint = <&ps8640_in>;
-};
-
 edp_brij_i2c: &i2c2 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -74,7 +70,7 @@ ports {
 			port@0 {
 				reg = <0>;
 				ps8640_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
@@ -102,6 +98,10 @@ panel_in_edp: endpoint {
 	};
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&ps8640_in>;
+};
+
 &tlmm {
 	edp_brij_ps8640_rst: edp-brij-ps8640-rst-state {
 		pins = "gpio11";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
index 5c81e44ed4a5..0a7f2286b541 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dts
@@ -15,7 +15,7 @@ / {
 	compatible = "google,quackingstick-sku1537", "qcom,sc7180";
 };
 
-&dsi_phy {
+&mdss_dsi0_phy {
 	qcom,phy-rescode-offset-top = /bits/ 8 <(-13) (-13) (-13) (-13) (-13)>;
 	qcom,phy-rescode-offset-bot = /bits/ 8 <(-13) (-13) (-13) (-13) (-13)>;
 	qcom,phy-drive-ldo-level = <375>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index 8e7b42f843d4..62ab6427dd65 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -52,7 +52,31 @@ keyboard-controller {
 	};
 };
 
-&dsi0 {
+&gpio_keys {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <20>;
+		hid-descr-addr = <0x0001>;
+
+		vdd-supply = <&pp3300_ts>;
+	};
+};
+
+&mdss_dsi0 {
 	panel: panel@0 {
 		/* Compatible will be filled in per-board */
 		reg = <0>;
@@ -67,7 +91,7 @@ panel: panel@0 {
 
 		port {
 			panel_in: endpoint {
-				remote-endpoint = <&dsi0_out>;
+				remote-endpoint = <&mdss_dsi0_out>;
 			};
 		};
 	};
@@ -82,30 +106,6 @@ endpoint {
 	};
 };
 
-&gpio_keys {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-	clock-frequency = <400000>;
-
-	ap_ts: touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
-
-		interrupt-parent = <&tlmm>;
-		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-
-		post-power-on-delay-ms = <20>;
-		hid-descr-addr = <0x0001>;
-
-		vdd-supply = <&pp3300_ts>;
-	};
-};
-
 &sdhc_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
index e52b8776755d..b0c3be4c3bb4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -27,10 +27,6 @@ &pp3300_dx_edp {
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
-&dsi0_out {
-	remote-endpoint = <&sn65dsi86_in>;
-};
-
 edp_brij_i2c: &i2c2 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -65,7 +61,7 @@ ports {
 			port@0 {
 				reg = <0>;
 				sn65dsi86_in: endpoint {
-					remote-endpoint = <&dsi0_out>;
+					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
 
@@ -95,6 +91,10 @@ panel_in_edp: endpoint {
 	};
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi86_in>;
+};
+
 &tlmm {
 	edp_brij_irq: edp-brij-irq-state {
 		pins = "gpio11";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
index c5b0658bd632..6eeead70d3eb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
@@ -17,7 +17,7 @@ / {
 	compatible = "google,wormdingler-sku1024", "qcom,sc7180";
 };
 
-&dsi_phy {
+&mdss_dsi0_phy {
 	qcom,phy-rescode-offset-top = /bits/ 8 <31 31 31 31 (-32)>;
 	qcom,phy-rescode-offset-bot = /bits/ 8 <31 31 31 31 (-32)>;
 	qcom,phy-drive-ldo-level = <450>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index 262d6691abd9..2efa8a4bcda6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -110,7 +110,28 @@ keyboard-controller {
 	};
 };
 
-&dsi0 {
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@1 {
+		compatible = "hid-over-i2c";
+		reg = <0x01>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+
+		vdd-supply = <&pp3300_ts>;
+		vddl-supply = <&pp1800_ts>;
+	};
+};
+
+&mdss_dsi0 {
 
 	panel: panel@0 {
 		reg = <0>;
@@ -126,7 +147,7 @@ panel: panel@0 {
 
 		port {
 			panel_in: endpoint {
-				remote-endpoint = <&dsi0_out>;
+				remote-endpoint = <&mdss_dsi0_out>;
 			};
 		};
 	};
@@ -141,27 +162,6 @@ endpoint {
 	};
 };
 
-&i2c4 {
-	status = "okay";
-	clock-frequency = <400000>;
-
-	ap_ts: touchscreen@1 {
-		compatible = "hid-over-i2c";
-		reg = <0x01>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&ts_int_l>;
-
-		interrupt-parent = <&tlmm>;
-		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
-
-		post-power-on-delay-ms = <70>;
-		hid-descr-addr = <0x0001>;
-
-		vdd-supply = <&pp3300_ts>;
-		vddl-supply = <&pp1800_ts>;
-	};
-};
-
 &pm6150_adc {
 	skin-temp-thermistor@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 51d6c3502f3f..805fe1275e97 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -705,20 +705,6 @@ &camcc {
 	status = "disabled";
 };
 
-&dsi0 {
-	status = "okay";
-	vdda-supply = <&vdda_mipi_dsi0_1p2>;
-};
-
-&dsi0_out {
-	data-lanes = <0 1 2 3>;
-};
-
-&dsi_phy {
-	status = "okay";
-	vdds-supply = <&vdda_mipi_dsi0_pll>;
-};
-
 ap_sar_sensor_i2c: &i2c5 {
 	clock-frequency = <400000>;
 
@@ -836,6 +822,20 @@ &mdss_dp_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
 };
 
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+};
+
 &pm6150_adc {
 	charger-thermistor@4f {
 		reg = <ADC5_AMUX_THM3_100K_PU>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2c05b5a5d92b..34eff97f8630 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3005,7 +3005,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf1_out: endpoint {
-							remote-endpoint = <&dsi0_in>;
+							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
 
@@ -3042,7 +3042,7 @@ opp-460000000 {
 				};
 			};
 
-			dsi0: dsi@ae94000 {
+			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sc7180-dsi-ctrl",
 					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
@@ -3065,12 +3065,12 @@ dsi0: dsi@ae94000 {
 					      "bus";
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-				phys = <&dsi_phy>;
+				phys = <&mdss_dsi0_phy>;
 
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -3083,14 +3083,14 @@ ports {
 
 					port@0 {
 						reg = <0>;
-						dsi0_in: endpoint {
+						mdss_dsi0_in: endpoint {
 							remote-endpoint = <&dpu_intf1_out>;
 						};
 					};
 
 					port@1 {
 						reg = <1>;
-						dsi0_out: endpoint {
+						mdss_dsi0_out: endpoint {
 						};
 					};
 				};
@@ -3115,13 +3115,13 @@ opp-358000000 {
 				};
 			};
 
-			dsi_phy: phy@ae94400 {
+			mdss_dsi0_phy: phy@ae94400 {
 				compatible = "qcom,dsi-phy-10nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
 				      <0 0x0ae94a00 0 0x1e0>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
+				reg-names = "dsi0_phy",
+					    "dsi0_phy_lane",
 					    "dsi_pll";
 
 				#clock-cells = <1>;
@@ -3212,8 +3212,8 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x200000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <&dsi_phy 0>,
-				 <&dsi_phy 1>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
 				 <&dp_phy 0>,
 				 <&dp_phy 1>;
 			clock-names = "bi_tcxo",
-- 
2.39.2

