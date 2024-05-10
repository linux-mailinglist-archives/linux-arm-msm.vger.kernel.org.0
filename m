Return-Path: <linux-arm-msm+bounces-19660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EEC8C2431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECC0EB263FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62308172BA6;
	Fri, 10 May 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxDodSw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994ED171E44
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342389; cv=none; b=HfOTiktzK2+eplFsXHi4H/Z+LOtrFUKotaydmXa6lqWGxD43fFr3Z9WcmVds8utsPqnerEnIMczfTNt4X86fuCTp5Gkb4k0NN+fwaH40Xh8dpeaNC7WV70JBQnqOmlA46ev13MGABzzVmL/29yE/FAJXOQ73FvZinne7mlaJVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342389; c=relaxed/simple;
	bh=0JBicso3SWIZ4mAFQpIvwNHhSZpkk4EO9ADInwiGK+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4IeJ0xspQZ4XJgKN5rEmmgI3S2GEZZicgztkZRr/BdEI/WSVFrhVY9Hk60Ag12MrRQx3tjPOKLtvSQtLXsRAOlWqt8e+xTZWCwh2xI70rM0NAO0aGmH8Eyng1ZCO0IX2Q1bWma4PBpqsoltjUgcVrDB9jcAPpAEwLwi6gCObFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxDodSw7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5a13921661so433556666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342385; x=1715947185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xus5xrFsxqYjPmZuFNjHFFx4ZVK0BGErQ8h6vfpBHIE=;
        b=dxDodSw7ieufgc3s6gzKTYb3Qzxk4D7BiZqGB/94+xU13ifRNT7xtpCT82srbCzg2p
         +abiyjn6oh4/N3Xgdto5wQ0IAPtpQlL1NlBor5ZIozBVIUV1s9yssiB4xn06cAzj4IhP
         LX97PQ9LqyFhrh6SGPpsZr24dZ9eW0mQpdBPdMKWhxzRseL701awrPeP00BLSKVs5fA1
         h71ny6So1NLb6xu/ad8wHIfv938BBs2c6GSOR0PioxBJ5NIve3Lq78jqzBdiWttjAeZv
         aJmbx3JNaDhswzoxGwwIw+5KzlalTnfBb67rNpsUYK9qJ6SeeUOCiqO4JO/3bhMZgGie
         2+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342385; x=1715947185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xus5xrFsxqYjPmZuFNjHFFx4ZVK0BGErQ8h6vfpBHIE=;
        b=L5ywaC81v23PCjZRSNO/tiYY7H4hAiPMoZwl5ZTQPUzP9aHAbn8srRL9IsZ0f6Z4Q8
         C7c46CO4uwcIU8kN3bAHGo9+mW+K/+/43CB9RZg5UKCx+vfcwYnNATR3lEXh/sBnm/+S
         9xR4+JRWuFdLDROIS9pX9GRdcvih42CCWtt8GVK89tdLsFvwmD9q4K1z+1EqnCEmWeWr
         lJazIb6Oi9ptwRuTrp791RE7RxVVp4NpTvfWHU7uPKCLmm/5c/h2dHP8EO9ysVJ6e/Kx
         R2zkpHOqGPIQLt4PNy7SkSeG4BeqnfLC1QYDgG9aDJ6f8nGhtGyy7tGW2/6Gdd51ZESG
         sSjw==
X-Gm-Message-State: AOJu0Yzau0B3T3kk+xd1iW8mTMBLhBzRl1CFAUSeCYAf9XKjqSf3YNQ5
	zoMATi52ASgSaHnSqxpRDa5ub6d7Uam0rl0XsYWWaaqWdhX3T27gE0ywIdyWNZDizcLpFPMd4iH
	Hxsk=
X-Google-Smtp-Source: AGHT+IEqlFdMYWLnlOJXoHWqJJbOTHT2BEU7f2VZzQLd0tRT3jWiFHn7fR+Zj/oiVSUO7mnpm8vJ0A==
X-Received: by 2002:a17:906:f6da:b0:a59:a97b:5aff with SMTP id a640c23a62f3a-a5a2d680c8fmr161864366b.73.1715342385122;
        Fri, 10 May 2024 04:59:45 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:31 +0200
Subject: [PATCH v2 08/31] arm64: dts: qcom: msm8996-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-8-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 --------------
 arch/arm64/boot/dts/qcom/pm8994.dtsi  |  1 -
 2 files changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8d2cb6f41095..4be294f9bc40 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3654,7 +3654,6 @@ sound: sound {
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -3675,7 +3674,6 @@ cpu0_crit: cpu-crit {
 
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -3696,7 +3694,6 @@ cpu1_crit: cpu-crit {
 
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -3717,7 +3714,6 @@ cpu2_crit: cpu-crit {
 
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -3738,7 +3734,6 @@ cpu3_crit: cpu-crit {
 
 		gpu-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -3760,7 +3755,6 @@ map0 {
 
 		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 7>;
 
@@ -3782,7 +3776,6 @@ map0 {
 
 		m4m-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -3797,7 +3790,6 @@ m4m_alert0: trip-point0 {
 
 		l3-or-venus-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -3812,7 +3804,6 @@ l3_or_venus_alert0: trip-point0 {
 
 		cluster0-l2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -3827,7 +3818,6 @@ cluster0_l2_alert0: trip-point0 {
 
 		cluster1-l2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -3842,7 +3832,6 @@ cluster1_l2_alert0: trip-point0 {
 
 		camera-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -3857,7 +3846,6 @@ camera_alert0: trip-point0 {
 
 		q6-dsp-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -3872,7 +3860,6 @@ q6_dsp_alert0: trip-point0 {
 
 		mem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -3887,7 +3874,6 @@ mem_alert0: trip-point0 {
 
 		modemtx-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 4>;
 
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index d44a95caf04a..353e4a6bd088 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -8,7 +8,6 @@ / {
 	thermal-zones {
 		pm8994-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&pm8994_temp>;
 

-- 
2.40.1


