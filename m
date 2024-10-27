Return-Path: <linux-arm-msm+bounces-36058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C029B1BA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 565E01F21BAF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2762BD04;
	Sun, 27 Oct 2024 01:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsWhfO45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4022F1C
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992260; cv=none; b=GFegm10a2f/eh4n/S7knXoqukQgA1BeDaCqIrh7/e6aJ3n/YeCKroirlMo8Pr6ZdpvpDEyaBdHUL+9Uhzvlv0km/npneLqkgn4wuTZltqfKub/B0RDaOuyBuiCZaUjib9eQRfW20eMpO8D88pf7G0JqY6qEA/wlZwnc5+7bCt80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992260; c=relaxed/simple;
	bh=oKK5gbWEejDoMYSUIFjcuSz0eq7ltuyCy9xv93iydLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JoPPZGgMPj/JKdb21xpS8Y0EnCruhJ24+T/jb7SGPz52o2/ByFgQ9jFuluT+GOGiHZb08cxVudZgRFjyelngiC/Z2CAGqf67i4CFQU5bMI1PF5wrH/bwtgoNDsiGt5lbVNLaA3ZE8GsPPnNITv9jfKO9+oNwyTfClbbFof/GEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsWhfO45; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so29697881fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992255; x=1730597055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5y2SXSw01PWxmjVoX9nfv7FS4uwhOzizq9TAwp4iCpk=;
        b=rsWhfO45eCQzUYJQViBiHvtbS0KCz9BtWocCpO5PAryR5lgcZiug/VLnzBQeyi8S5C
         F6mW6r08VUxFTY2ptK88ng6i8yB4E8K8afYsm4elYle+lSeVBHd96Z5b/aQ04TrDbGau
         okZ2R8xXjw/e6TH6SDTzw/5t5lgANmY9Kt6ONPC+YwWQr1toItGqUxFFOPnXwRR5Gjbj
         GzvKqjbb1iyww82mDghZ0L5+X9Jx894yi7dGQwvP6PnRjH7RYhuge9axgI/s7Bt/Ev8Y
         ZFK8zZZCf6GKFocyLt6JufLy2b3DbjOnPGRMCj8VuqCTAVj9Bh6eAPtXhDAEc5GXOc8C
         uiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992255; x=1730597055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5y2SXSw01PWxmjVoX9nfv7FS4uwhOzizq9TAwp4iCpk=;
        b=rDXhVSLvFDL0mmkX+24Cj0IaVnM6cIUzslRxGZcIkKV1ch3lT7GMBCeenMdHs35PLx
         6tAUQVKQ0wCNYr6nXJiuhAt4ZKY5oC9y6fy4+w8+ubtA8cejBntvSc0ssWRmCIUrFdr9
         V7hNXbZ+AKNlwJnPfz/j2VdF9Fs9QYQ3oEBBfH1NLRaR1wlk8kCbkbz/eN3jNz3zowul
         wUbql9g4hTVkQ8fPi79nDNqRBn8hvCFyvZZRh5fNSf+8yN07hJ7az4HTt6T0dxYoTql2
         PLnFQiI/9/owIBI6yCxM/Hs7VXcNILrlQvRAt7/PckfV7W/bgaaxP6DSX1f+dHNv/08I
         GH7g==
X-Gm-Message-State: AOJu0YwFjIE3c737Cjm8vZbzIRNwufSKHZ8HyAGVYJVm38P2yVg/66hz
	0pFMB868JiLNPS7K0qXkN0Wwo7uOLmz54zOgi3svt4hN4qF9lqmNo/Oyx9WGNHSobSguqIuCQPM
	q
