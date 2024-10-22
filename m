Return-Path: <linux-arm-msm+bounces-35460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D06679AB2B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555561F23178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3483F1C32F0;
	Tue, 22 Oct 2024 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+HYMH8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4DE1C2DA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612113; cv=none; b=MLBGhdbAhEL7skZSIasdllmpRgSCFrNc1qOHZ6Yyv9OFtylMBBtKp/Bc4l2KXhc2FwZObzOp0FuDwFk7JnogpUmpETbBfggnYigpSgXspgoGo9SUHQ4ePQNAeefZoWciSjc12/tLC1+IMU3oMOQp6A8PDYboeD/zAyl3hDb95FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612113; c=relaxed/simple;
	bh=CV3H0zvj4P3Kw7YcRn5Q8CqsEW5i2UEX4m8ePcJEUs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNdMxhJl1e/3qBoYANu6uvNOlqF2krdKO724thvfy5KSX7eyspWdyrBydslM+sugBECZFzONtZoOPf0ds/zgVrWIIbEFRh81c+NZObrZoo4Ki0E0jgZbcNuZB9VyizqUe/x/xTdKZXGrtUKi/HPucDeN/cLphmgdY21qeJFyz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f+HYMH8Y; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ca0a1fc1aeso770032a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729612108; x=1730216908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYNl7TrperlDfX1b3zj9vWx6Hruz+xxE2rLNBZvHvPk=;
        b=f+HYMH8YhPKianxiUYVrwqBcRDx5kxR9J3yO6kkRIxWFmYljPxjiG3GhqBnyPiDadA
         eBLDepDJHgWGbCe3tJJ33WbB+z2aCJ76fCaJPU+d/UWPl/PctcCpMa4H7HSINPENrFWn
         JF/0gZ/XqMvGviauCSIu9IFirUd5HjfJIhB8FOLNp66YfZD4iv8QM/ljH8x4IRxpRLI3
         JGWPjLrhwgqkV6yduW0AaAd6+1mipBo8gxR8Ny2i4OQR8nMd2pebTdFodMCl/aac12w3
         DWRpFDZp5o3+6K0c1aPsS0djYdTvT2VFu/9o22hpsdC1KSIsiHAIbwPIzZKSvEd2LzBZ
         OKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612108; x=1730216908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYNl7TrperlDfX1b3zj9vWx6Hruz+xxE2rLNBZvHvPk=;
        b=F4O7sy8UVEVKEVkUmkF/Tf7I5vzz5MxQ/n9GEyi+fcY4wvFFDHS98A3+k3u4ls+GOw
         Lpge1Jgj3fkaxh1p0h0qzfCopMvpsfxXMOg0d+rtbo6o8G0VtFWtIss1N+uTiVN2zP1G
         ZxhSjFw4tRGAlgqyTBJCr5SjtSLwEZ/lxBSyTniswGPALMHDQLmZUEI2sg/ap7/vO6ZY
         EkGWgYdTfGkdynve6H0BBrd18jHz9DlBJQoOMAvtOWE/n+Vom6PwYRaDN9tFYdJeej0R
         nv7dZ7i+CxS0186vFBryWi3qCfRnx2PxVN885y5v84iFmVC7eBzFOtK6+B6pICraF3vi
         GXoQ==
X-Gm-Message-State: AOJu0Yy7rmmWYPaNCHASvQWi+VGuL7b8wWnPtUtpPzf+ifo5t0/2a+NB
	RMWdaE3aN2nskK9KOqF3wZ8UgiG631xjHHrkcQjN8/25zJ/m1iCxDdxt1c+NeMpcHvcnngwb9Ci
	y
X-Google-Smtp-Source: AGHT+IFPkR1QMvVNYXIBdikR1k5ajbWkI67F2DdCE0k2UExJQLTYQjvA3Szzhh1bd51v0J9x9YPaXA==
X-Received: by 2002:a05:6402:4301:b0:5c9:3f3:ae0 with SMTP id 4fb4d7f45d1cf-5ca0ae80dfamr5072473a12.5.1729612108372;
        Tue, 22 Oct 2024 08:48:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c725fesm3439959a12.87.2024.10.22.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Oct 2024 17:47:43 +0200
