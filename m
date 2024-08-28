Return-Path: <linux-arm-msm+bounces-29719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FD19620A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB77282BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA26B15B97E;
	Wed, 28 Aug 2024 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpcVQIYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAC15B104
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829490; cv=none; b=lT2wX7t7Ez+CZuNUlY4q0ZuftkPXJMvy8tZslBkMCYmOLioe09/MUbRNjq/aZI/xq942E/afGKwk+/vV90auClzN01o3KM6yIQoJyxv6CJbuMyYqjUUKRZ4JUaScUEHJVHsieC9+kQbUa4IRJ9H7rPsIcHcp6crjRxsLjr/FRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829490; c=relaxed/simple;
	bh=GjNJ4I2U5ojkaNLIf+tE8Er1hwjm41bJa6lEwn5tWj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7EDCdwrc+bzaPp8h5+fw2B1i9lnuU6Y6LGgKYfKF9Rq2F9TyuLcU/L02GOBX2YiYBY+VScG9mQy3lFpxZyk02DJAEmvWtBQHGi7oi2Qd1n7fqSyJBxsCBrvWOXe9EG2ObAHwZC954nCatS0t0ECQyhSyfSnjzXYAn/2OjRGfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpcVQIYA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3719419c2aaso211832f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724829487; x=1725434287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvH6y9518WaxQeZ2JO7XUExKQdl704dZul4cyowCiqo=;
        b=vpcVQIYAx9mkoDicyt/U3N+hd+oY/ZfSA1ojhWC01bZ0G+uE/gBL5nGo0y+n8YMmox
         pBZEICUjcgP3uPdeaHAw4LZBr2oxCQyhBXw+1pVNlys6oIH4wQtviZPI5SrmBz7ler5G
         htoQmJ4KgAxcjJXxEvRf1rU8KgZkwp1idNa7gfoYPdmDcfgQ7sOT1i5nfCsahBnnHKcd
         ezuBe2vr6JMvkK+6NA4TnW2B1H4YcATk2MJBAAGPU4F989mVGIYK3nHa1o3kZRhquROe
         eSwG9pgUqMXECVXJvGeTgjWmdRii0Lc1joNLVOrTDeY8xJ0o0BjwcoDx97DAPb53T8X1
         U0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829487; x=1725434287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvH6y9518WaxQeZ2JO7XUExKQdl704dZul4cyowCiqo=;
        b=ba52GfpgHgRGETLKzChRfuhIu2J868yrr/CpEKieROwoTL3pF1kwNzbflnFRijjbP/
         UZmorW7I1p7+2mHjyMn2MV3ltWSTAjxZtx7nctyn8dzsqPFuiKvsoVZofs0q/T1/PsMY
         0TYHpBY7sXexHnJUuy3MBkfUzXls+A/BRgdCBmLkbk/BsfiYY7mrrKw5mwE7vF1GVSMR
         Su/UP75bPinpnxMj7Nt6B+3K6shB/1imtGU6NHcP6rjYacEuaqpvktaPpXssSvxkJnZ7
         nflaXaY24sYqO5B8ECIHAr3aGEiSOvnbtq9si8OmL1SWkasJU1UNOtfCZvMNztxPSCz3
         jB+w==
X-Gm-Message-State: AOJu0YzuNXvfywEam2RFZCfugL+gjqbiuC1yg1QSYCkL0pNHzKLOZNMz
	OHkWFn7FAgLe50FTp6KmH1LjHIpXHNRc+BoS+ThTKX2WL723wPHzU73kYAUYEiE=
X-Google-Smtp-Source: AGHT+IG0JF9xv91mUG8k7Dnx9uzDyNm+SwfS4YnIL2fLIkjs1wDmd0lNhAC63kHExhUmNz8buzia0A==
X-Received: by 2002:a5d:6d8d:0:b0:368:4c5:af5 with SMTP id ffacd0b85a97d-373118fdc9bmr5613883f8f.10.1724829486537;
        Wed, 28 Aug 2024 00:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308200404sm14843476f8f.81.2024.08.28.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:18:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 09:17:37 +0200