X-Google-Smtp-Source: AGHT+IGQoQ4KCO+b9gFfaMe6z9N/jNF8Gk0UBe4vljjuEWG79ruDCVy+XouF124MxoqxFnX2E29clA==
X-Received: by 2002:a2e:812:0:b0:2fb:3d1d:dd96 with SMTP id 38308e7fff4ca-2fcbdfc7594mr12079041fa.20.1729992254837;
        Sat, 26 Oct 2024 18:24:14 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4519b3esm6913881fa.44.2024.10.26.18.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:05 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sar2130p: add QAR2130P board file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-dt-v1-3-739d36d31c33@linaro.org>
References: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
In-Reply-To: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13712;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oKK5gbWEejDoMYSUIFjcuSz0eq7ltuyCy9xv93iydLE=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZY06Tuo+SH0I+zhqdUTKUtZ924MtsNpc/dzT
 v2FOADrWZmJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WNAAKCRAU23LtvoBl
 uMJsD/9HA/OiaNR9vg2ymGyrGhzhVG9S+KArX73X0etbzz4ESWJuHEGCvPVa2wvuG+0Ed+WIJUH
 NZ8VvPcT1OIQ7nd4rfiqYRBWcM7gZkQYwbdHztSKOVTivNekOQqfTbj8jhoZjf3InG3OY6q3Sot
 27gBNTWCZI1Tdsj6rwxBOYuMVuFAM6NghPLGqDanNXGl9/2R97oABnmtwAqth8C151Wp5xUv4uj
 nSmdfSozQXTH1Nj2oa0lfEdqyq1N1tPDDf0S9av0VKp01fF5mNNkwMzj8HkguhguE49PUarII94
 3VlGK+2aS/NzNbHtYa4UlLOZdOhXR3VCmjMiOyJKroRNIuQNDAr3AxdFy/Sd61iPoZwdB6tzW11
 z5/Xe4CVPUw8GQ+bqnz6yPZcH7kyU2DYOt8eVcu3NYupakmOf+MytLvQtGKb5fKRSwPdwg7/fdD
 X580H/mv4NcCfHVNGKaKrACjZCoiFIk/oCq0MGS+L3IOFcnA5StgVKt6I7sDJHVqDSCFCE5FloM
 5LO75dzlyX1rvgwz795hjzhfJoChr/hP0DscF5jtj8gLufHrIwcj+5NuqWJZm/hAzSZy1YKlJ0A
 P8059VP3+VSaeIasCOAP0xZuGCRGH9fzhvN0vKs5vn4oPiBuufebx6phAe/nowGee/H9f9EhJ2t
 Vg17eWFSGi8U5eg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add board DT file for the Qualcomm Snapdragon AR2 Gen1 Smart Viewer
Development Kit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile              |   2 +
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 551 +++++++++++++++++++++++++
 2 files changed, 553 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ac199f809b0d4e514878518604a23b4f1ab8ef79..fc4ab86895441fb3832e43eed758719cee73a250 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -3,6 +3,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 
 apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
 
