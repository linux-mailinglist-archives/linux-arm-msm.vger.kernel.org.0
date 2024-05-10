Return-Path: <linux-arm-msm+bounces-19680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D3C8C2471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14347B242DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8DC17F375;
	Fri, 10 May 2024 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMGlpUgo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8E180A73
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342416; cv=none; b=m/wyYJf0UW2oXpso9r3fcWRw6nY0alikutML+l1jtninLNZzuI8vgg+qMMJUu7UOzNk0iQ6JnvCQT67N7HVG+cSMWPAK38vGs4KO1E0NWfIAmo6oQ+i4Q/RtAz5c5yy5jZ6PM1J9vVJTF2RpdNNiNu0wOhx3Ec2Hno2Xh7HvMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342416; c=relaxed/simple;
	bh=rtAyHN0aARG3vHFCqAviHNM8zN1BapIEOwA+4qEl9PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eglZQIYqMim3AvFfWJFsLFu3oV8JeawB6VvlcqLQ/DfLsMx/Sca89DJYNLbKwlwMmRVpTAqbb2Ru4bSDXb5CYd9zwkyj2eHCJ5SVHHJep6oQUbhzNov9n+2CLX+lAQl6vVPWWnYPCi1pHatw9N5jaL3uS/g7tJo/RFrHE90IrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMGlpUgo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-572baf393ddso4954844a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342413; x=1715947213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z4cvI7Lcb0O605OZHs6QyawD/22GU4H5rAQJC/a4Tk=;
        b=dMGlpUgoNdInFakx7+USYnCItZIPWr7K+lewoQdyanWrch9IlFj697BM9Q8AyEu2np
         6uwtMvhsTFbrZ9C1VgDVOCyrBH/DNnxGAQU012K3TcZokZu6tFE7nc3PIPkUIH8/Zxkv
         R9RI6006agMm8/t0QoX8v0bVvY9N5+2Rioevkk27mbPBTLnlqjcBeF178hO1SZFcRzih
         I3sPzGH6EH7xlwbVUcvHVgzxdL8enL7kCV71wdNCyDNxXHlpCMkgNvT893dBKkR6RZ7+
         yy2/DFVnyVlB+6eIMjEUAJoyBgCE0GuOlos/bn2riCgVKCESepE8FoTjCKKSNdHWrVwf
         FfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342413; x=1715947213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z4cvI7Lcb0O605OZHs6QyawD/22GU4H5rAQJC/a4Tk=;
        b=PlgEd+zDd/WG4orhohH24fuSLXNysS3LVq5BwQf4nb5hN8DnfSSuYq960cAiZox5Eo
         l6qhCDxM11ri/bHgw1ZFaFf5S5DsIAsoL3DvhoaXg2IjTImxIC/URyU+x6ofWqRxwb2k
         feBKBTwVP1wMdYIh7wS4ftWk6XGHweFJoa/MzaSlGO4nYgwktNN9bhwTEeDjf+tIasog
         4hiZqSY9j9Qoipw8Etm4pBvPQLWA0oR0SQsGUh5sjxmzVkDyXbf2Pbby6VcPotyJWn7j
         C8zBfSYvkp4UEqQ4fC3QCMM27nsMbRIw5bqxG6SFoQTzKKsX0WGWTBUWYGTelMWYC1nj
         mooQ==
X-Gm-Message-State: AOJu0Ywbm6dzEnbzF40PlJ/+L0WIP1p3m+p5Z1E1/rhwSYx4aOTUhfWU
	78nNYUIGcFWd3vuLr6zpEnFyXtO513oHdmK0WvYmw+OGgn/xQm/tld607QAm4Gc=
X-Google-Smtp-Source: AGHT+IEgY64Y+qPJSoaqbV3dOdLfJbH5SEYQx1ArUCtZ5kF8ddlcJ0gS5+6ZkGOmeECE7Mql1jqqQQ==
X-Received: by 2002:a17:907:76f4:b0:a59:c3a1:23f9 with SMTP id a640c23a62f3a-a5a1155b44cmr451751766b.7.1715342413404;
        Fri, 10 May 2024 05:00:13 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:00:13 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:51 +0200
Subject: [PATCH v2 28/31] arm64: dts: qcom: sm8350-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-28-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm8350.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/pm8350c.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/pmr735a.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 29 -----------------------------
 6 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
