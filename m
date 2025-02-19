Return-Path: <linux-arm-msm+bounces-48495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62263A3BD18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208A93B739A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA3E1E04AD;
	Wed, 19 Feb 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFnvCbqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E1D1DF977
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965018; cv=none; b=k1viR2rmZ7iRChFmYWoAOQYXRCQwTHoHoWbKQ/CWgcJibukpgLxruFlGYjbN0hFEWDOh+GsQ15nDcW84VdSpbRz8LnLuAyChz37ch2rE782z1qQJZvKX8SGwVjZrtVNIK1YtZmCrP+Ixt0STTKAGTtwqEqQmdKhv6uF7DSMXOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965018; c=relaxed/simple;
	bh=VBtYLlI32D1IT1g6oXAH+/Y5Mni8ARmIevFsmFIlkEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUr+S0pCkl3imiLPkRZXi5BhD7cCviaqQTSZlsKyjbQm8KjG89oKlm12xdpXB/AyghFxjQ3+EmqkZA/CUs1KKyaLh9qfXsWyu0VDRb5OQO5HMYyR60nMydWTbK+jFEruVLOtt/3XW9wU+wWuha5VwFWinjy65V0o0jv3mjF8Pvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFnvCbqc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43948021a45so66707265e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 03:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739965014; x=1740569814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2xAYRgSHSTQxHrbNsTs5CuiGhXgTzNq3Zj4ycfB7Kk=;
        b=CFnvCbqcDDcoJJMjNQNtB7TtLBmXEcHAdjTwuVpzb0X/Zx+34exBvs08OBp/dVEVPw
         AnAkcPXJSC7AhUgwk8PFaMupeiYUI6IdDLGfGnumjrVZBwlQcFHWATngh0JKQLMpOV/s
         nH8i2G7buCUSfXt65GBNSPaRqdZLI9utHN9pDUkoShi4wdMfnHo8i/r6LxBLxGE44mcN
         MJ1xbIcxkIBC4BCYUrIguPk1F1jF3ohoWRM1te5AWxg0MvcSL10jdWCmxJGL7rfkze9K
         5FxZpN5rb0NBizjD/XVzigKpuyqwKJfeSAupMC71JlfsRlKk3RZpQiEJBpAKo/N4fUI0
         zKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965014; x=1740569814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2xAYRgSHSTQxHrbNsTs5CuiGhXgTzNq3Zj4ycfB7Kk=;
        b=eP3tmjllN0d5W+yAdJVfIj7ZDvBQ8Sl0NV2yo4Dvw7wOYrZqInzpohPNjD2K/Vxo5n
         fObgsEkLLpY7rr0zAmYuhOS22PK6tLzzfj6E/7Ef1w5XcFiNJQPvFk92n1bndxuIOFs+
         G19/WbGmtEB8j0ScigQZgzsrLXWkeHVBJLP2w9y2LcAzghgsVie7hoJQn5JUJ7F1bGyy
         lfBWKKiF6vp7Zsbkk3/9DRh2VlIK63IP4aPV12J4j65xkdnuu4oz+f8/aibbopuO+6Tw
         DwDNOmyEc19Z934ZpgGTnRp4SJFyrLhodKggdIb1D4TkGo92OnEwRlic2q0vkDs8OlV3
         +JuA==
X-Forwarded-Encrypted: i=1; AJvYcCVcmgMsWdORcXEHsopLzGdBosCgi1KebsQWNS7TcziAJicp7g5fL3VB4v4Y0qHOJ/zWB3N9C0yA3mRPdwvW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5+RWU55zDdRY3HZcHt0qOeX5HLLkeu4pcMdyyqnUkKYSS0/2
	XCUlh9KZhzhe9+X3CVDY+aIX/IJSf+MRVr9pdgelbGBTrXPW4+bHsy8R2ZahHrw=
X-Gm-Gg: ASbGncuJWedUd4DGsYKFt3xF6imPriagVzo02cxC3djUXi+Ts5da0CQB//GoP6JpzQv
	i8+WUqs9iTRA7uysHWSBx+o+53AG+4SQ9VvWrLYloFvECfZDdZVVtTfGG41zVwm+RGfDK8ulW7X
	H2xtGF9iXAKmXjAA/ci7GmSt4SH5g1JdM9yxTv41IKjI61FcWjxX1qCOhKYfMw7tmgwscCjzLC9
	5hV6+g4urQjAM6ccFeDJOxHgJuLMN/5h7m5MrCbx9w/vFjNYwFMrZaDou6slppibnvdZLeSfK2I
	nD03ieukaIqM5GRNUpEbV7O6XcKvyA==
