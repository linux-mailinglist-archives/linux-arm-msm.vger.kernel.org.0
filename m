Return-Path: <linux-arm-msm+bounces-35458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C1C9AB2AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD381C21EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E2E1C2DA4;
	Tue, 22 Oct 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HbeQMTvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585F1A726F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612110; cv=none; b=haPmA8z2fDuukUobtXPwdHn34SlLyWIoP2D62SPAnMjBvhsDD9sVeSyxkYokRC8pxuyvlHQkBY/JRRxhSINgIQ5A0amZD1aNnIA7b8HQodVOj8chVUNe+xJA/6uhNmTx0MU9iGArcObo+UBHne3DjmOgoz9qYGn9uC6onj9vee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612110; c=relaxed/simple;
	bh=z2V+4u1LWPFrmfIjYgSrcFfj6WxI1KiZdRtfHazDVYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljGTlBpUlHGcJtDUBzobvn9XV2jzWLWQR6RtYKU6L+CFzV/quBtvRLe15SPsgXGeWmxg6m41R9GvOrcyqrIrMnYeFEMd8JiUOD96fbzzc2Wserfjqjyv+51EiVTS+pqV/HJXqN8WT6fH7lwvd/bXwrWXw0LNZbGY63GP+X6jhFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HbeQMTvR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c935ca63ceso853922a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612104; x=1730216904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFHVTi0xiV8Ws0OslevDlqyGjQFVA6C9Gv1uFcjRdRM=;
        b=HbeQMTvRvoyvlzeItEQRCVMPyv8ndrftgAAunLqNAuc12OTC/9dP7bB9GIYFNrGbhO
         kShzmwK0/uSTs9Tw/ZuOnxuzOzspdynZ2mEG75CwOLoZSs2WFxpCwnm+4dx99i5+3sfd
         MUhSshNKv7raWACQYqD48wSj4MCo/U48IcbZIw2xl0JfkxHbVzwopsiu2XwRoouhKoNg
         LrNgR7hSQFAFxKAvBQOPPtWIjrJUXnRhQ/l7KSbyobiJiYmsbB5JTCXj4kKd1J+tq4mr
         OYAKLEhD7GjX+UuOTTmbYyFK9sJfFFAFokUhU+4caYjvAYtCk/fRXoIjLSPYNKwW9XCY
         qNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612104; x=1730216904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFHVTi0xiV8Ws0OslevDlqyGjQFVA6C9Gv1uFcjRdRM=;
        b=h1JtWdZ0+bJRagbJDWnTHRvAe7zaRKDIlVGYJOuf1nOSaB0f++W9hipw8n67Z7CRjT
         iZUaGy1uhrlMH2r8NkeNVLNRp3LzPgoBhHMhJwTmF/VGh/4bu0mlnLAwtcrJv9Yir0Qv
         loy9Bvt0yXzYEmxp4UTzovP2qEihkFKCPJQYwq+nWUwv4wyoPQXTvRWb0M25BBElop9y
         IeBLbYYSTchABf7qoISfmJDGjEdEIRSMx1KScaKwKXE4IADcG4arTkBqpRdbk0R+kibs
         kZCDJZxEyJgtXLWjm6luZITyV7mQEmk4F0RRBWHLMsZpdkYhNEEmAOLjGZSjtjmGfHJt
         sZ6g==
X-Gm-Message-State: AOJu0YxmBSq2jg4yja0Fz6+UMav3CB/J4v//h9n7Ttw+EAuqQbrawqPh
	r5A9Su1/uR81uthAgjBoNV1od0Yd0eo+Aqnx1OfxVm4+q6sA7Hzh9ch8NrIQ4P0=
X-Google-Smtp-Source: AGHT+IH7bsakA7gi/5E/Pne7WPE4sQNgzMrQJ/3vUZ4h2LrOLUeH/zdQpeUnfXWW1eEihUs3E9ZOOA==
X-Received: by 2002:a05:6402:42d2:b0:5c5:bebb:5409 with SMTP id 4fb4d7f45d1cf-5ca0ac51263mr6575823a12.3.1729612104263;
        Tue, 22 Oct 2024 08:48:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:41 +0200
