Return-Path: <linux-arm-msm+bounces-19676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632C8C2463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21CFE1C23B35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE694170833;
	Fri, 10 May 2024 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYZvJFUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A8817EBB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342410; cv=none; b=cwUomI6Qe2ksRuP7PyvD6vlPvlwlnlEIl5UY27XZe1+E5JBB0emxnfJTY1/NFhVWvaRrUZ29GsRtMMw0+OQAVjU1qJtIXukZ5xHDLyRu9MfQqPgNyopfbLYBCO6PEfqVJHlztURphJvrdpH/QnmPIynu2IAcU+EjYTbuj2q/RYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342410; c=relaxed/simple;
	bh=m+oLLkcgcMUGdC6pLd8kE7nKrrHJZaql0563McJCUYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ow6Hdem9Ge3K6GUFau+9GVdbqA7EF5bcI5d7jBadJIKiVkUVn2d3V0T3Mlu7UdMpXHkwFk4IUAjMNOAv/G92wRUOgYGhtira1WUta7sV4zUVA+SVr3js9NO7MTtyEOyjSvmATms3kXIF3jVAhPf7QgzYKNd7l1iDlLbsuo6j6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYZvJFUD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59cc765c29so433306166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342407; x=1715947207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvrabOJNhb0z6wZV2tI7cOl2sVxLJv29FkvPvZ4Kzsw=;
        b=EYZvJFUD2geOLCDPVzCFsDFOfEBvy5qVACxlNBz+3OvAmUYnvqXmTd6aeF2J7hNQtm
         KAFasnk1rhI3j1InC3G+zA9ZF67TNXdHz2h4Es5fEQMI7cA45yB5uYC1bi4dVKZs70hS
         zpS4Hlt2ekiPPMXt87zS8GsuJoCNgwaD3gtCTEXHXlL/FnwTFTmL6KMNOm350SynRE6s
         +F+0TANGJEHibfRCaou56sm+pqxYaijyNRpGrWILCbyGMrHbVDXiTy/yDuLlgprBlHGH
         AdOUOrRy8ei8PhmDvNhN35Bwk67eJGXC2ME0UWPXtdac23h6OnShdzoh+Mfigl3m31h/
         k5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342407; x=1715947207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvrabOJNhb0z6wZV2tI7cOl2sVxLJv29FkvPvZ4Kzsw=;
        b=UqeCoF/Z1JJJvK22PYipe/xYlnI0dTs8NcJw5nhgTO+cgDqbKp2Zzx+3OycIM0g6TZ
         NDq47JycFAaA8Ng4/+GTAQk/Ovczg7Y9DQwNz2OKc3FOskaSXnWbV1MOlLUOR3PM2gxT
         HjXXWJUPLm0xys6VF3f/Vv9+zxdo6EQ0Q0wI1MvQ1dr70B5VXWlsfjHys8PpdAXSDee6
         Qkv3YmWObVh8RmmylHn3/191SeSWShTY9KbI5/LSF9BaDV9dpqKpy+uQbf9N0CI6kSV2
         OkylX7j/ckkZ0j2priKK61v4zh5kRm5CCDd7UV2r46OBPi4gegzLgCUIwN8yLoiTiKrL
         E3og==
X-Gm-Message-State: AOJu0YzyrltOF5SZkigLWZXZv5IUXnoUsRw5LIfTh/3JQYO14kqrc5uU
	n/uKmrnO0r04ykxdRn2yLxUQefwLdSmBXwIpHKdyYb7ic+acbiK4NPrKbj4S8gc=
X-Google-Smtp-Source: AGHT+IHaK+w4+qGYQNRt2b77eJfYPL6wMoW4G20TYAvbGdA0486bU7Yn5qtN3fIF2ML8Wddm4DHObg==
X-Received: by 2002:a17:906:799:b0:a59:766b:d88 with SMTP id a640c23a62f3a-a5a2d5cca04mr159358766b.36.1715342407472;
        Fri, 10 May 2024 05:00:07 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:00:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:47 +0200
Subject: [PATCH v2 24/31] arm64: dts: qcom: sm6350-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-24-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm6350.dtsi              |  1 -
 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 81 -----------------------
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts |  4 --
 3 files changed, 86 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6350.dtsi b/arch/arm64/boot/dts/qcom/pm6350.dtsi
index 3a2a841e83f1..a20ee2457101 100644
--- a/arch/arm64/boot/dts/qcom/pm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6350.dtsi
@@ -10,7 +10,6 @@ / {
 	thermal-zones {
 		pm6350-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pm6350_temp>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 84ff20a96c83..abfaa1178a39 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2831,9 +2831,6 @@ wifi: wifi@18800000 {
 
 	thermal-zones {
 		aoss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -2846,9 +2843,6 @@ aoss0-crit {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -2861,9 +2855,6 @@ aoss1-crit {
 		};
 
 		audio-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -2876,9 +2867,6 @@ audio-crit {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -2891,9 +2879,6 @@ camera-crit {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -2919,9 +2904,6 @@ map0 {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -2947,9 +2929,6 @@ map0 {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -2975,9 +2954,6 @@ map0 {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -3003,9 +2979,6 @@ map0 {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -3031,9 +3004,6 @@ map0 {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -3059,9 +3029,6 @@ map0 {
 		};
 
 		cpu6-left-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -3087,9 +3054,6 @@ map0 {
 		};
 
 		cpu6-right-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -3115,9 +3079,6 @@ map0 {
 		};
 
 		cpu7-left-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -3143,9 +3104,6 @@ map0 {
 		};
 
 		cpu7-right-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -3171,9 +3129,6 @@ map0 {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -3186,9 +3141,6 @@ cpuss0-crit {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -3201,9 +3153,6 @@ cpuss1-crit {
 		};
 
 		cwlan-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -3216,9 +3165,6 @@ cwlan-crit {
 		};
 
 		ddr-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -3231,9 +3177,6 @@ ddr-crit {
 		};
 
 		gpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -3259,9 +3202,6 @@ map0 {
 		};
 
 		gpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -3287,9 +3227,6 @@ map0 {
 		};
 
 		modem-core0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -3302,9 +3239,6 @@ modem-core0-crit {
 		};
 
 		modem-core1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -3317,9 +3251,6 @@ modem-core1-crit {
 		};
 
 		modem-scl-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -3332,9 +3263,6 @@ modem-scl-crit {
 		};
 
 		modem-vec-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -3347,9 +3275,6 @@ modem-vec-crit {
 		};
 
 		npu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -3362,9 +3287,6 @@ npu-crit {
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -3377,9 +3299,6 @@ q6-hvx-crit {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 11>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index bc67e8c1fe4d..c50fa7f3a5fd 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -94,8 +94,6 @@ memory@efe01000 {
 
 	thermal-zones {
 		chg-skin-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm7250b_adc_tm 0>;
 
 			trips {
@@ -108,8 +106,6 @@ active-config0 {
 		};
 
 		conn-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm7250b_adc_tm 1>;
 
 			trips {

-- 
2.40.1


