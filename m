Return-Path: <linux-arm-msm+bounces-60841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91343AD3FC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 244357A4171
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7FB242D94;
	Tue, 10 Jun 2025 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcxEiXWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A61E9905;
	Tue, 10 Jun 2025 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574799; cv=none; b=DtN05hXmYsR+KPzMPi/EZOrH55Y+g611VFaNhpoPk7IQL9AJghAg/n630EP+GmiYi1PuAa+S0XcBgwZz4ryM9vtzFOYhWHcOYn9VLf2R0IcmvaydAhZN5nNzl0HPrunNytN8fT1LhYCri0vItbrRAJpvDa+xSYj3ajtuUY8EL3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574799; c=relaxed/simple;
	bh=OSpF9ZkhqKynpdtZ8deCD/HZpMg3Ub5prYUVfVoF9i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rvgQilT6CsVei+6SeWvgM0czcfnlFBPE8wXyWQTL+RmQNIEyW8Ky5cIRFFI4v3ZADZy/QzZDGf+1JgygejwvpazEdbPYSr2lypqx5xOhw9RHkCFHXtcE+PlR0Ue8W5ycciwZgu6Dgwh3iH4whx1ZVFOD9/biUbd+mbGHyHOXJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcxEiXWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EBFFC4CEF0;
	Tue, 10 Jun 2025 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574799;
	bh=OSpF9ZkhqKynpdtZ8deCD/HZpMg3Ub5prYUVfVoF9i0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=IcxEiXWTbBe+diAxSlYq/9NiLJ/Xc+CAqWk5Q4886K+KV1C+lAGrKi/SY3dnJHvcy
	 aWii7B1iFB2m80qwibIrimCftGSrmLYMwwvK3fkfJEbNnj0UK3w8SKVDt0Z9B84c8J
	 SndEH5EiOUqcM0M620gQUwJLq+LlC5mGionupeyZnUk0dIxA/KU9ZfLafub0cWgO/x
	 V1oxZvC9lHBkL3MUi9WUpCqMwKmz92wTkaO8sRbXB6cX61IJvxSfvYhCd5QXcD0Wsj
	 EAqBlRzjBn6vFCPM1SW44oHYcfs8EepBYR7fz8xJ6LTvbHQkpNBJED+ifjfLz/7oK9
	 2K/xZxlIUOPlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF7DC5B552;
	Tue, 10 Jun 2025 16:59:59 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 10 Jun 2025 18:59:56 +0200
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAItkSGgC/22OQQ6CMBBFr0JmbQ3TaAFX3sOwANrKJJWaTm1Q0
 rtbWbt8Lz8vfwM2gQzDpdogmERMfikgDxVM87DcjSBdGGQtz/VJKsGOHs0qxiiUrhFlIzvUCGX
 /DMbSurdufeGZOPrw3tMJf/ZfJaFAoVVrO4WDbVt19U7zNHvv2LtXLH/4ONIH+pzzF7vGQOCvA
 AAA
X-Change-ID: 20250426-slim7x-bt-6d01127291d1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Anthony Ruhier <aruhier@mailbox.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749574798; l=5316;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=MEFwA6FS4gwwcixWXBosonpMOiLeohbMEMi1CPsp0QM=;
 b=y7xcS6Txh6A6Wq8tfLtmGxLh8ddheXK1OTYAIHAoACNEzrgozpG0iogF4XrC7XPFyeghRuBHa
 /xcbaTKA0JGBKjWsm3n+fJpHSe4JpctCmKcRx+ssdEj2t85uKxpbbLM
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

To enable Bluetooth pwrseq appears to be required for the WCN7850.
Add the nodes from QCP.
Add uart14 for the BT interface.

Tested-by: Anthony Ruhier <aruhier@mailbox.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This patch adds the Bluetooth support for the WCN7850 card on this laptop.
Since WCN7850 is supposed to need pwrseq, also added this from the QCP.

This is also part of my tree [1] for the Yoga Slim 7X.
definition for the pwrseq and regulators.

[1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-jg-6/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
---
Changes in v2:
- rebased to next-20250610
- added tested-by from Anthony Ruhier
- Link to v1: https://lore.kernel.org/r/20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index dad0f11e8e8583df6fd8aeec5be2af86739d85fb..720a514611248bb3d6d9518c2920a11631888e5d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	chosen {
@@ -404,6 +405,101 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -1045,6 +1141,16 @@ &pcie4_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
 	};
 };
 
@@ -1403,6 +1509,37 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
 };
 
 &uart21 {

---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250426-slim7x-bt-6d01127291d1

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



