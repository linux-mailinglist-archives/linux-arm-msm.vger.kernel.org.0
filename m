Return-Path: <linux-arm-msm+bounces-66284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F463B0F1D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C8AA7A10BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2440D2E54DE;
	Wed, 23 Jul 2025 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j8YKL1qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C22E54B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272276; cv=none; b=mYhDqYzCXi3zyM9n/zv7gwpIN5QOXbhVWNI0aez7tUWSuUTmKf2G0hDKEMmg5oqdlohIlv/ELbfQi5T9sesCLYVHzoOoLeZi4h2Y/PZN//IBWmMtCetuEoY39WeOSskBs6oDesD/EqvUfSDYjmz4xDRAZU4c4n27pPik74TOfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272276; c=relaxed/simple;
	bh=tZtnr1t9b0UyyBWJF2pBQb3rRxn1BtGGkwNYgLCrcY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uthH6pVubAkhF+xjWfka28zJw4uXZ1GXsj7+8cnCSNWQy6SskR0zynK49VD2x4s6UbcgDGd705XeEhG5FV8RDqj/eIeVNUOgqFNFsSDlVbwVCH1w/eBRzpZXCbedxbBGf0Qfzic+exXPTHtgWL+sGuftspt1mhhcW2Akk2KoivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j8YKL1qp; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6070a8f99ffso1191686a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753272272; x=1753877072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RfFmbru/LCAFgBCMPMUZ+BBCwsaXUjK95SJrm5H8vz8=;
        b=j8YKL1qpZLwQ/iFxlAwIgYUybHsGGV0BKUXbwb0EkmTSqritWfpfUYPRxKLNutuk8v
         oxVbg6ZyNt900Ofl/jPZCvJM6Iq8nwOvaSYeIP5jsUtYmdQYNEexgbcVT3Aw37nhK43H
         uIoXyWtVKKUVfzABhExF34oHtloAN3nXOfmoKn5A447VcLkormZj55YK46JXTOvdomj2
         xZqWZgnQDJT5hIC3WEQo3w8i2VH5pLQefygtSxD3XyF+f+Ke24butXF9/aQ6lzee237B
         RTy02C/bFyB7zsGviXfr0KD8UN4tiIh99QzCQcCSARa7NU4HWSnAvu9DlVZpbOde2SkV
         EMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753272272; x=1753877072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfFmbru/LCAFgBCMPMUZ+BBCwsaXUjK95SJrm5H8vz8=;
        b=Ogg/cjHQNH6P/fwUnStQpDAuqvROQxAPJd2no0VU1mQtJ7J0HglNLuHFcp8mfabXKt
         x+5szDy0uq4prZAWp3gG7ZBOZF8/Bj/LUkwSXttTsYZ0QcZks//OzOl2jfkBCgq/ovs/
         ExhM2DUiZ4Lxc5lJeBcdmVe1dtNdLwecmtIM6FV768+NXMAM49OTIF04lNcVdazmi5yS
         fu0ryNMN1Gua7P2dyQtStqvwjVr9DN8LW+sIxspCTvcxV4wzxzADNNpk45SqF9J50zHG
         hU8JHqoC70OarICQPX69bgL7QdA/6n/Xd2g3c/l7Vw/U0lpkun7JPt1jfMHOY+6Or3vp
         fFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXktZ4Bfx9mBEL0esde4zqq7omsgUhXn6aPTesyDmEB5hoajNBqyEc2qyAff6GLgfVlTTDYaYxNXd5bgag1@vger.kernel.org
X-Gm-Message-State: AOJu0YyBoQERVgqFtGeO5fDTZrT2uzNQ4JYqknmUHnLPozUzjhBxUu0Q
	XWd/N68/N08z7cb06RjyMlQZYvs/Oav32tLVPqUDTCdxtlzhDlhQc53atTr3Hy1JTsQUCkij5iY
	8zmpA
X-Gm-Gg: ASbGncv6t66BrcFzXxtFqRqJnKnHIPJVZeL58riko0T3r619KJDQtVsyyIkE7RzQAXa
	oONeycyJ2XFVyV+tckBkosnueGTS+Y1MKTSP6QI+m+kslw8vEPLV4vmFWCcnqwAELJFh28AfZOZ
	u0jORaOQ7iZCqu1wUnc85HXCHObCXQ4pL/VJP8UzC6UNzP3hnjzQ9U09H0P9IUZ/Jl56Bj1zVZr
	b4ECf3t7FANYNaVl4vt9viUYuO3r3Jk9nrRPkFdOv7HwSTyYFr3nk4k9z+gcYTza1B5822zk0zD
	fFhX7meiMDmMsZhszJuVJsrCCxhx6mc12TLBpHeDyM9Jmck32Zc0CEdooVoDfXPpbk3JYlL3CdO
	zDy6N3ybmSodhUBy2ef1ZFpKzB1j8f/sv
X-Google-Smtp-Source: AGHT+IFp/yhow1yu8WxEFj4kLLF/zSyEkqWJuG1rRXxqxsP0ns2I8R6QZIpkgSUWEiIfNYQhI6nfEQ==
X-Received: by 2002:a05:6402:5256:b0:612:ce8b:8e1d with SMTP id 4fb4d7f45d1cf-6149b5afb99mr910771a12.10.1753272271408;
        Wed, 23 Jul 2025 05:04:31 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c90bb932sm8391470a12.67.2025.07.23.05.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 05:04:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC DO NOT MERGE] arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth
