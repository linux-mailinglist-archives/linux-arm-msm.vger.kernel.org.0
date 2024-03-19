Return-Path: <linux-arm-msm+bounces-14571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36275880209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E991F21A54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAED127B72;
	Tue, 19 Mar 2024 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tA4jD1eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCBD127B54
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864857; cv=none; b=tptrMr7PuBhYlL/NwQG854IocJLUG1uiJYIfGoK3K/po5Mq8sTy4T17XqoTt4uxoyvubp5FApTho33eVEMdI0Qbq4ACRkwQgVhLytksZjUnTmRgTMSXM0wNzJq/7LwpMDDVn6pqoa3ll5uZ2jVyJtGngZKJ8oqbT/ugpF6TZI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864857; c=relaxed/simple;
	bh=SLteJC1Oftcfx/pDSbdV85hEd9RawwKiLDMA9H5ZvQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ouui2na4VoAfPHbS5HkDm4kVzvrgJ8trB1KN50LK4HReu0BkbWpcfXUDI95acdte9crgVy+sVsO7Gt33gm81oHTIjnX6HznEugFq4KnTSGY/pOIh8tOhFZwIpl64gmK3hu0ytDPLJOlBIWHsrKEdb9C1CKxRtySZfbYrcZ+zY/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tA4jD1eg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513cfc93f4eso6503688e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864851; x=1711469651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6FR1TiIQMNFX2hWmjLoC33+sHjKjffc4UPvr2nbRk1Q=;
        b=tA4jD1egJn2JjFsKO9qRkkq0RRljsxOb0JPeqXhtVGz4O2D7lzTTByfmK+Qot9BNXh
         1P/FRq5jKx/wuT+mWAdqug+tOQundswp2M5buip/WvRqMeIZF7tZkfK3O9rYwA48nndB
         OZcyOD7QA9jwh4MZ4GG8GrM6DAiq4C4RDxyjN2UApecoDp1wIFbUXfmEpv+qko0t6yoS
         dJJLPrCwqYRjWJGIRxvG+Gn35vFzvER/JdySRiBM6ingEoXsRXrK+qkB/30PpQfAEtir
         jlujvOi5X8F/TMf+X2X55eHfHwlTInVCM5a7UHbXvB13EMPnwnX6/6ewnDrKVsqhjhKG
         jAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864851; x=1711469651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FR1TiIQMNFX2hWmjLoC33+sHjKjffc4UPvr2nbRk1Q=;
        b=XIMVlf81SrTykrZWfxmHEDzonbAHskJvOhORZLmhT/nx1rMCkQvE4IhfLf/1KjAMB/
         b0rlqh0G5taO0tcb3NzErNszCVZUeMQLbe69bIaSvMJDcZfDlshKD9oX+Vv49ZLUGenU
         FhEsaQycGnflcb4EdyJNhZN5ROp/oPEi+B2T1qTS166hESICa9FQ+KiV5eE/plAbYes0
         K0eQzFumcZ6q0AR1GoDJCqUis7KbL69Q1f1zueycWWueEMUb62st+SP83PtiJKNL/Xv4
         jrorvCTz/WtgSl1Sz1wUpXEgqN84F4njBgskQ0n3X2Mu+t7UF123EEcUqYBYUP9nywqw
         JS1A==
X-Gm-Message-State: AOJu0Ywh4STFUgDgMP8a5ZLK3u0VI+hH5N5clOUxJd7VZIIq3u6vLGgS
	FRhNF1tbf7fCxTgvc1nT4iM+BmyyNomN2ZoWQgdsSRlqnak9SnaAX4GFEOechWs=
X-Google-Smtp-Source: AGHT+IFzAzNEOn9bAyW0fToELJusiFTewqoKadptmhXkjC5eh4XSNmEtEPk2wa5TopiADiwNVyT5mw==
X-Received: by 2002:a19:ca1a:0:b0:513:d94a:670a with SMTP id a26-20020a19ca1a000000b00513d94a670amr8510655lfg.38.1710864851440;
        Tue, 19 Mar 2024 09:14:11 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:14:00 +0100
Subject: [PATCH 30/31] arm64: dts: qcom: sm8550-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-30-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm8010.dtsi    |  6 ---
 arch/arm64/boot/dts/qcom/pm8550.dtsi    |  3 --
 arch/arm64/boot/dts/qcom/pm8550b.dtsi   |  3 --
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi  |  3 --
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi  | 12 -----
 arch/arm64/boot/dts/qcom/pmr735d_a.dtsi |  3 --
 arch/arm64/boot/dts/qcom/pmr735d_b.dtsi |  3 --
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 82 ---------------------------------
 8 files changed, 115 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
