Return-Path: <linux-arm-msm+bounces-21654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B688FB9F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 19:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A983728485B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55FA14A086;
	Tue,  4 Jun 2024 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i3E6SxfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1D149C44
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520776; cv=none; b=uVDmVPYvUQX+dVKep3sjxNnlV03n2e4UVZsUKDdcQyJ25eXwaioaEsRrfxz7YEoOHup7e8uJ9KGaLX1WXgUdjWaLHaf25sl639Zr4XbhePOJNtV15tx65NYKP83bMgeoyRKrWsUExYIXqC1pxP5IKjMAOMVITjDfCBVwOYLm7fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520776; c=relaxed/simple;
	bh=7FZMerzyumByug0YBJaZePO62jxn9Zgedg66wnJtGLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ft9e50d+eSeMJRwDwhJJJMOy8nQbpusfBHocgy/cREYtE6fJzm9eU0I+czfDqU8oyMK63cs3OlxW7bOuBKq6ls12uuvkLQCKKBojfD9IvHRHkc/W6g58dExfEWcNZ1Y4cK06fE5it213rJIB/TaLe3IPKcRqt/xQNcTh5V3xTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i3E6SxfJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so6609859a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717520773; x=1718125573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aUMBd6S6vH1Fq76iwhEyjBkvlh36Pc3VvYRxup98QU=;
        b=i3E6SxfJRRCVXelXM9VViV381xYdplJpsdn/xfmEDSpzUS50fakhUXufIKuM3wHvkm
         iKj0beU/ibLDnZtvyzkSWR1oT91xa+FJCuH24iubMbhjPa5hZ4yfaja/w7Lr52cXvS3w
         Wny81Gj1+tnHjsFK39Y/wBvp25uSglOyoiJQH2pwyFHhUHbX+/PVpdOFhPpwDt9lP7u6
         +ARARApUmnnmEN9fmS2gEtVFQf6MPjtZ047hyIvTtLLOcDxN+5hgKptliA9gh1HylDl0
         ES42ncwvuZuAZ+f95x0GLkOJbPb2Qkv+Ei/4Qtkv2JH9ievmLFB6TcOMMvnS3E9U1QxW
         htHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520773; x=1718125573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4aUMBd6S6vH1Fq76iwhEyjBkvlh36Pc3VvYRxup98QU=;
        b=eRsPg5AkVzLcITyBEnLav8nBwH0tLd+PcuHYSfveF+e0WfqqIeS1FYuNtraDqGVWJU
         YLX1tVZ6WCc7HixleMrzC4qPWvTr/2HgDdydLFP2j2S5N0jjJgw43oC/S+6BNLTxMoZ1
         g731RZ8ES0q8SoxQ1FBbVYzoNEVwQlOBpLotPZB7lDo2/It0K4SPg9GYBX1j7pAHtzlT
         0WCvSpgar3Dm5aHjEPJrteSfY+8W8lrcpqZgFE2K4TnJ4uSOpGYxRfvXlwKCx5+sfXFX
         fddw3YvefW7ZNeDTSX1CwHyzFMqgk8TirF7OeS8iXGlfMExxE8HoPDGYYFdNnf3Ss4/F
         Cpvg==
X-Forwarded-Encrypted: i=1; AJvYcCUYpHPiI40m64KMWQus+yv5avaoWoWa6FrlSaeFNG3wVqdjDypHHLkXuYTuKU2OyqKGnuUM6DdZOmk4dnS2DrCa9IC6mGFn0ER928c1ow==
X-Gm-Message-State: AOJu0YycIAvrfkw1d1ATJ1+n/f+TefklPCbQCxqQV2lE4wzmx9dkOMcv
	AphegoUV/OQgQP2GeooKcnReumiwgf+rIkRtV9GMHaRWK+e7w4ZS7+x9L3veRTU=
X-Google-Smtp-Source: AGHT+IHT8X9AMfx+BZpwbKKAI0BGP41IwtZlUxVZrzOm9sWMjqE5bRIO+v8abCGhYG5qwitWIODsOA==
X-Received: by 2002:a17:907:770c:b0:a67:7649:3c3c with SMTP id a640c23a62f3a-a69a000e966mr10970966b.56.1717520772786;
        Tue, 04 Jun 2024 10:06:12 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8? ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a69127f2901sm291675066b.48.2024.06.04.10.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 10:06:12 -0700 (PDT)
Message-ID: <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
Date: Tue, 4 Jun 2024 19:06:09 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/4/24 18:45, Barnabás Czémán wrote:
> On Tue, Jun 4, 2024 at 2:27 PM Barnabás Czémán <trabarni@gmail.com> wrote:
>>
>> On Tue, Jun 4, 2024 at 1:55 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>>
>>>
>>> On 6/4/24 02:20, Barnabás Czémán wrote:
>>>> From: Daniil Titov <daniilt971@gmail.com>
>>>>
>>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
>>>> SDM439 (650 MHz).
>>>>
>>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
>>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>>> ---
>>>
>>> This all looks very good, just a nit
>>>
>>> [...]
>>>
>>>> +             /*
>>>> +              * Increase inactive period to 250 to avoid bouncing
>>>> +              * the GDSC which appears to make it grumpy
>>>> +              */
>>>> +             .inactive_period = 250,
>>>
>>> Are you sure this is actually necessary?
>> Every A5XX GPU is using the same value, but i have never tried with
>> DRM_MSM_INACTIVE_PERIOD.
> This was the original patch
> https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.org/
> where the inactive period was increased for a530. I cannot test
> suspend on msm8937 yet.

The suspend here refers to device suspend, not system suspend. Adreno
goes into device suspend every time you stop using it, i.e. after the
rendering is done and there's no more work to do.

I suppose a good test scenario here would be to keep running and closing
kmscube in a rapid fashion and checking if the GPU starts crashing for
unknown reasons (the dmesg would denote that)

> I can check on msm8953 with a506 maybe if a506 works fine with
> DRM_MSM_INACTIVE_PERIOD
> then a505 would be fine with it also.

The more testing the merrier :)

Konrad

