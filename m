Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960ED380795
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhENKpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:45:21 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:10337 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhENKpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:45:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620989044; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=H5LsvLVNrc1CX1muc8g5CPtUrD30XAPOoVmASFhLVMbWF6ZwBrNtN+VnBAXiE1wAYz
    66BDbo3YAME3tif7tgRvG1mdIhm+LglVgYEbGlafQJcG+9pnhqXESg+I2us7VUb/e9w4
    ZGT1vWGr85r4KmAnqvaaXcCRSeR+MHGtiBmywv+Bb0fohIyW06vm16c+cvZ7YEIlF3b/
    VHzeqXiLIgOh+htnCGFzPIDrYHMTyuVl4lWJCYrLaC3IH8GeGNI2hQIQfquU32Ao4LHt
    J+tBUjGcUcaW5ZIFLvBfUYmCxEobJis7bvfN3ODkXuoHInIUOGNv4pk0oRN8DUZgNkTk
    1iPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989044;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=npGo6RY7cHwUEm6OFef7gBC2N2Rik3ZzNRUu4isJVzw=;
    b=ovBP+3WAltp1imUt84fN0nTp/8Z0C26If/H3fGWCKzy3w9CWX1IbRP/+ImzU6qvPCg
    1TdS6BbRmi5aJGui/N2cloL7CP//AMPkr9SY54tJcZk6PiVHZpvYdRQUlPgRk/DaM4ff
    0/C6sGT5dQmvMKBTa9z/50H2j+pCGphA17oHGo+V7Ip1lB9QAWpax4nZamMU41cHyrZS
    KiFq8i5/lrDkYzbVmeCDHvGR1fCXGUnq3NLFZUWAcvFL8ZQczhJGLn//ZBHcBTBriQV9
    o/GJrG9vhIJ+qQHw//BKIdXWZ8o4JMizHjCMIkS9vZjwdsAQZzntuXm9Hfgyu8ZkXMR/
    BIDg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989044;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=npGo6RY7cHwUEm6OFef7gBC2N2Rik3ZzNRUu4isJVzw=;
    b=geBCmI37pjERL6cPPrVb4VCZCJA4G31LGebGcWEYNwVwDFUi1q9aE4XtxJPHWaZonI
    afo+eNTLTsAF6w6QLwV9lTa8m4MB5NdsVotjl34TkS1j31bV7qmREawlfH9qqpCDuwlw
    LTMkaAVxwRFxyy3oQ+gED11z9O9YKykLLC7R44OBfxUgRnWq3vLLGrEiSInJ2/XpzaUW
    G9LeTdYQXEdFofycFwlxDQ3FidSKxBElokCgxKkljt5tHbcGdBob//xU7liUR9udHC1z
    O/bF6/WSdhk+nP6DwCIPuMhAsPcUwoYFvbfvZd6I178T0V5VrOT5cRmyaQoxu2V7xp+z
    nV/g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6OWA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.7 SBL|AUTH)
    with ESMTPSA id j06c13x4EAi4Fym
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 14 May 2021 12:44:04 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/5] arm64: dts: qcom: msm8916-huawei-g7: Add sensors
Date:   Fri, 14 May 2021 12:43:26 +0200
Message-Id: <20210514104328.18756-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514104328.18756-1-stephan@gerhold.net>
References: <20210514104328.18756-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Huawei Ascend G7 has 3 sensors, all supported by existing kernel drivers:

  1. Kionix KX023-1025 accelerometer (kxcjk-1023)
  2. Asahi Kasei AK09911 magnetometer (ak8975)
  3. Avago APDS9930 proximity/light sensor (tsl2772)

Add them to the huawei-g7 device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index f928179f9ded..3b558dc9e90f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -85,6 +85,58 @@ usb_id: usb-id {
 	};
 };
 
+&blsp_i2c2 {
+	status = "okay";
+
+	magnetometer@c {
+		compatible = "asahi-kasei,ak09911";
+		reg = <0x0c>;
+
+		vdd-supply = <&pm8916_l17>;
+		vid-supply = <&pm8916_l6>;
+
+		reset-gpios = <&msmgpio 36 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mag_reset_default>;
+	};
+
+	accelerometer@1e {
+		compatible = "kionix,kx023-1025";
+		reg = <0x1e>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_irq_default>;
+
+		mount-matrix = "-1", "0", "0",
+				"0", "1", "0",
+				"0", "0", "1";
+	};
+
+	proximity@39 {
+		compatible = "avago,apds9930";
+		reg = <0x39>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <113 IRQ_TYPE_EDGE_FALLING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		led-max-microamp = <100000>;
+		amstaos,proximity-diodes = <1>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&prox_irq_default>;
+	};
+};
+
 &blsp_i2c5 {
 	status = "okay";
 
@@ -278,6 +330,14 @@ l18 {
 };
 
 &msmgpio {
+	accel_irq_default: accel-irq-default {
+		pins = "gpio115";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_keys_default: gpio-keys-default {
 		pins = "gpio107";
 		function = "gpio";
@@ -294,6 +354,22 @@ gpio_leds_default: gpio-leds-default {
 		bias-disable;
 	};
 
+	mag_reset_default: mag-reset-default {
+		pins = "gpio36";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	prox_irq_default: prox-irq-default {
+		pins = "gpio113";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdhc2_cd_default: sdhc2-cd-default {
 		pins = "gpio56";
 		function = "gpio";
-- 
2.31.1

