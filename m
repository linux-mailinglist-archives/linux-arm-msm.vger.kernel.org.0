Return-Path: <linux-arm-msm+bounces-14557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74D8801D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF19C1F22042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86F2823C9;
	Tue, 19 Mar 2024 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNLYWvDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7B85649
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864841; cv=none; b=QJJVyBjw7Kuw1hkp/WX+vt7o52L7DwhcyOKdTAWsvTL3kD9D694n3zP5GuOwEbalFyu+z+zk1FG5+HZk+eHoeMNu1GRaxwW0hGT9yQc+/pXarQCBfwRKqUPPAeLsTP/rSk70D0zbqTtcXaQOdfQK79YPQ1uEfbeLlmg0oe4+Wjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864841; c=relaxed/simple;
	bh=Pym46qMvyaBMeluBErICeXf56DkeoKFLyK79WkEUGgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dz0YcS6uiG5gIk+9TmxJbwQfNCw0Ojkwf0KSToNXCLoYvzDkEcEqNoWFN94KVwBrCdBWVp5EiUGm/5xLH0PL9huAsh8XoRJ4zDypAZokHSrfABxuQTJMf0f6swphmzsG4Ule7iWolcZI2+GuUQm+VFs3W3TErRbZBgbbFNNhz80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNLYWvDZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513cfc93f4eso6503342e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864838; x=1711469638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVOjsRMRBg/iht2+2tLbAZFzfh1YTouYAMGPzwwP3vE=;
        b=JNLYWvDZLynDEwL62pAaAjP4MIzjVwsXqlUSsor/TsyYDPjPH0WGHh/kYv67i7zI40
         2LGna5DvgOF7JhqwRLC/QwkxF+3Dx4EV77bacXdBqLc3019H46i8CeI6q0nZaX37ipiz
         yck4O4JTdlUszeIW2Pm7JDkh0MGO87tyzVD4Igi/YFUqev1Ryrk+LypM0byVkuEMMEJV
         E2pVZ2qMWPcz9lr8zahCM+4yXY3WsL+dez8a1RfpdaSAWFDS7EJebr1VUznjNA6LHZyX
         KeJvCUUB9KW+bR/yyAmdrWWOi7Y9pc8E8KpKbDeIQK/acHZoORSr0nGaIFdRpkaUuhDa
         Impg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864838; x=1711469638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVOjsRMRBg/iht2+2tLbAZFzfh1YTouYAMGPzwwP3vE=;
        b=UlXL1sSmpisQSFaB06xe9YueoHaMUlB9ITQvCs45d4mzxI6k3iTnDf5wONi7UwWKnI
         joVU8w9IKnRtLGQI4hz2Af2bUHUSgg38bEGKD82fXQP5bf5Afp0Ht4AY3v0IxS9Jba1l
         P6Z2SiLFgTkVw2SNo8DRUSVVMOYqByqUTi2prFExvwkme3ajtHvsvIV242rRTDtG8Lr/
         nKVOjkAwf1CehIT1DlppXk46osLw0znX/kugeEJJcAjO7zRqRU76XF8ebiu4+cPPQBw6
         v1ckTG/FJ/FNMqs+FQFLKlIVSu3FlZl8WJZEh3LmIhXIJcCu9lmVjDtg0BEnHKX0PDOV
         8OzQ==
X-Gm-Message-State: AOJu0Yxu5UDyt/7mB7Z+OJi+lD70EotRFhg3jBMn1Tczt7dKiDkcJ/We
	RcsdfS4yw8uqgTix/HeVqywI+p7FKGDSHnoZzbFNtQxK0Rx8ph7pQCT+CzPMAd8=
X-Google-Smtp-Source: AGHT+IEymQE2R/LPuSMOAm9qmiinQ4oyVDBn5+RUKhwWE3x96afumU2CeKD9X+VyStQdVL0uKRpw9w==
X-Received: by 2002:a05:6512:619:b0:513:dd23:7a02 with SMTP id b25-20020a056512061900b00513dd237a02mr7815593lfe.26.1710864837754;
        Tue, 19 Mar 2024 09:13:57 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:48 +0100
Subject: [PATCH 18/31] arm64: dts: qcom: sc8180x-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-18-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi |  6 ---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi       | 78 -----------------------------
 2 files changed, 84 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index ddc84282f142..e88e7fd832fe 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -12,9 +12,6 @@
 / {
 	thermal-zones {
 		pmc8180-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pmc8180_temp>;
 
 			trips {
@@ -39,9 +36,6 @@ trip2 {
 		};
 
 		pmc8180c-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pmc8180c_temp>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 32afc78d5b76..010afc39895e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3729,9 +3729,6 @@ wifi: wifi@18800000 {
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -3744,9 +3741,6 @@ cpu-crit {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -3759,9 +3753,6 @@ cpu-crit {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -3774,9 +3765,6 @@ cpu-crit {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -3789,9 +3777,6 @@ cpu-crit {
 		};
 
 		cpu4-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -3804,9 +3789,6 @@ cpu-crit {
 		};
 
 		cpu5-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -3819,9 +3801,6 @@ cpu-crit {
 		};
 
 		cpu6-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -3834,9 +3813,6 @@ cpu-crit {
 		};
 
 		cpu7-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -3849,9 +3825,6 @@ cpu-crit {
 		};
 
 		cpu4-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -3864,9 +3837,6 @@ cpu-crit {
 		};
 
 		cpu5-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -3879,9 +3849,6 @@ cpu-crit {
 		};
 
 		cpu6-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -3894,9 +3861,6 @@ cpu-crit {
 		};
 
 		cpu7-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -3909,9 +3873,6 @@ cpu-crit {
 		};
 
 		aoss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -3924,9 +3885,6 @@ trip-point0 {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -3939,9 +3897,6 @@ cluster-crit {
 		};
 
 		cluster1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -3954,9 +3909,6 @@ cluster-crit {
 		};
 
 		gpu-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 15>;
 
 			cooling-maps {
@@ -3976,9 +3928,6 @@ gpu_top_alert0: trip-point0 {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -3991,9 +3940,6 @@ trip-point0 {
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -4006,9 +3952,6 @@ trip-point0 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -4021,9 +3964,6 @@ trip-point0 {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -4036,9 +3976,6 @@ trip-point0 {
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -4051,9 +3988,6 @@ trip-point0 {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -4066,9 +4000,6 @@ trip-point0 {
 		};
 
 		compute-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -4081,9 +4012,6 @@ trip-point0 {
 		};
 
 		mdm-dsp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -4096,9 +4024,6 @@ trip-point0 {
 		};
 
 		npu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -4111,9 +4036,6 @@ trip-point0 {
 		};
 
 		gpu-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 11>;
 
 			cooling-maps {

-- 
2.40.1


