Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEF98E211
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbfHOAtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:21 -0400
Received: from onstation.org ([52.200.56.107]:44666 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728722AbfHOAtT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:19 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 29F333EE6C;
        Thu, 15 Aug 2019 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830158;
        bh=n4ARTSBkbN2lUiYlrE3XPu66+fGDnp75QmhjLIvJkZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k4WaCnVKNMUmQ03E4G+N8DZNHpC+W3ALAIivM+W/PFI0Dgnw4Sb3/HAclfy9shlG4
         veTWURgtvu7LCoiJ6aAg6p74byAqS4owyirSIoJtpEmIhCBbpwF8JU//7CeoG6pn6E
         A48YNmoTXQFRz1Sjf0fAJZe7KWKVxanQZnmqYnOA=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH RFC 11/11] ARM: dts: qcom: msm8974-hammerhead: add support for external display
Date:   Wed, 14 Aug 2019 20:48:54 -0400
Message-Id: <20190815004854.19860-12-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add HDMI nodes and other supporting infrastructure in order to support
the external display. This is based on work from Jonathan Marek.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
The hdmi-tx node in the downstream MSM sources:
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm8974-mdss.dtsi#L101

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 3487daf98e81..83416b6d6634 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -234,6 +234,34 @@
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
+
+		gpio = <&pm8941_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&anx_vdd10_pin>;
+	};
 };
 
 &soc {
@@ -355,6 +383,40 @@
 				bias-disable;
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
 
 	sdhci@f9824900 {
@@ -440,6 +502,28 @@
 				default-brightness = <200>;
 			};
 		};
+
+		anx7808@72 {
+			compatible = "analogix,anx7808";
+			reg = <0x72>;
+			interrupts-extended = <&msmgpio 28 IRQ_TYPE_EDGE_RISING>;
+
+			hpd-gpios = <&pm8941_gpios 13 GPIO_ACTIVE_HIGH>;
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
@@ -621,6 +705,29 @@
 
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
 
@@ -657,6 +764,39 @@
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

