Return-Path: <linux-arm-msm+bounces-44727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8AA08E1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 11:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EAE81691C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F1620B7F9;
	Fri, 10 Jan 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DV3raLu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5920ADFE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505384; cv=none; b=Rib7SXXkpQBom/go4st6ckv2RIxoTIuME8xhuF+9hPqlC/1V90Q+x5hN/C+ACpjvRkPSAFVG3BFL0w93rluvB72rQxYHyN2u0MFcPCDun9e0Lb142djZQu7TmuDQ38gQw7Wha+UXkK2QfOMAa/1ov/LqhaW8uaQe8+aeXpv883o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505384; c=relaxed/simple;
	bh=T9MsTjxHcEiz00Qb5igO9gOJCINbs8Lv9eBk8NoMcgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVuYfMBQAWzMADJMfNkMl55qm5PKg4q14h434smGLKkz7A9C37/opUa3mpH4xXbgoMBpQSHVHqxif55Mpt6DdeR2fJA23D45VlVpLpxTl/KADCkO//AJz9y+Z6PO5pyGJjicy04Lh/i1mNqzAoga4aOauggwyLOVpcCsXPEI6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DV3raLu0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso13882595e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 02:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736505380; x=1737110180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyhtJcG1jpCAsStu0zK95vyEU5b3t2eWb1a/+RcnnEs=;
        b=DV3raLu0kQzu/pGrodxDZPTqzO7Z8bb1/Pz2rp4UQdtnmAuMpG/SRVAm8A6+hw4GKp
         zx3Ze6uBk+jGXWmTlBKoRWpZErv7Tb5+o0XElT0hBGXaKW/Orfd6OPFo3miW7yL/vnJ/
         KlyPuA7ia3sDJdnDVmek/GETnDckuvy1gRsgK5rh6C6LsfzxIOLvqYTNPozzbg2YQL00
         DqEOmmhMPvj+ENSc+bQaaMpnUi1GT7jz3/8V4n0KLFugm+DIMsE9BGNFKg661POKkKn7
         /EQNlTiuAWb8Np6f06i3FnZ7vs7MLoS2p+peD1yHwGKmCCayrvg12RJaThsyxavM7lLy
         GHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505380; x=1737110180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyhtJcG1jpCAsStu0zK95vyEU5b3t2eWb1a/+RcnnEs=;
        b=VTddzHarp/KeUUMT2NTMo0E76gBK24MSUeiTtIRCyuXHM15pbxk0nsyQJXX9TuRDVr
         39DTbld8DvZ43AIEHNJsr5pXZbUD5xdA6hW0qoev2hbiYBa2IrkqvtkqIxmB/jfc0cT4
         sBGJeM4WRuI48T6ym36lYgjfhT9bYIJnK1+zZBxhcPbJZr/+sMM6cabI1u0fhqV5cg+i
         tk7/yubzVLvX2NySYGSj+Zm4ROK4RWwDW9Ynuc7WRI0I1lMfB/AljCuOjd8IgT6uuEI4
         T0VyIa3CtW7Gcm+FDTpSF96ATrGdQr6Y9f8w2E6XRUadxrYP/AJte8nkBm1AS3NTlE8q
         O6Fw==
X-Gm-Message-State: AOJu0Yw/cC6Io0OxwXv3OyECyDkxaHeO59LR1NVeypQiLqcR/sAxscs6
	NZ3YF0Wqn5V2Kw3kceQxJN/ePatEFX2xxVxKiZp21GOfgnx6EMpQb6AAYPOuwk0=
X-Gm-Gg: ASbGncuputlYsNREObZb0Tk7S1wnz8/a/PgdVyUl5kak1w6QXQvUirN3RdYCzX3kN9k
	3Wz2HSZ0qEUTdU+WdlGyrPmlkCg9qXvl+wKWVa5eqez3UNox9nK4bobVbXxlKzdLANEnKIzSDvw
	6kwYvNxquoRXKMMC5vWxHRznFMMrBPgbchMt9X8Vbk+KqY74OfsLQ8wldZVd9B6yKJ6ZdCiLBUy
	BsW2Osb0viDtxKUg7N5vR8BxClFvA/83v1p2wfKlMZoGrTCnbpNcM6ZUIPcXw1ziNP/E0tShspF
	HA==
