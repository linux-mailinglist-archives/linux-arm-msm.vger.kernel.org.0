Return-Path: <linux-arm-msm+bounces-52354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2467A6DCF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 15:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52AA171600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C9026138D;
	Mon, 24 Mar 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVDSjf9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5249E26138E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826253; cv=none; b=juUkwqxXY+Rbekh/X3safAeGLr9NLLNuP7S6/c7EoC268Hdkh6wimz3i/cX1se/X7V80WmvDiH44NQfveNSELBtwTxKwgmy2iWU6IO2J9BwTDPzNijBgCF5vNW+HkquEeUT6MTDJKzSuSD0KX3GMw9UwMoEyxOjHkwsjhvvCbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826253; c=relaxed/simple;
	bh=O14EyF9A15Ru315HFl4HSzQuAQcmW2SYomPhPWdbxQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YvWekmxV6Aya/0gsIjVRbvkvdDLxWAU8UocxSNDtQtZDBgB3n5CQyoMZK91LMIMDiHWUpkHix+u9XvXOq9Cqc+qJp78kNbyRjfbA1MeE/PFk8YEosc//C7wsOgnJKMF9OHQr/XuFFLWp7z5f3V6yrmbzQXhzvRvGRB04Ixa2/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVDSjf9V; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac41514a734so253664366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742826249; x=1743431049; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5W5g6PwOvS4pLaf93NgeHPK0lEFRnE/rz638Ra6x+s=;
        b=cVDSjf9VPxGzjL308ZAfWjhsXRpm62MSWa8DyI39iJYCYX8usktM1w07xANhZrHLtu
         U4N3AduM5obAwOrzk3L+12MSR4xqSCc+mdYXvWCOCZSu2AzArQiHrqWRX7unW7XEXfbu
         NWmlSW+MJ+xHCyCUIzeOj5Sq9niQbWgDRCVhZUI/PBGaVviNwH5qm/JmLz+HVL+9kbSA
         KJkXX84DwHPbKw3bIlWRL5xbr3rwJeodAD9ZS3sDFiBenuKDEA8ymyVnMPa4IiMdrryw
         lVilEwyiaODIA94AAwnQ4Bf4F2Q+Qo/rsLNHd36VtGD2rVjS6KZ+uc0aDDg88LhhXFQu
         e8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826249; x=1743431049;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5W5g6PwOvS4pLaf93NgeHPK0lEFRnE/rz638Ra6x+s=;
        b=stK5AVJ3UeutZ4v0a/q6reNSVXE9S8d84W3akgi4Onh1IU6YdIVKH0j7cZCARo9O8N
         +26GgJiysbBcMwd0IfUUfvsAvNhU4mfk/pOQrDO/gHVr/rJtDxag15rpp4rUdlvSjk7y
         VG2it0U06oape/T2k+XbYy57Q+MlStg5eoYQJu3CIpV13Bxxd/XFuqop5eJpaohNHqph
         xcTHTLpvnYZWhIhDE/86ezrosF+KnKruuGtr7kLDOWIdA9WOaGNTDCpssndwNGLMHcBs
         +n6g3Jfu0+/c40qmUw4Psl6oTXx9w7poxQb0o2eaOP54CCbek+zlMhFDWFKhDdoHiLbN
         V4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUjOBgLiJGsg086xjDty9XcWmSQGztJtCKhdhgjW/eM5TGc4tfAtrE7mo7oWLbkJlwKffqJofqVdWPymWri@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRyEi1dRpfE6sPRyv7XlgBxQ/GXWAQhCb1UMjBblI7xHyjly4
	NGcKTwBTtGq0pXSJJ8jGRsSgGv9iy2xPXe4/CmfyWQqa5i/PVY6EtJ9X19fqdgc=
X-Gm-Gg: ASbGncvQLIQMQHkg6cIL0uY4cvqN37v4xkF8PN4NtlW6x/6r8yRYCDzHUyIHSTu0sXM
	EDmpuvxGYjvSmlUMcichBqEbTSJ9elijyxwhytsFnrKKX2ob1bFFRGCNGDWk7ILA9y2SezmGcp2
	aEvSq+aL1HHXwNatgKhsZIXtdWOcOOEg6xQr3yX/aaOp1fX0xY/H0lxbxOdx5SsWltPSMVlTxA9
	/m1mPapFcH39wUCR3XFiwaqzDTns6SyaLt7sbGCCL2IAGoejUYGwUyE2k37WjRI1hNpLxtmWIgY
	fli9S8sdJKKtA/nt5ZcvsoY54qax95TbW44mxPafWEs=
