Return-Path: <linux-arm-msm+bounces-29714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372AA96209A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BDAC1C239E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB9615AACA;
	Wed, 28 Aug 2024 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8K5LnOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52615A4B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829484; cv=none; b=HFUFnENyiBdQPa7Rj2AmJscZSpJ/QxOFeX0qaQ5vUKRGd5T0jAyNEIlief5yKtL9BHclUhQIO79Y014Rsl6eoDxexFnpBGFyaOfhhLVHd1JvDAQqGPEJ21KSJs9yIc5KFvfelNZCtsBf5Oc+Upg+7Ww7UEeEQCVxoc6+q4JB5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829484; c=relaxed/simple;
	bh=9xFo0eqJACDBytuCX1V3rePCU01EF0FRKpoOtpC7OFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLRydn02IY+b6uxSJl2FAiV1C3OZADxWuD3UChkuBVSNZQ1MS27GVOjE+hn2gyX/bnsW/pyM+UURq3ztt7Bo6n9XHU1XPF0+r4kegjjrBWQxPUflaxQtHOtx9YSJFiKf/5g/PZR6Fc7QnCgXJUTZe+c4dVUjO++ZL3w7cnmKQH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8K5LnOx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4281ddd3ae8so4644985e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724829480; x=1725434280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XBBubaLbhccXGbOwK9x3FlWGmK97Tmag5Ca+ynCrjY=;
        b=a8K5LnOxsNlEyJ3dpTN7yzTKPpEB7lCd8bX0ZsHcObkgnphgpkhSMH340qM7NhgsLT
         kBiowZdnY6oZcqApCp3ZUmOLfBZtHBgRHzWEF8CktohlWQNpHe8P9Ch+ZDR6Q5lnqSd0
         iIlXrcm0HQcEldc27ZlvmhSbICVbmCjLSoz7k2heclJk29hsiF0CZ7CG88wzSXxaq9iG
         cFxjFGBvEcfS3CeFxP71NkcOqY/xPs+bSVRGGXPyFv0I6mx1QL3h0EQCdnzrOeRsIUiQ
         9JO0HLjBiij/ACuMfb8zRFbEUlPssgnZpJOyqK5xf+zeNqYaL9wkCYv12Hf7oyso2iBS
         OXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829480; x=1725434280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XBBubaLbhccXGbOwK9x3FlWGmK97Tmag5Ca+ynCrjY=;
        b=TmFMdPn7HyavcS2Y+HEgLk+mqBTHzlqIYaqYe7MS/JWa5mcVsgYgZ08EeYfzAFirfM
         wf3zWgdeje8V6C/lR1lGx4+RkHxaywpl+OgTKX+OPJSMrcSHUHX9LFH1fHG2ANrpWI11
         tUzoZ4PoLvEX4wUcEKobEzWneQzU1LmYJaa6vLiKTHmPu1Qm9ZoNa0YBR9vPWUorG6iS
         pvia/Ao1ZxEboxtuMTXbbWlClX74MNMoHz2PWJ1m1hmQB4O8mflbl/kvAkU6L1fRspHl
         n2wzEfdkCEJnzN6ha0Fwu417/oNfTq9MboWUxLkkuuCw5IHHc+RWDKZS3JOvjwnw8lCi
         mNFA==
X-Gm-Message-State: AOJu0Yw52cw0q8PpHoTJSw9BH5rv7sWSvDqosnTyCxPctOrcvPw3qHjY
	DyB/FBKai4gUGv6JY4HPs+0YnGjAFlNV47T2IaO7PRhaQ4fy2bF2DX293LHIIS0=
X-Google-Smtp-Source: AGHT+IFwj9JlnO10EtmuKdtQmhDi+QhCXltH9iDKZAeiJD+EEyztxgr49K/WaRAl6VpOzSGN+dqMnw==
X-Received: by 2002:a05:600c:1391:b0:424:ac9f:5c61 with SMTP id 5b1f17b1804b1-42acc9ff4c9mr71561175e9.3.1724829479649;
        Wed, 28 Aug 2024 00:17:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308200404sm14843476f8f.81.2024.08.28.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 00:17:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 09:17:33 +0200
