Return-Path: <linux-arm-msm+bounces-61404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C5ADAB62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5650A188313C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5350519AD5C;
	Mon, 16 Jun 2025 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU+fqX6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B9417CA17
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064585; cv=none; b=jrRZeuFHomwnYJhN3usassdBSAXeY0brG9C3uhmrYnLRxNT9O+XsJ9BauAQIRee9BqJW+FmbokADGLsbKztyKEZDuB0z0N5Z5U8fK/3w6tMGWnIZFwQfMjwarJA37rsi14tMGSkGr9QxONDxtdTqkPcijN5zwp/FzR/dbmPLyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064585; c=relaxed/simple;
	bh=lQZieeI/b4hHrSNusaYpEPQK0VQZ244pdNs8eMZH3j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vp10gF5kJqLDhxRBujkhAhFESWFQ39IEfemQLNDzHhdMD0vId6QnZUErEBiG8btm8r6NLikkTiidgnrriu7CU7/cm1EI3GJBXFZmn5XuGChsT3zE+XfJuMyH+tH6PP+LRZ4s+42XiVKEWzHbt1c11wyVv1X1Zpgm4E6YE2DXCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU+fqX6e; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2fca9d7872so2588136a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750064583; x=1750669383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AqD9a1IGwNzMFwpa2qMgCpVzc1A03fBlXZdt9CZKpU=;
        b=SU+fqX6eTcS4yu0GtqtW4pnpyMVwoM0znrc24Rt6tOft9cS5TlUjUSwWWfdHI1PQfA
         IoUv4lwLkRVjSyzBja2+7yvLTDkOJhVoCvI0SDsh3yNXHyA5zEkInMIXwBBr7Dkz5IHv
         bl5JEMYTpGU7dUlYC/3PuzKw9AaNRxB1uqcNZvHMfJdGo+Lrj18PPxJSMYlX5UDL6YJ+
         JTp+ciCcjUCwyLnL24GPIsXILznRWZ6zBJgIO2302F3Emh08G5DYiqBssXoUJeezb9w9
         VUvchYTK8FUR6KgTIKj/K9T8Wxfnq4mAb/7QC+6X9r2jdXrYkuDIFOBvmnu8bzlCrZ9B
         thig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750064583; x=1750669383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AqD9a1IGwNzMFwpa2qMgCpVzc1A03fBlXZdt9CZKpU=;
        b=Av3qDd0Ljn+mFCa72Db6mxCszD4H0o7S/saMEx6E70ba5REAam90lnVYaxZfH/LCkA
         cW7KMfwDae/DnjFwTnO3lzQi652k3zHQecWGlqE+Ke+e2K9vloyodwpMl8QfFamPSEWi
         qrZShiOhDVxdC8qJ6C4ylE+88LZVr8qWpeD/ai1bblNMWP3JKRm+UVvHaRy9Dos97K8L
         GLiwrAUJECNIrALsCwvyqh+/3stCHK2zmVEWrca78qhffoiDnKJwlIh6Khd967DIBi0l
         so8f3uZV97UGYfWZu1QieC1B7HbwF4PVVKZPdhuZ/9W5Rhmxze0Z5pOLhCQveSByt3qW
         gmVw==
X-Gm-Message-State: AOJu0YxMC4beRQgGeSs/4JRkoS62Z7hI6BcT1ueaowHNC4tw53TcaJUu
	UFM/nBSre5+fnRa/sKtbVBALV1zLl5xzB98GAj34Q8iwxCazzmohzvi9bl5Y6UI2
X-Gm-Gg: ASbGncu5g1txBqg06ttp1GZAkEY9ZF7fKz8tIfig0tYF/8uo/0FE7pQaKid8+Vn3v1K
	yukpDVUgIzR9FBqfPbxM2JlpSxbiJMhqxpWBHfgPYwYVsTtE5H4Tn7yjS9PfloQLmhXIvA5sKUh
	PaiCnDIWqroL63uftB3VlvE6FcySt/pZ1cRiYMh4E4V0po2/dWYbjiHgfSHoR7TY5LAb9rKfL0I
	we38BzHlfoU2yxEux4z66SqNO7uMixu8AOf73NVoPvMkaahZiKVkQcA4TFJWtjotZXT9LGn1hqN
	sDiESOE1CKPJqjbLcdEjC2q0c6Gff9XaGyTRNFTvXzrw+VTTDQA4aQ0sjYJbHcBznuGgUDkq7Xg
	D
X-Google-Smtp-Source: AGHT+IGT1kFz6tL7hlIvF3lSKpsACsJsacb81MWmY1Kfud5d2C4r/4p5BCbafaSrup3Wqh2w+RAB1w==
X-Received: by 2002:a17:90a:e7c6:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-313f1d5872amr15801148a91.18.1750064582492;
        Mon, 16 Jun 2025 02:03:02 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e4cbsm8032258a91.27.2025.06.16.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:03:02 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: konradybcio@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v5 2/2] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Mon, 16 Jun 2025 09:02:50 +0000
