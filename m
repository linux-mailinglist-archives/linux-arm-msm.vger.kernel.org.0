Return-Path: <linux-arm-msm+bounces-79465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0EC1AB05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CA1E505D92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E528253B64;
	Wed, 29 Oct 2025 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KKEpZZaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03B2512F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743934; cv=none; b=egw+Gpz5jLp7BDEbcoPBkm07dOro2cZ6teqQmLxxupHpdP6wRikdhnUzjYsA0fdKdxQQ36TDAJcCpXBaZ2Y9sr47R03ISEcWJ2/qmUie6+mjxITm1xjxD7Q5/rW0jFHduZR/CzJxdLeCdVHDR88t76+eHiqrVRiUCutCaCRczm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743934; c=relaxed/simple;
	bh=EQd0X0gB3dZwOuPyU+hIHaWzwak0fNC3dTXAQ96FtA8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=quDm3JUl0wgFqJIL5pSo8fiF8CMySujgZsDUuQ/Tgw0DRf238GT/dW/48HIhvpeWnyznBqwSQA8h3fIOEs2IIxiWMq8sU/5rLHp42qos4+4KsWdYxk4Yudy/czb/I2+s0WvYKbkzdcub24pQisN552MAPPlQV15g98rU92bBv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KKEpZZaW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-427007b1fe5so6038129f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743930; x=1762348730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaaKwAyy+sWQXuEH4KmhVmwr7SpkPDWzcGFNHkyWACM=;
        b=KKEpZZaWvDUMARFk7VXlt/DiQEPnuydKnWw0ADmwxO92QN8LaDI0oSep91JkOraRtT
         DYLmy4ALvF+O5hmYqjPtydO8RyqIqOtk7gAtIU4iLKuLWOzTxe3YLAgdO3Q6VhN6adxj
         4SGldqZRL9p+0cNGiqYhisEpuIa47Lx1g4tscYkMQVuOBLWS/RgompW16B2hxTcEL8eL
         tsWqLeq4qYB71pOuRKS5VvpmNf6Axg9bow5CVty+q1wejda4ydXWnauzoNAKf/CfLWg+
         RQ3pn83MtIbUP+gf/1MPXzoJurdKoXHsZjuHZkBZtQM1PVyzy3qGmy8NUrjWyKGi2SPe
         hefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743930; x=1762348730;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OaaKwAyy+sWQXuEH4KmhVmwr7SpkPDWzcGFNHkyWACM=;
        b=EgxqNaO1wdEr9VmlHAVGorH7tZ7FKlZp2AUFz4hEfbVsSqRsmrxE/q4kNV0BB7SrV9
         ZNkQgO+CgKGOcALmKSB1gpad/AIUtsuzWnqvJtKIfB9/Jjl+f4Y4p1rNVm4HRZWAISRX
         aesRRgyayejo5J4za1ve+I7m3XTrWJFPXYNCJ+b8Z3zCCutLQHfYIVDQN5VVOQU6nfAq
         ZmIbqNnV17RXsFKDLSpalWTTyFowRD9m+DmQly+Uod31tsz/ZTKl7AjQQUW0bcO3GyHM
         uv4U3PKoiyAPwHczVJU9sD2gVE7m7LGYBW7Gb5tShVBntYqJaEZoZZKxJoRJoyXr3j3b
         EkSA==
X-Forwarded-Encrypted: i=1; AJvYcCVLlHsLUrx1i4Pe9TvLgI6KwbraDsoyFjVJFwys7psxUT5wRS82mFcwdSNcoKUvchYrwAszrQG8n4/ujGUY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3t1ZiK6zwxgpgVb5WFrL8c2xj/gpdRJ7ibVebjgFVhs3XsCK
	5IHAuZAF2E2iViKdMwy296yza4xXG1bWjQsC59AEsjH7HP0Ler7CuxR/+ekH1NbAEVo=
