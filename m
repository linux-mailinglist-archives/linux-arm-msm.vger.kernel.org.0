Return-Path: <linux-arm-msm+bounces-35449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF79AB290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 509291C21E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6F21BCA0A;
	Tue, 22 Oct 2024 15:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNW9U2se"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761261BC088
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612090; cv=none; b=mDqDRJVwYNT86B90fpE4j3F1eP1X6F0vGSJ5U+Bq7NosdvQB1ZIcU0ggsX1rnbgqBAgdTqX2cTLuvqcfsdBp2+PwB4uRBXzQOzftg2e0zKZjw7RCgG0wHngRJPQtFKKj17kmlLDnXOwJ/VE/1/mVfZyU/GnQl068tk1zMTeXa1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612090; c=relaxed/simple;
	bh=VUslH+m2Mx1BtwG011I/Ooby0XfmI/ZPcWy+fsQobhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4QU7o51IdJUKDtHDKEO9k/BOWecS1RJyiUuq3jLGDqudiGvTcf9iBp6goa+5/uRFNq34VhmjpyRjRIq9dangCPeWHoey4+lmR078sk0Z+QOQ2Liu5h8zOu6OgOPeQlvLjgMAZcD1pH4wkjwNnYBXQZ7xYYAS75zxyY3X525TGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNW9U2se; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c99bcda599so1015947a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612087; x=1730216887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivZsSZO9OfvxeEE+BH4sPjxfSAzzHCBWQb2khfWSXzo=;
        b=JNW9U2seq19EB4VQGZmBP8z/9Xvp1GzUfUTmJEYt0rHDSq17SQbCPy5UkDApIxqLmL
         97l0EhKNCQIykbdmZU+5YSIbWJSo8uHAhSvCD7EYqrQ7wMhPcnVqxxvBgiLQ4xWobF5Q
         x31ukRDYDPbJNR2V0oe7ccY4zQMZ2EL2v7L4ivOygyj7+0SlO5CEqsJBlBdMsGvg+NKk
         xKZoJ/yRajsCSirbFNlUbUWuPptmEUj41CY0Sd/bJPIYxTIM8QmIxr2W3KnGbk+PwycG
         +xGpvcZ2HXsVw6Ge5Jdm4tnqbedO6a4wEEr6cod5BI3RRQUk5P9X8Z6iEUSlxejiL/jl
         DYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612087; x=1730216887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivZsSZO9OfvxeEE+BH4sPjxfSAzzHCBWQb2khfWSXzo=;
        b=edILD3luiu5pquq8hZpgkIZkNViMH6f/MsKwEPTmTbhgnXLEKAiygiqOhxWTLg4n3T
         +y6lHw75vfzfjIYoQOoODW76aOHDTQmHWhi/4SwYbMnzVGtdSpYh8LiM9/C6Wcb7myD+
         G36PY1n+Pdqk69lDVJdQFkM/AgaYtJB1c68CdKZmpj7IDp0a/nFdB8xrS8efx+XwPI9Z
         CCKjUh4oA4oKvjK3/MGaRcfX9oVXdtwRMXv7JM083eMU8IrVqmolOMM7T9iXN+uWwxQ4
         sszv047BXpR6kcr4oSHOsUj8W1yKiCB6oQN++BatvaRupSkY6McmCMf0/cwdhuJeYOS1
         /Quw==
X-Gm-Message-State: AOJu0Yy+283+F89NcLel6VPzsrhSfJkQkk6ANCOdi2NGG3zQqMcqKLJK
	tkEJpTQEp+wbs1lqoi0hAszxshXDy90mnyaSY3QrJZ7QOE4hTFn+8rm0TNpfQVw=
X-Google-Smtp-Source: AGHT+IGcXVJWChLnbOvnR4IT5mUx5VKyE17UbWNC6dLZLOz8d7DjlyvP+ak+VMU8GUQGB+Sl+4/A7Q==
X-Received: by 2002:a05:6402:524e:b0:5c9:3f2:e526 with SMTP id 4fb4d7f45d1cf-5ca0ac43c60mr5755394a12.1.1729612086652;
        Tue, 22 Oct 2024 08:48:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:32 +0200
Subject: [PATCH v3 07/18] arm64: dts: qcom: sm6115: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-7-0505bc7d2c56@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12413;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VUslH+m2Mx1BtwG011I/Ooby0XfmI/ZPcWy+fsQobhU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kaVOyIyXL+dkosPvUCGA/c0hsqj2OoecSQo
 C9PqLsPYkGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJGgAKCRDBN2bmhouD
 1xClD/sFWyxi1SQDjnyzDvKLlqoQwMA2dUpz2pddT2XHhNjRP20J1JkNR02a2Ek7uYF3rVLrnCc
 3MSvekbttjuX8xxXS4LoAn0ZT1wE0Sqvg4KyeuKZRohkPNBpSiTkpwVg+OJPtxsHTxlP8nQOTlt
 naJmmfGHdQKkWkkqEI3FQBzIBSrqfYA5uA6cO5yu0XBEnDivmKLQ9OpPWfrZMKt7yau7B0nm/KC
 Tg0lYp2cKPD8yZQp4IeBrV2Vso+wVXR1Kd5CYjcBi+S9ajxr3GmducMd0FaaVf7DX5I5mY9u7E/
 D6doXVeEkpQUer3z7/Ko/1EpKLsiK0pWmpUrP9jDgyRg8nTCUQ3JSxQfC6wTehbsfst11K1henM
 cvaE58lHsT+uxIXjbG51J71JS+IvGuRxrsvCBEs4SDZVPPjJ2NrdFLu3L+cLhPlzYL3egedxFsX
 FI0Xagq6nkiEiP33Z+Qg9godOdHYlGrP4LEC0kI77oGrY3ixKazTFzXu8PjiLUwVquHIC9aJPS1
 4eFsbLzLzzrnypN9YQIV/RY+VYb6y6mgPYGDMyG8sTpZteb1MKm2PZBJz5Tx5BKWx24iQFOl6Fu
 4zhP9s1a6S3I9guZfZOKHyDDX+SblPZdol47R3FMyCWfXAOWkr06/wIqPCBAZN5SU9KnlchPAlV
 itbCBnSG4IDUxXQ==
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
index c5add8f44fc0f28bc775e392f1d5418eeb25b480..a0ed61925e12d63f8b9d2fb5d31cc7480c85a66f 100644
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
index 41216cc319d65e34737b2e1e4376c6ac6bc1a646..abaabeb414396ff3c8dd001b474901f16cb722bf 100644
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