Subject: [PATCH 07/16] arm64: dts: qcom: sm6350: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dts-qcom-label-v1-7-b27b72130247@linaro.org>
References: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
In-Reply-To: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=17640;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GjNJ4I2U5ojkaNLIf+tE8Er1hwjm41bJa6lEwn5tWj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzs8XBhdMCVa4l9ZWXpZX3EL3F3PFgvgB78vL1
 T4RHj95u/KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7PFwAKCRDBN2bmhouD
 1//RD/4ykfnVFcv1+dYIZTc9+5jd56whpnot/Au/2mu8ktGF+aJJDEQLs+zr3kRfx/vkzDzwVar
 eWWhpjkKaf+322Wv6KenVbbcI6/zE3f8t+vlWPUqdBsPU7YbiU7XsV9bOye+m3fhhd/YjwLtHUP
 GQUvlI3m2xkHFnTr0XUkjZVOG1HPA5Qqzc+OR8v9cwuA60jN/iT9KRDtCgWk+wnyQtdoDjb1Bhn
 99J1/9GC62dnfRWV8Oq6f1prrKWvY3Kau39vpJ5C00IrfFTkqlMb8G8AABsB8SVXonQEBertaES
 yNDBEexaVy+bctZuS/ySEcjtp96jmPSaVdHRxmbPC20Xit7pVfy2zxccEXRUdpzivUa69Nzzi1K
 M1o2AMO4ZvcOc3s9esAe97MVymxZ6uhCcjwNCnmBOAdE2xpsU8Ct/Pc3IVhrMWPb9yrnIoiaN8u
 DZ/TtI+2WFBUVOsrHgtoYGka79k8v+VdQNGWntLF2PGlajhja8xtx5CRJt0jrfJDjp249UVBhtw
 BOvpptiKnoN+lYwmvUooisIdIQEYRqC3Eoswz349YnKFRXiG7QRpgbwucvhS0eKiZqsAwjDUJ48
 GXEm1ItlOtLuE9PapWi/kru2HOUEP15W/1ZMM1lunKyLd6uJPsk3mU275mxvDH6WvU1R2f39JQO
 3aVx+l/N0oSGJcg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 172 +++++++++++++++++------------------
 arch/arm64/boot/dts/qcom/sm7225.dtsi |  16 ++--
 2 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 7986ddb30f6e..109fdb0d103f 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -45,7 +45,7 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x0>;