X-Google-Smtp-Source: AGHT+IHYJjQcnvC0ryFrppXbwzy2MaIiK3p54ZynX0xZ5IkhjX/bqQbS4oI+0KQ1kd+n1FhIDqGwjQ==
X-Received: by 2002:a17:907:971d:b0:ac3:eb24:ab26 with SMTP id a640c23a62f3a-ac3f2559a6bmr1240855366b.51.1742826249519;
        Mon, 24 Mar 2025 07:24:09 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbde4bfsm680626166b.143.2025.03.24.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 07:24:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 24 Mar 2025 16:24:01 +0200
Subject: [PATCH] arm64: dts: qcom: x1e001de-devkit: Add Wi-Fi and Bluetooth
 pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-x1e001de-devkit-dts-pwrseq-v1-1-530f69b39a16@linaro.org>
X-B4-Tracking: v=1; b=H4sIAABr4WcC/x3MwQqCQBAG4FeROTcws1obvUp4kPbfGgKzHTFBf
 HeXjt/l28hRDE63ZqOCxdw+Y4WeGnq8hvEJtlRNQcJZ2tDxqhDRBE5Y3jZzmp2nX3F8OYq2+ZK
 vGuNANZgKsq3//N7v+wG9DlY1bAAAAA==
X-Change-ID: 20250324-x1e001de-devkit-dts-pwrseq-7013f6f8177a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5152; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=O14EyF9A15Ru315HFl4HSzQuAQcmW2SYomPhPWdbxQE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBn4WsGG0VF7w1+dgKH6eEdutb6UZHbVya4No+Ri
 S6c61U7cRuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ+FrBgAKCRAbX0TJAJUV
 Vqc4D/0U1dIQourgy19gD5wTGYlPrHZRa3ex10RSv45I1t/e+qVJpqfvBp30A3jg1mX2gEmD3+7
 z4kjTIAb3R51r3113LTo6dQv4Iv786jchKcwsWL7OMWJGF/5KJ4gqf/YGOBPXS0PMtxtq5x6DQj
 kAItRhDrWGjcbO6LUSmQDjK9gJhMvW98vKhpylPIAHRJOeYXbSMQOrBsXkq3HkRYkAPg43KJrhM
 /ecG1G1JsMCcwmbpanX4HrCwkUNOvWWrZ6rn00DkVXps6/jdsxw0W6J1fNFVsfBRSjUhpepyJLo
 X2eyy/TxWtU+BC56BAnztrQwdKLLJ4W5QmneOiyjdmF/3Eqh2NKrdsg8pacAorAclvzmcBSbGD+
 c0pEFW6JkYTieYKr0xFsQqNuERYvuIUjzw10AKIWXkp+UbCGyU+gFb9DkNnyKD19+vUfzjhOUFD
 gNRbb6OwFBrLsrtVPdnlcNIZW9flZLZL2F7zBH0uLQsAW4b4kWC0cwCg0keIzQ1dKo1QjRaiSc8
 lVMHM+1E3azfToXRHmyn0/dAvQ4wsVKsXI7EmVK813sXpo+EKzF017ST/cTidmEqLasBiFH/w1e
 ASip1C16+YWIfD6GTGrIWk0+uoWOGXA3TZfPrWRP/ZbDrtNQtLhLIXriP3tDY4MGgwzTNmNyEy9
 aYCSB7V7Nx2quSQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm X Elite Devkit comes with a WCN7850 combo chip which provides
Wi-fi and Bluetooth, similar to the CRD and QCP.

Describe the nodes for the Wi-Fi, Bluetooth, the related regulators and
the PMU.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 144 +++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 74911861a3bf2606add8cf4aaa3816542e837513..8f288a138c4cb6e21725fdf726eb2a2489bfbc38 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	wcd938x: audio-codec {
@@ -392,6 +393,42 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
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
 	vreg_wwan: regulator-wwan {
 		compatible = "regulator-fixed";
 
@@ -407,6 +444,65 @@ vreg_wwan: regulator-wwan {
 
 		regulator-boot-on;
 	};
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
@@ -979,6 +1075,23 @@ &pcie4_phy {
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
 &pcie5 {
 	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
@@ -1262,6 +1375,20 @@ wcd_default: wcd-reset-n-active-state {
 		output-low;
 	};
 
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
+
 	wwan_sw_en: wwan-sw-en-state {
 		pins = "gpio221";
 		function = "gpio";
@@ -1270,6 +1397,23 @@ wwan_sw_en: wwan-sw-en-state {
 	};
 };
 
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
+};
+
 &uart21 {
 	compatible = "qcom,geni-debug-uart";
 	status = "okay";

---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250324-x1e001de-devkit-dts-pwrseq-7013f6f8177a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


