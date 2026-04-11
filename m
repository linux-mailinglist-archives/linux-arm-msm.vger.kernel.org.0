Return-Path: <linux-arm-msm+bounces-102780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKbGNHYe2mmdyggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:12:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 670753DF401
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CCEE300C031
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5620F33A711;
	Sat, 11 Apr 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQB7iK4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE62D9ECA;
	Sat, 11 Apr 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902324; cv=none; b=sak79iQZJQnj6PkZ+ITw8qlEb+fPFjZKMJojObHPNYezfxiT1GpFeRq6LJHbqvfad/ISZP+ZW9ZGxLwJ1Yhna9VNfpBz8rlkCpyfF3J8PniBptYhhqo4ufqEs+tU9Xrhdxd2/p4KX9cP94V64td4d/hsVkedxlhbVDuWyVxPwIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902324; c=relaxed/simple;
	bh=NdMtaSdTLfpsTfZlgnZf+vYaAvPEIw9oE+oKHLTdsIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbhF+ClBMFXhQ7Lw283jhvT6acj3Io5sw0rpfMLSh+r9hD9RPCCcYjA5P0m7LPMohZ7Lpr3XJJBJqewZe18mUF2fpYCxJfCoEnOBJz8O4UO6UIEFNwdmFV9mHgNyo33baEroR78T5OrAn6KPPEi/kMfKHSp9p0/FXaUqXSMbr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQB7iK4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D53FDC116C6;
	Sat, 11 Apr 2026 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775902323;
	bh=NdMtaSdTLfpsTfZlgnZf+vYaAvPEIw9oE+oKHLTdsIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gQB7iK4TRh2xk708N3M7DF499W1ehhvARYGG+c/xyC5LkMpuf41B9LVrHvjKaBRvX
	 apCCAUrd3YjdGdqBNmgy1RUfiBtXI4PLZshma7sywoBQVtkyJF7T9paCty03/7jnNB
	 mdxGn7lJVediJlLty3+ubGeI0cEhHUX6xoID/jIEmRszTcAorvA9H0TuKCP6nop3dq
	 ncItjbfA6zexSSc1l4EnVeU3HkN2GkSF1N7/lI827paPSyw7iRvV120eGX3xMqX28L
	 6V09tjSLbBNNT3z1pQ5mNhNaU56kgG8CFXpGUE/wEBNAdKHePM4tpOPJ47YVLYlTZT
	 rnvc5NdUfkW0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C444EF44879;
	Sat, 11 Apr 2026 10:12:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 11 Apr 2026 12:12:02 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-pixel3-camera-v2-1-41b889abb14c@ixit.cz>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
In-Reply-To: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6705; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=re7F5Z+Enf8P/iTLhHv2AWhHynUi8vNdPeOLUyk9VAw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp2h5yCcA/oMox/Oex5ZjqS5ivpzake89Vwmpkl
 RI5DRHoiYCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadoecgAKCRBgAj/E00kg
 cjXCD/9mdg/PqvIWSw9StDyAVZZ29RCMnFafkCLSTBY0iOg+jV9IUhIzNOl1oAxKlhR2ksf2Uxr
 EDmQDZ9dKky97pLLJrkJM2ezCrI+AyfnmwieE5dH0KnaDh/wv21KMkG0/qmJGI3zUH+Mmkxs8y+
 y6vH/AF1nKsjlmFwRzR4BUro4b9/yr2JQXt9dkjFm/ehm6+CCMXoSr8BCgTPhZilhR0qUqJ2I/6
 60shdaBEIc0WPs94P5TdOZb3+/ICeL4C9lnIukQO9VJ87zoTrEjM885+WreI8FTWa3k6HyUEcRa
 sxl8ikw2u5r6A5hGiujBjrLVp2MMJZsoueCUnNfoUXYhg1AS+XTyhYSMWAajpXqkhAIC3Q4ZvdA
 xxjnQ4M7bN/tUgDQS3xiIgr2lGIpL8Dj3sMVWXC4bkAsmfRslnzzxSgh7sPw1vhZ2LL+3QJBgFY
 gTIIOi535iAkzNHRg35EI5go0S6cAuR9bkO/7mlV3RGn2t8SzHKCf+7qhnp+mWCxeeRMmibuf0z
 dIx5FKYSrf+Taeaqgw/aUkKQoaZZjPL3vNx6sG47D1wXgsmrhEEcwW9cmT7Bhr6jWQTcYaMTM/f
 7nmYnOyzHJJNvSAevO0j1VEEw+dItF1hLWrqd1E5JWklGDVB3klNLSBE18hQpVZHKqD7nUlVWH8
 MTftt2OEvNZ3TdA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102780-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.10:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,0.0.0.2:email,0.0.0.1:email,1a:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 670753DF401
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The Pixel 3 features two front-facing Sony IMX355 sensors with
different focal lengths (standard and wide-angle).

