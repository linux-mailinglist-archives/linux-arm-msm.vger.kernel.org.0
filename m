Return-Path: <linux-arm-msm+bounces-21759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454458FCE8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57E828C1BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D041A14D710;
	Wed,  5 Jun 2024 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vcMyEuBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A81946DE
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590464; cv=none; b=l/+aJawGzBY0UlAN+VYafBDe1f9cpwbjHOjciPVBesZVkrG8DqoNS9HITEV1mXqUoheFYyJYJVEgyTw0+ixYLx5Qt259bChuvDvdJMRQccF9ht8u1tUROn+x21AZQwXJ/FO9LF1muY9DNg2ctLrWxzSNTRW8uKW14MmytBd0ub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590464; c=relaxed/simple;
	bh=BCpdTc39nYkwa0OtjNF1OLv5Jy45gKbeHiCf+IvDyTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zg9TSf5yqtJzAtgMdBRn2ogecjVP9O27pnRFFzf0q/7vdASSIoVP9CwX0CORslhwDacGLjMJBx5mjl2Eisqc+uvmEhG0Wrf/8RbtAI/Vd3Xh+fCciLhZJX9kjazojESNoO7UFVP3n7Lk/6lFyABLnc3jr67jU+jGD7GgEYHHu3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vcMyEuBv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4213b94b8b5so31195525e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590461; x=1718195261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qkgKaKXEjIq7EgNLRUjqygcy7ItGPT/lxYgcy6cyy8=;
        b=vcMyEuBvuEGg1JU0a2KI7GKPfPgtLYbSt0lUv+/4Q3fQX7NNDFNuY4uGtww6DGjwyV
         faW6sg3bpjvrgPkHKQpXacHIAqG68Ph0wG0x0f0hYNry72inWDKGmKMmPW/p/87Qevoy
         Sl9Q5XzlXWAguSGxsXJ23WW2/kVjaKUbwNnMEeUHyisgYuBT3wMgHZg7nU9bVUbrMeiR
         0NquJH/fXAA7s2BIVQMR2YjXte5gsbQBykRtl7ZafvNZir1/iGxMy0InLdjFZzqeotII
         R6KGIggHk5j2+UTlE78Xglv6+LYKIw7WCU/+w6hTHtjB/Q1RntwTypLyqbnbzEKW5C2K
         GIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590461; x=1718195261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qkgKaKXEjIq7EgNLRUjqygcy7ItGPT/lxYgcy6cyy8=;
        b=tEilIw6SgxTBnNiLDBe/MKT/aXcUS59TUMngHIhv2FZ8kPI/Qv1lVUdlz48eZ+JjEf
         cppViogiT2gmDqHwR1jHE/lgMna06rqBXnlaK8wYgl4WMONwU/ZtGm71egCK0qdSjDpP
         rsLB4o9raIInlbIRv0bOWqRAF4dxyZvolcZ1PArVT3ZXcfkrWm8DcZfLdZfjWi1u6ocu
         ilYaUiQMni3/UayN/nLrU/5hasrpgGVHOQNfkZWOlPOWZRFyz++OvWc61NVvwosGaXUx
         qx1memVXYoqEm1KHUtaOESZohfyvvSi+Kqb1/6Jt0zQ7f5MpzlCt3K5Xt6SUmiZwJfnM
         8qdg==
X-Gm-Message-State: AOJu0YwS29pKAWBvycupmHzzvSvBa9VZzdNOHN8C60R8HAXjjpSlAz5w
	pOhmNlLXEvLbG0XG9PGdkRIJPX5iGjD4y2+VuoCBNxHEf1Ssct+qc1Qloetosms=
X-Google-Smtp-Source: AGHT+IFbWTDYCVWsWVxIvQVGwJ5gFQ7ZKTvTBWTRqmPUtS7TFjYistyKXAfCpcVUGAhoBAL+nTeVPg==
X-Received: by 2002:a05:6000:cc8:b0:354:cc79:5589 with SMTP id ffacd0b85a97d-35e84070e99mr1519535f8f.18.1717590461207;
        Wed, 05 Jun 2024 05:27:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04cac3esm14383619f8f.39.2024.06.05.05.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:27:39 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH v9 1/4] arm64: dts: qcom: sm8550-qrd: add the Wifi node
Date: Wed,  5 Jun 2024 14:27:26 +0200
Message-ID: <20240605122729.24283-2-brgl@bgdev.pl>
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

Describe the ath12k WLAN on-board the WCN7850 module present on the
board.

[Neil: authored the initial version of the change]

Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Amit Pundir <amit.pundir@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 97 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi    |  2 +-
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index d27820fb5fc0..361b0792db4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -214,6 +214,68 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
+
+		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+		/*
+		 * TODO Add bt-enable-gpios once the Bluetooth driver is
+		 * converted to using the power sequencer.
+		 */
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
@@ -808,6 +870,23 @@ &pcie0 {
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
@@ -891,6 +970,17 @@ &pon_resin {
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
@@ -1064,6 +1154,13 @@ wcd_default: wcd-reset-n-active-state {
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
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index c55a818af935..c9d3c0549ab5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1784,7 +1784,7 @@ pcie0: pcie@1c00000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.40.1


