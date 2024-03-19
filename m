Return-Path: <linux-arm-msm+bounces-14563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F88801E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A662878DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFECE8662C;
	Tue, 19 Mar 2024 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZPtC86W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F13684A51
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864846; cv=none; b=hjrV9Hbb/AKm3Q9tbKXJS/4CwVkkHaxqAlXn0N1OI1hpZHWMYsmOLZB1EEgFLDy/E7/HVnygbQe7yEszug7/HwjdfqJHfRDubeyy91b6Rjzu9srj8BjUF2fk58Vn/DXRHCsHYAtibQTQOfNs80jVQwAMweXv8fcivhnHhTD1qic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864846; c=relaxed/simple;
	bh=pA4U1gIpuSng0p4EvRgnsn4OXJOXp+4JRJ7zOeQmvfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9bAdPX8yGsfcamUIvJWjhPkdba6YBocunoS4Z9v1v5CeFeE+A1cOUpNMHJbA6QRA8XbNsBJOHk0xkOuWUPZDFAyB5grP8PLWuSnb3ftn0LqEvA5LVWvFCWKERBPwy4M98feWWzFxi7ezH4j7ngj1z5AWyDdV/r1XcuJV8KedBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZPtC86W; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-514ba4e5640so1069947e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864842; x=1711469642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfcVMpSrriu/CCewjQNWQl8ouwgswOI0990n8OUQStQ=;
        b=qZPtC86Wt3w/sVLHwMIWWg7BIIP4GKA6xp/Cn5ellroR9rkRMeJBUCwpQxQqp9yo98
         Gc/pXF1r2+CWLlNHNcaQXZra1X29fvSbLh1XhkocVOCGF0kif6lS/8KELBXomQGwzeAu
         rGkAH0oCdKiNKdgKz0Ho9xAv2eVxT4ulk425Q9ky6ano7DhVTzD8LTd2Bp5PWpMOm11s
         tGkk0aAVWmDhn1QUAehUdDMB0YrPnDOMgojdiFsuwzl0Us/Rr+RZDVCYp5dHuAsKmAtk
         w/czXs7WRT9aLTtZZxPcNU7X8mNSloA6TJxTlUvXmx7yxb2pY5k8I5ZxPhNgmwoxqROP
         z3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864842; x=1711469642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfcVMpSrriu/CCewjQNWQl8ouwgswOI0990n8OUQStQ=;
        b=o3WLrkJvDBp7zgrEPPo20BsT/tvcE90a1SuIcRL/zSfWNqvsnkzKkPYaYgef56GEu1
         MwwOfARH+K9yvYI4wub22lKliILMHNHxLBzjl5n4WDM5MUvu9gMOa0hw7CIoJewPnmhD
         U6h6K0NSDlvpGwGXSRxzANPLOMA9MtvFKflnc3K+lok1D8DjIavUp3hdQ/k5T6O2rdpm
         1zmdEZQARY5GOBH0u99Gwo5WiGhNOAvEex1ydLZLbYb24nliLYI8FkgjWebPGvLxPPRc
         gB4+0z9Zew/fiVU4gWgzpx0Hy02G4clWa6inIlSIxDMT9e7eYWEk541Yy//ffx2mcmdr
         hDqw==
X-Gm-Message-State: AOJu0YzsUEqCkowEMTdhS4RxsJCx2DSP9AukDCoNMOiAVI9pc24bZbDz
	v5phSpTOOsHKLvisCz2BK3b/HnAUJIqF5sGEFNFE/TpY2Pv1fsReZ6K20XOKEW0=
X-Google-Smtp-Source: AGHT+IHX5iO3JUm8aTHh0lFyZbl4/yCiMz7XlUvrkC+8Ii2tRHFdbWywW9GwgMHPSMqebNS2pXg0Zw==
X-Received: by 2002:a05:6512:32a8:b0:513:dfac:b29e with SMTP id q8-20020a05651232a800b00513dfacb29emr1185145lfe.26.1710864841772;
        Tue, 19 Mar 2024 09:14:01 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:52 +0100
Subject: [PATCH 22/31] arm64: dts: qcom: sm6115-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-22-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/pmi632.dtsi |  3 ---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 32 --------------------------------
 2 files changed, 35 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 94d53b1cf6c8..e1658993d6c1 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -10,9 +10,6 @@
 / {
 	thermal-zones {
 		pmi632-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pmi632_temp>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index aca0a87092e4..0a0bb5310849 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -3011,8 +3011,6 @@ cpufreq_hw: cpufreq@f521000 {
 
 	thermal-zones {
 		mapss-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -3031,8 +3029,6 @@ trip-point1 {
 		};
 
 		cdsp-hvx-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -3051,8 +3047,6 @@ trip-point1 {
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -3071,8 +3065,6 @@ trip-point1 {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -3091,8 +3083,6 @@ trip-point1 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -3111,8 +3101,6 @@ trip-point1 {
 		};
 
 		modem1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -3131,8 +3119,6 @@ trip-point1 {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -3157,8 +3143,6 @@ cpu4_crit: cpu-crit {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -3183,8 +3167,6 @@ cpu5_crit: cpu-crit {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -3209,8 +3191,6 @@ cpu6_crit: cpu-crit {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -3235,8 +3215,6 @@ cpu7_crit: cpu-crit {
 		};
 
 		cpu45-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -3261,8 +3239,6 @@ cpu45_crit: cpu-crit {
 		};
 
 		cpu67-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -3287,8 +3263,6 @@ cpu67_crit: cpu-crit {
 		};
 
 		cpu0123-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -3313,8 +3287,6 @@ cpu0123_crit: cpu-crit {
 		};
 
 		modem0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -3333,8 +3305,6 @@ trip-point1 {
 		};
 
 		display-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -3353,8 +3323,6 @@ trip-point1 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 15>;
 
 			cooling-maps {

-- 
2.40.1


