Return-Path: <linux-arm-msm+bounces-88384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD209D0E6BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 10:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4343041549
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C622BDC35;
	Sun, 11 Jan 2026 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="kKTHUee0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F71E2858
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768121964; cv=none; b=XklM+zcgL7K0aiDCNSMJ/Z/eC7Y02xatRTv0dr6xc1rshEDEe8T//HHDyLj2CPkInXObkxly+4l4wt7G+TZ4vy3TZwpmHxvdel4Vp0ffPqlF0Zs3oc3mSoyICY9jkZklFRK6ZDceU24rArmYSJ1ks/HZkBnprSMCRlvVxX8HBKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768121964; c=relaxed/simple;
	bh=raS1hw5es9s9TsSUFF1xmJ3MhxiwfbHyxVriX9nRXNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxIow4zspmzkyIMq+m/mJR21jO6zBZTQxaPd+/8slX1Jap8180QXzsRJbHYba7YRATba+4h7KR3m5yxNZkOVVuXf5uYMbIH6Q9WzFJKAYWJj7RK2KjQfeHghCmVval5bSZyEqEHKubmf/tD8FSi5jaAK/399rtYrxz8KDa56aMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=kKTHUee0; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768121956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94paoUwVKOFWqHROvQ2NKNszL5639iBn34AHziFawgE=;
	b=kKTHUee0GY1BW0nNlEF6TyagdvHFc1ahChsqDKCqp98rtLMxt6Axb9AIFccbwkbCN/zZh5
	ONkJTLZmrqvt4FA1BIJmIfFiBt2k2Agop/IU36B9yO+UJj0sy/sUmD2LrRXRjVx62s4W0r
	V1Qb+psYHn6APDiTsI4wMwFlrEKvodqd43R7wAuqlTzAqz//hRaVA7zWAdVkIRNhEEQ0dx
	BD67gfyaORsBAlSaDcYPyWE6JEICjr+9Rf6uShu+EwvwM71L2myR6tzy9x0cTbiSRSBk9z
	Xf8GfwcfSULvuHk7pNLETHS7v+4omnBG/tMeF9T1q8ggbTEkneeWJczgFD0bmg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
Date: Sun, 11 Jan 2026 05:35:12 -0300
Message-ID: <20260111085726.634091-6-val@packett.cool>
In-Reply-To: <20260111085726.634091-2-val@packett.cool>
References: <20260111085726.634091-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.

Working:
- Wi-Fi (wcn3990 hw1.0)
- Bluetooth
- USB Type-A (USB3 and USB2)
- Ethernet (over USB2)
- HDMI Display
- eMMC
- SDHC (microSD slot)

Not included:
- HDMI Audio
- EC (IT8987)

Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../boot/dts/qcom/sc7180-ecs-liva-qc710.dts   | 625 ++++++++++++++++++
 2 files changed, 627 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0ccd6ec16dfb..27a2dbb2f11c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -163,6 +163,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
