Return-Path: <linux-arm-msm+bounces-30018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 816529644D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29032849F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1531B5335;
	Thu, 29 Aug 2024 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WagV9jzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B701B4C3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934919; cv=none; b=Km7wxeot3YNmaYe3xJSMM34QS1iNnoOda8Aojcdpq/JlBBcvlBIKE/hoADyF2Ml3+Z4/q4+6308SEC9hbqgAUM/MyPxWwuDOT/HnnhZp6c9UsOmOfRuXWeNnL3NBGfGw/iRM+LLlLxG/GlVWix/T89V/b1QtlzhM5JVSXWVzklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934919; c=relaxed/simple;
	bh=P39S0xWGxif30WD1UKDRfbbud3uciFtE/rLUEAb4cIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlBxNBrMX71M3ZVv7u7JQGLQGQIrhWDxkU9+E6mmWbWXRQ9AvpDDUZl+wANiHcThdkzEBhVEiE6jQbea1JB148upA1RmFtbzKWpKlDT1zbHD4KmxWrcxxunNM1BWNhQbO5lFHWC/OE+okLflvp/NG7n25v2cSr2MOPOUnpwfwmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WagV9jzm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42baecbd4fbso912085e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934915; x=1725539715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtZQMCUxJF90XHx7mBzRmkvuAg8yISi1s5y8keOdRpY=;
        b=WagV9jzmCbAzdIMX+wayEv/U1CQVh+TbMPSsIwOWnMuZBe+HR+6YYa3ms2kVZ6GfHt
         Z+UZuFZTzW83M+dntT7D5WDY3xpNRHD+FneBKw3XxqmWu5RwcEUxKObkhqI+seaiai0N
         50xeQzQv59eOhJ/eEKNoPYzKoun9WaJ284yfoytKeGNzrCnzugozV2jne9yXmHrZ8mS1
         sORX/A6u85JoXmeDAtk2NKNmKvv13vUz0YXMACPrvdeNUDCNZ/hevehW42qi/SHETmpr
         4ViDGu0N9Nc2ZXjdpA+if7+Ygv0HpMTR4O5rcHlILp7aQ9wiRNTHv1oJtazMzSM9GHr5
         FaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934915; x=1725539715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtZQMCUxJF90XHx7mBzRmkvuAg8yISi1s5y8keOdRpY=;
        b=mM3VqxyQuJhl2fuso79IwBNx4zBHGy1OrxpvRiPiGU0sX7wRw2PIBcgrYBk4JrskVs
         zvF6+6/qNEp6Y0+BQ+Rxkwi1grxEhZ3ZFt0SJIXbSBeRhVaVENuXKZUhTXL3LXgxktMc
         lmf6UJm66XiQHFObEFh3I6OOqk7/N9OAxDL2t6GPBEcWFc2IwveuwCSNLEQzoX0mCAWQ
         9uRmH2ADAJENFDyfbilSwyKTqpcn7a9xLg2mCTZxQ62jpVgwb2ZOEEa65BbC7qpFyhXg
         MRpDbmNKkmX5mnYBxeOQAFj8xfS6a/OruY5kUz5MDe5+1EC/AfbUiIQbxgHF2SplNSCs
         h7lg==
X-Gm-Message-State: AOJu0Yz+1px/+QEclvOcX4yjZCSFun6Dd0BcyHv9RnnDfwxWuRYs3ZvV
	QBE+HrMvfVxmAXsSNoUGtTjVGXtgTIAl6A9lzUWHCRdCxSsPuJuZafsIgjpyjVc=
X-Google-Smtp-Source: AGHT+IHMCny/BXrKQLClrHAVa0bXylD+v3GOBAlKy2cTPgEk0L3KGGJBHGUHi88jj30y+EeSMfndiA==
X-Received: by 2002:a05:600c:3c82:b0:424:ac9f:5c61 with SMTP id 5b1f17b1804b1-42bb0205099mr13458775e9.3.1724934915260;
        Thu, 29 Aug 2024 05:35:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4a55fsm1322270f8f.10.2024.08.29.05.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:35:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 29 Aug 2024 14:34:42 +0200
