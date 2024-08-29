Return-Path: <linux-arm-msm+bounces-30019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B11989644E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D629E1C2474C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0881B5EA8;
	Thu, 29 Aug 2024 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mj9OJwlC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E91B5325
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934921; cv=none; b=q1qvaaOAISRBD0RetaW6iI1oONjkJRUE0MOjP8q1hKx5PxojiWlo8aPFEqqFXO0LJGmfuXWYQOBwAUCtxgHFjncqLkIVs298P5btPMJi6AzTdtM0sr+qfitVmIMlbxEhNHWcfUgpFpop7m/9piArDG0bfuNTJJNQw9hWeu8TUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934921; c=relaxed/simple;
	bh=K5lkearcgWugiNv8a8ug0QGsYHonPhUmdlU/kClisOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/rhAhb8dGyGUJUArA1eQ8N5fv+q+5cLibeqqJHb0W/BjWcEeHC3XEp7MFB9LG+OrKJhUs6T0bSjo5Xjc9uI6n+NWsKNs956O38FiOIXR0BQ4MwJRvdlOSuDWk+GeyWJFh9OJfHvpH1tXubChCXEHDDqMq72WyFjPcpeg903cVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mj9OJwlC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3719419c2aaso10543f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934917; x=1725539717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6+kiWyYv7J7pi2X8h55MBUjfMtIWgLMoKfFSKVneMQ=;
        b=mj9OJwlC0akxGLE9C4vpoQaIWqEIBsBjchFSP+ZzYDfagGgHb0T6P5vU94Y20KPMHN
         VTA/B854P2pUX6e416lu5mkbtJLfF9ce8EDFU9BpkbZDBslS0iJFqodjx2xM4RjjJMW5
         ShSXChajFXDRp8ZZQ6qC8NUZc3/5aJbTCap61UwnWcdWKSzfwNsl26bGqFffVJ+gjLXy
         agdlideJGIK1VRjEa9cwC0e2MFBtfVRMDexvH4+3k8AoTwqgUoGBPDKyO77feB5ISyU4
         IECb8cnzCs/T7ea9XuSCa2BZ1nINm8emsehQg8yxw9uIn0lNfjALKfpJe3lUWb8DItji
         LxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934917; x=1725539717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6+kiWyYv7J7pi2X8h55MBUjfMtIWgLMoKfFSKVneMQ=;
        b=b0aFY/kVAWK+HNk9XOxdlW5LLy6xmiqZKKoE42vvKTXNTA9lKxcnKOumhG0iXqVDWI
         hJJHWekMzqmYfp0lZb9FzE2LGaEojBy4ZnKXybiZq/L4dJXp+uq4JH63uhLjg9JXcWKJ
         Glt3vBLqpBrrl3XJuz194qBJyHyqy3xa+qmRZUz8J6+y9k6PA5+0PQ9aN0oA7O+84CuP
         AMplhu3bDkFTNrKMLjVOOHe38VvwHSmbhTarn0rUnG7kNVNiweBg90PmQ5187iRhiDxQ
         X7766cxlLNzleO2hyJtmscmKmFiKVN8BjeABFm9/xilzl+Ih2RfoBBo7EqNvZWi5LkAr
         t+Lg==
X-Gm-Message-State: AOJu0Ywh9LGyCgdUf4u3C18MOegOwwVGSnVdnDuDEcuWZkv+bHqnGxkU
	Aewp3UWrWwuQq7CHJkRg+ecrRsdhmOUrZIqymOouAVk4RU94P0p8ahI1jrnFtWo=
X-Google-Smtp-Source: AGHT+IGYVzufkTc+oW5lLZ/0zZJd78hGQJByChcBz5sYG5gpp0SubyvBmuEykQI2sR+5K5Eg4+GZ1Q==
X-Received: by 2002:a5d:6c63:0:b0:367:90a8:4d3b with SMTP id ffacd0b85a97d-3749b550d7fmr1174038f8f.3.1724934916809;
        Thu, 29 Aug 2024 05:35:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 29 Aug 2024 14:34:43 +0200
