Return-Path: <linux-arm-msm+bounces-35455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812639AB2A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3951C222B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF7E1BF811;
	Tue, 22 Oct 2024 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vkzBi2Be"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0A81BD519
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612103; cv=none; b=H25K2tqaajIxZgkG+hjSRA2K7eEMYVJaBG0y/0B4r/ca87Fx8ZdvCcULB/KEQYb4DKy5cjib+u810BH7AKWympjFseOk/MU8REXEFzR7PzEblHPF1wuxT33SthXfWF6S+QKr9h1EHD7VeBJXB2XiT7ZAlo1L4ZX/FI9d1VjfJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612103; c=relaxed/simple;
	bh=fdf5q7Kdg5agvSReu+CjfGcEHicH6nlf1t2RIbqvN1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6dMKfssNz2zhcu/W3zBM0GIL0mcmtmNqaOBWZxMLGc80dJlknMMgsuaZ/mrDvq82reoZR4udi7JsSy8vkDL8XW0k9eUQBcKBk8KBmhWtaXrCxrAQnUIHWRaQMwV7z+NXiV2odZIbPL3c5dEwD0zJmLd14Kr0emvdRJ9Ybsc4XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vkzBi2Be; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9404cef42so770947a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612098; x=1730216898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBm4Nhw4qPHigj/nsxESh7ajX6tcdPfbKCrsfAQCQsI=;
        b=vkzBi2BeB+y8Fw5fWAs9PR3FKAGrGY5kqieb0JJ57xM7/lYva133fTMiN4z/tzXAAi
         BNID+s1v/9be1Tjz/f3TDQ2V2unP4X73sehQtFifzFQoEE0k1p5Srb2DXFlt5Uhg7amI
         6yy1gYwEaX3vAwt3ZPUpYbGTj2GDozFn3lJCpQ8M0VwNLhGiKSwsjPgIzPO/VHH8BHsa
         Jr6r1JYwvC1M4bQXx3y3C+eyJRZRt55CNapqPCo/vK/4Obu2FqCjIvpZXQzJDI49Vi4u
         RsEYqIe0OaC0U/FbaJP7b5Ap0qhX7QXkuIiA59ICrV4ZdwA82jB+CXf8xs8GC3f81cmf
         hAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612098; x=1730216898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBm4Nhw4qPHigj/nsxESh7ajX6tcdPfbKCrsfAQCQsI=;
        b=Ws/XDkgejN12EmZH6rs/x3vOMd5ijsjrnMJrmUpKNJ0IAUyHV4Q+96th8GoTnREntT
         JvebyTD7juCZlwv3w1VTnueE9Otg1iRF9VhP9/i0qC85tx3lHV+tawXPWfu15fh/5Ci5
         k7QQq8/kvwrvzwhDBJkbwHnRtcqnfT5Ytc60Kgo2n+7n/kgC2oiAplhu3XDEXyGM38yX
         CoXvIsse6JVKsPL10AMvDnWvvPYYUKN31nXEx50YZDmFnOgVk+waubzb99eT4mGUV6lt
         pujmbiGo+StDAKYXyJjKB0gALlO+5Xpe//OKUw2m+T9FkRBjUIwdOcIoY5CIIhXYRxcv
         ANuQ==
X-Gm-Message-State: AOJu0YylRdWlnIzK4Qa6vxSznkmcyT+BMm5TrhvkRzr5n4MtBp6L2+Nf
	u/AgjlPiPIhsKaAnfoVhQ3BKniBkjVFdVNsv//8h5xrUfF14s21LLxyufW+9VOI=
X-Google-Smtp-Source: AGHT+IFkQDSrm4UOqTxHIT807XR2YYF6TU62i1nh8YsqaqKsopceyemluvYrXIwwbSunH1c0zzNoXA==
X-Received: by 2002:a05:6402:348a:b0:5c9:879e:6998 with SMTP id 4fb4d7f45d1cf-5ca0ac44384mr6206104a12.1.1729612097913;
        Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:38 +0200