Both sensors are connected via CSIPHY1 and controlled over CCI I2C1,
using MCLK2 as the clock source. Describe the camera nodes and
associated resources in the device tree.

This enables support for the dual front camera configuration.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 187 ++++++++++++++++++++-
 1 file changed, 186 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 6930066857768..084058a597c10 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
@@ -132,6 +133,38 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
 		vin-supply = <&vph_pwr>;
 	};
 
+	camera_front_avdd: front-cam-avdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_avdd";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_avdd_default_pin>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	camera_front_aux_avdd: front-cam-aux-avdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_aux_avdd";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpios = <&tlmm 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_aux_avdd_default_pin>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	wcn3990-pmu {
 		compatible = "qcom,wcn3990-pmu";
 
@@ -214,6 +247,9 @@ vreg_s7a_1p025: smps7 {
 			regulator-max-microvolt = <1028000>;
 		};
 
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
 		vdda_mipi_dsi0_pll:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
@@ -288,6 +324,13 @@ vreg_l21a_2p95: ldo21 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l22a_3p3: ldo22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <2864000>;
+
+			regulator-boot-on;
+		};
+
 		vreg_l24a_3p075: ldo24 {
 			regulator-min-microvolt = <3088000>;
 			regulator-max-microvolt = <3088000>;
@@ -319,6 +362,12 @@ vreg_l28a_3p0: ldo28 {
 			 */
 			regulator-always-on;
 		};
+
+		cam_vio_1p8:
+		vreg_lvs1_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
 	};
 
 	regulators-1 {
@@ -351,6 +400,45 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	vdda-csi0-supply = <&vdda_mipi_csi0_0p9>;
+	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
+	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			camss_endpoint1: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_aux_front_endpoint>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			camss_endpoint2: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_front_endpoint>;
+			};
+		};
+	};
+};
+
+&cci0_sleep {
+	/* bus has external pull-up, don't pull down */
+	bias-disable;
+};
+
 &cci {
 	status = "okay";
 };
@@ -358,7 +446,72 @@ &cci {
 &cci_i2c1 {
 	/* actuator @0c */
 
-	/* front camera, imx355 @1a */
+	front_cam: camera@10 {
+		compatible = "sony,imx355";
+		reg = <0x10>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		/*
+		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
+		 * better driver compatibility.
+		 */
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&camera_front_avdd>;
+		dvdd-supply = <&vreg_s3a_1p35>;
+		dovdd-supply = <&cam_vio_1p8>;
+
+		/* MCLK2 pin (gpio15) is claimed by the aux sensor */
+		pinctrl-0 = <&cam_front_reset_default_pin>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint2>;
+			};
+		};
+	};
+
+	front_aux_cam: camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		/*
+		 * The sensor can accept a 24 MHz clock, but 19.2 MHz has
+		 * better driver compatibility.
+		 */
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&camera_front_aux_avdd>;
+		dvdd-supply = <&vreg_s3a_1p35>;
+		dovdd-supply = <&cam_vio_1p8>;
+
+		pinctrl-0 = <&cam_mclk2_default &cam_front_aux_reset_default_pin>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_aux_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
 
 	/* eeprom @50, at24 driver says 8K */
 };
@@ -459,6 +612,38 @@ &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
+	cam_front_avdd_default_pin: cam-avdd-default-pins {
+		pins = "gpio8";
+		function = "gpio";
+
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_front_aux_reset_default_pin: cam-front-aux-reset-default-pins {
+		pins = "gpio9";
+		function = "gpio";
+
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_front_aux_avdd_default_pin: cam-avdd-aux-default-pins {
+		pins = "gpio14";
+		function = "gpio";
+
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_front_reset_default_pin: cam-front-reset-default-pins {
+		pins = "gpio21";
+		function = "gpio";
+
+		bias-disable;
+		drive-strength = <2>;
+	};
+
 	touchscreen_reset: ts-reset-state {
 		pins = "gpio99";
 		function = "gpio";

-- 
2.53.0



