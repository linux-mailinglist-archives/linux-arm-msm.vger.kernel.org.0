Return-Path: <linux-arm-msm+bounces-79401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E253C196C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569C0189AE81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025EA3081CE;
	Wed, 29 Oct 2025 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyOFBAWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002932D839A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730830; cv=none; b=LNV/M2W+xcNQ0gNjS4+SdYb0IMlvGh73I7nwGEYnz4q3jEuzQfZROINU5LRbE+Vsmhi/b0C8KGptVXie7Z2UJX1kaSCsKHSbGtCMRfk1wM8sxfQQm46rdn46qPDoTji6zPjdREnZ+gbrxgB8ZIUPiG3LSsQlKLghC136mI7Cwk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730830; c=relaxed/simple;
	bh=0/2uNA7ByrbR4/RC7jaeEAowvHjCmV5erPmJQj8jQlk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G+iEts5m7hVM9SD4l+COGAMnm362BGOv2AyCGuKPNqdBFZKiO8Fo3C+LwMN3WT8i7M5HzU9ABd0OlLvSwe/LtHsnRLC5eqNoG/HzmuBNdD/iym0ELQUo37FzbT236EVASsWcXrq+yYu2+VS7/cGFNZCO9LllqulW91Ilgf8v1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyOFBAWM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso58065965e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761730827; x=1762335627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpD8LIzdwjI+LuQZp/Ng/8pA8/EN8OIRE+rVL25JQdI=;
        b=hyOFBAWMfK0gd6LsKk7EfL1dAiSF2ardVV1PXOEQiOFrioMjE+l2x5FKaEa4YIHc7e
         i37i7M+ZJsCIljk5oVVVIGHPj/TYRNsCBaTk7I29bhab19Aitk+gkrvypmVt6Y4Agmau
         eyHOXzmv07CdiXPuO/H2t6TarN6046IvDbEnecAWunPn42O5Jkl0TjIxsOxsDKDDhNnB
         xrIMBpvSS+LdrmW8I17W32cwpvHCF8Fj2LUL4Nel9wyJcXqE+W7RO4oMw98nwr51AVhf
         MBWeqCl3ysxWj8gNtRkLkv4aQc4IpAFQ8bIoHS6tB8ZTrIkW0wSlcb8w+zvie/7nWsCZ
         u4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730827; x=1762335627;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MpD8LIzdwjI+LuQZp/Ng/8pA8/EN8OIRE+rVL25JQdI=;
        b=Ins4cRRzr6mzz7RNWjIxoUL/0zodC08bHc9LCfvLhCgjBtSFLtqisX8slvJ1qbVeW2
         1mKK56an5WqRyoL39F/RlPL2TVqJp/1azKa9oQ1wlkN+lgzaBfSNJ+v5emC4iqXWQUSG
         h1a9JNcTTc949ZXwR+2F5kFEnLazSoTkzY+hzj+m6L9Bp3LRI0+38m0lGDOy9eXhlnVO
         2mUQCgseI7rtugJfBTkEez3r8RGZG0O6X1k+xgzxdjSabv+2eIZHISdo12PMZoarRCGQ
         OR7RVqk2Z8aoEmZ6M3YnyneDLZaM3gMBpOAMJck/ePP12GEI4Zhhay25pWY9CHGQYeZe
         JDcw==
X-Forwarded-Encrypted: i=1; AJvYcCXjW/HZfvHmjMM2GZYWVUJqVqRIT7z/Ib9bWX45Cx1B0gbkHi55WQFqZC9lvkQYXd2mFucdKz21YHL6swqp@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKZA4Ne4yU9HGdZI6fQ/uXtJ1H/dmUolYDm3ES3ooWcIwJ0q/
	0tEJvu79FnmUjwJUlAfPhag6Fk/e12ubfaKz89TQbKJpIrYWDLivfwKNf0lr+BNdMTg=
