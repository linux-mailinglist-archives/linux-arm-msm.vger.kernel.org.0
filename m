Return-Path: <linux-arm-msm+bounces-30025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E09644F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5AD284594
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943EC1B652F;
	Thu, 29 Aug 2024 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awbaOqi5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C451B78EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934931; cv=none; b=gxbQQ7OWoPOM93IYRYUQEMZo1fLyG+wU+1IqmbTXmwf5c6rtM9l+q8Qau8l0lJ+322PSkigiHBjZJ18Ov3HcL7PP3dc8ALgXzpgHtED5uNQPUZilzktLg7xQAkbL2cQ0FD0oDpL+y9j/GGqvPQnLfGQhhfoOXVT0Gp3wCJQ+Vv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934931; c=relaxed/simple;
	bh=hbF4W474/rM1Njc/j654Kx894535K4VGuRjJv3Mv3Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4ghIw31MqofAITvdk2pm53CeB+WH8g9/eYCcUn1VzEIHNh7wdqn2YxwlNJtZrBWbolFwu6FyV7XOrPh0FBhFzXjKN7mU6YRsIiSkvb6W0MHZGjRmyGRFQc3ThJ8OV2XTmTK3IqwVcBBn4DqvruUSN1uKFr2EO+j6sTeYa7z/PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awbaOqi5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280692835dso930465e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934925; x=1725539725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSscfjVFtasb4joWjMRcSG5TD5wbrXL4uZUEiYb6R7o=;
        b=awbaOqi5xw/PFzExbBmQ8adklNOF6ScRU+BoDTIglIo2oE5mLC2Yy5/3JSadu5DmU5
         OryufVpjJWm56MLmuTY3CgYamWq123vbLQov04rtE9HCdCxdxVHWnzoPlZcxJzLkIcMw
         UYgeSBBWdKrnIuEDB4OJ7xMiXWK72Up1H5aMfNvxnVIf4xxcxQc4gI0Mv7rE2D/uf/q0
         GEcqkaxYq74eUk92Yvyrk1bNmewj09dEBAH/DDDPLsiSrJlBBVbuuY0fNCXQJ90vx79j
         tdml4pfrYU1dQOUSPKgie9gmEnZzAVaYx3f80WA59ZhZ7Kbw0z4sOQe8oNu3tgRCMrEY
         ECUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934925; x=1725539725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSscfjVFtasb4joWjMRcSG5TD5wbrXL4uZUEiYb6R7o=;
        b=K34lsosPOYfrFCp6ToZRVmiRo/vCAdMG6/No5BfafDXKFM1Jh5aK8TGa3sC2rK5cda
         CcGbuJHaBcVzziHuGZdNnMHNWmlIuZf1v6a8ToWtNqE52irxf6RdSH/T0bvqPyiODA5e
         GiHMuebRPCVeWbVXQpW2iALXC8vFwOyS7YvaweznsQNOsBGlvjYamaEweqkxJPh7U3i2
         3SgFmtSU9pmTOvSEaH5ETKbwhZEx3cGzxOrNthkSW1Nig30VOstqvy6sEchW8NrWPdkj
         E95SZcqDN8BYmyUpePo3A+E66Wo1cMBuTHjNyAnsr4850A7E84heQaW5Rzwg5GcGq6GR
         zk3A==
X-Gm-Message-State: AOJu0YwH2l6fzh2KxYq1PT0P/XwmULlqzp2H0Lb/haRXTc9kOcsOrDMG
	DHKK6KZ+LdSRTK9f2TQe5/I+Cd3ICIHnk2eos+59u7qal8J+scHeGYRD19SHSEQ=
X-Google-Smtp-Source: AGHT+IGVMnCm2/gJxNLgZ+3JabVcfOe8RQGX3d4eOhrvXfJ66RiAcsCw3d/GoGRq20IepXV8uG4G8A==
X-Received: by 2002:a05:6000:1f89:b0:367:9cf7:6df8 with SMTP id ffacd0b85a97d-3749b546b5fmr1159676f8f.2.1724934925435;
        Thu, 29 Aug 2024 05:35:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 29 Aug 2024 14:34:49 +0200
