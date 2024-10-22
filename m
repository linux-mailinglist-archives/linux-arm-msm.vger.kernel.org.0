Return-Path: <linux-arm-msm+bounces-35456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D29AB2A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12E851C226DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FE61BFDEB;
	Tue, 22 Oct 2024 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4D/OABY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC121BE864
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612103; cv=none; b=uktvDFSP64dnSfoDlHpd5fq5ASeX2rLAZcxI/TNtNzqnZsfIaUB4rJadehqonrNswPQeBPaEO6vLoBUrHjsm/WtVSoe/aX1riKdoJIGKAN2UV3QC3zFt10/srV9vGd2OnaVeP7z2bJExxIW6Brj0c373cYKHQkrHPxbB3oxUtBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612103; c=relaxed/simple;
	bh=N4xxcEjJPumCJxJbggY58CEN96mc+S3LZciqIJaEmuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCiWSLZ4qYNBLqos+/1hOwV4oH7mS4TmzgGsRPb9sImJFkvVtgkdBBSbC/kgsJqE5bQDI4MUOg2MBzbC5GqNQsN3oBvf5Od+K3GC3gZ6WlIP5AG4xdZ08djGDFsQXsdg/ofgJUGj2+mExuB+d4P5whOnh+dP2fqT0gyxfRUoZDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4D/OABY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d43a34a0cso551552f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612100; x=1730216900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w73frpf8a7z1XYBiYQovSNHFdESu8q672XFTMaZQ/iw=;
        b=d4D/OABYcrruMBFbKYZdozWbZOqCDyLvJfACSmqeJ6U1lzdw9RWOM93M7N40RwEWwJ
         jI+qYdVP9M3xAG1AXwCM6RVGvlYfjAi55koZJKkE4ej5qhMKdaIV5TKtbz8FjS23nZqU
         MAe3Wig94v00+Nh4sUNUzB5CCU6OPTCIx8aQalddO884HUoxQ/RvnQQz7fB0tUyRJSnL
         53FKC/DgzHpM6Dv+w5Ah9PUizZrhGKP21Fvywu+iTz2YY/xHVvegvo5luXnCO4yXl8lJ
         lJ+Ml5hLC927xcvBkJGm+CSKPhrYfkFI7kYFKKZA0AwRls1ct2jiMnHnYO4/AOk2aUsQ
         EbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612100; x=1730216900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w73frpf8a7z1XYBiYQovSNHFdESu8q672XFTMaZQ/iw=;
        b=uZnkuvE+nNphviKmox+nt/uh8hmDWXyPlHBGPDjYZUuADmNEGA8ofHCrnQMTJvbKuf
         x+54dVeH19x0qDSU8GBNAvq3UIcH+kYW93Oo+haZDZnKtl7A0vPCeLZ0QMcs7DOdlXah
         wADJ/A2EJINlLX2NW9WI+ELbYanmVzEUJNMBvyTlo03Rw42Iq2Feom5nJcBLt5A5hgMj
         Ev8UmDMjovlkko9gupQyTij/yCEsP0JPCSwY7GcKVZXJ00HWfqAiqBXMxyckayYA4W2f
         bhnHFlyi6lRgKSvRgxX6dxYZubvY9+1U+I74uSIv/ACXNeUHCAEtafDhZh5hK5rb0/9F
         5MfQ==
X-Gm-Message-State: AOJu0Yy91a0u8LEq344MfZiVKSEX2Ph5w0Y4YVxeSLgv2iVaxA4KImsg
	pHWKO9HwOubW57uNpc4d6hCfIEEPtGjhuxfQz7qvPWYs1j5E+4FOIP+bJGQJPXE=
X-Google-Smtp-Source: AGHT+IFbY/51OyK+JI/SjIrwgQl1WgwvhVZVUIKsToROwTmNQubX714zJhbJFBlTxt7gVuo4uP1hrw==
X-Received: by 2002:a5d:598e:0:b0:37d:4ca3:310f with SMTP id ffacd0b85a97d-37eab6e8f92mr5282362f8f.12.1729612099586;
        Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:39 +0200
Subject: [PATCH v3 14/18] arm64: dts: qcom: sm8650: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-14-0505bc7d2c56@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11241;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=N4xxcEjJPumCJxJbggY58CEN96mc+S3LZciqIJaEmuo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kgF6WUUJbA7sWf1v2z09SkM4FlcvOLofJVJ
 XJofyaqsDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJIAAKCRDBN2bmhouD
 13xLD/wMlzqPsl0S8aB1HmDpXxU0U/S71F8QPYXG9wHF6NYYLnm+GDD/+d/3NqlQF2XtimsiW/R
 Pc2gF2IEs+AvRx8JE7/YlVc/PnF3w4WOMB/A8WhtmucGSxTI5nNDO95w5Ibd6f0nklkk9aBW2LD
 JXzhy2EMKOqgl/405WL8q9Eobti2lxInCfViSTtcpf+HesH9O2sN7SribvND1DVnBy97LUfd9Wq
 ImCETvRG9uDbGjtEsYGLqcRb01LqKtVsaOoh7h1VlEO+cw/qP6tSz30AI8zm1swC1RJxF6QDVBR
 mEbhGVfhVQFtfFkGR2oO0GqHEJIL8nPs5sfiqminu6i/8F0m3VIsozYOsqb42be8Ya3ZxSREzZN
 k1sl0sMjJXjC89am7zIhbD2HrowjUnRr2qOxrsCCjDJjOSHqARO2ZLtpWxpq6Wot/pNu/+IIrpK
 4bWOQaAPDr/kXd9Yz8bZ0avrdgQ27eyOe4MqatckpQC3ZAGCbRAyIQNvHcE00UHcSimgJNiXKpV
 vl/0QPaY2rOpBXPCnPxSuEovlTNqFLlxTj9N2+8kCSvcbrk6O2cljloc4MjtBhhA0znL8oeSasn
 ccOrUUtbspmPbpUk8jCyyWNBZYn4ubtUYCcorjww8P5ZLlJCuT2GXK+SqWCwKnvU932AqckSAhn
 kTcTCjQAZfIQthw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 156 +++++++++++++++++------------------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 3d8a807a81c9c15eeeaadf624a8e7f085b68ae9e..0c2b2a12663363b7d35eec89051697d69aba287d 100644
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
 
@@ -5081,7 +5081,7 @@ apps_rsc: rsc@17a00000 {
 				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			qcom,tcs-offset = <0xd00>;
 			qcom,drv-id = <2>;

-- 
2.43.0


