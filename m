Return-Path: <linux-arm-msm+bounces-21762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CE8FCE9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A5B21F26955
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8498C14D6F6;
	Wed,  5 Jun 2024 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w7F/SbUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C8A19CCFA
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590468; cv=none; b=jK76PCJJiwkYm1dcvtPjfG5Jj3j+nAiir+m29ZiG9zuLgIpqW5aQ2AqoIk4CMKeRIZS9HPAD84Yc2tZnB0jHY4JDkv9a62sb3GQ2EI0SXIMuEnaoLLET6EFX9Wypeks62ZnVyDMxeCV5iFNoczdVWoNlHNdn58l68x3JdlP2Nl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590468; c=relaxed/simple;
	bh=wfBp64huVpv9lljkIQPdcvnFXuY1AKqBasZpyBPubwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHxELkFtn52roxamK3kBFOEMIppxB5lvGw1p9Xq0xW+1EQSgMHzH7rQIsxrsGGHlULqDg7qvfC8zhDtDngQu31piOlrpCUViiGP0BuYwMfhEeDB6IeJc+oWnyvfYkTrKpazGmJHnALTFzejeHLxN63C/kpWgvz5G48hTAGXZONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w7F/SbUk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421392b8156so21038945e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590465; x=1718195265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddf2EiI4s/2WrSY3b2G39HCYD03J9BpVQC58gnLH4rM=;
        b=w7F/SbUkDZ35ZFSglOdaAIcyfB6m7wgqqk/irrs1K2pDk+4QTsJ5vtAK5m/DFOQ9F9
         q47izAukf6U8rBrAYAMqE2D+VmXCc0jua3alxNQTfD6SUrDXli+sVR9PxLhxbO7E5Ufe
         WeZIhzpBuZoemrOt9K1BoZYBSkCcASltMpRvm28hJPuYJjRgM5fNUwsGdelUnUDCZH8z
         ip3EwF1Z+FAeFOWdLJwOrr5okQWNcQuoo92px5bA9a6X4x2w+DYDCCoyE51nOpOJdydA
         Zw+b8TjcbPqbZIuZzkjAsgXucdntm9PmtW4xIh32p7UHDY2HpX7UfOSeodE49hrwXMdr
         rF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590465; x=1718195265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddf2EiI4s/2WrSY3b2G39HCYD03J9BpVQC58gnLH4rM=;
        b=Gn3pwVBjqVcM6XtgqWdZFgI73zdfEvFyVPR3G6+TnfqK9gnlL7KMAIYACDqdGoNPWD
         KLStIVKK59fLE37uJjXPaYl1JfSUXnbuCHndizRjHqTm8Enb6UmdVDi24q5jUMcogy6t
         2lQuiGAH/E9PZh7TwZHgSOFGZrQWQbfdmu5+7FuO+VEA31vgeVWdZL9st+fpv1LFbvVP
         iJi8qcolzLnNVqjP94pbVJi4QM5ar+NITXOfYF6Cv34c4xrKhWPdxs+0zJk2Ru1sT4Bm
         IZK9KA7GPuuCsbXTfeOKPGDYVxllElWigEvnxZ015CvQqMZtBs/zyEhWOGTwyD50VCsT
         i/cw==
X-Gm-Message-State: AOJu0YyapkU0VrqtMr1yRpdy1lq6LWXh8dOogLAckSM5QqkdyRsZIFJP
	3tzGvLa8+dejOyqDkHROHxTL3IVMRb3OKxACgIfF1gMcfLvZtl5ekatJiB8KwwU=
X-Google-Smtp-Source: AGHT+IH3l/DrdngO6sHG+QFUbSm2Y+KwPZxyr3HEDrKMGsLb24C6sSJOVXzaBTrHB+8F8AxXLCd2vw==
X-Received: by 2002:adf:cd07:0:b0:354:fb01:1089 with SMTP id ffacd0b85a97d-35e8ef99f56mr1680615f8f.57.1717590465241;
        Wed, 05 Jun 2024 05:27:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04cac3esm14383619f8f.39.2024.06.05.05.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:27:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v9 4/4] arm64: dts: qcom: qrb5165-rb5: add the Wifi node
Date: Wed,  5 Jun 2024 14:27:29 +0200
Message-ID: <20240605122729.24283-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605122729.24283-1-brgl@bgdev.pl>
References: <20240605122729.24283-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a node for the PMU module of the QCA6391 present on the RB5 board.
Assign its LDO power outputs to the existing Bluetooth module. Add a
node for the PCIe port to sm8250.dtsi and define the WLAN node on it in
the board's .dts and also make it consume the power outputs of the PMU.

Tested-by: Caleb Connolly <caleb.connolly@linaro.org> # OnePlus 8T
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 103 ++++++++++++++++++++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |   2 +-
 2 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c52357214de5..daf830dfe4b5 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -108,6 +108,67 @@ lt9611_3v3: lt9611-3v3 {
 		regulator-always-on;
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa0p95-supply = <&vreg_s2f_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p3>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p3>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
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
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
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
+
 	thermal-zones {
 		conn-thermal {
 			polling-delay-passive = <0>;
@@ -734,6 +795,23 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie1 {
 	status = "okay";
 };
@@ -1303,6 +1381,14 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &uart6 {
@@ -1311,17 +1397,12 @@ &uart6 {
 	bluetooth {
 		compatible = "qcom,qca6390-bt";
 
-		pinctrl-names = "default";
-		pinctrl-0 = <&bt_en_state>;
-
-		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddpmu-supply = <&vreg_s2f_0p95>;
-		vddaon-supply = <&vreg_s6a_0p95>;
-		vddrfa0p9-supply = <&vreg_s2f_0p95>;
-		vddrfa1p3-supply = <&vreg_s8c_1p3>;
-		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f3f9dea0550b..95471ba46f9d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2204,7 +2204,7 @@ pcie0: pcie@1c00000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.40.1


