Return-Path: <linux-arm-msm+bounces-58750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05305ABE0FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C7A8C2957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F2727F16F;
	Tue, 20 May 2025 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp5SHHys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37527F759;
	Tue, 20 May 2025 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759500; cv=none; b=Z9gVm6NmMtPgbsIW8U2HsGbjoXcXRH7beJGsNy5NAoiDThlPndbsQwO2EbeajZaEYPf4X1XFwdja+TmV/SURGbuRDaedTWRQwyglysRByByJVDuqvXzAPsJKMEvi5O8x/VNo1PpCKKN/ksbXPFFlxVpwmuBPgNfWii3F2DXBAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759500; c=relaxed/simple;
	bh=o2k0fFDgczhRigDo2UOH+LFGwH8MefgIVcj/lpQuiEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMRbG4u52y64THkdOxfcrx34IwVJLG4k1hhQgJBWTzThYh7ZmI5WaUNbiHLFPrRLkGLDbsb+UTOPuzQ95LeifAv8sKwcYNsxOBXwcBFWw1JxrwqSVumnbiUV0bJUbJZFMvvcCRTJeWWsCbfdDILwdkzcQNecLnQ5pUcehaDefwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp5SHHys; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2322bace4ceso24220305ad.2;
        Tue, 20 May 2025 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747759497; x=1748364297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aGsB6JHiv+wQXXBudMV1sdnNDIXAu2Qw5ZmWSRL/Uo=;
        b=Hp5SHHys48Oo0doq5/kqQE6lkKrw0Lv/r4YKMWSi6lOZleAK2PYcMGGJtFb2oo1oPH
         h1mcWIY73XcMyzarf7kK52PxcpkLtetiY8eVdYoBNCj53oepgV6byJio8SzGvcqrHX2C
         yZC8E0j54Mekm+z932v1tm4FMPlR4F1eXO5m9PVelJLsK3MmRqPFKuy/9EQ3EykljkVX
         oR5FprzSAE7OZpV711rwh5mllX6LOK8wIz4r4wUhAM5Bknk3oMZnISS/FTRS7zcet1pE
         01Cam421X4rCU5f4pApAlKhbTwENKsaTeJFNyLMWW2tXe//4zBvjYIC3ZIRcB5Xkxdlj
         /5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759497; x=1748364297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aGsB6JHiv+wQXXBudMV1sdnNDIXAu2Qw5ZmWSRL/Uo=;
        b=OqzxvIzdt7Sf0ruV4RW4OTPtUFoqpKtci7LX3Pi5V7DMcFwihS50d/DjoIIFwG5Z1w
         fFH+DDBQ3o7SklcmtyAKDTsLh1GdYR57lV0WvZqXY26jMty8SOLsB2PNzPdEZD5hajYf
         jZKJVZc0fSxbcum9j3zmlbjhud2nRfaoXyM5Cg0UeyEJk3NQn2Y1sLzShV1HgTA8YrAl
         lfVbnw0/4/hGdFSHh4XurB3jzIkWyTe2Im3r2C0LT76yh+LRWW+paphhpvk6eeZ7cqFX
         33FTjEgYe8WVBhf15J7nlDTh8aJvd4Xa6qbBe1UcyS8bG6LI80oh/DodvTn41kGby+Ac
         4hkA==
X-Forwarded-Encrypted: i=1; AJvYcCUzdQTCi/x/rkSJgWW/i/2wlUETWINgYkUjSMEVYFmsnEyArmqYA+KC3Bqng+lNSe16vNouyWRxn9TKVsL2@vger.kernel.org, AJvYcCWNoOtSBBkRNzPxgv/dtZXAtf82z5gb12hUunAlkTMcsHZ736qStUNVCADE4BO1gumnWkIgsSa0fKhX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8na6sTV9qi1wvwhimNTc9fQ6Y44Wvtfq9bUVlCqpbx592IB9
	1GEJeV36rHVVL1nmKy07CPTW4dEfdC683pRGg8nuLoxsmgEPjFlvhfQ3
X-Gm-Gg: ASbGncvynkKOthLGubFsD0jeiweKH2bavJ8HZB/fBD8q9sHdCWroX+RV+pxcba6vkRg
	YdGti3bSJSinD22tfzVf19dF/LmDIPCnZvX+UGoLvRxgJGboIk2ALC+de+PtziA/uougfhvkoPT
	xh/fvj+LWYxERhO7OkU8nkX5c+6/Ikb4UsI9yQtkxwQmLhv6SkI2IF6NdoXB47Ocfvk0tr5ziYK
	vWfJUDtyJS5Jn2CnFxJ7Ls0EFbKZOsCozhTXZb/t69vvy/miJKOMrCWNulfA6UlQx6OiXbcBXVO
	1Yv7P9SDNMqx3rZg33CapyzcmnGhoEaA9iAiSzBAypQ2vef6Fw==
