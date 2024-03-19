Return-Path: <linux-arm-msm+bounces-14567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BA38801FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F06288D07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EA61272C8;
	Tue, 19 Mar 2024 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/uHbJAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E5B823D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864851; cv=none; b=eJzm70HKwur0CdFz8YWc8WhxtBCmdQa3S+pM3mFiB+Nk7QNWSrjQaqbbXdPrPQH0ZZpRcpV2GV7zexUoy5xEZ9ub+0FU2XaBjtadDJBLxR9dJjImRt/V30H7+6q1UvfdnH9NW7fnwjoj6WSqo8KSOPjXVKsfLpzfT8NveGx7AHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864851; c=relaxed/simple;
	bh=bZwzKCPFP36K4ma9bczD6CPYa7x8uP/DtfKIjWU2Fc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WZieyOmOgLQosOSdgIGBvJm9fVa3WgcBV20fYKTsK7q/xU6E+Y2HduIPDa8/WI1K30Eo/LdPwaM+uyC9xhNbWz0l2q/YjWJ/WvawadFr0lbWJvS1Bi2g+Lg3+VLo7aAgXS7PMPn/qitUMKk8TlzgHYCsz43lgBREZFLKxzSYi1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/uHbJAK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513e4dd6ca4so11835e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864847; x=1711469647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts1LMNcNLj/PrvfTQKo0ihyTi9/sKmL5uu9MIAZoRlc=;
        b=F/uHbJAKOWiaCj0CoG540/mTxtu4KvBMGtQV13wP6+mHZlBKfbv9TfBBjQQOH02Bnu
         2hW+h35u5Q+gO641ennKZ4fUydyKh6N5akriU1Adp76q7BTvbxc3PcIJ9mBePhbt/8jb
         6fyeeWrHPerT46gG0q/50lFSCSXHeERVG0z9v3wRIwnBu9JfRbgkJ4pTKk9ikj90HrDo
         df3d9erh6yUffQnRMj9Rn2F7QIwqNCoKtEDW97xb4+iU+67KmVt6UwJi70hGwGeBGm1S
         zGdnN92wjF2FveS0zsoW5HzSYyCbchIKlUGpuQdnwThfaLtg9VBo0S2ch+YNNOytQAjT
         NjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864847; x=1711469647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts1LMNcNLj/PrvfTQKo0ihyTi9/sKmL5uu9MIAZoRlc=;
        b=WOd6jUahsA+rv4R9FFIE8nIDbbno/hi7aTsM8Grm/T74itvVUJVOCVeR2rML4MuT2y
         6S9MjX2vUi5I47xiHSKr8LFH68AKkdA/JS1ZcRWfNif2Fqz6Wx2+3fIEGZK7QdewYTxd
         nVtRNYh6Jzzovv8W2eIqlnYZk6Nxu7NmhFVfIbhwha7E8KNt/aclWwmzoYvJ1jxJTrvW
         48zGMx8/jonU/OlocXsPzFr/5QE8EDOq9jLOQKiahN/IxO3qoBlwXXAXU2BSLOVfp/qa
         CGsgzM0lnxYKGKGVJ/xeBM9cH9Hqpd3m7fFB9+bNzcCjeXrug4cDgRH+oK5YjM1Psj9N
         0Vzw==
X-Gm-Message-State: AOJu0Yy3CP1KjMxN1Ptmu+8H439lF7RXxigmGOytXiLYOdJwS45ze4wf
	NOrPrBD/ez0SOtx3HLwrvhDyJOmhAo768m59gkgV0/euVDiLJWptpJ8WQ/hOBro=
X-Google-Smtp-Source: AGHT+IHJOtXiU8caDiHy8B47iUqFn8AMRgkM8k6dim/xM5Gp/GQTTCOJODaZ7aXGWjZ0REwEYj0JAg==
X-Received: by 2002:a19:ca59:0:b0:513:d4fb:fa76 with SMTP id h25-20020a19ca59000000b00513d4fbfa76mr1229302lfj.3.1710864847623;
        Tue, 19 Mar 2024 09:14:07 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:58 +0100
Subject: [PATCH 28/31] arm64: dts: qcom: sm8350-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-28-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm8350.dtsi  |  2 -
 arch/arm64/boot/dts/qcom/pm8350b.dtsi |  2 -
 arch/arm64/boot/dts/qcom/pm8350c.dtsi |  2 -
 arch/arm64/boot/dts/qcom/pmr735a.dtsi |  2 -
 arch/arm64/boot/dts/qcom/pmr735b.dtsi |  2 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 87 -----------------------------------
 6 files changed, 97 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
