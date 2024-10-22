Return-Path: <linux-arm-msm+bounces-35454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240E9AB2A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5F361F211FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8421BE875;
	Tue, 22 Oct 2024 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RlTJBhgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BC1BDAA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612101; cv=none; b=YXyOGatuOHANoVq8/6Gmdt5QYF2BpOwOSSB6/dUwm5iWrcOjXp9SOgzs/0fq6qoqJ0ZwCDTPidWxjZjzJQLeGsucx1aPr3i64v6UYSUzQS+K4j51ZyyY0QSwEMCpB9CJ2O4F9fTrgc55VkNdvrZiJeR+4d89EDgRl6V4s7C3O0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612101; c=relaxed/simple;
	bh=iPL390E5JLXtD3wTFEtOSzANh7PbtLmD4GW7T04H1Gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzBD6umeZMcwFl6B8e29KIL+wux2MnEwRFvQ+a9oRuRkR68ODtfnXPiVVI5sNPHU67AXMhLl8a2+/QgBgncpZK6DJ1n7dnpnb0hL0uLn9h4zRjhA6BwJ2FYWfSKu+2XC+wcghL8eoGcIBqm17HCWzrc8NDSsVqGBlCLrGZhFw1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RlTJBhgU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c939e5a0f6so742850a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612096; x=1730216896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjB7bNtH6RNNDltSB+1qzZOH17wcQ0yrLiP/Eqf10XU=;
        b=RlTJBhgUc6Q+F8toOq1fIvwGn4JDRnCq30Nd5V0FlI6gixtKsLP+c0E8+SkHNJ4HDm
         WrFNbSDeSGtT9jkGZega1/n04GkyvtRo8XaM+yb/lYGIPmyq2AqTBFTmqUeYjPxkVifu
         vOikkO2smipnSJqAZ/zUH3TPjK0k4oHbcByhjVkXSqDd+4GP+jdft4P2KQxgFZiP7B+1
         6vIYuBUeaqdMBzTr/4o4MPyYNsTKJC3TDnBK307qyW78sBrxw421i3EzZZTT6hqSocQ1
         nthSxlC5pEjRWHptM7N7hmjOAV2Ad9e3EY9sHFXBelV4+nf0i2M67URtp1283ZvfpuHF
         R6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612096; x=1730216896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjB7bNtH6RNNDltSB+1qzZOH17wcQ0yrLiP/Eqf10XU=;
        b=eAlvYzSf90RHuDnR5gx61PlbL27ioKR0Zwf+p1669X/SyXc2V7J4NGXaHn30NpgTnu
         NLi8q8av4Pf5QpDuvwtRFV0ZjT7ZlCvI7V9b0IzLDwqUl+qAue6gelIvCveahvXqCX8x
         dNtPu/pFmzkTSoahrhCCz4/LaNubKXsV8KH/bvL/3+RJfSIVDSoWSHH3YTPzN8AhDgJP
         Gt37I3qYCLROo8KsFd2P96Kt7ygRvkCKpe1q/BiMJsjk9m9WNVWd3adbnReNx9OfTvzn
         Mf3sLSRo6/Y7U0OMv3J3sf80/47XuhZ/pVaz4RRFu+gWI1vwbgyR0nw+/z/85XCM86Zo
         mfqg==
X-Gm-Message-State: AOJu0Yyhc0Lfy/SVWNBLIQw3tXt92mepGbf4reMC++Rp5p8acWNy6vO8
	1s1R40oPhumnSH4K16cNjCEICpnoDnrzugB8D2gYVf+mrHZmgtI+U2vYCbPX3Fg=
X-Google-Smtp-Source: AGHT+IHECpbkwBnTCSppGUpSTmpAyy8UbrD7YnSuVqV3+OvD3M3LLZviitzkEQQK8vikzndL+itYCw==
X-Received: by 2002:a05:6402:40c3:b0:5c3:eb29:50c5 with SMTP id 4fb4d7f45d1cf-5ca0af89464mr5425772a12.9.1729612096324;
        Tue, 22 Oct 2024 08:48:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:37 +0200