Subject: [PATCH v3 18/18] ARM: dts: qcom: change labels to lower-case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dts-qcom-label-v3-18-0505bc7d2c56@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16448;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CV3H0zvj4P3Kw7YcRn5Q8CqsEW5i2UEX4m8ePcJEUs8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnF8kjPx43d+4urlc4Qy0BZxi+c/9DQd0ENaumW
 v3RYMwHoeGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZxfJIwAKCRDBN2bmhouD
 10ZZD/9uENiZJ6zI38qo2evNNoLzJfFWOrnnfz89h3XyvNxfTFcxBBUUVDC42Md5cKu3WwZuYKP
 Jrq1QdB48bD4mQylWbPGZpu+SeSzbpC6oFjQgEiYOcruS9JxkbMBl9IaXmg0S298omeot6J1ol4
 rezfcvjnY3Pjb2KIMaN0dX23dB4SHRnJGeubHRK+JdybANNvwG9wn9Quh/BZLguOSRb62wRPKMS
 f3mlS4lpn8+oibi8AOQt76cjnW8NjGUlSK4ZyMJKOv2d8ND9uY/RkQ3KJfo4psiLQOhuE5u3XmV
 R9bzTTqLqE2maZ/Iheq9ZJSYnWlVVcqduIfqnsS3LSjS5ubCwE3rSQbzDcycqWEBCe5ndn5aRGt
 c4Ram7hhk7Hx3r9+2Z6Lbw8uZqRA8KxQTpquLrlp2Z61WOdhdPs8fNWfeRqBXVHXPq3tC1Ecnf2
 qLECwBEb+cPZ7I8LA3VftHcq7Ns8xdVjlXLuL1Z4HaKYsBB4s6/AnbeKggpx7p+aVEUtt/lNlLb
 /Be6p/CS3RbNnPMhtnToYcnc8GpOrygSvtVQbhgPlzWA3vpnXoW1i6tbsCDzjXxJO9uwvfxfusW
 wEwqVLNu//vG9+0Wq/ZuEdyG+r+7nxYB12p1kj+geiKV1drkg7pr0ef4Wne+HF75XQJ6VQs0X4Y
 N73+VQVFXz9Xq2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS coding style expects labels to be lowercase.  No functional impact.
Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