index 9ed9ba23e81e..20cd4d28b46b 100644
--- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
@@ -9,8 +9,6 @@
 / {
 	thermal-zones {
 		pm8350_thermal: pm8350-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8350_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8350b.dtsi b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
index 05c105898892..058f7421ea49 100644
--- a/arch/arm64/boot/dts/qcom/pm8350b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350b.dtsi
@@ -9,8 +9,6 @@
 / {
 	thermal-zones {
 		pm8350b_thermal: pm8350b-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8350b_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index aa74e21fe0dc..bc5555b14ca7 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -47,8 +47,6 @@ pm8350c_pwm: pwm {
 / {
 	thermal-zones {
 		pm8350c_thermal: pm8350c-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8350c_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pmr735a.dtsi b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
index febda50779f9..809bee0e164f 100644
--- a/arch/arm64/boot/dts/qcom/pmr735a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735a.dtsi
@@ -35,8 +35,6 @@ pmr735a_gpios: gpio@8800 {
 / {
 	thermal-zones {
 		pmr735a_thermal: pmr735a-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmr735a_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pmr735b.dtsi b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
index f7473e247322..9a71b77c7fc4 100644
--- a/arch/arm64/boot/dts/qcom/pmr735b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735b.dtsi
@@ -9,8 +9,6 @@
 / {
 	thermal-zones {
 		pmr735b_thermal: pmr735b-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmr735b_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a5e7dbbd8c6c..cf9ed53a834c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3638,9 +3638,6 @@ compute-cb@8 {
 
 	thermal_zones: thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -3682,9 +3679,6 @@ map1 {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -3726,9 +3720,6 @@ map1 {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -3770,9 +3761,6 @@ map1 {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -3814,9 +3802,6 @@ map1 {
 		};
 
 		cpu4-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -3858,9 +3843,6 @@ map1 {
 		};
 
 		cpu5-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -3902,9 +3884,6 @@ map1 {
 		};
 
 		cpu6-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -3946,9 +3925,6 @@ map1 {
 		};
 
 		cpu7-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -3990,9 +3966,6 @@ map1 {
 		};
 
 		cpu4-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -4034,9 +4007,6 @@ map1 {
 		};
 
 		cpu5-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -4078,9 +4048,6 @@ map1 {
 		};
 
 		cpu6-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -4122,9 +4089,6 @@ map1 {
 		};
 
 		cpu7-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -4166,9 +4130,6 @@ map1 {
 		};
 
 		aoss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -4181,9 +4142,6 @@ aoss0_alert0: trip-point0 {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -4201,9 +4159,6 @@ cluster0_crit: cluster0-crit {
 		};
 
 		cluster1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -4221,9 +4176,6 @@ cluster1_crit: cluster1-crit {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -4236,9 +4188,6 @@ aoss1_alert0: trip-point0 {
 		};
 
 		gpu-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			cooling-maps {
@@ -4258,9 +4207,6 @@ gpu_top_alert0: trip-point0 {
 		};
 
 		gpu-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			cooling-maps {
@@ -4280,9 +4226,6 @@ gpu_bottom_alert0: trip-point0 {
 		};
 
 		nspss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -4295,9 +4238,6 @@ nspss1_alert0: trip-point0 {
 		};
 
 		nspss2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -4310,9 +4250,6 @@ nspss2_alert0: trip-point0 {
 		};
 
 		nspss3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -4325,9 +4262,6 @@ nspss3_alert0: trip-point0 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -4340,9 +4274,6 @@ video_alert0: trip-point0 {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -4355,9 +4286,6 @@ mem_alert0: trip-point0 {
 		};
 
 		modem1-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -4370,9 +4298,6 @@ modem1_alert0: trip-point0 {
 		};
 
 		modem2-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -4385,9 +4310,6 @@ modem2_alert0: trip-point0 {
 		};
 
 		modem3-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -4400,9 +4322,6 @@ modem3_alert0: trip-point0 {
 		};
 
 		modem4-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 11>;
 
 			trips {
@@ -4415,9 +4334,6 @@ modem4_alert0: trip-point0 {
 		};
 
 		camera-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 12>;
 
 			trips {
@@ -4430,9 +4346,6 @@ camera1_alert0: trip-point0 {
 		};
 
 		cam-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 13>;
 
 			trips {

-- 
2.40.1


