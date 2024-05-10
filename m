Return-Path: <linux-arm-msm+bounces-19693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 564258C2530
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E0921F25DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129B112C54B;
	Fri, 10 May 2024 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvrJTpeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C54128377
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345923; cv=none; b=efSZ0woXbfmXRs6EtMjHh0lwFP6aIOLrdVGSVeMUPA7y2NmXcDym1RP0KpsURD02KoDGYNzfeYezxvrYw6uap1tij7NdIlnOjjFjzrK7whsiz7Ri8W+dgMF0goaSuMvvJVn/Zxexh8HKyyzppXK41LAMKh6gUx+3GSJEmrhkC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345923; c=relaxed/simple;
	bh=xVhNv64UVnKsgiv5jGfQjveKNiXOY36HNZeDOAduTEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sttwVY5I82h19dbxJLTnCUSrtDcPqy/z6sLO07kmV95hqQ9Cd+W5s+dxc/rz8m7sZM1S6IKbS08jtew7WMbJH0UANpTs/SGqTMEUQQ3dC/w2wEp3j9X5Xr8g71Dhu1M2R3jKE08zC8caA8LKSGzbTs7OXFBceHM4fxzhMbDA7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvrJTpeL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59cdd185b9so549622866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345920; x=1715950720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omxBI0Bjh6xff6OPmVoFkepIHS+IMVrSRXQYKvKXjaE=;
        b=PvrJTpeLluf8xx3uvHv7x8bFwliFB6K8br4b/Wcq3idr+9eE97IMZV0PbJ7YPnJ2rH
         IRMzHRova5OCXDTbCQvdD799/qmqnzeWMLQBsalNSTrMthirsukdw65Z8PdZeTRIVsE0
         lDqOILK9irljJpG+YqCyFPc2RMI7TWwsXq1wgVk0SqQW71qsZs/khMaJAKdbipdZoSmX
         eptQmexRKtP5PzHO5w6LFa/hqqLRagwkDuv6S3c0CM+YYkKZDiljvdGSglNS+jLXqiW1
         mu2sgU4QQhJGCN2Lye7FkyorLU6Y3pcAAMGjIU+cqKi8P1ZZMgDYrLl2zXqAQHWxLhyU
         Pwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345920; x=1715950720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omxBI0Bjh6xff6OPmVoFkepIHS+IMVrSRXQYKvKXjaE=;
        b=ZKLO2nIupDmjO4ybS7NZnsh2lLgx4kZ1ph1/r2DsDVqs3Vm5jrC33uP+zcjbfL7maz
         8oN1/u5RBV1ly9q1mWSZIyeO0H0tndaDz+3TsLUlebvn50SOJMLqWjCrj3/oRC05pGLP
         67KDNbh9TGGDeTDZKSdBq8Sd8RRLi0k++SH741xOGHediEmNewYIrA7DElCLxAn2rjn0
         lRG0igz5KZkdlucUnzZ55qUGd6GPhkfbrlmSrhmoJcBYOI5NLgAUD4qq578Oj1tuX/ZV
         QiGi2ZuVpcm6v0yw3/3gUcbfzXU3pC/Cux6K14XpO48xKNDZnX/hk0t39upw0qsfwkYz
         3Lqw==
X-Gm-Message-State: AOJu0YxVOJiN5uOsOnJ8meSZdLgsyT7ARYLEDhp0RaS2zucpJyMvNeMZ
	iLClcnMzlPE5c4+8Gc29kkzVKkuLJgbIa1MZ9+PkNQQItCAAzlXqOOJGBi75pxQ=
X-Google-Smtp-Source: AGHT+IGBZ81PpSvhLXWY35xj34kyxu+JRHRYjscx0vV2EGlV3rjYr9X26CLoLN8bvTWU6iwx3PT1bw==
X-Received: by 2002:a17:906:f116:b0:a59:9a42:b7de with SMTP id a640c23a62f3a-a5a2d31702emr209323766b.36.1715345919812;
        Fri, 10 May 2024 05:58:39 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:32 +0200
Subject: [PATCH 03/12] arm64: dts: qcom: sdm630: Throttle the GPU when
 overheating
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-3-ababc269a438@linaro.org>
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
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 7702d42e82c1..a46dbe725e54 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2582,10 +2582,22 @@ map0 {
 
 			trips {
 				gpu_alert0: trip-point0 {
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
 	};

-- 
2.40.1