X-Google-Smtp-Source: AGHT+IEv6RxCq1OqfGR3ui/opbyIfkxQm8pssBOGTElmRBfU/4rKImwJC0yIj+g+aAn7FxnjQw+klQ==
X-Received: by 2002:a17:903:324c:b0:231:e331:b7cf with SMTP id d9443c01a7336-231e331bb45mr164576095ad.27.1747759497000;
        Tue, 20 May 2025 09:44:57 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm3548205ad.254.2025.05.20.09.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:44:56 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad Pro (caihong)
Date: Wed, 21 May 2025 00:42:08 +0800
Message-ID: <20250520164208.516675-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520164208.516675-1-mitltlatltl@gmail.com>
References: <20250520164208.516675-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
platform. Its device codename is "caihong". This patch adds an initial
devicetree for basic functionality.

Currently working components include:
- Backlight
- Bluetooth
- Battery charging (up to 5v 0.5a) & reporting via pmic-glink (There
are many unknown notifications)
- Display panel ([1])
- Keyboard (via BT)
- Power key & volume keys
- Touchscreen & stylus ([2])
- USB Type-c port
- UFS storage
- Wi-Fi

The following components are currently non-functional:
- Audio
- Cameras
- Charging pump (dual sc8547)
- Keyboard (via pogo pin)
- Stylus wireless charger (cps8601)
- UCSI over GLINK (PPM init fails)

[1]: The panel is a dual-DSI, dual-DSC display that requires setting
     'slice_per_pkt = 2' in the DPU configuration. The panel driver
     will be submitted separately later.
[2]: Touchscreen/stylus driver available at:
     https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
     The downstream driver has been ported and tested locally, but
     requires cleanup, it may be submitted separately later.

To test this device tree, follow these minimal steps:

1. Build the kernel. Ensure that all `compatible` strings used in
this device tree (or any included dtsi files) have corresponding
drivers enabled in the kernel configuration.

2. Creating boot image

Merge the kernel and device tree blob:

cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm8650-oneplus-\
caihong.dtb > kernel-dtb

Then create a boot.img:

mkbootimg \
--base 0x00000000 \
--kernel_offset 0x00008000 \
--ramdisk_offset 0x01000000 \
--second_offset 0x00f00000 \
--tags_offset 0x00000100 \
--pagesize 4096 \
--header_version 4 \
--kernel kernel-dtb \
--ramdisk some_ramdisk \
--cmdline "some comeline" \
-o mainline-boot.img

3. Flashing the boot image

fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
fastboot erase dtbo
fastboot flash boot mainline-boot.img

See also https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=39c5963

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sm8650-oneplus-caihong.dts  | 960 ++++++++++++++++++
 1 file changed, 960 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts

