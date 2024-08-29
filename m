Return-Path: <linux-arm-msm+bounces-30016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E29644D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B35F2B24C79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C88D1B5308;
	Thu, 29 Aug 2024 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6zgXvr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E51B4C2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934916; cv=none; b=naQUmY6CtqoFQMeLB9617dq/WCA1SeiTjs6j1aHVJQfDG1uPFHUUUUtTIckNFsBloLxJ6ivgOQGsPS/Z9tLtQrIbsg8gOImji0mESMGQn5xM9dCx5JQFzJmrf9jzFodSMWM0GeHC74ItscbxVcihhT8M7tvciqxTM+p9zNGCe8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934916; c=relaxed/simple;
	bh=zCUfFpNnqRQpzdLA5qkLpFQWRtf1xQMZiO4+DFvkbmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcftHxj9MPPKF97Bx9sqa3UykM7prn+toxqDH1PS9HaD617/CzT5/v9vpm/ueYWXccAFXbEINdl8Y3YBhM5QaP5Pc4dQ4C0mRUgJO6pssiXgajVz62D+t9Dw6QhsWBRhN++no7qK8HV2ehEG18E0JhisoREyjW28ItOD/oX4dh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6zgXvr6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4281da2cdaeso922985e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934912; x=1725539712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7wrjEwLROb6lKjg1bNv/E+9zEZJXokSuVO8aekucwI=;
        b=s6zgXvr6jn3Li0f86l+YF3TeFfZM6mQzV0S+L27jIut6soNrMczH2d+OQ6QLAJISdt
         7wEmAMlUNRm0dmqEmZEtGR25Ys1ZYADtVQVLLTGCnJwk3c9cUOrZDPImOClk5mdsZXAh
         RdlJOSyQ5ZL8rP39uTNML32E2q0IMtHqH0b1hUjSo15y/kH79gHB6gN7j3pf0xqYlwhP
         /J3PHugqJ5PxzoJYv6rDtjIZ7SquJc1OfqLJeaoAArqT7dBaOalNAezpo87+IhqIAwLb
         b0VK104bRTzxg2raev7UyjHPhf5/NNCUyrPsXvjx3iG5Y3w7VZbGS2evHy6uYY1s+xdR
         BbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934912; x=1725539712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7wrjEwLROb6lKjg1bNv/E+9zEZJXokSuVO8aekucwI=;
        b=J4JZfY5pFI48yE9UHZ4SEvmDa3UoS+/NjPeKqpG0ZxOOegVlFWsxrgo68MVIQY3Bpx
         0zXv1W38iws1AX1za7DO0PkxZL94B4186X+i5mgL5gb/gbS84Fz8bT7bD77KRpQtZQ5P
         BMNmz13dA3Vxppzn2V7hPVO7RdDLGyUEKA+sBzsZNB5KvEe/QGEwA6saVSCcaSK/qUI4
         T3RScHRxGr18yfLiKhjmso54LCMU6Y5jydmMwAYx3zSHtgkeNThVwew2EX8aHO7uSgp0
         Z5Ct2nZHHrP5v5MdSIsXm9dZfFS7UMhleDDrQ2zunZ/roW3+zc2kZvTCJwcydepZD6+q
         UxIQ==
X-Gm-Message-State: AOJu0YyhCRcMM0tNfTmRRbWKxHzdxVSBMzUYIF7t6Hg9loQbxzmoj4r4
	xB1PBNiN066KVywWvuwUo1Fy8rpPIpo+bwxPiSYIxOHaZzHSn+gNHCQNbCPx8TU=
X-Google-Smtp-Source: AGHT+IF+rv4RTPpak1BufESHwUxkORhQyn8t8l3NABiJmWa6yC/rcX3HPY3gUQgPA3pHY2Ux59fg7g==
X-Received: by 2002:a05:600c:3596:b0:426:6ecc:e5c4 with SMTP id 5b1f17b1804b1-42bb031a280mr12590105e9.4.1724934912022;
        Thu, 29 Aug 2024 05:35:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 29 Aug 2024 14:34:40 +0200
Subject: [PATCH v2 05/17] arm64: dts: qcom: sc8280xp: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-dts-qcom-label-v2-5-5deaada3e6b2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13341;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zCUfFpNnqRQpzdLA5qkLpFQWRtf1xQMZiO4+DFvkbmA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0GrqabMFrozPBuHcEhoL/8reFQc/CdCvxl0V5
 wMYk3n793mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq6gAKCRDBN2bmhouD
 16ZbD/wOAaSjdfqWmnMDZgjiiXCZP8eOXp1VpH/dADSmzA5BDiL3QDScjigltWi/VStGjl0Xjdx
 zWK97lfaus5opDdnJdiSNsqnoFw58g4uvlnHlq9Ss/luuALVjdqeTFDGcVBcP3GgTOaxbo3NCMP
 5dMpkoInx8oy7ObNwdbA3cfGWVD7nIViLVmPSBzn9GWuci3CUTZIc8MujCOnwUQENoBw5O+bvtY
 GKSBgwU7uyvp3on0woe3d9UP7942qchn1NeOghyxpOAztxY9/2/A3PITsXuvb8QEjIHi139kB+7
 vkeaTz9XDwLRws4XXPgxegl4mqvzLGxfmStCabTEoU1WHxDBhMl0mtnc5s6sLkR2rZboHbPQtrY
 agNLylBko8eb8tBrq5zww3wBjAv5xzasf1ZyKPf3Cc9gpFetbpiY4Mi3qLNqwtOvtlnSLm93IS+
 i5LhZz9/CLgCXZCWsCmG9e/oJ1fM9okesJZI7d4p5sVutCwPsruWozhZzIQ2fC/7B5DtN3fFz4/
 gTc6r04jKlfXcork+eM3HupMaSR2QyPR91UGZ0K4OES9KtKh/hCQ1UZUgA0KcHer3md1G0y48gI
 c+riNL37SI3PzZTXnZP6FZzV2yW5DjP0K2SG29yYoIg7MaVFl2Vb9iy4ua0GyMyiW5lAk6v6OBc
 TzwQRB2LZ2E5XyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  16 +--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 158 ++++++++++-----------
 2 files changed, 87 insertions(+), 87 deletions(-)

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
index 80a57aa22839..2f2fb074d804 100644
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
@@ -52,19 +52,19 @@ CPU0: cpu@0 {
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
-				next-level-cache = <&L3_0>;
-				L3_0: l3-cache {
+				next-level-cache = <&l3_0>;
+				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
@@ -72,7 +72,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x100>;
@@ -80,22 +80,22 @@ CPU1: cpu@100 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x200>;
@@ -103,22 +103,22 @@ CPU2: cpu@200 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
@@ -126,22 +126,22 @@ CPU3: cpu@300 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x400>;
@@ -149,22 +149,22 @@ CPU4: cpu@400 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x500>;
@@ -172,22 +172,22 @@ CPU5: cpu@500 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x600>;
@@ -195,22 +195,22 @@ CPU6: cpu@600 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1c";
 			reg = <0x0 0x700>;
@@ -218,53 +218,53 @@ CPU7: cpu@700 {
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
@@ -272,7 +272,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -282,7 +282,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
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
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
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


