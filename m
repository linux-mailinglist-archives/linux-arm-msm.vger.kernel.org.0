Return-Path: <linux-arm-msm+bounces-29716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C033E96209D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19D19B239EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C29158851;
	Wed, 28 Aug 2024 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFPeJKPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325315AAB1
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829485; cv=none; b=hu1tcjx1ZrOSXWmymA9TOpnWthWxKhcuUfP76EphgnLWPMsFnmBn3wfjcMZxVKG8c9zVokMpSRjDFUa8TxHuRH+HvoxYPKEWXvAsmX4z9llbsompQsctYynrE7pUK2Rl+wgzLEx096zrK9R6tsi7TLWIbPUn/ZW0hxUL9MZBDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829485; c=relaxed/simple;
	bh=iTiyki3nb7d+M6yJoDKpNpaMfTLhGQH10mtoP7umNHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGWmTEwWbjZzcRnCj019AoEqVdoM1Ow0gFsDWMDoZdTAqoarjGWCkP1Jp5f7lAXvAtScBjoxu9gtG8cVWlixitxA1fd7Nz18rA+tgXZOdiY0festg7bX1G2/3BsGI9qA0sxU9gjT7dvzbWUoo/Ob/ph9vDZXMZ603lNyf0a1n/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFPeJKPg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428098e2b3bso7128985e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724829482; x=1725434282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uspYaFZ4SslUnwxe3NJhAaotDGVRyuovjakdjqOmmRE=;
        b=DFPeJKPge3huNPieRZaBSk8pTocXqTyOPSLV14t7wdeE7KKsn0KxEk6hQlJ3EbEKLb
         wRWXq8bZjbSVZasJ0Gbcaa181LwCdYgyTawLUdgOfMAB+wz7UdYmXX1ukm90ZZyUWh6M
         YN8KaUu1xOQitF4TLe0sOIPVnbu59eoYEGv+VhdB58D3rrgux+3etK6ZQAPaEO5K3oTi
         OxnIvAykltXSABZC7lOhmAa2maEMdCl8N06oWWCU/NK05VvAUxPbqrmS40tLTd1tB3G6
         3xBY8ByYHOOzGMX7hbzjKWCBZ8TYMNjTmLxGX8hytBnm/XypUYI1tHYwHd4FIjyH0WwE
         LfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829482; x=1725434282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uspYaFZ4SslUnwxe3NJhAaotDGVRyuovjakdjqOmmRE=;
        b=o+HkPcrUoCcUtn/zwwQe6UvUK0e53umqiIqLnVTbtiDsnJeJh7d3y7SSGfnOXl/Exp
         8jlkGljnazpsIHaLTjcv5Mmi2rT+u6VGPye3W5FF1SS7vJ89pESk610thu/GLKXsaomY
         KKVqVSTMpXuJKraujN+vBsosP/1NnjXrIKKonXwtCvoZBr+SWU5+EOJcU62eZf9AgoLz
         qv5ErYLmKL1np1iHoYze27eZtx8ijaVE3NrAeT/K+VozoCf2wk1oQeJTO911+aoR9/6n
         9PQtPaagFkz8hOchwrKTsmRpKmJ+NgLdpeur3iSUNvQ2MKgO6c3VxvWxM1kykPtcudlh
         BqaA==
X-Gm-Message-State: AOJu0YxsrKNntfCWvnnMiDaudMrE53nw1OhFv0SdSZUrEljR32Z4Uedm
	78KKCRE1nc+Zz+mzGXGalCHfGb99GPkcqRvzYfUBe+oLH5qXz1b+DOMXpRaeaq0=
X-Google-Smtp-Source: AGHT+IHegDnKjyNytWesTl0vOAWzoovZA61f32HC0g3E4eaSONOTUIqz/fOofMc2DyGzyXi/xc+kyQ==
X-Received: by 2002:a05:600c:4f86:b0:426:6cd1:d116 with SMTP id 5b1f17b1804b1-42acca0dc64mr68035735e9.3.1724829481522;
        Wed, 28 Aug 2024 00:18:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308200404sm14843476f8f.81.2024.08.28.00.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:18:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 09:17:34 +0200
