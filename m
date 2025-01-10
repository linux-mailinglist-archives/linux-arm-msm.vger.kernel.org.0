Return-Path: <linux-arm-msm+bounces-44726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90633A08E1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A827169332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1107920B210;
	Fri, 10 Jan 2025 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obx0D18N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241520A5F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505382; cv=none; b=RpJ/HR5Z30rgi8su9gl5nZap96gYsXZTaWU0asXpmqlzw0dmFJK8PqRWU7Mf6vE6eYWmI+x89yPkiBlDF5a7n0v6oITOSJuFUIJqGRfSTaFJWriiDn0xm43Cr0MkFz1/RAzGXs591Gnu7YJA3di8Ms6QSeAvVvXf7oADkjuS04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505382; c=relaxed/simple;
	bh=Lpvp0u73x3ubU5UrDV0TdedIOkakoM8csxlvAZtxZxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyrIHKYWdEOATBViC1hLJW8RrO5G78s0P+g3BeAhWfRMBRtJcGlBQoDXTXXcx2NAufMXfY2D02sHkzBHT/mMbiRKmS/DslP6yS5c62gi2zsr9k40Jlkfb0Ni55zf75Vw+zZSLnFul97jgJFmg4MRuMVivIwt52+qyoq7AnslIcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obx0D18N; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436341f575fso20018465e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736505379; x=1737110179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGPRCN+4MJTf9yyHW8IbDG/NcTY8+Z+VttrmJ0Xh5q4=;
        b=obx0D18NPuNycIKQBSVVOZAURgOAMA4zuCltsiSMLqb7dvTAyDZpLcMNubF+hMCSJ6
         TZH4uTCO7teY0vOxoyemC4iQKGJ4tU1+AukmiRF2hDFp7pSp5LYS+pkHIMIR/DrTuPeK
         pMaeYl8zruhnb/BPrpDODXENccLE+AMslDAVYzc+DC3JLc1fsoardQ5Bwd4GJs8UEjQ7
         VU3+vdKd7+H2FrR1GIeZb7hW9iWHvylHR14pSb5DmNqeSITCJ7tRWO6Jeo2o9H6Pi8X0
         Ab9AMZSwBd38Quwk2Rj9lhDu1nKBP1V6gwtnjwwcXTLUAhUT9Hr62B1gVb+WrK1IgMOE
         dj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505379; x=1737110179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGPRCN+4MJTf9yyHW8IbDG/NcTY8+Z+VttrmJ0Xh5q4=;
        b=pMq6f1rZXt4WkZN35fwsxWZlsjmrVqIz3oBu5nnst3eT8Ff7qmUto/RwoKCCHrbkN+
         7bBDUiBCfcC1Bj47Lop1Gp8Z5mKyDWByVxJduXsfgm0kFDefn7EJhyUKTlNIKnhOOyXd
         s7SPQVNN4CBinZhviF+Yb1tUsv4roBNry753+t5A5KoIQKO7TGEcrSbi+4CwDTwaYI6o
         h9ORRGaQn12voTJWw8Lbhq2WUXNvWDs9N6wiByy9p1DYzkC72omQexmMT6p00m/T+Skm
         XYQRXMAgdI+bIA8mZ/pmdRxXqFCHjqlGNS5ExOJB/N3Ge897ees5NEdg+ug4TswoCuOg
         Z3YQ==
X-Gm-Message-State: AOJu0YwetpnVTxvXCmbugUh8JIzsdreaHvuQv780TDiZtH3+OV72nuI3
	MTw3OmF43/fTxL/KAzFeHURD6awFLdssyWnYLw7wXrrMJwcfne5vCLQyKKFA+k6CBoNcgQISnGp
	w
X-Gm-Gg: ASbGncvI+nDLcwFlZA59lq/xWfIuXpA+1pq+uPe8EZ/d/Xw8iRgDSJBsmFd9BCJbXay
	r9sbn+qdR4uGEoXYg0ygqo+Hgl2F0SAxnw+V7JSbqrrVfW4edND3SVgkEeIAD7RSH357yyeG3rU
	ugYVJzq1iA2CbnrhgdrUBByTBaEVEjFR0JyJtBk94WrUBIh1d03bMATUQ3r0k1WTL88Ic8xcQDT
	i2JbeKlTZur/yVA4s2UlRxPQAdU7DQi+n6Vwr765c6H2OGV4ehKwO+ga9pkDzcGtgKdgdFUi5O/
	qw==
