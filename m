Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49EF203A89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgFVPSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:18:43 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:21953 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729462AbgFVPSm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592839117;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=eUybk80IehW1UzAjbTnyoIiCZjoRefk+5Fnl2dnnB/0=;
        b=dLDFsdNE26KSiHN4HyWxKF8TX+r6x0UzNaDmXBM+UdVL0a+hv+sOBpwkBr6p3s5e8G
        bq6Kl0uodSfZw0xSbY9tFuuozunnHS5nxcj/UlfFaXhShz+JEJo/FwuzUC6oOxZ7gfSE
        +6NPfFq+nXUNEQtjc0K2ERpErmV1l26U5OP7CEqT4YhvVKV6z3xbmqQmkgzdgBgQ7g4a
        Hx2hjpjJC3YOCr3FWPbBBodboQIsuiZsSstc+h3kXjCWqmck2r4rdkWl0dBteFOnA1VB
        0J/KO/vS2N1qcw/9eNzcPuK9Ul6rVyosJRIbMMpQ67O3Rx6ZALyXVmV09GB8MobiJQVP
        LSrQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OIUPH"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5MFIY5Xz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 22 Jun 2020 17:18:34 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Michael Srba <michael.srba@seznam.cz>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8916-samsung-a2015: Add accelerometer/magnetometer
Date:   Mon, 22 Jun 2020 17:17:51 +0200
Message-Id: <20200622151751.408995-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622151751.408995-1-stephan@gerhold.net>
References: <20200622151751.408995-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A3U/A5U both use a Bosch BMC150 accelerometer/magnetometer combo.
The chip provides two separate I2C devices for the accelerometer
and magnetometer that are already supported by the bmc150-accel
and bmc150-magn driver.

The only difference between A3U/A5U is the way the sensor is
mounted on the mainboard - set the mount-matrix in the
device-specific device tree part to handle that difference.

Co-developed-by: Michael Srba <michael.srba@seznam.cz>
Signed-off-by: Michael Srba <michael.srba@seznam.cz>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 27 +++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  6 +++++
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  6 +++++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 58485d055241..a0c00d9d62c4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -167,6 +167,25 @@ muic: sm5502@25 {
 	};
 };
 
+&blsp_i2c2 {
+	status = "okay";
+
+	accelerometer: accelerometer@10 {
+		compatible = "bosch,bmc150_accel";
+		reg = <0x10>;
+		interrupt-parent = <&msmgpio>;
+		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_int_default>;
+	};
+
+	magnetometer@12 {
+		compatible = "bosch,bmc150_magn";
+		reg = <0x12>;
+	};
+};
+
 &spmi_bus {
 	pm8916@0 {
 		pon@800 {
@@ -294,6 +313,14 @@ l18 {
 };
 
 &msmgpio {
+	accel_int_default: accel-int-default {
+		pins = "gpio115";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_keys_default: gpio-keys-default {
 		pins = "gpio107", "gpio109";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 33160a3687ce..410c7d199f96 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -22,6 +22,12 @@ reg_panel_vdd3: regulator-panel-vdd3 {
 	};
 };
 
+&accelerometer {
+	mount-matrix = "0", "1", "0",
+		       "1", "0", "0",
+		       "0", "0", "1";
+};
+
 &dsi0 {
 	panel@0 {
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index e4b6fa18ca25..e39c04d977c2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -9,6 +9,12 @@ / {
 	compatible = "samsung,a5u-eur", "qcom,msm8916";
 };
 
+&accelerometer {
+	mount-matrix = "-1", "0", "0",
+			"0", "1", "0",
+			"0", "0", "1";
+};
+
 &blsp_i2c5 {
 	status = "okay";
 
-- 
2.27.0

