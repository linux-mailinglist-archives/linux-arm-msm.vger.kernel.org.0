Return-Path: <linux-arm-msm+bounces-19659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C28C242E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B9C31F240AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF79A171E69;
	Fri, 10 May 2024 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6V7UgHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C217109F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342387; cv=none; b=SLnOiLazkPfWZpiv081eM5tnQWWGpGOSCdkJL87cu1FT30cNFKYtFrSKip27JZH4izShZy5+wtEA1/ADyGIZdCZiou2j7YV3F4GGtEM55SVhnz1ROVrLzHNla6Vajcdyv7+OYeRASoGLc7GVB20Ph+YroZFTgyYN4iLw6B2O5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342387; c=relaxed/simple;
	bh=Lc/qZcb1UEvRNkKjlc0ptaH3IPwvEDwKSh3RJoXh43E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZE7OYbOnL6tQLv1AGsfieLgZGVzj8tGOQEHsUWGH8SHJirkl6s//Cdb/UYdXsoT8VhgWjeWZ8RL0vnX7oWcBRpk+kQ8kDs21ZbUaMS2sCd8YMU/IrAx/7twwNg91wh46XIJy9yXq8kWtpSk+5tKtaHFlmLgEbNsZKARAzGTseVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6V7UgHQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59a387fbc9so508031466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342383; x=1715947183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2FFq24pdHCjY5SSKH0xO6GPwXsrqMdD9iEeVpRzJjI=;
        b=U6V7UgHQ+1VBuLjw5UP5rRKMI7kYo5a6bWjrw7l640+v1L48/ZGyMojkMnTCAWXnib
         0B9w8VRlneeunnRcF1vKOHpQ6n0aztM4dMbF02p3JED554e/UW5KD8/rUqgD31VG8jCT
         7WweJWkjj8thk5klgtM0hqphXzyIBMF7zsYK9zqfDLttblRuPwzPfsWnxtmuA2ijUzJB
         JN7YzhTR9jQHRg8awIx2Oeu0wX8N4KXP3KL7erAxXVe7yuEnpzyC3swQZqSMZR7VD7HN
         qpZ08kAjKtOSXT4kU2MQlcHlxYnrptM6Bjf7E75IZm4okW2VkFaCO1iWOHt+TXUTIoEr
         FixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342383; x=1715947183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2FFq24pdHCjY5SSKH0xO6GPwXsrqMdD9iEeVpRzJjI=;
        b=d7EKGn23Oap7WnpfGbjENF85Plir7l/NEZWUGiRZe7tm5+JkC9TVc9AYgS3dG6fQbq
         8ydZktrmR9F/NVUo2AQmIfiYF7Xa3iry4eVXNP6a12CCPj70gAvhlM4GsK4fIt3GSUKt
         gpSCxMkF5y2Pha44n9jfOdtotORN57VCqitR2SPU/4iObvGu3E9FLSRyX1hW1BYJthDf
         7qUR43UFPkpn/ZZCas5mCmSebqmFQ7SM4Y7HnTD5aV57E0y86kLjsnNezA55+b9Z0oft
         wWt0w1yBwfhdzq3Bpz7DjXHRlK4HQZsS+NF0gjD3F4HKC2LnLHAzUtWB02FYXDNHtn2P
         afXg==
X-Gm-Message-State: AOJu0YwvT8YKwLbD6B8wfUu64ntzczEOUlaVKMEBmqUsJ4F1ur6hw0sF
	K5lG9Fw+Kin6r6YFu/vxipSsRO9BcmPU3OUh2CtlBEXni6zZU0Do6rmLJ43wyPU=
X-Google-Smtp-Source: AGHT+IG20lZScTzx7LRtP2dXQZ7+d/7vV2qeN+BFTt/Ra474UYjYw7vgv4MprgEqjfHOtW83zVQhGg==
X-Received: by 2002:a17:906:eb46:b0:a59:a85c:a5c6 with SMTP id a640c23a62f3a-a5a2d585996mr169003366b.22.1715342383341;
        Fri, 10 May 2024 04:59:43 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:30 +0200
Subject: [PATCH v2 07/31] arm64: dts: qcom: msm8976-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-7-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d2bb1ada361a..4e4620de7f3c 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1124,7 +1124,6 @@ pil-reloc@94c {
 	thermal-zones {
 		aoss0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 0>;
 
@@ -1139,7 +1138,6 @@ aoss0_alert0: trip-point0 {
 
 		modem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 1>;
 			trips {
@@ -1153,7 +1151,6 @@ modem_alert0: trip-point0 {
 
 		qdsp-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 2>;
 			trips {
@@ -1167,7 +1164,6 @@ qdsp_alert0: trip-point0 {
 
 		cam-isp-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 3>;
 			trips {
@@ -1181,7 +1177,7 @@ cam_isp_alert0: trip-point0 {
 
 		cpu4-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -1205,7 +1201,7 @@ cpu4_crit: cpu-crit {
 
 		cpu5-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -1229,7 +1225,7 @@ cpu5_crit: cpu-crit {
 
 		cpu6-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 6>;
 
 			trips {
@@ -1253,7 +1249,7 @@ cpu6_crit: cpu-crit {
 
 		cpu7-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -1277,7 +1273,7 @@ cpu7_crit: cpu-crit {
 
 		big-l2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 8>;
 
 			trips {
@@ -1301,7 +1297,7 @@ l2_crit: l2-crit {
 
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 9>;
 
 			trips {
@@ -1325,7 +1321,7 @@ cpu0_crit: cpu-crit {
 
 		gpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+
 			thermal-sensors = <&tsens 10>;
 
 			trips {

-- 
2.40.1


