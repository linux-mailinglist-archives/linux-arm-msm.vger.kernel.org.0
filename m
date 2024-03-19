Return-Path: <linux-arm-msm+bounces-14561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF98801DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F9FF287157
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383F685921;
	Tue, 19 Mar 2024 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y4mtqUeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373A85947
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864845; cv=none; b=JEDxfPP8ypdN+AiDhllMutpVU250FrbDG+5goO5d2+iQPcCrB2brpwItIm0lp9Y6VLfwDxG55LdJYtWcsUO1sbMwyivC91SYZ9FoV6Ilw78vgd62XmgW1ijhE+zcG8fMn3SxaQ2uv21iYr1ZGaSCvweidA60bJRICOJeqvE4588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864845; c=relaxed/simple;
	bh=CyTy0OiFU+Nfk1dsdjAmqIKr/Ix2mPrqSyyV6yCRfCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ibOeCj8jXTWvq2CVv3i9ubQYdWclDZWZ4U/e7I2qaMn6djeWu9rEI1NgsRaB1LTjgLd39ObCyOMLr6ezYfbmed++4GcrYOQJ0sW6NrSKLtycUm8SVMtsIgYolczNgAzN5+euIrvRhHKUf/Z0NPppLR7hoLZz+kRF7sZTahpEB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y4mtqUeL; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so61417841fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864841; x=1711469641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUin3oci0fFi0rj9oRXbvvL87KWcWHkvEUupVOm/N6A=;
        b=y4mtqUeLSjscXgzmk7j3q9nkganFza1YYJWDd9yVd8B5/sDzPCIfWdkiipqrV6Yokb
         BQxNgErVyoAoFQmOe8kk1L/mAc45ijzevM6E1nYyBg93A2d2yeB2+fapsHIvBuS3OWRx
         QFQ9M+tSc5+gPSVdMxb2avACZtfPzwvTeFojVS/hFppD9wPTk50K+PQtuhxdfsDHjb2L
         0iOU326FGO+mgwMYEHL2atsinZyDZMTF6g9KUKP77Bk6KKkIdVeCm/Z1qwCoIwF8ZgUR
         v+zJiS/SRlyHTRU8J1ScM6f2NvcZinQV+mCyr3xatrnCIVzdpZFd7WxuZTnpAIRGXR/B
         ggbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864841; x=1711469641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUin3oci0fFi0rj9oRXbvvL87KWcWHkvEUupVOm/N6A=;
        b=kx/u9Y3LsieHKzN/kkQCOP6v6UYysk6GJ9SaooKE4uXPKXTaqgJ4NAtoHaWRJyQPiY
         1gfgzJkWtou3WJWWOa6Cp1UtXgyCkGwkYltl/nmukb67u9xbjvLu18zdRhw4k3yteijE
         FyiuOj0u84txcr4xL3m0NAdw/Vqx3ice1A4VhBzDW15oW3EmtpRFzgn/FLN49Jmg6y6o
         7phMk1LqLoZ3Ra0Pjc2Nzz3ythcoTV1yyBJX/EBFfKFjXNv0WbLdECcAidXK+pN9xYpN
         2+uZW2vVHHSjJmhBoDAbsVkMv40Eb1vr+zCCPgVSAZbX4nC9FPZ1VXaY1R89XzlB6aNV
         Ck5g==
X-Gm-Message-State: AOJu0YxD0wtwSp3SodMOJ/dtcg5a5xLFok+fGBBcwsNje62QGFkegwNP
	cGFvoY6mWPxDJhmX6VJKf9pz+KLirMQ5WvOC3pZ6/hF2kVOL1wBLVXB5cnnGJ0U=
X-Google-Smtp-Source: AGHT+IGdWTnHvARXaD6ICYKtFfWMnupgF0nxAalA1wwRz5vssMQi9UGRXeacXHNYh3C+RKrjNRFOUQ==
X-Received: by 2002:a05:6512:102a:b0:513:c28e:8215 with SMTP id r10-20020a056512102a00b00513c28e8215mr9542879lfr.64.1710864840842;
        Tue, 19 Mar 2024 09:14:00 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:51 +0100
Subject: [PATCH 21/31] arm64: dts: qcom: sdm845-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-21-e0aee1dbcd78@linaro.org>
References: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
In-Reply-To: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 12 -------
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 63 ---------------------------------
 2 files changed, 75 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 76bfa786612c..2391f842c903 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -51,9 +51,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 
 	thermal-zones {
 		xo_thermal: xo-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8998_adc_tm 1>;
 
 			trips {
@@ -66,9 +63,6 @@ trip-point {
 		};
 
 		msm_thermal: msm-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8998_adc_tm 2>;
 
 			trips {
@@ -81,9 +75,6 @@ trip-point {
 		};
 
 		pa_thermal: pa-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8998_adc_tm 3>;
 
 			trips {
@@ -96,9 +87,6 @@ trip-point {
 		};
 
 		quiet_thermal: quiet-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8998_adc_tm 4>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2f20be99ee7e..ef05e3506d54 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5337,9 +5337,6 @@ sound: sound {
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -5364,9 +5361,6 @@ cpu0_crit: cpu-crit {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -5391,9 +5385,6 @@ cpu1_crit: cpu-crit {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -5418,9 +5409,6 @@ cpu2_crit: cpu-crit {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -5445,9 +5433,6 @@ cpu3_crit: cpu-crit {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -5472,9 +5457,6 @@ cpu4_crit: cpu-crit {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -5499,9 +5481,6 @@ cpu5_crit: cpu-crit {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -5526,9 +5505,6 @@ cpu6_crit: cpu-crit {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -5553,9 +5529,6 @@ cpu7_crit: cpu-crit {
 		};
 
 		aoss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -5568,9 +5541,6 @@ aoss0_alert0: trip-point0 {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -5588,9 +5558,6 @@ cluster0_crit: cluster0-crit {
 		};
 
 		cluster1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -5608,9 +5575,6 @@ cluster1_crit: cluster1-crit {
 		};
 
 		gpu-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			cooling-maps {
@@ -5630,9 +5594,6 @@ gpu_top_alert0: trip-point0 {
 		};
 
 		gpu-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			cooling-maps {
@@ -5652,9 +5613,6 @@ gpu_bottom_alert0: trip-point0 {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -5667,9 +5625,6 @@ aoss1_alert0: trip-point0 {
 		};
 
 		q6-modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -5682,9 +5637,6 @@ q6_modem_alert0: trip-point0 {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -5697,9 +5649,6 @@ mem_alert0: trip-point0 {
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -5712,9 +5661,6 @@ wlan_alert0: trip-point0 {
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -5727,9 +5673,6 @@ q6_hvx_alert0: trip-point0 {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -5742,9 +5685,6 @@ camera_alert0: trip-point0 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -5757,9 +5697,6 @@ video_alert0: trip-point0 {
 		};
 
 		modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {

-- 
2.40.1


