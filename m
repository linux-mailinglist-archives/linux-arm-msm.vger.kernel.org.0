Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54529CDA45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 03:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfJGBpb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Oct 2019 21:45:31 -0400
Received: from onstation.org ([52.200.56.107]:33064 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727161AbfJGBpY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Oct 2019 21:45:24 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 8ECBD3F23E;
        Mon,  7 Oct 2019 01:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570412723;
        bh=Op5NIl5dzUMCbi20BwmEjr/2tRkcbaO8At1lhZxnx7s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mNP9EwTPzoHbHLeLsX5BR1DF+2vSpWaVzjQyepCD3zAfHjDsbCE1AjSOGl35KZPGA
         AA7AEj3QCxf1EI58bMkvQB0AlhkGjBs7iE+DF5EPwhS3wmZJ8al4fipsaoYtRJIOL+
         gEZrb06eq/iomdxdPVaVjgCETgml8x66o99pfuHU=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFC v2 5/5] ARM: dts: qcom: msm8974-hammerhead: add support for external display
Date:   Sun,  6 Oct 2019 21:45:09 -0400
Message-Id: <20191007014509.25180-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add HDMI nodes and other supporting infrastructure in order to support
the external display. This is based on work from Jonathan Marek.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v1:
- Regulators always on as a temporary haack.
- Hot plug detect pin for the HDMI bridge needs to be low.

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index b607c9ff9e12..380a805cd1f0 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -235,6 +235,36 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_regulator_pin>;
 	};
+
+	anx_avdd33: avdd33 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "avdd-3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on; // FIXME
+
+		gpio = <&pm8941_gpios 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&anx_avdd33_pin>;
+	};
+
+	anx_vdd10: vdd10 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vdd-1p0";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-always-on; // FIXME
+
+		gpio = <&pm8941_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&anx_vdd10_pin>;
+	};
 };
 
 &soc {
@@ -371,6 +401,40 @@
 				function = "gpio";
 			};
 		};
+
+		hdmi_pin: hdmi {
+			cec {
+				pins = "gpio31";
+				function = "hdmi_cec";
+			};
+
+			ddc {
+				pins = "gpio32", "gpio33";
+				function = "hdmi_ddc";
+			};
+
+			hpd {
+				pins = "gpio34";
+				function = "hdmi_hpd";
+			};
+		};
+
+		anx_msm_pin: anx {
+			irq {
+				pins = "gpio28";
+				function = "gpio";
+				drive-strength = <8>;
+				bias-pull-up;
+				input-enable;
+			};
+
+			reset {
+				pins = "gpio68";
+				function = "gpio";
+				drive-strength = <8>;
+				bias-pull-up;
+			};
+		};
 	};
 
 	vibrator@fd8c3450 {
@@ -471,6 +535,28 @@
 				default-brightness = <200>;
 			};
 		};
+
+		anx7808@72 {
+			compatible = "analogix,anx7808";
+			reg = <0x72>;
+			interrupts-extended = <&msmgpio 28 IRQ_TYPE_EDGE_RISING>;
+
+			hpd-gpios = <&pm8941_gpios 13 GPIO_ACTIVE_LOW>;
+			pd-gpios = <&pm8941_gpios 14 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&msmgpio 68 GPIO_ACTIVE_LOW>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&anx_msm_pin>, <&anx_pin>;
+
+			dvdd10-supply = <&anx_vdd10>;
+			avdd33-supply = <&anx_avdd33>;
+
+			port {
+				anx7808_in: endpoint {
+					remote-endpoint = <&hdmi_out>;
+				};
+			};
+		};
 	};
 
 	i2c@f9968000 {
@@ -664,6 +750,29 @@
 
 			vddio-supply = <&pm8941_l12>;
 		};
+
+		hdmi-tx@fd922100 {
+			status = "ok";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdmi_pin>;
+
+			qcom,hdmi-tx-ddc-clk = <&msmgpio 32 GPIO_ACTIVE_HIGH>;
+			qcom,hdmi-tx-ddc-data = <&msmgpio 33 GPIO_ACTIVE_HIGH>;
+			qcom,hdmi-tx-hpd = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
+
+			ports {
+				port@1 {
+					hdmi_out: endpoint {
+						remote-endpoint = <&anx7808_in>;
+					};
+				};
+			};
+		};
+
+		hdmi-phy@fd922500 {
+			status = "ok";
+		};
 	};
 };
 
@@ -700,6 +809,39 @@
 				output-high;
 				line-name = "otg-gpio";
 			};
+
+			anx_pin: anx {
+				cbldet {
+					pins = "gpio13";
+					function = "normal";
+					input-enable;
+					bias-pull-down;
+					power-source = <PM8941_GPIO_S3>;
+				};
+
+				pd {
+					pins = "gpio14";
+					function = "normal";
+					bias-disable;
+					power-source = <PM8941_GPIO_S3>;
+				};
+			};
+
+			anx_avdd33_pin: anxvdd3  {
+				pins = "gpio26";
+				function = "normal";
+
+				bias-disable;
+				power-source = <PM8941_GPIO_S3>;
+			};
+
+			anx_vdd10_pin: anxvdd1 {
+				pins = "gpio8";
+				function = "normal";
+
+				bias-disable;
+				power-source = <PM8941_GPIO_S3>;
+			};
 		};
 	};
 };
-- 
2.21.0

