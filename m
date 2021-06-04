Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512DB39BEDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 19:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhFDRdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 13:33:38 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:13066 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhFDRdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 13:33:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622827906; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FfNbc5Ygj+VwOZMsmA4zRq9MiRJWkVPuke4BFF2udE1vuzy/u+Fbrxj1/z0lWvhyWG
    +rml+4a65aHPVk9Z8EQXy3new/0FgB5VtUUW3u7SPsM+1Iloks203FS7zj6IfwnSShX3
    3sE6v3Kk8aOoyZ2OZuyFy1yaNrNmpoh7IrmM4dNtxCEfvfiCGDFk82Oon4oAgMa6ta/U
    ikk0RoLbLejKZkmc2MW5A12ct2xUb9qbTVK+lgvBGxtGCVyt3akVzjWp7iLj+hQnOsif
    UgyOe0JlH8JzcU+UNXUkrKpzz0CiYsnwJErtSqMaAba9+F1bdoYCn5t49jmRK86FGxQ+
    lS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827906;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mSYYPDriWafDsRnOq+e+C/pvcp+yUcNz2lLVJri/j88=;
    b=IWgknCRaeyrVDK3X7+5SLVpW9oIjsi8OhhJP2BpZp9eZf7gLWKf2zyx2fwCdqhJ3fa
    TTyh4S2p7Hf2MoYlKztNDPPaxXN4lX+Ypv14zXFtYsVzUkTfiAFBWIXaaJR6/xpmndLR
    vAcslNkCJIM9RXwKf5jzVH28yExCChyfVP8uZIj+7D4tcZwwVp52/NuMWHN3wC1wEVZK
    BI6jlUGZaXgb2PBNMlQZ72fgOxChnIeG4Wf2RrInaQDCRnISeErCzK1ld4ymMhMhXN3i
    Jdteudg5irVLG5eUvgyBWzCvKcx+LeptDW/hYqtPx0zgTUeSlK5QrLRGpSad+kz3IqAA
    LcDg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827906;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mSYYPDriWafDsRnOq+e+C/pvcp+yUcNz2lLVJri/j88=;
    b=r+j84QF89zvDdLE7k8FmaZs0SncsfWMPV/vhiKwKMludSV99CLoPjulewG5Ssg0gUr
    uBrIm3KjpAGFTvQ2RV1qqxBbjUMUpEVguEQt+QtOwcj8Z5eyGymU2MlDoMlTWowkMnjV
    9d71ikyuzY3cnnOodtK4TXPW8slRswtBsmtabAf7Ix8urHWKlFz2HMPpacAe082WG+wA
    ue86k32ud6kDRKP1FmNMRshWWa0N28cHaK4xrBGUqb2h6pNWM0Ra7z0drXGRd10ttmME
    L589hKlcwK1Z2MwVzOuh6S7Z6pw7btCxLx8WTD/yrHGJ2tHmfqTRE/hpuj6F4IeD2yJz
    4Naw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6Pvxo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x54HVjH5b
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 4 Jun 2021 19:31:45 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>,
        Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 5/5] arm64: dts: qcom: msm8916-samsung-a2015: Add NFC
Date:   Fri,  4 Jun 2021 19:27:42 +0200
Message-Id: <20210604172742.10593-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604172742.10593-1-stephan@gerhold.net>
References: <20210604172742.10593-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy A3/A5 both have a Samsung S3FWRN5 NFC chip that
works quite well with the s3fwrn5 driver in the Linux NFC subsystem.

The clock setup for the NFC chip is a bit special (although this
seems to be a common approach used for Qualcomm devices with NFC):

The NFC chip has an output GPIO that is asserted whenever the clock
is needed to function properly. On the A3/A5 this is wired up to
PM8916 GPIO2, which is then configured with a special function
(NFC_CLK_REQ or BB_CLK2_REQ).

Enabling the rpmcc RPM_SMD_BB_CLK2_PIN clock will then instruct
PM8916 to automatically enable the clock whenever the NFC chip
requests it. The advantage is that the clock is only enabled when
needed and we don't need to manage it ourselves from the NFC driver.

Note that for some reason Samsung decided to connect the I2C pins
to GPIOs where no hardware I2C bus is available, so we need to
fall back to software bit-banging with i2c-gpio.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 9a6988ded29d..9b4b7de7cec2 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	aliases {
@@ -124,6 +125,34 @@ touchkey: touchkey@20 {
 			pinctrl-0 = <&tkey_default>;
 		};
 	};
+
+	i2c-nfc {
+		compatible = "i2c-gpio";
+		sda-gpios = <&msmgpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nfc_i2c_default>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nfc@27 {
+			compatible = "samsung,s3fwrn5-i2c";
+			reg = <0x27>;
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <21 IRQ_TYPE_EDGE_RISING>;
+
+			en-gpios = <&msmgpio 20 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&msmgpio 49 GPIO_ACTIVE_HIGH>;
+
+			clocks = <&rpmcc RPM_SMD_BB_CLK2_PIN>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&nfc_default &nfc_clk_req>;
+		};
+	};
 };
 
 &blsp_i2c2 {
@@ -384,6 +413,30 @@ muic_int_default: muic-int-default {
 		bias-disable;
 	};
 
+	nfc_default: nfc-default {
+		pins = "gpio20", "gpio49";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+
+		irq {
+			pins = "gpio21";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	nfc_i2c_default: nfc-i2c-default {
+		pins = "gpio0", "gpio1";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tkey_default: tkey-default {
 		pins = "gpio98";
 		function = "gpio";
@@ -408,3 +461,14 @@ tsp_en_default: tsp-en-default {
 		bias-disable;
 	};
 };
+
+&pm8916_gpios {
+	nfc_clk_req: nfc-clk-req {
+		pins = "gpio2";
+		function = "func1";
+
+		input-enable;
+		bias-disable;
+		power-source = <PM8916_GPIO_L2>;
+	};
+};
-- 
2.31.1