X-Gm-Gg: ASbGncu9GYDxlkC/1sQciDQw6Au6G6ek0ku6fsMY1v6cm+p6gdmYtMBJNh2c6Fosf9a
	2XW43ZD8OTp1rUvqFWtPcm3t6D1KqUK90Ibsnd8lOrwjWPRmx9alZoFzh/dm7xxkxYax4/kui/z
	YKfZ6mXB0rlXtF1a8SZQR4tDs/CinOhal7YKGycAPMJ7wK6HmHY3J+tgD8+3uy1qBiF1LVY1UYJ
	LW2MnF5vgPpDdTh6Y3rvqzJwTbyrrPB3w4xw4FmQJtJw2WvkYL9dGtRvluJtBnIFCE0f6OFfk3V
	IiiWPT0KhNDJCERVabKN53m3KeZwmRX4YozWNPC5DmIb+exiCAKFqnFqAN2vy7FsrfGuLr4Yc6F
	7HqvTy7Dt5Rop+6+XlefHuiMyj2qbqTqNSLi4S+96kXaY3epdF3cEwhOf2Xnnvg1CgHV07vnlWV
	oHWGFYHFUDIFYrNL2trBRy3VgXAGV9gy0dQwhtRfUKOPM6pqGeyg==
X-Google-Smtp-Source: AGHT+IGMClQvhsHxM5kuCMhxIaU3Hllq9/ZxA/9JG1+JN62IPIkk6su0LxlO+vwBqsAcZdHmc3yn3g==
X-Received: by 2002:a05:6000:22c6:b0:425:825d:15d1 with SMTP id ffacd0b85a97d-429aefc262fmr2554651f8f.44.1761743930343;
        Wed, 29 Oct 2025 06:18:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0? ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm25836646f8f.22.2025.10.29.06.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 06:18:49 -0700 (PDT)
