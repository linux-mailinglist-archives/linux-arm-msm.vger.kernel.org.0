Return-Path: <linux-arm-msm+bounces-48492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8329A3BD0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE246189A8C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20671DF742;
	Wed, 19 Feb 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ic7iNTZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F61DEFE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965015; cv=none; b=TRiwM/CWr10/Rz/WwCdgWfXryNumRqcVVAVCtycrJ6ptIaWYLdk3GQnd1QneMed47agEre/5ZJp3VxjkYMdMGitt4ck6M/9HII9ZlMZwUQoAt7IJM9HT5puG9RjwG/94qCthSY2dozXyPtT5yL8ZQaky/Mg2vAM1tasnuuAiRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965015; c=relaxed/simple;
	bh=33cm5WS/G6VY/dc2qmZDX/V+SsLvyzcbRcvB37CSYbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbyKrc4+zbJbTeNmEtzQgulhOtiwl+pDZISbMzQxgZdQSVHfCVaOILH0N63pghJ0JH3qUGZd5A7uV99dx6R1luE9NQGJwPxCf7dr+IMvBsDIqam8j6kj3uPNYqL1Rpd8pJ47vfxMFTK8oSmyq1iN5rbKEmS6EEQ6RK5cbMJc4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ic7iNTZl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f22fe889aso5195643f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739965012; x=1740569812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iGD8NL6kmMwxzaeqi64LDKuVZAOMW+RBizn+/JXQY4=;
        b=ic7iNTZlRIWUQj7DT5lr/73OPfswNiw2hlScvnzEoGekUAZ9m2wM3hi2uIzeDA0krn
         lNVT+INT65JfTm5PIoyTewlkclRO6HTB+O49LchJcA5nihEOXhgG2SqCSVlmrcB2sli+
         B7bcpaup8pFbv4OFAaG7BIowYvuzxD1C6fA+mCWYYyeSEqWv5TfoFvaWXn5+N30cAug8
         WBcZaIQ0qEpoxL56HVXwcMCtZruo44HLDhomCmVCRHGu1KMAs83lyNvToutpkC7Pn6nN
         Xi/sbgVVNo0ebTY20WeN20LmlQbeqsQtmUyPqwNEZf9hw/gfyIWyef6GT9QwX+W2Z20m
         mm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965012; x=1740569812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iGD8NL6kmMwxzaeqi64LDKuVZAOMW+RBizn+/JXQY4=;
        b=s3tcMyaZHWT7VVucsPFSD0RRJBZJV9eAMQPF+lW5nAGhWagPlX14YkOBto2GA/vbvY
         vF3RLrJzvW6SgHNsWkv/NhoqfDSvts0D7cc/SE5XrJWKAKB9stlK7ZkhU7yiJORMo9EY
         +lwtchsVV3zoHyFWnmbLydRC9PqLouHx6QaeHqpz7uOGe1CN2j3BkqervPNXsLRKp6Bm
         YTbPWbQfOyJ1CAyUV7K9+AF0gNtPy0FNKTq9PxGvWt8unwyhOj5/8+GVbO0/83c7HmcE
         D4ZYM7u4l5gEamgBwNHI07w9NBhjvKNcb34KuHH/UlVcyL7eXgNsir2l0KMGmeYs2cS2
         mW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBlyZ2SZI/hDn4G4T5kWjk4ItJFbHLEwCDpB9TBVDGJrBevmTt1LH6Y1444Md6hmktlWztPewPIerMtKvR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1g8JbomFYFNjh68P5ANgUlPmFM4NpluKgqUfBh1ZKBlciHUDb
	uSFpNlLcRGLa3M64aLi55AOyyUumuvu6PgA4PTv9HvAoqBfFRBk+FQuWZ5Nr02w=
X-Gm-Gg: ASbGncuAj8mLk66XhtSOtUP4eP1YdFxoReMrxPMUGudQoNDdMAsjgA+Sumk37OPBJIc
	olp3rzi6S0PwQaEU1tLeGjL3CiDAYox5+ote/XjUk2nYGtqtLnVkuCBx3MwYHDBcE8LtyFBNVRs
	DIMyYu9cIZqUXELoDKMjxq492saNtSXNEN+5K1gNUamLkukh/w5+rla+JBz4/ftBN7CedReZJev
	OugyCLJjmLVhLJpLWL9UTa8BDvikxjNCK1K3tP81m0whvWFbEA4dLbPY8c2bC1XANXJqz9bmHt0
	G8ct6ZIq/HaLCV0xQMoaey7zljSNzw==
