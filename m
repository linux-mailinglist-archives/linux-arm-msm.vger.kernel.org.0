Return-Path: <linux-arm-msm+bounces-14559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2028801D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C951F2317F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D108595C;
	Tue, 19 Mar 2024 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDVXop/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5078785659
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864843; cv=none; b=bOjXNWdONweWxQdT96PWGTeowpySgotdER4bW8TRAvr2wrReP2+msLO6mIIH2XkKbDA9figyq/oFc8tkW7xqdV7mxD2VBAjlNpmpn0+2rRQRrSG0G89bKZx9/9d2TSQid/yjMiPyFrioD0j0jFqwOk2zjq2Q5Y57j7ZXppWvufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864843; c=relaxed/simple;
	bh=WvPyzZfNQUrQySxckVP5QXfPEr3BylcrJTFZjJRL61g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjWFyhiKCOG9LF7Eu0jCSxlofPH/YRdsh0aMTtNCkeaM2EXVhtOSozlVFMu5Es7AMK2sFbMA4P/2axspvb1kkH7pk4/RUAN/oxlVhBNpClpo2zotrhsJGJ1VhKqsBR3Q2Waj513jQkYkwBn/YMfRufPIYtjDxBpMk1JK9lo05y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDVXop/L; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d4559fb4so6996467e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864838; x=1711469638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INVlAMS/JfEb8n+Ryd4uQ5TKLO8ePn6L/ZZbKVUldII=;
        b=QDVXop/LRZ24TtAcm0/l7AOfrinN4v3n3GL7w/ixXGSY3ps+kFZDkS/W3+IEWVagGI
         WYnADkh37tbVlq5dcYmr3B6/TZADRS9oFMm3T8c7MpemTIrz9R2caJcAjqEmHRw2Z8dj
         cQLB4ucsbmbs05yN+tGM5REdJV0AGmVVnggvACK/kYfJc1348XzSaLPWcgvzdWATB6T6
         9QPabHuhc+2mUL/XmaJ4nWtF1hAuDSWxkR8UUckMlDt1sOmgAQ3D/gubBRNfEA/KySqA
         SqUnY2dZNVnaY4IstMU4adxKkiLtocH1DVV12yYeLVw+azUiwtHNLBwMCzZKUlplthHk
         QQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864838; x=1711469638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INVlAMS/JfEb8n+Ryd4uQ5TKLO8ePn6L/ZZbKVUldII=;
        b=ovhYHe02G/Mz5K25+8SYno/cVSnA3AM5CAdQYLny6/aIKMYWo4t/Hb7cfdHPdgGdEi
         No6PfWDrb95NpAvitXkgYv4t23tjSnlBFCZpwYjGa1nkOKXlQMsTPmbso7WGBISQQpoS
         fZtIRkcIWHOzm2LY2tB9sStG3B2xGVArrdzHj91tzudTMRMmIWLw+WbUNN6vQIMmFdF3
         y09vMgFGDxufCHfPknt78tE9yYAlTZ0fpG92e6MtZ1AAiAdE56YVYe9zsBDsyvH9BadZ
         0v2C2OpQ/8hAuFD1GlsSh7DP/7dPNpHd4lAabUlNIry4AA9bRYsu+N2L0NpQ+Yxr5B/f
         QsJA==
X-Gm-Message-State: AOJu0YxuzomNpCeKpmVSI56dCDMnQ2+nJVSVANJHDsNchH3zWkRzxe+q
	XvXFDpdDnR/L2FytMsa1IVUORQMZN7zmRcBlw39iIuep7mD9uyPDkSql9FxxmtI=
X-Google-Smtp-Source: AGHT+IGbyA85Wt5UtTI71E56whtDNrT9UVmjbmi/g9ZDIbZFuiPEsalu9HEPteYL6ysWDwPWZtFjtw==
X-Received: by 2002:ac2:495c:0:b0:512:e220:d3ab with SMTP id o28-20020ac2495c000000b00512e220d3abmr2313798lfi.65.1710864838712;
        Tue, 19 Mar 2024 09:13:58 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:49 +0100
Subject: [PATCH 19/31] arm64: dts: qcom: sc8280xp-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-19-e0aee1dbcd78@linaro.org>
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
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 --
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |  4 ---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 33 ----------------------
 3 files changed, 39 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 15ae94c1602d..cd6a585359f7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -296,8 +296,6 @@ linux,cma {
 
 	thermal-zones {
 		skin-temp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmk8280_adc_tm 5>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 945de77911de..4283d59c556d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -13,8 +13,6 @@
 / {
 	thermal-zones {
 		pm8280_1_thermal: pm8280-1-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8280_1_temp_alarm>;
 
 			trips {
@@ -33,8 +31,6 @@ trip1 {
 		};
 
 		pm8280_2_thermal: pm8280-2-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pm8280_2_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a5b194813079..00fd4a187297 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5648,9 +5648,6 @@ sound: sound {
 
 	thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -5663,9 +5660,6 @@ cpu-crit {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -5678,9 +5672,6 @@ cpu-crit {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -5693,9 +5684,6 @@ cpu-crit {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -5708,9 +5696,6 @@ cpu-crit {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -5723,9 +5708,6 @@ cpu-crit {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -5738,9 +5720,6 @@ cpu-crit {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -5753,9 +5732,6 @@ cpu-crit {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -5768,9 +5744,6 @@ cpu-crit {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -5783,9 +5756,6 @@ cpu-crit {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 2>;
 
 			trips {
@@ -5798,9 +5768,6 @@ gpu-crit {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens1 15>;
 
 			trips {

-- 
2.40.1


