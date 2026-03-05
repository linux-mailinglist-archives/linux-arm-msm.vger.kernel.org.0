Return-Path: <linux-arm-msm+bounces-95565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APNRCyxRqWkj4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:47:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDDB20EDED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86B0C3130579
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFE937B417;
	Thu,  5 Mar 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfwcDue5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB937AA78
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703593; cv=none; b=TI7mXW6SDnQ5KlmmcaoE1NjyvZMD+i5cn7TaiNRfr88QfoYnexaEDRLPVgqPWZHCRiXnvpX06JuPrFgb4BpieJl3jAPYreTu+uUzaM/T7W5I/XzlwJqCW7CAcC3qGgscx6pkW0ju0HBjlgg/MQlcCnlYXMUdGDiCircdO5yoqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703593; c=relaxed/simple;
	bh=N59RULWQV1Ai4aqoAMBrHKinkOjQQ+wpN78gQhelfwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXliyS0BPtX8d87y3DyjsGkFNjJzjIloHMmL0nab872coTO2JUEkLGjPcgmsn1j63h/esznv2O0A4CXo+/OusVSGXKeEy+D9dk9b8sLQNB/RZ+7OOh5DNpe2TVZkysB/q+17P4CCcBG1O3XtgUi/uKRn++WTZrBEVt0z6ez6mdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfwcDue5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65faaa8b807so4957730a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772703589; x=1773308389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjiFkOeUH56mAxOAQ531590IJacgn1yepuU/HBvhV5g=;
        b=KfwcDue5hIlFaO3SheBjLkJ1ApZ2wuTburA1zLuccF56Tk4TojjU29eAsMR7MxLe3Y
         w2/gCAcnFU/02svxxCTPvTQl8VtTLFf515EJRk13m5XDcw89I0tJ72Gg0RksCcQUcczc
         Ny6vuf97H3CCmCed1ADKVsqn1S+JkvD7ubHO7mLbOV2SIo2A/6zzw5Ynosqj1Bx3VZEq
         866vt6rckHFpsmEzplN+f4pWgma+C+P/wrjqrD40tOGSNGRrAPwmgmkiS6EqMB0Btzb9
         6eoCsbU8poA7jvj4SLcpHC4jrnPOOSovZS/l9FfelyF8B3KqX+GMSekgvnpBKXxNnfIA
         C8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703589; x=1773308389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjiFkOeUH56mAxOAQ531590IJacgn1yepuU/HBvhV5g=;
        b=s87mjbI0XRBL/sVCXSG4bWVG2xxIRq+vbCZkokqAamXnp3j1UDy83hsYtpO0yQFcYk
         FgkxUwVd0BYURnktWyDMh6HeQImTyA4L2BuHrqJ9AlulULTne1eRi0hMy/n5IuHnlIFG
         rG1mKutquCSxKUfwm/YJDP6LuuIfkiWxR5qmTzeVj54+RIC/R3UJ4PxxAwlB8dCtCF2s
         qvRLorFg3vuB9SvemK4la+JZE5zCmmMWPTYn0Y2wDcrCgEXNNKzWlfXjm95j+kp/ZrwI
         BdkOIGoQEJPuyRnVeEXaZegb9Lb/+YWtmR5WSvt4t998aQeOf+0M6PzmGND/86uF5Xb1
         Xzag==
X-Gm-Message-State: AOJu0YzI10NIvtktN3brcT7cOlwpzE8RYeeeg0SMJMfA4+ARq1FpYoNH
	/xtghzgJOoEhYNbdSvEIIrw9CSXqyTVPZweJzRrtQND+JsmZ+d9bDiX/