Subject: [PATCH v2 07/17] arm64: dts: qcom: sm6115: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-dts-qcom-label-v2-7-5deaada3e6b2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12301;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=P39S0xWGxif30WD1UKDRfbbud3uciFtE/rLUEAb4cIs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0GrrGO5AAWdCMzl1CaGiVOrRQDuhYFg8Vi5UR
 XMvG3JPdnSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtBq6wAKCRDBN2bmhouD
 1zTaD/wJAqeKXqkMXTqs30kF9xLpMYbY8OJlfvpaUYuVwvpyu8bG1uKOO9GFNf7yBi/EgyGO2Pm
 cJI3wGBTPQpTucJidDM2tkJtWN92D9Oj1Z0l+Z8GsNoxcgmpmu3pHCR4RzQ2vPPJqi3r7JBefJt
 5rv6yf690uCCT2S5jtE1VZ2kU10TuRsh70niRBd9wnoiYOB9ydeVFNRJISsHIUN9l7pZatS8fDE
 PjeEwj4WYxc3JpFN7l9u/CZj0cV4JTJlcju9gF967cQECCsl2/Gm/UqB2Gb8h9KT1K7LyQj+hdD
 gECu0GG9cAi6u1G+WhBVl4K6Y5nQtXWFRYpCGB5RoN/I9uZ9xkIasVgUjn2QjgAHi5NVqPy1snY
 TOJsqjX1ujlMosTu2TRP+Sy87ckWM8BGz42mBUBp5C01/B51IDb8Whw+lezTWfnvR4ATA/4PgMU
 6MzwnwrWZXkoPMHYvCaJSQKH0cQlOOcLlsk9WlNgA6GYP57e/K0Ms+y6qGLNFHO93jbLrXDohn5
 /3surqWJPgu/ZGTE6EyAhvvyjMTf00V9Y/2uOannk9CyIsGJodFa83VocoAlxwGbmzCNnF8lIAJ
 Cc50zHKiMoA/xC4AnQQwwekVMqQiQG42Hvl7WIZQTA0FVGF9c3Gukr8h2qZMrBRzcETLh1X3bE8
 bOPUyDuYBo/mScg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi |  16 ++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 152 +++++++++++++++++------------------
 2 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index c5add8f44fc0..a0ed61925e12 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -5,34 +5,34 @@
 
 #include "sm6115.dtsi"
 
