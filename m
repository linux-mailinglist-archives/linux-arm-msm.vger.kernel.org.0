Return-Path: <linux-arm-msm+bounces-48494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F7A3BD12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 255C57A5761
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71F01DFDBE;
	Wed, 19 Feb 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gw8cLMwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D31DF25D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965016; cv=none; b=nEob6aVN+6YvTyqvmoHM6YK2pjCeiKVcmnFnsipP1NhOKJQWp5di67ej+kDP9H75jWOgWt2NnFGV/tzRdIYbDDzZBwoTH8WAHdT4R0B0EIE7yOQz0jJROrkemBbATMZ8HbZURq88uPpxLYjGq6xUnhaLN3t+ViIgKpfkA/PaLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965016; c=relaxed/simple;
	bh=aeQpVCYX96EiILRvRBe71bf7oL57iRYfowgV8+KRUvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNTg+PUFx5QXoBAJZg3OWYsunIQyBr2daKkRQJxy+6p9Z830IbItCdldJf0gjOkHHsip7DttqGE820hTAnEmMdhsERmzr3vt2bE17PiA3BAU3FCWabA5nvYCItl9reB3UdFUhcG9ftsL/c3gagp2vTOIvq/1bBGLnjuD5+hxBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gw8cLMwY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso72440025e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739965012; x=1740569812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSkPk59emVMF8j5rckMLbpsRWNkWqyF3q7PprSmf8V8=;
        b=Gw8cLMwYexqDMERa/CyD9oIgsdyG7RCGnpfhwjnJySKq7h8d7TXp8XjKxYokd7UTnr
         5zs8c/oJR5LM5ksRAVOJea3Fv1CdkzQrP72lqXEVw2LO20/be+WOC9WxqDotdDxdpZFD
         60XxksQ+Zd/312GvTUMGcy7WOr5YsGy4wLcqZJ0GFT+o2PXO5lNExZmCj6Y5R9BvTmcR
         4MM7ewP0SBP9Dds61DZS3Z8d3FpgpEqki6s2YTKM39Q/U1shscs1l8YTyVThLk5xw4CE
         HSdAHQr0q7z7xbEMV4NCVoaljKCD3B0ys6gLge29IoGwyyfQz/sfVNPh5KvUjNXryygb
         NRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965012; x=1740569812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSkPk59emVMF8j5rckMLbpsRWNkWqyF3q7PprSmf8V8=;
        b=CDIUrQXXACg2penETzaXjD3DJAPq+XL0cLJkrOl1dURCnxuQs/ZeE2j+7jZ/4+4cAu
         yG68z5mNGYmB691aU9ZjnYuaFh6wjL56oU6ZwolLsFIS2UK0uLmJ8dJeRSq7vX6DzzPe
         Fk/rIKngoIkkPQ1RWbNwo8ggTmQ2MOwQQhxgchwo6tcsHSEVcdVMz6RQXEoQ1cBNnh0Y
         Mhd/eKljqd7F4MPdohOhwA0zvzHrq2wRcoGP5Tu2uCWq5UJkg9bEct84D0zZRPFePBgY
         vwVl3sIl6drUa9AJ4OoLsgjHlCjr1F2w1AIpHqWuzEO4AQOuJKrD46tVk1It35G/2fdj
         x0bg==
X-Forwarded-Encrypted: i=1; AJvYcCXgWRFrZCirhn7zfXmyOxBPOURVwlrQm32jc+8HyjCZcg9Sn6xwq70UU9ZZBaEy81iQO1kM7OoeUiwjHVn+@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGgYYRm9dPFoxm9vDj0rttGr7ZCuPr8x4V06UybVJDjwbol9G
	Mg+jcIZEhYAb0g2YdTfAcqGi7ITTdrs9FionJsPTwGM5o2Rvnjxd6leN9Z/f70w=
X-Gm-Gg: ASbGncvwE2lRHfIFvXcAWP00nxV7N7aBpJ//PCPOGQxzWAIvxflsScHDMg3lIeR5Iv+
	kJ7PQoSR0+VNyursqBjpGkEjTwWIAf4o72mhZ1sE7IzK80hZ6xLNVefvzDtzdGag7iSMyXVvxum
	FBxXyU0S+i04IGidIelzeVIU98b1mwgIEAXFX376oncS72hHKc6gQyekDqdkvBSjnb7nxdIFQgg
	MovExdz0Y8TAh4dy5xoHdV3/UVk/28Ay26rVJIJ4hSfOIFFC5ExwMDczzeTUzU92eqhZW/h7rfN
	5BftoTIbqLmPNsSwfeiA+ijvbw+vZQ==
X-Google-Smtp-Source: AGHT+IEpXXkp/nHXqfdoqJc5/1i4FhiGEfkVGPMa0uEDEmE51VlEjCs0pDaE1dXfD31R0mK2D+8t4w==
X-Received: by 2002:a05:600c:4fce:b0:439:3d5c:8c19 with SMTP id 5b1f17b1804b1-4396e717094mr151284125e9.24.1739965012519;
        Wed, 19 Feb 2025 03:36:52 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8630:e1af:c2ac:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399600257asm42437905e9.4.2025.02.19.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:36:52 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 19 Feb 2025 12:36:20 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250219-x1e80100-thermal-fixes-v1-3-d110e44ac3f9@linaro.org>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures. With certain high GPU loads it is possible to
reach the critical hardware shutdown temperature of 120°C, endangering the
hardware and making it impossible to run certain applications.

Set up GPU cooling similar to the ACPI tables, by throttling the GPU speed
when reaching 95°C and polling every 200ms.

Cc: stable@vger.kernel.org
Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 169 +++++++++++++++++----------------
 1 file changed, 89 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9893fa8353f144e0ee723ab5312cd95aadab041d..a0d4be29a489618a152f79d15a847338271f12d4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -9359,24 +9360,25 @@ nsp3-critical {
 		};
 
 		gpuss-0-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 5>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss0_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9385,24 +9387,25 @@ trip-point2 {
 		};
 
 		gpuss-1-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 6>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss1_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9411,24 +9414,25 @@ trip-point2 {
 		};
 
 		gpuss-2-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 7>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss2_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9437,24 +9441,25 @@ trip-point2 {
 		};
 
 		gpuss-3-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 8>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss3_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9463,24 +9468,25 @@ trip-point2 {
 		};
 
 		gpuss-4-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 9>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss4_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9489,24 +9495,25 @@ trip-point2 {
 		};
 
 		gpuss-5-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 10>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss5_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9515,24 +9522,25 @@ trip-point2 {
 		};
 
 		gpuss-6-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 11>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss6_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss6_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
@@ -9541,24 +9549,25 @@ trip-point2 {
 		};
 
 		gpuss-7-thermal {
-			polling-delay-passive = <10>;
+			polling-delay-passive = <200>;
 
 			thermal-sensors = <&tsens3 12>;
 
-			trips {
-				trip-point0 {
-					temperature = <85000>;
-					hysteresis = <1000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&gpuss7_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
+			};
 
-				trip-point1 {
-					temperature = <90000>;
+			trips {
+				gpuss7_alert0: trip-point0 {
+					temperature = <95000>;
 					hysteresis = <1000>;
-					type = "hot";
+					type = "passive";
 				};
 
-				trip-point2 {
+				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";

-- 
2.47.2