X-Gm-Gg: ATEYQzziWMstRIqhdfvvqZp4/5SeZou+YrKNxSGb45mYGW6ZJC5nzYKq9+q6rPB2bO6
	kuqaBoT7vpPWq5p0GZka65X6kQULGCQcANegaGxVVQMSRPtUSBxNorHXpjq8dLOEjVmYZNRjB8G
	O7o7BB+itFsV7DNPxmP+vKTNHk/FPS0T1BDV8wxQpcTlPnIb4uhePDz5C5NP/1TX5vruZyOJJuU
	rsATsgHbIhiYpdg8DHcHH/8efmPu0USlMgcVVRcpLgrDI7mRN3NjOqQWIYKkZ+2EQ23cdnIUb5x
	RVPgKbnxGkn7QJf6wu4Dv+2Nx91o9OXjHHIPuwlmRGWfHFCTMVQXWJwpmXLm7B0Dk+0ysqJxebu
	HWkeHYLe6a3RB0Gn5y3iDEVUXndHwjjh7gPUVZyFeEgZ1zpOPYLeWb3fsGsiTyKHyb5WblBU8a+
	pk5J6YNj9whp/4iXlxfVkGgf8TqYk=
X-Received: by 2002:a05:6402:510f:b0:660:a4ad:16a2 with SMTP id 4fb4d7f45d1cf-660efcc74b9mr2516968a12.22.1772703588996;
        Thu, 05 Mar 2026 01:39:48 -0800 (PST)
