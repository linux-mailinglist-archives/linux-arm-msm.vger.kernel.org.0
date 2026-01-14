Return-Path: <linux-arm-msm+bounces-88935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46505D1D3B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD583009C15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CDC37F723;
	Wed, 14 Jan 2026 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GnICHjVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3395137BE76
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380313; cv=none; b=hfcrrPa7vu7IIoqiHhMm42G1N3IQ6a93CHgKeNH2pMFJFOjYa1/R/8dGMUIPdtgXfetg3rNAQa0+3/Hdlg0GL3lv3AToQd8SmZNufrgZx/DHIwyqxBfSP3IqEBuqbSyhQqn4gPkjG+PYhMNdALzDBLWDWy/5hnD7u0yjQI7gIoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380313; c=relaxed/simple;
	bh=eJcQDDz6REmSWrTBdqEWlgdintf4zRq+JCXkCNub2Y8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qkk6UFBY+oLvckl3OEM2rTJn8bu7Hy5k+PWDh16WJD7qefXZJeD9CltLfx7BOn+bgg5kJ7vCPAqkhnxbU99EsAfLFaF0LvajvY92ySOK+E5ZZnNBTGL4LbaQyQ+bBcma7tAcad30UiRCtXdqf+vpM34kl5a/RcNj0gNsbAZJ+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GnICHjVK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso5657825e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768380308; x=1768985108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn2P+cTkVwAykWlPC24DGRgRkCJONiMX3KadIJciMfk=;
        b=GnICHjVKxFYjvprT0kxIuSwl3/NK/Gk1erlRhqu8FjkAtxD1X4Es1Sfy7zL+cBZTCC
         1CpCPqExcw40U/qgSsW21C0plll8CFyNR9YpMDkEq+hlgVG3FPFl5E9mf4Xtoh+ty6BI
         trD0GXKw9Mv37jCIXJCzn1usq3YRS3MomQYdG/kZXDt+sozxLDCzvv6OXpGZyqBVH51y
         5TADgAtS+GWtbUetot309vPb+jNqZj+9VsEYlHyZVi9t+hmvVfv0wyOcKGS0BRLyZFQ5
         NutRavjLc8FMEPX3ZqgPXDepaNBYJlDSfjHtGMxnHN8A4bUiKLltH6tyPFrrvO6lzItF
         MXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380308; x=1768985108;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nn2P+cTkVwAykWlPC24DGRgRkCJONiMX3KadIJciMfk=;
        b=WBrhBxMI2X9yJkzmGiDbRmOJU92HAUY9HoGHH6ntaIc9rGI+aUzYeY4n5qc5Mdmc1+
         zu3LKcx7Alz9QPELE5S2/NzW7VKCQiH44jXmdU6DWkYVVXyWgCErbewXAcMQ3rzaw7Mw
         4sZWkablbFmmkFbeGxBKNEyA0/lVZAuiw9GS+8R+ZMRPOVTDlvT9q6JfYn7cV3nSjwBB
         UxnMt8zOmYzeE/3NVfYeLAgqL5RZbeGjD35UkpMDeKzS+KKUK/bChss7M6diKtYHQJ3r
         SiMHcVjnbQOhplzSyfuICNKZgzb+6+nbvoB00oJO6Zka+opV2QAspmSeamADVfb7Kgpl
         LEpw==
X-Gm-Message-State: AOJu0Yze1pAdSmoFVjiF3srOBoyGkxoI3079UnCWl0NJfC/XZXCQRlgG
	4VPf6V04ffzaEB2Wn/tFqBh3UJZWcAaDvXDd+m5EzrGscphk8Z1fUHstVrlvQzlyYB0=
X-Gm-Gg: AY/fxX5lIZzQ0N5oMcoX6J1CuRQB9VOzQBrxe4QBEIJrW4aSXu66dds/FEUN8ztgtRw
	hZNuadvX7CKlKCGmudgoTsbjnjPAJRH6fVimEXYHROSZnx7EOMkDTmng8E6tDGunGU9JPa+PwOk
	v0q4FDkoyYqbnSnQnPh91t7BVHa6IWeBfbIFGofZ9reZJtZfc4BCs46OZuszcLOHK79Kbmtfbxq
	dkV6kUnGsSy0OUycGt0X776p+pSlgfxaCmSP/HoaDNuNb88MGmMi22qs3qbn5/z4uT+Hd/VwqFS
	qCKstd0HR5x+n8O/A/GmP2+rUXtmVRVe6N19155YgUwPUpQndEbJMHdS1jqrpIYFY5zpxbdmTUQ
	mFBKcAkmVDugsuuBnijPuThQbpeXd5FhXX67pCmHhcjuw5Be/749fqcAyD1BNvUh8pT5D2q842F
	zdCQpObSFuB0D6OWXdJQudIqmLhJHp8oGoLohjsPxafxmmPi9ExIbJ85JcJJ+RSkA=
X-Received: by 2002:a05:600c:870b:b0:477:7b72:bf9a with SMTP id 5b1f17b1804b1-47ee338a737mr19695785e9.28.1768380307818;
        Wed, 14 Jan 2026 00:45:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm16475575e9.6.2026.01.14.00.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:45:07 -0800 (PST)
Message-ID: <e879d3a1-45d9-46f0-adaf-6bea243ab807@linaro.org>
Date: Wed, 14 Jan 2026 09:45:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
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
In-Reply-To: <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/14/26 07:37, Akhil P Oommen wrote:
> On 10/22/2025 6:14 PM, Neil Armstrong wrote:
>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>> full performance:
>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> In order to fix this state and allow the GMU to be properly
>> probed, let's add a proper driver for the GMU and add it to
>> the MSM driver components.
>>
>> Only the proper GMU has been tested since I don't have
>> access to hardware with a GMU wrapper.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>
> 
> Niel,
> 
> Could you please send the follow up revision of this patch? Lets get
> this fix merged.

I'm really struggling on the separate_gpu_kms part, it's not trivial at all.

I'll try again and report my current status.

Neil

> 
> -Akhil.
> 


