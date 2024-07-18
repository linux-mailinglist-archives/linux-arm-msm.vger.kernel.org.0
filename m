Return-Path: <linux-arm-msm+bounces-26561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E565934D89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5CAF1C21CD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 12:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A9A13C801;
	Thu, 18 Jul 2024 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ID6MJffX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2213AA26
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721307353; cv=none; b=CxdEtjQ+KDURcZ1x8BpsU2TjeZ7K2wBKA2P0ObCdtewN6Hv8eoWMEDdgelgpQ51XHO2X3CZf13CPMxC6I+lTfYaiiHvAcHzusQ4gPAqz77iI3IykMUajSwUujaw0s/ojCun5G3k26e0IPG7QO7p4dbeAUlEhbV6EPubbrOCtrKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721307353; c=relaxed/simple;
	bh=RnVetTAVDMEoHnOYOH2EwKbF0YWG+vmkuwKPkbdBV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFojSew1AeiuY59GtVk+0EwGYvPWV8g4O7hHdWEieg7frGQRRdHdaIDdqs2enOiATwU/+mfh/O4W4EMZczZwGgADbfQ1ixjOjP/W7g8hhwQsyNevDwsNQbcc2X2dDG593Nqdq85J5cHOMf6Nvkr92n5pb9ksLKoAjRnbFcO+V8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ID6MJffX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70af8062039so537622b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721307351; x=1721912151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMMhDZFtOwO3HXFWjJERUf9qK8F/67AIIwwDMX0/jC0=;
        b=ID6MJffXKTEGALIqAi2PU+TB59D21nyjgpdg/0UL4TodaEU9TvcISi+mAN7mggWo0N
         DMo0+6Tav8Keh1knApEKCalOzufQOeXpdhqsGvutBX1JgyHjL87nHDD0LYbXrtpNIZ2V
         +bC7pksYf6Nc4+SW8/F81CEQ5TGhzmr55NyETHp+sXlAJx/OQOhPAOa3oTzUxLnJ6Y8y
         nsgoD0qlD34/MNuSgX1RbBcmJMDP4KfyKwv24DdK1uXByEMa2O8WGr8rwJJpUZzvKJMg
         +tsLcNhWNrscaVPjiyCZg+E2dlRt+tqKlPYRGChNuQ8sT3QzWmwivcjqUc6F2JU2m4Ws
         0e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307351; x=1721912151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMMhDZFtOwO3HXFWjJERUf9qK8F/67AIIwwDMX0/jC0=;
        b=TcqkrrcLZVVHbUqklcjDbnd/YA8XBoHwDgNPZNnGfxmv6yffSlJmJ+Xt45d8pbwudU
         XTJy80qX9wPTu0HMFWHN4DfR/tTQS6l4Zda7MS9w9G+aca3etEucPJk4m6VhT+Ra16VP
         TRtY/AEjbBatSYBUY+WRVP5qOzTbz07Vj8/PD0or8cxNSLaVhxIl0c73E23iVG3rpme1
         Be0bfX/U6InhuRMdKU8kDK205tCi2IY/QKFC/slo7Zx1VDKEoD+KpNnV3Tui9fiFjhYl
         9RJTQgXWDphyG34NDXAw1IqrWCpy1pvpVoXzt/TkXXoECIvOxjAGaZlY+iT2A7mFsZoA
         zIEg==
X-Forwarded-Encrypted: i=1; AJvYcCVmYIySF7IFyWLlFjJ5VBNorvETGrW9YxVUayMovFYY9M8oV9ATloi6jVh0JMoplXEMndtA3hVLRl3uYteqFnuP+HEiXNtKaM/8k3BJxg==
X-Gm-Message-State: AOJu0YzpvLWqfAjT9x7k3xEYA5MekeD0tIQwJPDCkWrWBNT2AQvtS58D
	oBaFsk55R7yTO/P0D1Hsng7p809ro5fe31DTscBEdAc8LU9EciC5fvHl8GarySM=
X-Google-Smtp-Source: AGHT+IG56Qh0nAqJFtYuky5nJyMY1i46EkTO8ZbrlZ8beqkkK6RxYzkS0Fq4cnVTmRmyVBRa0QG6iw==
X-Received: by 2002:a05:6a00:889:b0:705:9ddb:db6b with SMTP id d2e1a72fcca58-70ce4fa4a3bmr5538762b3a.13.1721307351008;
        Thu, 18 Jul 2024 05:55:51 -0700 (PDT)
Received: from x-wing.lan ([106.51.164.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c856sm10009718b3a.4.2024.07.18.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:55:50 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	dt <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: qcom: sm8550-hdk: add the Wifi node
Date: Thu, 18 Jul 2024 18:25:45 +0530
Message-ID: <20240718125545.2238857-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the ath12k WLAN on-board the WCN7850 module present on the
board.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v2: Changes suggested by Neil

v1: Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd: add the Wifi node").
Link: https://lore.kernel.org/lkml/20240702091655.278974-1-amit.pundir@linaro.org/T/#u

 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 113 +++++++++++++++++++++---
 1 file changed, 101 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 12d60a0ee095..0fc55334e26c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -279,6 +279,65 @@ platform {
 			};
 		};
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
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
 };
 
 &apps_rsc {
@@ -954,6 +1013,23 @@ &pcie0 {
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
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
@@ -1046,6 +1122,17 @@ &pon_resin {
 	status = "okay";
 };
 
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
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -1206,6 +1293,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
 };
 
 &uart7 {
@@ -1218,20 +1312,15 @@ &uart14 {
 	bluetooth {
 		compatible = "qcom,wcn7850-bt";
 
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_s4e_0p95>;
-		vdddig-supply = <&vreg_s4e_0p95>;
-		vddrfa0p8-supply = <&vreg_s4e_0p95>;
-		vddrfa1p2-supply = <&vreg_s4g_1p25>;
-		vddrfa1p9-supply = <&vreg_s6g_1p86>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 
 		max-speed = <3200000>;
-
-		enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
-		swctrl-gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&bt_default>;
-		pinctrl-names = "default";
 	};
 };
 
-- 
2.43.0


