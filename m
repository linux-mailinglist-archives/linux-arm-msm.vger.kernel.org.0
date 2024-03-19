Return-Path: <linux-arm-msm+bounces-14547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274B8801AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82AD61F22B50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B339E83A03;
	Tue, 19 Mar 2024 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flJxft6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72982D7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864829; cv=none; b=je4wnVNxXCK7vtYXROOt6Ru2m3DAXHY1+o5Kk6JeWHUEqzGdhOJ3f61PD2pmRlZFmGgb5vVX+J5IGSFgQErwWYt3QMsWvtRBPkE53lqSC5ZvCfZ8SWuMim45068hhjeDHidxcHLDr4chYiFBQDcfqZLeqDTivvbT63rgKNT3gM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864829; c=relaxed/simple;
	bh=PFYMK6VYlsNGq0yT2mzUkiCLZovHcDvfCBSf9J4E7w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PV4l4plSRel1xEyNvt4OI6uO41HuABvI6Io0p8BJ7sbBfjuWGJTt52krsFiU09aJj0GS6SyfpKIXr7tuysL7W4kPbb2yxD9Eia31LntBNpCUiI/ooJy7kKFotG+eSFXUxxkt4UDKbrUL0ZjTs+1NudTasmsToihVJBC7XaMdvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flJxft6Q; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso9874572e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864826; x=1711469626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zjX2LvJZoTkKgrNigxF1JXeIkRgZu7NU8ImcW2GIeo=;
        b=flJxft6Qx/sLfL08fCzLeilXx4jeuhO52LEJ1wFqXPnA9rGStX8zrdnD6woN8U0X7A
         WM7ClmDewfd5dGA0swmYvUZPD4YGLShtLpFU28P1rqDDyxkFRXcBGkkJzgg0EmVC2K9k
         eJ/UOzyHYoXyuDeNbIa2yfR9Blxkq7I1KROC/HCZUSb4OgfoKzJOYjGc9zmTtHBK1zkW
         7u+yy4Lihn/AzLtsBTlkUi4IHbjbSGH1o3JgSILN45k63oN/3vKDfSsls1SZb08i/m2E
         +AIZgJD6DWLNW4omSjYYW3jdewFVn/3UW4anq8M/adhISC/fD63w+yaXh0miMwwUhYMt
         Ue/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864826; x=1711469626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zjX2LvJZoTkKgrNigxF1JXeIkRgZu7NU8ImcW2GIeo=;
        b=u2TAudQNTYIIzZxRhcA8WDtVghdWjL+IsEvTzBRA39l1ZYm9/SAtfc+czX7246FKJK
         rp7jkwoCXJdO00xlSViKVvCKm+6WtozW2Bqhr+IKWrBWhZl5tOn+tCH4JYXzv6RYavnF
         uhkcocSfPPrm7w/VEkqIH+du/6OwHQ+hZf48IjAFMu6A31t7djc663UL86jIohLLzLyS
         DZC+/YldTRCx56u8izj9BwIirlt+I6nOvYota6/vfdrp/+ZJ6kHwwLF6l8DE4E+JTag2
         dogK33WI+sC/aTMFb6sUpCvc53A6g6PQOAbqOwjjsmIfTLYdGlfymQTSDrT51yvm2Mvf
         VaQw==
X-Gm-Message-State: AOJu0Yz1d5+5LMSYJBTTXpXpsvkoaXD4PqoW+fyUouYJwma6/3QAlrIo
	1oUpLHyTWF46QegioLNhheLsmtR/4etiI/Rqqb05KWlYkzok8VsTJN8WMxNRSuQ=
X-Google-Smtp-Source: AGHT+IEl06sVnPcghkVNp49cEc/4CH7lfCC+t3lCR6sd/PvrNoUINkJMCmtaDs7RzkSG1YYm3FInlw==
X-Received: by 2002:a05:6512:b9e:b0:513:ed17:af03 with SMTP id b30-20020a0565120b9e00b00513ed17af03mr5570583lfv.59.1710864826155;
        Tue, 19 Mar 2024 09:13:46 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:37 +0100
Subject: [PATCH 07/31] arm64: dts: qcom: msm8976-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-7-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d2bb1ada361a..09cb8cbceb6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1123,9 +1123,6 @@ pil-reloc@94c {
 
 	thermal-zones {
 		aoss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 0>;
 
 			trips {
@@ -1138,9 +1135,6 @@ aoss0_alert0: trip-point0 {
 		};
 
 		modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 1>;
 			trips {
 				modem_alert0: trip-point0 {
@@ -1152,9 +1146,6 @@ modem_alert0: trip-point0 {
 		};
 
 		qdsp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 2>;
 			trips {
 				qdsp_alert0: trip-point0 {
@@ -1166,9 +1157,6 @@ qdsp_alert0: trip-point0 {
 		};
 
 		cam-isp-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 3>;
 			trips {
 				cam_isp_alert0: trip-point0 {
@@ -1180,8 +1168,6 @@ cam_isp_alert0: trip-point0 {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -1204,8 +1190,6 @@ cpu4_crit: cpu-crit {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -1228,8 +1212,6 @@ cpu5_crit: cpu-crit {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 6>;
 
 			trips {
@@ -1252,8 +1234,6 @@ cpu6_crit: cpu-crit {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -1276,8 +1256,6 @@ cpu7_crit: cpu-crit {
 		};
 
 		big-l2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 8>;
 
 			trips {
@@ -1300,8 +1278,6 @@ l2_crit: l2-crit {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 9>;
 
 			trips {
@@ -1324,8 +1300,6 @@ cpu0_crit: cpu-crit {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 10>;
 
 			trips {

-- 
2.40.1


