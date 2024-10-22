Return-Path: <linux-arm-msm+bounces-35459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A7F9AB2B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 643E1B23B9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A881C2DD4;
	Tue, 22 Oct 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEI4UYe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB461C2450
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612112; cv=none; b=F3qyKyaC6k9QjK0GepJx+ms9thWY1mHJ+a5nC2svHe9nXjDU5Fx7GbLT5wO0IHmbtjpORA4z1CDFJUjHfM1T7xbE9wwgy6puVZoo+v/sgaiSf9hOY+kxfRh2NDRZ9AqjshopUVUJFxtInqhrDrD2pAUEml7OFnt2sg7PLA76NZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612112; c=relaxed/simple;
	bh=3oTIYYb4b4nxreIU/L4FpYzarm/hAsqtM8HoaLb6Ht0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RkutvolHVYwPooYVVa8kTRjUCfCIOgZPIE2Mz/8p8iexKg1+kqU38/owAfrK/VG02F1TRpindTkUKi3eeqtmNGODB2qwTlUhxW2rFAenFLxnMJE5R/11xe5qHV1PsE7SWHoxpqlyW5eXjDj8w36cXsd4b5GwAIkZvIgQZ9+XF0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEI4UYe+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9589ba577so855951a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612107; x=1730216907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmJRSLtiQdMr2QAot7YiWB738DRrdrJiQ7IAgGIibUs=;
        b=TEI4UYe+zqy0B8CKzD7qM6p3TM+p1OoAhRINTLAqb4FC5I7mCcAOOqeYpZV1o24uYv
         GYlxvabUnx0S9SUZGGGawLM29wL9bd9BfEvb2RrFTrytAGJ/1XhyIkG8AVktUEnVEYMv
         4BJZzYZ9x8cnjybzhLzW3j7Xt79Zb0eKSIgAIpbJJ+OiJAMLftvPAuz87EdFl3X8uVdw
         DIIl0Tmjjz57fdzwyrpUGVtXesfz+dRxwBPq60m4bb9ajcJ22AgM6DqyfTDPQGSFp/gf
         /4crwmovtA4pbudUtCf8qsgXdkC9xhPIPW+nFBP5+CQhDoyLJbROnZA2YNDaPATBgrz4
         c/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612107; x=1730216907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmJRSLtiQdMr2QAot7YiWB738DRrdrJiQ7IAgGIibUs=;
        b=KmH0ziWZBVtIbiatsjVplU8IcXIlIpC3DSMbqZI6XXbsRtHfUbArMGap5BUF8d/JKs
         D65GeckH5Vnpdmgeg13gcVLMqi93zMMvRooYxqYiSCQunhDdr1TC7HqCKfHoaB2OSWG9
         jZs4tAYB8RwvcZjuZE2QARxMGlaP+5AzT1iFcqaix//JkhOH+7LeAia5rxYjlNixw3+K
         174JtGst6ID9zsgAYu+DQRbvmu2/In+DJOrt5ZyQEaGEMuxTH8gdrUFQkMFvcJ8YAmbw
         YdOKZPsTWO3q55ES5MxuTTTbypl1vn6wF9bMrxQRDSrx63u4tSUny0BQjc4cqiW3vhze
         n8gQ==
X-Gm-Message-State: AOJu0YxpyphE0+UAyjXd53H0usX2BFDqxaEYmGJM2ns2FsM8q5XL6pMC
	YwlDwAkT3CBSJKfAH3RXJAD5NWbwKDCaWa85LZA4MOY2cScJ6l2yHCIqbn4g2d0=
X-Google-Smtp-Source: AGHT+IF2fX/3QEoXBeZ2g/1Frb4fm3Ue6Po8nC7/5kNxRWZXmfoKRhAq0MgfDxazypzXuk9vi7vSQw==
X-Received: by 2002:a05:6402:2696:b0:5c8:aecf:8e87 with SMTP id 4fb4d7f45d1cf-5ca0af85c41mr5616972a12.9.1729612106850;
        Tue, 22 Oct 2024 08:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:42 +0200