Subject: [PATCH v3 16/18] arm64: dts: qcom: sdm: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-16-0505bc7d2c56@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=40126;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=z2V+4u1LWPFrmfIjYgSrcFfj6WxI1KiZdRtfHazDVYY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kiJFhmj4Wb9sRbBcGvxIdsS/uhn7p2cM4Rd
 XorrWzp02+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJIgAKCRDBN2bmhouD
 16dQD/4iGRXrGozwZcMaNFm5HtZJ097je7vdF8M6U9rDw3sF0dIRv/GLGTiCtdRaOh/fIsbwApv
 RFkTPrjYoAjU8wU/ytuiEWvjmGMabpI68cxnHhLtZL8peD192g0z4SjXpcOgw/xU3zjwXcVk9VW
 uY3+PKlh2ECNuG7Gn9a9+BxH+cjWof/V9UQweOH+0sbbsdxsykPAWpdIdYmIBK8GCmK3gvhQbJx
 +QCGWuTFfMCtHBCQz5/Q3F/ylTvbxX0D1MBbY5YKDyPNsPeHZy6/tiUAw9JYVfIlDWHhP71rb/r
 mvRjJMFPZLa53fLyaB5IVS/askdF9yQVnipPgMQJv9jOUVUqxTHsKwJSklDQ5VmCFc06gLCPAn/
 WxTPSwFDDOQ0+aHeem2rkYXwKrehc8KUZipHFJ2V+EPbtor79zM1mdrBtaZdFecni65ElLH7t4k
 wHyX7P3RKkYQVVtNmADagVMhPLiFTA1Bhppv1SKG+7bf/3dSqnQZzaaOZlFf8p4UmsfxEyuFFF6
 /d5HwDJuvW8wacgQD1MlkbuehrwGDRUj4QPvPVG7bLc9tc0eL89eHjUqBaxGG054yinl57YTwoV
 89MSoZvDhS+2NSLOYEy7jzT1AIJbj5hPlSfZF5xFmDqURneq0ba4+UEwIFi6T08g7mf36Joeywt
 B8ueCf7VOePD63w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi       | 152 ++++++++++++------------
 arch/arm64/boot/dts/qcom/sdm660.dtsi       |  16 +--
 arch/arm64/boot/dts/qcom/sdm670.dtsi       | 158 ++++++++++++-------------
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi |  74 ++++++------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 178 ++++++++++++++---------------
 6 files changed, 291 insertions(+), 291 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 4536fa45869a757808f9a4486d41f0f6a039334e..19420cfdadf151394c4ebc821f68675036fe782f 100644
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
+			cpu-idle-states = <&perf_cpu_sleep_0
+						&perf_cpu_sleep_1
+						&perf_cluster_sleep_0
+						&perf_cluster_sleep_1
+						&perf_cluster_sleep_2>;
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
+			cpu-idle-states = <&perf_cpu_sleep_0
+						&perf_cpu_sleep_1
+						&perf_cluster_sleep_0
+						&perf_cluster_sleep_1
+						&perf_cluster_sleep_2>;
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
+			cpu-idle-states = <&perf_cpu_sleep_0
+						&perf_cpu_sleep_1
+						&perf_cluster_sleep_0
+						&perf_cluster_sleep_1
+						&perf_cluster_sleep_2>;
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
+			cpu-idle-states = <&perf_cpu_sleep_0
+						&perf_cpu_sleep_1
+						&perf_cluster_sleep_0
+						&perf_cluster_sleep_1
+						&perf_cluster_sleep_2>;
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
+			cpu-idle-states = <&pwr_cpu_sleep_0
+						&pwr_cpu_sleep_1
+						&pwr_cluster_sleep_0
+						&pwr_cluster_sleep_1
+						&pwr_cluster_sleep_2>;
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
+			cpu-idle-states = <&pwr_cpu_sleep_0
+						&pwr_cpu_sleep_1
+						&pwr_cluster_sleep_0
+						&pwr_cluster_sleep_1
+						&pwr_cluster_sleep_2>;
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
+			cpu-idle-states = <&pwr_cpu_sleep_0
+						&pwr_cpu_sleep_1
+						&pwr_cluster_sleep_0
+						&pwr_cluster_sleep_1
+						&pwr_cluster_sleep_2>;
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
+			cpu-idle-states = <&pwr_cpu_sleep_0
+						&pwr_cpu_sleep_1
+						&pwr_cluster_sleep_0
+						&pwr_cluster_sleep_1
+						&pwr_cluster_sleep_2>;
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
+			pwr_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-retention";
 				arm,psci-suspend-param = <0x40000002>;
