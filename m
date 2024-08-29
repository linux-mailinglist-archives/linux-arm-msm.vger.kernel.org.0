Return-Path: <linux-arm-msm+bounces-30028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E354964500
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53E09B26763
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B67D1AED2C;
	Thu, 29 Aug 2024 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDkax9aC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D711B86DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934937; cv=none; b=t6O53RNoqP04Dd+D5Ud9yEo09bwUA0DxSEUvge/sLpFuTocXZnKLGLV0FdU3N5LNhhu54IaLqc3LhLg1YypqawTzj/b0CnV30JFTYB3HVs9+GRpfpRoVWvfWdajxdCiZ5/sDw+cEdD+zOEqIq+oT/2UZGUR/hxLqcl6xeWjB/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934937; c=relaxed/simple;
	bh=vZw6ORVL3Jz/blssBbsyIzNrYiwrHNED+PK7Ifqmvwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXiPBZfcmY3lwTu7zVCZNwrEcTg4j9LpjK2RIpCw3dJFTXy9rKNorKwn2a4pJF1q/ourbxuDSRwZzakOunVM0T1NgsRBYdGxLc7no684jRg7I40w5I90RagVBdeMXbEuO0pSknAKkSplGt9OGRLqz3i0F09XQhBnBQrlbwFRdU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDkax9aC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37196229356so10731f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934931; x=1725539731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mL0rUx+gyg7Sqo8fF6KUfn9hO2wFQF1HOYIDqz0XLxc=;
        b=sDkax9aCmM2mJk4+eoXz7c9NLo+PD0rqZlqQswksPPFuSvz7+HuHEM2+WsXp675o70
         mq9iIqcSAMvcR4eJ6eq4tpbT00mCHKjO+joV+SqF4TY0cldu2tKBplN8jXLa2v024qzv
         Yo33HXwyDaUd4jWojeLEcRGd6pResbr/fZHO/VYbqDB3tOrK88y202FbWUfS1rJuQHVt
         2UM+Z3lt461mLlZC3KQs/C6xwA5yXqTr2NLETjIKxN3Ld6/I8Xl9t50ePtQloccB4TEP
         6AxUXgOH9P2dLvT0PuzuYB8oHGP6PlL4Dr78J9hH+GdYhNaBq93fBBueUUOvi6VdDJmP
         eO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934931; x=1725539731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL0rUx+gyg7Sqo8fF6KUfn9hO2wFQF1HOYIDqz0XLxc=;
        b=wH0WmgwtpoMfm3GtcmWqk3223BYiEqHvTRFZqD3FmPMk8jMKePRTDpf+ao88hvi2v7
         YXlUpAn+CBiv7KAlzDMppr9tT8wacMNrd/NVv3zkf+ist+OQivwhYkoVQpJC4sDA41Pu
         1ALdztJRAvJ8GKLNKEdpdHWXG4bAHUCV2tq3kZRcF0CdrKIeXGA0U/md8Ld2DwN73P+M
         /Oom0rEPdeAMEopveu8Q8tLHwWQmex3YXNevQ9sXxyLc8oC05/xUD7LWsBjt7QQv4iCE
         3oiIgiN5Hb0XTfbr3csR3YN9GjhQyweMZyAuAgft6mUNW087cUglA4B7ssFNKVXCoYxx
         BMKg==
X-Gm-Message-State: AOJu0YyrrOvLy8cTFqrz/xqdUvk7XCT5l4f1NsHOy2et7rSivyXZR+wu
	IpmOyF087KpAzW2EsBPZb258HWrJchDYdorLF5N7eEd/rl+UAy1NhaxSwpUZwW4=
X-Google-Smtp-Source: AGHT+IHvnVj/kHBY+xDKgIfgNs6Ov/FXLB52uaFDyE/B32HL86ldp5SHONAOKTf6jNHZcxDE+4Vvjw==
X-Received: by 2002:a5d:6d04:0:b0:36b:36aa:a14e with SMTP id ffacd0b85a97d-3749b599602mr1212364f8f.8.1724934930583;
        Thu, 29 Aug 2024 05:35:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 29 Aug 2024 14:34:52 +0200
