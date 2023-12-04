Return-Path: <linux-arm-msm+bounces-3232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD680317C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FFBEB207E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19B122EF6;
	Mon,  4 Dec 2023 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4n/k2TS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E991BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 03:28:25 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50be4f03b06so1963696e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701689303; x=1702294103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz+E+wLWwW8b7AOyJ2PaT0gpAg9bci3vqDG+CSgpeuM=;
        b=Z4n/k2TS5Q3uvStcH6b9m+l1wx5JoWv1vQSXGXh7+4YmAKjlaRBzt0Z2gz3fK+7RZr
         OOFcL+lCSSthPVxft40mwFMIb4Da+l8Kb9TyLF4l93yAjFrvx6gYmIsIbe6PI/5hKq5T
         DmxUscBMDpqhqB8QGf0a4iFJFu1M0NwjT8xWIOkKaAemG7scnlNnFS2H5SsrvmQG+IAi
         VYevq+8eczLgygbP+3XWeOUMBA42r5ey5WoQKp/2b+adyp9bi0L75Zr3DhYyo5Elv9FJ
         dOTB0gt78o18ZtYbq6h0ufHMjdYDqPZkX2009kV8NP/Df6bxauo/hJds8gsouRFHLa1D
         j6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701689303; x=1702294103;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz+E+wLWwW8b7AOyJ2PaT0gpAg9bci3vqDG+CSgpeuM=;
        b=MzENqVw6p2Y0sVye6sPTxm4HgaSSDpNJpr7t7jzfK29Mq5h+LgayZTG9qmdR8sxF2q
         jNPQBgyHp6pyvGhKZ0jPd+jwFXZ/gqeVBzkYlS8xhVKacMDk8rE+TRaAZRFRhkM7FEdV
         zBMMHUhEfHXDSZ2NwfMyoEaR5XejtnP3ac3FAro4n0XusqFMJVDf410R1/OSS9sfTh9N
         KhX+OHOu55NnkIjo78vBjXVXDY6yozjLdopMB0y+UKxPSvduVCAkVNTEF+ygGprdGT4y
         Rc8BlmKMhT33oe27vdiGEBpV0Sk/jT/DDVR8WZJJHNzNeTXLLz8UphNsBxblxj5AdEaA
         J5sw==
X-Gm-Message-State: AOJu0Yw2kxVLT/6YnjuHuHtfVZ2kwYwZNCh4l+I5T5O74VAIvvIDzoNz
	LG72svD6Km8WZtMt9glBJZBVLA==
X-Google-Smtp-Source: AGHT+IHuQs5GVLYsx0orUsAerBFbQOZVdpo7vi3c6v05bdjfdKwCb6YK4CDuwf2F/qghFWC9MxOUOg==
X-Received: by 2002:ac2:4d07:0:b0:50b:f83b:fe62 with SMTP id r7-20020ac24d07000000b0050bf83bfe62mr384695lfi.25.1701689303176;
        Mon, 04 Dec 2023 03:28:23 -0800 (PST)
Received: from [192.168.209.83] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id b100-20020a509f6d000000b0054c7a5a76b8sm2942768edf.0.2023.12.04.03.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 03:28:22 -0800 (PST)
Message-ID: <630d10c6-326a-4cdb-be6b-cd832378187b@linaro.org>
Date: Mon, 4 Dec 2023 12:28:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new
 GPUs
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
 <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
 <6a0398d1-22f4-4eb7-ba43-c448055be323@linaro.org>
 <CAF6AEGuqrm0pssjRDa9DK=NppU4Qq5cPZicbGfxKH2czJmjK2A@mail.gmail.com>
 <6146cc54-b3f9-4875-851e-3d2981b23ffc@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <6146cc54-b3f9-4875-851e-3d2981b23ffc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.10.2023 21:16, Konrad Dybcio wrote:
> 
> 
> On 10/23/23 22:20, Rob Clark wrote:
>> On Mon, Oct 23, 2023 at 12:56 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>>
>>>
>>> On 10/23/23 21:42, Rob Clark wrote:
>>>> On Mon, Oct 23, 2023 at 7:29 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>
>>>>> New GPUs still use the lower 2 bytes of the chip id (in whatever form
>>>>> it comes) to signify silicon revision. Drop the warning that makes it
>>>>> sound as if that was unintended.
>>>>>
>>>>> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
>>>>>    1 file changed, 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>> index 80b3f6312116..9a1ec42155fd 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>>> @@ -203,11 +203,6 @@ struct adreno_platform_config {
>>>>>
>>>>>    static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
>>>>>    {
>>>>> -       /* It is probably ok to assume legacy "adreno_rev" format
>>>>> -        * for all a6xx devices, but probably best to limit this
>>>>> -        * to older things.
>>>>> -        */
>>>>> -       WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
>>>>
>>>> Maybe just change it to ADRENO_6XX_GEN4?
>>> That also applies to 700
>>
>> Then the warn is warning about what it is supposed to ;-)
>>
>> I guess this is coming from a6xx_gmu_fw_start()?  I think we need a
>> different way to construct the gmu chipid, since the point of this was
>> to not depend on the low 8b having any particular meaning.  Perhaps we
>> should just get the gmu chipid from the device table.
> Guess that could work as well..
Well, I realized that we already sorta do this..

MAJ is always set to 7 (duh)
MIN has a lookup table that will expand with future additions
PATCHID needs to vary, and that should be CHIPID & 0xff

Konrad