index 9ed9ba23e81e..cb55b23688d6 100644
--- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
@@ -10,7 +10,7 @@ / {
 	thermal-zones {
 		pm8350_thermal: pm8350-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pm8350_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
index 05c105898892..cf82f8a64a9b 100644
--- a/arch/arm64/boot/dts/qcom/pm8350b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
@@ -10,7 +10,7 @@ / {
 	thermal-zones {
 		pm8350b_thermal: pm8350b-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pm8350b_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index aa74e21fe0dc..1a24e6439e36 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -48,7 +48,7 @@ / {
 	thermal-zones {
 		pm8350c_thermal: pm8350c-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pm8350c_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
index febda50779f9..f8efd8e5e68f 100644
--- a/arch/arm64/boot/dts/qcom/pmr735a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
@@ -36,7 +36,7 @@ / {
 	thermal-zones {
 		pmr735a_thermal: pmr735a-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmr735a_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
index f7473e247322..09affc05b397 100644
--- a/arch/arm64/boot/dts/qcom/pmr735b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
@@ -10,7 +10,7 @@ / {
 	thermal-zones {
 		pmr735b_thermal: pmr735b-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
+
 			thermal-sensors = <&pmr735b_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index f7c4700f00c3..526d3c92eae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3665,7 +3665,6 @@ compute-cb@8 {
 	thermal_zones: thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -3709,7 +3708,6 @@ map1 {
 
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -3753,7 +3751,6 @@ map1 {
 
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -3797,7 +3794,6 @@ map1 {
 
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 4>;
 
@@ -3841,7 +3837,6 @@ map1 {
 
 		cpu4-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -3885,7 +3880,6 @@ map1 {
 
 		cpu5-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -3929,7 +3923,6 @@ map1 {
 
 		cpu6-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 9>;
 
@@ -3973,7 +3966,6 @@ map1 {
 
 		cpu7-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -4017,7 +4009,6 @@ map1 {
 
 		cpu4-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 11>;
 
@@ -4061,7 +4052,6 @@ map1 {
 
 		cpu5-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -4105,7 +4095,6 @@ map1 {
 
 		cpu6-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 13>;
 
@@ -4149,7 +4138,6 @@ map1 {
 
 		cpu7-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 14>;
 
@@ -4193,7 +4181,6 @@ map1 {
 
 		aoss0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 0>;
 
@@ -4208,7 +4195,6 @@ aoss0_alert0: trip-point0 {
 
 		cluster0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -4228,7 +4214,6 @@ cluster0_crit: cluster0-crit {
 
 		cluster1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 6>;
 
@@ -4248,7 +4233,6 @@ cluster1_crit: cluster1-crit {
 
 		aoss1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 0>;
 
@@ -4263,7 +4247,6 @@ aoss1_alert0: trip-point0 {
 
 		gpu-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -4285,7 +4268,6 @@ gpu_top_alert0: trip-point0 {
 
 		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -4307,7 +4289,6 @@ gpu_bottom_alert0: trip-point0 {
 
 		nspss1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -4322,7 +4303,6 @@ nspss1_alert0: trip-point0 {
 
 		nspss2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -4337,7 +4317,6 @@ nspss2_alert0: trip-point0 {
 
 		nspss3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 5>;
 
@@ -4352,7 +4331,6 @@ nspss3_alert0: trip-point0 {
 
 		video-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -4367,7 +4345,6 @@ video_alert0: trip-point0 {
 
 		mem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 7>;
 
@@ -4382,7 +4359,6 @@ mem_alert0: trip-point0 {
 
 		modem1-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 8>;
 
@@ -4397,7 +4373,6 @@ modem1_alert0: trip-point0 {
 
 		modem2-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 9>;
 
@@ -4412,7 +4387,6 @@ modem2_alert0: trip-point0 {
 
 		modem3-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 10>;
 
@@ -4427,7 +4401,6 @@ modem3_alert0: trip-point0 {
 
 		modem4-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 11>;
 
@@ -4442,7 +4415,6 @@ modem4_alert0: trip-point0 {
 
 		camera-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 12>;
 
@@ -4457,7 +4429,6 @@ camera1_alert0: trip-point0 {
 
 		cam-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 13>;
 

-- 
2.40.1


