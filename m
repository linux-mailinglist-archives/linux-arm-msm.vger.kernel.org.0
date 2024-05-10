Return-Path: <linux-arm-msm+bounces-19658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C86378C2428
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6F628A843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC5C17164B;
	Fri, 10 May 2024 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwXJMVsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D216EC08
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342385; cv=none; b=ZXzOQUd2JO+DTZEI6ZpL/SaUIE29JeKa0gY0xnSLrMTcpbdek9wHOFos5v0TLgq1FFOQ4aQ6E7LAZRDc4vDCwTh8hfMnyYZrnOkRL00JGR7pTpBRvt1v7EQE2rxxWo7egEVT4E/J77MB10c+nxY/+4f4cK4fawi0n3kR5KjVgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342385; c=relaxed/simple;
	bh=KZTGROaWinyp8KKqjpNmxxuc5q/IqTWQs6Jwq7SF/Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9NrfZGqPihQc7xJR69wJDDuAHt3vg+sXEUgfpgZdmzNjCAu7fd+I22y/tfy8snlUaen0MiE84qz/LA7mxnqiLOTUqayNY/FDECsvd5VFUQXZvKQa2ZemCpZAC3aUXyyUKne6meWlvuay68vBge1i3xpc6mdOiT56TQv1ySBjbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwXJMVsW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59cf8140d0so477295566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342382; x=1715947182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QX/jm4cX7d1+tOu2d8ujXyYCSTAjlQweFsWO3x+wiG4=;
        b=vwXJMVsWNYZQOJ/8NcjmbnBTBApzNqFhGkloapXpzsamkezH9voNY+vNnoG3If3eRo
         S8tNmk4VF8v6nBBDnrDqjlhLjIYYlNW/4WUZInKhN8KQ6nGJn2Vub27UBtHViUMl47gL
         LzHz7cy98nWPux3CkKZKHejnwSMQDwg4up6Nd5vaGDCGPuEfdcp2vDoj3G+9gF08UDXY
         LVzg+ipqnrkrHczC9rQn91yuWAJ+n/ksV6fjF6fWgrWMCWeB/nqJubXX2vI1Nov/20AE
         LX8+0tkjcwncNnRdZe6gaALXhXd4LSVZCsTp+0lAXcHqoVGn8I4QC3zMsvirVfytrm+U
         A/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342382; x=1715947182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QX/jm4cX7d1+tOu2d8ujXyYCSTAjlQweFsWO3x+wiG4=;
        b=TQ4l8VoXM6U6hV6A7mgd/YFxkItgEAgG90rJreoEdZsWDINylEga+DURYWpMFC4gnL
         COhBxLPdaRIwkbMfHtw8U11nmCZWCqzO1NMEqP9dPBHYNpyQYDcZdP3G5aepu6zTv5Vq
         SV75PRndXMgTh8bZ/A2k1IAAynV4rPdZE4P3LYDXNK/2Ww5rBr12/GqTjf5GX5ydzNhL
         OgbrBdPJuhow7iE2cAA1vEiSCxJzmP83YQn+Gtj//giFM7WEQSfiSixn7IxCi+X2GwSm
         k3Cvz/QnJoDNNSAFFdI1E3hLbFh9eKm5k5coPJ0mrGA3Eu5LKonSz9JD5+cvZdUJOndq
         Wyjg==
X-Gm-Message-State: AOJu0YxtEX8n7p2nA0ho9LAYuuCi3Xpamojqbd0884A7XQzsCGlDt2LA
	7pf+ip8S+isYREyTDDBG4/uznCGs/WDJpWs2TbBKV7MNyabbWkzVj6fs/On8zqk=
X-Google-Smtp-Source: AGHT+IF/moD8NiQToB/ZLMDoTTKrpXQPP8D5Li1oB2VxANDbquQpZD1qIMfcgu08lWoyjUec7EOMeQ==
X-Received: by 2002:a17:907:7fa4:b0:a59:9fc8:38c2 with SMTP id a640c23a62f3a-a5a2d58550dmr206920066b.31.1715342382100;
        Fri, 10 May 2024 04:59:42 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:29 +0200
Subject: [PATCH v2 06/31] arm64: dts: qcom: msm8953-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-6-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 17 ++++++++---------
 arch/arm64/boot/dts/qcom/pm8953.dtsi  |  3 ---
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 5d818fe057dd..92c86504d6f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1968,8 +1968,9 @@ q6routing: routing {
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens0 9>;
+
 			trips {
 				cpu0_alert: trip-point0 {
 					temperature = <80000>;
@@ -1991,8 +1992,9 @@ map0 {
 		};
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens0 10>;
+
 			trips {
 				cpu1_alert: trip-point0 {
 					temperature = <80000>;
@@ -2014,8 +2016,9 @@ map0 {
 		};
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens0 11>;
+
 			trips {
 				cpu2_alert: trip-point0 {
 					temperature = <80000>;
@@ -2037,8 +2040,9 @@ map0 {
 		};
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens0 12>;
+
 			trips {
 				cpu3_alert: trip-point0 {
 					temperature = <80000>;
@@ -2060,7 +2064,6 @@ map0 {
 		};
 		cpu4-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens0 4>;
 			trips {
 				cpu4_alert: trip-point0 {
@@ -2083,7 +2086,6 @@ map0 {
 		};
 		cpu5-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens0 5>;
 			trips {
 				cpu5_alert: trip-point0 {
@@ -2106,7 +2108,6 @@ map0 {
 		};
 		cpu6-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens0 6>;
 			trips {
 				cpu6_alert: trip-point0 {
@@ -2129,7 +2130,6 @@ map0 {
 		};
 		cpu7-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens0 7>;
 			trips {
 				cpu7_alert: trip-point0 {
@@ -2153,7 +2153,6 @@ map0 {
 
 		gpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens0 15>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm8953.dtsi b/arch/arm64/boot/dts/qcom/pm8953.dtsi
index 1067e141be6c..64258505f9ba 100644
--- a/arch/arm64/boot/dts/qcom/pm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8953.dtsi
@@ -9,9 +9,6 @@
 / {
 	thermal-zones {
 		pm8953-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&pm8953_temp>;
 
 			trips {

-- 
2.40.1


