Return-Path: <linux-arm-msm+bounces-29727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C284E9620C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6F31B23B20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7369C169AC5;
	Wed, 28 Aug 2024 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVjNnpbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758D1CF96
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829505; cv=none; b=qP4ZjY6KzTS532IK+zzvxcmrUA8XOTd2fGh8FcDc0dn/GRoMfiCjcJ5PWBF87Pg4zgyjbEm4Mdy3vf2rsuNc8YTj70q0hEeHRNLsaxhdQjGo7oL7FJIbKRBpvk/u8MVDbFa3eBOqLRaQUVb0jGWzufSCnn463rQg3DuZDhNZQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829505; c=relaxed/simple;
	bh=qVNVHRfmzCWvMDLnc0+n+om+D+5SYcLY4dSOzxVvd1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASWdVKnZRh/fmfO/n21MfxuRK/d43b9+DmUjzYUMhr+1AKvDk3H0odN/+kywtxE4jOD7iDzZtHaSMFtDgtxGeVJ+WlUJpmKdknQZkCll4MDXXtAvcfWQdhUNtikl6jPZFnw8KXVJur1lMkLD4D07m00rLIfSHYqcqBrPrWqmhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVjNnpbE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42ba79ae3beso265775e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724829500; x=1725434300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dV6M5W9aYS9sB+s9iJFQvlStZvJh8btynpfb89RdX/E=;
        b=JVjNnpbEC0Hts8mOQlwOEHCkti06hymo6sigCB8R4jyN6uuUO9c2oDB37e9b2nzeN6
         nSSFJM9Ngnz6kL29z0yu+ZIiofwNUtTpgVJEjcGaHzcf7mE6XZij/33BOOm2V4yskiLD
         YUC4NP6NiTpdcp/F4+CAliWVeOIPVorEluCQFjixtwUU1PPVp64p8WYKBqGVCY6ckM/l
         xurWOVXqVAwXYnsZQb3dAAlHQZ5atgPuoDrwrvHJ3PG0KaVETlZpreW0iFQNafgadnec
         3GW89+3a3Vj11D/GK+t/4lsWQ7p6LdVZCDixNMtV3WcRXRFpOZXJT21d5awWSl0PqTqw
         vXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829500; x=1725434300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV6M5W9aYS9sB+s9iJFQvlStZvJh8btynpfb89RdX/E=;
        b=rll0HD1MHd+Y7Ax8alHjVCzcV+hyFAdeO+RUFXxnNtmmX/36IWEgOnI3V7AHe5GvdL
         jVgF7QswDbKgc2D1POsgEyy1x5eCF0nuLgb/th+7fuZGPpLxEH9m84Mp2bKDMIjpd/F9
         3hBDIz6TPmYn+HyBmkfcsj0ezf6WazCBDHokwp0+FYvNfILS4iecZ6YqVv3x6DG8oVFa
         VTUBa0S379+xyHpA5xw9ECbKycjPit3weslbSaP4rJlaSY/2UXzdNWHzeffvhXk1V2xk
         MZ3ZwYO0cKxz/Yj6+/leUdoED37TV6zLib9zySXgDljII5ZRnAJAaU1sIwvBXJSprrDo
         YDKw==
X-Gm-Message-State: AOJu0YyREVts5MPag2jeR5SECD2jR8bU5NSXV1oR6crRx1/dm0nDBStP
	SyPIBxDZJ23aoHvTiVDwN3vACbzuDti2EZuPoS7xvPpsEq1xWfgRX6JpBWMa/LDBqwo6+T1eVka
	v
X-Google-Smtp-Source: AGHT+IH1aw/h4A2UhKaVn4EnTYilPWQgbZArf0/3lkIMSnItTJMF8fyjDmfEESJWpx5ID/M28LY3JA==
X-Received: by 2002:a05:600c:1391:b0:424:ac9f:5c61 with SMTP id 5b1f17b1804b1-42acc9ff4c9mr71565575e9.3.1724829499482;
        Wed, 28 Aug 2024 00:18:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308200404sm14843476f8f.81.2024.08.28.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:18:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 09:17:45 +0200