Message-ID: <1418f8d1-a243-4798-9179-5d5add57198e@linaro.org>
Date: Wed, 29 Oct 2025 14:18:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
 <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
 <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
 <w4lwl34mtd7xv7it72nvomv6te2bcybisvirfdwzdazzqisd73@fvyusj6m5cb2>
 <ed323916-f0e4-4669-935c-6fc8ae6a9490@linaro.org>
 <58b5fc9e-890c-4b89-97fa-5d1638cffd3d@oss.qualcomm.com>
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
In-Reply-To: <58b5fc9e-890c-4b89-97fa-5d1638cffd3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 13:55, Dmitry Baryshkov wrote:
> On 29/10/2025 14:49, Neil Armstrong wrote:
>> On 10/29/25 13:30, Dmitry Baryshkov wrote:
>>> On Wed, Oct 29, 2025 at 10:40:25AM +0100, Neil Armstrong wrote:
>>>> On 10/28/25 20:52, Dmitry Baryshkov wrote:
>>>>> On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
>>>>>> On 5/7/25 03:38, Jessica Zhang wrote:
>>>>>>> Filter out modes that have a clock rate greater than the max core clock rate when adjusted for the perf clock factor
>>>>>>> 
>>>>>>> This is especially important for chipsets such as QCS615 that have lower limits for the MDP max core clock.
>>>>>>> 
>>>>>>> Since the core CRTC clock is at least the mode clock (adjusted for the perf clock factor) [1], the modes supported by the driver should be less than the max core clock rate.
>>>>>>> 
>>>>>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/ drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>>>>> 
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com> --- Changes in v2: - *crtc_clock -> *mode_clock (Dmitry) - Changed adjusted_mode_clk check to use multiplication (Dmitry) - Switch from quic_* email to OSS email - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode- clock-v1-1-f4441988d6aa@quicinc.com/ --- drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 +++++++++++ +++++++--------- drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++ drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++ 3 files changed, 39 insertions(+), 11 deletions(-)
>>>>>>> 
>>>>>> 
>>>>>> This test doesn't take in account if the mode is for a bonded DSI mode, which is the same mode on 2 interfaces doubled, but it's valid since we could literally set both modes separately. In bonded DSI this mode_clk must be again divided bv 2 in addition to the fix: https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix- v2-1-01fcd0b2465a@oss.qualcomm.com/
>>>>> 
>>>>> From the docs:
>>>>> 
>>>>> * Since this function is both called from the check phase of an atomic * commit, and the mode validation in the probe paths it is not allowed * to look at anything else but the passed-in mode, and validate it * against configuration-invariant hardware constraints. Any further * limits which depend upon the configuration can only be checked in * @mode_fixup or @atomic_check.
>>>>> 
>>>>> Additionally, I don't think it is correct to divide mode_clk by two. In the end, the DPU processes the mode in a single pass, so the perf constrains applies as is, without additional dividers.
>>>> 
>>>> Sorry but this is not correct, the current check means nothing. If you enable 2 separate DSI outputs or enable then in bonded mode, the DPU processes it the same so the bonded doubled mode should be valid.
>>>> 
>>>> The difference between separate or bonded DSI DPU-wise is only the synchronisation of vsyncs between interfaces.
>>> 
>>> I think there is some sort of confusion. It might be on my side. Please correct me if I'm wrong.
>>> 
>>> Each CRTC requires certain MDP clock rate to function: to process pixel data, for scanout, etc. This is captured in dpu_core_perf.c. The patch in question verifies that the mode can actually be set, that MDP can function at the required clock rate. Otherwise we end up in a situation when the driver lists a particular mode, but then the atomic_check rejects that mode.
>> 
>> A CRTC will be associated to 1 or multiple LMs, the LM is the actual block you want to check for frequency. Speaking of CRTC means nothing for the DPU.
>> 
>> We should basically run a lightweight version of dpu_rm_reserve() in mode_valid, and check against all the assigned blocks to see if we can handle the mode.
>> 
>> But is it worth it ? What did the original patch solve exactly ?
>> 
>> Do we have formal proof about which max clock frequency a complete HW setup is able to support ?
>> 
>>> 
>>> With that in mind, there is a difference between independent and bonded DSI panels: bonded panels use single CRTC, while independent panels use two different CRTCs. As such (again, please correct me if I'm wrong), we need 2x MDP clock for a single CRTC.
>> 
>> Any mode can use 1 or multiple LMs, in independent or bonded DSI. As I said the bonded DSI with a 2x mode will lead to __exactly__ the same setup as 2 independed DSI displays. And in bonded mode, you'll always have 2 LMs.
>> 
>>> 
>>>> So this check against the max frequency means nothing and should be removed, but we should solely rely on the bandwidth calculation instead.
>>> 
>>> We need both. If you have a particular usecase which fails, lets discuss it:
>>> 
>>> - 2 DSI panels, resolution WxH, N Hz, the mode uses l LMs, m DSC units and foo bar baz to output.
>>> 
>>> - The dpu_crtc_mode_valid() calculates the clock ABC, which is more than the max value of DEF
>>> 
>>> - The actual modesetting results in a clock GHI, which is less than DEF
>> 
>> I don't understand what you need,
> 
> I have been asking for exact W, H, N, l, m, etc. numbers.

This is irrelevant, checking a frequency for a "CRTC" which doesn't always
maps 1:1 to an actual hardware is buggy.

Dividing by 2 if there's a has_3d_merge is already a hack since 2 LMs will
be associated to a CRTC. I don't see why the bonded DSI cannot have the same handling
since 2 LMs will be associated to the CRTC.

Neil

> 
>> in the current form the mode_valid will accept the 2 DSI displays as independent, while using them as bonded will use the exact same HW setup (resolution WxH, N Hz, the mode uses l LMs, m DSC units) but the mode_valid with rejects it.
> 
> Which clock rate is being returned by _dpu_core_perf_calc_clk() while setting up two independent outputs and when setting up a single bonded output? Which clock rate is being used by dpu_crtc_mode_valid() to reject the mode?
> 
>> 
>> Neil
>> 
>>> 
>>>> 
>>>> Neil
>>>> 
>>>>> 
>>>>> 
>>>>>> I'm trying to find a correct way to handle that, I have tried that: ===========================><======================================== diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/ gpu/drm/msm/disp/dpu1/dpu_crtc.c index 48c3aef1cfc2..6aa5db1996e3 100644 --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> 
>>>> 
>>> 
>> 
> 
> 


