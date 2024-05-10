Return-Path: <linux-arm-msm+bounces-19697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C38C253F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9832B1C2235D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942D3170897;
	Fri, 10 May 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9eMkWgt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488AA16F0DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345929; cv=none; b=QSQPZmZOLvdjmLbGgmAGTdAkyfBdhJ5WXOpVvtcmKS1FuwAvaWEFUDwQND0oSAFVOg7Rk8JcW1vas4e7kL4wERLB8hRARAcECnsZT2nXqY4kHRRYrAGdOql1qyT9JvZv1tuJLJr1J3FwAiOy6hoiyqc1hakqodFbBkzfIhdKGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345929; c=relaxed/simple;
	bh=N7Z1UTqSXat0Px8O9Bf8HVTVlZ48y7r+JK1PVbiHrJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWiHGpT+17Kebst97mjQ9kBpJ7gxzAUuVNyMpYSF1hy2GV5jV+yVj8k45mVVL07eT//08PqfvEvlSCIKgx8awX4ub5OVNdFrN3YC+ai9lMP+nnI5U79z0u68+2Lo4yVHbr6bIR6Hvpv2qUHEhoJ//+FyDactjSQWHvbII+jhe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9eMkWgt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so443821766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345926; x=1715950726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kvJ0NjI9lgZVfze2m0LNfaiMKZki2itDXIFFMMddwA=;
        b=d9eMkWgtaoLPS6D8rTcxMY2AykfIJ2xWB6ndeQ/srWHyVgzmO3oNdQljJOfdL7uPZy
         RkylE7JqD4Z/gFS3AixhvLxpRSE6gs26gPdFyKb6djl+Oz2V7T1eWlUxMCpGYluRcNgQ
         Q8IFtiYXsM8kLwlmKbKwnW4ihyXr9vbwL8DDXcSgvGxhx5iqLLmxRAi3yzEY8uv4m7D9
         bvZo1LfD9VyRg4QLJXuvmX1Pt7Q4anR0LkpY4F2HZHg9b2Qa+mLrjva1Q+qoWS0BuSm4
         fvDcP+FRErRyUXvet91/dGDcjymLrcNloclZc16vJxigbCkANHKwUP9GBwMwG4Ifz0Em
         iluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345926; x=1715950726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kvJ0NjI9lgZVfze2m0LNfaiMKZki2itDXIFFMMddwA=;
        b=cIf9d1yoQUzvutik0kxB/x2t4ZWxmcn40AwsOJ9cIDgRDb77rd3dIYxvIMvq8NWenB
         4gI4WVnvuBGXzv7SGDnLQxlPA5S8yAlMfTsRS8Cx4e9tijuzB0kYsm/4JLtAsJD5cFOe
         8VA+lqrSBSvDIKOw8wyquOMhkjjDiWZ/We/cQc1YBsygQx07dagtUCQ5JFz6sdBI5lOd
         /Zf3Aul+hhl1eEBLJahrDSIsQLG/v2c12oUhmYv5DwWp7ihrRQZYsm7aRK4oyPsQGwbA
         6f6JC+B5QmpSxg083xM5aY8gjpC4fLNa1C8rT6Wf/8wfkL1/Lz63UJk8TxAADVJ/ZDEJ
         fvBg==
X-Gm-Message-State: AOJu0Yz2PqfwoVwbhpANLo9l+jjz5/Hqz5vuc8qrPJhvrpYSIosrr/dK
	N3Amf6Fa0Y9MZZa3TDH3+aNMDdVJtTEv96KfpaZA/LAyqeNU7VyXtsL0u4foviU=
X-Google-Smtp-Source: AGHT+IGalolyTJ0z7eOceIS7ntIwx3MY/OTBAactA6M5X3a/KbMMqJ+6bB9q1BJKjSHRmADdQNoQBA==
X-Received: by 2002:a17:906:1992:b0:a5a:15f6:157e with SMTP id a640c23a62f3a-a5a2d53adcamr235167766b.11.1715345925757;
        Fri, 10 May 2024 05:58:45 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:36 +0200
Subject: [PATCH 07/12] arm64: dts: qcom: sm8150: Throttle the GPU when
 overheating
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-7-ababc269a438@linaro.org>
References: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
In-Reply-To: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Add an 85C passive trip point to ensure the thermal framework takes
sufficient action to prevent reaching junction temperature and a
110C critical point to help avoid hw damage.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 1f597f03107b..8e9194051283 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -5157,10 +5157,22 @@ map0 {
 
 			trips {
 				gpu_top_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
 					temperature = <90000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
+
+				trip-point2 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -5332,10 +5344,22 @@ map0 {
 
 			trips {
 				gpu_bottom_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
 					temperature = <90000>;
-					hysteresis = <2000>;
+					hysteresis = <1000>;
 					type = "hot";
 				};
+
+				trip-point2 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
 			};
 		};
 	};

-- 
2.40.1