Subject: [PATCH 15/16] arm64: dts: qcom: sdm: change labels to lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dts-qcom-label-v1-15-b27b72130247@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=38207;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qVNVHRfmzCWvMDLnc0+n+om+D+5SYcLY4dSOzxVvd1I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzs8e8TbJG07ggKNyrUk+MxwQuE0M6m0Y4jVn9
 bMAlXdyWIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7PHgAKCRDBN2bmhouD
 1/TcD/0bxehs5e+qAtGejm6VlUSTqWGfv1bqzmQ4QLlXiI9cLH5OwlNyTEsQDrmkfGr88XhMqzr
 EFFpIGWXLntJ6GKGcZB5xL5rGrmm4ju7p/kJQEejvA7OE4IxX+baVGarJDgUSrOafesrwEx6xhk
 JFK2tPRInKhuTmeojnVRiZ6PbsFWpQgvgaDe6g1u74XnHDzX8ipiZnbRHaT6FskyzZerr4K4ZW0
 g66tEErYHm+sNzlfEyLDZjcJuiIiQtN0gaUKzzM8szmXlaZeLFnPj3Lpm2To6V6CKh9TKXnwzXX
 enH5prC600RKydx2y+YU5tlZV3I4lz/SJGJqX8OracZePwODAX063/BUl9Vj7AiirGTNsZn89wM
 4d7gKwvrlbEcPLQYKj42xyfwHsN7YFXF6UZjVPnfSZADXZy//um+6B5irxfC7nzUJkiI0OUuxFp
 2Qjts0pRZG7dRk0329+LzYVPlQeD9geQC1vnWPPfDG4pX9Nu55QvKhewuGblxUMtxu9nMpvdDJn
 8WXoPPUBz2Wo9vqsXh5YrPBe9rFn+nCA4FZyyg2MSa7mFIMpU4rCzPhaNIr85tUR/7TndLLJZjb
 aF21eU8omNhE2uTGIa1+/yLpgQnfNBGhTi3rm7mrb+cdDp2nwEJdTK1g4Ek3gN2dsFH4KNntn1g
 ieMTpFD7jOmSWOw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi       | 152 +++++++++++++--------------
 arch/arm64/boot/dts/qcom/sdm660.dtsi       |  16 +--
 arch/arm64/boot/dts/qcom/sdm670.dtsi       | 140 ++++++++++++-------------
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi |  74 ++++++-------
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 160 ++++++++++++++---------------
 5 files changed, 271 insertions(+), 271 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index c8da5cb8d04e..d70ac87178c4 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -49,170 +49,170 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@100 {
+		cpu0: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			cpu-idle-states = <&PERF_CPU_SLEEP_0
-						&PERF_CPU_SLEEP_1
-						&PERF_CLUSTER_SLEEP_0
-						&PERF_CLUSTER_SLEEP_1
-						&PERF_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PERF_cpu_sleep_0
+						&PERF_cpu_sleep_1
+						&PERF_cluster_sleep_0
+						&PERF_cluster_sleep_1
+						&PERF_cluster_sleep_2>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_1>;
-			L2_1: l2-cache {
+			next-level-cache = <&l2_1>;
+			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU1: cpu@101 {
+		cpu1: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
-			cpu-idle-states = <&PERF_CPU_SLEEP_0
-						&PERF_CPU_SLEEP_1
-						&PERF_CLUSTER_SLEEP_0
-						&PERF_CLUSTER_SLEEP_1
-						&PERF_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PERF_cpu_sleep_0
+						&PERF_cpu_sleep_1
+						&PERF_cluster_sleep_0
+						&PERF_cluster_sleep_1
+						&PERF_cluster_sleep_2>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 		};
 
-		CPU2: cpu@102 {
+		cpu2: cpu@102 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
-			cpu-idle-states = <&PERF_CPU_SLEEP_0
-						&PERF_CPU_SLEEP_1
-						&PERF_CLUSTER_SLEEP_0
-						&PERF_CLUSTER_SLEEP_1
-						&PERF_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PERF_cpu_sleep_0
+						&PERF_cpu_sleep_1
+						&PERF_cluster_sleep_0
+						&PERF_cluster_sleep_1
+						&PERF_cluster_sleep_2>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 		};
 
-		CPU3: cpu@103 {
+		cpu3: cpu@103 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
-			cpu-idle-states = <&PERF_CPU_SLEEP_0
-						&PERF_CPU_SLEEP_1
-						&PERF_CLUSTER_SLEEP_0
-						&PERF_CLUSTER_SLEEP_1
-						&PERF_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PERF_cpu_sleep_0
+						&PERF_cpu_sleep_1
+						&PERF_cluster_sleep_0
+						&PERF_cluster_sleep_1
+						&PERF_cluster_sleep_2>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 		};
 
-		CPU4: cpu@0 {
+		cpu4: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			cpu-idle-states = <&PWR_CPU_SLEEP_0
-						&PWR_CPU_SLEEP_1
-						&PWR_CLUSTER_SLEEP_0
-						&PWR_CLUSTER_SLEEP_1
-						&PWR_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PWR_cpu_sleep_0
+						&PWR_cpu_sleep_1
+						&PWR_cluster_sleep_0
+						&PWR_cluster_sleep_1
+						&PWR_cluster_sleep_2>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_0>;
-			L2_0: l2-cache {
+			next-level-cache = <&l2_0>;
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU5: cpu@1 {
+		cpu5: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
-			cpu-idle-states = <&PWR_CPU_SLEEP_0
-						&PWR_CPU_SLEEP_1
-						&PWR_CLUSTER_SLEEP_0
-						&PWR_CLUSTER_SLEEP_1
-						&PWR_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PWR_cpu_sleep_0
+						&PWR_cpu_sleep_1
+						&PWR_cluster_sleep_0
+						&PWR_cluster_sleep_1
+						&PWR_cluster_sleep_2>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 		};
 
-		CPU6: cpu@2 {
+		cpu6: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
-			cpu-idle-states = <&PWR_CPU_SLEEP_0
-						&PWR_CPU_SLEEP_1
-						&PWR_CLUSTER_SLEEP_0
-						&PWR_CLUSTER_SLEEP_1
-						&PWR_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PWR_cpu_sleep_0
+						&PWR_cpu_sleep_1
+						&PWR_cluster_sleep_0
+						&PWR_cluster_sleep_1
+						&PWR_cluster_sleep_2>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 		};
 
-		CPU7: cpu@3 {
+		cpu7: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
-			cpu-idle-states = <&PWR_CPU_SLEEP_0
-						&PWR_CPU_SLEEP_1
-						&PWR_CLUSTER_SLEEP_0
-						&PWR_CLUSTER_SLEEP_1
-						&PWR_CLUSTER_SLEEP_2>;
+			cpu-idle-states = <&PWR_cpu_sleep_0
+						&PWR_cpu_sleep_1
+						&PWR_cluster_sleep_0
+						&PWR_cluster_sleep_1
+						&PWR_cluster_sleep_2>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 		};
 
 		cpu-map {
 			cluster0 {
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
 
 			cluster1 {
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
@@ -220,7 +220,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			PWR_CPU_SLEEP_0: cpu-sleep-0-0 {
+			PWR_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-retention";
 				arm,psci-suspend-param = <0x40000002>;
@@ -229,7 +229,7 @@ PWR_CPU_SLEEP_0: cpu-sleep-0-0 {
 				min-residency-us = <200>;
 			};
 
-			PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
+			PWR_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -239,7 +239,7 @@ PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
+			PERF_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-retention";
 				arm,psci-suspend-param = <0x40000002>;
@@ -248,7 +248,7 @@ PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
 				min-residency-us = <200>;
 			};
 
-			PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
+			PERF_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -258,7 +258,7 @@ PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
 				local-timer-stop;
 			};
 
-			PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
+			PWR_cluster_sleep_0: cluster-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-dynamic-retention";
 				arm,psci-suspend-param = <0x400000F2>;
@@ -268,7 +268,7 @@ PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
+			PWR_cluster_sleep_1: cluster-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-retention";
 				arm,psci-suspend-param = <0x400000F3>;
@@ -278,7 +278,7 @@ PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
+			PWR_cluster_sleep_2: cluster-sleep-0-2 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-retention";
 				arm,psci-suspend-param = <0x400000F4>;
@@ -288,7 +288,7 @@ PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
 				local-timer-stop;
 			};
 
-			PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
+			PERF_cluster_sleep_0: cluster-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-dynamic-retention";
 				arm,psci-suspend-param = <0x400000F2>;
@@ -298,7 +298,7 @@ PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
+			PERF_cluster_sleep_1: cluster-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-retention";
 				arm,psci-suspend-param = <0x400000F3>;
@@ -308,7 +308,7 @@ PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
 				local-timer-stop;
 			};
 
-			PERF_CLUSTER_SLEEP_2: cluster-sleep-1-2 {
+			PERF_cluster_sleep_2: cluster-sleep-1-2 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-retention";
 				arm,psci-suspend-param = <0x400000F4>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index f89b27c99f40..3164a4817e32 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -85,49 +85,49 @@ opp-160000000 {
 	};
 };
 
-&CPU0 {
+&cpu0 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <1024>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU1 {
+&cpu1 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <1024>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU2 {
+&cpu2 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <1024>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU3 {
+&cpu3 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <1024>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU4 {
+&cpu4 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <640>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU5 {
+&cpu5 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <640>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU6 {
+&cpu6 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <640>;
 	/delete-property/ operating-points-v2;
 };
 
-&CPU7 {
+&cpu7 {
 	compatible = "qcom,kryo260";
 	capacity-dmips-mhz = <640>;
 	/delete-property/ operating-points-v2;
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 187c6698835d..f40ff1a9a385 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -32,7 +32,7 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x0>;
@@ -43,10 +43,10 @@ CPU0: cpu@0 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_0>;
-			L2_0: l2-cache {
+			next-level-cache = <&l2_0>;
+			l2_0: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
 				cache-level = <2>;
@@ -59,7 +59,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x100>;
@@ -70,10 +70,10 @@ CPU1: cpu@100 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_100>;
-			L2_100: l2-cache {
+			next-level-cache = <&l2_100>;
+			l2_100: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -81,7 +81,7 @@ L2_100: l2-cache {
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x200>;
@@ -92,10 +92,10 @@ CPU2: cpu@200 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_200>;
-			L2_200: l2-cache {
+			next-level-cache = <&l2_200>;
+			l2_200: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -103,7 +103,7 @@ L2_200: l2-cache {
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x300>;
@@ -114,10 +114,10 @@ CPU3: cpu@300 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_300>;
-			L2_300: l2-cache {
+			next-level-cache = <&l2_300>;
+			l2_300: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -125,7 +125,7 @@ L2_300: l2-cache {
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x400>;
@@ -136,10 +136,10 @@ CPU4: cpu@400 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD4>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_400>;
-			L2_400: l2-cache {
+			next-level-cache = <&l2_400>;
+			l2_400: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -147,7 +147,7 @@ L2_400: l2-cache {
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x500>;
@@ -158,10 +158,10 @@ CPU5: cpu@500 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD5>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_500>;
-			L2_500: l2-cache {
+			next-level-cache = <&l2_500>;
+			l2_500: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -169,7 +169,7 @@ L2_500: l2-cache {
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x600>;
@@ -180,10 +180,10 @@ CPU6: cpu@600 {
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD6>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_600>;
-			L2_600: l2-cache {
+			next-level-cache = <&l2_600>;
+			l2_600: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -191,7 +191,7 @@ L2_600: l2-cache {
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x700>;
@@ -202,10 +202,10 @@ CPU7: cpu@700 {
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD7>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_700>;
-			L2_700: l2-cache {
+			next-level-cache = <&l2_700>;
+			l2_700: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -216,35 +216,35 @@ L2_700: l2-cache {
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
@@ -252,7 +252,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			LITTLE_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -262,7 +262,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			BIG_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -274,7 +274,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
@@ -429,57 +429,57 @@ psci {
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
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0>;
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
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>;
+			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};
 
@@ -1762,7 +1762,7 @@ apps_rsc: rsc@179c0000 {
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index e8276db9eabb..a31e6736cb37 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -164,7 +164,7 @@ &cpus {
 };
 
 &cpu_idle_states {
-	LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+	LITTLE_cpu_sleep_0: cpu-sleep-0-0 {
 		compatible = "arm,idle-state";
 		idle-state-name = "little-power-down";
 		arm,psci-suspend-param = <0x40000003>;
@@ -174,7 +174,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 		local-timer-stop;
 	};
 
-	LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+	LITTLE_cpu_sleep_1: cpu-sleep-0-1 {
 		compatible = "arm,idle-state";
 		idle-state-name = "little-rail-power-down";
 		arm,psci-suspend-param = <0x40000004>;
@@ -184,7 +184,7 @@ LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 		local-timer-stop;
 	};
 
-	BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+	BIG_cpu_sleep_0: cpu-sleep-1-0 {
 		compatible = "arm,idle-state";
 		idle-state-name = "big-power-down";
 		arm,psci-suspend-param = <0x40000003>;
@@ -194,7 +194,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		local-timer-stop;
 	};
 
-	BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+	BIG_cpu_sleep_1: cpu-sleep-1-1 {
 		compatible = "arm,idle-state";
 		idle-state-name = "big-rail-power-down";
 		arm,psci-suspend-param = <0x40000004>;
@@ -204,7 +204,7 @@ BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
 		local-timer-stop;
 	};
 
-	CLUSTER_SLEEP_0: cluster-sleep-0 {
+	cluster_sleep_0: cluster-sleep-0 {
 		compatible = "arm,idle-state";
 		idle-state-name = "cluster-power-down";
 		arm,psci-suspend-param = <0x400000F4>;
@@ -215,68 +215,68 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 	};
 };
 
-&CPU0 {
+&cpu0 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&LITTLE_cpu_sleep_0
+			   &LITTLE_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU1 {
+&cpu1 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&LITTLE_cpu_sleep_0
+			   &LITTLE_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU2 {
+&cpu2 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&LITTLE_cpu_sleep_0
+			   &LITTLE_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU3 {
+&cpu3 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&LITTLE_cpu_sleep_0
+			   &LITTLE_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU4 {
+&cpu4 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&BIG_cpu_sleep_0
+			   &BIG_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU5 {
+&cpu5 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&BIG_cpu_sleep_0
+			   &BIG_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU6 {
+&cpu6 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&BIG_cpu_sleep_0
+			   &BIG_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU7 {
+&cpu7 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&BIG_cpu_sleep_0
+			   &BIG_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
 &lmh_cluster0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 54077549b9da..d8507e0ef3ab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -91,7 +91,7 @@ cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x0>;
@@ -103,11 +103,11 @@ CPU0: cpu@0 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_0>;
-			L2_0: l2-cache {
+			next-level-cache = <&l2_0>;
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -120,7 +120,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
@@ -132,11 +132,11 @@ CPU1: cpu@100 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_100>;
-			L2_100: l2-cache {
+			next-level-cache = <&l2_100>;
+			l2_100: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -144,7 +144,7 @@ L2_100: l2-cache {
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
@@ -156,11 +156,11 @@ CPU2: cpu@200 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_200>;
-			L2_200: l2-cache {
+			next-level-cache = <&l2_200>;
+			l2_200: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -168,7 +168,7 @@ L2_200: l2-cache {
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
@@ -181,10 +181,10 @@ CPU3: cpu@300 {
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
-			next-level-cache = <&L2_300>;
-			L2_300: l2-cache {
+			next-level-cache = <&l2_300>;
+			l2_300: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -192,7 +192,7 @@ L2_300: l2-cache {
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
@@ -204,11 +204,11 @@ CPU4: cpu@400 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD4>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_400>;
-			L2_400: l2-cache {
+			next-level-cache = <&l2_400>;
+			l2_400: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -216,7 +216,7 @@ L2_400: l2-cache {
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
@@ -228,11 +228,11 @@ CPU5: cpu@500 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD5>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_500>;
-			L2_500: l2-cache {
+			next-level-cache = <&l2_500>;
+			l2_500: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -240,7 +240,7 @@ L2_500: l2-cache {
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
@@ -252,11 +252,11 @@ CPU6: cpu@600 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD6>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_600>;
-			L2_600: l2-cache {
+			next-level-cache = <&l2_600>;
+			l2_600: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -264,7 +264,7 @@ L2_600: l2-cache {
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
@@ -276,11 +276,11 @@ CPU7: cpu@700 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			power-domains = <&CPU_PD7>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			#cooling-cells = <2>;
-			next-level-cache = <&L2_700>;
-			L2_700: l2-cache {
+			next-level-cache = <&l2_700>;
+			l2_700: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -291,35 +291,35 @@ L2_700: l2-cache {
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
@@ -327,7 +327,7 @@ core7 {
 		cpu_idle_states: idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			LITTLE_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -337,7 +337,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			BIG_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -349,7 +349,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
+			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
@@ -717,57 +717,57 @@ psci: psci {
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
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>;
+			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};
 
@@ -3615,7 +3615,7 @@ etm@7040000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07040000 0 0x1000>;
 
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3635,7 +3635,7 @@ etm@7140000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07140000 0 0x1000>;
 
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3655,7 +3655,7 @@ etm@7240000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07240000 0 0x1000>;
 
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3675,7 +3675,7 @@ etm@7340000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07340000 0 0x1000>;
 
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3695,7 +3695,7 @@ etm@7440000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07440000 0 0x1000>;
 
-			cpu = <&CPU4>;
+			cpu = <&cpu4>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3715,7 +3715,7 @@ etm@7540000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07540000 0 0x1000>;
 
-			cpu = <&CPU5>;
+			cpu = <&cpu5>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3735,7 +3735,7 @@ etm@7640000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07640000 0 0x1000>;
 
-			cpu = <&CPU6>;
+			cpu = <&cpu6>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3755,7 +3755,7 @@ etm@7740000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07740000 0 0x1000>;
 
-			cpu = <&CPU7>;
+			cpu = <&cpu7>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3959,7 +3959,7 @@ lmh_cluster1: lmh@17d70800 {
 			compatible = "qcom,sdm845-lmh";
 			reg = <0 0x17d70800 0 0x400>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			cpus = <&CPU4>;
+			cpus = <&cpu4>;
 			qcom,lmh-temp-arm-millicelsius = <65000>;
 			qcom,lmh-temp-low-millicelsius = <94500>;
 			qcom,lmh-temp-high-millicelsius = <95000>;
@@ -3971,7 +3971,7 @@ lmh_cluster0: lmh@17d78800 {
 			compatible = "qcom,sdm845-lmh";
 			reg = <0 0x17d78800 0 0x400>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-			cpus = <&CPU0>;
+			cpus = <&cpu0>;
 			qcom,lmh-temp-arm-millicelsius = <65000>;
 			qcom,lmh-temp-low-millicelsius = <94500>;
 			qcom,lmh-temp-high-millicelsius = <95000>;
@@ -5277,7 +5277,7 @@ apps_rsc: rsc@179c0000 {
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