Subject: [PATCH v2 17/17] arm64: dts: qcom: change labels to lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-dts-qcom-label-v2-17-5deaada3e6b2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=48247;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vZw6ORVL3Jz/blssBbsyIzNrYiwrHNED+PK7Ifqmvwc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0Gr0IwBCWwhJSdcv0aHGir3rQoyAJqoizRH29
 EHYvi43eV2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq9AAKCRDBN2bmhouD
 1yzpD/wLPrf7YGj3oWkOWct34Xz8lz9CdPHj9b9WTpVYJMcduA+O3mgSNgwnDeAQh9gM1jjejG7
 a1iMC59aeSZv7du3dyySgMRV5sroaLbz/cL0qdr8Z96aa7HyBnYFs8gr1i8/dYlV2MnSr/CsqFT
 QSLPszDRcxsz4xS1YRnkEBeXiASx5A1/W/bk4/cH71qtXoZvWcxnYM5p/8jVn7jS5HnWCYB3HN6
 4L9JnWcYjtZfkb8b716BydzN9FMMbjvbvEWiK2JXSoCMh+YwvNwGQ11hqZobROgEPTUfxvY2rkM
 H5PtZ8hX7p06VJm9VXYuf5Htm/LOB6z2bXTHzlFVOYM9PayfjRmEfzTyl3b2OimUCQatTH5FQxI
 QblwjzDwtImZeLBITH4IzNiHrYJd2BCxulsLQFTJcggULljoHtTdh9fedEEeVPOoZioSbG5i0aV
 c/hxiqNTk0tWUKtNXmf/QLGXXZo6gxxjslgYJNs/1Typ3zkAQ6GHg5xbJB6r+911hpvS0RHd29r
 BHdIpKWfhyfe/4xWagT8nPqpWeYnsdqQT7bCCpvVu4EON6nDXgmUx6/z1CBX79dhz1phaSNtRzg
 zi2XepJsVNmyuGq13po3pjygblnWCRluJ8o9PLhWZQ/7ubefs7nqQ0NvA6K/l9LgMVenuEKUIrA
 1zFhQf55BC+HBwg==
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
index 79bc42ffb6a1..f0746123e594 100644
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
index cddc16bac0ce..215ba146207a 100644
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
index 642ca8f0236b..12f6d92aa0e9 100644
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
 
@@ -1498,7 +1498,7 @@ apps_rsc: rsc@17a00000 {
 			qcom,tcs-config = <ACTIVE_TCS    2>, <SLEEP_TCS     3>,
 					  <WAKE_TCS      3>, <CONTROL_TCS   0>;
 			label = "apps_rsc";
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index e19790464a11..7a789b41c2f1 100644
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
index e8dbc8d820a6..bc6166a2dc76 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -37,21 +37,21 @@ cpus {
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
@@ -59,72 +59,72 @@ L3_0: l3-cache {
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
@@ -133,91 +133,91 @@ L3_1: l3-cache {
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
@@ -225,7 +225,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			GOLD_CPU_SLEEP_0: cpu-sleep-0 {
+			gold_cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -235,7 +235,7 @@ GOLD_CPU_SLEEP_0: cpu-sleep-0 {
 				local-timer-stop;
 			};
 
-			GOLD_RAIL_CPU_SLEEP_0: cpu-sleep-1 {
+			gold_rail_cpu_sleep_0: cpu-sleep-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -247,7 +247,7 @@ GOLD_RAIL_CPU_SLEEP_0: cpu-sleep-1 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_GOLD: cluster-sleep-0 {
+			cluster_sleep_gold: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
@@ -255,7 +255,7 @@ CLUSTER_SLEEP_GOLD: cluster-sleep-0 {
 				min-residency-us = <6118>;
 			};
 
-			CLUSTER_SLEEP_APSS_RSC_PC: cluster-sleep-1 {
+			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x42000144>;
 				entry-latency-us = <3263>;
@@ -393,77 +393,77 @@ psci {
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
 
@@ -2382,7 +2382,7 @@ aoss_cti: cti@4b13000 {
 		etm@6040000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6040000 0x0 0x1000>;
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2402,7 +2402,7 @@ etm0_out: endpoint {
 		etm@6140000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6140000 0x0 0x1000>;
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2422,7 +2422,7 @@ etm1_out: endpoint {
 		etm@6240000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6240000 0x0 0x1000>;
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2442,7 +2442,7 @@ etm2_out: endpoint {
 		etm@6340000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6340000 0x0 0x1000>;
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2462,7 +2462,7 @@ etm3_out: endpoint {
 		etm@6440000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6440000 0x0 0x1000>;
-			cpu = <&CPU4>;
+			cpu = <&cpu4>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2482,7 +2482,7 @@ etm4_out: endpoint {
 		etm@6540000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6540000 0x0 0x1000>;
-			cpu = <&CPU5>;
+			cpu = <&cpu5>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2502,7 +2502,7 @@ etm5_out: endpoint {
 		etm@6640000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6640000 0x0 0x1000>;
-			cpu = <&CPU6>;
+			cpu = <&cpu6>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2522,7 +2522,7 @@ etm6_out: endpoint {
 		etm@6740000 {
 			compatible = "arm,primecell";
 			reg = <0x0 0x6740000 0x0 0x1000>;
-			cpu = <&CPU7>;
+			cpu = <&cpu7>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 7cf3fcb469a8..5f7e59ecf1ca 100644
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
index 6abff8258674..18706af9511a 100644
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
 				idle-state-name = "l2-ret";
 				arm,psci-suspend-param = <0x01000044>;
@@ -294,7 +294,7 @@ CLUSTER_CL4: cluster-sleep-0 {
 				min-residency-us = <2500>;
 			};
 
-			CLUSTER_CL5: cluster-sleep-1 {
+			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				idle-state-name = "ret-pll-off";
 				arm,psci-suspend-param = <0x01000054>;
@@ -340,85 +340,85 @@ psci {
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
@@ -5718,7 +5718,7 @@ apps_rsc: rsc@17500000 {
 					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
 
 			label = "apps_rsc";
-			power-domains = <&SYSTEM_PD>;
+			power-domains = <&system_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


