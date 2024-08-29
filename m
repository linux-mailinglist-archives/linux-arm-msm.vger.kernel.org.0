Return-Path: <linux-arm-msm+bounces-30023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A99644EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C77ADB25986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A900B1B7907;
	Thu, 29 Aug 2024 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KPiVee3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F21B580A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934928; cv=none; b=k/flw/V7GJiAx5PvXinLAQrJW8PYi5teYvewiykQkatRSqmZlvd9Dj/GGEGeMfSW9wXMgmplW02WQXZqy4blFTvqsZqeBeVT1GJR4lTdxvVpPB+AuAKXItzJJ8XzUPiDWgD+uSRnhmSpZ2pDpgdR0Tv7nyXZbgWThFmqy/+GGmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934928; c=relaxed/simple;
	bh=QHOLYUtQezRctDhR2RrpSTUZZ7scvK6bJP1m5UnJg+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkHIvV8vXk0R/RepIiLc30sk/hvcHScmwRzGbi+DwXR4hDi3m2ganaqGspYhsrtTcQjeY2zLRsRJFCv4qNt9HAsU/ud+gifZSauYeDYbU5scP/XQWVSJUV0KgXLI03hyuNgAI9yM3Ch+STpMycmTVmP3pmUeh8AqgCkwSNLs3xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KPiVee3y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37308a2ea55so23291f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934923; x=1725539723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh2iB6tujNnzzjzaI9tmW+CR3oJuvsrCmaQYUXPbn+o=;
        b=KPiVee3yl0+t2g66Y8l/lQ71q5DrPIDb7BN9O+3bRLMT8HzIrxhO5Kl43HUahOiFWN
         ox5/nI4IkeF+PPn4XxoE+eVsvJn6DTGJNQpgYvS2WF/ybMGXDN11Pvw0oGrk/LSCyMYh
         zQRCXlNNijmjhjuORDcLxdogkltaJPYXzDu4vxvESkwrvAQh9PK2AqF3f1lCecmt6WcR
         FsSjSlCEbjw6b/bjNx+o2Q7MUqJ9UIKlYJIpsRPh/jkzQFLOMSZ2+MhNKeLYCdN9jSBm
         dibpu8UCgR/K5St4PMUn+k+UJ+evdnxZOnj/VCXlmMthlH0ZDzF/o7I8C5cuy3DClJri
         9ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934923; x=1725539723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oh2iB6tujNnzzjzaI9tmW+CR3oJuvsrCmaQYUXPbn+o=;
        b=ntwY2xoiW/OYV9XahtC7dZgMLaofhKVtqtolpz8CROPHwNILHfUseLBUnvjnwxsKqC
         YfIKJMwv6IueaugcXsZTfMMvI+sEpY/DgL67MHN9fq434M26VOB1Ahov9t+nB2oFEW8D
         E1DMB6i95DgahJDxeMQrndd8SGfLUnjyi/VCtZNEu9Y+BZRe40u6HKif+QKhKeiUMABX
         FF7+GkvmSEBgmKIbRyDHoxEGO8M8lg5eqMbDFPfXZcmJGx4sPwgpsPfT0+fLCbE5zBkK
         ajqxRqm/qSO6vr0Q886ZY2ILkWuDguyrgdP9tg3K/5WXj4Zu02LfcR5lQhbb+9Kvv/f3
         TlLA==
X-Gm-Message-State: AOJu0YyLFLPNd6OZAnTVBBKQ29dYmholEnsjQlfhniRcUp0BpliQrQxu
	ifEksflJABshowI4ualyNyvM9WA/5tQBpIdpiuX0S+JT00klpN4/qdz24DwE3F0=
X-Google-Smtp-Source: AGHT+IH2w1xH+f94h5kMP1JC2aIhBt2Yrt2PsnjdN8K3GxRj5aZKr66/AC/Onugwc1z1zDBXbNYkRw==
X-Received: by 2002:a5d:5f49:0:b0:367:9495:9016 with SMTP id ffacd0b85a97d-3749b57fefbmr1248347f8f.6.1724934922701;
        Thu, 29 Aug 2024 05:35:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 29 Aug 2024 14:34:47 +0200
Subject: [PATCH v2 12/17] arm64: dts: qcom: sm8450: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-dts-qcom-label-v2-12-5deaada3e6b2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10512;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QHOLYUtQezRctDhR2RrpSTUZZ7scvK6bJP1m5UnJg+A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0Grwro0R72drnsIa96I9xj7Jwm0znLvR6bpt3
 /74tMYMBFaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq8AAKCRDBN2bmhouD
 1+TGD/oDLchPcWC6Qi5og9R/eN0IZRXjqWDfGlrGMShm3Ryd4lBWNg5cwbd/4LeHBInuu2O3at3
 vcT+HGf7NtQB+U2qkd1XVbuDrC1hZSf5Q2JNFaKNsfZKR4QuANQ2zoVNkQqrshhGqziuG8p+zCT
 Q91Tej6/kX6Ok4zondXKDnvGNUyFisI7zpVxaU4H0F858lnjl1Tt6sE9loQST5FNqwvvDSWRU17
 zOaHgoOb+vqvwhy8QwotI+m35CwAvtfjLxWSlvfLvxopjry2z7hJz01iMGK/7TxS3BNIgso8J5x
 Y+y5vNl3ViyPRc+IJVW7QvIiZBlaQYRmKrpGT+K9kEFsf7+NxxGeNSfYWzG4wdVx5hSFy1edyvM
 akq3BxavJJ8FiLqaNfl7eVqj8s+MPlG/TGQFj4OVd8nRzOtSlu5W/5iocxCF01OeVtFEz6zp08H
 DO+h4O1gr5R0VMWFB7lE37wL5vY920cQSbCH71bPL16GVKCOJhGeoCfypNW+O76s1tHVyndoNCj
 fcEN/JJv0IOmfUorU1mLY2+sButW4qDHd41PhyPQgcHlaWhzjxxxOv1i/nagocHv3vFv/l5+MZS
 6ra2WUV44jfKlmaakxAB86Ye13OGru42350xDEuosbjrEruS5YLtXlyA0R4REzHxdW9IakZxWdo
 7xZtzAg8HyvCiug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 160 +++++++++++++++++------------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9bafb3b350ff..4126224c1679 100644
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


