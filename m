Return-Path: <linux-arm-msm+bounces-33439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D3993602
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EAE6286BEC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A321E1DE3A3;
	Mon,  7 Oct 2024 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6iKLQjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662521DDC36
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325388; cv=none; b=GqP6GyOsY1COeOJ3hNCqJBF887377az7w4dpo3Zar16dL2d7TZ+42x4x8ClHKphFJyz9yZU2JL7egMIO+8LEvQn/1mhQDfE1wHcVutEexFkKsz0PpqQ3ENksy8FHYJNRIwhS9kaplCYZh57htzjuhmvx50CbkgLeTC3TMxEz9+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325388; c=relaxed/simple;
	bh=dWW5Fnb/Liw7P7L7ISnv9QYTAfrILqPJeU0hde7wkT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=do3yiRs1k3IQCz/SgO5I5A+++TTMPVZ8EP9AI06WzxpGyDe06W8/Zll7xJ9XIA4eoOigljHkFausLF7mra2TuqyfC5usg4ZDyhac/T3x3GsQbgW1JAGPIc85ELogFSMd9R2w+qtHtHd1q58EuqcreT3feHwao8qc/m+c+co297s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6iKLQjc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c88e45f467so405546a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728325383; x=1728930183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4ikrsSTudcXDr0qKC7KwQz3JWAw/JPV2vdvD08LgVA=;
        b=w6iKLQjch54ceU6I/isZqT/5q2UnWhvKdF4/wAEKLANqXfaQBn+lo+h5VncVeaIUhG
         5rH8VNiZGDwl7qnxbwVeKE6os7VDcuJLBuF2tPFhg4ALvm6E1jvicWUgog6RFS5+bqDY
         qsWke/uEbMX1YYJRq2+Eoe62gb/OT7LwAo9HGny3+LVL6Ai2q7lVHTuqN59ipJoP4fdg
         ruSwXr28MYf5dBGu5tsxYWbMJLr6r3arYFWG3HDkAq9qstWwdmEyANYVbU7cAM2S82Jt
         RUSdsfQOx1uRG9MLskAm9/1YFpTKBf7w1G1uEJCJpWsQlpVG/FDZWWCdDVsQEhQcun/a
         VJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325383; x=1728930183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4ikrsSTudcXDr0qKC7KwQz3JWAw/JPV2vdvD08LgVA=;
        b=aiH+E9hn9kEwiEsjreOAxQ27FaQAjmNdLIDD2flJ+Mk/Vk5NuO4T0cpeOQazqkyw61
         vps/Qn8za3iV22seMbxlpfzeiGsHZ2+f9fI7GNW7ZQGR/Ec2p8g3DbalQvszsRcdLbD9
         99vYtwo/iLE1KxndzK8vCRHaL3CX54KCwwxIXEpfO+1tX2LMIYdwN+wVTzRH9STvvp2o
         lX6Mp35kbTK56lVnfhbieO5qip/du7gXm8vcpp9huOTen6Qy3GUpCKK4q90fNqyPvKpZ
         /naiB2qaALRnj64Rq+kjNP0iYSa79kr53PR10yS1jJgUr4uWbvFcq1ot61u7/dV7Fdld
         dG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOsBWWuBqKbl7TgIe/LVYTAvvLaLG9VKaIeYK7n/TpJ7UsFM00z1qki5WV0I0wxEwSS/pJjGjvbZ0J8OXZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHYRpthDLS1A0lwBIdLtk3B3E+DLUpbRzkD9/9BSEX4uDhkJK
	mqh4WAbkYwXrkQCMihR7NGvz4Az0nhs1aEGOc41LTvKJubAqVSNTWEzpr4DmuGU=
X-Google-Smtp-Source: AGHT+IGMt2CHAKZO3Z4jDoLFfrRBZgFLZJ+sQ1ndDRbyE4RI/VUucDsSexodlYL7gvRwzN5a9xwQIw==
X-Received: by 2002:a05:6402:278d:b0:5c8:a2b8:cab3 with SMTP id 4fb4d7f45d1cf-5c905cff396mr594317a12.4.1728325383549;
        Mon, 07 Oct 2024 11:23:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:4109:b8c2:873b:4a28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb34csm3452963a12.59.2024.10.07.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:23:03 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 07 Oct 2024 20:22:27 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.13.0

Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
combo chip using the new power sequencing bindings. All voltages are
derived from chained fixed regulators controlled using a single GPIO.

The same setup also works for CRD (and likely most of the other X1E80100
laptops). However, unlike the QCP they use soldered or removable M.2 cards
supplied by a single 3.3V fixed regulator. The other necessary voltages are
then derived inside the M.2 card. Describing this properly requires
new bindings, so this commit only adds QCP for now.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 144 ++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 1c3a6a7b3ed6..9977c2a505b9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	wcd938x: audio-codec {
@@ -254,6 +255,101 @@ vreg_nvme: regulator-nvme {
 		pinctrl-names = "default";
 		pinctrl-0 = <&nvme_reg_en>;
 	};
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
@@ -684,6 +780,23 @@ &pcie4_phy {
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
@@ -877,6 +990,37 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
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
2.46.0


