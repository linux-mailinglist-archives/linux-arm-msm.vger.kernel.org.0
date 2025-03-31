Return-Path: <linux-arm-msm+bounces-52895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C06A76FA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 22:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B96D3AC0F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 20:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD5021C179;
	Mon, 31 Mar 2025 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJgYAFQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49B21B9DB;
	Mon, 31 Mar 2025 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743453984; cv=none; b=goJjZTPopcZZjweZtGg0b0BSdNxzy+ecyddrXbIJEFiv/7jXcMFapOehUmP2VETpr9Q5p33kFJwPBohEX2zefZ2eQ7pjNpqBME8PTZm2IojxPCqWd+0rsd3iju6M4F3lo7/m2CYVEb6skd9BzS6QeAjYl3k5XlM7HOqFnSjFiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743453984; c=relaxed/simple;
	bh=IJPXyZOm49u5bSGr7kJFDnKDrZFwPg6nZ+c7rEIs8Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBWcvpyzcn9XeS7KcHnEvErjRDIZjeVyymmawDVih4Xzv52Op3ZuKjhn+g81tPK+QxKGo4YlR2dBJZdGaZciPkgLIGuGa7/OZvZBrXENvKsGWCT4UboLBfYT95gzk6TArXi80h51S3a7z6kWvWe0/ZhDvij+4DlqgZRYDeqgOAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJgYAFQa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so44371725e9.0;
        Mon, 31 Mar 2025 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743453981; x=1744058781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peDwTG9P4n7lev4pxO5tLNsJoIjWLF3ERRKu0APoTGc=;
        b=KJgYAFQas4d22QgSFXf9EYj/9wDBuVFZ2tFM2UH/J0RzH23DmhNlLXI2wioXN9XeRb
         l+0otsZXxrVFsaT28Zq+o9nWi51p0KlCUbG4DmgE9JxfcxRjol0oYySv0jovBfCREBTx
         Nct0m7Q0+ywzrarEYzQH67Ga5OfwcKFJMX+xk5gxB+79aHD95dYt0+lRW9xjYdl8UdUk
         t0n1NoBpESv4J//wj0yXUFoXQPivCNDo8bfIlxUkAJ2qEKjrRlgRxrGbXPoCjCHV8Dw8
         5ZXZmoSr7mP159h6DvCvnliK6LXkQqtJDReEpIs6SRc/AOzXpr4Bx4964Ye9UlUSx+GD
         QENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453981; x=1744058781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peDwTG9P4n7lev4pxO5tLNsJoIjWLF3ERRKu0APoTGc=;
        b=vN8ylpkXDpdMiKpDM3x8+NyVWslO+WTkBdZFkqRi4UU2va9kWXGjqMbOQ/EoRtJl30
         tLj5uRHj0ysx9KFTDQNPDogkIBSC2d+e+5zQtWjbTS4mgxhXnXxPw8kkPOi190zPIC87
         ra0vt6VzVSPJly62pd/l2TPKI4XfAXXxIvGjKNkKepjGN9qE2Beibkds73OY6s7n/b7j
         X+9UBAcLDipjhYke7pdUNnN4M1EOXx7w1w68tR5MyjRCh+QEN+cuw5MOnojB5zGvsjDY
         JziSA/tTSq+aWKyjKsNnpIAmQfl6JcJWQvRauvPmN8jFWHV7HEMEy4rmDN990u7QtoT0
         d9qA==
X-Forwarded-Encrypted: i=1; AJvYcCVWcIClIXsPiPRc3PbKgmAI+q5PiI7ettfU/kVfOrB5hwY7nRcxzfrZ7i0kot9sHzIfZgprYJDb4DBgxcNL@vger.kernel.org, AJvYcCW1gKtrRJ2wVr+11yNGAPyGlyiMydLEYwzFYqv6jjAhJjupdaDse+SOPq19mioqzr3JrWdcebXjLyo1BIqALw==@vger.kernel.org, AJvYcCXxaC6LbgmwJ9mZMoL1IzlvFE/aNUBWLj2sVQiR9MVAjDnTzZVCg5ucr46GqCCUF6kHZO28E8bsZr0k@vger.kernel.org
X-Gm-Message-State: AOJu0YySADNc6lq4aTdnEeDEfVUuWxzW03wQL3HmmALeOpd6glVgfKSq
	tsMO9SqGXzf75dhu0ie1DykfIgFkAwgIk0jRO2U9PYh0s0oaOCY=
X-Gm-Gg: ASbGnctoochR2hq7kO90ITICH5VXkMiTD+nlSkzj+nk9gJwkdhZHVVvaP9mGg3BxSX4
	VuSwQ9QJZK6blPfxJ9Zdwp7ZFVuiPTpbyBRw8B5+0VQSS7AqA6L/bdKC7vJwXlMghgBo6lHJRQC
	XyrGklx7Pc4j7vT9VcIUygX+T3bX1+6rMo3o3V1wLBbyf6pC8UMla+M6QGLJ7a8ynHNiCKnSLTM
	xdIhxprHttxz7JEEOcLtCtE3pkeqySgKYbxIEECL5xb8QAPF+6E7M76i3Wa9e6wOuLYyS9YWhNF
	9S0yCBOSglzfT2b+AidSeTiFdC8x8jRDpLM/fMHnD7j3Flfx70IVGenvqOgXseMoVitHwMJVAiX
	N36iynp6em/zSLo2weP2Rpwk=
X-Google-Smtp-Source: AGHT+IFwCITPixAi5lTUDQBI1kXATqZ6+cslt5y9Gy4//JYINg1O1SfhVrfgfg5/7M8tv65Jgvg56A==
X-Received: by 2002:a05:600c:4593:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-43db61e037emr90657675e9.5.1743453980397;
        Mon, 31 Mar 2025 13:46:20 -0700 (PDT)
Received: from alex-x1e.. (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0ddeecc9sm11006996f8f.83.2025.03.31.13.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:46:20 -0700 (PDT)
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
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
Date: Mon, 31 Mar 2025 21:43:44 +0100
Message-ID: <20250331204610.526672-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331204610.526672-1-alex.vinarskis@gmail.com>
References: <20250331204610.526672-1-alex.vinarskis@gmail.com>
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

Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
WiFi/BT pwrseq").

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Laurentiu Tudor <laurentiu.tudor1@dell.com>
---
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index d259a0d12d7b..305d2e248684 100644
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
-- 
2.45.2


