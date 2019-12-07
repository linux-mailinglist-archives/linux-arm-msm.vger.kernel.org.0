Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217CB115E97
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLGUgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:20 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44737 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfLGUgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:19 -0500
Received: by mail-pg1-f196.google.com with SMTP id x7so5061594pgl.11;
        Sat, 07 Dec 2019 12:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=888GZt/LFDsB0HcMe2D0lH6dvAdiWaFC5K/VFb+FLyg=;
        b=FZC7kka9khJuBvH092mVH2D1D0nl7lvHYcJGUQIvoX1J+2bknn3Sj6cBOSAtJatdi1
         c8mdMu6TPsgsmZGzhwT9bVyjmnzGXCU2R33bnyesSJo5EhQokOJu4aijGFitDWsCf92P
         Th/I+DAuu6Z2pMvlJAu9LH9rGg1LGzlkogTpwzVFt50k+Sv2kt4V8l6spxR4QHyodsPf
         9GC8y38I2CoD+BgcJsERwb1hbCAtYCt+8GcxVQL5z4nK0hJgiHXI6NTF2IjlyYIlucr7
         +aaEE9VqBH2d/QrtBl1ubFi2p940XmWIJLZJZ+OYObhaxpYtGSayWR2K58YwobUBc8ZP
         JhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=888GZt/LFDsB0HcMe2D0lH6dvAdiWaFC5K/VFb+FLyg=;
        b=QKeROGTVlQO1FI3JNiEO5InrETHSlIIK7DRlWIWLFkh+sUZmEa8HWlM+GbM0kAYUwu
         JyI0vqOwxt0NGN51J6Jmr8zr0oEG1Wt/hRZOiHY3+ZBKxJura9LwygkxUfmk8bW7csoP
         ENjpFOGA7mmR75uNPBIbTsPr+hJ7NMgrEZ1yRxOAOTxKj55t7+XXzmUB4hAm+B8mwwPu
         ItccUQJY6aSvc3Vjc1Udt99Q2Zj2of/oH8X9NG5BYWs58UTg7V+glceQ6V38H/7062uG
         g6MKBtnHGujY3UppBms4W7cYocbDjU6CogKZFnEg6xmJE7FS+A9G3q87xMSB9XFk/zKI
         QDgQ==
X-Gm-Message-State: APjAAAU0FJ0r2CQ5cuD7jbG5hqrO3SxYq69w2wGOVxDOKtvI9KdaLp7r
        lGeRQiNieB7C3sd60qFef6U=
X-Google-Smtp-Source: APXvYqy4kMRRjVnTQQ6xB4h4lJyLmxDcQ3cnEwCLJqf5PzLedWWzGDfEA6KsXGK0ZDhVOvvDPL5L1w==
X-Received: by 2002:a63:d351:: with SMTP id u17mr10551445pgi.84.1575750978424;
        Sat, 07 Dec 2019 12:36:18 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k5sm7061084pju.14.2019.12.07.12.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:17 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] arm64: dts: qcom: c630: Enable display
Date:   Sat,  7 Dec 2019 12:35:53 -0800
Message-Id: <20191207203553.286017-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[Initial patch from Bjorn, I've added some regulator-boot-on's to
 account for display related regulators enabled by the firmware,
 and updated to handle the two possible panels that can be installed.]
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 13dc619687f3..459f65e3eb53 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
@@ -18,6 +19,70 @@
 	aliases {
 		hsuart0 = &uart6;
 	};
+
+	ivo_panel {
+		compatible = "ivo,m133nwf4-r0";
+		panel-id = <0xc5>;
+		status = "disabled";
+		power-supply = <&vlcm_3v3>;
+		no-hpd;
+
+		ports {
+			port {
+				ivo_panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out_ivo>;
+				};
+			};
+		};
+	};
+
+	boe_panel {
+		compatible = "boe,nv133fhm-n61";
+		panel-id = <0xc4>;
+		status = "disabled";
+		power-supply = <&vlcm_3v3>;
+		no-hpd;
+
+		ports {
+			port {
+				boe_panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out_boe>;
+				};
+			};
+		};
+	};
+
+	vlcm_3v3: vlcm-3v3-power {
+		compatible = "regulator-fixed";
+		regulator-name = "VLCM_3V3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	sw_edp_1p2: sw-edp-1p2-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "SW_EDP_1P2";
+
+		vin-supply = <&vreg_l2a_1p2>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&pm8998_gpio 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	sn65dsi86_refclk: sn65dsi86-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+
+		clock-frequency = <19200000>;
+	};
 };
 
 &adsp_pas {
@@ -79,6 +144,7 @@
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 
 		vddpx_10:
@@ -216,6 +282,7 @@
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1208000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 
 		vreg_l28a_3p0: ldo28 {
@@ -239,6 +306,25 @@
 	status = "okay";
 };
 
+&dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&sn65dsi86_in_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l1a_0p875>;
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -290,6 +376,58 @@
 	};
 };
 
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sn65dsi86: bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_bridge_en>, <&edp_bridge_irq>;
+
+		interrupts-extended = <&tlmm 10 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+		vpll-supply = <&vreg_l14a_1p88>;
+		vccio-supply = <&vreg_l14a_1p88>;
+		vcca-supply = <&sw_edp_1p2>;
+		vcc-supply = <&sw_edp_1p2>;
+
+		clocks = <&sn65dsi86_refclk>;
+		clock-names = "refclk";
+
+		max-brightness = <255>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sn65dsi86_out_ivo: endpoint@c5 {
+					reg = <0>;
+					remote-endpoint = <&ivo_panel_in_edp>;
+				};
+
+				sn65dsi86_out_boe: endpoint@c4 {
+					reg = <1>;
+					remote-endpoint = <&boe_panel_in_edp>;
+				};
+			};
+		};
+	};
+};
+
 &i2c11 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -306,6 +444,14 @@
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &mss_pil {
 	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
 };
@@ -338,6 +484,14 @@
 	};
 };
 
+&qup_i2c10_default {
+	pinconf {
+		pins = "gpio55", "gpio56";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -349,6 +503,17 @@
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	edp_bridge_en: edp-bridge-enable {
+		pins = "gpio96";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	edp_bridge_irq: edp-bridge-irq {
+		pins = "gpio10";
+		bias-pull-down;
+	};
+
 	i2c2_hid_active: i2c2-hid-active {
 		pins = <37>;
 		function = "gpio";
-- 
2.23.0

