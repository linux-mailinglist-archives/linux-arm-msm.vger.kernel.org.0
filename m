Return-Path: <linux-arm-msm+bounces-19667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF08C2448
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A841428CDC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0481791EF;
	Fri, 10 May 2024 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4aiO1im"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9F174EF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342398; cv=none; b=fOVKZ5eNu9AgIQiSCifoKbDS+EeT8S4PARleAaC9hIAF95BiA64KqdEaOYGMFjN3GDNaLa6VAEC9tC9e0FEmdvtEEYzBDgekZynXnHOGdPIwWXTfIGMCuscDyNMp/oEGTkbijoK5yW3UIQtVyXiqWZDWECj1x1/pF6jbHrRr1BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342398; c=relaxed/simple;
	bh=jiSIFGimpDX4+TwGvHqqAHsi+AK4AelGNP3BI22A2Wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAEd9vbbyDd6WQYV7lEs6x+N9cA73QMoI5dRkDmbE9jSSixdfxrClCmuzNmbCA7rYh4EyM+j1wYzDAJDW/T8/ZJpe2Bvas4+s+57LVN2cMdhrevgzeD8NEmRX5UatwdUj6OBeRzmBFUhQPlyzUFx4KBrzjs/UplzQ8yjuL6Omcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4aiO1im; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a934ad50so461976266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342394; x=1715947194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmDoRiq5HIm03yKcCt0UtU9zsedBUjpQuaReVJnLfEQ=;
        b=V4aiO1imDrWl9IZkghSAwdtK7Ya3QimpPbMRuf2vCZ09vy4kWH+z7WILDTaU0rgXGR
         bSp8ztZbAGLaAI/ecgtO27hu8uTKDAwzihOGXTKhE0SI5EyRlBrRG8DJeoDw+8qZrYWh
         q/dv6N9VWA4fnY29mF5/gpuA8jp1k9UjcchxF/r+JzCvXRINdckRsqqQKw4s2Et2Prcl
         T6yvahLVdyY/X/2z4I5OLMWyQlYELTYNq1gFzJExg0+iBORGft4hPm81Ja0xcycKuTXo
         cFhA4Hy8t7pc7GllXeUVISeUG70Cf40txAjFW6hmFeSZDZLkWpDCBJT2RAsmmOWMweJj
         H5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342394; x=1715947194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmDoRiq5HIm03yKcCt0UtU9zsedBUjpQuaReVJnLfEQ=;
        b=obvnPXdL7h5cf9e5EhyDM7ER8K4ucR9Q7rREAVQ8QipNfpm0+1hK3FsoEMe+Lw4bNI
         yi7AzBfJK8mfAtoWrgdlmydL7VUSHkkeD7VhVVQDCo6x6+qQBed4mNj2iAFtV534f9tj
         yARdUzXH+LoQ/2kUm2gG/RpPiaxKTlDSzy9KplHctXfkTXOkdzUXM9Swufks/+gMyZ+f
         0mZBiRDlecX007Dk7CxMx8tcLJJvsuQA3XIiMYY/kHHNvfNeVzj5U89ZnegztOgLjpU3
         50uMnekIigSH1IMh/Gfu39p8AtnnXDAVfXwla8K+K3sBDQ1ZKQF4W/ZI3Auv+ouKfaAF
         WQZw==
X-Gm-Message-State: AOJu0YzMzD/s7j+IhEJ4Xuqq7HXdlwXQH5X64+x56ldV9qRgVYsdeaei
	zapJFF6VwqKKR8Udx7tCL+Y/uTTZSrh4SCRpIhZQ0DZWQjJk1pfeslb3Hz0uyQQ=
X-Google-Smtp-Source: AGHT+IEydhm75fvryvEOacr129Cn9qwvJsTOcUo2SLkpzevrgzZVTWEzxZExgDJecGb/y/cZ2Bms6Q==
X-Received: by 2002:a17:906:3d0:b0:a59:bfab:b25a with SMTP id a640c23a62f3a-a5a2d678063mr155538866b.63.1715342394140;
        Fri, 10 May 2024 04:59:54 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:38 +0200