diff --git a/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
new file mode 100644
index 0000000000..93aed47e10
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Based on Qualcomm Reference Device DeviceTree
+ *
+ * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8650.dtsi"
+#include "pm8550.dtsi"
+#include "pm8550b.dtsi"
+#define PMK8550VE_SID 8
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &adspslpi_mem;
+/delete-node/ &hwfence_shbuf;
+
+/* No Modem */
+/delete-node/ &mpss_mem;
+/delete-node/ &q6_mpss_dtb_mem;
+/delete-node/ &mpss_dsm_mem;
+/delete-node/ &mpss_dsm_mem_2;
+/delete-node/ &qlink_logging_mem;
+/delete-node/ &remoteproc_mpss;
+
+/* Unused now, and reusable, taking 144 MiB back */
+/delete-node/ &trust_ui_vm_mem;
+/delete-node/ &oem_vm_mem;
+/delete-node/ &qdss_mem;
+
+/ {
+	model = "Oneplus Pad Pro";
+	compatible = "oneplus,caihong", "qcom,sm8650";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart14;
+	};
+
+	bl_avdd_5p9: bl-avdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "bl_avdd_5p9";
+		regulator-min-microvolt = <5900000>;
+		regulator-max-microvolt = <5900000>;
+		gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	bl_avee_5p9: bl-avee-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "bl_avee_5p9";
+		regulator-min-microvolt = <5900000>;
+		regulator-max-microvolt = <5900000>;
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm8650-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
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
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		adspslpi_mem: adspslpi@9df00000 {
+			reg = <0 0x9df00000 0 0x5280000>;
+			no-map;
+		};
+
+		hwfence_shbuf: hwfence-shbuf@d4e23000 {
+			reg = <0 0xd4e23000 0 0x2dd000>;
+			no-map;
+		};
+
+		/*
+		 * This memory region is required to initialize the backlight
+		 * and display for bootloader. Normally, this region is not
+		 * needed. However, due to limitations in the current mainline
+		 * KTZ8866 driver, dual backlight ICs cannot be properly
+		 * initialized.
+		 *
+		 * A workaround involving secondary registration was proposed,
+		 * but rejected by reviewers. This reserved region is kept as
+		 * a temporary solution until a proper initialization method
+		 * that satisfies upstream requirements is found.
+		 */
+		splash_region {
+			reg = <0 0xd5100000 0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	/* No Modem */
+	smp2p-modem {
+		status = "disabled";
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
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
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s1c_1p2>;
+		vdd-l12-supply = <&vreg_s6c_1p8>;
+		vdd-l15-supply = <&vreg_s6c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		qcom,pmic-id = "b";
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
+			regulator-max-microvolt = <3008000>;
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
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
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
+		vreg_l9b_2p8: ldo9 {
+			regulator-name = "vreg_l9b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
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
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-always-on;
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
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1c_1p2>;
+		vdd-l2-supply = <&vreg_s1c_1p2>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "c";
+
+		vreg_s1c_1p2: smps1 {
+			regulator-name = "vreg_s1c_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1348000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2c_0p8: smps2 {
+			regulator-name = "vreg_s2c_0p8";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1036000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3c_0p9: smps3 {
+			regulator-name = "vreg_s3c_0p9";
+			regulator-min-microvolt = <976000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4c_1p2: smps4 {
+			regulator-name = "vreg_s4c_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1280000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5c_0p7: smps5 {
+			regulator-name = "vreg_s5c_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6c_1p8: smps6 {
+			regulator-name = "vreg_s6c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-name = "vreg_l3c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <912000>;
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
+
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "e";
+
+		vreg_l3e_0p9: ldo3 {
+			regulator-name = "vreg_l3e_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g_0p91: ldo1 {
+			regulator-name = "vreg_l1g_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2g_1p2: ldo2 {
+			regulator-name = "vreg_l2g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_0p91: ldo3 {
+			regulator-name = "vreg_l3g_0p91";
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
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l2-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "i";
+
+		vreg_s4i_0p85: smps4 {
+			regulator-name = "vreg_s4i_0p85";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_0p88: ldo1 {
+			regulator-name = "vreg_l1i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_0p88: ldo2 {
+			regulator-name = "vreg_l2i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_1p2: ldo3 {
+			regulator-name = "vreg_l3i_0p91";
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
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&i2c_master_hub_0 {
+	status = "okay";
+};
+
+&i2c_hub_0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* sc8547-charger-secondary@6F */
+};
+
+&i2c_hub_2 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* sc8547-charger-primary@6F */
+};
+
+&i2c_hub_3 {
+	status = "okay";
+
+	/* pencil-wireless-charger-cps8601@41 */
+};
+
+&i2c_hub_4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* awinic,aw88261_smartpa @34,35,37 */
+};
+
+&i2c_hub_7 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* awinic,aw88261_smartpa @34,35,37 */
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* secondary kinetic,ktz8866@11 */
+};
+
+&i2c6 {
+	status = "okay";
+
+	/* For now, this will only control half region (4/8) of panel */
+	backlight: backlight@11 {
+		compatible = "kinetic,ktz8866";
+		reg = <0x11>;
+		enable-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		vddpos-supply = <&bl_avdd_5p9>;
+		vddneg-supply = <&bl_avee_5p9>;
+		current-num-sinks = <4>;
+	};
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8650/Oneplus/caihong/gen70900_zap.mbn";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+	qcom,sync-dual-dsi;
+
+	status = "disabled";
+
+	panel: panel@0 {
+		/* Add compatible string until panel driver is upstreamed. */
+		reg = <0>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync_active>,
+			    <&mdp_vsync1_active>, <&mdp_dynamic_vsync_active>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync_suspend>,
+			    <&mdp_vsync1_suspend>, <&mdp_dynamic_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_0>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "disabled";
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel_in_1>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1i_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
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
+	linux,code = <KEY_VOLUMEUP>;
+
+	status = "okay";
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
+	firmware-name = "qcom/sm8650/Oneplus/caihong/adsp.mbn",
+			"qcom/sm8650/Oneplus/caihong/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8650/Oneplus/caihong/cdsp.mbn",
+			"qcom/sm8650/Oneplus/caihong/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>, <74 1>;
+
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio17";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio18";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_dynamic_vsync_active: mdp-dynamic-vsync-active-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_dynamic_vsync_suspend: mdp-dynamic-vsync-suspend-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync1_active: mdp-vsync1-active-state {
+		pins = "gpio87";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync1_suspend: mdp-vsync1-suspend-state {
+		pins = "gpio87";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
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
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1c_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1i_0p88>;
+	vdda12-supply = <&vreg_l3i_1p2>;
+
+	phys = <&pm8550b_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3i_1p2>;
+	vdda-pll-supply = <&vreg_l3g_0p91>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};
-- 
2.49.0