Message-ID: <20250616090250.36605-3-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616090250.36605-1-ghatto404@gmail.com>
References: <20250616090250.36605-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds new device support for the Samsung Galaxy S22 (SM-S901E) phone

Working features:
- simple-framebuffer
- side buttons
- storage
- usb

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 363 ++++++++++++++++++
 2 files changed, 364 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b27a1..fa38d71d190d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx214.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx215.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
new file mode 100644
index 000000000000..6daf906cde08
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Eric Gonçalves <ghatto404@gmail.com>
+ * Copyright (c) 2025, Arthur Aligon <arthurus36.alt2@tutanota.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sm8450.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pm8350c.dtsi"
+#include "pm8450.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
+
+/delete-node/ &xbl_ramdump_mem;
+/delete-node/ &xbl_sc_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &mte_mem;
+/delete-node/ &trusted_apps_mem;
+/delete-node/ &trusted_apps_ext_mem;
+
+/ {
+	chassis-type = "handset";
+	model = "Samsung Galaxy S22 (SM-S901E)";
+	compatible = "samsung,r0q", "qcom,sm8450";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootargs = "clk_ignore_unused pd_ignore_unused";
+		stdout-path = "serial0:115200n8";
+
+		framebuffer: framebuffer@b8000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xb8000000 0x0 0x2b00000>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
+	memory {
+		ddr_device_type = <0x08>;
+		device_type = "memory";
+		reg = <0x00 0x80000000 0x00 0x6a000000 0x00 0xf1c00000 0x00 0xe400000 0x08 0x00 0x00 0x3ab00000 0x08 0x40000000 0x01 0x40000000 0x08 0x3b100000 0x00 0x1e00000>;
+	};
+
+	reserved-memory {
+		xbl_ramdump_mem: memory@a6b80000 {
+			reg = <0x0 0xa7d00000 0x0 0x300000>;
+			no-map;
+		};
+
+		xbl_sc_mem: memory@a6e00000 {
+			reg = <0x0 0xa6e00000 0x0 0x40000>;
+			no-map;
+		};
+
+		adsp_mem: memory@9fd00000 {
+			reg = <0x0 0x84500000 0x0 0x3b00000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@fe200000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xfe200000 0x0 0x280000>;
+			reg-names = "rmtfs";
+			qcom,client-id = <1>;
+			no-map;
+
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+
+		splash_region@b8000000 {
+			reg = <0x0 0xb8000000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>, <50 1>, <93 1>;
+
+	dsi_default: dsi-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dsi_suspend: dsi-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8350-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+
+		vdd-l1-l4-supply = <&vreg_s11b_0p95>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-l5-supply = <&vreg_bob>;
+		vdd-l6-l9-l10-supply = <&vreg_s12b_1p25>;
+		vdd-l8-supply = <&vreg_s2h_0p95>;
+
+		vreg_s11b_0p95: smps11 {
+			regulator-name = "vreg_s11b_0p95";
+			regulator-min-microvolt = <848000>;
+			regulator-max-microvolt = <1104000>;
+		};
+
+		vreg_s12b_1p25: smps12 {
+			regulator-name = "vreg_s12b_1p25";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1400000>;
+		};
+
+		vreg_l1b_0p91: ldo1 {
+			regulator-name = "vreg_l1b_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p07: ldo2 {
+			regulator-name = "vreg_l2b_3p07";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_0p88: ldo5 {
+			regulator-name = "vreg_l5b_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <888000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p5: ldo7 {
+			regulator-name = "vreg_l7b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
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
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+
+		vdd-l1-l12-supply = <&vreg_bob>;
+		vdd-l2-l8-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_s1c_1p86: smps1 {
+			regulator-name = "vreg_s1c_1p86";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2024000>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8450-rpmh-regulators";
+		qcom,pmic-id = "h";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-l2-supply = <&vreg_bob>;
+		vdd-l3-supply = <&vreg_bob>;
+		vdd-l4-supply = <&vreg_bob>;
+
+		vreg_s2h_0p95: smps2 {
+			regulator-name = "vreg_s2h_0p95";
+			regulator-min-microvolt = <848000>;
+			regulator-max-microvolt = <1104000>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735a-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+
+		vdd-l1-l2-supply = <&vreg_s2e_0p85>;
+		vdd-l3-supply = <&vreg_s1e_1p25>;
+		vdd-l4-supply = <&vreg_s1c_1p86>;
+		vdd-l5-l6-supply = <&vreg_s1c_1p86>;
+		vdd-l7-bob-supply = <&vreg_bob>;
+
+		vreg_s1e_1p25: smps1 {
+			regulator-name = "vreg_s1e_1p25";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1296000>;
+		};
+
+		vreg_s2e_0p85: smps2 {
+			regulator-name = "vreg_s2e_0p85";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1040000>;
+		};
+	};
+};
+
+&pm8350_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&usb_1 {
+	qcom,select-utmi-as-pipe-clk;
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p07>;
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p5>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <1200000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l9b_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
-- 
2.49.0