X-Google-Smtp-Source: AGHT+IGHf16s+kr6QC93nlk3mFr3yas/GHw1k1Yy1YQcjY7HS5Er1cYbYWvfsxfitogVCnNTDB+LGg==
X-Received: by 2002:a05:600c:511e:b0:439:8bc3:a698 with SMTP id 5b1f17b1804b1-43999d7591bmr31932825e9.6.1739965014306;
        Wed, 19 Feb 2025 03:36:54 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8630:e1af:c2ac:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399600257asm42437905e9.4.2025.02.19.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:36:53 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 19 Feb 2025 12:36:21 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100: Drop unused passive
 thermal trip points for CPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-x1e80100-thermal-fixes-v1-4-d110e44ac3f9@linaro.org>
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

There are currently two passive trip points defined for the CPU, but no
cooling devices are attached to the thermal zones. We don't have support
for cpufreq upstream yet, but actually this is redundant anyway because the
CPU is throttled automatically when reaching high temperatures.

Drop the passive trip points and keep just the critical shutdown as safety
measure in case the throttling fails.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 372 ---------------------------------
 1 file changed, 372 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a0d4be29a489618a152f79d15a847338271f12d4..53512e7a413ddcd8cb53996a04c27d9094d8d4c0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8466,23 +8466,9 @@ aoss0-critical {
 		};
 
 		cpu0-0-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 1>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8492,23 +8478,9 @@ cpu-critical {
 		};
 
 		cpu0-0-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 2>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8518,23 +8490,9 @@ cpu-critical {
 		};
 
 		cpu0-1-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 3>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8544,23 +8502,9 @@ cpu-critical {
 		};
 
 		cpu0-1-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens0 4>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8570,23 +8514,9 @@ cpu-critical {
 		};
 
 		cpu0-2-top-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8596,23 +8526,9 @@ cpu-critical {
 		};
 
 		cpu0-2-btm-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8622,23 +8538,9 @@ cpu-critical {
 		};
 
 		cpu0-3-top-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8648,23 +8550,9 @@ cpu-critical {
 		};
 
 		cpu0-3-btm-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8677,12 +8565,6 @@ cpuss0-top-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-
 				cpuss2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8695,12 +8577,6 @@ cpuss0-btm-thermal {
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-
 				cpuss2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8764,23 +8640,9 @@ aoss0-critical {
 		};
 
 		cpu1-0-top-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8790,23 +8652,9 @@ cpu-critical {
 		};
 
 		cpu1-0-btm-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8816,23 +8664,9 @@ cpu-critical {
 		};
 
 		cpu1-1-top-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8842,23 +8676,9 @@ cpu-critical {
 		};
 
 		cpu1-1-btm-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8868,23 +8688,9 @@ cpu-critical {
 		};
 
 		cpu1-2-top-thermal {
-			polling-delay-passive = <250>;
-
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8894,23 +8700,9 @@ cpu-critical {
 		};
 
 		cpu1-2-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens1 6>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8920,23 +8712,9 @@ cpu-critical {
 		};
 
 		cpu1-3-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens1 7>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8946,23 +8724,9 @@ cpu-critical {
 		};
 
 		cpu1-3-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens1 8>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8975,12 +8739,6 @@ cpuss1-top-thermal {
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-
 				cpuss2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -8993,12 +8751,6 @@ cpuss1-btm-thermal {
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-
 				cpuss2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9026,23 +8778,9 @@ aoss0-critical {
 		};
 
 		cpu2-0-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 1>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9052,23 +8790,9 @@ cpu-critical {
 		};
 
 		cpu2-0-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 2>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9078,23 +8802,9 @@ cpu-critical {
 		};
 
 		cpu2-1-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 3>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9104,23 +8814,9 @@ cpu-critical {
 		};
 
 		cpu2-1-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 4>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9130,23 +8826,9 @@ cpu-critical {
 		};
 
 		cpu2-2-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 5>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9156,23 +8838,9 @@ cpu-critical {
 		};
 
 		cpu2-2-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 6>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9182,23 +8850,9 @@ cpu-critical {
 		};
 
 		cpu2-3-top-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 7>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9208,23 +8862,9 @@ cpu-critical {
 		};
 
 		cpu2-3-btm-thermal {
-			polling-delay-passive = <250>;
-
 			thermal-sensors = <&tsens2 8>;
 
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
 				cpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9237,12 +8877,6 @@ cpuss2-top-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-
 				cpuss2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
@@ -9255,12 +8889,6 @@ cpuss2-btm-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "hot";
-				};
-
 				cpuss2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;

-- 
2.47.2