Subject: [PATCH v3 13/18] arm64: dts: qcom: sm8550: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-13-0505bc7d2c56@linaro.org>
References: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
In-Reply-To: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11525;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fdf5q7Kdg5agvSReu+CjfGcEHicH6nlf1t2RIbqvN1I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kfZCwdQUtnoJZTzVx95Q4Oy8Z9Vh8f7Fvue
 DrohB/TiTCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJHwAKCRDBN2bmhouD
 14xYD/oDqHPB1D03/2Vuzud1vu1jfBDzrFRB4sWdmF+M/5t+WpTe9bxX60TaaU7PVeUe29pjRDU
 Ckxu08/Fm93ogTTMPl4poD9SH0so6cjQoReaqRO0bH30+Ukae2v4d/0Sp2l2pBmPB1geGUnyBAc
 fX/e59mK0AKHKxnTpopToAqsmXlVulxkkzp46hWtJokmLzyasH9DMaDGJz2vXrJoskUSmVVvDDk
 bYJfBxc9NNlU/NHW3yX9PQFKUyzwLEA0aMtcXdv6WGC6ZcsypzTnO8Ipl+v+Fhn5Xn1+kVO0eNK
 H2FgDlOOdaMazb6hs06MDEZ8zD/t1YA+og/gI8yUii0P6CFwkFqZACsuZQaigN50sR38YNN35Zy
 ScJI+JNebAJ30KcE0Hjr9a6fyp2QOXAwLQEA1tFiiaf1jqD1dv783z2tJglY1WPy74KElG2cl5O
 GhTMzct1D9ZxBGfJgvXFzO4IMR0KfetCwqctSpcn6GspjEdas25VzVRwof+vj1lxytRzX/IUFs8
 d/OCNLxnu96Px4jAnXfrfgHPmmnXRoBzIOif5Kk4nRIxt6bZBf0n/zdYz2kCbPa7TPEC3C3gUD1
 GZKBUvrfk4pJwUZQV7A9/CRf19o/e+oUSyDHD5EsdnUZ1Tq2bHskYIWxAW2iTfJBFylTkvEH0Wp
 3ndR8CTUXMHrJ/A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 162 +++++++++++++++++------------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 93c8aa32e411b4aecb3140110073f422b407bf80..9d2ee372b225783c0fd2acc0fe23329fa42abb12 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -64,25 +64,25 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a510";
 			reg = <0 0>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD0>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
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
@@ -90,185 +90,185 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a510";
 			reg = <0 0x100>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			next-level-cache = <&L2_100>;
-			power-domains = <&CPU_PD1>;
+			next-level-cache = <&l2_100>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
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
 			compatible = "arm,cortex-a510";
 			reg = <0 0x200>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			next-level-cache = <&L2_200>;
-			power-domains = <&CPU_PD2>;
+			next-level-cache = <&l2_200>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
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
 			compatible = "arm,cortex-a715";
 			reg = <0 0x300>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
-			next-level-cache = <&L2_300>;
-			power-domains = <&CPU_PD3>;
+			next-level-cache = <&l2_300>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <270>;
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
 			compatible = "arm,cortex-a715";
 			reg = <0 0x400>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
-			next-level-cache = <&L2_400>;
-			power-domains = <&CPU_PD4>;
+			next-level-cache = <&l2_400>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <270>;
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
 			compatible = "arm,cortex-a710";
 			reg = <0 0x500>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
-			next-level-cache = <&L2_500>;
-			power-domains = <&CPU_PD5>;
+			next-level-cache = <&l2_500>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <270>;
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
 			compatible = "arm,cortex-a710";
 			reg = <0 0x600>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
-			next-level-cache = <&L2_600>;
-			power-domains = <&CPU_PD6>;
+			next-level-cache = <&l2_600>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <270>;
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
 			compatible = "arm,cortex-x3";
 			reg = <0 0x700>;
 			clocks = <&cpufreq_hw 2>;
 			enable-method = "psci";
-			next-level-cache = <&L2_700>;
-			power-domains = <&CPU_PD7>;
+			next-level-cache = <&l2_700>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			capacity-dmips-mhz = <1894>;
 			dynamic-power-coefficient = <588>;
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
@@ -276,7 +276,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -286,7 +286,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -296,7 +296,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			PRIME_CPU_SLEEP_0: cpu-sleep-2-0 {
+			prime_cpu_sleep_0: cpu-sleep-2-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "goldplus-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -308,7 +308,7 @@ PRIME_CPU_SLEEP_0: cpu-sleep-2-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
@@ -316,7 +316,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 				min-residency-us = <9144>;
 			};
 
-			CLUSTER_SLEEP_1: cluster-sleep-1 {
+			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2800>;
@@ -376,57 +376,57 @@ psci {
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
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
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
-			domain-idle-states = <&PRIME_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&prime_cpu_sleep_0>;
 		};
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>, <&CLUSTER_SLEEP_1>;
+			domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>;
 		};
 	};
 
@@ -4366,7 +4366,7 @@ apps_rsc: rsc@17a00000 {
 			qcom,drv-id = <2>;
 			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
 					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