-&CPU0 {
+&cpu0 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU1 {
+&cpu1 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU2 {
+&cpu2 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU3 {
+&cpu3 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU4 {
+&cpu4 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU5 {
+&cpu5 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU6 {
+&cpu6 {
 	compatible = "qcom,kryo240";
 };
 
-&CPU7 {
+&cpu7 {
 	compatible = "qcom,kryo240";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 41216cc319d6..abaabeb41439 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -40,7 +40,7 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x0>;
@@ -48,18 +48,18 @@ CPU0: cpu@0 {
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
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x1>;
@@ -67,13 +67,13 @@ CPU1: cpu@1 {
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
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x2>;
@@ -81,13 +81,13 @@ CPU2: cpu@2 {
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
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x3>;
@@ -95,13 +95,13 @@ CPU3: cpu@3 {
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
 
-		CPU4: cpu@100 {
+		cpu4: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x100>;
@@ -109,18 +109,18 @@ CPU4: cpu@100 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			power-domains = <&CPU_PD4>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
-			L2_1: l2-cache {
+			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
 			};
 		};
 
-		CPU5: cpu@101 {
+		cpu5: cpu@101 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x101>;
@@ -128,13 +128,13 @@ CPU5: cpu@101 {
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			power-domains = <&CPU_PD5>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 		};
 
-		CPU6: cpu@102 {
+		cpu6: cpu@102 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x102>;
@@ -142,13 +142,13 @@ CPU6: cpu@102 {
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			power-domains = <&CPU_PD6>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 		};
 
-		CPU7: cpu@103 {
+		cpu7: cpu@103 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x103>;
@@ -156,46 +156,46 @@ CPU7: cpu@103 {
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
-			next-level-cache = <&L2_1>;
+			next-level-cache = <&l2_1>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			power-domains = <&CPU_PD7>;
+			power-domains = <&cpu_pd7>;
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
@@ -203,7 +203,7 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -213,7 +213,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000003>;
@@ -225,7 +225,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		};
 
 		domain-idle-states {
-			CLUSTER_0_SLEEP_0: cluster-sleep-0-0 {
+			cluster_0_sleep_0: cluster-sleep-0-0 {
 				/* GDHS */
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x40000022>;
@@ -234,7 +234,7 @@ CLUSTER_0_SLEEP_0: cluster-sleep-0-0 {
 				min-residency-us = <782>;
 			};
 
-			CLUSTER_0_SLEEP_1: cluster-sleep-0-1 {
+			cluster_0_sleep_1: cluster-sleep-0-1 {
 				/* Power Collapse */
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
@@ -243,7 +243,7 @@ CLUSTER_0_SLEEP_1: cluster-sleep-0-1 {
 				min-residency-us = <7376>;
 			};
 
-			CLUSTER_1_SLEEP_0: cluster-sleep-1-0 {
+			cluster_1_sleep_0: cluster-sleep-1-0 {
 				/* GDHS */
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x40000042>;
@@ -252,7 +252,7 @@ CLUSTER_1_SLEEP_0: cluster-sleep-1-0 {
 				min-residency-us = <660>;
 			};
 
-			CLUSTER_1_SLEEP_1: cluster-sleep-1-1 {
+			cluster_1_sleep_1: cluster-sleep-1-1 {
 				/* Power Collapse */
 				compatible = "domain-idle-state";
 				arm,psci-suspend-param = <0x41000044>;
@@ -306,62 +306,62 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: power-domain-cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD1: power-domain-cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD2: power-domain-cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD3: power-domain-cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_0_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			power-domains = <&cluster_0_pd>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
-		CPU_PD4: power-domain-cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CPU_PD5: power-domain-cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CPU_PD6: power-domain-cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CPU_PD7: power-domain-cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_1_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			power-domains = <&cluster_1_pd>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
-		CLUSTER_0_PD: power-domain-cpu-cluster0 {
+		cluster_0_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_0_SLEEP_0>, <&CLUSTER_0_SLEEP_1>;
+			domain-idle-states = <&cluster_0_sleep_0>, <&cluster_0_sleep_1>;
 		};
 
-		CLUSTER_1_PD: power-domain-cpu-cluster1 {
+		cluster_1_pd: power-domain-cpu-cluster1 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_1_SLEEP_0>, <&CLUSTER_1_SLEEP_1>;
+			domain-idle-states = <&cluster_1_sleep_0>, <&cluster_1_sleep_1>;
 		};
 	};
 
@@ -2405,7 +2405,7 @@ etm@9040000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			status = "disabled";
 
@@ -2426,7 +2426,7 @@ etm@9140000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			status = "disabled";
 
@@ -2447,7 +2447,7 @@ etm@9240000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			status = "disabled";
 
@@ -2468,7 +2468,7 @@ etm@9340000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			status = "disabled";
 
@@ -2489,7 +2489,7 @@ etm@9440000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU4>;
+			cpu = <&cpu4>;
 
 			status = "disabled";
 
@@ -2510,7 +2510,7 @@ etm@9540000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU5>;
+			cpu = <&cpu5>;
 
 			status = "disabled";
 
@@ -2531,7 +2531,7 @@ etm@9640000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU6>;
+			cpu = <&cpu6>;
 
 			status = "disabled";
 
@@ -2552,7 +2552,7 @@ etm@9740000 {
 			clock-names = "apb_pclk";
 			arm,coresight-loses-context-with-cpu;
 
-			cpu = <&CPU7>;
+			cpu = <&cpu7>;
 
 			status = "disabled";
 

-- 
2.43.0


