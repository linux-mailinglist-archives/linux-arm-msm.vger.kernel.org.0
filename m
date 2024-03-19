Return-Path: <linux-arm-msm+bounces-14568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915C880200
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A0FB246EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292B91272DA;
	Tue, 19 Mar 2024 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6bpnMdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CDC86AD2
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864852; cv=none; b=rQK+AD6nlEABDUca1lDVA+d5jB9fPVaSQthQxzVi2LbGHeCMhXrnE6wjq4TUNmjlaWiCcTSmKyKQbOJjAzopaeASFVFPaYyawG5C4ow/i9vhByzeG+PXzzAybh8sGOhzm0HtyRbwEVmkmRNMxFd9HsODFjW4oChtfbA04tnNo+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864852; c=relaxed/simple;
	bh=icuuXSqjatxpixxLqT1V6W9fC72HVgbLSz3h8APncwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uArc2/La3sU36eN+9i4ApYPl8uJzmpwcz84AnsEhjGKsVc7YyFvPhohRXPEgwjXV7hbhHkvEkHuHnAVXx9BVUlURj5ugfPMAgrn8dwgzkQ3xSREAYfVbmoPO+YBPYnht25QrbA07qzzWJW+3Is38Xc+REXpZyexLESQtt+JzEF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6bpnMdn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512e4f4e463so6489718e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864846; x=1711469646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTraggok76PURW3wh7p9AIEGOGIaFqWcV70ApHtUPps=;
        b=n6bpnMdnfeDsvGoE1r0YWSrOB3Mj2ZSDl/ArMo5adIRYdETYKuSQD+R87csVXIFYkM
         WkF9jKyetTnyz25VUN5XJEDmkNNGgu+O4ydS2N57TVReLzln69GugxBHuyRV0x5C6TT/
         W7UiuGIbLkRWHi/Ey2m3FRYug9kPhpTu6dXYUI2BdFznfPmXs6QupEzCnDsiRXJq0pHd
         urhtYww2o9mZ4MSbxho3VVB0wPOk9rfFEPeygvJ/NKt0XCoPP2nYD47Ostnb0DhnkiRO
         fXo6V3RV8Rwttmxo7LDXe6mc4RETxQkyYiKKBfuU9/GtXwQ/09xtWMl+24pnaLWz8yq8
         IkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864846; x=1711469646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTraggok76PURW3wh7p9AIEGOGIaFqWcV70ApHtUPps=;
        b=QEk8XzkS/k0/WkmccL4xg9pmZXzZYk71CB+5Vr2jJ42xGB8Hu2fSu5+8hATaskfCQi
         ZqKOfO0MA4Y2eNuk/CBe4spw9t5DsQLLLgx+pMIqmCmZ77amBtlmx+DeK7uUoxBvlDol
         peWtk4wFzLv9JuX6bfUrLn7NIqpQgxu5JT+lfwrqv1ygRVE1/7iNj0EjU2PUn77rch97
         h1+h3a/rFIyTkv0gONcGIrNAVeCaIBjGcJXfRWcN0BFA9MvaPPQt+yh4ay4ljvnGv+qA
         pIbCkzwAp/1TvXyYqOSjkjGadJFi3Vpb6g0e0IPwRd8SQuqU0s3W/meyzgX3rAJNd59v
         Q1JQ==
X-Gm-Message-State: AOJu0YyHU6MukNVOGyHY0v6XzAgMGv90d97EWsJ93Tv+snFmBkpb6+C2
	kDr1NmRfxi/zPBtca8OKaM/ADhXKi3pFMzQqSNFniLB5BPn5b4G9PZBWWb/8Wvg=
X-Google-Smtp-Source: AGHT+IHbsJDRjHFQvm/ZDq0oQX0UJDG+6JCb+tgPHLTjbTVZij5uEhzqf3ObDNd12cpRfz/vEyH1CQ==
X-Received: by 2002:a19:ca51:0:b0:513:5a7b:1093 with SMTP id h17-20020a19ca51000000b005135a7b1093mr10395007lfj.21.1710864846628;
        Tue, 19 Mar 2024 09:14:06 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:06 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:57 +0100
