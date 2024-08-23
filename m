Return-Path: <linux-arm-msm+bounces-29335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E7E95C7F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 10:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58BAFB24D5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 08:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFC9143875;
	Fri, 23 Aug 2024 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYx8GKtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C613FD72
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401383; cv=none; b=NlqrgRbUcsBj6UKwsa+fvRm37P2KDHFZpC2OpEQywi6+aWp76j5la7Bt6WMcC6xJ8pWZdKugfVIJMBymom+aPVpUCGl1Ac9KvO7N1mWbMLAWcV3WNNLuHyjsg1DxGMPEnxvN80Kmybu6DAy7zRiZBGwXyyYx8bZOcYcpCLC/Ozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401383; c=relaxed/simple;
	bh=meKlzzHsUw73VS4maSYzZ1ZNSe9fG9pNTCuxgTqSwmo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=flMtTUujD//kQ0faFEj+ySliZCpJs+rU6urEc76XmomuSjWjYeAtMzUVi2T/QMZ751mZ6VxIElQllTJgNCResOcTtKKtDUMOKx76WUtyrtGJLCz2BKcOHWKclVSlY1rTgSovLVM9yW68Svk5VDVcuEtRwhhivhCAVydBqYP/D7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYx8GKtq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so13016455e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724401380; x=1725006180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc4wLUWi1Q+2Pe5opNOMu1JRII1BPT5sStPy3UveR5g=;
        b=yYx8GKtqnIhcuKM2Gizuid8/bjCMJlBoO/jtnDYiViayGGqGYUhFCDB3S0CFxfEygr
         AK8k5iJXji2xsvBVG5Ps2IZQS9768NutZ8Q+w9zYTFpJ77+jw4VwRHWOzCTdEQ6t8hgD
         FEqa7ChKYesDthv+AexgFPk91ZXvv7d9jVtppKK+NcuPhZoJXfeYuveyTpmbefsb3+Rc
         Yxod6p27sUBXLkJhb2v/i14cIK1NTOIo4iwcn0yQdPKt3dEShkb28lZxNyUrQsQrzOtJ
         pGl3450PCDrDhzeJIFIff7CxtHMeoqWaQ+46hY72YWP0hgHkTig18hhQ2SvGUYE5mayu
         bJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724401380; x=1725006180;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qc4wLUWi1Q+2Pe5opNOMu1JRII1BPT5sStPy3UveR5g=;
        b=UJZ2xDiKDE7gSuBJNw8verQ7LQdjHqs39Klt4HkN3h8zBNTpI4GSc//qow5O3vzNfV
         SXGpJzl+Hmin34CsW01p9eaptcFXRQjZsJBdzuWAEsHFEL0d05BqsqH9Ab+Y+t/Kk5Mz
         DLXd1x2T1p6Q29cjpeK7w1T7xxH5XHCGhhJ3/tBOUmwLyKt0D7FTq9+ddrhcPYtMG3XP
         efISg9ooXuRJrHH1obNU64l0hL52c/gttSqWoizoZhWOC2lGKDCwqOqX1UOPcmg8NSkU
         W9pzlRSn/rfEgFKthBpS2KCDLlb6m30f+IwljT3z2kTC1WdAQ+Rt0DRKfef4NouFUEUK
         gFZQ==
X-Gm-Message-State: AOJu0YwPAfqm+1pe5w479bRYAJP4KrFxHuhwtC54lcyhFMM3Ez+vYxan
	lSaPibtGtECmVYb7Mp9sLbhXG7+aSGYzKbCy0fB6A24JW8xXoKmwEQKU2FmoNHA=
X-Google-Smtp-Source: AGHT+IGsJclyRKt8iDBR8hUT5br0NSiyxooWh2o8K/cqt5NhzX54de3+f5WlTDDBrQXur1IMfj43hA==
X-Received: by 2002:a05:600c:cc5:b0:426:54c9:dfed with SMTP id 5b1f17b1804b1-42acc9f66d1mr10896105e9.28.1724401379995;
        Fri, 23 Aug 2024 01:22:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:995c:3fea:6b19:4a51? ([2a01:e0a:982:cbb0:995c:3fea:6b19:4a51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac516251fsm50749625e9.25.2024.08.23.01.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 01:22:59 -0700 (PDT)
Message-ID: <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
Date: Fri, 23 Aug 2024 10:22:58 +0200
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
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2024 20:26, Antonino Maniscalco wrote:
> This series implements preemption for A7XX targets, which allows the GPU to
> switch to an higher priority ring when work is pushed to it, reducing latency
> for high priority submissions.
> 
> This series enables L1 preemption with skip_save_restore which requires
> the following userspace patches to function:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> 
> A flag is added to `msm_gem_submit` to only allow submissions from compatible
> userspace to be preempted, therefore maintaining compatibility.
> 
> Some commits from this series are based on a previous series to enable
> preemption on A6XX targets:
> 
> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
> Antonino Maniscalco (7):
>        drm/msm: Fix bv_fence being used as bv_rptr
>        drm/msm: Add submitqueue setup and close
>        drm/msm: Add a `preempt_record_size` field
>        drm/msm/A6xx: Implement preemption for A7XX targets
>        drm/msm/A6xx: Add traces for preemption
>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>        drm/msm/A6xx: Enable preemption for A7xx targets
> 
>   drivers/gpu/drm/msm/Makefile              |   1 +
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>   drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>   drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>   drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>   include/uapi/drm/msm_drm.h                |   5 +-
>   11 files changed, 995 insertions(+), 16 deletions(-)
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240815-preemption-a750-t-fcee9a844b39
> 
> Best regards,

For what is worth, I've tested it on the SM8650 QRD with the Mesa 30544 MR & vkcube

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

If you think of more tests to run, please tell me.

Neil