X-Google-Smtp-Source: AGHT+IGh5h7BHnjrI0jRfnZ1XSCn4NgKYJ4IAa8qGzlDEDIPLypsfuayEhU2cgdyBIpmQMq4GetF7A==
X-Received: by 2002:a05:600c:450d:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-436e26a8927mr112011775e9.16.1736505379329;
        Fri, 10 Jan 2025 02:36:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9df958dsm47906125e9.17.2025.01.10.02.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:36:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Jan 2025 11:36:14 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8650: drop cpu thermal passive
 trip points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-topic-sm8650-thermal-cpu-idle-v2-1-5787ad79abbb@linaro.org>
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
In-Reply-To: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Lpvp0u73x3ubU5UrDV0TdedIOkakoM8csxlvAZtxZxM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBngPgg7YYAzhu5VJB0xkLgM7u5yUJxnt09E4QNmbPy
 NAovK9aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4D4IAAKCRB33NvayMhJ0f8EEA
 CtrVGwcbjR6Fd/SLjJgKM2gZjCq1QkIYSTsk54RcLS4RaxWuZrr62MnpE9ZzTc+mY6H+CYbuXSfmnN
 duvuCyH1ISHYz1pTAserSwRm0/HDaNeciRal0OuX8NWtIjRsVL4qu2jbEVL+YUImqL/RVB6K2EN41f
 fs9n9KY4GUXe8sb/sUovQkipehi9fBE2QbjMY+vUAUgFE/ENy0G70ODHok1z44HTFYM9KgFQNWaEAS
 RVuhP9q0PtSd+qAwEYunPERBegQ+3dEc67RdLzHQCrQb/+lSoI+MXUB3+rREQfys+MxgrD9drF7VDh
 8wb1vNDVTfWP1NV3rXxJ6RxJlIsk1OkMX5m2pw8/afueTmYqh88jaA8GDeQTdBq9Z0uTPIQ3foHtWw
 FU+XTnSPkGeFx1hceiRQdjJPxGWy0oZ5OYclbfuVNarBWCETAOBdsTnIL9MXNGnpLfZKhbXuzRSKkB
 hUu8VdqhKGHESHnyXO89BzmoIv6VLoiA2mvzr7wsubL8Cz2eE4C1r0nwQrX/Jy0SyypW2k2mDzpco9
 DtdUdkN6niZnBurqrtktJp1sKi2uhnkloBvUwzz7qeflEPINMlk98zg52C86tkZZM6vxX9o4pC3VRK
 C53ce1ZtrL/iENnlIW7BTn0YcnXGDR+vLfAwojaVYo4ppKlPRg26YSKT+YOA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
hardware controlled loop using the LMH and EPSS blocks with constraints and
OPPs programmed in the board firmware.

Since the Hardware does a better job at maintaining the CPUs temperature
in an acceptable range by taking in account more parameters like the die
characteristics or other factory fused values, it makes no sense to try
and reproduce a similar set of constraints with the Linux cpufreq thermal
core.

In addition, the tsens IP is responsible for monitoring the temperature
across the SoC and the current settings will heavily trigger the tsens
UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
constraints which are currently defined in the DT. And since the CPUs
are not hooked in the thermal trip points, the potential interrupts and
calculations are a waste of system resources.

Drop the current passive trip points and only leave the critical trip
point that will trigger a software system reboot before an hardware
thermal shutdown in the allmost impossible case the hardware DCVS cannot
handle the temperature surge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 180 -----------------------------------
 1 file changed, 180 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..95509ce2713d4fcc3dbe0c5cd5827312d5681af4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5751,18 +5751,6 @@ cpu2-top-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu2-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5775,18 +5763,6 @@ cpu2-bottom-thermal {
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu2-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5799,18 +5775,6 @@ cpu3-top-thermal {
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu3-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5823,18 +5787,6 @@ cpu3-bottom-thermal {
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu3-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5847,18 +5799,6 @@ cpu4-top-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu4-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5871,18 +5811,6 @@ cpu4-bottom-thermal {
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu4-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5895,18 +5823,6 @@ cpu5-top-thermal {
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu5-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5919,18 +5835,6 @@ cpu5-bottom-thermal {
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu5-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5943,18 +5847,6 @@ cpu6-top-thermal {
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu6-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5967,18 +5859,6 @@ cpu6-bottom-thermal {
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu6-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6009,18 +5889,6 @@ cpu7-top-thermal {
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6033,18 +5901,6 @@ cpu7-middle-thermal {
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6057,18 +5913,6 @@ cpu7-bottom-thermal {
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6081,18 +5925,6 @@ cpu0-thermal {
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu0-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6105,18 +5937,6 @@ cpu1-thermal {
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu1-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;

-- 
2.34.1


