Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2A639BED4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 19:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhFDRdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 13:33:35 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:23158 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhFDRdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 13:33:35 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622827904; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=m9pFcaPadHwKAQEiNm3NeyzwZTNTG1NGHkHfbbcR5LtqzezLmsoq0rcB7beJQCyHom
    zMLP0isUqNs5vFKqjMm7UPVzIQzUGJtoSEkzUVzAMmMVWE8AcDEyysx86Zc6CbFfqGUg
    l98Uv1Eebu1/6WHDuP4s4dDaBVZ2Bf9/kWPzHAJpahEtvnQOQ3SPM6hLRwsi/MGqCfsP
    cd52arDhQiQBDAjp0KDtGu686Ci6mm5ED+yyhYs4l/w4rXhRO5vGdFge1umS2tF6UvB2
    OYYb87uZUs5aGjsFYg6wgow4JIQEndFlx3eBTw8ARcnjVTXjhPV14eMR6KEsNYqKKj75
    Nx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827904;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=LVLr555nUQEvEYgAf4PXdZYCbzgO3vN/QlLUV+4x5jY=;
    b=IR7/Ylqstp3O94+PLActKSdeiHBhVZVZXlLxoVoBiiZl/m1FlaT82uoJkWeNiJOcr5
    Qxj+sicRyWxJMoA4q9MS4RWImtM0XgdTAtVZqQ/uq+vRJlp0AJfy4qzJ2Fgc0kG6nPgG
    eaew965VdgiKkCKjIxhGYZUUAS1xRFAaPhdMnwSeAmcOpe1eliFZclZquD2vYR0NgSPE
    SqkaI2HHrXbpbLGgfHmHaNpayDY1o+2PkN+3kZ4fY2g+/POMUK5qO+qZaGzbAycigw/G
    EeGz9RiYSqcbuFftZp41PD/xU6bgPvcYuo2mkVW9oD4bwBtlU/g/asyPKr03RXcL6k0l
    f1Pw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827904;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=LVLr555nUQEvEYgAf4PXdZYCbzgO3vN/QlLUV+4x5jY=;
    b=NH0D9LhDFWDAeo9K2dT2Ai7mcPQzc2FOBs7dQ73CpmVlguKCCI6wlcghIuWDKpyBrE
    xzL67P0XWmNJLpeqkkHWgMna6vhxWSa/39BToUFnomgO7+/edMTb56bTapfuOzWRkSWy
    7y3QTLIFeSRQn+NZMuD8Y2HIlC/6KWZ9xJb7u1EoWjtxB2g17Ue6E2eML0ydQ5GuzAt5
    nnt23bAhdl3t6ZQBXvG3dMBZZIgD1IPmPO7eUvL1s+FPZJkZmevsXbXeIL0H78Q0bLSt
    xke8G7XaxAzisNxjtJuaiNz7PrbGDg8nFXmPtFl5aVRfZOhRrBKMrI6Nt1t/kBUQb8mI
    d1iA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6Pvxo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x54HVhH5X
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 4 Jun 2021 19:31:43 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/5] arm64: dts: qcom: msm8916-samsung-a2015: Add touch key
Date:   Fri,  4 Jun 2021 19:27:38 +0200
Message-Id: <20210604172742.10593-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy A3/A5 both have two capacitive touch keys,
connected to an ABOV MCU. It implements the same interface as
implemented by the tm2-touchkey driver and works just fine with
the coreriver,tc360-touchkey compatible. It's probably actually some
Samsung-specific interface that they implement with different MCUs.

Note that for some reason Samsung decided to connect this to GPIOs
where no hardware I2C bus is available, so we need to fall back
to software bit-banging using i2c-gpio.

The vdd/vcc-supply is board-specific and will be added separately
for a3u/a5u.

Co-developed-by: Michael Srba <Michael.Srba@seznam.cz>
Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 230ba3ce3277..3c77e7ef9eda 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -95,6 +95,35 @@ muic: extcon@25 {
 			pinctrl-0 = <&muic_int_default>;
 		};
 	};
+
+	i2c-tkey {
+		compatible = "i2c-gpio";
+		sda-gpios = <&msmgpio 16 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 17 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_i2c_default>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		touchkey: touchkey@20 {
+			/* Note: Actually an ABOV MCU that implements same interface */
+			compatible = "coreriver,tc360-touchkey";
+			reg = <0x20>;
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <98 IRQ_TYPE_EDGE_FALLING>;
+
+			/* vcc/vdd-supply are board-specific */
+			vddio-supply = <&pm8916_l6>;
+
+			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&tkey_default>;
+		};
+	};
 };
 
 &blsp_i2c2 {
@@ -333,6 +362,22 @@ muic_int_default: muic-int-default {
 		bias-disable;
 	};
 
+	tkey_default: tkey-default {
+		pins = "gpio98";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tkey_i2c_default: tkey-i2c-default {
+		pins = "gpio16", "gpio17";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tsp_en_default: tsp-en-default {
 		pins = "gpio73";
 		function = "gpio";
-- 
2.31.1

