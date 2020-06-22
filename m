Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEC4203A90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgFVPSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:18:45 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:23176 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729454AbgFVPSn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592839114;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=WwyC1ITHsyn8RPMBU8p7ti2a7UnssWyBy58epyvIp3k=;
        b=Msrr6hoHjJ67E70LkFgxRdN4uy+QJzasD0a6i/T11QjnONd2sHSUpxf3n8QQNMrp25
        dEPP0nCevjgLKtAcISUwpod1+tjsvTx2DbevE4UuQ8wEAFU4SY7it4PJ4dGVtpTDiKyO
        mthdXLkWAmsjvZAwBi+ulvpofOkP1GKMRhaNu00lwUsFy3qzRrnYMrfWPF5W+JQ6So5u
        +bvb60vwhKLBF8vSBYSHRSSGkhLyCZGM2Svv0P5+siBVJ5UU968rtGa48ouym9VMpjj+
        HZa9I52rKdFrwZaS2/YmhYBip7CQrQcc0dn/Vx3Fz++/IXSA7M+XnR30lQG2PYj/Uh7V
        FWIQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OIUPH"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5MFIW5Xm
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 22 Jun 2020 17:18:32 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] arm64: dts: msm8916-samsung/longcheer: Move pinctrl/regulators to end of file
Date:   Mon, 22 Jun 2020 17:17:48 +0200
Message-Id: <20200622151751.408995-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622151751.408995-1-stephan@gerhold.net>
References: <20200622151751.408995-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is helpful to be able to see all hardware components in one part
of the device tree, without having to scroll over the large amount
of regulator/pinctrl nodes. Keep those separated at the end of the file
to make navigation a bit easier.

This also makes it consistent with the order used in apq8016-sbc.dtsi.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  50 +++---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 158 +++++++++---------
 2 files changed, 104 insertions(+), 104 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index d5230cb76eb1..ed105e06c3fc 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -108,31 +108,6 @@ volume-up {
 	};
 };
 
-&msmgpio {
-	gpio_keys_default: gpio-keys-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio107";
-		};
-		pinconf {
-			pins = "gpio107";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	usb_vbus_default: usb-vbus-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio62";
-		};
-		pinconf {
-			pins = "gpio62";
-			bias-pull-up;
-		};
-	};
-};
-
 &spmi_bus {
 	pm8916@0 {
 		pon@800 {
@@ -258,3 +233,28 @@ l18 {
 		regulator-max-microvolt = <2700000>;
 	};
 };
+
+&msmgpio {
+	gpio_keys_default: gpio-keys-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio107";
+		};
+		pinconf {
+			pins = "gpio107";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	usb_vbus_default: usb-vbus-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio62";
+		};
+		pinconf {
+			pins = "gpio62";
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index ea52adf07a4b..b20c1013612f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -167,77 +167,14 @@ muic: sm5502@25 {
 	};
 };
 
-&msmgpio {
-	gpio_keys_default: gpio-keys-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio107", "gpio109";
-		};
-		pinconf {
-			pins = "gpio107", "gpio109";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	gpio_hall_sensor_default: gpio-hall-sensor-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio52";
-		};
-		pinconf {
-			pins = "gpio52";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	muic_int_default: muic-int-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio12";
-		};
-		pinconf {
-			pins = "gpio12";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	tsp_en_default: tsp-en-default {
-		pinmux {
-			function = "gpio";
-			pins = "gpio73";
-		};
-		pinconf {
-			pins = "gpio73";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
-	pmx-mdss {
-		mdss_default: mdss-default {
-			pinmux {
-				function = "gpio";
-				pins = "gpio25";
-			};
-			pinconf {
-				pins = "gpio25";
-				drive-strength = <8>;
-				bias-disable;
-			};
-		};
-
-		mdss_sleep: mdss-sleep {
-			pinmux {
-				function = "gpio";
-				pins = "gpio25";
-			};
-			pinconf {
-				pins = "gpio25";
-				drive-strength = <2>;
-				bias-pull-down;
+&spmi_bus {
+	pm8916@0 {
+		pon@800 {
+			volume-down {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				bias-pull-up;
+				linux,code = <KEY_VOLUMEDOWN>;
 			};
 		};
 	};
@@ -356,15 +293,78 @@ l18 {
 	};
 };
 
-&spmi_bus {
-	pm8916@0 {
-		pon@800 {
-			volume-down {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
+&msmgpio {
+	gpio_keys_default: gpio-keys-default {
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
+	gpio_hall_sensor_default: gpio-hall-sensor-default {
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
+	mdss {
+		mdss_default: mdss-default {
+			pinmux {
+				function = "gpio";
+				pins = "gpio25";
+			};
+			pinconf {
+				pins = "gpio25";
+				drive-strength = <8>;
+				bias-disable;
+			};
+		};
+
+		mdss_sleep: mdss-sleep {
+			pinmux {
+				function = "gpio";
+				pins = "gpio25";
 			};
+			pinconf {
+				pins = "gpio25";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	muic_int_default: muic-int-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio12";
+		};
+		pinconf {
+			pins = "gpio12";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	tsp_en_default: tsp-en-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio73";
+		};
+		pinconf {
+			pins = "gpio73";
+			drive-strength = <2>;
+			bias-disable;
 		};
 	};
 };
-- 
2.27.0

