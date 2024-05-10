Return-Path: <linux-arm-msm+bounces-19674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D223F8C245E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 797CB283A35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195DC17BB10;
	Fri, 10 May 2024 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aaauLdqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20B17BB11
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342408; cv=none; b=ryhZfxolFdsUZqZGMvjUCCN00Ob2FLb8QLFhe5wUC1LWJySXq5i21BFqJ+nd6Mb8P/k1hv5bIfBHEGAJQpEPAYUqDbodXUcPjSJmaniMN+QXO/6G5wnnEIZsngFrlXmXByfF5Bj3TfSj+txzvdfin7qOMJdGYKmsltj7k9WlnsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342408; c=relaxed/simple;
	bh=8bUEbq+oRJxkRBqPHpqaLWyrSKKIG6Sx+NAi7BQ/W74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imsnD678vIxyx2OnwLyOumc1tsXDUk8/EYZRx5xrCclE3AkkVU7lsmf9n1/kmOMZESE5jCDhgfofe479n3HacFpO/1mAodJmIthsx2AZyUZQV9nL40AB1fyGEoQkFaZ8+z0Qngjih8Qmm7stRw29gk+X5uXd2Q9pwcly2HXUuaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aaauLdqc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so431288166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342403; x=1715947203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLNTyk4X9fC3GC8MPmd2z/cegf9V5wRXHvil6Eq3ejM=;
        b=aaauLdqcuri8CArY0oA5L+MkTh7hzk2LgyRCLP/88ny9z1K6I4RDudMePeSPQ44a57
         VHM+ADk9j99h2ERH1iK4e61eRd/w3UgaYJvFmkJtzVyjTJFGp8W/Hc0hvxEC4VcNRffw
         8r5LR/92HF4C4X3JjnAT+dgupn54yBydS/MvireVvw3PQ/EioqiYahyyylV50E6nJct3
         PBgxpGe8rD88c/MXHi8HpjxNb8IaKsXwhCF5zMFQTL5ajVuaOKXbJa3ifJgLqWZt8nwA
         CUO1rW4IWnRJI99MKtFIBC9heORgkqazPt7f7IG9fiHgHbnaBy2842v2drTUQiIRaGcB
         f2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342403; x=1715947203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLNTyk4X9fC3GC8MPmd2z/cegf9V5wRXHvil6Eq3ejM=;
        b=ppTcEXIYQr+74k16N99fC7aMCZy+jb8KEfZGNUmgQhHSS8B7KBsf75dvUpDdCwTArW
         9Nt/8ukRz3xXyLeXwNWU9aPtoEn7RlWUTpRAXpLLqouNYLnCLFG4oGo1Y1BydyoYq3jW
         ov/9K2pMh0j+uTP4HDEBC2qmoACdSsk3iBUKiAdmzAj5vjViSFnMgVYQQqk8s2Kgcufz
         UxtJz0vhwTbemUw2nsW6bgCdL0s/F7EiVVf9/3fLQQS/1k6t5K42mhiEhwuQDiTZLhxi
         aEtiEf9/gmBp4OAmSCGUTcZl0eflxUcPdTDmyCZSu9d+dHOf2Knvsof+pZcQVx83Pnhd
         rwFQ==
X-Gm-Message-State: AOJu0Yy3lvr3hZU5KFylMvpd+5zZ9S4HRTnF/YMukcAuNuiF+bjcmSH2
	pQtn+ENXNhTxBE0+IzEByxQz25AGIB/2cvp7HD9CFQuyRdXySD9mQJLyxZrxke8=
X-Google-Smtp-Source: AGHT+IFZ2kEhW1fWxFTWzlTM66pG7YgPcckaHT9r22C77H6xHhqog5aY2OVcyYaTidPWcopuaL2MHA==
X-Received: by 2002:a17:906:f296:b0:a59:cb29:3fa8 with SMTP id a640c23a62f3a-a5a2d53adbbmr256281866b.14.1715342403343;
        Fri, 10 May 2024 05:00:03 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:00:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:44 +0200
Subject: [PATCH v2 21/31] arm64: dts: qcom: sdm845-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-21-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 12 ------------
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 21 ---------------------
 2 files changed, 33 deletions(-)

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
index 10de2bd46ffc..57507d6ec918 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5358,7 +5358,6 @@ sound: sound {
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -5385,7 +5384,6 @@ cpu0_crit: cpu-crit {
 
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -5412,7 +5410,6 @@ cpu1_crit: cpu-crit {
 
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -5439,7 +5436,6 @@ cpu2_crit: cpu-crit {
 
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 4>;
 
@@ -5466,7 +5462,6 @@ cpu3_crit: cpu-crit {
 
 		cpu4-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -5493,7 +5488,6 @@ cpu4_crit: cpu-crit {
 
 		cpu5-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -5520,7 +5514,6 @@ cpu5_crit: cpu-crit {
 
 		cpu6-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 9>;
 
@@ -5547,7 +5540,6 @@ cpu6_crit: cpu-crit {
 
 		cpu7-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -5574,7 +5566,6 @@ cpu7_crit: cpu-crit {
 
 		aoss0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 0>;
 
@@ -5589,7 +5580,6 @@ aoss0_alert0: trip-point0 {
 
 		cluster0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -5609,7 +5599,6 @@ cluster0_crit: cluster0-crit {
 
 		cluster1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 6>;
 
@@ -5629,7 +5618,6 @@ cluster1_crit: cluster1-crit {
 
 		gpu-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 11>;
 
@@ -5651,7 +5639,6 @@ gpu_top_alert0: trip-point0 {
 
 		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -5673,7 +5660,6 @@ gpu_bottom_alert0: trip-point0 {
 
 		aoss1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 0>;
 
@@ -5688,7 +5674,6 @@ aoss1_alert0: trip-point0 {
 
 		q6-modem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -5703,7 +5688,6 @@ q6_modem_alert0: trip-point0 {
 
 		mem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -5718,7 +5702,6 @@ mem_alert0: trip-point0 {
 
 		wlan-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -5733,7 +5716,6 @@ wlan_alert0: trip-point0 {
 
 		q6-hvx-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -5748,7 +5730,6 @@ q6_hvx_alert0: trip-point0 {
 
 		camera-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 5>;
 
@@ -5763,7 +5744,6 @@ camera_alert0: trip-point0 {
 
 		video-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -5778,7 +5758,6 @@ video_alert0: trip-point0 {
 
 		modem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 7>;
 

-- 
2.40.1