Subject: [PATCH v2 14/17] arm64: dts: qcom: sm8650: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-dts-qcom-label-v2-14-5deaada3e6b2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11128;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=hbF4W474/rM1Njc/j654Kx894535K4VGuRjJv3Mv3Fw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0GrydMvAc6kjtxDmyOSR44BVJj8EcyLX45M/y
 Eb5KZpAQ0eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq8gAKCRDBN2bmhouD
 13TsD/9X8JDVj86DOwYNUCfaB96mB79nORY+tVY6f0o/g9RmN7izj3ATHKTbwoOMMk11+LS6l6V
 SgjuFn9NclNzZi9w3LoGpYeKyPF0RlWfqmRkVW+m+4m0O+MzSF5Uol5ywcxp6bPPDLz+UT8oeqV
 WmTHuZW4g4faHSdn9q0d8ZmTMDcohBSZhA+MqOJvqTBWXTKjFGGFaR/VxuNGlMzRrgttwWv92JI
 1Z10ntEo2goiXhFyafNYKDS6tfHxGNb1r8WT9aQQlfBaYrznm4mGcoj81yWuwq80VQ3D8zjb3Rz
 tdTW9Y4opHEAyqiT+kQV7lLhSfOT2dOcaHkAbWXs/d0LDwFjZLc5UqKEQIgKr6aIAdrGgc+n1RZ
 CfhCZ4s9y3fQ1xeIrGQIFbA9/UY63/Ea7HxVEgXRgioWO2VXIE7gVMA5s7Y4FZupMBqNGizPHS9
 Tdq2DF9fmeykM1i+P1guxA6qDf9WcyICVHFdJgx2w+oT1iDeivWbfeSmCEGg5zpugEOWd/oj74z
 ysfvu9EaQNa+qwp5S1o07ooVfeOI0CW2SFjl5Wl4j9rvkpHKtoyVLvs68ZFZdq1Uz/5DmNaQXvJ
 /IMfirFif+WCsM6nml/Kzzi5FkuhDDSJTW+DvD58oRKwc85uSUAEvRip5VieBtob3yQSOEs1WS5
 kadZxbLK1KGS30g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 156 +++++++++++++++++------------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa6..d0392a3f56d3 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -68,18 +68,18 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a520";
 			reg = <0 0>;
 
 			clocks = <&cpufreq_hw 0>;
 
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 
@@ -87,13 +87,13 @@ CPU0: cpu@0 {
 
 			#cooling-cells = <2>;
 
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 
-				L3_0: l3-cache {
+				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
@@ -101,18 +101,18 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a520";
 			reg = <0 0x100>;
 
 			clocks = <&cpufreq_hw 0>;
 
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 
@@ -121,18 +121,18 @@ CPU1: cpu@100 {
 			#cooling-cells = <2>;
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a720";
 			reg = <0 0x200>;
 
 			clocks = <&cpufreq_hw 3>;
 
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_200>;
+			next-level-cache = <&l2_200>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <238>;
 
@@ -140,26 +140,26 @@ CPU2: cpu@200 {
 
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
 			compatible = "arm,cortex-a720";
 			reg = <0 0x300>;
 
 			clocks = <&cpufreq_hw 3>;
 
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_200>;
+			next-level-cache = <&l2_200>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <238>;
 
@@ -168,18 +168,18 @@ CPU3: cpu@300 {
 			#cooling-cells = <2>;
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a720";
 			reg = <0 0x400>;
 
 			clocks = <&cpufreq_hw 3>;
 
-			power-domains = <&CPU_PD4>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_400>;
+			next-level-cache = <&l2_400>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <238>;
 
@@ -187,26 +187,26 @@ CPU4: cpu@400 {
 
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
 			compatible = "arm,cortex-a720";
 			reg = <0 0x500>;
 
 			clocks = <&cpufreq_hw 1>;
 
-			power-domains = <&CPU_PD5>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_500>;
+			next-level-cache = <&l2_500>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <238>;
 
@@ -214,26 +214,26 @@ CPU5: cpu@500 {
 
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
 			compatible = "arm,cortex-a720";
 			reg = <0 0x600>;
 
 			clocks = <&cpufreq_hw 1>;
 
-			power-domains = <&CPU_PD6>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_600>;
+			next-level-cache = <&l2_600>;
 			capacity-dmips-mhz = <1792>;
 			dynamic-power-coefficient = <238>;
 
@@ -241,26 +241,26 @@ CPU6: cpu@600 {
 
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
 			compatible = "arm,cortex-x4";
 			reg = <0 0x700>;
 
 			clocks = <&cpufreq_hw 2>;
 
-			power-domains = <&CPU_PD7>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 
 			enable-method = "psci";
-			next-level-cache = <&L2_700>;
+			next-level-cache = <&l2_700>;
 			capacity-dmips-mhz = <1894>;
 			dynamic-power-coefficient = <588>;
 
@@ -268,46 +268,46 @@ CPU7: cpu@700 {
 
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
@@ -315,7 +315,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			SILVER_CPU_SLEEP_0: cpu-sleep-0-0 {
+			silver_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -325,7 +325,7 @@ SILVER_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			GOLD_CPU_SLEEP_0: cpu-sleep-1-0 {
+			gold_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -335,7 +335,7 @@ GOLD_CPU_SLEEP_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			GOLD_PLUS_CPU_SLEEP_0: cpu-sleep-2-0 {
+			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-plus-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -347,7 +347,7 @@ GOLD_PLUS_CPU_SLEEP_0: cpu-sleep-2-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
@@ -355,7 +355,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 				min-residency-us = <9144>;
 			};
 
-			CLUSTER_SLEEP_1: cluster-sleep-1 {
+			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2800>;
@@ -411,58 +411,58 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&silver_cpu_sleep_0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&silver_cpu_sleep_0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&silver_cpu_sleep_0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_PLUS_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&gold_plus_cpu_sleep_0>;
 		};
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>,
-					     <&CLUSTER_SLEEP_1>;
+			domain-idle-states = <&cluster_sleep_0>,
+					     <&cluster_sleep_1>;
 		};
 	};
 
@@ -5083,7 +5083,7 @@ apps_rsc: rsc@17a00000 {
 				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			qcom,tcs-offset = <0xd00>;
 			qcom,drv-id = <2>;

-- 
2.43.0


