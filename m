Return-Path: <linux-arm-msm+bounces-29348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CE95CAB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0854C1F266F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 10:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6CD17E01E;
	Fri, 23 Aug 2024 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0Fnnqzc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8864358A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409869; cv=none; b=M4pT/WNwupaD9aLz/Lshm8QhwuUqYxXm2Q7CyJnoyLCV7ujc1gDwH9Asua0qBHbHhz5DrkSdHF2uLdZbaWGsTl1WHMjoJLgKgHgIJLFJdFb1LIGn9nzLdg6CIqyx4riX9BHtHhq5NjomjCAFWOcrBW7anuRwYU4s+t+6D4U0gCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409869; c=relaxed/simple;
	bh=Kn9oSZ/QGTczL1uebbsh+1ZIMbcbkXkVQ0jFbSqYFT4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lhwRXe4X9wpPe3Wx/i/e0XzoLfyBmj82M8r0jhJwLfZEUexnMMVaX94NFpKgSQb+0l/M3V5x7o9vUkj9I3kMrOeDbbCwPBr/rthAdoI8w5Btcs0pfCRmGr0Zv4jjh9oJRkftgM3b3EvhYMK58iVP+DFDCzHIUcdxIzfE5yDS45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0Fnnqzc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so13314195e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724409866; x=1725014666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVmP6ojwfJA9IaR5bDfQtTdpMJGMktg0fabmxgK6590=;
        b=m0FnnqzcYGDCWioU2+wnmYfwpFAWOfhyBM0HPr2QDkq9LlRnoDKBdBQiPS7ice61JV
         r+zHGCH6qIjqri6Ii03Jtr3Ib+6ePCEKxHf7gxeteMEVG1BHgi+ZSybsStZ5XgLq/tva
         dVNHFVyfn1LyI9+XsIsRd86kvw3TRP+lryhpark2663Nrk6GFGdsS8cUOkHVCrFhpThy
         PWYXVJMXHjb6gryJZzbURY+6rr62DftJ67CDXqoNPVctWUWHiTlPsBouHetI6C8/U2ki
         +HR5R1VWoJHnRuur9yj/om/0DMwn7tNIJQtbYVWS1KE9BXPvakgIoekTQYZ/kSYxG7y0
         EldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724409866; x=1725014666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TVmP6ojwfJA9IaR5bDfQtTdpMJGMktg0fabmxgK6590=;
        b=c6eHpqaA3OU5cRNvQIk8thdHxyISyxRiUwD6h4ITVo/TSwFnQmeOUhG5AnFBdrUGBl
         UU1gLioyPUHsjuXGWg3L/0mWePyyHNx8MomKa2VvF7myHA9GhwevkLWLpv5HwZMoNZ2X
         1dDmptkcqsRrbdjgnsfxRQVfVQyTqvHNSYy3/9XzE7rUajCByLK5m3SRDl3VKLLDUV1R
         Hoi768Jx9HzGQ+mB281qZjbh+LYD7uJTvzOWwySkvpIvUe9eqDs4bOcbgVkDXk9Hmant
         0CwB2iHP5D7itpKWyOQcpu43vaXbTyAmaxZ6h6S925x959bWFli7VP9baWp9QJVsepSD
         RnWg==
X-Forwarded-Encrypted: i=1; AJvYcCUMYVrz9emnjjaZWswRPZkj/b/ztc9KaWbaDgbiVJiDyVfE6SuvBELwAAsJ8O9T9mX1WAxUI0iQQsQPH0Yh@vger.kernel.org
X-Gm-Message-State: AOJu0YxgG54eBz2xUYHUgXrJzv+M0qQmbuxVnMWMFS3Icen6GVJkQN9E
	SDEjyEwuQ3cD4C58QJTFH+d7HgZA1D1PChTMWsOZXd2HN/g950IUKV5kjSaa4Hs=
X-Google-Smtp-Source: AGHT+IFdk9CofB6PBJT5jah9JSl6icoRfyxDLqLF+MakugI7qNwi8X30PDwv3ScpFgwP6yqIX2DKng==
X-Received: by 2002:a05:600c:4ed2:b0:428:314:f08e with SMTP id 5b1f17b1804b1-42acd542443mr10762475e9.5.1724409865680;
        Fri, 23 Aug 2024 03:44:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:995c:3fea:6b19:4a51? ([2a01:e0a:982:cbb0:995c:3fea:6b19:4a51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ab6e7de7bsm96371635e9.0.2024.08.23.03.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 03:44:25 -0700 (PDT)
Message-ID: <d92afb55-ff28-40d3-b5c0-400b00b1a4e0@linaro.org>
Date: Fri, 23 Aug 2024 12:44:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
 <CACu1E7FxE3rLN8SV1-5Zg7=+LqCAwHuiCcXroikS4=yRPsdnMQ@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CACu1E7FxE3rLN8SV1-5Zg7=+LqCAwHuiCcXroikS4=yRPsdnMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/08/2024 11:54, Connor Abbott wrote:
> On Fri, Aug 23, 2024 at 9:30 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 15/08/2024 20:26, Antonino Maniscalco wrote:
>>> This series implements preemption for A7XX targets, which allows the GPU to
>>> switch to an higher priority ring when work is pushed to it, reducing latency
>>> for high priority submissions.
>>>
>>> This series enables L1 preemption with skip_save_restore which requires
>>> the following userspace patches to function:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>>
>>> A flag is added to `msm_gem_submit` to only allow submissions from compatible
>>> userspace to be preempted, therefore maintaining compatibility.
>>>
>>> Some commits from this series are based on a previous series to enable
>>> preemption on A6XX targets:
>>>
>>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>> Antonino Maniscalco (7):
>>>         drm/msm: Fix bv_fence being used as bv_rptr
>>>         drm/msm: Add submitqueue setup and close
>>>         drm/msm: Add a `preempt_record_size` field
>>>         drm/msm/A6xx: Implement preemption for A7XX targets
>>>         drm/msm/A6xx: Add traces for preemption
>>>         drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>>         drm/msm/A6xx: Enable preemption for A7xx targets
>>>
>>>    drivers/gpu/drm/msm/Makefile              |   1 +
>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>>>    drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>>>    drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>>>    include/uapi/drm/msm_drm.h                |   5 +-
>>>    11 files changed, 995 insertions(+), 16 deletions(-)
>>> ---
>>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>>
>>> Best regards,
>>
>> For what is worth, I've tested it on the SM8650 QRD with the Mesa 30544 MR & vkcube
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>>
>> If you think of more tests to run, please tell me.
>>
>> Neil
> 
> Hi Neil,
> 
> I think it would help to test this on SM8550 and SM8450 too. I don't
> have SM8450 to test with. Maybe also worth mentioning that there are
> now vulkan CTS tests that try to test L1 preemption:
> https://github.com/KhronosGroup/VK-GL-CTS/commit/7e0e4a000f34e748bb527b39f730f78b595140b9
> although it's not in a released version yet.

Sure, It's in my plans, I'm currently testing it on SM8550.

Thanks,
Neil
> 
> Connor


