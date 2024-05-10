Return-Path: <linux-arm-msm+bounces-19699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C86608C2546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B1F1F25DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D60E17164E;
	Fri, 10 May 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLqRh2Zw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D31708A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345931; cv=none; b=S50o6TRe3ri+hWUQ3L2InRrWXCHDxMLILI9YHeg2qqc9hWw3poWKRnAqvfXdgYCOyf1ha2wY4ngnw8vDcjcoQtR0sYrB5FoaVyRIUlfTY73jZawSTKiuaxpk5PtaNb3t3ZiMgYb1HLHoF8BPrXHfyg+9D6C+JRYiOdCT+kuxS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345931; c=relaxed/simple;
	bh=M8G2mN4TaffnfNOqtxWoho4eYoLY7YRmtFMMoVV0Cck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttg7BNHVTNAo1oUo5LOLYP2gNPJRJWgzdFqjF3Ps6V/+ZQPhIOAYEZj0b/p3vQ66LtNgudaeidxWNCcIxbfazb+fS9vqaApmrpDnctDAL6Mi2vCy2ERiIzwqM4igmYV20xVp+g0oy5+OlR8YpJ5kLad4nnCbR38oLmRlAivoy5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLqRh2Zw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59b81d087aso500362266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345928; x=1715950728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REOe2/rSmMpWIuGPFH1QLzss9p7iDlF03Wz1gvDMeLQ=;
        b=wLqRh2Zwo5rAoi6K76+WiC37pSaDINzFaw2m6kbOMtsu5MHXlVqrJcLuo90hzPunNs
         +Rk9dpmda4lGaM2EkLJNQXBgS5GjZ+abmp3l85FPJy1D3mLl+P7W3saMUj/zOiWOR2MB
         5lvgVz5ROxMGhAhF+lILDbjRNTexWSEc2lHkGWrNmKFZx71wqdj6MqXAW3zS8VVrVkA2
         H19z78kgG6cKnm9bUEGmfI2HgxWX5IlFcCEfVUlN6mv48m/7yB9SwMqMKdYEm4tsprOk
         DHOJ6HMEr4lQt3x4HKcf85OxUJRBZ97EDwEnu3tUOrXuFCMsIHvgaBgeK1ARuLA4Kk2w
         Zfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345928; x=1715950728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REOe2/rSmMpWIuGPFH1QLzss9p7iDlF03Wz1gvDMeLQ=;
        b=dTbkZu12IGzmrAjOszETeqMcMzZPRBGxc51Z5bcTEtZRHuSsybw/rcEXE7dFKKVgOn
         pRIXEzKC2ROtsMnlQRwLxqUx7b6u1H+330pOtqoACW5JDzM8+gvhpqxZtePsP+5iE1op
         aICnidJ5CovT9WvcDVOu56YqkVBwqSTAbISXe9ALnnMgf0CfU5yVVPD3n9xJZN5kzUnB
         FprxRXZ0ji16x+NBnotBZ5gLZxduKYwF6AzrCOWjKdnIVKmZ8s/MZP4kLv5ySIYTGZBi
         KOqID2oLbXYLa702OOVR7jf2zG3F5cV5eDrO8gE2r5rG2zHgs0JALjku0sxgVU7HVtby
         bD9g==
X-Gm-Message-State: AOJu0Yz0uwFCl+PviqCI8VVjUXor85Em3Byd83p94K/M3XcICGYFiYsD
	K7A98ppjT8UpLyl5AStXqRbMhN1qK0VBLkphk/Y+/W72NhX93k5pc4zgJDr21kw=
X-Google-Smtp-Source: AGHT+IGmtosNKiZsmXipclDdUMX5B1eUzYiRvXVU4iJIo/8nky814hTE0SkCNKwjjcTbgLPK0VkdqQ==
X-Received: by 2002:a17:906:1992:b0:a5a:15f6:157e with SMTP id a640c23a62f3a-a5a2d53adcamr235180366b.11.1715345928254;
        Fri, 10 May 2024 05:58:48 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:38 +0200
Subject: [PATCH 09/12] arm64: dts: qcom: sm8350: Throttle the GPU when
 overheating
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-9-ababc269a438@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 526d3c92eae8..94782180bce7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4259,10 +4259,22 @@ map0 {
 
 			trips {
 				gpu_top_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
 					temperature = <90000>;
 					hysteresis = <1000>;
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
 
@@ -4280,10 +4292,22 @@ map0 {
 
 			trips {
 				gpu_bottom_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
 					temperature = <90000>;
 					hysteresis = <1000>;
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
 

-- 
2.40.1