Date: Wed, 23 Jul 2025 14:04:28 +0200
Message-ID: <20250723120427.52874-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5199; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tZtnr1t9b0UyyBWJF2pBQb3rRxn1BtGGkwNYgLCrcY0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogM/LXCYJpbCtSYtFUWvWkh/NaxRT6HqG6wP+s
 aY4feQMUl+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIDPywAKCRDBN2bmhouD
 1yE0D/4+Mhb6DPOTnylAUmuSnIfu3oPq9s7n6FoVE7B3Y8VFy2wwFZ5KlGwV55B5cw2GDLxigNg
 16Fimj6sYCHavBIDtesFPceXbPGwn6fLkKBZw0keoyfSPvMiIFsrskQlXN5quxL8QMSVcMP7eqq
 7cEt4zvuX/IcA3R8O/cXOVf7f1XS+ZWkVmP8LbwIuFPBAXYjZMBPQi8pgO+NlJ10K523O9uHvqd
 mOAu6OAkd4DtK1vU+5g3UuOW+6/r2U8A+yFETjOYBnPGYmaRSXGdQnW/NpT1m+uKuAK+2tOEUU3
 edoOUJz+K98QiZGmSjWe/AwG7rV01l5mKSz1SodZCfg4SouONJqpgMLeFnpMdj8AjHCJR75On7T
 Tds1InQlsWyZznZi1bgFhZuGpbogvQ4V6Vo8+p+9BEmyJcdFY4HzYl6PsLULnatRkwTt54xNTUn
 cdXxWq0ijR6pnBra9Y9puNdSkm2xkNTfC24jUzvYkC2oKCCcOXtU1bT9sYYdfVVkxYDagU+Ti/u
 cuhDMMsaa0IdHI+J8ZcVOyK+zaQlf88gRsp3pFpzQYFj7rPpLAsUoiam+5l4ijW9G18S2K4h2Xo
 /bGRV++x3MW+s94mJeZ6aHk5m0LMWvYJk7VPm07SzanFJWPQeXe5ZAOtPsOjyFyT8WFAdfvBcUm J9m8eI0Ozhls5ew==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

MTP8750 rev 2.0 (power grid v8) boards come as two different variants
with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
supported by the kernel, but WCN786x is not.  Both of the board variants
are considered newest revisions and the difference is only in MCN
numbers and internal codenames.

Add WCN7850 WiFi and Bluetooth to the MTP8750, stating that this DTS
represents the WCN7850 variant.  The S5F regulator should operate at
0.85 V, thus adjust lower constraint and its label.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Posting as RFC because it depends on unpublished PCI DTS patches thus it
cannot be merged/build.

Bluetooth not yet tested, because my user-space is incomplete.  I am
working on fixing this but anyway I don't expect issues since it is
exactly the same as previous SoCs.
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 127 +++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5a94c14425dc..e142927f7e75 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -254,6 +254,77 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	/*
+	 * MTPs rev 2.0 (power grid v8) come with two different WiFi chips:
+	 * WCN7850 and WCN786x.
+	 * They use the same enable GPIOs and share (almost) the same supplies.
+	 * The WCN7850 supplies are superset of WCN786x variant.
+	 *
+	 * Device nodes here for the PMU, WiFi and Bluetooth describe the MTP
+	 * variant with WCN7850.
+	 */
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&pm8550ve_f_gpios 3 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s5f_0p85>;
+		vddio-supply = <&vreg_l3f_1p8>;
+		vddio1p2-supply = <&vreg_l2f_1p2>;
+		vddaon-supply = <&vreg_s4d_0p85>;
+		vdddig-supply = <&vreg_s1d_0p97>;
+		vddrfa1p2-supply = <&vreg_s7i_1p2>;
+		vddrfa1p8-supply = <&vreg_s3g_1p8>;
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
 };
 
 &apps_rsc {
@@ -525,9 +596,9 @@ regulators-2 {
 
 		qcom,pmic-id = "f";
 
-		vreg_s5f_0p5: smps5 {
-			regulator-name = "vreg_s5f_0p5";
-			regulator-min-microvolt = <500000>;
+		vreg_s5f_0p85: smps5 {
+			regulator-name = "vreg_s5f_0p85";
+			regulator-min-microvolt = <852000>;
 			regulator-max-microvolt = <1000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -1051,6 +1122,23 @@ &pcie0_phy {
 	status = "okay";
 };
 
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
 &pmih0108_eusb2_repeater {
 	status = "okay";
 
@@ -1186,6 +1274,14 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 };
 
 &tlmm {
+	bt_default: bt-default-state {
+		sw-ctrl-pins {
+			pins = "gpio18";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
 	disp0_reset_n_active: disp0-reset-n-active-state {
 		pins = "gpio98";
 		function = "gpio";
@@ -1221,6 +1317,31 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
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
 };
 
 &ufs_mem_phy {
-- 
2.48.1