+dtb-$(CONFIG_ARCH_QCOM) += sar2130p-qar2130p.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-usb-host.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc-d3-camera-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-schneider-hmibsc.dtb
diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
new file mode 100644
index 0000000000000000000000000000000000000000..fbf84877672ed9065db2ff6f2c8bf742291deda6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -0,0 +1,551 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sar2130p.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	model = "Qualcomm Snapdragon AR2 Gen1 Smart Viewer Development Kit";
+	compatible = "qcom,qar2130p", "qcom,sar2130p";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart11;
+		serial1 = &uart7;
+		i2c0 = &i2c8;
+		i2c1 = &i2c10;
+		mmc1 = &sdhc_1;
+		spi0 = &spi0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+	};
+
+	/* pm3003a on I2C0, should not be controlled */
+	vreg_ext_1p3: regulator-ext-1p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_ext_1p3";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+
+	/* EBI rail, used as LDO input, can not be part of PMIC config */
+	vreg_s10a_0p89: regulator-s10a-0p89 {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_s10a_0p89";
+		regulator-min-microvolt = <890000>;
+		regulator-max-microvolt = <890000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+
+	thermal-zones {
+		sar2130p-thermal {
+			thermal-sensors = <&pm8150_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <100000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		wifi-thermal {
+			thermal-sensors = <&pm8150_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <52000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			thermal-sensors = <&pm8150_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <50000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en_state>, <&bt_en_state>;
+
+		wlan-enable-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 46 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_0p95>;
+		vddio-supply = <&vreg_l15a_1p8>;
+		vddaon-supply = <&vreg_s4a_0p95>;
+		vdddig-supply = <&vreg_s4a_0p95>;
+		vddrfa1p2-supply = <&vreg_s4a_0p95>;
+		vddrfa1p8-supply = <&vreg_s5a_1p88>;
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
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
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
+		vdd-l1-l8-l11-supply = <&vreg_s4a_0p95>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_ext_1p3>;
+		vdd-l6-l9-supply = <&vreg_s10a_0p89>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p88>;
+
+		vreg_s4a_0p95: smps6 {
+			regulator-name = "vreg_s4a_0p95";
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_1p88: smps5 {
+			regulator-name = "vreg_s5a_1p88";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a_0p91: ldo1 {
+			regulator-name = "vreg_l1a_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3080000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_1p2: ldo3 {
+			regulator-name = "vreg_l3a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo4 1.26 - system ? */
+
+		vreg_l5a_1p13: ldo5 {
+			regulator-name = "vreg_l5a_1p13";
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_0p6: ldo6 {
+			regulator-name = "vreg_l6a_0p6";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-name = "vreg_l7a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_0p88: ldo8 {
+			regulator-name = "vreg_l8a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo9 - LCX */
+
+		vreg_l10a_2p95: ldo10 {
+			regulator-name = "vreg_l10a_2p95";
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* ldo11 - LMX */
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* no ldo13 */
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-name = "vreg_l14a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-name = "vreg_l15a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		/* no ldo16 - system */
+
+		vreg_l17a_3p26: ldo17 {
+			regulator-name = "vreg_l17a_3p26";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_1p2: ldo18 {
+			regulator-name = "vreg_l18a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
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
+	firmware-name = "qcom/sar2130p/a620_zap.mbn";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+
+	linux,code = <KEY_VOLUMEDOWN>;
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
+&i2c4 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	ptn3222: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd3v3-supply = <&vreg_l2a_3p1>;
+		vdd1v8-supply = <&vreg_l15a_1p8>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c10 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
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
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l8a_0p88>;
+	vdda-pll-supply = <&vreg_l3a_1p2>;
+
+	status = "okay";
+};
+
+&pm8150_adc {
+	channel@4c {
+		reg = <ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		label = "xo_therm";
+	};
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "skin_therm";
+	};
+
+	channel@4e {
+		/* msm-5.10 uses ADC5_AMUX_THM2 / 0x0e, although there is a pullup */
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "wifi_therm";
+	};
+};
+
+&pm8150_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pm8150_adc ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	skin-therm@1 {
+		reg = <1>;
+		io-channels = <&pm8150_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	wifi-therm@2 {
+		reg = <2>;
+		/* msm-5.10 uses ADC5_AMUX_THM2, although there is a pullup */
+		io-channels = <&pm8150_adc ADC5_AMUX_THM2_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sar2130p/adsp.mbn";
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l10a_2p95>;
+	vqmmc-supply = <&vreg_l7a_1p8>;
+
+	status = "okay";
+};
+
+&tlmm {
+	bt_en_state: bt-enable-state {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		perst-pins {
+			pins = "gpio55";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio56";
+			function = "pcie0_clkreqn";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio57";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		perst-pins {
+			pins = "gpio58";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio59";
+			function = "pcie1_clkreqn";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio60";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio45";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
+
+&uart7 {
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
+&uart11 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l8a_0p88>;
+	vdda12-supply = <&vreg_l3a_1p2>;
+
+	phys = <&ptn3222>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p91>;
+
+	status = "okay";
+};

-- 
2.39.5


