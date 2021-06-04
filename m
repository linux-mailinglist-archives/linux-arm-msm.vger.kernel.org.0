Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739E439BED5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 19:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhFDRdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 13:33:35 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:21590 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhFDRdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 13:33:35 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622827904; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=l55rhKH4Dx8Fp6s4B+kF/C7//GauUwiimnHkQ+a4vlGGOaPvE/fE0t0L8qfdFJ3m+K
    2HW35jy1C1BCNfolX3I0222EfAbTldKwI+YUggA9aGesepUUNMCazyTWN0X0pZJY2UOF
    V3JKo08OISpGiejMBiOiep+0L//MtFwmfyfe+9sjn4lRov8cOMGFiJse/h3cVO8osAHs
    2MkWJ8XsTC2H9GPZPqU6KBFb2ydnvV8+b8i9McPAE4t4qsRwiDfwwgIcoEONMSlsCiOK
    VI4zt+kaiK/mEADKAimVmVMhUJhWdcPuPuqKg4B8vUyw7KHU/5UdFElxodw6w7ZOLF9Q
    YDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827904;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=p5NILU7nBxqDVCT63ZMrQiTlk9TVc6ktp8Fo++xWkA4=;
    b=f0utWWOup+1wOkvor9y5bn4uvnOLe6ucWWNmPpoIDLa2T8SNM91n4jHmggtKRkzS6W
    wDscKNRX3BntU+O0xVlrcd8GpjMFw8RQmXZT6Cs3Rp+eGaJZ+decaoZF+VCRiDVcMwom
    T7sPfmNVXu/5e4dftCVryWRan9KXA/dEmTt3Qwx77D1w97ZTi6RCvRs3TQ2MXdWN2kK1
    E1HCzcp72ja3IUSnl+1ZUW87Y14lJDuw6f0qfvUgrK9sxRJWf6wz+6C6UrCQBp7hDG8n
    70DrGlaHr3EczbygAcBP4huAtfOKpbWUzfW4R5n8IWqZn516hDCXMJ7I1SkMMRgxjZy0
    tDZQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827904;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=p5NILU7nBxqDVCT63ZMrQiTlk9TVc6ktp8Fo++xWkA4=;
    b=NrbxsoQkcKWEu1Plr1g7DmSrfLI71GJLm2QQA9Z7OhImR2EGs0KhGbq22P00y0Qp4r
    sbnrUBI+0vjRYam5queEWpF0uqQ1DEy1yqHFqaJud0XcQYnAclsief66+erecTR2roLT
    L5WwAY9/ijpYNFI55gi1u6B8D6RBQrw1hcKweb4PSpIZtfp7Gu4vGRMvm3SAyFGclTIH
    UUJya5OZ0THbpNtVHKWxEbWeJ0THuGgXfFQQuonsTIB0ImglXpGu1ZadsvuSbVBelLmb
    97FxRVehbHOa0E0q7aGyboUNVNDr4yw5lbMgPFYkICJKIvMri903Nn1o7OSg8hZuicCZ
    gJ7w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6Pvxo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x54HViH5Y
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 4 Jun 2021 19:31:44 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/5] arm64: dts: qcom: msm8916-samsung-a3u: Add touch key regulators
Date:   Fri,  4 Jun 2021 19:27:39 +0200
Message-Id: <20210604172742.10593-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604172742.10593-1-stephan@gerhold.net>
References: <20210604172742.10593-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

The touch key MCU and LED is supplied by two separate fixed regulators
that can be enabled through GPIO 86 and 60. Add them to the device tree.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
[stephan: extend commit message]
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 661f41ad978b..6cc2eaeb1d33 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -20,6 +20,37 @@ reg_panel_vdd3: regulator-panel-vdd3 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_vdd3_default>;
 	};
+
+	reg_touch_key: regulator-touch-key {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_key";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&msmgpio 86 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_en_default>;
+	};
+
+	reg_key_led: regulator-key-led {
+		compatible = "regulator-fixed";
+		regulator-name = "key_led";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&msmgpio 60 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tkey_led_en_default>;
+	};
+};
+
+&touchkey {
+	vcc-supply = <&reg_touch_key>;
+	vdd-supply = <&reg_key_led>;
 };
 
 &accelerometer {
@@ -81,6 +112,22 @@ panel_vdd3_default: panel-vdd3-default {
 		bias-disable;
 	};
 
+	tkey_en_default: tkey-en-default {
+		pins = "gpio86";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tkey_led_en_default: tkey-led-en-default {
+		pins = "gpio60";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default {
 		pins = "gpio13";
 		function = "gpio";
-- 
2.31.1

