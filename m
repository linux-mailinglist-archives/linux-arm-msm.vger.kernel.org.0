Return-Path: <linux-arm-msm+bounces-3052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA9801EFD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F931C2048D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F319622098;
	Sat,  2 Dec 2023 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGm8SRF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF29E118
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:23:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso44156e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701555806; x=1702160606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i98wi9Skw7SDbYp7AqZ/fnWX0PsjqvuYrEXQ3u2+UPQ=;
        b=DGm8SRF3ODTuwW9JKrJG18h08JBAFnOJIufXf8suQ0XG754aooCcsBPZ4FeUwu0eZb
         ZNj6Vm+bvM1B574hlUDqa+wjXJgyIOB51xaMmh4jDaObAq5/OKqbSPqXrgW1pJQrtuXC
         Jk9NfAkienxCEeLzNEiHs0AlbtSVfIH23jQILCDZr8h7jnk+v5k9vFVruT16PNSxsiee
         Gv16P+s3s1Vekoj11aVW29edy11+nswyYrW4B7KSdJRhJUfB0+DojfwJnpD11vVnSTch
         ga+z4e85pIGhyypwdisju+Euw/NgAHgaKRnknBPuFhlXc9TU5lMIOc/VQePv5ozhdq25
         R/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701555806; x=1702160606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i98wi9Skw7SDbYp7AqZ/fnWX0PsjqvuYrEXQ3u2+UPQ=;
        b=OZ1uify/EDV0a5ep80xhvECbv4GIomGChIrYsqMXvPBPV7oBqppTmTYD1Vaim2bVRK
         yHRuMFAB2QioqGIlS5gsa9wik9vrj/13Ig0VhpXgXYgcnHszgU4Lah8lXi5y1DVjxtwK
         4EdlVp1N/kUdnkPCpBOV6F3R/tu/KIFt5qHouLGG99LwqZZPoGtkm4PexByNzrDR145s
         ZcHhajROjOivhiOy91PuH5W5UFbtwK8Tdo85/uOuYXSYqeXTW6jYmE76dEPASqdX/mbs
         MCkkNtisajSZRAAgBQzVI6Id+qREidPBj+81bUmrcbwhgJwaznFnOyi+cSY0DKXpmLIu
         RtlA==
X-Gm-Message-State: AOJu0YwnKB0bGKoLX7WuU6lQpWX1uaegx6g/bv3uHHfceRWRwyGDDbUH
	25/wvSC3S4EEXk6+/AsDH9yGrg==
X-Google-Smtp-Source: AGHT+IFhlsbhAD3nB8qmlIptBu3X5G3H6uBJcCVdG0C+Wpabrj5k/+i0Rwm05YujjeFTCeBqRoeEag==
X-Received: by 2002:ac2:4ac4:0:b0:50b:d764:76db with SMTP id m4-20020ac24ac4000000b0050bd76476dbmr1958594lfp.106.1701555806206;
        Sat, 02 Dec 2023 14:23:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v26-20020a19741a000000b0050beeea07f3sm146792lfe.4.2023.12.02.14.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 14:23:25 -0800 (PST)
Message-ID: <551382fc-4256-4e2f-974c-9b0f6814a8f8@linaro.org>
Date: Sun, 3 Dec 2023 00:23:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
Content-Language: en-GB
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-5-jonathan@marek.ca>
 <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
 <ebec534a-4c72-7d33-4c18-4e0b43338568@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ebec534a-4c72-7d33-4c18-4e0b43338568@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/11/2023 20:45, Jonathan Marek wrote:
> On 11/15/23 2:38 AM, Dmitry Baryshkov wrote:
>> On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>>>
>>> Make it clear why the pkt_per_line value is being "divided by 2".
>>>
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 66f198e21a7e..842765063b1b 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct 
>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>          /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>>>           * registers have similar offsets, so for below common code use
>>>           * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
>>> +        *
>>> +        * pkt_per_line is log2 encoded, >>1 works for supported 
>>> values (1,2,4)
>>>           */
>>>          reg |= 
>>> DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
>>
>> Should we switch to ffs() or fls() instead?
>>
> 
> Just a ffs() on its own can be confusing as well (without the 
> information that only powers of two are possible), I think like this is 
> better.

Sounds fair. Could you please then add `if (pkt_per_line > 4) 
drm_warn("pkt_per_line too big");`

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>>          reg |= 
>>> DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
>>> -- 
>>> 2.26.1
>>>
>>
>>

-- 
With best wishes
Dmitry