Subject: [PATCH v3 17/18] arm64: dts: qcom: change labels to lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-17-0505bc7d2c56@linaro.org>
References: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
In-Reply-To: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=48631;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3oTIYYb4b4nxreIU/L4FpYzarm/hAsqtM8HoaLb6Ht0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kjTLpkNLRHdBUg8u2QcS8TS3e+lCEiErwey
 ntaT2DSE4WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJIwAKCRDBN2bmhouD
 10zeD/4vSwbUoYdlkueLuwsWZS/zmu3+IpFZhj2S+cRTNKEm2XJ9O4Cl1R3WuhKVhv6B/rHJ2rH
 mN2YYTPXiTEqaHy/Rog3No0prVU2hHQrHPwNQ+R2Za3S5VjkQlcll6xdtvr0pCpFeHP5/PDd4q5
 13zvPrAISm7NUo5UWURqnQRvbaAEvy3uX1kWE586MolCxOh/QZhJy45kPHgKqXAI8R5M8Eqj5FA
 bufsNiBS3HnVc/FED6HvgrO967tG3tM4KzfiFEE/r0MRyvd59P/ZcphM+kj/gPCwnHLK/tyGuYd
 xdFVM4JoyPpLPwbCpFInZnXTCsbVEx0sSDr5MFtjAPPb3JN1QJunx/Qb3QpuPZd2YOb+Gj2tlxs
 HP3RmK/7KTl8euC98qJLSKUPXNVkdXatRroQ9Zqwrxeclq3ArIVVfFamaafjy+ABZogcA1ti6RN
 YK1b1ktDitP3FoDSnyG4nSn5nbyYhEMtE9vepPmeDYwrdnLvLcQe4El9e8ppM5zQKePg06M6We3
 QG7O4ac1/IkiUXOOz96Wsw3A84KXceXQS6alGcbiilciF/Ww4WjOlE3QNnkr/lEtsH3TWUdckBA
 Sd0ex9iHezGjNCcDw+ncinUyV19JJmmjUzcgy/Z/8LewJMUf1TCBIa54wTEuLSrElhxpDjrfJQb
 2aL9XVymszrl8rw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi    |  68 +++++------
 arch/arm64/boot/dts/qcom/qcs404.dtsi     |  68 +++++------
 arch/arm64/boot/dts/qcom/qdu1000.dtsi    |  86 ++++++-------
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |  14 +--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi    | 188 ++++++++++++++--------------
 arch/arm64/boot/dts/qcom/sdx75.dtsi      |  90 +++++++-------
 arch/arm64/boot/dts/qcom/x1e80100.dtsi   | 202 +++++++++++++++----------------
 7 files changed, 358 insertions(+), 358 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 79bc42ffb6a1ffa257b4c2efd744bb390362ded3..f0746123e594d5ce5cc314c956eaca11556a9211 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -42,7 +42,7 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
@@ -50,18 +50,18 @@ CPU0: cpu@0 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU1: cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
@@ -69,13 +69,13 @@ CPU1: cpu@1 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 		};
 
-		CPU2: cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
@@ -83,13 +83,13 @@ CPU2: cpu@2 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 		};
 