Subject: [PATCH 04/16] arm64: dts: qcom: sc8280xp: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dts-qcom-label-v1-4-b27b72130247@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12936;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iTiyki3nb7d+M6yJoDKpNpaMfTLhGQH10mtoP7umNHI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzs8VVJ1m7qFJ8Cpcmhs/DnoXquVxuK+dcx1B0
 ddRYkhvSdOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7PFQAKCRDBN2bmhouD
 16XqD/981PKakraoip7gdgLQ5TEWf9KaZ+CkypMxhy+zFWyvzIsPGI4UuYPF8uhMeMEu3Xar5fb
 ZHiIL+6oIFjt6+9fN+5tKf4xFiIbyHFY/eNSjoSyKKAp65sVfoK40cz/VGdZeZjDg541GjOUs4L
 6aST6nw7Sx6EQQthdioEdVwUJ/QvRO070ZCokjkHsY77x7YZcep7nHGYxdsDLL0eVF+2VrelwNk
 Jyp6pkGf78ijW4kzEpM5bMREIP/NphsFwMvulnthwTGwVFiZ4jBJ/wz9PQWwpy4KM4usmDukL11
 wBMv5UbktmJgcKigCd9IBqpf8Kj1l/VUX7RNk41gMPP0AaQPgUpvSQ1pYZKFF/FeSknCdmZq9MN
 bbBrmTyGnaMJDkzRSN0EUc4bKPXJMrXWDKZqcmtIxRDLYISIRAQ8alA/mngfQ4Wg2sjHyTFoNz/
 uvCwdUNZz9LaZc6/S+A84NuPXqMkhJzhs4UeiPOaZft1AV8PZacqWZmts3RsnuUXBFMxt6tjymT
 /b4uViiG/x/l1OKcksW2pQbSbCCJpegAg8GGeGZ9siBpncZnH9vhUUnnTsLIxxKqtjY3zSeEyiq
 A8WG/kegaxOsTnAdlYHR/ZOnNFMnZXUlxOoCQbWCkywpk9fhgD+gGTcalQx2fBytJ6yzQMq8cwC
 xLc1R01yeGIlcvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  16 +--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 140 ++++++++++-----------
 2 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 6a28cab97189..83208b10f994 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -346,18 +346,18 @@ skin-temp-crit {
 			cooling-maps {
 				map0 {
 					trip = <&skin_temp_alert0>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 
 				map1 {
 					trip = <&skin_temp_alert1>;
-					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 80a57aa22839..7138466f2439 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -44,7 +44,7 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x0>;
@@ -52,14 +52,14 @@ CPU0: cpu@0 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <981>;
 			dynamic-power-coefficient = <549>;
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD0>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -72,7 +72,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x100>;
@@ -80,14 +80,14 @@ CPU1: cpu@100 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <981>;
 			dynamic-power-coefficient = <549>;
-			next-level-cache = <&L2_100>;
-			power-domains = <&CPU_PD1>;
+			next-level-cache = <&l2_100>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_100: l2-cache {
+			l2_100: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -95,7 +95,7 @@ L2_100: l2-cache {
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x200>;
@@ -103,14 +103,14 @@ CPU2: cpu@200 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <981>;
 			dynamic-power-coefficient = <549>;
-			next-level-cache = <&L2_200>;
-			power-domains = <&CPU_PD2>;
+			next-level-cache = <&l2_200>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_200: l2-cache {
+			l2_200: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -118,7 +118,7 @@ L2_200: l2-cache {
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
@@ -126,14 +126,14 @@ CPU3: cpu@300 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <981>;
 			dynamic-power-coefficient = <549>;
-			next-level-cache = <&L2_300>;
-			power-domains = <&CPU_PD3>;
+			next-level-cache = <&l2_300>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_300: l2-cache {
+			l2_300: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -141,7 +141,7 @@ L2_300: l2-cache {
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x400>;
@@ -149,14 +149,14 @@ CPU4: cpu@400 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <590>;
-			next-level-cache = <&L2_400>;
-			power-domains = <&CPU_PD4>;
+			next-level-cache = <&l2_400>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_400: l2-cache {
+			l2_400: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -164,7 +164,7 @@ L2_400: l2-cache {
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x500>;
@@ -172,14 +172,14 @@ CPU5: cpu@500 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <590>;
-			next-level-cache = <&L2_500>;
-			power-domains = <&CPU_PD5>;
+			next-level-cache = <&l2_500>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_500: l2-cache {
+			l2_500: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -187,7 +187,7 @@ L2_500: l2-cache {
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x600>;
@@ -195,14 +195,14 @@ CPU6: cpu@600 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <590>;
-			next-level-cache = <&L2_600>;
-			power-domains = <&CPU_PD6>;
+			next-level-cache = <&l2_600>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_600: l2-cache {
+			l2_600: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -210,7 +210,7 @@ L2_600: l2-cache {
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x700>;
@@ -218,14 +218,14 @@ CPU7: cpu@700 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <590>;
-			next-level-cache = <&L2_700>;
-			power-domains = <&CPU_PD7>;
+			next-level-cache = <&l2_700>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
-			L2_700: l2-cache {
+			l2_700: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -236,35 +236,35 @@ L2_700: l2-cache {
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
@@ -272,7 +272,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			LITTLE_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -282,7 +282,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			BIG_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -294,7 +294,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
@@ -593,57 +593,57 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0>;
 		};
 
-		CLUSTER_PD: power-domain-cpu-cluster0 {
+		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>;
+			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};
 
@@ -5111,7 +5111,7 @@ apps_rsc: rsc@18200000 {
 			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
 			label = "apps_rsc";
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