X-Gm-Gg: ASbGncvE2XKw0BP8sfZB/yk1ZKfOUObxFdZL25SrclGQcjKsEMhuKmIDzArVOIBgBeR
	JcgxLtY7jP1T8jZ2wUWPTBAgy1ZDKvL3zN2I0nqvuZWKx19xsnuIoV7kBhpiTdg6Vau9Ev8DdUL
	aOjKcaWrzjo4jZ09OnsD4d3vH3aKtIdqW6xcqKKbZfeqFxggQnHhRhqbY9SCb+KAB8Y40Yl79/K
	Tu+vmMr06NZWaJVVY8lb2st7vVeQO8Duzs36ejfOK5TwMIEEe8o1zggyNgKWMVdFUBWR6X4AS6A
	3B36aBQOxlRfBbojiWNGepoYgdiTbcytwzAlciOoDz52IuENcyubOcXLeOCqXmHQyoZtJRnNluo
	Eb68gcT6COgAoSJlnmgrE5AHn52I43mNUABdmWHmfgIhB35VB2EFgAdVAMwKLE2/gtg1j8QQHdw
	vYJqWxbAt53o2bVR3dW5JIIUVAak0GK5TMlkF0PwBIdMBTHrYYsg==
X-Google-Smtp-Source: AGHT+IGnoupx3oh4ehhHWev6na4HNe4UnW8e6EUSqdzNJvKIIl1nuletM5oT3QUF4LOjqh0ytQBULQ==
X-Received: by 2002:a05:600c:1d1c:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4771e1c9da8mr18311955e9.1.1761730827171;
        Wed, 29 Oct 2025 02:40:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0? ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb7e8sm25577436f8f.19.2025.10.29.02.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:40:26 -0700 (PDT)
Message-ID: <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
Date: Wed, 29 Oct 2025 10:40:25 +0100
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
In-Reply-To: <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 20:52, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org wrote:
>> On 5/7/25 03:38, Jessica Zhang wrote:
>>> Filter out modes that have a clock rate greater than the max core clock
>>> rate when adjusted for the perf clock factor
>>>
>>> This is especially important for chipsets such as QCS615 that have lower
>>> limits for the MDP max core clock.
>>>
>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>> perf clock factor) [1], the modes supported by the driver should be less
>>> than the max core clock rate.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - *crtc_clock -> *mode_clock (Dmitry)
>>> - Changed adjusted_mode_clk check to use multiplication (Dmitry)
>>> - Switch from quic_* email to OSS email
>>> - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
>>>    3 files changed, 39 insertions(+), 11 deletions(-)
>>>
>>
>> This test doesn't take in account if the mode is for a bonded DSI mode, which
>> is the same mode on 2 interfaces doubled, but it's valid since we could literally
>> set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
>> in addition to the fix:
>> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/
> 
>  From the docs:
> 
>           * Since this function is both called from the check phase of an atomic
>           * commit, and the mode validation in the probe paths it is not allowed
>           * to look at anything else but the passed-in mode, and validate it
>           * against configuration-invariant hardware constraints. Any further
>           * limits which depend upon the configuration can only be checked in
>           * @mode_fixup or @atomic_check.
> 
> Additionally, I don't think it is correct to divide mode_clk by two. In
> the end, the DPU processes the mode in a single pass, so the perf
> constrains applies as is, without additional dividers.

Sorry but this is not correct, the current check means nothing. If you
enable 2 separate DSI outputs or enable then in bonded mode, the DPU
processes it the same so the bonded doubled mode should be valid.

The difference between separate or bonded DSI DPU-wise is only the
synchronisation of vsyncs between interfaces.

So this check against the max frequency means nothing and should be
removed, but we should solely rely on the bandwidth calculation instead.

Neil

> 
> 
>> I'm trying to find a correct way to handle that, I have tried that:
>> ===========================><========================================
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 48c3aef1cfc2..6aa5db1996e3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> 


