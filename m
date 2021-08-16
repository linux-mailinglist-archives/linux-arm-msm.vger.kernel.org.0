Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FDA3ED40A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 14:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhHPMh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 08:37:28 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:22331 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbhHPMh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 08:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629117399;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FMnCpbisgjnqvRiMJIFyGSARBxYscp309MjHAhk9AdQ=;
    b=ezt4KLDeJ8+4ZfkMu7tWhBTagRe8TeaFYGsBRg/nQxbS9OFO50z6sRI0REYEdh3Qls
    D2gLLlsTt9hu8OCMEpXEIV5ZkRhy6Z2ddmP0/e3F7Bnt3+LoPmcdkV+samqTorDgJAMM
    Ngf89Eef+0HuUnwGwXneexnWihzwynmukf8URO25kUplp1Th2lyiDsfthkUtG0MPnjvG
    XyxTD/fKZwxjV1yY8gdg8qQn9dcIgFW6Pw4tthM0Dq1qt4T2d0/cdQ+AJ8lhQT9GujVG
    CKKEApB4mCHT86fFrxh6KJsvZo2iDX1KNLuauWhIz1tMSl0Sh414u/ydv0h4RTiUYw+3
    YKlQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr1eFSKSfA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id L01e9cx7GCac0a6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 16 Aug 2021 14:36:38 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor interrupts
Date:   Mon, 16 Aug 2021 14:35:44 +0200
Message-Id: <20210816123544.14027-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So far there were no interrupts set up for the BMC150 accelerometer
+ magnetometer combo because they were broken for some reason.
It turns out Longcheer L8150 actually has a BMC156 which is very similar
to BMC150, but only has an INT2 pin for the accelerometer part.

This requires some minor changes in the bmc150-accel driver which is now
supported by using the more correct bosch,bmc156_accel compatible.
Unfortunately it looks like even INT2 is not functional on most boards
because the interrupt line is not actually connected to the BMC156.
However, there are two pads next to the chip that can be shorted
to make it work if needed.

While at it, add the missing interrupts for the magnetometer part
and extra BMG160 gyroscope, those seem to work without any problems.
Also correct the magnetometer compatible to bosch,bmc156_magn for clarity
(no functional difference for the magnetometer part).

Tested-by: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 43 +++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 1e893c0b6fbc..30716eb8fb2d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -121,9 +121,21 @@ &blsp_i2c2 {
 	status = "okay";
 
 	accelerometer@10 {
-		compatible = "bosch,bmc150_accel";
+		compatible = "bosch,bmc156_accel";
 		reg = <0x10>;
 
+		/*
+		 * For some reason the interrupt line is usually not connected
+		 * to the BMC156. However, there are two pads next to the chip
+		 * that can be shorted to make it work if needed.
+		 *
+		 * interrupt-parent = <&msmgpio>;
+		 * interrupts = <116 IRQ_TYPE_EDGE_RISING>;
+		 */
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_int_default>;
+
 		vdd-supply = <&pm8916_l17>;
 		vddio-supply = <&pm8916_l6>;
 
@@ -133,9 +145,15 @@ accelerometer@10 {
 	};
 
 	magnetometer@12 {
-		compatible = "bosch,bmc150_magn";
+		compatible = "bosch,bmc156_magn";
 		reg = <0x12>;
 
+		interrupt-parent = <&msmgpio>;
+		interrupts = <113 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&magn_int_default>;
+
 		vdd-supply = <&pm8916_l17>;
 		vddio-supply = <&pm8916_l6>;
 	};
@@ -145,7 +163,8 @@ gyroscope@68 {
 		reg = <0x68>;
 
 		interrupt-parent = <&msmgpio>;
-		interrupts = <23 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <23 IRQ_TYPE_EDGE_RISING>,
+			     <22 IRQ_TYPE_EDGE_RISING>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gyro_int_default>;
@@ -336,6 +355,14 @@ l18 {
 };
 
 &msmgpio {
+	accel_int_default: accel-int-default {
+		pins = "gpio116";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	camera_flash_default: camera-flash-default {
 		pins = "gpio31", "gpio32";
 		function = "gpio";
@@ -361,7 +388,15 @@ gpio_keys_default: gpio-keys-default {
 	};
 
 	gyro_int_default: gyro-int-default {
-		pins = "gpio23";
+		pins = "gpio22", "gpio23";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	magn_int_default: magn-int-default {
+		pins = "gpio113";
 		function = "gpio";
 
 		drive-strength = <2>;
-- 
2.32.0

