Return-Path: <linux-arm-msm+bounces-19661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B97758C2433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32DAA1F265A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D37172BD4;
	Fri, 10 May 2024 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JiE1VML1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B977172762
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342390; cv=none; b=MCDdWnFZxAlzzmqIJb+tExJ+zR486JjMYUIXbzU6OFol+Pr4J8E+y3v27VWLnR1hqO7sFVmSwvT00TOmRjl031QqG1RM40GOiDQgWKUZ1PGFt8TC8pedACsCm9GhXz0h018oEkBKZSGvvmO+1/Q2U7Ao05TP2+TJXvJ4SRLZNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342390; c=relaxed/simple;
	bh=dPMuQ0ylNI0a5NigtOQVSMDVjzVT9ODCDReELcHdOvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ad7j/IZ8tWWVl7w1EJqnT7Ki02wYQLPDjEzkmtYnnIH2LNU87WFRm8pSbEva8RPPVAoq3aT90ooOnROnjac40wkZYYVb/xhffMXLbY/4f0ic3rvegOu0TT0JJA6xjKQsju56aDS9T6H+pOhhSVZYDzRs/9XB0UCjcxgVlFb1C3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JiE1VML1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51fea3031c3so2654352e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342386; x=1715947186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDcdiULGO3VMyvdeFdkqY9Rkq8pXSaaNzxtQ5BbPA/Q=;
        b=JiE1VML1UrDM0Ygbj5V3bOxvSEUNm9igog16pllqvgWy/S3+edL/EIqAC1u/HuM+a1
         wRkGImcHhc8jfavFYy5xUnBz3mjg30rfYeqVMrhVGHkyZdjOFK+duhdKz5WcHlexHxmB
         0R/yUtlood0f/sJgToejuEDjUtqXP0gfHhApKPa4+moQHLmsOKbsfsCT2YJpXKci/WIX
         3rOb/NjHH/5vMBKpX8qpEWEMCqXf3ssv+ICaqthAaopSSflzIntB8wl25jOwYGgOn4Ng
         eIYyFK+Fd8GxvABkFPkKpglNr5sp2dmvV2ZcbDcLzvFbAnwJPkOgpju2/EdjP3FVW7nz
         +1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342386; x=1715947186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDcdiULGO3VMyvdeFdkqY9Rkq8pXSaaNzxtQ5BbPA/Q=;
        b=ta8mh9aOpbzDcOLGeM9eymktgrDV0/msV/2ishIxhXJKptrbAIpbqSE1t65eISEcSy
         QFWqcsxpck0HpvXQXrzapQ0dsR+EVwuo4zWARWKA7GF0Sp4viD/iwuij5S/kEaIBsy9N
         rYrHxEm1GpZluEZZhDRuoD4DejB/A1hHr05JOjtuH3+HpROfdWfxIMbz6aDKNbhNwVpL
         /MqvfmHC19h+EVXSpFO53HVBqjZyuMjGR0F7g76BERHWODgO6awutX4Mmsm++5+a+hun
         lqUVCXM2L8X3wVCrkIFYDRXQIDDNamNCaV2wiPR0rscGwUFUBQR4k0dyzJJ4NuAWCREU
         yZyw==
X-Gm-Message-State: AOJu0YwkIqJolCpilNQgLytOsX9lDCpliOqLrganXJ8cuwRW8ndp1A01
	Qb+yFzsxqtRaonmlrv5t9pTMTTZIWneEar4hOVnNt5blwJpeBB3TjdsL9YfZDdU=
X-Google-Smtp-Source: AGHT+IE8reF2rvnSOauEKYFYAqbIPPgXCfSVmvV82zhQtU3WrwVDsXK2yejQb6pBFxqDbkVqws2GmA==
X-Received: by 2002:a05:6512:3c9a:b0:521:7846:69d3 with SMTP id 2adb3069b0e04-5221027858amr2420292e87.55.1715342386380;
        Fri, 10 May 2024 04:59:46 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:32 +0200
Subject: [PATCH v2 09/31] arm64: dts: qcom: msm8998-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-9-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 19 -------------------
 arch/arm64/boot/dts/qcom/pm8998.dtsi  |  1 -
 2 files changed, 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d795b2bbe133..13f3c3ee2511 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -488,7 +488,6 @@ slpi_smp2p_in: slave-kernel {
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -509,7 +508,6 @@ cpu0_crit: cpu-crit {
 
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -530,7 +528,6 @@ cpu1_crit: cpu-crit {
 
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -551,7 +548,6 @@ cpu2_crit: cpu-crit {
 
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 4>;
 
@@ -572,7 +568,6 @@ cpu3_crit: cpu-crit {
 
 		cpu4-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -593,7 +588,6 @@ cpu4_crit: cpu-crit {
 
 		cpu5-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -614,7 +608,6 @@ cpu5_crit: cpu-crit {
 
 		cpu6-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 9>;
 
@@ -635,7 +628,6 @@ cpu6_crit: cpu-crit {
 
 		cpu7-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -656,7 +648,6 @@ cpu7_crit: cpu-crit {
 
 		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -671,7 +662,6 @@ gpu1_alert0: trip-point0 {
 
 		gpu-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 13>;
 
@@ -686,7 +676,6 @@ gpu2_alert0: trip-point0 {
 
 		clust0-mhm-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -701,7 +690,6 @@ cluster0_mhm_alert0: trip-point0 {
 
 		clust1-mhm-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 6>;
 
@@ -716,7 +704,6 @@ cluster1_mhm_alert0: trip-point0 {
 
 		cluster1-l2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 11>;
 
@@ -731,7 +718,6 @@ cluster1_l2_alert0: trip-point0 {
 
 		modem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -746,7 +732,6 @@ modem_alert0: trip-point0 {
 
 		mem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -761,7 +746,6 @@ mem_alert0: trip-point0 {
 
 		wlan-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -776,7 +760,6 @@ wlan_alert0: trip-point0 {
 
 		q6-dsp-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -791,7 +774,6 @@ q6_dsp_alert0: trip-point0 {
 
 		camera-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 5>;
 
@@ -806,7 +788,6 @@ camera_alert0: trip-point0 {
 
 		multimedia-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 6>;
 
diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index 3f82715392c6..3ecb330590e5 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -11,7 +11,6 @@ / {
 	thermal-zones {
 		pm8998-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&pm8998_temp>;
 

-- 
2.40.1


