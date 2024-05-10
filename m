Return-Path: <linux-arm-msm+bounces-19692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5D8C252E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95EE81C223AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732F912C494;
	Fri, 10 May 2024 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmHre4/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B9127E15
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345922; cv=none; b=WUHGWhT4Ug9bK7PXQ8ppfqCsQRXpO07ClBfh8Czkz6oEnroAwQPdTuRxfM8ouGKefpp78n/jnA1crHQhAXskzCMgnZBmzSa3tm8sNu9/v9/9sB+S4nMBvTSvlxqStA2rgMyn9bZL6YEI0owtXNGCmR9kvpJojk5DU77QxV9XHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345922; c=relaxed/simple;
	bh=U1sZM6crvXzNr36TY4xzkTtToIbdblQozjw2mMpBGo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUUkmmiVo0P8/eElnEaFMVUxilHcMO44+ppYiO4pqepa2bHvIVC+9McMKwtHCysFTAosP8JT7MzZ+b956wjRH6EiUeiNn2dTil+FfBb03+q3ZByg/7V1cqR7jVGuta/P9iK6iIQDHmbm0ioOpvhAoP+AHtzFYjwRj7QSJOUhrig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmHre4/r; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59cdf7cd78so512055866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345918; x=1715950718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UviVANTDt/5uiKFqzI1mLhTEEii7CuMYYu8FBGQXpBM=;
        b=BmHre4/rsGV/BTj4++sBLtAHnj/KrXw2W3dk2k7Mm/KRWb9lJjgmCwcAbCWLIUy30G
         kdZovKYJCcYtiQnxEmMJGiHQXVDQVBYZZMJY0942YAJdxXnEHEinjrAAgwttt3SFgPD4
         yXGhBx65lJ7p8ZlGkbEfGPVO62JXbm5v4xXZG+fKRpL3frA9qVeepcWhp0QhvNnhzx/j
         13WgDseb+v+TV4GjUGJxWR5jZqPIGhtib4rqqlW6Op7zaWSlUjMT1ap5AQ6JKNVAoOuK
         bKzgTszggMcMajFaEVLMyYmRPA3MXhTzOFD2wYfSodSbu5Q+tTSqY0kk30+mnxigyM96
         Ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345918; x=1715950718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UviVANTDt/5uiKFqzI1mLhTEEii7CuMYYu8FBGQXpBM=;
        b=ELp6j3TGYqMF4E+qEC7ipx9bl/k15mUSTYUuoxEdLYzSwKA/2Am98sVLq+eT5oxu3b
         CtNgjDEGxrHhB/P8JADK1PBgo+Pyx6i+M+ySEhTo8ak+8qdA34+OvHnpgtuSv/LC8n1u
         1YMmQKU/HU8hsKqO3hi2isu0Z2EUqGgPs0O1xM7Icbs1CcA+A7cOEO8AkIWXuBsK1fyq
         qxM3AP8amgi062GHoac5O7UcASV6sb1z65r3GNZTEiyntgHxSMX9a7eAQFW+ls+LRqYS
         AFgpr3LJGSgO2ht5bWqBR+Rq6FpM+Fz8v3N2GMc3KLA2KgLpitUzzC2xajcOMUr+kGiS
         i/aA==
X-Gm-Message-State: AOJu0YwOpcSucOAXEK8IuKFLKsHY0+KyadIXmZJYyVApmVPl60z4rRVv
	uGO25dGRS+G4orVxNdtCD4tFgvd4Its4wiXT85iSdqWfJvrWiMof02CCTI0jqH8=
X-Google-Smtp-Source: AGHT+IFftFdwrJV56gfgsr34xjkjx+Jjl7MXGjKOYrjcpGmW0lfjcSGDIRBYjrCWQu4RRSyGcWCE6Q==
X-Received: by 2002:a17:906:194a:b0:a59:9b75:b90 with SMTP id a640c23a62f3a-a5a2d53ad53mr177181566b.2.1715345918269;
        Fri, 10 May 2024 05:58:38 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:31 +0200
Subject: [PATCH 02/12] arm64: dts: qcom: sc8280xp: Throttle the GPU when
 overheating
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-2-ababc269a438@linaro.org>
References: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
In-Reply-To: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Add an 85C passive trip point with 1C of hysteresis to ensure the
thermal framework takes sufficient action to prevent reaching junction
temperature. Also, add passive polling to ensure more than one
temperature change event is recorded.

Fixes: 014bbc990e27 ("arm64: dts: qcom: sc8280xp: Introduce additional tsens instances")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index f63951186a5b..65c444cce00c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5956,10 +5956,25 @@ cpu-crit {
 		};
 
 		gpu-thermal {
+			polling-delay-passive = <250>;
+
 			thermal-sensors = <&tsens2 2>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				gpu-crit {
+				gpu_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				trip-point1 {
 					temperature = <110000>;
 					hysteresis = <1000>;
 					type = "critical";

-- 
2.40.1


