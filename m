Return-Path: <linux-arm-msm+bounces-88590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D6D13D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 16:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AC49301C3BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 15:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154173612F2;
	Mon, 12 Jan 2026 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXsIKePI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1936166A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232631; cv=none; b=Zu8N+IrXU7256DjWZUPpQnZ75PttFM1RqyQngsvXiR+c8lsKAz1kye4gPEsQ7IniUHVRrfOldglTfndn0a+7IR66ruIA5HV4ZvqDQhpW3857k7xqLDx5dAoULCPbZ2VQrutC9HIdGfRHi3I6nXUROCqgE2KY+zbADEeY+jLSBU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232631; c=relaxed/simple;
	bh=bDOKb4bt6pQUBoxgz/5fJcKrJ6eRISq2KUdu/jMV3n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COSW0pze+f+eFdhTFvQHc71L5Hf4UH9iwett+zoZ8xo71NCjVTCGyyKB5AqCdiLs9nhuxrjMrPBcs9q+CjwgnWTxoX23HCItHhndOecL+rVyP/38xQ76+4WNtm2H51bkdbdZoLT2sKY9Nbz/oRxM4eQlHKIS9nGb1rCVP8Vsmb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXsIKePI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d256c2e6so3209357f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768232627; x=1768837427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfITgAVylD2bxVCFRISaE2whe/NjaF4IpuobYf1dsMQ=;
        b=QXsIKePIN89K1ES1G3MQqDelrmG0Vh6AYWLKFbLnvHPGPCDOIM80XaHh047YtptK7b
         CV2MUU/ITMmVWnB4VmxUmsqqhBbR57pUaxogaewiqsycalOB16smaygLU2+uvR2zFBfG
         rlYXIXIRL3SwkTW62Sc9xevA9S5hboZl4AIxulj2BOC/Aa4wmCLbSoD4EEUi0pA/gSIv
         YNcCJIloh4ibr0Ipf+DA9jgqYhv1OiIqb65QHXAdQtC0wiSDtMnrhvGhZ2OMP9kX+lAI
         +6vu27A3PMefrQZBW1qQBGpDALlcG0+MWaA03kwayfFPRlDKGrFajKGcNo5/R/os13YH
         KrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232627; x=1768837427;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfITgAVylD2bxVCFRISaE2whe/NjaF4IpuobYf1dsMQ=;
        b=L5XId6dEdRZ8lRhrcro3CMOTrCQIGQ7VlVen92MZw2Pb5RbYl9VV7HjY4qCcpfRomo
         EVMpsH8ycRq+T76PUsJxzJPodxe7Zo+vEbBDHBckU4TblPt19XYYfHTr7rrv3T0/KSg/
         j6k9TPCkuZdNVLDioi5cNUQt6+Nql0AMyev1+MuXNyyOsnf0u/b1EnbslEHvlLBpHe/V
         THKQWGWH1y3erbhl1y+0SUe80bD0FuC+rJoqkHr8bTr15IutmeBpxt6ux+ZY2ZX3eBLn
         5chVNX0YQO5qfQPSYL49rCl6KanQYAWypqH03dDLMxYtLF6ftGX2CIa0bUJA5DrXJxPA
         vRWw==
X-Forwarded-Encrypted: i=1; AJvYcCV5CKf51nZBVU7wPHwhO8MLJilEUYWJEpmETXchW+Ol5ir2AQMiOQr5MdPowWtKRbfxV2mO7T4Uj5sEXeU+@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRTgMgPs70Tzpbny+bfxTRaXFFXhWAK1QhZ2seuGwe+N4HiG6
	1hc+FhUOi6IzeltLh+sBwxSUuYo3BQr9qI25m8sH4CYNB6TNiAGFnIJysg6/2pJTV3k=