@@ -229,7 +229,7 @@ PWR_CPU_SLEEP_0: cpu-sleep-0-0 {
 				min-residency-us = <200>;
 			};
 
-			PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
+			pwr_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -239,7 +239,7 @@ PWR_CPU_SLEEP_1: cpu-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
+			perf_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-retention";
 				arm,psci-suspend-param = <0x40000002>;
@@ -248,7 +248,7 @@ PERF_CPU_SLEEP_0: cpu-sleep-1-0 {
 				min-residency-us = <200>;
 			};
 
-			PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
+			perf_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -258,7 +258,7 @@ PERF_CPU_SLEEP_1: cpu-sleep-1-1 {
 				local-timer-stop;
 			};
 
-			PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
+			pwr_cluster_sleep_0: cluster-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-dynamic-retention";
 				arm,psci-suspend-param = <0x400000F2>;
@@ -268,7 +268,7 @@ PWR_CLUSTER_SLEEP_0: cluster-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
+			pwr_cluster_sleep_1: cluster-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-retention";
 				arm,psci-suspend-param = <0x400000F3>;
@@ -278,7 +278,7 @@ PWR_CLUSTER_SLEEP_1: cluster-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
+			pwr_cluster_sleep_2: cluster-sleep-0-2 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-cluster-retention";
 				arm,psci-suspend-param = <0x400000F4>;
@@ -288,7 +288,7 @@ PWR_CLUSTER_SLEEP_2: cluster-sleep-0-2 {
 				local-timer-stop;
 			};
 
-			PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
+			perf_cluster_sleep_0: cluster-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-dynamic-retention";
 				arm,psci-suspend-param = <0x400000F2>;
@@ -298,7 +298,7 @@ PERF_CLUSTER_SLEEP_0: cluster-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
+			perf_cluster_sleep_1: cluster-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-retention";
 				arm,psci-suspend-param = <0x400000F3>;
@@ -308,7 +308,7 @@ PERF_CLUSTER_SLEEP_1: cluster-sleep-1-1 {
 				local-timer-stop;
 			};
 