Subject: [PATCH 27/31] arm64: dts: qcom: sm8250-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-27-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 10 -----
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts  | 14 ------
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 75 --------------------------------
 3 files changed, 99 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index cd0db4f31d4a..ce13fdfb0797 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -110,8 +110,6 @@ lt9611_3v3: lt9611-3v3 {
 
 	thermal-zones {
 		conn-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150b_adc_tm 0>;
 
 			trips {
@@ -124,8 +122,6 @@ active-config0 {
 		};
 
 		pm8150l-pcb-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150l_adc_tm 1>;
 
 			trips {
@@ -138,8 +134,6 @@ active-config0 {
 		};
 
 		skin-msm-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150l_adc_tm 0>;
 
 			trips {
@@ -152,8 +146,6 @@ active-config0 {
 		};
 
 		wifi-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150_adc_tm 1>;
 
 			trips {
@@ -166,8 +158,6 @@ active-config0 {
 		};
 
 		xo-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150_adc_tm 0>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 7ef99038cb37..21b2ca1def83 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -53,8 +53,6 @@ chosen {
 
 	thermal-zones {
 		camera-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150l_adc_tm 0>;
 
 			trips {
@@ -67,8 +65,6 @@ active-config0 {
 		};
 
 		conn-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150b_adc_tm 0>;
 
 			trips {
@@ -81,8 +77,6 @@ active-config0 {
 		};
 
 		mmw-pa1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150_adc_tm 2>;
 
 			trips {
@@ -95,8 +89,6 @@ active-config0 {
 		};
 
 		mmw-pa2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150l_adc_tm 2>;
 
 			trips {
@@ -109,8 +101,6 @@ active-config0 {
 		};
 
 		skin-msm-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150l_adc_tm 1>;
 
 			trips {
@@ -123,8 +113,6 @@ active-config0 {
 		};
 
 		skin-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150_adc_tm 1>;
 
 			trips {
@@ -137,8 +125,6 @@ active-config0 {
 		};
 
 		xo-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8150_adc_tm 0>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 39bd8f0eba1e..c8d4aaacb00a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -6244,9 +6244,6 @@ timer {
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -6288,9 +6285,6 @@ map1 {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -6332,9 +6326,6 @@ map1 {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -6376,9 +6367,6 @@ map1 {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -6420,9 +6408,6 @@ map1 {
 		};
 
 		cpu4-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -6464,9 +6449,6 @@ map1 {
 		};
 
 		cpu5-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -6508,9 +6490,6 @@ map1 {
 		};
 
 		cpu6-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -6552,9 +6531,6 @@ map1 {
 		};
 
 		cpu7-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -6596,9 +6572,6 @@ map1 {
 		};
 
 		cpu4-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -6640,9 +6613,6 @@ map1 {
 		};
 
 		cpu5-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -6684,9 +6654,6 @@ map1 {
 		};
 
 		cpu6-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -6728,9 +6695,6 @@ map1 {
 		};
 
 		cpu7-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -6772,9 +6736,6 @@ map1 {
 		};
 
 		aoss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -6787,9 +6748,6 @@ aoss0_alert0: trip-point0 {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -6807,9 +6765,6 @@ cluster0_crit: cluster0-crit {
 		};
 
 		cluster1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -6827,9 +6782,6 @@ cluster1_crit: cluster1-crit {
 		};
 
 		gpu-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 15>;
 
 			cooling-maps {
@@ -6849,9 +6801,6 @@ gpu_top_alert0: trip-point0 {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -6864,9 +6813,6 @@ aoss1_alert0: trip-point0 {
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -6879,9 +6825,6 @@ wlan_alert0: trip-point0 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -6894,9 +6837,6 @@ video_alert0: trip-point0 {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -6909,9 +6849,6 @@ mem_alert0: trip-point0 {
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -6924,9 +6861,6 @@ q6_hvx_alert0: trip-point0 {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -6939,9 +6873,6 @@ camera_alert0: trip-point0 {
 		};
 
 		compute-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -6954,9 +6885,6 @@ compute_alert0: trip-point0 {
 		};
 
 		npu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -6969,9 +6897,6 @@ npu_alert0: trip-point0 {
 		};
 
 		gpu-bottom-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			cooling-maps {

-- 
2.40.1


