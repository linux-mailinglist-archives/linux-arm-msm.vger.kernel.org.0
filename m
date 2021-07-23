Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B013D4172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 22:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhGWTlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 15:41:49 -0400
Received: from mout02.posteo.de ([185.67.36.66]:37353 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231382AbhGWTlt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 15:41:49 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 3CA77240108
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 22:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1627071741; bh=X0rc+/5GGjVkSZK5TaqO7OYWpD1XlkC/UV67N8kNP9g=;
        h=From:To:Cc:Subject:Date:From;
        b=gXvRsXEesyFUeO2ci6TAUXnbtS72dQWm/abk76x2nqfyBP24n/2kFUPDnzNt91Fvl
         ofYWilp1qdyqW2IZXD/ZIjfOMvwUyU6xgD2ufLiGPDnGTqGrG3qfz+Ujt4hRgy8w4e
         J9Hd5s8mnvfFFRSlcbg2nLRzr1+3hF/rka8QWYcUJvu0foUQPZv/+VoCeLz/8y87rk
         zWkjtWI2vZdZWRT96xjrBrYBOrRwOKXJCiskqAd/3n30teClDwMgu3btl8aPB87Gfr
         RdwVgg8JBPcChcbtRtsTuw1TQOevotZFvhHgVnCNx75bnG1/ZUkzgaMgEIfD/DIF95
         XE9gP/a9Oagog==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GWgj81QCSz9rxd;
        Fri, 23 Jul 2021 22:22:20 +0200 (CEST)
From:   Julian Weigt <juw@posteo.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Julian Weigt <juw@posteo.de>
Subject: [PATCH 2/2] ARM: dts: msm8974: castor: Add Bluetooth-related nodes
Date:   Fri, 23 Jul 2021 20:21:01 +0000
Message-Id: <20210723202101.65371-2-juw@posteo.de>
In-Reply-To: <20210723202101.65371-1-juw@posteo.de>
References: <20210723202101.65371-1-juw@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Castor has a BCM4339 attached to BLSP2 UART7, add the necessary nodes to
define the uart as well as the serdev BCM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Julian Weigt <juw@posteo.de>
---
 .../dts/qcom-msm8974-sony-xperia-castor.dts   | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index f4ec08f13003..b4dd85bd4faf 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -11,6 +11,7 @@ / {
 
 	aliases {
 		serial0 = &blsp1_uart2;
+		serial1 = &blsp2_uart7;
 	};
 
 	chosen {
@@ -336,6 +337,27 @@ serial@f991e000 {
 		pinctrl-0 = <&blsp1_uart2_pin_a>;
 	};
 
+	serial@f995d000 {
+		status = "ok";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&blsp2_uart7_pin_a>;
+
+		bluetooth {
+			compatible = "brcm,bcm43438-bt";
+			max-speed = <3000000>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&bt_host_wake_pin>,
+				    <&bt_dev_wake_pin>,
+				    <&bt_reg_on_pin>;
+
+			host-wakeup-gpios = <&msmgpio 95 GPIO_ACTIVE_HIGH>;
+			device-wakeup-gpios = <&msmgpio 96 GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&pm8941_gpios 16 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	usb@f9a55000 {
 		status = "okay";
 
@@ -380,6 +402,40 @@ tx {
 			};
 		};
 
+		blsp2_uart7_pin_a: blsp2-uart7-pin-active {
+			tx {
+				pins = "gpio41";
+				function = "blsp_uart7";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			rx {
+				pins = "gpio42";
+				function = "blsp_uart7";
+
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cts {
+				pins = "gpio43";
+				function = "blsp_uart7";
+
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			rts {
+				pins = "gpio44";
+				function = "blsp_uart7";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c8_pins: i2c8 {
 			mux {
 				pins = "gpio47", "gpio48";
@@ -479,6 +535,23 @@ pin {
 				input-enable;
 			};
 		};
+
+		bt_host_wake_pin: bt-host-wake {
+			pins = "gpio95";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+			output-low;
+		};
+
+		bt_dev_wake_pin: bt-dev-wake {
+			pins = "gpio96";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
 	};
 
 	i2c@f9964000 {
@@ -606,6 +679,14 @@ gpio_keys_pin_a: gpio-keys-active {
 				power-source = <PM8941_GPIO_S3>;
 			};
 
+			bt_reg_on_pin: bt-reg-on {
+				pins = "gpio16";
+				function = "normal";
+
+				output-low;
+				power-source = <PM8941_GPIO_S3>;
+			};
+
 			wlan_sleep_clk_pin: wl-sleep-clk {
 				pins = "gpio17";
 				function = "func2";
-- 
2.32.0

