Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767FA269F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgIOHNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:38 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:13095 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOHN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153983;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JUInJ3zV6bN5tuOOZdmmSQIpAO4K+z3ZZwJ+FIcjYFg=;
        b=RWI/aRkN15LcRZW4PVMc7rGHEUCvQTwAWxJNLh6jxXtp3h2lxddJ/Sm5+6KJRm3rVj
        U11kGtsFeLt+aunOvrk6EVACWGf7KpTmBwFU/ULG4zPITMFcVx3miC+bvwcqu4uc/I01
        Q+CKCozUjLcOxA/Wj79EUyWJarfiiBgcsuwUDW77jXt44GuNIVYFMyQC3PhIVBvby8pp
        tD6zWPkTuANvWTo3h4S+hHv8Mwlek5CYHk7dkxDOGgRFbmVlnYo0XZ2mrELeXRGV4Ris
        z1edC8DFnRp1mzgRkzxSIkz2G1wEbQxA4j0tlXUs642dhvTAU+GD05yMregHqTAVABPo
        Nbow==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D1rdw
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:01 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 09/14] arm64: dts: qcom: msm8916: Use more generic node names
Date:   Tue, 15 Sep 2020 09:12:16 +0200
Message-Id: <20200915071221.72895-10-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that all MSM8916 boards are referencing nodes by label instead
of name, we can easily make some more nodes use more generic names
(as recommended in the device tree specification or the binding
documentation).

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 10 ++++-----
 arch/arm64/boot/dts/qcom/pm8916.dtsi          | 22 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 2ba649bffd4e..b18d21e42f59 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -81,7 +81,7 @@ i2c-muic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		muic: sm5502@25 {
+		muic: extcon@25 {
 			compatible = "siliconmitus,sm5502-muic";
 
 			reg = <0x25>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index b2669643a12d..4444d068343c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -714,7 +714,7 @@ sound: sound@7702000 {
 			reg-names = "mic-iomux", "spkr-iomux";
 		};
 
-		lpass: lpass@7708000 {
+		lpass: audio-controller@7708000 {
 			status = "disabled";
 			compatible = "qcom,lpass-cpu-apq8016";
 			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
@@ -743,7 +743,7 @@ lpass: lpass@7708000 {
 			#size-cells = <0>;
 		};
 
-		lpass_codec: codec@771c000 {
+		lpass_codec: audio-codec@771c000 {
 			compatible = "qcom,msm8916-wcd-digital-codec";
 			reg = <0x0771c000 0x400>;
 			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
@@ -1161,7 +1161,7 @@ dsi_phy0: dsi-phy@1a98300 {
 			};
 		};
 
-		mpss: hexagon@4080000 {
+		mpss: remoteproc@4080000 {
 			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
 			reg = <0x04080000 0x100>,
 			      <0x04020000 0x040>;
@@ -1225,7 +1225,7 @@ cb@1 {
 			};
 		};
 
-		pronto: wcnss@a21b000 {
+		pronto: remoteproc@a21b000 {
 			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
 			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
 			reg-names = "ccu", "dxe", "pmu";
@@ -1821,7 +1821,7 @@ rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8916";
 				qcom,smd-channels = "rpm_requests";
 
-				rpmcc: qcom,rpmcc {
+				rpmcc: clock-controller {
 					compatible = "qcom,rpmcc-msm8916";
 					#clock-cells = <1>;
 				};
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 636ef9db9a14..c7b22ac81452 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -6,7 +6,7 @@
 
 &spmi_bus {
 
-	pm8916_0: pm8916@0 {
+	pm8916_0: pmic@0 {
 		compatible = "qcom,pm8916", "qcom,spmi-pmic";
 		reg = <0x0 SPMI_USID>;
 		#address-cells = <1>;
@@ -79,7 +79,7 @@ pm8916_temp: temp-alarm@2400 {
 			#thermal-sensor-cells = <0>;
 		};
 
-		pm8916_vadc: vadc@3100 {
+		pm8916_vadc: adc@3100 {
 			compatible = "qcom,spmi-vadc";
 			reg = <0x3100>;
 			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
@@ -87,33 +87,33 @@ pm8916_vadc: vadc@3100 {
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
 
-			usb_in {
+			adc-chan@0 {
 				reg = <VADC_USBIN>;
 				qcom,pre-scaling = <1 10>;
 			};
-			vph_pwr {
+			adc-chan@7 {
 				reg = <VADC_VSYS>;
 				qcom,pre-scaling = <1 3>;
 			};
-			die_temp {
+			adc-chan@8 {
 				reg = <VADC_DIE_TEMP>;
 			};
-			ref_625mv {
+			adc-chan@9 {
 				reg = <VADC_REF_625MV>;
 			};
-			ref_1250v {
+			adc-chan@a {
 				reg = <VADC_REF_1250MV>;
 			};
-			ref_gnd {
+			adc-chan@e {
 				reg = <VADC_GND_REF>;
 			};
-			ref_vdd {
+			adc-chan@f {
 				reg = <VADC_VDD_VADC>;
 			};
 		};
 	};
 
-	pm8916_1: pm8916@1 {
+	pm8916_1: pmic@1 {
 		compatible = "qcom,pm8916", "qcom,spmi-pmic";
 		reg = <0x1 SPMI_USID>;
 		#address-cells = <1>;
@@ -125,7 +125,7 @@ pm8916_vib: vibrator@c000 {
 			status = "disabled";
 		};
 
-		wcd_codec: codec@f000 {
+		wcd_codec: audio-codec@f000 {
 			compatible = "qcom,pm8916-wcd-analog-codec";
 			reg = <0xf000>;
 			reg-names = "pmic-codec-core";
-- 
2.28.0

