Return-Path: <linux-arm-msm+bounces-61338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479BADA3FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 22:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF003A618C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A6B280A50;
	Sun, 15 Jun 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW9ZcXpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDE1917F4;
	Sun, 15 Jun 2025 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750020983; cv=none; b=IphOgMnndYEf6QC2mbLCTC1euXJBb+ert0EhXdcj/389wjLh43Z8NM8NF8pi45xWunZ5+LDHa7wDMTMPfVwu9T/bhZKgiSWx4Oeqe9kdsKcIRc3NXr9fFB5kR3J3OfyLIWvDnwzqw17ZaNnSk2wdjp/hjjI1tEU4FvXwg3Xbrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750020983; c=relaxed/simple;
	bh=+vHSR6ggASNRDP5T6G/EiHtVXOS1I+525/90M9eCQm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GoxAeInuRdHZ+ccdt1oaQdvhGav6/YuqBi2URu1yaHTQPRO/H3mQ9g5NosvO0zPILDFdcleR4hvebSOTdosi3nQFyfIzimVKOJOfWjhKK2WrDCEeXqtnwSogtx+oI2NDcrDhszriw0XtWsn4ZNQFFZ2Js2v/sRFOa4DgEIgOFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW9ZcXpi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2c49373c15so2840293a12.3;
        Sun, 15 Jun 2025 13:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750020981; x=1750625781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz1t/cYiDqiMTeRU4h7xbruWl3TVP1pN8rkXsWF7ao=;
        b=cW9ZcXpijzXomAy0nAjC6uFoZNc+JsHyNfSUPd3yZn06BuaOPxGGqt9Q0rEsCSNh2g
         RajZ/Ao2QF8VUYgAogbrEU2i3RRMWk3snKuCWlE5S9HUxPJAccWDKgzyHWB6r1ZTxmcb
         Zx33VyrJzh9SZOmxjZUf/GDAabTb+uNO9Uuk9YyF2yGMVubhbS/fwjfEHhjWtsDEOYkP
         uw/atGQ4RnbblWE3IjhFbbNy+xU15+IBELHqJAv4nC+Qnctot5s1lC8ICcMfiZKqgsw6
         vjRrebj4VJeTySgz/i0X++JZTE82Ul1tcDWp/COLa1gFqGCfHGQWWcr+aQyX4SfyyqhC
         Cpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750020981; x=1750625781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIz1t/cYiDqiMTeRU4h7xbruWl3TVP1pN8rkXsWF7ao=;
        b=RHmCRuRaBxzYQvNIXovqkr5EljK00FhNePJAOJEG5wXQ6DUxd1pFE2JrdOhm+qgNH9
         2c0Hxd7lfOf2ghv/+IxwNzhnAHToBJevBUYwCv+kp2Jug4It1pt5LpCmRyk2A9NS/945
         UvGcWFL0vwjOilyoYVb2LLY9r3HsjOllB82tqTWjysPGvuribVWch60GbqkupswjkBHx
         UHtZvEMhZYiqAZuMlbOymzMq3wmj6LKlcWctvullki8HqNct7T9EtqV77aAzgKJ3ozMI
         1NDyu84F3WnAy+udL1N61sOGAoRdLA0DErsHTKeWhaPvB8C1Xn/7cDn5OAG3TIVa4F1u
         yXvA==
X-Gm-Message-State: AOJu0Yy5F50qS8d8qeOFrn00BOYSydzE+FL4++iSjOG/3ZkXpVSTcyLH
	7y6GHmVQtf7NjpYeqSn+xpA9pAtz0jAbjPx97PgejdldeCUIuHyhOwTTDlkoJe1F
X-Gm-Gg: ASbGncsVfewsb7YDZjD367yTfP8qcda+/svu+kcWiFFfFuFWIli25hLAPuTmlGyEm1y
	7/RFmzNJUUWJUPC66vXSbKroLQEQjSCdW+DJ01kVe+ca5F1Dj3dJfQ/Fiho9b0fbHTLR14vQnK9
	muU68ImPrvf3HIF2Zkl29saqFUk+az3+3oCx3TMsFx0prZKiyE1yhS3A22/5u4UXArFW5APrTde
	Lc6qfl10CEnONjKnHG8hOHJ31shew+uiLHiMGV4/nNTJw5tKbtI37nBZGh6FJNqLKjAtR1iXkiF
	j6MfFVlDfQQ/ud+Cer7rILeU5aeJr25jXi7Q/dhOTQ5d/AFS0RBJ2iRzlV2mbeG5FaGkW3kZSBE
	q32dgeoXvltw=
X-Google-Smtp-Source: AGHT+IHelwKYCqCmVX53IK8/3JTIq6sHXHVOw/HEFy0W3C1BbZ02ZsxzTbNUyqgNPbkY5CIJou34Zg==
X-Received: by 2002:a05:6a21:9218:b0:1f5:9016:3594 with SMTP id adf61e73a8af0-21fbd524ed0mr10010259637.18.1750020981052;
        Sun, 15 Jun 2025 13:56:21 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168c771sm5455007a12.63.2025.06.15.13.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 13:56:20 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v2] arm64: dts: qcom: add initial tree for Samsung Galaxy S22
Date: Sun, 15 Jun 2025 20:56:08 +0000
Message-ID: <20250615205608.1133129-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250615205608.1133129-1-ghatto404@gmail.com>
References: <20250615205608.1133129-1-ghatto404@gmail.com>
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
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 365 ++++++++++++++++++
 2 files changed, 366 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b27a1..cde80a17f2ab 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -287,6 +287,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
new file mode 100644
index 000000000000..cb58626e879e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -0,0 +1,365 @@
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
+		linux,initrd-start = <0x00 0xb6915000>;
+		linux,initrd-end = <0x00 0xb7fff22c>;
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


