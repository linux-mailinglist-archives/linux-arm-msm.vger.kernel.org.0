Return-Path: <linux-arm-msm+bounces-29725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467AF9620BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9541F242E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0338165F0D;
	Wed, 28 Aug 2024 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltP8rTyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150AB161314
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829500; cv=none; b=jaTc83CXYqQhoo75gNDWqk+x8gwUnSJNkKhPhtjwjy5Q7oUe2gruCw66dHkVDh+Q93l4mrR1t0jVVKDUa9QC/rTJL3EdNfGYQ/Iztq1bZRkeTeMr4Tita6REf7s8WEVv3zI/GNUTMYPXE90KjN9U3JiVLynNZu+VO5o7TYabgSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829500; c=relaxed/simple;
	bh=pHMfjW7Be5Bb6vXPXSXyPM3vsfQI/WhQfh6/a0UVoxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsCk6nNW1z1WVqpzjzryQ8NfDGx4KdVbmvGGXzh3RoDGE1vt2/Y0d7DRkVF+selPh2CUV2aHOQA4M1dv0o40+zmx5fK+/hoAcwTbJntjhfUDAdGp9fkjeEYCZ1o7xX+shWCDBATNBIw8iIt7EQ9IV1Z7pmG9e6qW/ENLRpcusAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltP8rTyJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3718cea0693so233222f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724829496; x=1725434296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p8oD3MSElej/VCFDDRBEkLJr3BiSfsSMziEyfL1kog=;
        b=ltP8rTyJ+UXvcvuOlNNsUzwEYNNUWtMom+TRQOivsN8oqxlERarcrNBYHotTtrXf8B
         HFtLo7sJiUVD4wyhdLZxqriZ549PqyHl2detPKbVUoCoR66L4Pxt/dSs4a3dJOYWUECL
         lJH/U9dUgKnH+FtAV74vJppHaqaitfkdXySk96iM4ZeJ6lzhst6EdEkQNLei0CU0hoL5
         iGf3Hn/W+MnPfJ0pYr0ayq53f1XZf8XxSR9VHtMxlmoS/03sD5KY/hAfv+Fj8yF1zph3
         IGsQN7bBxiwQACFxTuOumVVA5MYHajDNbtYVGPR8kBf1uXeXyIx4LaMooLTXlYIYLv4o
         I1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829496; x=1725434296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p8oD3MSElej/VCFDDRBEkLJr3BiSfsSMziEyfL1kog=;
        b=O1J9BQit1nfvSmLLt8qc//5Qhs9uiGCg21JHw7SKi+QHWfgYsPrdbZMLC9s5kjHqQ8
         bYyiyxFYj9Fms580n7OTaThRLknRMVcGUhDPx6lkAsjlS7rZC64KC/x5UbgEbJ9eS+sU
         PaqWBlxaZ9mdfefnMGyLgHxMNkXqSMuhRGPpEh5g5Y4WjcUHjLr7t6t4EyR6dnCPJ+39
         GnnON/mDkOLJxaE2UesY4bYKaxlxGD7IHC7XxstvVpy1W3uKQOL272Y7iSvTRqkDeZBl
         kl+h7upjlQi+GRXz+vhVlo3OXHGQ+/IPH1VR9NIWMNNYrCvXsTHazCS0fa5bJ7myI7W4
         KrUg==
X-Gm-Message-State: AOJu0YzKNBsZCmyR61zcFiVV/2kGMCNCMNnBUac5EY1UJRuVINeg+LAL
	Hl3xChHRtydBMcEcJXBbYLUv37diHmvUAn29FYg4Vx7v6BWqhs+ua8n1Fn4f+bQ=
X-Google-Smtp-Source: AGHT+IEd4HXqXOjy0h9RpEZRz43tJYjuEsrkT6uMC22Vem9GDC76Im6Z2uArAnVDLjr61na1/pL5qQ==
X-Received: by 2002:a05:600c:4f51:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-42acca1399bmr68060255e9.4.1724829496449;
        Wed, 28 Aug 2024 00:18:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308200404sm14843476f8f.81.2024.08.28.00.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:18:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 09:17:43 +0200
