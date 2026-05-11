Return-Path: <linux-arm-msm+bounces-106907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGrSBju/AWq7jQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:36:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D5A50CDB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01B48304F407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE48374192;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvFlbWQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C78372B4B;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499234; cv=none; b=m/HVHXsW3G32erEnBuqQTiw7Rw5bS9SVWjNsbwgK8NhCkbEX4ppVXZnw+d95swyIvkgo0LDx9nIDwikOftqCsr1t+ngkPzKdCRQUzHoAtGRVLDMYX8sbtdoGv9fxyMIbiHlUGErLot4h0mEGZbf5+07a7aH9ELKOMBSDaFUA8YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499234; c=relaxed/simple;
	bh=gNhXm73yk5AAx7IEb0fSE6GdDtt1HaVhNEJH9wEfkdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5MLuT4Vi1vGV2OKoECVCt/UPGrPjscaw8iXlvDqnkrkQmeR5XVF/SA1l4njEuuJGExOHMhPEOiNtrc9Xx3l30rJhjY47Mv1aMp7z1+oGzlqMYU0EvXdjGtv+lGAwNz6DtxXeFadaMhABSyRJtWW5Apd/jbAM49XARLhiTimwYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvFlbWQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6241EC2BCFA;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499234;
	bh=gNhXm73yk5AAx7IEb0fSE6GdDtt1HaVhNEJH9wEfkdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FvFlbWQj7VPyXEEuA2tcpzTfubldR7XWF1+9+yYg8HEEPztS1w7erM+p6U0/a5ItL
	 NLxwyX0mKNaOfDYCvOP+LuDCR4Cv+tlsOdDJx9sxrksxTNxacmUmm/xwV1XuNTKIoB
	 +2f5ooJaGtNEX65cTmbfYIlosIwZXiWiThScJe3aDvCoNtZ9ic5QrhyNW5P4nKIUD8
	 wJ9dsF3todNy1uy/x2FHH/TcrGTMp5iLyuNT1JeCuNVZWHvhim3H85ofjAHFE8CvKe
	 NzclNzTpyZ1fPpad6FsY0Iw1bnth2oZQ3GOI8Q7e/gu2c9kINUYwpmunfkTTMN8p2E
	 MOv45HdoBoDJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4E0CD37AC;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 11 May 2026 18:33:55 +0700
