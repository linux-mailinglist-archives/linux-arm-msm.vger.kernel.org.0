Return-Path: <linux-arm-msm+bounces-23699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B144D91338F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 13:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D4328419F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 11:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1192E1509AE;
	Sat, 22 Jun 2024 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jn00uT9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565B14D6F1
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719057029; cv=none; b=P1CpbHyyPTeDcP7OWgFFYGldaFN1BBO1qOv+p9CvX+7c7tXJVaxZtCmiGLix2PnRmlQzj/HwSgpmN4Pbb5bB7H3t3UhDfx8qjEN5ix7OdL7gp9mEzsyHGhpKS+sQPi9vZCBQUDX/Ii7Ier0N3Ro1dlx3RjCEVDCNzS/QVF0OfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719057029; c=relaxed/simple;
	bh=LIz1YPh5GSbK0//aRT8UWL0Kb/niXcmn42YGtXbV3XQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=crI8DaeMbdo3aoptOMLgWRJrr9FNqTUqOMq01OYMFrC18Hr0MiEAm3Q0Hqe6AF2GfM7xU5NRb6bBDWw7mNySxeZqKpGpnVV2EdbnIoT8/a/1mhh467bp84HD4mPszVTUg4svzYRPQ1KKX0gZE+L2kumsWULr8+JWlBZFZ5gOHkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jn00uT9I; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6efae34c83so318255466b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719057026; x=1719661826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KzdEHh0dB/nV7vgLtfc8+hl5vcizG4wktTh23yM32QI=;
        b=jn00uT9ISao0h6YeNX/8HXGpkKZu5QugoMWcLAqsj1BoSDljMDZ6R5FXw7RJ+zGi1D
         4b+PK0CffT0YN66HcsToQA6rgq/0dCLnqknue97kMts5sFP7KqesBaxHbFh0QaMX3D2R
         u0gSEsD7urEp56fOM1+V/QFGg7LLeAZ7AgMqVGGJ6zJZ7vplFmtPVVgpM/2aFCmetxAu
         /fYerF4XyKCWZ2SfYH/q+7FdVd+S2B13z423p1pSnfyggf0qNqbxzQzLffHECPWdrizu
         LAhyK9C/KQDsDlP+DiYx30XtzL2+fQiGC4R9w6frRjEjo0nkVb7FuZgyOxtCBKZe8gVp
         V2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057026; x=1719661826;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzdEHh0dB/nV7vgLtfc8+hl5vcizG4wktTh23yM32QI=;
        b=oCNg7E+/sYXUiZ0hqeYC40SSijSbUuinAvJj4E+g/cA6CRKr3GHM61plLLesSNsHht
         fHLNKfGWjIuxJRhRhKKqxz29c1liepSf8GF2Fp1o12a9PFGU1721dmQ/XnUDyadOjeqC
         vuES5Hsm/vGDN7iW8A7hFs6E9VdS9z7Q7Vt9vDnpVUfR5pxOLkyR8BarmYqOkeoBJTo4
         XjaHaQheJT9K/QrJ6tCg612G7zdj0b2PlrXh0fvBa9L17YgmPvRCy7kkt/H5ov4/Ztrv
         afe3g8/D/uNpJWMhRAQx3laK3IyCKOM7C7m1atXueczdQR/SWEgXI+1M1T/vEA4jfOBD
         u3ng==
X-Gm-Message-State: AOJu0Yw+/tSSSs6+VrcbQqqcVi8p/LMj9c6zU+3dYK8lkLpzLC5KXzXT
	raZdq+XNT1qu7owdisnsIMYD5TJCed3aj3Xa5/rHSRfG5TtT9dIkys/riLiWlz8=
X-Google-Smtp-Source: AGHT+IFq2RyjewhG08NQkSNuiG4OKvvqngvXK+P4M2fWPNqP6vDMJeiI1UJQ0pAupu6eDLx/+Vvdnw==
X-Received: by 2002:a17:907:a0d5:b0:a6f:bd27:3f13 with SMTP id a640c23a62f3a-a6fbd273fccmr556874866b.34.1719057025605;
        Sat, 22 Jun 2024 04:50:25 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf486811sm188386366b.51.2024.06.22.04.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:50:25 -0700 (PDT)
Message-ID: <1ea4dd97-be3e-4331-b3a2-649f7729e461@linaro.org>
Date: Sat, 22 Jun 2024 13:50:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: Add A306A support
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 20240618164303.66615-1-robdclark@gmail.com
References: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
 <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.06.2024 1:36 PM, Konrad Dybcio wrote:
> On 20.06.2024 11:52 PM, Barnabás Czémán wrote:
>> From: Otto Pflüger <otto.pflueger@abscue.de>
>>
>> Add support for Adreno 306A GPU what is found in MSM8917 SoC.
>> This GPU marketing name is Adreno 308.
>>
>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>> [use internal name of the GPU, reword the commit message]
>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>> ---
>> Changes in v2:
>> - Rebase on https://patchwork.freedesktop.org/series/127393/
>> - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
>> ---
>>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
>>  3 files changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>> index 0de8465b6cf0..61aeac5054a2 100644
>> --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>> @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
>>  		.gmem  = SZ_128K,
>>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>  		.init  = a3xx_gpu_init,
>> +	}, {
>> +		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
>> +		.family = ADRENO_3XX,
>> +		.revn  = 308,
> 
> Double space

Also I suppose this could be dropped ([1])

Konrad

[1] https://lore.kernel.org/linux-arm-msm/CAF6AEGuHSG0t6CH=+JGzZqiZa_JsOgPkcgO_UhCbO3vAgFZK_g@mail.gmail.com/