Subject: [PATCH v3 12/18] arm64: dts: qcom: sm8450: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-12-0505bc7d2c56@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10625;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iPL390E5JLXtD3wTFEtOSzANh7PbtLmD4GW7T04H1Gs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8keUkmEeXk+jy8uVx+vfyLUSwh3iDJZNeWAC
 U63G2LxC1OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJHgAKCRDBN2bmhouD
 15yPD/9XIL7I1oHUHZkUOIPeYExwMvjTs6DVl0VjTHGPHTxePAXOrGob3K5QdNzI5Cv52cfsFDq
 EdZewJjz4QKWUdCFcrIp3OW+7O/dA+eBzgxVFckhsn6+UPkaJU5+y8M7k0h/bcowStlX0AQ2Lvs
 +vSUwrHRLPRg9sWBNcEZPHdxLQwIdJgt9qZUXrpEaJHm0Pg+2mOAUNj0DtKmU5VnMH18vuS4n9W
 FocsO2FxsojIkiMTklJ2FkgWsuSIUDhz5vGOYx2s043jiVHXR92PDUqnulsYFxpUspxpL7rEXcy
 DYyi4/eMbf/CrxIZY7kD8v+uQjMq6Q+3Qy4II5bXGVTskUCcIb51q3Zq2IX+VAqA1wWnDuQzgXN
 3kAX7HE8P0JgzdMzPhNQFSIEQd2MGWT5gRthtSQCefBys7/dU6qj6A/wCZJnQiI0EL5qmY4bUpb
 lYnj7eqKY0qTTuSto2gw134+b3p4bFlXm3OMh2TccyuP6bSEObNVRMc7Pjn1OzKjf74QqJhvigy
 DG0LVeI5QImMr82hCS6pP/VFpht0wUC3Rg0J69JqfZYyqJMVrUK94d9i7SYU/qeZGdHS11vB+Hq
 1SG5utFD1karKNM7ei6P1uqFCBGBrn7LiUlipESO3YFEOHrrB6NZZysJzGuuSMd9uhDFZXhemjE
 bTAQKsYvwbUr7hQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 160 +++++++++++++++++------------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1b5dc5b8cecb94cc1ac637cb929ab0d25eeb0b7c..e2601ea4ce42936d53a6df50492a3f361a44ef53 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -51,23 +51,23 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD0>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
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
@@ -75,171 +75,171 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_100>;
-			power-domains = <&CPU_PD1>;
+			next-level-cache = <&l2_100>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
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
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
-			next-level-cache = <&L2_200>;
-			power-domains = <&CPU_PD2>;
+			next-level-cache = <&l2_200>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
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
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
-			next-level-cache = <&L2_300>;
-			power-domains = <&CPU_PD3>;
+			next-level-cache = <&l2_300>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 0>;
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
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
-			next-level-cache = <&L2_400>;
-			power-domains = <&CPU_PD4>;
+			next-level-cache = <&l2_400>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 1>;
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
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
-			next-level-cache = <&L2_500>;
-			power-domains = <&CPU_PD5>;
+			next-level-cache = <&l2_500>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 1>;
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
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x600>;
 			enable-method = "psci";
-			next-level-cache = <&L2_600>;
-			power-domains = <&CPU_PD6>;
+			next-level-cache = <&l2_600>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 1>;
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
 			compatible = "qcom,kryo780";
 			reg = <0x0 0x700>;
 			enable-method = "psci";
-			next-level-cache = <&L2_700>;
-			power-domains = <&CPU_PD7>;
+			next-level-cache = <&l2_700>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;
 			clocks = <&cpufreq_hw 2>;
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
@@ -247,7 +247,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -257,7 +257,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -269,7 +269,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
@@ -277,7 +277,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 				min-residency-us = <5309>;
 			};
 
-			CLUSTER_SLEEP_1: cluster-sleep-1 {
+			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2700>;
@@ -323,57 +323,57 @@ psci {
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
-			domain-idle-states = <&CLUSTER_SLEEP_0>, <&CLUSTER_SLEEP_1>;
+			domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>;
 		};
 	};
 
@@ -4354,7 +4354,7 @@ apps_rsc: rsc@17a00000 {
 			qcom,drv-id = <2>;
 			qcom,tcs-config = <ACTIVE_TCS  3>, <SLEEP_TCS   2>,
 					  <WAKE_TCS    2>, <CONTROL_TCS 0>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