Subject: [PATCH 03/16] arm64: dts: qcom: sc7180: change labels to
 lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dts-qcom-label-v1-3-b27b72130247@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=34642;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9xFo0eqJACDBytuCX1V3rePCU01EF0FRKpoOtpC7OFY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzs8UMELBjqcHqp4mkarCQ9R8xKMZfKolkGJD9
 E/aI3x/okaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7PFAAKCRDBN2bmhouD
 14vCD/9JPA4PgC8tWuaqW4Dc8P+fliZAefUvmoL2PjX7O0ocebn4L963ZiRi7P3/0L53wYTSCjv
 q5o0z6WmTyibB+ICexaFt7cUss3lSfxPI/8adSx+YuYVONk+qWMucmAhy2RkZVmdGI2nwHVHZtY
 n2PbXhDjlN/MKCZivHlNROTCm9IyhMzQ+tLbvlhNIGJZ2bIL0BMeJUxARlawH+Uj/va3wx4yspY
 H2J4Y18bjIHwMAu9ahUWmGrYfknK3fy7Td9DxOBGQ8jpMGZNkB9IfhPV27v01ij/xYVTcyIkVCL
 0RZxL36nKRaxbe6A51Wn4Nv2Q9VOup0/S+EHNiz/tkRIyGs1D2WZf1T8Vl89gRTIpLoUBWaKLBQ
 LyfW6RSIyi9pPhanG9S1h9h8Bmmx0E6g323/uVdxaShA8pjCqZdfArh4FvZMCjVuAzv1IVvk4dP
 1yAK7R59xdL34l/G90NKACHSHcR6nqy+0bhCJV5e//wEBb4fhWhtScgncW2nR2yVX7ubd7R/VNH
 dF/N00qac+BtzfApjhZB7tt5zZBdqppzf01QGrVaNk/q2AbkJDjShzdt+IjwPpm+E2QDeB0KR5u
 jzg/PvODSO5IICXkNDqqbYUfF4beSY1bfM5UlvLuCHzFIG1rIErkenEcRa+oO59OJvfD64ZGCfM
 nuAmDUkg1cN0VzA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  |  84 ++---
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 344 ++++++++++-----------
 arch/arm64/boot/dts/qcom/sm7125.dtsi               |  16 +-
 6 files changed, 234 insertions(+), 234 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi b/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
index ee35a454dbf6..f362b6b436ce 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
@@ -6,82 +6,82 @@
  * by Qualcomm firmware.
  */
 
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
 
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&LITTLE_cpu_sleep_0
+			   &LITTLE_cpu_sleep_1
+			   &cluster_sleep_0>;
 };
 