index 0ea641e12209..583c3c49d603 100644
--- a/arch/arm64/boot/dts/qcom/pm8010.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm8010-m-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8010_m_temp_alarm>;
 
 			trips {
@@ -30,9 +27,6 @@ trip1 {
 		};
 
 		pm8010-n-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8010_n_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 797a18c249a4..27719876a098 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm8550-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 72609f31c890..44c0d4cf3fc8 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm8550b-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550b_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
index 4dc1f03ab2c7..7d13e8d9236b 100644
--- a/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550ve.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm8550ve-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550ve_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
index 97b1c18aa7d8..a7a85f14c650 100644
--- a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm8550vs-c-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550vs_c_temp_alarm>;
 
 			trips {
@@ -30,9 +27,6 @@ trip1 {
 		};
 
 		pm8550vs-d-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550vs_d_temp_alarm>;
 
 			trips {
@@ -51,9 +45,6 @@ trip1 {
 		};
 
 		pm8550vs-e-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550vs_e_temp_alarm>;
 
 			trips {
@@ -72,9 +63,6 @@ trip1 {
 		};
 
 		pm8550vs-g-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8550vs_g_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi b/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
index 37daaefe3431..e2ffe5d077a6 100644
--- a/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735d_a.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pmr735d-k-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pmr735d_k_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi b/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
index 3b470f6ac46f..e8ececc6eee3 100644
--- a/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmr735d_b.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pmr735d-l-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pmr735d_l_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 3904348075f6..b502471c7c9b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4537,8 +4537,6 @@ compute-cb@8 {
 
 	thermal-zones {
 		aoss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -4557,8 +4555,6 @@ reset-mon-config {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -4577,8 +4573,6 @@ reset-mon-config {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -4597,8 +4591,6 @@ reset-mon-config {
 		};
 
 		cpuss2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -4617,8 +4609,6 @@ reset-mon-config {
 		};
 
 		cpuss3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -4637,8 +4627,6 @@ reset-mon-config {
 		};
 
 		cpu3-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -4663,8 +4651,6 @@ cpu3_top_crit: cpu-critical {
 		};
 
 		cpu3-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -4689,8 +4675,6 @@ cpu3_bottom_crit: cpu-critical {
 		};
 
 		cpu4-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -4715,8 +4699,6 @@ cpu4_top_crit: cpu-critical {
 		};
 
 		cpu4-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -4741,8 +4723,6 @@ cpu4_bottom_crit: cpu-critical {
 		};
 
 		cpu5-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -4767,8 +4747,6 @@ cpu5_top_crit: cpu-critical {
 		};
 
 		cpu5-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -4793,8 +4771,6 @@ cpu5_bottom_crit: cpu-critical {
 		};
 
 		cpu6-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -4819,8 +4795,6 @@ cpu6_top_crit: cpu-critical {
 		};
 
 		cpu6-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -4845,8 +4819,6 @@ cpu6_bottom_crit: cpu-critical {
 		};
 
 		cpu7-top-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -4871,8 +4843,6 @@ cpu7_top_crit: cpu-critical {
 		};
 
 		cpu7-middle-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -4897,8 +4867,6 @@ cpu7_middle_crit: cpu-critical {
 		};
 
 		cpu7-bottom-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens0 15>;
 
 			trips {
@@ -4923,8 +4891,6 @@ cpu7_bottom_crit: cpu-critical {
 		};
 
 		aoss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -4943,8 +4909,6 @@ reset-mon-config {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -4969,8 +4933,6 @@ cpu0_crit: cpu-critical {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -4995,8 +4957,6 @@ cpu1_crit: cpu-critical {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -5021,8 +4981,6 @@ cpu2_crit: cpu-critical {
 		};
 
 		cdsp0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 4>;
 
 			trips {
@@ -5053,8 +5011,6 @@ cdsp0_junction_config: junction-config {
 		};
 
 		cdsp1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
@@ -5085,8 +5041,6 @@ cdsp1_junction_config: junction-config {
 		};
 
 		cdsp2-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
@@ -5117,8 +5071,6 @@ cdsp2_junction_config: junction-config {
 		};
 
 		cdsp3-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
@@ -5149,8 +5101,6 @@ cdsp3_junction_config: junction-config {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -5169,8 +5119,6 @@ reset-mon-config {
 		};
 
 		mem-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -5195,8 +5143,6 @@ reset-mon-config {
 		};
 
 		modem0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -5227,8 +5173,6 @@ reset-mon-config {
 		};
 
 		modem1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 11>;
 
 			trips {
@@ -5259,8 +5203,6 @@ reset-mon-config {
 		};
 
 		modem2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 12>;
 
 			trips {
@@ -5291,8 +5233,6 @@ reset-mon-config {
 		};
 
 		modem3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 13>;
 
 			trips {
@@ -5323,8 +5263,6 @@ reset-mon-config {
 		};
 
 		camera0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 14>;
 
 			trips {
@@ -5343,8 +5281,6 @@ reset-mon-config {
 		};
 
 		camera1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens1 15>;
 
 			trips {
@@ -5363,8 +5299,6 @@ reset-mon-config {
 		};
 
 		aoss2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
@@ -5383,8 +5317,6 @@ reset-mon-config {
 		};
 
 		gpuss-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 1>;
 
 			cooling-maps {
@@ -5422,8 +5354,6 @@ gpu0_junction_config: junction-config {
 		};
 
 		gpuss-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 2>;
 
 			cooling-maps {
@@ -5461,8 +5391,6 @@ gpu1_junction_config: junction-config {
 		};
 
 		gpuss-2-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 3>;
 
 			cooling-maps {
@@ -5500,8 +5428,6 @@ gpu2_junction_config: junction-config {
 		};
 
 		gpuss-3-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 4>;
 
 			cooling-maps {
@@ -5539,8 +5465,6 @@ gpu3_junction_config: junction-config {
 		};
 
 		gpuss-4-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 5>;
 
 			cooling-maps {
@@ -5578,8 +5502,6 @@ gpu4_junction_config: junction-config {
 		};
 
 		gpuss-5-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 6>;
 
 			cooling-maps {
@@ -5617,8 +5539,6 @@ gpu5_junction_config: junction-config {
 		};
 
 		gpuss-6-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 7>;
 
 			cooling-maps {
@@ -5656,8 +5576,6 @@ gpu6_junction_config: junction-config {
 		};
 
 		gpuss-7-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
 			thermal-sensors = <&tsens2 8>;
 
 			cooling-maps {

-- 
2.40.1


