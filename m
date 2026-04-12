Return-Path: <linux-arm-msm+bounces-102860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ8DMeLJ22nzGgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:35:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92A3E4DA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 18:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0933A3019515
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 16:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CF52C0F6D;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH3cu9Aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEFB42050;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011737; cv=none; b=txWUYmw73k8ZVsbLbsnOTlYkOzw3R3o+FIcqZ/PqfTO/ySmWgF0oiGazffZJ4QGz8n10nod5e6o4urNLqGhZ2YMy1sBZyQtO76O5qvJw0QkKaQ61IiHSMrhV/lIpM0kPSEag/DIGdclzhrZLXk0w1lQlgYCDRwWVmlzd5ekeTgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011737; c=relaxed/simple;
	bh=4+WSZKF70XQfTRs634NmjMimMoNJNgKygeVxRWCL0MQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVg8VTic98xuuAcXgqhyTd4gu81HmlJ6yxpjJ7JumZq+u+xBlq0dfhZu27dXZLB5DQ/HKj+i6bwzWSNtnWFZCSExEDdBPYqJb9u4xSRVzYAUo9cB2vjuC/jjaI+SuGwXdhLHE+MKtvTaiUhYCC2ASP9DCCyAcRFfQ9nnQ/g0zIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH3cu9Aa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EA15C19425;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776011737;
	bh=4+WSZKF70XQfTRs634NmjMimMoNJNgKygeVxRWCL0MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pH3cu9Aa1YIFQNy2vsjWShpoyMOGJAm5T3FpSB+kJIt6MFOIZNXXuNGG9OGafqVHO
	 q1NNnE7uMBKoRMfeG22Siv1l3rdOZH5t6BTzE6APNBnRM2sZCMcGTM9E6gaBsNQmtV
	 a1fggMD3I8gSrP+g1e89wr9Z3LTx8O+vCvbEroRPme6O1Ee9rJ1Pz2kbfMKDuYfjyv
	 lBogU0LEbiXJYH5OEiPEoGXRmI+FNkS66nQcQND2bKShx+Fm5kwJ6hfHG/frPLYrHK
	 2jtS+hFLiak4qHGEBJWNC386vjHdSmL6Pksy+PiPBOSD9lQlzC/22FH73wrSrA1pjN
	 TXkHhLzde6sLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A4FE937EA;
	Sun, 12 Apr 2026 16:35:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 12 Apr 2026 18:35:36 +0200
Subject: [PATCH v3 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
In-Reply-To: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6886; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MWuWXLNUnlkJytdxHDINSv09dRhxGkw0hQbtOrZahRQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp28nYLbNBQybXIyVt1GbOsYLnTnohsdvmFUxna
 QnPAbXr+nqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadvJ2AAKCRBgAj/E00kg
 ct5rD/9hhoV1ANwZsRnm/umrTyd8kHWnrHADRTEy+C8R7fiW5qfvzSK5VwVjKPPjdLiv8w4Xzsq
 +0nqxD9gAvtMcaAqFV66NZ/mLk5qSDWRaK0Qxa+h1zF4LWrofWLjQ/D8jwIvO9OrKwQXGKESFoo
 S1ka1eKlOdU0D5LMCxrJUcU0LqWzoZWM9LtKrzlTl7qtJOuidrP6Bd0LHx70RS/5IZ3X3dfe2oi
 31abXX2xDztwlvBvzfSn4EQwl0j/8p8cSIxJdM3FS79zfA+2pojgsDmyNWLnkVF5KYkY5c3PH9m
 JM3qo79nk8sNubQ3O6Zbuh5wCIzcn3lUyvlmcbfB4EhiaBOExSmaxJmXe0KOsxIH2JWX8mLDEMg
 PtJHEUnqfqSFVbENeVDHF/aJ+J7f/J/kbK8FvP5ym9Fl4F/zt40MDm6vdHtuma6F1x22COKm4wy
 gYy2dG3hfv+MIyjwSMBmQjUibmV0DtMisLztq6TV3TgrI7BRSjN//SQoKit7UkBjai9SHquZmoh
 apKvu1drKUpek34AmkdsZoRMwzbq+LRS31ZozwJ8gh3YGadCcMTNARG0iF34e6VlVEcQV/TWNnz
 BWQcLaDFep85rfurByWhzmIo0xUHzp3zgL/AObJHXGBvQJStbzyIqr5mnyfabZNvIeAarG4DyJn
 OMf9hrKRhdlhsng==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102860-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.10:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1a:email]
X-Rspamd-Queue-Id: 6C92A3E4DA4
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
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 193 ++++++++++++++++++++-
 1 file changed, 192 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 6930066857768..070023a9813ce 100644
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
@@ -319,6 +362,11 @@ vreg_l28a_3p0: ldo28 {
 			 */
 			regulator-always-on;
 		};
+
+		vreg_lvs1_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
 	};
 
 	regulators-1 {
@@ -351,6 +399,53 @@ vreg_s3c_0p6: smps3 {
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
+	/*
+	 * MCLK2 (GPIO15) is shared between both front camera sensors.
+	 * The clock is generated by CAMSS, therefore the pin is
+	 * configured here rather than in individual sensor nodes.
+	 */
+	pinctrl-0 = <&cam_mclk2_default>;
+	pinctrl-names = "default";
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
@@ -358,7 +453,71 @@ &cci {
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
+		dovdd-supply = <&vreg_lvs1_1p8>;
+
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
+		dovdd-supply = <&vreg_lvs1_1p8>;
+
+		pinctrl-0 = <&cam_front_aux_reset_default_pin>;
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
@@ -459,6 +618,38 @@ &tlmm {
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