X-Google-Smtp-Source: AGHT+IFje9hX//YIVRQoIELbfAvqPFGe17fUSG/XWIgjHdhJihMA1bYqA+HnHhSQAiOs5JLu9a8d3w==
X-Received: by 2002:a05:600c:4510:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-436e26ffb2cmr104347725e9.30.1736505380458;
        Fri, 10 Jan 2025 02:36:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9df958dsm47906125e9.17.2025.01.10.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:36:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Jan 2025 11:36:15 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
In-Reply-To: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5322;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=T9MsTjxHcEiz00Qb5igO9gOJCINbs8Lv9eBk8NoMcgA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBngPgg+rM7nI1gFHx5U6c0kqPyxRsgsh9PgJ6qtYU1
 l4BoqG6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4D4IAAKCRB33NvayMhJ0SFTD/
 977KTd+2f5ctbi5kv1VtD+lbTedwc3EFIgoZ9CZ5YsEOMYm+JMjNLYi7NlB3iLmaXV1Prj5brh0cag
 DGbBEIxic+rCAm28aXqz+O2KsC1QHC0Ds1N+zpAwdZvBP2Qk2dZjKigV+QOniRwoTTypjN+VccUY2Z
 Ers4IDiN9Z5yKqr4N5Q96fNwbsS/dZi9EeW10J0ObKuhw+hQzaYEpTSN0iggJaJ4jmVwqrvx7RTUId
 hSiM1mONxUa3Ehkm/1jdYmAyJ4O8JrDSsrIATtztaPZIhBVcTDmhexu7vh+3TtVHN10RP5DNMmLxJg
 IdqgXIiFVSkNCBwHvNt5o1w2H2AX1vC+FXG42RIkS3tDvBKI2l1b40EUu/sZZGcYO77w3v9FjidUan
 4IoTZBXNQr+NDa539B+tUIHy/GX3CIdySYbyn8czKBqApm8OywPfDzD+GJdso/r5HL11Lakn7huXL/
 ooQvuDzw2O3SQd8lRZ572FK21C8qJbO30Xz2YzLOBrKXCJV1C5tL1erNHRI/Sv42f37v1iv9wmNEve
 J8rduGCb5Cuaew/SUHve1D8KtLnsu/t/GKsuEtM/7V0EqUveB3+yIMERSMfINojFNK6O8AOd3Xalu3
 sieNeJ7auJwrfv1/tUjdnfHv48l7a3wmy0ax8VilC766wwQKvMZi7P669TDw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
is done in an hardware controlled loop by the GPU Management Unit (GMU).

Since the GMU does a better job at maintaining the GPUs temperature in an
acceptable range by taking in account more parameters like the die
characteristics or other internal sensors, it makes no sense to try
and reproduce a similar set of constraints with the Linux devfreq thermal
core.

Instead, set higher temperatures in the GPU trip points corresponding to
the temperatures provided by Qualcomm in the dowstream source, which will
trigger the devfreq thermal core if the GMU cannot handle the temperature
surge, and try our best to avoid reaching the critical temperature trip
point which should trigger an inevitable thermal shutdown.

Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 95509ce2713d4fcc3dbe0c5cd5827312d5681af4..e9fcf05cb084b7979ecf0f4712fed332e9f4b07a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6173,19 +6173,19 @@ map0 {
 
 			trips {
 				gpu0_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6206,19 +6206,19 @@ map0 {
 
 			trips {
 				gpu1_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6239,19 +6239,19 @@ map0 {
 
 			trips {
 				gpu2_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6272,19 +6272,19 @@ map0 {
 
 			trips {
 				gpu3_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6305,19 +6305,19 @@ map0 {
 
 			trips {
 				gpu4_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6338,19 +6338,19 @@ map0 {
 
 			trips {
 				gpu5_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6371,19 +6371,19 @@ map0 {
 
 			trips {
 				gpu6_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -6404,19 +6404,19 @@ map0 {
 
 			trips {
 				gpu7_alert0: trip-point0 {
-					temperature = <85000>;
+					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
 				trip-point1 {
-					temperature = <90000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "hot";
 				};
 
 				trip-point2 {
-					temperature = <110000>;
+					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};

-- 
2.34.1