-&CPU5 {
+&cpu5 {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
 
-	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
-			   &LITTLE_CPU_SLEEP_1
-			   &CLUSTER_SLEEP_0>;
+	cpu-idle-states = <&LITTLE_cpu_sleep_0
+			   &LITTLE_cpu_sleep_1
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
 
 /delete-node/ &domain_idle_states;
 
 &idle_states {
-	CLUSTER_SLEEP_0: cluster-sleep-0 {
+	cluster_sleep_0: cluster-sleep-0 {
 		compatible = "arm,idle-state";
 		idle-state-name = "cluster-power-down";
 		arm,psci-suspend-param = <0x40003444>;
@@ -92,15 +92,15 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
 	};
 };
 
-/delete-node/ &CPU_PD0;
-/delete-node/ &CPU_PD1;
-/delete-node/ &CPU_PD2;
-/delete-node/ &CPU_PD3;
-/delete-node/ &CPU_PD4;
-/delete-node/ &CPU_PD5;
-/delete-node/ &CPU_PD6;
-/delete-node/ &CPU_PD7;
-/delete-node/ &CLUSTER_PD;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+/delete-node/ &cpu_pd6;
+/delete-node/ &cpu_pd7;
+/delete-node/ &cluster_pd;
 
 &apps_rsc {
 	/delete-property/ power-domains;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 3c124bbe2f4c..25b17b0425f2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -53,14 +53,14 @@ skin-temp-crit {
 			cooling-maps {
 				map0 {
 					trip = <&skin_temp_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 
 				map1 {
 					trip = <&skin_temp_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index b2df22faafe8..f57976906d63 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -71,14 +71,14 @@ skin-temp-crit {
 			cooling-maps {
 				map0 {
 					trip = <&skin_temp_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 
 				map1 {
 					trip = <&skin_temp_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index af89d80426ab..d4925be3b1fc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -78,14 +78,14 @@ skin-temp-crit {
 			cooling-maps {
 				map0 {
 					trip = <&skin_temp_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 
 				map1 {
 					trip = <&skin_temp_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b5ebf8980325..4a080fc77e6e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -77,23 +77,23 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x0>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD0>;
+			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
-			next-level-cache = <&L2_0>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_0: l2-cache {
+			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -106,23 +106,23 @@ L3_0: l3-cache {
 			};
 		};
 
-		CPU1: cpu@100 {
+		cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x100>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD1>;
+			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
-			next-level-cache = <&L2_100>;
+			next-level-cache = <&l2_100>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_100: l2-cache {
+			l2_100: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -130,23 +130,23 @@ L2_100: l2-cache {
 			};
 		};
 
-		CPU2: cpu@200 {
+		cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x200>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD2>;
+			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
-			next-level-cache = <&L2_200>;
+			next-level-cache = <&l2_200>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_200: l2-cache {
+			l2_200: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -154,23 +154,23 @@ L2_200: l2-cache {
 			};
 		};
 
-		CPU3: cpu@300 {
+		cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x300>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD3>;
+			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
-			next-level-cache = <&L2_300>;
+			next-level-cache = <&l2_300>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_300: l2-cache {
+			l2_300: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -178,23 +178,23 @@ L2_300: l2-cache {
 			};
 		};
 
-		CPU4: cpu@400 {
+		cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x400>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD4>;
+			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
-			next-level-cache = <&L2_400>;
+			next-level-cache = <&l2_400>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_400: l2-cache {
+			l2_400: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -202,23 +202,23 @@ L2_400: l2-cache {
 			};
 		};
 
-		CPU5: cpu@500 {
+		cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x500>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD5>;
+			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
-			next-level-cache = <&L2_500>;
+			next-level-cache = <&l2_500>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_500: l2-cache {
+			l2_500: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -226,23 +226,23 @@ L2_500: l2-cache {
 			};
 		};
 
-		CPU6: cpu@600 {
+		cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x600>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD6>;
+			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <480>;
-			next-level-cache = <&L2_600>;
+			next-level-cache = <&l2_600>;
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			L2_600: l2-cache {
+			l2_600: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -250,23 +250,23 @@ L2_600: l2-cache {
 			};
 		};
 
-		CPU7: cpu@700 {
+		cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo468";
 			reg = <0x0 0x700>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD7>;
+			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <480>;
-			next-level-cache = <&L2_700>;
+			next-level-cache = <&l2_700>;
 			operating-points-v2 = <&cpu6_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			L2_700: l2-cache {
+			l2_700: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
 				cache-unified;
@@ -277,35 +277,35 @@ L2_700: l2-cache {
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
@@ -313,7 +313,7 @@ core7 {
 		idle_states: idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			LITTLE_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-power-down";
 				arm,psci-suspend-param = <0x40000003>;
@@ -323,7 +323,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
+			LITTLE_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "little-rail-power-down";
 				arm,psci-suspend-param = <0x40000004>;
@@ -333,7 +333,7 @@ LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			BIG_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-power-down";
 				arm,psci-suspend-param = <0x40000003>;
@@ -343,7 +343,7 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+			BIG_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "big-rail-power-down";
 				arm,psci-suspend-param = <0x40000004>;
@@ -355,7 +355,7 @@ BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
 		};
 
 		domain_idle_states: domain-idle-states {
-			CLUSTER_SLEEP_PC: cluster-sleep-0 {
+			cluster_sleep_PC: cluster-sleep-0 {
 				compatible = "domain-idle-state";
 				idle-state-name = "cluster-l3-power-collapse";
 				arm,psci-suspend-param = <0x41000044>;
@@ -364,7 +364,7 @@ CLUSTER_SLEEP_PC: cluster-sleep-0 {
 				min-residency-us = <6118>;
 			};
 
-			CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
+			cluster_sleep_CX_RET: cluster-sleep-1 {
 				compatible = "domain-idle-state";
 				idle-state-name = "cluster-cx-retention";
 				arm,psci-suspend-param = <0x41001244>;
@@ -373,7 +373,7 @@ CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
 				min-residency-us = <8467>;
 			};
 
-			CLUSTER_AOSS_SLEEP: cluster-sleep-2 {
+			cluster_aoss_sleep: cluster-sleep-2 {
 				compatible = "domain-idle-state";
 				idle-state-name = "cluster-power-down";
 				arm,psci-suspend-param = <0x4100b244>;
@@ -583,59 +583,59 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		CPU_PD0: cpu0 {
+		cpu_pd0: cpu0 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD1: cpu1 {
+		cpu_pd1: cpu1 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD2: cpu2 {
+		cpu_pd2: cpu2 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD3: cpu3 {
+		cpu_pd3: cpu3 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD4: cpu4 {
+		cpu_pd4: cpu4 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD5: cpu5 {
+		cpu_pd5: cpu5 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&LITTLE_cpu_sleep_0 &LITTLE_cpu_sleep_1>;
 		};
 
-		CPU_PD6: cpu6 {
+		cpu_pd6: cpu6 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0 &BIG_cpu_sleep_1>;
 		};
 
-		CPU_PD7: cpu7 {
+		cpu_pd7: cpu7 {
 			#power-domain-cells = <0>;
-			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&BIG_cpu_sleep_0 &BIG_cpu_sleep_1>;
 		};
 
-		CLUSTER_PD: cpu-cluster0 {
+		cluster_pd: cpu-cluster0 {
 			#power-domain-cells = <0>;
-			domain-idle-states = <&CLUSTER_SLEEP_PC
-					      &CLUSTER_SLEEP_CX_RET
-					      &CLUSTER_AOSS_SLEEP>;
+			domain-idle-states = <&cluster_sleep_PC
+					      &cluster_sleep_CX_RET
+					      &cluster_aoss_sleep>;
 		};
 	};
 
@@ -2546,7 +2546,7 @@ etm@7040000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07040000 0 0x1000>;
 
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2566,7 +2566,7 @@ etm@7140000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07140000 0 0x1000>;
 
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2586,7 +2586,7 @@ etm@7240000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07240000 0 0x1000>;
 
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2606,7 +2606,7 @@ etm@7340000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07340000 0 0x1000>;
 
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2626,7 +2626,7 @@ etm@7440000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07440000 0 0x1000>;
 
-			cpu = <&CPU4>;
+			cpu = <&cpu4>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2646,7 +2646,7 @@ etm@7540000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07540000 0 0x1000>;
 
-			cpu = <&CPU5>;
+			cpu = <&cpu5>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2666,7 +2666,7 @@ etm@7640000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07640000 0 0x1000>;
 
-			cpu = <&CPU6>;
+			cpu = <&cpu6>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -2686,7 +2686,7 @@ etm@7740000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0 0x07740000 0 0x1000>;
 
-			cpu = <&CPU7>;
+			cpu = <&cpu7>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3734,7 +3734,7 @@ apps_rsc: rsc@18200000 {
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
-			power-domains = <&CLUSTER_PD>;
+			power-domains = <&cluster_pd>;
 
 			rpmhcc: clock-controller {
 				compatible = "qcom,sc7180-rpmh-clk";
@@ -4063,21 +4063,21 @@ cpu0_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu0_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu0_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4111,21 +4111,21 @@ cpu1_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu1_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu1_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4159,21 +4159,21 @@ cpu2_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu2_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu2_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4207,21 +4207,21 @@ cpu3_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu3_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu3_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4255,21 +4255,21 @@ cpu4_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu4_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu4_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4303,21 +4303,21 @@ cpu5_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu5_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu5_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4351,13 +4351,13 @@ cpu6_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu6_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu6_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4391,13 +4391,13 @@ cpu7_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu7_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu7_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4431,13 +4431,13 @@ cpu8_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu8_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu8_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -4471,13 +4471,13 @@ cpu9_crit: cpu-crit {
 			cooling-maps {
 				map0 {
 					trip = <&cpu9_alert0>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 				map1 {
 					trip = <&cpu9_alert1>;
-					cooling-device = <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm7125.dtsi b/arch/arm64/boot/dts/qcom/sm7125.dtsi
index 12dd72859a43..a53145a610a3 100644
--- a/arch/arm64/boot/dts/qcom/sm7125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125.dtsi
@@ -6,11 +6,11 @@
 #include "sc7180.dtsi"
 
 /* SM7125 uses Kryo 465 instead of Kryo 468 */
-&CPU0 { compatible = "qcom,kryo465"; };
-&CPU1 { compatible = "qcom,kryo465"; };
-&CPU2 { compatible = "qcom,kryo465"; };
-&CPU3 { compatible = "qcom,kryo465"; };
-&CPU4 { compatible = "qcom,kryo465"; };
-&CPU5 { compatible = "qcom,kryo465"; };
-&CPU6 { compatible = "qcom,kryo465"; };
-&CPU7 { compatible = "qcom,kryo465"; };
+&cpu0 { compatible = "qcom,kryo465"; };
+&cpu1 { compatible = "qcom,kryo465"; };
+&cpu2 { compatible = "qcom,kryo465"; };
+&cpu3 { compatible = "qcom,kryo465"; };
+&cpu4 { compatible = "qcom,kryo465"; };
+&cpu5 { compatible = "qcom,kryo465"; };
+&cpu6 { compatible = "qcom,kryo465"; };
+&cpu7 { compatible = "qcom,kryo465"; };

-- 
2.43.0