Received: from workstation.home ([178.227.95.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2616634a12.17.2026.03.05.01.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:39:48 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
Date: Thu,  5 Mar 2026 10:39:41 +0100
Message-ID: <20260305093941.305122-3-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305093941.305122-1-zstaseg@gmail.com>
References: <20260305093941.305122-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9FDDB20EDED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95565-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Xiaomi 12 Lite 5G is a handset released in 2022

This commit has the following features working:
- Display (with simple fb)
- Touchscreen
- UFS
- Power and volume buttons
- Pinctrl
- RPM Regulators
- Remoteprocs - wifi, bluetooth
- USB (Device Mode)

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
 2 files changed, 908 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..61618da3f68c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -280,6 +280,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-nothing-spacewar.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-xiaomi-taoyao.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
new file mode 100644
index 000000000000..ee3512649e3f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -0,0 +1,907 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2025, Stanislav Zaikin <zstaseg@gmail.com>
+ */
+
+/dts-v1/;
+
+/* PM7250B is configured to use SID8/9 */
+#define PM7250B_SID 8
+#define PM7250B_SID1 9
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+
+#include "sm7325.dtsi"
+#include "pm7325.dtsi"
+#include "pm7250b.dtsi" /* PM7250B */
+#include "pm8350c.dtsi" /* PM7350C */
+#include "pmk8350.dtsi" /* PMK7325 */
+
+/* The following reserved memory regions have different addresses or sizes */
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &rmtfs_mem;
+
+/ {
+	model = "Xiaomi 12 Lite 5G";
+	compatible = "xiaomi,taoyao", "qcom,sm7325";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart7;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm7325-pmic-glink",
+			     "qcom,qcm6490-pmic-glink",
+			     "qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		orientation-gpios = <&tlmm 140 GPIO_ACTIVE_HIGH>;
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
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&fsa4480_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_oled_dvdd: regulator-oled-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "oled_dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&tlmm 46 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_s1b_1p856>;
+		regulator-boot-on;
+	};
+
+	/* S2B is really ebi.lvl but it's there for supply map completeness sake. */
+	vreg_s2b_0p7: regulator-smpb2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s2b_0p7";
+
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <700000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	reserved-memory {
+		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
+			reg = <0x0 0x81800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@86200000 {
+			reg = <0x0 0x86200000 0x0 0x500000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@86700000 {
+			reg = <0x0 0x86700000 0x0 0x4000000>;
+			no-map;
+		};
+
+		camera_mem: camera@8ad00000 {
+			reg = <0x0 0x8ad00000 0x0 0x500000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@8b710000 {
+			reg = <0x0 0x8b710000 0x0 0xa000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@9c700000 {
+			reg = <0x0 0x9c700000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		ramoops@a9000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xa9000000 0x0 0x200000>;
+			pmsg-size = <0x200000>;
+			mem-type = <2>;
+		};
+
+		removed_mem: removed@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x6800000>;
+			no-map;
+		};
+
+		pil_trustedvm_mem: pil-trustedvm-region@d0800000 {
+			reg = <0x0 0xd0800000 0x0 0x76f7000>;
+			no-map;
+		};
+
+		qrtr_shmem: qrtr-shmem@d7ef7000 {
+			reg = <0x0 0xd7ef7000 0x0 0x9000>;
+			no-map;
+		};
+
+		neuron_block_0_mem: neuron-block@d7f00000 {
+			reg = <0x0 0xd7f00000 0x0 0x80000>;
+			no-map;
+		};
+
+		neuron_block_1_mem: neuron-block@d7f80000 {
+			reg = <0x0 0xd7f80000 0x0 0x80000>;
+			no-map;
+		};
+
+		framebuffer_reserved: framebuffer@e1000000 {
+			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs@ef500000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xe7d00000 0x0 0x280000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>,
+				    <QCOM_SCM_VMID_NAV>;
+		};
+	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6750-pmu";
+		pinctrl-0 = <&hst_bt_en>,
+			    <&hst_sw_ctrl>;
+		pinctrl-names = "default";
+		vddio-supply = <&vreg_l19b_1p8>;
+		vddaon-supply = <&vreg_s7b_0p952>;
+		vddasd-supply = <&vreg_l11c_2p8>;
+		vddpmu-supply = <&vreg_s7b_0p952>;
+		vddrfa0p8-supply = <&vreg_s7b_0p952>;
+		vddrfa1p2-supply = <&vreg_s8b_1p256>;
+		vddrfa1p7-supply = <&vreg_s1b_1p856>;
+		vddrfa2p2-supply = <&vreg_s1c_2p2>;
+
+		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
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
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+
+		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p952>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-supply = <&vreg_s2b_0p7>;
+		vdd-l5-supply = <&vreg_s2b_0p7>;
+		vdd-l6-l9-l10-supply = <&vreg_s8b_1p256>;
+		vdd-l8-supply = <&vreg_s7b_0p952>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p856>;
+		vdd-l13-supply = <&vreg_s7b_0p952>;
+		vdd-l14-l16-supply = <&vreg_s8b_1p256>;
+
+		/*
+		 * S2, L4-L5 are ARCs:
+		 * S2 - ebi.lvl,
+		 * L4 - lmx.lvl,
+		 * L5 - lcx.lvl.
+		 *
+		 * L10 are unused.
+		 */
+
+		vreg_s1b_1p856: smps1 {
+			regulator-name = "vreg_s1b_1p856";
+			regulator-min-microvolt = <1840000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7b_0p952: smps7 {
+			regulator-name = "vreg_s7b_0p952";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s8b_1p256: smps8 {
+			regulator-name = "vreg_s8b_1p256";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
+		};
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p072: ldo2 {
+			regulator-name = "vreg_l2b_3p072";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b_0p6: ldo3 {
+			regulator-name = "vreg_l3b_0p6";
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <910000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b_1p2";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p96: ldo7 {
+			regulator-name = "vreg_l7b_2p96";
+			/* Constrained for UFS VCC, at least until UFS driver scales voltage */
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_0p904: ldo8 {
+			regulator-name = "vreg_l8b_0p904";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_1p776: ldo11 {
+			regulator-name = "vreg_l11b_1p776";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_0p8: ldo12 {
+			regulator-name = "vreg_l12b_0p8";
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_0p8: ldo13 {
+			regulator-name = "vreg_l13b_0p8";
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_1p2: ldo14 {
+			regulator-name = "vreg_l14b_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_0p88: ldo15 {
+			regulator-name = "vreg_l15b_0p88";
+			regulator-min-microvolt = <765000>;
+			regulator-max-microvolt = <1020000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_1p2: ldo16 {
+			regulator-name = "vreg_l16b_1p2";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_1p8: ldo17 {
+			regulator-name = "vreg_l17b_1p8";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p8: ldo18 {
+			regulator-name = "vreg_l18b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b_1p8: ldo19 {
+			regulator-name = "vreg_l19b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+
+		vdd-l1-l12-supply = <&vreg_s1b_1p856>;
+		vdd-l2-l8-supply = <&vreg_s1b_1p856>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+		vdd-l10-supply = <&vreg_s7b_0p952>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		/*
+		 * S2, S5, S7, S10 are ARCs:
+		 * S2 - cx.lvl,
+		 * S5 - mss.lvl,
+		 * S7 - gfx.lvl,
+		 * S10 - mx.lvl.
+		 */
+
+		vreg_s1c_2p2: smps1 {
+			regulator-name = "vreg_s1c_2p2";
+			regulator-min-microvolt = <2190000>;
+			regulator-max-microvolt = <2210000>;
+		};
+
+		vreg_s9c_0p676: smps9 {
+			regulator-name = "vreg_s9c_0p676";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p8: ldo2 {
+			regulator-name = "vreg_l2c_1p8";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_3p0: ldo3 {
+			regulator-name = "vreg_l3c_3p0";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3540000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_1p8_3p0: ldo4 {
+			regulator-name = "vreg_l4c_1p8_3p0";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8_3p0: ldo5 {
+			regulator-name = "vreg_l5c_1p8_3p0";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p96: ldo6 {
+			regulator-name = "vreg_l6c_2p96";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-name = "vreg_l7c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_0p88: ldo10 {
+			regulator-name = "vreg_l10c_0p88";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_2p8: ldo11 {
+			regulator-name = "vreg_l11c_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c_1p8: ldo12 {
+			regulator-name = "vreg_l12c_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13c_3p0: ldo13 {
+			regulator-name = "vreg_l13c_3p0";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&dispcc {
+	status = "disabled";
+};
+
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/a660_zap.mbn";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+			};
+		};
+	};
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
+&pm7325_gpios {
+	key_vol_up: key-vol-up-n-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
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
+&qup_spi13_cs {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&qup_spi13_data_clk {
+	drive-strength = <6>;
+	bias-disable;
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
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/modem.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_wpss {
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/wpss.mbn";
+
+	status = "okay";
+};
+
+&spi13 {
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "goodix,gt9916";
+		reg = <0>;
+
+		interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l7c_3p0>;
+		vddio-supply = <&vreg_l2c_1p8>;
+
+		spi-max-frequency = <5000000>;
+
+		touchscreen-size-x = <10800>;
+		touchscreen-size-y = <24000>;
+
+		pinctrl-0 = <&ts_irq>, <&ts_reset>;
+		pinctrl-names = "default";
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <48 4>, <56 4>;
+
+	bt_uart_sleep_cts: bt-uart-sleep-cts-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-bus-hold;
+	};
+
+	bt_uart_sleep_rts: bt-uart-sleep-rts-state {
+		pins = "gpio29";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	bt_uart_sleep_txd: bt-uart-sleep-txd-state {
+		pins = "gpio30";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	bt_uart_sleep_rxd: bt-uart-sleep-rxd-state {
+		pins = "gpio31";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_sleep: sde-dsi-sleep-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_active_sleep: sde-te-active-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_irq: ts-irq-state {
+		pins = "gpio81";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	hst_bt_en: hst-bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	hst_sw_ctrl: hst-sw-ctrl-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	ts_reset: ts-reset-state {
+		pins = "gpio105";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart7 {
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 = <&bt_uart_sleep_cts>,
+		    <&bt_uart_sleep_rts>,
+		    <&bt_uart_sleep_txd>,
+		    <&bt_uart_sleep_rxd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6750-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		max-speed = <3200000>;
+	};
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	/*
+	 * Technically l9b enables an eLDO (supplied by s1b) which then powers
+	 * VCCQ2 of the UFS.
+	 */
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	/* USB 2.0 only */
+	qcom,select-utmi-as-pipe-clk;
+
+	dr_mode = "otg";
+	usb-role-switch;
+	maximum-speed = "high-speed";
+	/* Remove USB3 phy */
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sm7325/xiaomi/taoyao/vpu20_1v.mbn";
+
+	status = "okay";
+};
+
+&wifi {
+	qcom,calibration-variant = "Xiaomi_taoyao";
+
+	status = "okay";
+};
-- 
2.51.0