Subject: [PATCH v2 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-pocketds-v2-3-299dd4247f2f@gmail.com>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
In-Reply-To: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778499232; l=43674;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=1QpEFcOqez3CS5K0Utrqk1bI+h5+Y68FdIA5PuTfwos=;
 b=rNgc9WwuGWWZvr9NZ+FM86oPHjKp2SWcyqHf9/dkEu02Qqwt/PQepES4qMwX4leTzD5y2zfKK
 6H94BIsz0/ZAWxlhX7ecG8No6ToKI5/jM5MGLWJxtt6vkEP+2i8xKoy
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: A1D5A50CDB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106907-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Teguh Sobirin <teguh@sobir.in>

Add initial Device Tree for the Ayaneo Pocket DS gaming console based
on the Qualcomm QCS8550 platform.

The design is similar to a phone without the modem, the game control
is handled via a standalone controller connected to a Renesas uPD720201
PCIe USB 3.0 host controller. DisplayPort is muxed over the USB-C
connector with all four lanes wired.

Display panel support will be added in a second time.

Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      | 1861 ++++++++++++++++++++
 2 files changed, 1862 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc42829f92eb..45859e977bc9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -185,6 +185,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayaneo-pocketds.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
new file mode 100644
index 000000000000..9d32f64e6651
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
@@ -0,0 +1,1861 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Teguh Sobirin.
+ * Copyright (c) 2025, ROCKNIX (https://github.com/ROCKNIX)
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "qcs8550.dtsi"
+#include "pm8550.dtsi"
+#include "pm8550b.dtsi"
+#define PMK8550VE_SID 5
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &aop_image_mem;
+/delete-node/ &aop_config_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &mpss_dsm_mem;
+/delete-node/ &mpss_mem;
+/delete-node/ &q6_mpss_dtb_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &q6_cdsp_dtb_mem;
+
+/delete-node/ &remoteproc_mpss;
+/delete-node/ &remoteproc_cdsp;
+
+/ {
+	model = "AYANEO Pocket DS";
+	compatible = "ayaneo,pocketds", "qcom,qcs8550", "qcom,sm8550";
+	rocknix-u-boot-dt-id = "u-boot-pocket-ds";
+
+	aliases {
+		serial0 = &uart7;
+		serial1 = &uart14;
+		hsuart0 = &uart11;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	tca6424_vcc: regulator-tca6424-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "tca6424_vcc";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 168 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_ts: vdd-ts {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_ts_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tca6408 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		hyp_mem: hyp-region@80000000 {
+			reg = <0 0x80000000 0 0xa00000>;
+			no-map;
+		};
+
+		cpusys_vm_mem: cpusys-vm-region@80a00000 {
+			reg = <0 0x80a00000 0 0x400000>;
+			no-map;
+		};
+
+		hyp_tags_mem: hyp-tags-region@80e00000 {
+			reg = <0 0x80e00000 0 0x3d0000>;
+			no-map;
+		};
+
+		xbl_sc_mem: xbl-sc-region@d8100000 {
+			reg = <0 0xd8100000 0 0x40000>;
+			no-map;
+		};
+
+		hyp_tags_reserved_mem: hyp-tags-reserved-region@811d0000 {
+			reg = <0 0x811d0000 0 0x30000>;
+			no-map;
+		};
+
+		xbl_dt_log_merged_mem: xbl-dt-log-merged-region@81a00000 {
+			reg = <0 0x81a00000 0 0x260000>;
+			no-map;
+		};
+
+		aop_config_merged_mem: aop-config-merged-region@81c80000 {
+			reg = <0 0x81c80000 0 0x74000>;
+			no-map;
+		};
+
+		chipinfo_mem: chipinfo-region@81cf4000 {
+			reg = <0 0x81cf4000 0 0x1000>;
+			no-map;
+		};
+
+		global_sync_mem: global-sync-region@82600000 {
+			reg = <0 0x82600000 0 0x100000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat-region@82700000 {
+			reg = <0 0x82700000 0 0x100000>;
+			no-map;
+		};
+
+		cpucp_fw_mem: cpucp-fw-region@d8140000 {
+			reg = <0 0xd8140000 0 0x1c0000>;
+			no-map;
+		};
+
+		qtee_mem: qtee-region@d8300000 {
+			reg = <0 0xd8300000 0 0x500000>;
+			no-map;
+		};
+
+		hwfence_shbuf: hwfence-shbuf-region@e6440000 {
+			reg = <0 0xe6440000 0 0x2dd000>;
+			no-map;
+		};
+
+		hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
+			reg = <0 0xff700000 0 0x100000>;
+			no-map;
+		};
+
+		llcc_lpi_mem: llcc-lpi-region@ff800000 {
+			reg = <0 0xff800000 0 0x600000>;
+			no-map;
+		};
+
+		hyp_ext_tags_mem: hyp-ext-tags-region@fce00000 {
+			reg = <0 0xfce00000 0 0x2900000>;
+			no-map;
+		};
+
+		splash_region: splash-region@b8000000 {
+			reg = <0x0 0xb8000000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	sound {
+		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8550-APS";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&spk_amp_l>,
+					    <&spk_amp_r>,
+					    <&swr0 0>,
+					    <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vdd_fan_5v0: vdd-fan-5v0-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fan_5v0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&fan_pwr_active>;
+		pinctrl-names = "default";
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	upd720201_avdd33_reg: upd720201-avdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "upd720201_avdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&upd720201_avdd33>;
+		pinctrl-names = "default";
+	};
+
+	upd720201_vdd10_reg: upd720201-vdd10-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "upd720201_vdd10";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+
+		gpios = <&tlmm 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&upd720201_vdd10>;
+		pinctrl-names = "default";
+	};
+
+	upd720201_vdd33_reg: upd720201-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "upd720201_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&upd720201_vdd33>;
+		pinctrl-names = "default";
+	};
+
+	pwm_fan: pwm-fan {
+		compatible = "pwm-fan";
+
+		pinctrl-0 = <&fan_pwm_active>, <&fan_int>;
+		pinctrl-names = "default", "sleep";
+
+		fan-supply = <&vdd_fan_5v0>;
+		pwms = <&pm8550_pwm 3 40000>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <64 IRQ_TYPE_EDGE_FALLING>;
+
+		#cooling-cells = <2>;
+		cooling-levels = <0 30 45 60 70 90 120 150>;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s5g_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_s2g_0p85>;
+		vdddig-supply = <&vreg_s4e_0p95>;
+		vddrfa1p2-supply = <&vreg_s4g_1p25>;
+		vddrfa1p8-supply = <&vreg_s6g_1p86>;
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
+};
+
+&cpuss0_thermal {
+	polling-delay = <200>;
+
+	trips {
+		cpuss0_fan0: trip-point2 {
+			temperature = <40000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss0_fan1: trip-point3 {
+			temperature = <50000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss0_fan2: trip-point4 {
+			temperature = <60000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss0_fan3: trip-point5 {
+			temperature = <65000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss0_fan4: trip-point6 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss0_fan5: trip-point7 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss0_fan6: trip-point8 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&cpuss1_thermal {
+	polling-delay = <200>;
+
+	trips {
+		cpuss1_fan0: trip-point2 {
+			temperature = <40000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss1_fan1: trip-point3 {
+			temperature = <50000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss1_fan2: trip-point4 {
+			temperature = <60000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss1_fan3: trip-point5 {
+			temperature = <65000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss1_fan4: trip-point6 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss1_fan5: trip-point7 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss1_fan6: trip-point8 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&cpuss2_thermal {
+	polling-delay = <200>;
+
+	trips {
+		cpuss2_fan0: trip-point2 {
+			temperature = <40000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss2_fan1: trip-point3 {
+			temperature = <50000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss2_fan2: trip-point4 {
+			temperature = <60000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss2_fan3: trip-point5 {
+			temperature = <65000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss2_fan4: trip-point6 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss2_fan5: trip-point7 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss2_fan6: trip-point8 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&cpuss3_thermal {
+	polling-delay = <200>;
+
+	trips {
+		cpuss3_fan0: trip-point2 {
+			temperature = <40000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss3_fan1: trip-point3 {
+			temperature = <50000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss3_fan2: trip-point4 {
+			temperature = <60000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss3_fan3: trip-point5 {
+			temperature = <65000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss3_fan4: trip-point6 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss3_fan5: trip-point7 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpuss3_fan6: trip-point8 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&cpu7_top_thermal {
+	polling-delay = <200>;
+
+	trips {
+		cpu7_top_fan0: trip-point2 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpu7_top_fan1: trip-point3 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		cpu7_top_fan2: trip-point4 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss0_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss0_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss0_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss0_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss1_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss1_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss1_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss1_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss2_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss2_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss2_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss2_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss3_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss3_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss3_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss3_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss4_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss4_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss4_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss4_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss5_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss5_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss5_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss5_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss6_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss6_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss6_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss6_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+&gpuss7_thermal {
+	polling-delay = <200>;
+
+	trips {
+		gpuss7_fan0: trip-point3 {
+			temperature = <70000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss7_fan1: trip-point4 {
+			temperature = <75000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+
+		gpuss7_fan2: trip-point5 {
+			temperature = <80000>;
+			hysteresis = <3000>;
+			type = "passive";
+		};
+	};
+};
+
+/* DMIC 01 23 */
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s6g_1p86>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s4g_1p25>;
+		vdd-l12-supply = <&vreg_s6g_1p86>;
+		vdd-l15-supply = <&vreg_s6g_1p86>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2720000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_1p2: ldo11 {
+			regulator-name = "vreg_l11b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_2p8: ldo16 {
+			regulator-name = "vreg_l16b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s4g_1p25>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_l3c_0p9: ldo3 {
+			regulator-name = "vreg_l3c_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+
+		vreg_s4e_0p95: smps4 {
+			regulator-name = "vreg_s4e_0p95";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5e_1p08: smps5 {
+			regulator-name = "vreg_s5e_1p08";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1e_0p88: ldo1 {
+			regulator-name = "vreg_l1e_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s4e_0p95>;
+		vdd-l2-supply = <&vreg_s4e_0p95>;
+		vdd-l3-supply = <&vreg_s4e_0p95>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s4f_0p5: smps4 {
+			regulator-name = "vreg_s4f_0p5";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_0p9: ldo1 {
+			regulator-name = "vreg_l1f_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_0p88: ldo2 {
+			regulator-name = "vreg_l2f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_0p88: ldo3 {
+			regulator-name = "vreg_l3f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "g";
+		vdd-l1-supply = <&vreg_s4g_1p25>;
+		vdd-l2-supply = <&vreg_s4g_1p25>;
+		vdd-l3-supply = <&vreg_s4g_1p25>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vreg_s1g_1p25: smps1 {
+			regulator-name = "vreg_s1g_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2g_0p85: smps2 {
+			regulator-name = "vreg_s2g_0p85";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3g_0p8: smps3 {
+			regulator-name = "vreg_s3g_0p8";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4g_1p25: smps4 {
+			regulator-name = "vreg_s4g_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_0p85: smps5 {
+			regulator-name = "vreg_s5g_0p85";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6g_1p86: smps6 {
+			regulator-name = "vreg_s6g_1p86";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pm8550_gpios {
+	sdc2_card_det_n: sdc2-card-det-n-state {
+		pins = "gpio12";
+		function = "normal";
+		input-enable;
+		output-disable;
+		bias-pull-up;
+		power-source = <1>;
+	};
+
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	fan_pwm_active: fan-pwm-active-state {
+		pins = "gpio9";
+		function = "func1";
+		output-low;
+		bias-disable;
+		power-source = <0>;
+		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */
+	};
+};
+
+&pmk8550_gpios {
+	pmk8550_sleep_clk: sleep-clk-state {
+		pins = "gpio3";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmk8550_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+};
+
+&pmk8550_sdam_2 {
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+
+	/* AYANEO Controller serial interface */
+	uart11: serial@88c000 {
+		compatible = "qcom,geni-uart";
+		reg = <0 0x0088c000 0 0x4000>;
+		clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+		clock-names = "se";
+		pinctrl-0 = <&qup_uart11_default>;
+		pinctrl-names = "default";
+		interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
+		interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+				 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+				 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+		interconnect-names = "qup-core", "qup-config";
+		operating-points-v2 = <&qup_opp_table_100mhz>;
+		power-domains = <&rpmhpd RPMHPD_CX>;
+
+		status = "okay";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/ayaneo/adsp.mdt",
+			"qcom/sm8550/ayaneo/adsp_dtb.mdt";
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+	no-sdio;
+	no-mmc;
+
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	sd-uhs-ddr50;
+
+	qcom,dll-config = <0x0007442c>;
+	sdhci-caps-mask = <0x3 0x0>;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&swr0 {
+	status = "okay";
+
+	spk_amp_l: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+
+		vdd-1p8-supply = <&vreg_l10b_1p8>;
+		vdd-io-supply = <&vreg_l10b_1p8>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	spk_amp_r: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vdd-1p8-supply = <&vreg_l10b_1p8>;
+		vdd-io-supply = <&vreg_l10b_1p8>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <32 4>;
+
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio81";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio82";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	fan_pwr_active: fan-pwr-active-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	fan_int: fan-int-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	upd720201_avdd33: upd720201-avdd33-state {
+		pins = "gpio10";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	upd720201_vdd10: upd720201-vdd10-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	upd720201_vdd33: upd720201-vdd33-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gamepad_pwr_en: gamepad-pwr-en-active-state {
+		pins = "gpio52";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	qup_uart11_default: qup-uart11-default-state {
+		/* TX, RX */
+		pins = "gpio70", "gpio71";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio7";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_pwr_active: panel-pwr-active-state {
+		pins = "gpio152", "gpio153";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	sde_dsi1_active: sde-dsi1-active-state {
+		pins = "gpio137";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	sde_dsi1_suspend: sde-dsi1-suspend-state {
+		pins = "gpio137";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_rst_default: ts-rst-default-state {
+		pins = "gpio24";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <8>;
+	};
+
+	ts_rst_sleep: ts-rst-sleep-state {
+		pins = "gpio24";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <8>;
+	};
+
+	ts_int_sleep: ts-int-sleep-state {
+		pins = "gpio25";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	ts2_irq: ts2-irq-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ts2_reset: ts2-reset-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+};
+
+&pm8550_pwm {
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8550/a740_zap.mbn";
+};
+
+&gpu_opp_table {
+	opp-719000000 {
+		opp-hz = /bits/ 64 <719000000>;
+		opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+		opp-peak-kBps = <10687500>; // Level 7
+		qcom,opp-acd-level = <0x882e5ffd>;
+	};
+
+	opp-746000000 {
+		opp-hz = /bits/ 64 <746000000>;
+		opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+		opp-peak-kBps = <10687500>; // Level 7
+		qcom,opp-acd-level = <0x882e5ffd>;
+	};
+
+	opp-794000000 {
+		opp-hz = /bits/ 64 <794000000>;
+		opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+		opp-peak-kBps = <14398438>; // Level 8
+		qcom,opp-acd-level = <0xa82d5ffd>;
+	};
+
+	opp-827000000 {
+		opp-hz = /bits/ 64 <827000000>;
+		opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+		opp-peak-kBps = <16500000>; // Level 9
+		qcom,opp-acd-level = <0xa82d5ffd>;
+	};
+
+	opp-860000000 {
+		opp-hz = /bits/ 64 <860000000>;
+		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+		opp-peak-kBps = <16500000>; // Level 9
+		qcom,opp-acd-level = <0x882d5ffd>;
+	};
+
+	opp-1000000000 {
+		opp-hz = /bits/ 64 <1000000000>;
+		opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+		opp-peak-kBps = <16500000>; // Level 9
+		qcom,opp-acd-level = <0x882d5ffd>;
+	};
+};
+
+&i2c_master_hub_0 {
+	status = "okay";
+};
+
+&i2c_hub_2 {
+	status = "okay";
+
+	typec-retimer@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+		vcc-supply = <&vreg_l15b_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					data-lanes = <3 2 1 0>;
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+
+	display_panel: panel@0 {
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
+		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
+		pinctrl-names = "default", "sleep";
+	};
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	max-link-speed = <3>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1 {
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	pcie@0 {
+		/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
+		usb-controller@0 {
+			compatible = "pci1912,0014";
+			reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+			avdd33-supply = <&upd720201_avdd33_reg>;
+			vdd10-supply = <&upd720201_vdd10_reg>;
+			vdd33-supply = <&upd720201_vdd33_reg>;
+
+			pinctrl-0 = <&gamepad_pwr_en>;
+			pinctrl-names = "default";
+		};
+	};
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1e_0p88>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&pm8550b_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3f_0p88>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&iris {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	tca6408: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		vcc-supply = <&tca6424_vcc>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		reg = <0x5d>;
+		compatible = "goodix,gt911";
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+		irq-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vdd_ts>;
+
+		touchscreen-size-x = <768>;
+		touchscreen-size-y = <1024>;
+
+		pinctrl-0 = <&ts2_reset>, <&ts2_irq>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		compatible = "focaltech,ft5426";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_l14b_3p2>;
+		iovcc-supply = <&vreg_l12b_1p8>;
+
+		pinctrl-0 = <&ts_int_default &ts_rst_default>;
+		pinctrl-1 = <&ts_int_sleep &ts_rst_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+	};
+};

-- 
2.54.0