@@ -53,16 +53,16 @@ CPU0: cpu@0 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -75,7 +75,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x100>;
@@ -83,16 +83,16 @@ CPU1: cpu@100 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_100>;
+			next-level-cache = <&l2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_100: l2-cache {
+			l2_100: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -100,7 +100,7 @@ L2_100: l2-cache {
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x200>;
@@ -108,16 +108,16 @@ CPU2: cpu@200 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_200>;
+			next-level-cache = <&l2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_200: l2-cache {
+			l2_200: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -125,7 +125,7 @@ L2_200: l2-cache {
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x300>;
@@ -133,16 +133,16 @@ CPU3: cpu@300 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_300>;
+			next-level-cache = <&l2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_300: l2-cache {
+			l2_300: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -150,7 +150,7 @@ L2_300: l2-cache {
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x400>;
@@ -158,16 +158,16 @@ CPU4: cpu@400 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_400>;
+			next-level-cache = <&l2_400>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD4>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_400: l2-cache {
+			l2_400: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -175,7 +175,7 @@ L2_400: l2-cache {
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x500>;
@@ -183,16 +183,16 @@ CPU5: cpu@500 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_500>;
+			next-level-cache = <&l2_500>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD5>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_500: l2-cache {
+			l2_500: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -200,7 +200,7 @@ L2_500: l2-cache {
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x600>;
@@ -208,16 +208,16 @@ CPU6: cpu@600 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1894>;
 			dynamic-power-coefficient = <703>;
-			next-level-cache = <&L2_600>;
+			next-level-cache = <&l2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD6>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_600: l2-cache {
+			l2_600: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -225,7 +225,7 @@ L2_600: l2-cache {
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x700>;
@@ -233,16 +233,16 @@ CPU7: cpu@700 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1894>;
 			dynamic-power-coefficient = <703>;
-			next-level-cache = <&L2_700>;
+			next-level-cache = <&l2_700>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
 					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD7>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			L2_700: l2-cache {
+			l2_700: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -253,41 +253,41 @@ L2_700: l2-cache {
 		cpu-map {
 			cluster0 {
 				core0 {
-					cpu = <&CPU0>;
+					cpu = <&cpu0>;
 				};
 
 				core1 {
-					cpu = <&CPU1>;
+					cpu = <&cpu1>;
 				};
 
 				core2 {
-					cpu = <&CPU2>;
+					cpu = <&cpu2>;
 				};
 
 				core3 {
-					cpu = <&CPU3>;
+					cpu = <&cpu3>;
 				};
 
 				core4 {
-					cpu = <&CPU4>;
+					cpu = <&cpu4>;
 				};
 
 				core5 {
-					cpu = <&CPU5>;
+					cpu = <&cpu5>;
 				};
 
 				core6 {
-					cpu = <&CPU6>;
+					cpu = <&cpu6>;
 				};
 
 				core7 {
-					cpu = <&CPU7>;
+					cpu = <&cpu7>;
 				};
 			};
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_PC: cluster-sleep-0 {
+			cluster_sleep_PC: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
@@ -295,7 +295,7 @@ CLUSTER_SLEEP_PC: cluster-sleep-0 {
 				min-residency-us = <6118>;
 			};
 
-			CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
+			cluster_sleep_CX_RET: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41001244>;
 				entry-latency-us = <3638>;
@@ -303,7 +303,7 @@ CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
 				min-residency-us = <8467>;
 			};
 
-			CLUSTER_AOSS_SLEEP: cluster-sleep-2 {
+			cluster_aoss_sleep: cluster-sleep-2 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100b244>;
 				entry-latency-us = <3263>;
@@ -315,7 +315,7 @@ CLUSTER_AOSS_SLEEP: cluster-sleep-2 {
 		cpu_idle_states: idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			LITTLE_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -325,7 +325,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+			LITTLE_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -335,7 +335,7 @@ LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			BIG_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -345,7 +345,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+			BIG_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -504,59 +504,59 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0 &BIG_cpu_sleep_1>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0 &BIG_cpu_sleep_1>;
 		};
 
-		CLUSTER_PD: power-domain-cpu-cluster0 {
+		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_PC
-					      &CLUSTER_SLEEP_CX_RET
-					      &CLUSTER_AOSS_SLEEP>;
+			domain-idle-states = <&cluster_sleep_PC
+					      &cluster_sleep_CX_RET
+					      &cluster_aoss_sleep>;
 		};
 	};
 
@@ -2776,7 +2776,7 @@ apps_rsc: rsc@18200000 {
 			qcom,drv-id = <2>;
 			qcom,tcs-config = <ACTIVE_TCS 2>, <SLEEP_TCS 3>,
 					  <WAKE_TCS 3>, <CONTROL_TCS 1>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			rpmhcc: clock-controller {
 				compatible = "qcom,sm6350-rpmh-clk";
@@ -2953,7 +2953,7 @@ cpu0-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu0_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -2978,7 +2978,7 @@ cpu1-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu1_alert0>;
-					cooling-device = <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3003,7 +3003,7 @@ cpu2-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu2_alert0>;
-					cooling-device = <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3028,7 +3028,7 @@ cpu3-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu3_alert0>;
-					cooling-device = <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3053,7 +3053,7 @@ cpu4-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu4_alert0>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3078,7 +3078,7 @@ cpu5-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu5_alert0>;
-					cooling-device = <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3103,7 +3103,7 @@ cpu6-left-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu6_left_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3128,7 +3128,7 @@ cpu6-right-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu6_right_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3153,7 +3153,7 @@ cpu7-left-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu7_left_alert0>;
-					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -3178,7 +3178,7 @@ cpu7-right-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu7_right_alert0>;
-					cooling-device = <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm7225.dtsi b/arch/arm64/boot/dts/qcom/sm7225.dtsi
index b7b4044e9bb0..a8ffdfb254fe 100644
--- a/arch/arm64/boot/dts/qcom/sm7225.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7225.dtsi
@@ -6,14 +6,14 @@
 #include "sm6350.dtsi"
 
 /* SM7225 uses Kryo 570 instead of Kryo 560 */
-&CPU0 { compatible = "qcom,kryo570"; };
-&CPU1 { compatible = "qcom,kryo570"; };
-&CPU2 { compatible = "qcom,kryo570"; };
-&CPU3 { compatible = "qcom,kryo570"; };
-&CPU4 { compatible = "qcom,kryo570"; };
-&CPU5 { compatible = "qcom,kryo570"; };
-&CPU6 { compatible = "qcom,kryo570"; };
-&CPU7 { compatible = "qcom,kryo570"; };
+&cpu0 { compatible = "qcom,kryo570"; };
+&cpu1 { compatible = "qcom,kryo570"; };
+&cpu2 { compatible = "qcom,kryo570"; };
+&cpu3 { compatible = "qcom,kryo570"; };
+&cpu4 { compatible = "qcom,kryo570"; };
+&cpu5 { compatible = "qcom,kryo570"; };
+&cpu6 { compatible = "qcom,kryo570"; };
+&cpu7 { compatible = "qcom,kryo570"; };
 
 &cpu0_opp_table {
 	opp-1804800000 {

-- 
2.43.0