-		CPU3: cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
@@ -97,34 +97,34 @@ CPU3: cpu@3 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
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
 			};
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP: cluster-sleep-0 {
+			cluster_sleep: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <800>;
@@ -136,7 +136,7 @@ CLUSTER_SLEEP: cluster-sleep-0 {
 		idle-states {
 			entry-method = "psci";
 
-			CPU_SLEEP: cpu-sleep-0 {
+			cpu_sleep: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -174,34 +174,34 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_SLEEP>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_SLEEP>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_SLEEP>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_SLEEP>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_sleep>;
 		};
 
-		CLUSTER_PD: power-domain-cpu-cluster {
+		cluster_pd: power-domain-cpu-cluster {
 			#power-domain-cells = <0>;
 			power-domains = <&mpm>;
-			domain-idle-states = <&CLUSTER_SLEEP>;
+			domain-idle-states = <&cluster_sleep>;
 		};
 	};
 
@@ -2067,7 +2067,7 @@ lmh_cluster: lmh@f550800 {
 			compatible = "qcom,qcm2290-lmh", "qcom,sm8150-lmh";
 			reg = <0x0 0x0f550800 0x0 0x400>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			cpus = <&CPU0>;
+			cpus = <&cpu0>;
 			qcom,lmh-temp-arm-millicelsius = <65000>;
 			qcom,lmh-temp-low-millicelsius = <94500>;
 			qcom,lmh-temp-high-millicelsius = <95000>;
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index cddc16bac0cea4a95e65d1849fe84f34c6ddbfce..215ba146207afd25128692781926cf1964743655 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -36,13 +36,13 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		CPU0: cpu@100 {
+		cpu0: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x100>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0>;
-			next-level-cache = <&L2_0>;
+			cpu-idle-states = <&cpu_sleep_0>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
@@ -50,13 +50,13 @@ CPU0: cpu@100 {
 			power-domain-names = "cpr";
 		};
 
-		CPU1: cpu@101 {
+		cpu1: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x101>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0>;
-			next-level-cache = <&L2_0>;
+			cpu-idle-states = <&cpu_sleep_0>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
@@ -64,13 +64,13 @@ CPU1: cpu@101 {
 			power-domain-names = "cpr";
 		};
 
-		CPU2: cpu@102 {
+		cpu2: cpu@102 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x102>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0>;
-			next-level-cache = <&L2_0>;
+			cpu-idle-states = <&cpu_sleep_0>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
@@ -78,13 +78,13 @@ CPU2: cpu@102 {
 			power-domain-names = "cpr";
 		};
 
-		CPU3: cpu@103 {
+		cpu3: cpu@103 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x103>;
 			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0>;
-			next-level-cache = <&L2_0>;
+			cpu-idle-states = <&cpu_sleep_0>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
@@ -92,7 +92,7 @@ CPU3: cpu@103 {
 			power-domain-names = "cpr";
 		};
 
-		L2_0: l2-cache {
+		l2_0: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
@@ -101,7 +101,7 @@ L2_0: l2-cache {
 		idle-states {
 			entry-method = "psci";
 
-			CPU_SLEEP_0: cpu-sleep-0 {
+			cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "standalone-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -1679,10 +1679,10 @@ cluster_crit: cluster-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cluster_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -1712,10 +1712,10 @@ cpu0_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu0_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -1745,10 +1745,10 @@ cpu1_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu1_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -1778,10 +1778,10 @@ cpu2_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu2_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -1811,10 +1811,10 @@ cpu3_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu3_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						       <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						       <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index bc1d37b3f6f04d629c96fa893daf4d91fb5f406e..47c0dd31aaf2e42d6d85411956207b2509a605b0 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -25,22 +25,22 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			qcom,freq-domains = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_0>;
-			L2_0: l2-cache {
+			next-level-cache = <&l2_0>;
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
@@ -48,76 +48,76 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			qcom,freq-domains = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_100>;
-			L2_100: l2-cache {
+			next-level-cache = <&l2_100>;
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
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			qcom,freq-domains = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_200>;
-			L2_200: l2-cache {
+			next-level-cache = <&l2_200>;
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
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x300>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			qcom,freq-domains = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_300>;
-			L2_300: l2-cache {
+			next-level-cache = <&l2_300>;
+			l2_300: l2-cache {
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
 			};
 		};
@@ -126,7 +126,7 @@ core3 {
 	idle-states {
 		entry-method = "psci";
 
-		CPU_OFF: cpu-sleep-0 {
+		cpu_off: cpu-sleep-0 {
 			compatible = "arm,idle-state";
 			entry-latency-us = <274>;
 			exit-latency-us = <480>;
@@ -137,7 +137,7 @@ CPU_OFF: cpu-sleep-0 {
 	};
 
 	domain-idle-states {
-		CLUSTER_SLEEP_0: cluster-sleep-0 {
+		cluster_sleep_0: cluster-sleep-0 {
 			compatible = "domain-idle-state";
 			entry-latency-us = <584>;
 			exit-latency-us = <2332>;
@@ -145,7 +145,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 			arm,psci-suspend-param = <0x41000044>;
 		};
 
-		CLUSTER_SLEEP_1: cluster-sleep-1 {
+		cluster_sleep_1: cluster-sleep-1 {
 			compatible = "domain-idle-state";
 			entry-latency-us = <2893>;
 			exit-latency-us = <4023>;
@@ -187,33 +187,33 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off>;
 		};
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0 &CLUSTER_SLEEP_1>;
+			domain-idle-states = <&cluster_sleep_0 &cluster_sleep_1>;
 		};
 	};
 
@@ -1499,7 +1499,7 @@ apps_rsc: rsc@17a00000 {
 			qcom,tcs-config = <ACTIVE_TCS    2>, <SLEEP_TCS     3>,
 					  <WAKE_TCS      3>, <CONTROL_TCS   0>;
 			label = "apps_rsc";
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index e19790464a1159d3ab6e788b8aa22adaa52c56d3..7a789b41c2f1887f0c41ae24da2e2fe8915ab13c 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -24,7 +24,7 @@ chosen {
 	};
 
 	clocks {
-		clk40M: can-clk {
+		clk40m: can-clk {
 			compatible = "fixed-clock";
 			clock-frequency = <40000000>;
 			#clock-cells = <0>;
@@ -188,23 +188,23 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
-&CPU_PD0 {
+&cpu_pd0 {
 	/delete-property/ power-domains;
 };
 
-&CPU_PD1 {
+&cpu_pd1 {
 	/delete-property/ power-domains;
 };
 
-&CPU_PD2 {
+&cpu_pd2 {
 	/delete-property/ power-domains;
 };
 
-&CPU_PD3 {
+&cpu_pd3 {
 	/delete-property/ power-domains;
 };
 
-/delete-node/ &CLUSTER_PD;
+/delete-node/ &cluster_pd;
 
 &gpi_dma0 {
 	status = "okay";
@@ -541,7 +541,7 @@ can@0 {
 		compatible = "microchip,mcp2518fd";
 		reg = <0>;
 		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk40M>;
+		clocks = <&clk40m>;
 		spi-max-frequency = <10000000>;
 		vdd-supply = <&vdc_5v>;
 		xceiver-supply = <&vdc_5v>;
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 07b3d9f656840357a4ab16ddbd0931da45127e61..036ae4306234f34577d53c7e4528a6adbde5df23 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -38,21 +38,21 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
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
@@ -60,72 +60,72 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_1: l2-cache {
+			l2_1: l2-cache {
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
 			compatible = "qcom,kryo";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_2>;
+			next-level-cache = <&l2_2>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_2: l2-cache {
+			l2_2: l2-cache {
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
 			compatible = "qcom,kryo";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			next-level-cache = <&L2_3>;
+			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_3: l2-cache {
+			l2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU4: cpu@10000 {
+		cpu4: cpu@10000 {
 			device_type = "cpu";
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			next-level-cache = <&L2_4>;
+			next-level-cache = <&l2_4>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_4: l2-cache {
+			l2_4: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
-				next-level-cache = <&L3_1>;
-				L3_1: l3-cache {
+				next-level-cache = <&l3_1>;
+				l3_1: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
@@ -134,91 +134,91 @@ L3_1: l3-cache {
 			};
 		};
 
-		CPU5: cpu@10100 {
+		cpu5: cpu@10100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			next-level-cache = <&L2_5>;
+			next-level-cache = <&l2_5>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_5: l2-cache {
+			l2_5: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
-				next-level-cache = <&L3_1>;
+				next-level-cache = <&l3_1>;
 			};
 		};
 
-		CPU6: cpu@10200 {
+		cpu6: cpu@10200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			next-level-cache = <&L2_6>;
+			next-level-cache = <&l2_6>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_6: l2-cache {
+			l2_6: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
-				next-level-cache = <&L3_1>;
+				next-level-cache = <&l3_1>;
 			};
 		};
 
-		CPU7: cpu@10300 {
+		cpu7: cpu@10300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			next-level-cache = <&L2_7>;
+			next-level-cache = <&l2_7>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			L2_7: l2-cache {
+			l2_7: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
-				next-level-cache = <&L3_1>;
+				next-level-cache = <&l3_1>;
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
 			};
 
 			cluster1 {
 				core0 {
-					cpu = <&CPU4>;
+					cpu = <&cpu4>;
 				};
 
 				core1 {
-					cpu = <&CPU5>;
+					cpu = <&cpu5>;
 				};
 
 				core2 {
-					cpu = <&CPU6>;
+					cpu = <&cpu6>;
 				};
 
 				core3 {
-					cpu = <&CPU7>;
+					cpu = <&cpu7>;
 				};
 			};
 		};
@@ -226,7 +226,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			GOLD_CPU_SLEEP_0: cpu-sleep-0 {
+			gold_cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -236,7 +236,7 @@ GOLD_CPU_SLEEP_0: cpu-sleep-0 {
 				local-timer-stop;
 			};
 
-			GOLD_RAIL_CPU_SLEEP_0: cpu-sleep-1 {
+			gold_rail_cpu_sleep_0: cpu-sleep-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -248,7 +248,7 @@ GOLD_RAIL_CPU_SLEEP_0: cpu-sleep-1 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_GOLD: cluster-sleep-0 {
+			cluster_sleep_gold: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
@@ -256,7 +256,7 @@ CLUSTER_SLEEP_GOLD: cluster-sleep-0 {
 				min-residency-us = <6118>;
 			};
 
-			CLUSTER_SLEEP_APSS_RSC_PC: cluster-sleep-1 {
+			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x42000144>;
 				entry-latency-us = <3263>;
@@ -394,77 +394,77 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>,
-					     <&GOLD_RAIL_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&gold_cpu_sleep_0>,
+					     <&gold_rail_cpu_sleep_0>;
 		};
 
-		CLUSTER_0_PD: power-domain-cluster0 {
+		cluster_0_pd: power-domain-cluster0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_2_PD>;
-			domain-idle-states = <&CLUSTER_SLEEP_GOLD>;
+			power-domains = <&cluster_2_pd>;
+			domain-idle-states = <&cluster_sleep_gold>;
 		};
 
-		CLUSTER_1_PD: power-domain-cluster1 {
+		cluster_1_pd: power-domain-cluster1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_2_PD>;
-			domain-idle-states = <&CLUSTER_SLEEP_GOLD>;
+			power-domains = <&cluster_2_pd>;
+			domain-idle-states = <&cluster_sleep_gold>;
 		};
 
-		CLUSTER_2_PD: power-domain-cluster2 {
+		cluster_2_pd: power-domain-cluster2 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_APSS_RSC_PC>;
+			domain-idle-states = <&cluster_sleep_apss_rsc_pc>;
 		};
 	};
 
@@ -2613,7 +2613,7 @@ aoss_cti: cti@4b13000 {
 		etm@6040000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6040000 0x0 0x1000>;
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2633,7 +2633,7 @@ etm0_out: endpoint {
 		etm@6140000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6140000 0x0 0x1000>;
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2653,7 +2653,7 @@ etm1_out: endpoint {
 		etm@6240000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6240000 0x0 0x1000>;
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2673,7 +2673,7 @@ etm2_out: endpoint {
 		etm@6340000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6340000 0x0 0x1000>;
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2693,7 +2693,7 @@ etm3_out: endpoint {
 		etm@6440000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6440000 0x0 0x1000>;
-			cpu = <&CPU4>;
+			cpu = <&cpu4>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2713,7 +2713,7 @@ etm4_out: endpoint {
 		etm@6540000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6540000 0x0 0x1000>;
-			cpu = <&CPU5>;
+			cpu = <&cpu5>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2733,7 +2733,7 @@ etm5_out: endpoint {
 		etm@6640000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6640000 0x0 0x1000>;
-			cpu = <&CPU6>;
+			cpu = <&cpu6>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2753,7 +2753,7 @@ etm6_out: endpoint {
 		etm@6740000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6740000 0x0 0x1000>;
-			cpu = <&CPU7>;
+			cpu = <&cpu7>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 7cf3fcb469a8682f0898f5d66d4ec0964cd0c80f..5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -43,25 +43,25 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 
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
@@ -69,85 +69,85 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_100>;
+			next-level-cache = <&l2_100>;
 
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
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_200>;
+			next-level-cache = <&l2_200>;
 
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
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x300>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			next-level-cache = <&L2_300>;
+			next-level-cache = <&l2_300>;
 
-			L2_300: l2-cache {
+			l2_300: l2-cache {
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
 			};
 		};
@@ -155,7 +155,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			CPU_OFF: cpu-sleep-0 {
+			cpu_off: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				entry-latency-us = <235>;
 				exit-latency-us = <428>;
@@ -164,7 +164,7 @@ CPU_OFF: cpu-sleep-0 {
 				local-timer-stop;
 			};
 
-			CPU_RAIL_OFF: cpu-rail-sleep-1 {
+			cpu_rail_off: cpu-rail-sleep-1 {
 				compatible = "arm,idle-state";
 				entry-latency-us = <800>;
 				exit-latency-us = <750>;
@@ -176,7 +176,7 @@ CPU_RAIL_OFF: cpu-rail-sleep-1 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
@@ -184,7 +184,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 				min-residency-us = <5309>;
 			};
 
-			CLUSTER_SLEEP_1: cluster-sleep-1 {
+			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41001344>;
 				entry-latency-us = <2761>;
@@ -192,7 +192,7 @@ CLUSTER_SLEEP_1: cluster-sleep-1 {
 				min-residency-us = <8467>;
 			};
 
-			CLUSTER_SLEEP_2: cluster-sleep-2 {
+			cluster_sleep_2: cluster-sleep-2 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100b344>;
 				entry-latency-us = <2793>;
@@ -235,33 +235,33 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF &CPU_RAIL_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off &cpu_rail_off>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF &CPU_RAIL_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off &cpu_rail_off>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF &CPU_RAIL_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off &cpu_rail_off>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&CPU_OFF &CPU_RAIL_OFF>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&cpu_off &cpu_rail_off>;
 		};
 
-		CLUSTER_PD: power-domain-cpu-cluster0 {
+		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0 &CLUSTER_SLEEP_1 &CLUSTER_SLEEP_2>;
+			domain-idle-states = <&cluster_sleep_0 &cluster_sleep_1 &cluster_sleep_2>;
 		};
 	};
 
@@ -1444,7 +1444,7 @@ apps_rsc: rsc@17a00000 {
 				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 			qcom,tcs-offset = <0xd00>;
 			qcom,drv-id = <2>;
 			qcom,tcs-config = <ACTIVE_TCS    3>,
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index bc3c7294abc37054f9f782b3c5285444df206430..99f8bee10a38b6659771a7175be4240239683e50 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -65,208 +65,208 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD0>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD1>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD2>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			power-domains = <&CPU_PD3>;
+			next-level-cache = <&l2_0>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU4: cpu@10000 {
+		cpu4: cpu@10000 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD4>;
+			next-level-cache = <&l2_1>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 
-			L2_1: l2-cache {
+			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU5: cpu@10100 {
+		cpu5: cpu@10100 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD5>;
+			next-level-cache = <&l2_1>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU6: cpu@10200 {
+		cpu6: cpu@10200 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD6>;
+			next-level-cache = <&l2_1>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU7: cpu@10300 {
+		cpu7: cpu@10300 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
-			power-domains = <&CPU_PD7>;
+			next-level-cache = <&l2_1>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU8: cpu@20000 {
+		cpu8: cpu@20000 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
-			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD8>;
+			next-level-cache = <&l2_2>;
+			power-domains = <&cpu_pd8>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 
-			L2_2: l2-cache {
+			l2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU9: cpu@20100 {
+		cpu9: cpu@20100 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
-			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD9>;
+			next-level-cache = <&l2_2>;
+			power-domains = <&cpu_pd9>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU10: cpu@20200 {
+		cpu10: cpu@20200 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
-			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD10>;
+			next-level-cache = <&l2_2>;
+			power-domains = <&cpu_pd10>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
 		};
 
-		CPU11: cpu@20300 {
+		cpu11: cpu@20300 {
 			device_type = "cpu";
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
-			next-level-cache = <&L2_2>;
-			power-domains = <&CPU_PD11>;
+			next-level-cache = <&l2_2>;
+			power-domains = <&cpu_pd11>;
 			power-domain-names = "psci";
-			cpu-idle-states = <&CLUSTER_C4>;
+			cpu-idle-states = <&cluster_c4>;
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
 			};
 
 			cluster1 {
 				core0 {
-					cpu = <&CPU4>;
+					cpu = <&cpu4>;
 				};
 
 				core1 {
-					cpu = <&CPU5>;
+					cpu = <&cpu5>;
 				};
 
 				core2 {
-					cpu = <&CPU6>;
+					cpu = <&cpu6>;
 				};
 
 				core3 {
-					cpu = <&CPU7>;
+					cpu = <&cpu7>;
 				};
 			};
 
 			cluster2 {
 				core0 {
-					cpu = <&CPU8>;
+					cpu = <&cpu8>;
 				};
 
 				core1 {
-					cpu = <&CPU9>;
+					cpu = <&cpu9>;
 				};
 
 				core2 {
-					cpu = <&CPU10>;
+					cpu = <&cpu10>;
 				};
 
 				core3 {
-					cpu = <&CPU11>;
+					cpu = <&cpu11>;
 				};
 			};
 		};
@@ -274,7 +274,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			CLUSTER_C4: cpu-sleep-0 {
+			cluster_c4: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "ret";
 				arm,psci-suspend-param = <0x00000004>;
@@ -285,7 +285,7 @@ CLUSTER_C4: cpu-sleep-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_CL4: cluster-sleep-0 {
+			cluster_cl4: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x01000044>;
 				entry-latency-us = <350>;
@@ -293,7 +293,7 @@ CLUSTER_CL4: cluster-sleep-0 {
 				min-residency-us = <2500>;
 			};
 
-			CLUSTER_CL5: cluster-sleep-1 {
+			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2200>;
@@ -339,85 +339,85 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD0>;
+			power-domains = <&cluster_pd0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD0>;
+			power-domains = <&cluster_pd0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD0>;
+			power-domains = <&cluster_pd0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD0>;
+			power-domains = <&cluster_pd0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD1>;
+			power-domains = <&cluster_pd1>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD1>;
+			power-domains = <&cluster_pd1>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD1>;
+			power-domains = <&cluster_pd1>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD1>;
+			power-domains = <&cluster_pd1>;
 		};
 
-		CPU_PD8: power-domain-cpu8 {
+		cpu_pd8: power-domain-cpu8 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD2>;
+			power-domains = <&cluster_pd2>;
 		};
 
-		CPU_PD9: power-domain-cpu9 {
+		cpu_pd9: power-domain-cpu9 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD2>;
+			power-domains = <&cluster_pd2>;
 		};
 
-		CPU_PD10: power-domain-cpu10 {
+		cpu_pd10: power-domain-cpu10 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD2>;
+			power-domains = <&cluster_pd2>;
 		};
 
-		CPU_PD11: power-domain-cpu11 {
+		cpu_pd11: power-domain-cpu11 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD2>;
+			power-domains = <&cluster_pd2>;
 		};
 
-		CLUSTER_PD0: power-domain-cpu-cluster0 {
+		cluster_pd0: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
-			power-domains = <&SYSTEM_PD>;
+			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
+			power-domains = <&system_pd>;
 		};
 
-		CLUSTER_PD1: power-domain-cpu-cluster1 {
+		cluster_pd1: power-domain-cpu-cluster1 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
-			power-domains = <&SYSTEM_PD>;
+			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
+			power-domains = <&system_pd>;
 		};
 
-		CLUSTER_PD2: power-domain-cpu-cluster2 {
+		cluster_pd2: power-domain-cpu-cluster2 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
-			power-domains = <&SYSTEM_PD>;
+			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
+			power-domains = <&system_pd>;
 		};
 
-		SYSTEM_PD: power-domain-system {
+		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			/* TODO: system-wide idle states */
 		};
@@ -5802,7 +5802,7 @@ apps_rsc: rsc@17500000 {
 					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
 
 			label = "apps_rsc";
-			power-domains = <&SYSTEM_PD>;
+			power-domains = <&system_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