Subject: [PATCH v2 15/31] arm64: dts: qcom: sa8775p-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-15-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi       | 82 -----------------------------
 2 files changed, 4 insertions(+), 86 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index eaa43f022a65..1369c3d43f86 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -10,7 +10,7 @@ / {
 	thermal-zones {
 		pmm8654au_0_thermal: pm8775-0-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmm8654au_0_temp_alarm>;
 
 			trips {
@@ -30,7 +30,7 @@ trip1 {
 
 		pmm8654au_1_thermal: pm8775-1-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmm8654au_1_temp_alarm>;
 
 			trips {
@@ -50,7 +50,7 @@ trip1 {
 
 		pmm8654au_2_thermal: pm8775-2-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmm8654au_2_temp_alarm>;
 
 			trips {
@@ -70,7 +70,7 @@ trip1 {
 
 		pmm8654au_3_thermal: pm8775-3-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmm8654au_3_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 31de73594839..045d36c15b5c 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2550,9 +2550,6 @@ ethernet0: ethernet@23040000 {
 
 	thermal-zones {
 		aoss-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -2572,7 +2569,6 @@ trip-point1 {
 
 		cpu-0-0-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -2593,7 +2589,6 @@ trip-point1 {
 
 		cpu-0-1-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -2614,7 +2609,6 @@ trip-point1 {
 
 		cpu-0-2-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -2635,7 +2629,6 @@ trip-point1 {
 
 		cpu-0-3-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 4>;
 
@@ -2656,7 +2649,6 @@ trip-point1 {
 
 		gpuss-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -2677,7 +2669,6 @@ trip-point1 {
 
 		gpuss-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 6>;
 
@@ -2698,7 +2689,6 @@ trip-point1 {
 
 		gpuss-2-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -2718,9 +2708,6 @@ trip-point1 {
 		};
 
 		audio-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -2739,9 +2726,6 @@ trip-point1 {
 		};
 
 		camss-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -2760,9 +2744,6 @@ trip-point1 {
 		};
 
 		pcie-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -2781,9 +2762,6 @@ trip-point1 {
 		};
 
 		cpuss-0-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -2802,9 +2780,6 @@ trip-point1 {
 		};
 
 		aoss-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -2824,7 +2799,6 @@ trip-point1 {
 
 		cpu-0-0-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -2845,7 +2819,6 @@ trip-point1 {
 
 		cpu-0-1-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -2866,7 +2839,6 @@ trip-point1 {
 
 		cpu-0-2-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -2887,7 +2859,6 @@ trip-point1 {
 
 		cpu-0-3-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -2908,7 +2879,6 @@ trip-point1 {
 
 		gpuss-3-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 5>;
 
@@ -2929,7 +2899,6 @@ trip-point1 {
 
 		gpuss-4-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -2950,7 +2919,6 @@ trip-point1 {
 
 		gpuss-5-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens1 7>;
 
@@ -2970,9 +2938,6 @@ trip-point1 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -2991,9 +2956,6 @@ trip-point1 {
 		};
 
 		camss-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -3012,9 +2974,6 @@ trip-point1 {
 		};
 
 		pcie-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -3033,9 +2992,6 @@ trip-point1 {
 		};
 
 		cpuss-0-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 11>;
 
 			trips {
@@ -3054,9 +3010,6 @@ trip-point1 {
 		};
 
 		aoss-2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
@@ -3076,7 +3029,6 @@ trip-point1 {
 
 		cpu-1-0-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 1>;
 
@@ -3097,7 +3049,6 @@ trip-point1 {
 
 		cpu-1-1-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 2>;
 
@@ -3118,7 +3069,6 @@ trip-point1 {
 
 		cpu-1-2-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 3>;
 
@@ -3139,7 +3089,6 @@ trip-point1 {
 
 		cpu-1-3-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 4>;
 
@@ -3160,7 +3109,6 @@ trip-point1 {
 
 		nsp-0-0-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 5>;
 
@@ -3181,7 +3129,6 @@ trip-point1 {
 
 		nsp-0-1-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 6>;
 
@@ -3202,7 +3149,6 @@ trip-point1 {
 
 		nsp-0-2-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 7>;
 
@@ -3223,7 +3169,6 @@ trip-point1 {
 
 		nsp-1-0-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 8>;
 
@@ -3244,7 +3189,6 @@ trip-point1 {
 
 		nsp-1-1-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 9>;
 
@@ -3265,7 +3209,6 @@ trip-point1 {
 
 		nsp-1-2-0-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens2 10>;
 
@@ -3285,9 +3228,6 @@ trip-point1 {
 		};
 
 		ddrss-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
@@ -3306,9 +3246,6 @@ trip-point1 {
 		};
 
 		cpuss-1-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 12>;
 
 			trips {
@@ -3327,9 +3264,6 @@ trip-point1 {
 		};
 
 		aoss-3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 0>;
 
 			trips {
@@ -3349,7 +3283,6 @@ trip-point1 {
 
 		cpu-1-0-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 1>;
 
@@ -3370,7 +3303,6 @@ trip-point1 {
 
 		cpu-1-1-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 2>;
 
@@ -3391,7 +3323,6 @@ trip-point1 {
 
 		cpu-1-2-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 3>;
 
@@ -3412,7 +3343,6 @@ trip-point1 {
 
 		cpu-1-3-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 4>;
 
@@ -3433,7 +3363,6 @@ trip-point1 {
 
 		nsp-0-0-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 5>;
 
@@ -3454,7 +3383,6 @@ trip-point1 {
 
 		nsp-0-1-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 6>;
 
@@ -3475,7 +3403,6 @@ trip-point1 {
 
 		nsp-0-2-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 7>;
 
@@ -3496,7 +3423,6 @@ trip-point1 {
 
 		nsp-1-0-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 8>;
 
@@ -3517,7 +3443,6 @@ trip-point1 {
 
 		nsp-1-1-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 9>;
 
@@ -3538,7 +3463,6 @@ trip-point1 {
 
 		nsp-1-2-1-thermal {
 			polling-delay-passive = <10>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&tsens3 10>;
 
@@ -3558,9 +3482,6 @@ trip-point1 {
 		};
 
 		ddrss-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 11>;
 
 			trips {
@@ -3579,9 +3500,6 @@ trip-point1 {
 		};
 
 		cpuss-1-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 12>;
 
 			trips {

-- 
2.40.1