Subject: [PATCH 13/16] arm64: dts: qcom: sm8650: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dts-qcom-label-v1-13-b27b72130247@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10774;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pHMfjW7Be5Bb6vXPXSXyPM3vsfQI/WhQfh6/a0UVoxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzs8d8TYVgepqrq8xY7Rjvx8iMafZNpRx8eybU
 m4JO+u4qlSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7PHQAKCRDBN2bmhouD
 173TD/43RZKdfeyuIRXJtPJ7y2+oIHpRgssMwEMknpgv8VVtyDcf/zvlK7X9ZCxttdX1dhU3PDQ
 UJmFtLuaiVccFLRPVei2f7dsMgtvhF3uI708ICdXQSD8SCqfKVZcKMUnaJTeoTMp1cF8f0nujLL
 xP5aZDhRHKrf9LvGK06q1Sl+urMOtdbjbF4VMjTWYPyhdDiQJDv0YR9V0/CxwIhk2b/DOPz0lQN
 IYhafzX50x20vu8VKuaLWMQP3VN+hYHl/09XyA2B099cQyGLbmI/CKt/6xRTFsMshYPvwHTbH19
 OzdmVLipG1osVgDvnrPCt9Wcnv6K5R1eg2cmWDYhYdQ8nbkrBOY+0iIMAKvYywC90cghlA+R1c/
 oBSHoDlC4qmoiR53W00kJI3WYvrWb8x0qyztUxxIPckRXuJGVzLT5Cu15e8EacK1JiU/ZbzJwW0
 tf0GcvppT2jkHmTwTWZ0Nnyh7CRCYBUYeFlj2Jhg14pIQIuWBSn6Bj+IY8/22/gZBvgXqzhICZ1
 mSaC2Ui1RIVZ+wn084m3CYfSk7Rls10mNc5Sl+hQnEdk6WST0VmoP+Wz+eGFfFC8UEchBUQ8XQG
 vGj49ctYAG5+fDgobHEEc0nL8e81KoIJFdFXfn5DEGcc3g9EqlavSUBMHmQMaaKWq2vgRtqEL3W
 2Lrk+0b5bCYk+ow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 142 +++++++++++++++++------------------
 1 file changed, 71 insertions(+), 71 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 01ac3769ffa6..1af936467a14 100644
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
 
@@ -87,7 +87,7 @@ CPU0: cpu@0 {
 
 			#cooling-cells = <2>;
 
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
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
 
@@ -140,7 +140,7 @@ CPU2: cpu@200 {
 
 			#cooling-cells = <2>;
 
-			L2_200: l2-cache {
+			l2_200: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -148,18 +148,18 @@ L2_200: l2-cache {
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
 
@@ -187,7 +187,7 @@ CPU4: cpu@400 {
 
 			#cooling-cells = <2>;
 
-			L2_400: l2-cache {
+			l2_400: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -195,18 +195,18 @@ L2_400: l2-cache {
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
 
@@ -214,7 +214,7 @@ CPU5: cpu@500 {
 
 			#cooling-cells = <2>;
 
-			L2_500: l2-cache {
+			l2_500: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -222,18 +222,18 @@ L2_500: l2-cache {
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
 
@@ -241,7 +241,7 @@ CPU6: cpu@600 {
 
 			#cooling-cells = <2>;
 
-			L2_600: l2-cache {
+			l2_600: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -249,18 +249,18 @@ L2_600: l2-cache {
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
 
@@ -268,7 +268,7 @@ CPU7: cpu@700 {
 
 			#cooling-cells = <2>;
 
-			L2_700: l2-cache {
+			l2_700: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -279,35 +279,35 @@ L2_700: l2-cache {
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
+			SILVER_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -325,7 +325,7 @@ SILVER_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			GOLD_CPU_SLEEP_0: cpu-sleep-1-0 {
+			GOLD_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -335,7 +335,7 @@ GOLD_CPU_SLEEP_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			GOLD_PLUS_CPU_SLEEP_0: cpu-sleep-2-0 {
+			GOLD_PLUS_cpu_sleep_0: cpu-sleep-2-0 {
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
+			domain-idle-states = <&SILVER_cpu_sleep_0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&SILVER_cpu_sleep_0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&SILVER_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&SILVER_cpu_sleep_0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&GOLD_cpu_sleep_0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&GOLD_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&GOLD_cpu_sleep_0>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&GOLD_cpu_sleep_0>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&GOLD_PLUS_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&GOLD_PLUS_cpu_sleep_0>;
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


