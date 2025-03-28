Return-Path: <linux-arm-msm+bounces-52736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232AA745A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B95497A2B5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A1D212FBF;
	Fri, 28 Mar 2025 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJnlqtmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687DE2F3B;
	Fri, 28 Mar 2025 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151377; cv=none; b=pe/Xj8lCDREL6KaQNaSew0OHvo7z19HaSH+cUGD95BymSI4bvn3CMLInQtVC1lJ+JoWxGP48vARW72SJFzAdaP7yVHxjxLHYbK6s9Ckdn81zhoyquyQ2pVbML11zzqu+kbKpEr3gUoUJmaUp/0JoeS9l01xT82724JkNTAaJxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151377; c=relaxed/simple;
	bh=jaBdE82HtRD7nwM1AMEv568HmmOnskrmL0Kbhtzr+do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xut0asG7OrA9ASZLF4tbDgKG4Cf486NZvkQcISnJAE7OvJYpVA7VroHgYuDZ+0CIg7o6CEYy7R1sPepCn+xoXw0RXz+VvANn+PTmlL3YNNPs/0PVIrXx6IpUMKT9ebynEnf/J/mKESm4tB/DDvgGdqKw10g5PdMInDfHtZomGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJnlqtmA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4209C4CEE4;
	Fri, 28 Mar 2025 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743151376;
	bh=jaBdE82HtRD7nwM1AMEv568HmmOnskrmL0Kbhtzr+do=;
	h=From:To:Cc:Subject:Date:From;
	b=MJnlqtmAxabfRFbMqvOTD6GsBieLFQPNOy2FKdciPxVtwwHssRucNElEoKQ0A3E2+
	 xMg6JpCR4br8y1G0KABP6khJr3jG373yBEnlKcIgrLO+JdA8kBnuoRNGb665obMu3k
	 2WjFhppIxrafyHNkXc0JuVn3ghlOiwVvwYyzzuoNhRZmEYR7NwS4SHl90GzGZtyFBf
	 eEohY4G749Szovf8fC+Zb7gY8mRTRdFlBvOKHCNuXJwSosgr5F294kEa3Nmc1kZ1nl
	 5AKOsJ1aBXitkYxWU6kTpAO49L+TCezIiy7JO20sCYPQS+p4r9viXTNwXgsAn8D3c1
	 ZGph1MuTkp5LQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1ty5Ir-000000004Nj-1wPA;
	Fri, 28 Mar 2025 09:43:01 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
Date: Fri, 28 Mar 2025 09:41:54 +0100
Message-ID: <20250328084154.16759-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jens reported that the sanity checks added to the new ps883x USB retimer
driver breaks USB and display on the HP X14. Turns out the X14 only has
a retimer on one of the ports, but this initially went unnoticed due to
the missing sanity check (and error handling) in the retimer driver.

Drop the non-existing retimer from the devicetree to enable the second
USB port and the display subsystem.

Note that this also matches the ACPI tables.

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

The devicetree went upstream before the retimer driver so the display
would already be broken in 6.14 and there's no need to backport this
one (but it should go into 6.15).

Note that the SBU mux can be added later when/if someone figures out how
it is connected.

Johan


 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 146 +-----------------
 1 file changed, 2 insertions(+), 144 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 05ad07d90b97..03bbebff4576 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -150,15 +150,7 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss1_ss_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss1_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss1_con_sbu_out>;
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
 					};
 				};
 			};
@@ -370,54 +362,6 @@ vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
 		regulator-boot-on;
 	};
 
-	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1027,64 +971,6 @@ eusb3_repeater: redriver@47 {
 	};
 };
 
-&i2c7 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x8>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
-
-		vdd-supply = <&vreg_rtmr1_1p15>;
-		vdd33-supply = <&vreg_rtmr1_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
-		vddar-supply = <&vreg_rtmr1_1p15>;
-		vddat-supply = <&vreg_rtmr1_1p15>;
-		vddio-supply = <&vreg_rtmr1_1p8>;
-
-		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr1_default>;
-		pinctrl-names = "default";
-
-		orientation-switch;
-		retimer-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss1_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss1_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss1_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
-				};
-			};
-
-		};
-	};
-};
-
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -1519,13 +1405,6 @@ wake-n-pins {
 		};
 	};
 
-	rtmr1_default: rtmr1-reset-n-active-state {
-		pins = "gpio176";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
@@ -1547,27 +1426,6 @@ reset-n-pins {
 		};
 	};
 
-	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
-		pins = "gpio188";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
-		pins = "gpio175";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
-		pins = "gpio186";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1670,7 +1528,7 @@ &usb_1_ss1_dwc3_hs {
 };
 
 &usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&retimer_ss1_ss_in>;
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
 
 &usb_mp {
-- 
2.48.1