+sc7180-ecs-liva-qc710-el2-dtbs	:= sc7180-ecs-liva-qc710.dtb sc7180-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-ecs-liva-qc710.dtb sc7180-ecs-liva-qc710-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
new file mode 100644
index 000000000000..692085bc6169
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
@@ -0,0 +1,625 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sc7180.dtsi"
+
+#include "pm6150.dtsi"
+#include "pm6150l.dtsi"
+
+/delete-node/ &tz_mem;
+/delete-node/ &ipa_fw_mem;
+
+/ {
+	model = "ECS LIVA QC710";
+	compatible = "ecs,liva-qc710", "qcom,sc7180";
+	chassis-type = "desktop";
+
+	aliases {
+		bluetooth0 = &bluetooth;
+		hsuart0 = &uart3;
+		wifi0 = &wifi;
+	};
+
+	hdmi-bridge {
+		compatible = "algoltek,ag6311";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_dp_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
+	reserved-memory {
+		gpu_mem: zap-shader@80840000 {
+			reg = <0x0 0x80840000 0 0x2000>;
+			no-map;
+		};
+
+		venus_mem: venus@85b00000 {
+			reg = <0x0 0x85b00000 0 0x500000>;
+			no-map;
+		};
+
+		mpss_mem: mpss@86000000 {
+			reg = <0x0 0x86000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@8e400000 {
+			reg = <0x0 0x8e400000 0x0 0x2800000>;
+			no-map;
+		};
+
+		wlan_mem: wlan@93900000 {
+			reg = <0x0 0x93900000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	usb_a_connector: usb-a-connector {
+		compatible = "usb-a-connector";
+
+		port {
+			usb_a_connector_ss_in: endpoint {
+				remote-endpoint = <&usb_1_qmpphy_usb_ss_out>;
+			};
+		};
+	};
+};
+
+&dpu_intf1_out {
+	/delete-property/ remote-endpoint;
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcdxkmsuc7180.mbn";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp_hot_plug_det>;
+
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
+&mdss_dsi0_in {
+	/delete-property/ remote-endpoint;
+};
+
+&pm6150_pon {
+	status = "disabled";
+};
+
+&pm6150_rtc {
+	status = "okay";
+};
+
+&qfprom {
+	vcc-supply = <&vreg_l11a_1p8>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	memory-region = <&adsp_mem>;
+	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcadsp7180.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcmpss7180_nm.mbn";
+	status = "okay";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	vmmc-supply = <&vreg_l19a_2p9>;
+	vqmmc-supply = <&vreg_l12a_1p8>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+
+	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&uart3 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 = <&qup_uart3_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn3991-bt";
+		vddio-supply = <&vreg_l10a_1p8>;
+		vddxo-supply = <&vreg_l1c_1p8>;
+		vddrf-supply = <&vreg_l2c_1p3>;
+		vddch0-supply = <&vreg_l10c_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub@1 {
+		compatible = "usb5e3,608";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		r8152: ethernet@4 {
+			compatible = "usbbda,8152";
+			reg = <4>;
+		};
+	};
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l4a_0p8>;
+	vdda-pll-supply = <&vreg_l11a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
+	qcom,imp-res-offset-value = <8>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+	qcom,bias-ctrl-value = <0x22>;
+	qcom,charge-ctrl-value = <3>;
+	qcom,hsdisc-trim-value = <0>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l4a_0p8>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_qmpphy_dp_out: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+
+			usb_1_qmpphy_usb_ss_out: endpoint@1 {
+				reg = <1>;
+
+				data-lanes = <1 0>;
+				remote-endpoint = <&usb_a_connector_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
+
+&venus {
+	firmware-name = "qcom/sc7180/ecs/liva-qc710/qcvss7180.mbn";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
+	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l11c_3p3>;
+
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm6150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a_1p1: smps1 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_l4a_0p8: ldo4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_0p6: ldo9 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l11a_1p8: ldo11 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_1p8: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_2p8: ldo18 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a_2p9: ldo19 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s8c_1p3: smps8 {
+			regulator-min-microvolt = <1120000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1616000>;
+			regulator-max-microvolt = <1984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p3: ldo2 {
+			regulator-min-microvolt = <1168000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&tlmm {
+	/*
+	 * The TZ seem to protect those because some boards can have
+	 * fingerprint sensor connected to this range. Not connected
+	 * on this board
+	 */
+	gpio-reserved-ranges = <58 5>;
+
+	qup_uart3_sleep: qup-uart3-sleep-state {
+		cts-pins {
+			/*
+			 * Configure a pull-down on CTS to match the pull of
+			 * the Bluetooth module.
+			 */
+			pins = "gpio38";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		rts-pins {
+			/*
+			 * Configure pull-down on RTS. As RTS is active low
+			 * signal, pull it low to indicate the BT SoC that it
+			 * can wakeup the system anytime from suspend state by
+			 * pulling RX low (by sending wakeup bytes).
+			 */
+			pins = "gpio39";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		tx-pins {
+			/*
+			 * Configure pull-up on TX when it isn't actively driven
+			 * to prevent BT SoC from receiving garbage during sleep.
+			 */
+			pins = "gpio40";
+			function = "gpio";
+			bias-pull-up;
+		};
+
+		rx-pins {
+			/*
+			 * Configure a pull-up on RX. This is needed to avoid
+			 * garbage data when the TX pin of the Bluetooth module
+			 * is floating which may cause spurious wakeups.
+			 */
+			pins = "gpio41";
+			function = "gpio";
+			bias-pull-up;
+		};
+	};
+
+	soc_bkoff_default: soc-bkoff-deault-state {
+		pins = "gpio10";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	sdc1_default: sdc1-default-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc1_sleep: sdc1-sleep-state {
+		clk-pins {
+			pins = "sdc1_clk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc1_cmd";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc1_data";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		rclk-pins {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc2_default: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		sd-cd-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc2_sleep: sdc2-sleep-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		sd-cd-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+};
-- 
2.51.2


