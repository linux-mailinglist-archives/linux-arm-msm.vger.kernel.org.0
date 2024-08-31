Return-Path: <linux-arm-msm+bounces-30344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D8967226
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 16:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E06C1C20EB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 14:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EFE18633;
	Sat, 31 Aug 2024 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gylKU0YA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40410A3D;
	Sat, 31 Aug 2024 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725114426; cv=none; b=YgmDcQH3ef6takCLrYZ+a1UEGlX3H3gOy4RSdhTdMIMu+X86RcV8gd/6F7G1NNgTFP0LzU93tZt+pJVLjkJkEq/tQLD2v+b7BdWQ1PEvzZoNQ+sn5scRGHI2g+DAX1rVZfaSliirXf7Y5Ynr4wT0K4rwVUMmm9kozjf0jQgHWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725114426; c=relaxed/simple;
	bh=e7UMSMNz/YtPpOqFUnb5PqraOGMsG5u8Rx6NEk9c7nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHJudwEOtRtpwblB9OC6MH8L2XP6BRwF8BR0ojzDIw2VqiNnck2dSSI0pOahlpm7wcoRYSBDiaX1ia2FoCY08t/Shh7qxZaTm1XbULPeq5GI9nFj/uUsrVtgx1Y4IBhd5VrZDHveWYJCFtNiRdd9eNj42sULqEVqdLGfiYkR4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gylKU0YA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso25147761fa.3;
        Sat, 31 Aug 2024 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725114423; x=1725719223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClDDUTpR8t6DPG6KoXyNnf/qGLBhLmE/UmuhkywqIpw=;
        b=gylKU0YAxG/V7Sm2Nr9oX21QkWmz656/SMXq93gNGYqsxwy8+gWREjPAl+QUndjpM7
         SLbJ+xU+P889nWBCuz1oRtDgDb7UtblflDdoSEaX0uf2Wh2gXErbASftqUNAFm7mZOCF
         kf4ENiPovYlb8yj957umQ+CrTCLuTos9e26YlMxzFgu0ed0GyHKcwXD6zOxu+s/UKFTK
         hdWellnsW4pDiiNPz2sUdo5V/1+9eZfoiRl070IZtBZQlUmB+WMxs/0aLXoY9fxEz9Yq
         pdHgJ4hP4ma99/w9WhieWq0dvaGHT9lnHYCmpmgmB69IXNgJD26DhmF0ucqlFc07a4gQ
         Rd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725114423; x=1725719223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClDDUTpR8t6DPG6KoXyNnf/qGLBhLmE/UmuhkywqIpw=;
        b=sAvve2EtbIplOJijO9Ug0D0gKqKu0zete97TQF0IdDYIXoWcm2wCgfhwtJlCcv9vt+
         KVFaQe4tRwaWDnPlnuHx1XY+dAjPI30zXwZbUVteDzNdbEyZU5BzrhnLpVxWCNHd5DBg
         ut++h/konzUfvAMg+igtdOrjCE/2qnIeSquAOaerzjWR9Jt5+ALfDsaJ9p8RcyyspBLQ
         lfo6+azQvNLg8KsJsS1ZpWIyhCFGMLGpavqiu05yfLAoNhz6GRvL7LU0hVj0Gnk+eOJe
         g1TWfKnCEn+oaI39mm5KJdCzkHhgj3HY4TIAWLI3+1heZOdV0Np2OD+DL+W1b44S/YhK
         ShFw==
X-Forwarded-Encrypted: i=1; AJvYcCWWH3MGu4QVEQ3Dv0XrJELMUAxWKKJL4vRAt02X9fA9zpfgE+eWOX+9vQBhmumXpbtr70Jd3665FpCqb+Q5@vger.kernel.org, AJvYcCXUH//ywQO66iPAx5PW+B5ab7PEixavVZ6l2e8PEnr/MuzMpeFxHmI3yBU3kFu33R/D537ZdJ3y32Ozo0mv@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkXc8O15MGxZpzBjStymASQMRTlNJajAW/jNu/SAGWOGatCFK
	W25WVTj1whSVk+UFCoHD3NTJBRtRgQ/Q3Ensl6vsmDkbPavt8ZDlQ2H5o8Lp
X-Google-Smtp-Source: AGHT+IG0soZ5n4oimLQY1Jh8mnsJcHcxLpHeW/bofHdniT0E1XHiLWLlJ9NcFIp6//datiepOAkLFQ==
X-Received: by 2002:a05:6512:124f:b0:530:e228:779c with SMTP id 2adb3069b0e04-53546b04212mr3837461e87.19.1725114421834;
        Sat, 31 Aug 2024 07:27:01 -0700 (PDT)
Received: from [192.168.1.17] (host-79-46-163-127.retail.telecomitalia.it. [79.46.163.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196751sm330525766b.121.2024.08.31.07.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 07:27:00 -0700 (PDT)
Message-ID: <8537f53c-3898-4fa0-8376-de789d5c3ba3@gmail.com>
Date: Sat, 31 Aug 2024 16:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX
 targets
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
 <CAF6AEGuwtgzOZtDKPq+dna-mvv2M193Neow_7ZprxrLV+hf+FA@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGuwtgzOZtDKPq+dna-mvv2M193Neow_7ZprxrLV+hf+FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/30/24 10:25 PM, Rob Clark wrote:
> On Fri, Aug 30, 2024 at 8:33 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> This patch implements preemption feature for A6xx targets, this allows
>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>> hardware as such supports multiple levels of preemption granularities,
>> ranging from coarse grained(ringbuffer level) to a more fine grained
>> such as draw-call level or a bin boundary level preemption. This patch
>> enables the basic preemption level, with more fine grained preemption
>> support to follow.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> ---
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>>   5 files changed, 921 insertions(+), 9 deletions(-)
>>
> 
> [snip]
> 
>> @@ -784,6 +1062,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                  msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>>          }
>>
>> +       a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
>> +                                                        MSM_BO_WC  | MSM_BO_MAP_PRIV,
>> +                                                        gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
>> +                                                        &a6xx_gpu->pwrup_reglist_iova);
> 
> I guess this could also be MSM_BO_GPU_READONLY?
> 
> BR,
> -R

Besides containing the the actual reglist this buffer also contains the 
`cpu_gpu_lock` structure which is written by the SQE so adding the 
`MSM_BO_GPU_READONLY` flag would cause it to fault.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