-			PERF_CLUSTER_SLEEP_2: cluster-sleep-1-2 {
+			perf_cluster_sleep_2: cluster-sleep-1-2 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-cluster-retention";
 				arm,psci-suspend-param = <0x400000F4>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index f89b27c99f40cf0c2edb71aa2e54c413971d0989..3164a4817e3267d458d81cabf2ae4223a7a94963 100644
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
index a08a64bc033ffdea283645c6bf4ed835a59c3366..c93dd06c0b7d6444aefd0e24201cea999dcb23a4 100644
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
@@ -43,15 +43,15 @@ CPU0: cpu@0 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 				cache-level = <2>;
 				cache-unified;
-				L3_0: l3-cache {
+				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
@@ -59,7 +59,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x100>;
@@ -70,18 +70,18 @@ CPU1: cpu@100 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x200>;
@@ -92,18 +92,18 @@ CPU2: cpu@200 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x300>;
@@ -114,18 +114,18 @@ CPU3: cpu@300 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x400>;
@@ -136,18 +136,18 @@ CPU4: cpu@400 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x500>;
@@ -158,18 +158,18 @@ CPU5: cpu@500 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x600>;
@@ -180,18 +180,18 @@ CPU6: cpu@600 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo360";
 			reg = <0x0 0x700>;
@@ -202,49 +202,49 @@ CPU7: cpu@700 {
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
@@ -252,7 +252,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -262,7 +262,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
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
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
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
 
-		CLUSTER_PD: power-domain-cluster {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_0>;
+			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};
 
@@ -1763,7 +1763,7 @@ apps_rsc: rsc@179c0000 {
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index e8276db9eabb29b8a6021fcdf33e959d2450af5d..743c339ba1081e3a70d94a58b13c12c5525a1b11 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -164,7 +164,7 @@ &cpus {
 };
 
 &cpu_idle_states {
-	LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+	little_cpu_sleep_0: cpu-sleep-0-0 {
 		compatible = "arm,idle-state";
 		idle-state-name = "little-power-down";
 		arm,psci-suspend-param = <0x40000003>;
@@ -174,7 +174,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 		local-timer-stop;
 	};
 
-	LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+	little_cpu_sleep_1: cpu-sleep-0-1 {
 		compatible = "arm,idle-state";
 		idle-state-name = "little-rail-power-down";
 		arm,psci-suspend-param = <0x40000004>;
@@ -184,7 +184,7 @@ LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 		local-timer-stop;
 	};
 
-	BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+	big_cpu_sleep_0: cpu-sleep-1-0 {
 		compatible = "arm,idle-state";
 		idle-state-name = "big-power-down";
 		arm,psci-suspend-param = <0x40000003>;
@@ -194,7 +194,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		local-timer-stop;
 	};
 
-	BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+	big_cpu_sleep_1: cpu-sleep-1-1 {
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
+	cpu-idle-states = <&little_cpu_sleep_0
+			   &little_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU1 {
+&cpu1 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&little_cpu_sleep_0
+			   &little_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU2 {
+&cpu2 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&little_cpu_sleep_0
+			   &little_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU3 {
+&cpu3 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&little_cpu_sleep_0
+			   &little_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU4 {
+&cpu4 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&big_cpu_sleep_0
+			   &big_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU5 {
+&cpu5 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&big_cpu_sleep_0
+			   &big_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU6 {
+&cpu6 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&big_cpu_sleep_0
+			   &big_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU7 {
+&cpu7 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-	cpu-idle-states = <&BIG_CPU_SLEEP_0
-			   &BIG_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&big_cpu_sleep_0
+			   &big_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
 &lmh_cluster0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 9a6d3d0c0ee43af337728546626ec70ce47b9ec6..1cc0f571e1f7f3023efa08adf2791ffce5f2fecf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -31,7 +31,7 @@ chosen {
 	};
 
 	/* Fixed crystal oscillator dedicated to MCP2517FD */
-	clk40M: can-clock {
+	clk40m: can-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <40000000>;
@@ -863,7 +863,7 @@ &spi0 {
 	can@0 {
 		compatible = "microchip,mcp2517fd";
 		reg = <0>;
-		clocks = <&clk40M>;
+		clocks = <&clk40m>;
 		interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 		spi-max-frequency = <10000000>;
 		vdd-supply = <&vdc_5v>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 49440d1b2cf6caf6da9d97c635cbd751f0700326..1ed794638a7cee7ec5ead15160e5fd97037ba5ff 100644
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
@@ -103,16 +103,16 @@ CPU0: cpu@0 {
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
-				next-level-cache = <&L3_0>;
-				L3_0: l3-cache {
+				next-level-cache = <&l3_0>;
+				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
@@ -120,7 +120,7 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x100>;
@@ -132,19 +132,19 @@ CPU1: cpu@100 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x200>;
@@ -156,19 +156,19 @@ CPU2: cpu@200 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x300>;
@@ -181,18 +181,18 @@ CPU3: cpu@300 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x400>;
@@ -204,19 +204,19 @@ CPU4: cpu@400 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x500>;
@@ -228,19 +228,19 @@ CPU5: cpu@500 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x600>;
@@ -252,19 +252,19 @@ CPU6: cpu@600 {
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
-				next-level-cache = <&L3_0>;
+				next-level-cache = <&l3_0>;
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo385";
 			reg = <0x0 0x700>;
@@ -276,50 +276,50 @@ CPU7: cpu@700 {
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
@@ -327,7 +327,7 @@ core7 {
 		cpu_idle_states: idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -337,7 +337,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
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
@@ -5278,7 +5278,7 @@ apps_rsc: rsc@179c0000 {
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.43.0