1. New patch
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 36 ++++++++++++++++----------------
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 20 +++++++++---------
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 10 ++++-----
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi |  6 +++---
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi |  4 ++--
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 34 +++++++++++++++---------------
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi |  6 +++---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi |  6 +++---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 36 ++++++++++++++++----------------
 9 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 1bc935d900854ea40e7520ac5762f307c73232f2..5f1a6b4b764492486df1a2610979f56c0a37b64a 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -36,58 +36,58 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <0>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		CPU1: cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <1>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		CPU2: cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <2>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc2>;
 			qcom,saw = <&saw2>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		CPU3: cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <3>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc3>;
 			qcom,saw = <&saw3>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
 		};
 
 		idle-states {
-			CPU_SPC: cpu-spc {
+			cpu_spc: cpu-spc {
 				compatible = "qcom,idle-state-spc",
 						"arm,idle-state";
 				entry-latency-us = <400>;
@@ -1625,7 +1625,7 @@ etm@1a1c000 {
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			out-ports {
 				port {
@@ -1643,7 +1643,7 @@ etm@1a1d000 {
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			out-ports {
 				port {
@@ -1661,7 +1661,7 @@ etm@1a1e000 {
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			out-ports {
 				port {
@@ -1679,7 +1679,7 @@ etm@1a1f000 {
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			out-ports {
 				port {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 40dbbf8655f09ff3c6259c69bdd08b2fe3c39594..cee0694ef127b5e2450e274659c403e0be81f401 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -32,10 +32,10 @@ cpu@0 {
 			compatible = "qcom,krait";
 			reg = <0>;
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
 		cpu@1 {
@@ -43,10 +43,10 @@ cpu@1 {
 			compatible = "qcom,krait";
 			reg = <1>;
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
 		cpu@2 {
@@ -54,10 +54,10 @@ cpu@2 {
 			compatible = "qcom,krait";
 			reg = <2>;
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc2>;
 			qcom,saw = <&saw2>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
 		cpu@3 {
@@ -65,13 +65,13 @@ cpu@3 {
 			compatible = "qcom,krait";
 			reg = <3>;
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc3>;
 			qcom,saw = <&saw3>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
@@ -79,7 +79,7 @@ L2: l2-cache {
 		};
 
 		idle-states {
-			CPU_SPC: cpu-spc {
+			cpu_spc: cpu-spc {
 				compatible = "qcom,idle-state-spc",
 						"arm,idle-state";
 				entry-latency-us = <150>;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 56415ab34083f38f0f5c6aefa873947409c8cc6a..06b20c196faf3fe35983d7ee2abebd2066f83b02 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -47,7 +47,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
 			reg = <0x0>;
@@ -61,7 +61,7 @@ cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
 			reg = <0x1>;
@@ -75,7 +75,7 @@ cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc2>;
 			qcom,saw = <&saw2>;
 			reg = <0x2>;
@@ -89,7 +89,7 @@ cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,kpss-acc-v2";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc3>;
 			qcom,saw = <&saw3>;
 			reg = <0x3>;
@@ -99,7 +99,7 @@ cpu@3 {
 			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 0f02f59c282a25698bade3ef3cac3082bd056b3c..96e97350153506922b7560131e33664d51e891b5 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -27,7 +27,7 @@ cpu0: cpu@0 {
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <0>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
 		};
@@ -37,12 +37,12 @@ cpu1: cpu@1 {
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <1>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index 573feb3218c33c449f95f4922c24400cea9ac0cc..7de8d6c550167ac37e09dc5d92b7a3b2e21753cb 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -30,7 +30,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a5";
 			reg = <0>;
 			device_type = "cpu";
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 		};
 	};
 
@@ -61,7 +61,7 @@ soc: soc {
 		ranges;
 		compatible = "simple-bus";
 
-		L2: cache-controller@2040000 {
+		l2: cache-controller@2040000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x02040000 0x1000>;
 			arm,data-latency = <2 2 0>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 3a685ff7e8ccf505e2801607a70099f4b3c16137..64c8ac94f352e46dc4a18f902d2c30114ecd91d2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -39,12 +39,12 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,msm8226-smp";
 			device_type = "cpu";
 			reg = <0>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc0>;
@@ -52,12 +52,12 @@ CPU0: cpu@0 {
 			#cooling-cells = <2>;
 		};
 
-		CPU1: cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,msm8226-smp";
 			device_type = "cpu";
 			reg = <1>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc1>;
@@ -65,12 +65,12 @@ CPU1: cpu@1 {
 			#cooling-cells = <2>;
 		};
 
-		CPU2: cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,msm8226-smp";
 			device_type = "cpu";
 			reg = <2>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc2>;
@@ -78,12 +78,12 @@ CPU2: cpu@2 {
 			#cooling-cells = <2>;
 		};
 
-		CPU3: cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			enable-method = "qcom,msm8226-smp";
 			device_type = "cpu";
 			reg = <3>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			clocks = <&apcs>;
 			operating-points-v2 = <&cpu_opp_table>;
 			qcom,acc = <&acc3>;
@@ -91,7 +91,7 @@ CPU3: cpu@3 {
 			#cooling-cells = <2>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
@@ -1264,10 +1264,10 @@ cpu0-thermal {
 			cooling-maps {
 				map0 {
 					trip = <&cpu_alert0>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
@@ -1295,10 +1295,10 @@ cpu1-thermal {
 			cooling-maps {
 				map0 {
 					trip = <&cpu_alert1>;
-					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index a66c474cd1aa0d4303dbb1fdaa97072c1f45a7b2..3f69b98d0041eb16093668d6b83a2da0c3496638 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -22,7 +22,7 @@ cpu@0 {
 			enable-method = "qcom,gcc-msm8660";
 			device_type = "cpu";
 			reg = <0>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu@1 {
@@ -30,10 +30,10 @@ cpu@1 {
 			enable-method = "qcom,gcc-msm8660";
 			device_type = "cpu";
 			reg = <1>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index ebc43c5c6e5f756995a5d48bdee102b0b3c47106..865fe7cc39511d7cb9ec5c4b12100404f77e2989 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -25,7 +25,7 @@ cpu@0 {
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <0>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
 		};
@@ -35,12 +35,12 @@ cpu@1 {
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
 			reg = <1>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 742d2104b4fe5db54fcbf8c55c6fb2e0fb12a410..e3f9c56a778cf8c64735ede1e85286bde12c1c87 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -35,51 +35,51 @@ cpus {
 		#size-cells = <0>;
 		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 
-		CPU0: cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
 			reg = <0>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		CPU1: cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
 			reg = <1>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		CPU2: cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
 			reg = <2>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc2>;
 			qcom,saw = <&saw2>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		CPU3: cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
 			reg = <3>;
-			next-level-cache = <&L2>;
+			next-level-cache = <&l2>;
 			qcom,acc = <&acc3>;
 			qcom,saw = <&saw3>;
-			cpu-idle-states = <&CPU_SPC>;
+			cpu-idle-states = <&cpu_spc>;
 		};
 
-		L2: l2-cache {
+		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
@@ -87,7 +87,7 @@ L2: l2-cache {
 		};
 
 		idle-states {
-			CPU_SPC: cpu-spc {
+			cpu_spc: cpu-spc {
 				compatible = "qcom,idle-state-spc",
 						"arm,idle-state";
 				entry-latency-us = <150>;
@@ -960,7 +960,7 @@ etm@fc33c000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
 
-			cpu = <&CPU0>;
+			cpu = <&cpu0>;
 
 			out-ports {
 				port {
@@ -978,7 +978,7 @@ etm@fc33d000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
 
-			cpu = <&CPU1>;
+			cpu = <&cpu1>;
 
 			out-ports {
 				port {
@@ -996,7 +996,7 @@ etm@fc33e000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
 
-			cpu = <&CPU2>;
+			cpu = <&cpu2>;
 
 			out-ports {
 				port {
@@ -1014,7 +1014,7 @@ etm@fc33f000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
 
-			cpu = <&CPU3>;
+			cpu = <&cpu3>;
 
 			out-ports {
 				port {

-- 
2.43.0