X-Google-Smtp-Source: AGHT+IGNMSOqjWnlyZLFvK6YmONGNDZANemlT7uaXrS7eZVPt8fRzXq+1z+qd/VxYr7IARiwT5KheA==
X-Received: by 2002:a5d:5888:0:b0:38d:e33d:d0eb with SMTP id ffacd0b85a97d-38f33f125f7mr17169149f8f.9.1739965011565;
        Wed, 19 Feb 2025 03:36:51 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:8630:e1af:c2ac:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399600257asm42437905e9.4.2025.02.19.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:36:51 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 19 Feb 2025 12:36:19 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: x1e80100: Apply consistent critical
 thermal shutdown
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250219-x1e80100-thermal-fixes-v1-2-d110e44ac3f9@linaro.org>
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

The firmware configures the TSENS controller with a maximum temperature of
120°C. When reaching that temperature, the hardware automatically triggers
a reset of the entire platform. Some of the thermal zones in x1e80100.dtsi
use a critical trip point of 125°C. It's impossible to reach those.

It's preferable to shut down the system cleanly before reaching the
hardware trip point. Make the critical temperature trip points consistent
by setting all of them to 115°C and apply a consistent hysteresis.
The ACPI tables also specify 115°C as critical shutdown temperature.

Cc: stable@vger.kernel.org
Fixes: 4e915987ff5b ("arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 128 ++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index e349cbf6a2665695b5cc961cf9d53e7182e68e7f..9893fa8353f144e0ee723ab5312cd95aadab041d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8457,8 +8457,8 @@ trip-point0 {
 				};
 
 				aoss0-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -8483,7 +8483,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8509,7 +8509,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8535,7 +8535,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8561,7 +8561,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8587,7 +8587,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8613,7 +8613,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8639,7 +8639,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8665,7 +8665,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8683,8 +8683,8 @@ trip-point0 {
 				};
 
 				cpuss2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -8701,8 +8701,8 @@ trip-point0 {
 				};
 
 				cpuss2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -8719,7 +8719,7 @@ trip-point0 {
 				};
 
 				mem-critical {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -8737,7 +8737,7 @@ trip-point0 {
 				};
 
 				video-critical {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8755,8 +8755,8 @@ trip-point0 {
 				};
 
 				aoss0-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -8781,7 +8781,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8807,7 +8807,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8833,7 +8833,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8859,7 +8859,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8885,7 +8885,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8911,7 +8911,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8937,7 +8937,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8963,7 +8963,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -8981,8 +8981,8 @@ trip-point0 {
 				};
 
 				cpuss2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -8999,8 +8999,8 @@ trip-point0 {
 				};
 
 				cpuss2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9017,8 +9017,8 @@ trip-point0 {
 				};
 
 				aoss0-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9043,7 +9043,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9069,7 +9069,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9095,7 +9095,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9121,7 +9121,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9147,7 +9147,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9173,7 +9173,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9199,7 +9199,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9225,7 +9225,7 @@ trip-point1 {
 				};
 
 				cpu-critical {
-					temperature = <110000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9243,8 +9243,8 @@ trip-point0 {
 				};
 
 				cpuss2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9261,8 +9261,8 @@ trip-point0 {
 				};
 
 				cpuss2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9279,8 +9279,8 @@ trip-point0 {
 				};
 
 				aoss0-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9297,8 +9297,8 @@ trip-point0 {
 				};
 
 				nsp0-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9315,8 +9315,8 @@ trip-point0 {
 				};
 
 				nsp1-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9333,8 +9333,8 @@ trip-point0 {
 				};
 
 				nsp2-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9351,8 +9351,8 @@ trip-point0 {
 				};
 
 				nsp3-critical {
-					temperature = <125000>;
-					hysteresis = <0>;
+					temperature = <115000>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9377,7 +9377,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9403,7 +9403,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9429,7 +9429,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9455,7 +9455,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9481,7 +9481,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9507,7 +9507,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9533,7 +9533,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9559,7 +9559,7 @@ trip-point1 {
 				};
 
 				trip-point2 {
-					temperature = <125000>;
+					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
@@ -9578,7 +9578,7 @@ trip-point0 {
 
 				camera0-critical {
 					temperature = <115000>;
-					hysteresis = <0>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
@@ -9596,7 +9596,7 @@ trip-point0 {
 
 				camera0-critical {
 					temperature = <115000>;
-					hysteresis = <0>;
+					hysteresis = <1000>;
 					type = "critical";
 				};
 			};

-- 
2.47.2