X-Gm-Gg: AY/fxX5BkRueaUbkchHpWB/aB9JHitw0O+WWj1xfh4f5p4w6mlyUKGk85OnjehSNkq5
	XXdicuovFEuLCcQjBXOkHVrur4jT4HbEoqlcEHStTFkhx5VSZmVWluGQuC2hUjsIOtk9wd+8o+a
	qnOsd/7rrngThb6nmeg0wd7DGmgd3dSowG0Hzx48GnNw6DzJDzrp6gDpdmS0cCVaUoTL1/27UwP
	v6HDagwJkXh9SYdN+LOaxweL1lZH9e5QXRmrp7LQhb76Dd60zlSJDSOwLbgsdOkUf6q3L8ye+pB
	A1YOF/6a//3InFLVwOST498gJzzuVHoqEUU7xn0lDQpydBER7+htDMHNFPXPHgCuQF2Kx1BT4c6
	5fA0r+rQEEDG9zE6hD/r7EpSRlchYn/v+lUJeNxzv52RlPYMnhibiT+7HyAwuW3CIjHXRl1bQrX
	mS6OAvpH3xaIDLDmcp51qp5f9NrfWTcLuxbZHbOKXd080hdiEdCbbk
X-Google-Smtp-Source: AGHT+IHkTHCS0yDczJqxEufBpsoO4n9Qx7B7U8QsQlmoG/9TL0Rz3x550kM7xKtoXN1SA4fkUD3sXA==
X-Received: by 2002:a05:6000:24c1:b0:431:266:d14d with SMTP id ffacd0b85a97d-432c379f21dmr22844140f8f.47.1768232626951;
        Mon, 12 Jan 2026 07:43:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm38525693f8f.28.2026.01.12.07.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 07:43:46 -0800 (PST)
Message-ID: <250743e3-66d8-4a39-a487-947ae1c831b8@linaro.org>
Date: Mon, 12 Jan 2026 15:43:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
 <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/12/2025 09:19, Wenmeng Liu wrote:
> Add support for TPG found on LeMans, Monaco, Hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  16 ++
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 ++
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
>   5 files changed, 418 insertions(+)
This is causing a regression on Hamoa.

Did you check the camera itself still streams ? For me, camera streaming 
breaks when this patch is applied.

Please look into this.

➞  git bisect good 
  
                 [git:60c1b50b1f2f5] ✖
9d1d90cca34ca66617ade951d42c94d5f086717f is the first bad commit
commit 9d1d90cca34ca66617ade951d42c94d5f086717f
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date:   Fri Dec 26 17:19:12 2025 +0800

     media: qcom: camss: tpg: Add TPG support for multiple targets

     Add support for TPG found on LeMans, Monaco, Hamoa.

     Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

  drivers/media/platform/qcom/camss/Makefile          |   1 +
  drivers/media/platform/qcom/camss/camss-csid-680.c  |  16 ++++++++
  drivers/media/platform/qcom/camss/camss-csid-gen3.c |  16 ++++++++
  drivers/media/platform/qcom/camss/camss-tpg-gen1.c  | 257 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/media/platform/qcom/camss/camss.c           | 128 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  5 files changed, 418 insertions(+)
  create mode 100644 drivers/media/platform/qcom/camss/camss-tpg-gen1.c

➞  git bisect log 
  
                 [git:60c1b50b1f2f5] ✖
git bisect start
# status: waiting for both good and bad commits
# bad: [2ae8c3645005e9115f39e8aa61dea9ea48cc356e] media: qcom: camss: 
add support for SM6150 camss

git bisect bad 2ae8c3645005e9115f39e8aa61dea9ea48cc356e
# status: waiting for good commit(s), bad commit known
# good: [f89c11002f67740aaed818137d513d6c3dbc348a] dt-bindings: media: 
qcom,x1e80100-camss: Add missing regs, clocks, iommus

git bisect good f89c11002f67740aaed818137d513d6c3dbc348a
# good: [18f74c5866cb470123eb0b39cf3248a09fab3ef9] media: qcom: camss: 
Add common TPG support

git bisect good 18f74c5866cb470123eb0b39cf3248a09fab3ef9
# bad: [9aaf62e09bb1bb17c186addc49984343623df50e] media: qcom: camss: 
csid-340: Fix unused variables

git bisect bad 9aaf62e09bb1bb17c186addc49984343623df50e
# bad: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: qcom: camss: 
tpg: Add TPG support for multiple targets

git bisect bad 9d1d90cca34ca66617ade951d42c94d5f086717f
# good: [60c1b50b1f2f5466c07aeb4148df25227b5f6d55] media: qcom: camss: 
Add link support for TPG

git bisect good 60c1b50b1f2f5466c07aeb4148df25227b5f6d55
# first bad commit: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: 
qcom: camss: tpg: Add TPG support for multiple targets

---
bod

