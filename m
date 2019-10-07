Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED25CDC01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 09:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfJGHAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 03:00:08 -0400
Received: from mxb1.seznam.cz ([77.75.78.89]:65006 "EHLO mxb1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbfJGHAI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 03:00:08 -0400
X-Greylist: delayed 723 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 03:00:06 EDT
Received: from email.seznam.cz
        by email-smtpc4b.ko.seznam.cz (email-smtpc4b.ko.seznam.cz [10.53.13.105])
        id 75faa5602ef4f1097453693e;
        Mon, 07 Oct 2019 09:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1570431605; bh=vwYOv2Ab5iPREmlGDGUfR+GIbmWVAczCK4ebkGzf5N0=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=dx7ZwOoLO8PxAAdeLODgSSXZhXEoaY5TvmAqhsw6sGDg0oDVduWq6UZvPgS/qPAFO
         RJXZo40iooS1Vq9ojiyFqmoxnbxXNg6W+DCrRcHIbQmF6IucwVNTwkCVyQgm706em0
         2DTP1vqe1R3IdwBVGV3HIvMnlcgYAfTsQpFFb2vY=
Received: from localhost.localdomain (mail.gymso.cz [77.104.210.103])
        by email-relay4.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Mon, 07 Oct 2019 08:47:56 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH] arm64: dts: msm8916-samsung-a2015: add tactile buttons and hall sensor
Date:   Mon,  7 Oct 2019 08:45:28 +0200
Message-Id: <20191007064528.6543-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

Add nodes for basic GPIO connected hardware to the Samsung A3/A5 common dtsi. 
This includes the Volume UP button, the Home button, and the hall sensor used 
to sense "smart cover" open state. Related to that, add a node for the Volume 
DOWN button, which is handled by the pm8916 as is common with msm8916 devices.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 6fc0b80d1f90..bd1eb3eeca53 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -3,6 +3,7 @@
 #include "msm8916.dtsi"
 #include "pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -91,6 +92,44 @@
 		etm@85f000 { status = "disabled"; };
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_default>;
+
+		label = "GPIO Buttons";
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		home {
+			label = "Home";
+			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+		};
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_hall_sensor_default>;
+
+		label = "GPIO Hall Effect Sensor";
+
+		hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+		};
+	};
+
 	i2c-muic {
 		compatible = "i2c-gpio";
 		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
@@ -113,6 +152,30 @@
 };
 
 &msmgpio {
+	gpio_keys_default: gpio_keys_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio107", "gpio109";
+		};
+		pinconf {
+			pins = "gpio107", "gpio109";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	gpio_hall_sensor_default: gpio_hall_sensor_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio52";
+		};
+		pinconf {
+			pins = "gpio52";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	muic_int_default: muic_int_default {
 		pinmux {
 			function = "gpio";
@@ -238,3 +301,16 @@
 		regulator-max-microvolt = <2700000>;
 	};
 };
+
+&spmi_bus {
+	pm8916@0 {
+		pon@800 {
+			volume-down {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				bias-pull-up;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+	};
+};
-- 
2.23.0

