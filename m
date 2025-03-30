Return-Path: <linux-arm-msm+bounces-52849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D183DA75CB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 23:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75001165ECB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 21:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCFB1DE4FB;
	Sun, 30 Mar 2025 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcnEgJ7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5B6EEAA;
	Sun, 30 Mar 2025 21:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743370071; cv=none; b=fzMF/9CtxGM5jFq5EprVHVU70SvEYkSWSqQbVhWzfqo9/L8PCS/KTVAbxqfvipCiVAgQ7aWDNPvgyGK0k4dCct7k4pUkorFJaDf8iuJfSu9JcP48ObTyMZXC7IsJfSpfavMJdzOzUlPxuFF+crYyzie6/HeHZHFBdygcq55C+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743370071; c=relaxed/simple;
	bh=f2PhZ2GeORRp6bjgix29AdUngDpX0vHy+C0DFMIgSXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTb0up9srDakk4kGDHO7dtrbdS2n7x93xuKAONCjrj2lsZfqQ9+ZTqbqYBJoHOf65XqiuWI2U5e+l7VQdOWS77uUhLc71XVNyScdq+LkuA6A2HFtDtGdh4k5wP0na2yCUSIMArLwW0LCm2FnkynqEJaZBlhf7hxcCEPkzmyNwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcnEgJ7f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso28964265e9.3;
        Sun, 30 Mar 2025 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743370068; x=1743974868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awhbM3XSyFdvgZOdhTf7eCruVYFZpH1/h00pW9KhlKs=;
        b=lcnEgJ7fHw9T3AaJAcXRnFiE+MfhoTtvu78ejM5tueUDKTAyCjioKoV1OFO3BMxWzh
         vySnIKYR+vaJGbZmnljprNrAtc1yfOEAcOntJlzrQa1c5NTSFDjsKehOr/rAhMm5I6dZ
         Hz0ZM5peFHItg7tOmMdVupia6+0kJtpsv/nVrZ7FoCNO1u67o95s97C1SYTMO244o392
         xbqQ/cGFGnnfsK+XzNWMk7EZQlFIkZyqgpAxA8zb5351DBSAct/1S0lzr5M4o/n8QMeR
         MBfKevDoL2PyE4o/DI9EOBqfh8rjj49z96vkjsWd2dDoGmStYtVpkuTWB6pQiEZTOpUr
         bdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743370068; x=1743974868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awhbM3XSyFdvgZOdhTf7eCruVYFZpH1/h00pW9KhlKs=;
        b=pL0ORtaxfKjImZHOURheay79rQT/et8/rWmESU/98ZYzx3+H2EogTerYYUffyPe/26
         rtPaI4xoUM7wFVxLpaxIth28MyQugwJcbCm7Kn8g3VzJ947YdELOf8R2VVWkdtS5BKE8
         cZcqwS8EaRGjzsNlPr+b0/ARI1NCC/VTf0kNkLBmZUpr3N39/7iR1uHgbHsMQ2vwIIL5
         qlHL/X42r6+WMPg9QkqbX5/Oy5bBpu8R3gAXmsX5V5Ly+fBThUOQbTYyoRPQgUD/XLDP
         F0c01BrHON/3iqsIaHUvSaieQ/r2CLClD4WWtMFahu7Y2RgJ2jqMDx5Ti3AEe2MPSc6A
         04zA==
X-Forwarded-Encrypted: i=1; AJvYcCUBvYLH+G8xQCKdX5fCsXnwLuLYDTzK/u3YZFvAa0qINjsKFy1exfts91XvWaCgpjTyYhEMkF6jsAeK@vger.kernel.org, AJvYcCUP+DN4NdPv4zMunav7GisKpmRUFzSH941WsveiQaac1fiP26SDYgJoVuxj6m+3S8kz0nC92OE0dApDrSKkgw==@vger.kernel.org, AJvYcCW2MyY43qfAm/rXy1h1GHETj68MPvu76dV1XrB4f43C4CCBo7D3iAsHIOMwDPksfaCALbn1SLEah9ATWJxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAv6/tUh7PsSx68QHMT+zPhpFQteTGvhBlyPfm0nSItkovtYeZ
	gACl2dWg6M0yBkGg4b52tDYXFWh9BLUZBht4Fmzm/gnd7itcKrM=
X-Gm-Gg: ASbGnctt/x+UaNKJ4upfH0z2gFdVjhVmbCNSHc5y5tGwJsRAqU4QZHkm2TZSD7c1Uip
	QCOTX15BfXon9OueHUcPYW0uOUJAyHzt2mfhiKn1UHacEgWmri6DdXNcInPfx0P+HSbfBQDD3oB
	TBjf3mIF4l83a99NOIYSePEUXCUw+P9dNrsM86Kjt3pyZrOqFwDyvp1ooaiTkeOWh89rKzsD13b
	+V4DNqsMqEukafW+uxKU05lmFn1Lso+e0ucs/iTYLuxX19vJ2Gru9regThACTxasUYPRii3Q52q
	C/HsCUt6vqfNYuEHMJ8sAROS6/lWvc5VMPeEQiZxRd0V2pfiaAk=
X-Google-Smtp-Source: AGHT+IEeg/tGTI1ItJ9q2PaqG1hhYRlzm48eOgv4lgW6LXxIPLcmcvZILh0TFmVfp/Eh0d33KZZB6w==
X-Received: by 2002:a5d:5f52:0:b0:391:253b:4046 with SMTP id ffacd0b85a97d-39c120de297mr5412217f8f.16.1743370068062;
        Sun, 30 Mar 2025 14:27:48 -0700 (PDT)
Received: from alex-x1e.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658b47sm9631942f8f.13.2025.03.30.14.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:27:47 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
Date: Sun, 30 Mar 2025 22:27:09 +0100
Message-ID: <20250330212729.3062485-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
combo chip using the new power sequencing bindings. All voltages are
derived from chained fixed regulators controlled using a single GPIO.

Derived from:
arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index d259a0d12d7b..c924f2a67939 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -22,6 +22,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	gpio-keys {
@@ -288,6 +289,101 @@ vreg_vph_pwr: regulator-vph-pwr {
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
@@ -861,6 +957,23 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
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
+	};
+};
+
 &pcie6a {
 	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
@@ -1127,6 +1240,37 @@ reset-n-pins {
 			drive-strength = <2>;
 		};
 	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
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
-- 
2.45.2


