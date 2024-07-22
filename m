Return-Path: <linux-arm-msm+bounces-26724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF734938B26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BDFB1F21770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE297161305;
	Mon, 22 Jul 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PALmCozA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FA140366
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721636746; cv=none; b=rn6Leq/vyfdMstAvL62sxB7GnAV2RwpQsTEybCt3iTcldD4y7T/kMM1rzhZOjLhfy5KJ9M6QFFcfHk6A83X3RGEJwc/75KRg6sjzXXjnJRAAdJ0qV8nBocm5vhOmlRRYalmzAWnpQ1zin0tquYs7/C1zrZ5QWx4Og7pZq9uYZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721636746; c=relaxed/simple;
	bh=bxsO03/71OqQAp+brgVffyBOJjfLj6AVs9v2PK3i3mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFHqBxvRCaI+M58wmjcXP03/J0sAXMCf9Ee0gAsqp/fh2t2GU1xkaNi/IJksUUptklHl1936tc2XtALdpjMZ256k8qvClWIOzlziYYD1rpyJczWTzejOxbjklQhSXxwimev1bbLiDM+xC+EDagzzKUmEms5ZvX5FcqK8xpDL9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PALmCozA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77c2d89af8so411704166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721636743; x=1722241543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XtqEPWiIr5vp/nAZ6HNI8AOL/dWbCPA+lfoLLgou6Hw=;
        b=PALmCozA457llQIqYx6xzePI1U3goyVJT9v16P1cSwUjIjILNzrBRMilHkuOU4n4xB
         eUnlNtkCPJjk12EFJdoaxvpAKYWcya4Tmu/Zt2aQpZ3K4jS3FwJfp0uIoV3wsCUkYzvx
         VlHESa6mBdq0aUkjrAdJAFgI9zZcsNsPmUUXME14a/ZU9FQl7QYvc2hHN210VxHWDTA2
         a8z/AjdWDbgj/IOjWZtxsGHS78NJvXocll+mBeFShfUYWz00gyZdbvNqDA+Cje3+G11F
         0dmWasFD+GhxscbgFDQmDPjXArvWz3XvUP4tR8cKuNwu5cG64XPVKmhFejh9aGCTf9DX
         nHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636743; x=1722241543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtqEPWiIr5vp/nAZ6HNI8AOL/dWbCPA+lfoLLgou6Hw=;
        b=JPlV+18nI7o8LMRVlrg/5MlB0c2uWjK4DXG86AIeFizRLFgyngV0FTuZl031PzPz9M
         q7NdS57lISfCyvk8Iftn9Mc1Bm31VoNlNVxkU1QYyz2pPjfI0qhZhhrkFHBoK3Xo1c3q
         ApiwoFDaf1dHP88dxYiRiH3RQd7R49tjgRi4ewHBCATd+VeMFW84AOSkUEVpGCqx5rEr
         s5gm+LZwZ+1Vh8GuVN/u+msjiUrkKtYpFfp4jQugswFwVmdNYBVRXNpcSBOSxCEEZAgR
         S3VGbX+n8KtTjx812w5R/IxgqAIUSTF92T+HtEt3OL8u6wzLYk8GON/aJhWyvHkTvgg0
         RhKg==
X-Forwarded-Encrypted: i=1; AJvYcCXdi9/pcGx3EIIkRzK8cYWEJqKn/PSc+uxOMUOB4CBiy62TZxzNSLOP+te8wfP85QXxeoXUoOhGf7TNq4KI72xJWmJ46GO392rY1a7lbQ==
X-Gm-Message-State: AOJu0Yy2d/6/qgmk8HN+sLMT8ZiQ8d3fNpekr9r8jR08BFbTFMJxThhs
	OsrmxsaxoYkqPHrFRuPhqHzgrXhO+zMjeamd2fpiG8u2kPbZEkuai56F55zXQvU=
X-Google-Smtp-Source: AGHT+IGKb0DMJLTWAhEF9XWfE2qhv3NGVnXyLBAa4TmYYsM6+WNSBb7kb393XBb48PWxntzfh8uogg==
X-Received: by 2002:a17:907:968e:b0:a72:8d40:52b8 with SMTP id a640c23a62f3a-a7a4bfa38fdmr404781966b.3.1721636742993;
        Mon, 22 Jul 2024 01:25:42 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c7be6f8sm393121666b.76.2024.07.22.01.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:25:42 -0700 (PDT)
Message-ID: <2b078266-c5be-427e-bb82-264ed31094e1@linaro.org>
Date: Mon, 22 Jul 2024 10:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: Add A306A support
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 20240618164303.66615-1-robdclark@gmail.com
References: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
 <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
 <CAGsSOWUoSkDooRx+QUrucj517pBFxwDMiCwoA6tah5o2=q2oGw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAGsSOWUoSkDooRx+QUrucj517pBFxwDMiCwoA6tah5o2=q2oGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.07.2024 11:43 PM, Barnabás Czémán wrote:
> On Sat, Jun 22, 2024 at 1:36 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 20.06.2024 11:52 PM, Barnabás Czémán wrote:
>>> From: Otto Pflüger <otto.pflueger@abscue.de>
>>>
>>> Add support for Adreno 306A GPU what is found in MSM8917 SoC.
>>> This GPU marketing name is Adreno 308.
>>>
>>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>>> [use internal name of the GPU, reword the commit message]
>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Rebase on https://patchwork.freedesktop.org/series/127393/
>>> - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
>>> ---

[...]

>>>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
>>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
>>>  3 files changed, 28 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>>> index 0de8465b6cf0..61aeac5054a2 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>>> @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
>>>               .gmem  = SZ_128K,
>>>               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>               .init  = a3xx_gpu_init,
>>> +     }, {
>>> +             .chip_ids = ADRENO_CHIP_IDS(0x03000620),
>>> +             .family = ADRENO_3XX,
>>> +             .revn  = 308,
>>
>> Double space
> It is similar like other blocks.

Feel free to correct it there as well

[...]

>>>
>>> +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
>>> +{
>>> +     /* a306a marketing name is a308 */
>>
>> "marketing name is a308" could use a (), but it's me being picky..
> /* a306a (marketing name is a308) */ ?

yes

Konrad