Subject: [PATCH v2 08/17] arm64: dts: qcom: sm6350: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-dts-qcom-label-v2-8-5deaada3e6b2@linaro.org>
References: <20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org>
In-Reply-To: <20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=18044;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K5lkearcgWugiNv8a8ug0QGsYHonPhUmdlU/kClisOE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0GrsWJw7JEal8Y6xGREcXsZi6hvGTj4qzRboC
 +DUXWmZ1jyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq7AAKCRDBN2bmhouD
 12xXD/4n09RwtOzKxo3gs/0cIZbm6eBB1vdB/R8vn54zJWQUz3LiuSLo8RpPhbId1MLexCw953U
 UPW6FoQ+l4cVlvEawwcWouiuDuIdFqMoRKI4R7spK7BJY3+Hm8qlIyAVPnqZ5ZSF0DtOSGf/ZDy
 yOAlTUHB3BQAUhznzAV0q3QBubc9RFHfQmL3dieuyTjmEeTJTGJxGCo4ziVwNyxsLoFWUYSCj/d
 uubQ95UIawyyR2PVoqZ2Z8GzpPOfTEBOD16P5dCPT2JHAnDfKbEcbjb+D+VU87TOA1troxks5R2
 ASm6Zn06WUXAYJ6hPCOOnfhg6LLRY3i48Z6RahjwsaLVePJPDU03vFy221lnIsc2X/8tLmBBW7A
 7Dlh/6sMcw7Z6FpvVkI4Kv/L+z+gIcjtC2ID1Uke/Kwe+kFO6u5wAryS9bcX5XHfnstk/pyXiOc
 isja4Z5kmrFotyepdxj5jDK77Jt72OVPP4lrlJ5EZ0DOnFNoyP5Z1QqcR4HHobAH4txROqbpS2O
 RZ5uv18wo3Qad/dwtZnB1tJP95VfpDU3gu1erAftSJo3WscB3p9wWXumcZdZ6YYDOIsmMR2U0gu
 KwxDulkHrXIuJNrA/Gn4ChqxaQyiOY7fIL/FHkVtzgZSdBmfUfo0ZtsQtooVW5k3U/7rA4uaACo
 l+FMJtTVqSGCilQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 190 +++++++++++++++++------------------
 arch/arm64/boot/dts/qcom/sm7225.dtsi |  16 +--
 2 files changed, 103 insertions(+), 103 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 7986ddb30f6e..4f6c5020d27c 100644
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
@@ -53,21 +53,21 @@ CPU0: cpu@0 {
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
-				next-level-cache = <&L3_0>;
-				L3_0: l3-cache {
+				next-level-cache = <&l3_0>;
+				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
@@ -75,7 +75,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x100>;
@@ -83,24 +83,24 @@ CPU1: cpu@100 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x200>;
@@ -108,24 +108,24 @@ CPU2: cpu@200 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x300>;
@@ -133,24 +133,24 @@ CPU3: cpu@300 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x400>;
@@ -158,24 +158,24 @@ CPU4: cpu@400 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x500>;
@@ -183,24 +183,24 @@ CPU5: cpu@500 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x600>;
@@ -208,24 +208,24 @@ CPU6: cpu@600 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x700>;
@@ -233,61 +233,61 @@ CPU7: cpu@700 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
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
+			cluster_sleep_pc: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
@@ -295,7 +295,7 @@ CLUSTER_SLEEP_PC: cluster-sleep-0 {
 				min-residency-us = <6118>;
 			};
 
-			CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
+			cluster_sleep_cx_ret: cluster-sleep-1 {
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
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -325,7 +325,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -335,7 +335,7 @@ LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -345,7 +345,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+			big_cpu_sleep_1: cpu-sleep-1-1 {
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
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		CLUSTER_PD: power-domain-cpu-cluster0 {
+		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_PC
-					      &CLUSTER_SLEEP_CX_RET
-					      &CLUSTER_AOSS_SLEEP>;
+			domain-idle-states = <&cluster_sleep_pc
+					      &cluster_sleep_cx_ret
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


