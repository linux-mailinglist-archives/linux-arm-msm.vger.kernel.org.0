Return-Path: <linux-arm-msm+bounces-19691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 231D58C252C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0CA285AE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A36E12C472;
	Fri, 10 May 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gq2yq+Ns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C10127B77
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345921; cv=none; b=ANOPnInO076lIGKJfydh6d9bH6XfNSNon9XqBGGv/ryQEH3FwT5x2qu5qwGxj1Gmg3vZ27R0XTdIzSBPvRy6MWOp8WIp1m+YIxYKoeo35DPqX09yEZkD0fqBdT6yz/UOPgB8JshzTynbS/eqs0mC3JXfH6mX7us8CNyOBuSOCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345921; c=relaxed/simple;
	bh=+hBO09VnCHm9VUUEnYGXn9/ohn2w2P5q3w4yWPS3JP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcd5xjp+GyoJKNxRZoMCfHA5JU6cVBs3KQc7os5mTVS70IVPg/NrS+ks9oleDLsDIYnIcRThPrNKKvCrLCHysGEUIKQLk0UEjycKnIl8MEDiJW4mQ1+bGyREH+cS72ycgwk4CfLrgjYEn9Oy/s8H9XASCRpMnZK3RQzLbL/Xk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gq2yq+Ns; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b097b202so467297866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345917; x=1715950717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtTo5y6kM/M1KKRuZY68F19Ec5TCfP5qx4+TJLYsHpE=;
        b=Gq2yq+Ns76zT+lvSfvzr8HzDCMrZTvMZJNNLIu/v58TW6KViKou9cXnjEXurnUpnq7
         OdAJv6i9HMzKQrpmvzrjSn//uPnMDO7ZpL7F3iA4T/+DTTZDR4qJU8Py9LY9o/M61gwK
         o2z7ctgHiUWY+pg50rdNWK70mvp59D6cuqWYeA08Tf+OlLOW/mrTiR5J26myBzEMEsZL
         C/kp4qyVsdgdV9j4TpuFzOesiRKKdarlExvqw+r23EA+l0SVIInsu7qXJKofQjT57asY
         Uiaalrw3o1eGkfKQJLs/ZZAcgr6HAaQsePqVUhSAMgySj1sDcvajd6w7MhiaklZojZEz
         8B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345917; x=1715950717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtTo5y6kM/M1KKRuZY68F19Ec5TCfP5qx4+TJLYsHpE=;
        b=QIC1VXDk2OzY+eBzEI/KM6Oa2PnMSgRhohNDkVdcqzRulGeRWUe7B2oMed62jOh8AN
         5MPS2TZburCUmhDHJHIwcZiBhn1M4R8Vy8/4jWj7QRRbY2SDC9/0Qe2nGVYdMvpAlPtp
         K8mU/wqJ9Bc9t92rTspAAUHm4rxJqhlQSvNpW+Fa9Y7iRHzQDDNQZYd4Fm3ZEbyfS4um
         QdU8HrrBkqw64jgbzOlnYs+okYoDgWvVtpzgCIR6IZUEF2kLjia4e3N16BUPbwQ5GF5e
         D7hkuZ1HhGhwGnYi0WuZ85DkvrBeUey45pPtjYmBquDRDeoj9qejl7C3zFf87xf83mYB
         pLDw==
X-Gm-Message-State: AOJu0Yw+Pg1mhZxKh38AlfHlcO6Xn8rk0kY1sOKWgwF5/ruh5454GhNC
	Azetuxlpb+9aKIxpTkCvXYWUvf3k73Dq1rfWYAZqcQOEbDEEzfFwwKR0TgEH2+A=
X-Google-Smtp-Source: AGHT+IEEqYn9/tuFqFQ1H1nKhLJKHexkeLgg3g5zX7HsfbpiPvw3TUSny57aso1INzM/xI8+sDhsmg==
X-Received: by 2002:a17:907:7b8a:b0:a59:9b8e:aa61 with SMTP id a640c23a62f3a-a5a2d5c9303mr195736266b.35.1715345916998;
        Fri, 10 May 2024 05:58:36 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:36 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:30 +0200
Subject: [PATCH 01/12] arm64: dts: qcom: sc8180x: Throttle the GPU when
 overheating
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-1-ababc269a438@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index aedf2e7db038..699f377e94d3 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3993,10 +3993,22 @@ map0 {
 
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
 
@@ -4140,10 +4152,22 @@ map0 {
 
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


