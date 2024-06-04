Return-Path: <linux-arm-msm+bounces-21661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FC8FBABD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 19:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9279B29AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DF25F860;
	Tue,  4 Jun 2024 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xa8F1eB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DEA12CD98
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522730; cv=none; b=ngAB3vESyO/4RdFsUvI2H43VeOyZoITvaBREIIqpwPJEi6hwW0WyCGwa4kJJH//gBQhvSDpyl7Ppi6xtkGqwj0nfUdHoQmYM77cdFr1jC8/Rs7Gd57MxNGq66Ppeo4qDjYgIF+UUqEBxLui2wZMRsugt3jPN3xB+AjYWypP6Lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522730; c=relaxed/simple;
	bh=BuksyYCQScRNH6DaoM04EBEjib2Y4rHkqfxdMQJGTx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ3KpdjiBOtJ5Iy+qPzwiEUVPtBRXL9M20HfKN6F/bMfvRILGOSoPF6EiqaErpJB1TRs3riFpeAnsRN0sdu13xfT5OEXgyXJNOpPUR9AoV56ZDkGpdNbZZehFgN8HYeUeHWQtmv8Zn0JANXYeBR48fz9SceTrZQe8GtAWWaQ+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xa8F1eB6; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b82d57963so6232118e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 10:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717522727; x=1718127527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6GeqWLi7NNbGWYRb6N4n2qfBVPfozE0EINuphnmhX3g=;
        b=xa8F1eB630ImusPYStAx8DBQJtxH188LXnPImZ13ecF8W/mny0paGWXZYyTX8rvdxz
         gS47MUa/cl/NTyVz7u9DgveEJPwfC4ggTM2c2YFLGEOh5WFJLJuaMfVWbco11vzjIrBr
         0+Vd0cm6Jlj0bfJypcw7W+d4dIK7fj3Vy4SGqsbTT9LrZWxFS/qkjqH/iNqDqbPXdZMS
         sNEA1si54JgrVoFBoH87GCCP5NJ5o8f1f01d147fBPrlDaUj8nsGe7pHJ3LMqHVygbfB
         JK23xp847UzfrptUnKH3hSp8Byinma8qHbnEufZiOi0n05F3sayJz49HyGOz5TOmseAJ
         j1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522727; x=1718127527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GeqWLi7NNbGWYRb6N4n2qfBVPfozE0EINuphnmhX3g=;
        b=YP2X96Ni6CXjljybjTpvJGml1EW3yiK/7DtlTGlGM9jH1vbWG0EjOm00O7sFdSYHCa
         LlFwUMkpZT+Gfxr5YlgxO9pSBIiGkceXppFIkw8z2BurZSFpE1GsluWE3XfOfh5depKe
         ca0CzRgT8pQibTvPcOr/jrOTmCgK3PIR+JAh9PaIRf4dNjR4MMHGPLlEKoTtENQGz/sN
         vw/TvO7U5pUSdAXNp76+1g+6ZiGigMftwaSrVIzZo89OedeWXjxtRNMHFKFSFKbRkAjq
         6EaqJO++0ueYCW41QSInc+sTnjtfer7qXTv+vIbwCRsdI67Lhmv4x0oXQbm6qF3aHoOE
         nm2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7Eed+edCeNzreOUXzXns7G/xo+tgcqWL4Ere1pGt6LZUCJLF1+ewiGY+LAT+p98h1MJbtosdT6lv3NIuOCOhrUHvBVZKPh0bw3TO9w==
X-Gm-Message-State: AOJu0YwpoTyvkSHFL72nu+KQEilkmZF1jYbV/B0ENubYHa6DA3fbTvrm
	6VFkGckMUdH9IosP5Ftc55DXMJWntFwpsPXuxEnWY6N9PHFo2MZAyRzxFr8opNs=
X-Google-Smtp-Source: AGHT+IGHKIQb1LEwTvENZPss+PNdcktLsu+2+zv+ciguUyYJZdKE3p48fX9lg5yWjQ2KXlMpoi2ZSQ==
X-Received: by 2002:a05:6512:3f14:b0:52a:4217:d6e1 with SMTP id 2adb3069b0e04-52bab4b7c13mr184790e87.4.1717522726713;
        Tue, 04 Jun 2024 10:38:46 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8? ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6919c82af3sm275604866b.120.2024.06.04.10.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 10:38:46 -0700 (PDT)
Message-ID: <d7cf1848-d39b-43f1-bcd5-b917e0289fcf@linaro.org>
Date: Tue, 4 Jun 2024 19:38:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
 <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
 <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/4/24 19:33, Barnabás Czémán wrote:
> On Tue, Jun 4, 2024 at 7:06 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 6/4/24 18:45, Barnabás Czémán wrote:
>>> On Tue, Jun 4, 2024 at 2:27 PM Barnabás Czémán <trabarni@gmail.com> wrote:
>>>>
>>>> On Tue, Jun 4, 2024 at 1:55 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 6/4/24 02:20, Barnabás Czémán wrote:
>>>>>> From: Daniil Titov <daniilt971@gmail.com>
>>>>>>
>>>>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
>>>>>> SDM439 (650 MHz).
>>>>>>
>>>>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
>>>>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>>>>> ---
>>>>>
>>>>> This all looks very good, just a nit
>>>>>
>>>>> [...]
>>>>>
>>>>>> +             /*
>>>>>> +              * Increase inactive period to 250 to avoid bouncing
>>>>>> +              * the GDSC which appears to make it grumpy
>>>>>> +              */
>>>>>> +             .inactive_period = 250,
>>>>>
>>>>> Are you sure this is actually necessary?
>>>> Every A5XX GPU is using the same value, but i have never tried with
>>>> DRM_MSM_INACTIVE_PERIOD.
>>> This was the original patch
>>> https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.org/
>>> where the inactive period was increased for a530. I cannot test
>>> suspend on msm8937 yet.
>>
>> The suspend here refers to device suspend, not system suspend. Adreno
>> goes into device suspend every time you stop using it, i.e. after the
>> rendering is done and there's no more work to do.
>>
>> I suppose a good test scenario here would be to keep running and closing
>> kmscube in a rapid fashion and checking if the GPU starts crashing for
>> unknown reasons (the dmesg would denote that)
>>
> I have checked on a505 and a506 with this small script
> while true; do kmscube; kill kmscube; done
> none of them crashing, so i am going to change it.

Hmm.. not sure if it actually idled when tested in a tight loop.. If you're
running bash, try "while true; do kmscube &; sleep 0.08; pkill -f kmscube; sleep 0.08;done"

Konrad

