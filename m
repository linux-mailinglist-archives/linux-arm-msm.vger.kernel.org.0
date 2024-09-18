Return-Path: <linux-arm-msm+bounces-31948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19197B8BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 09:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68C9EB263A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 07:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E71741C8;
	Wed, 18 Sep 2024 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eg+y7d5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE2172BD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726645599; cv=none; b=a5WS73RDmiPbZpdkaE/mUSYZyqXmTFjI51aGI5uY/kr47pRsUx/wETG6eyxn4g478GcpzkOPFPcyGosVKAAy0J2ToWnFcBUMNGbVkNi19/ZHxuajy2RDltMr77PT2lVc/ErGT5gHkxwyltpPkND9Ak+ctyYaJVEihwFkWICRssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726645599; c=relaxed/simple;
	bh=u0YwTtmM57VeJdosy4dRHWDV2Ad4X+RMY6+Qg7YrRrU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LJZT2AguXE5WfuJQYeVOACRsUlqrB7779tBCTXAW9QIHzjJwAvK+kHdS63jRGACvMPN2j39qKpVDfgnTCv1mA2kLt46ixZtxej0p6N1TR97Vq4P5xZvoyvk6OAyiaw6gQCroJNIGq2qoGPyMSzSNzk4OwUV2G619VF7UIU8FPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eg+y7d5K; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374c6187b6eso4734946f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726645595; x=1727250395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQaTzkrOq6/kp5cHVFWeOEqBCRfMHF8F0wy39Qy5IOI=;
        b=eg+y7d5KpRb5gRMtX0M84dOL9pGOlEIiqQMCOO3D/5daYvHptdVccIouk7xmm9UJjO
         UdVi6MkAx+n3zQ1Au06yybb4COsXwIGgNSEaJ+6ljNyRKUHRonE2tdFxwxxiKhTiwRqW
         VMB7DBJ6/ilkkXV8v8fVvUARUxRmXhkhr9PSeuwG7RGN+mG1pwRl6XlO97lvwoZlU79h
         bicaHJvq9dTrurwIRaenouPR90d0Kk73p4+k6wMMIg2su4SetO3Pe0pALAChCja0Ss6O
         cE8TIISYpnQTa9FpQMjcd2TRXdPUAYfog8ktkz0hgTXdWa7u/RL9sh4T+KEcQRQ/p2an
         2ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726645595; x=1727250395;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gQaTzkrOq6/kp5cHVFWeOEqBCRfMHF8F0wy39Qy5IOI=;
        b=OFEyNf/0F+iI+Kn9p7Cvp0ZdGTbDdWR1eXDlXRQ3OacCSqbx1zIcxZvcrrmfx92+Xk
         QPgEbAPLuIYEKMltfPlks9T7wSSgQRD4ie6zar7szgkKCJH1V3VNpu0OcH0ZrhnHhdlj
         C62Bm0Ikwped0DeSG5R3zAxz3ZHrErmsBMLBJzNhqydxhW1JeqLBS/3i34dONKJmxNKp
         qdVZYTzoaZRj2Xzn9S0latky63GRI7GpWnrZlRUPdqovUnddgJXAKBPmsce8HxVUDTg5
         6M+InjnRirIyFDeO7c8gFOsAhqHOT++4iASaVDsYezbr3l0WlKaEZlyahBZu9Lo294IF
         Yx+g==
X-Gm-Message-State: AOJu0YzVpRBge7hQUK/6/OB3oe6lEW9HDehYKx5H89v1pXAN+ANiCWhB
	zWWQoYZxHMd3OhRV8QRTRaNCkULWvb+Smxy7SAFHHuCOqrsgnK8lCyg0+yiny2E=
X-Google-Smtp-Source: AGHT+IFSBQGV1AzgNI2mA8AdseO6QLgeyWriBLHes7xom/Y+b7LQ1ve9cGz8O4B1KR1An09BGC6n+g==
X-Received: by 2002:a05:6000:4581:b0:374:cbc4:53b1 with SMTP id ffacd0b85a97d-378c2d5b269mr12250427f8f.40.1726645594641;
        Wed, 18 Sep 2024 00:46:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2782:e782:f1c:dcad? ([2a01:e0a:982:cbb0:2782:e782:f1c:dcad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e70509220sm9678365e9.28.2024.09.18.00.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 00:46:34 -0700 (PDT)
Message-ID: <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
Date: Wed, 18 Sep 2024 09:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/09/2024 13:14, Antonino Maniscalco wrote:
> This series implements preemption for A7XX targets, which allows the GPU to
> switch to an higher priority ring when work is pushed to it, reducing latency
> for high priority submissions.
> 
> This series enables L1 preemption with skip_save_restore which requires
> the following userspace patches to function:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> 
> A flag is added to `msm_submitqueue_create` to only allow submissions
> from compatible userspace to be preempted, therefore maintaining
> compatibility.
> 
> Preemption is currently only enabled by default on A750, it can be
> enabled on other targets through the `enable_preemption` module
> parameter. This is because more testing is required on other targets.
> 
> For testing on other HW it is sufficient to set that parameter to a
> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
> allows to run any application as high priority therefore preempting
> submissions from other applications.
> 
> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
> added in this series can be used to observe preemption's behavior as
> well as measuring preemption latency.
> 
> Some commits from this series are based on a previous series to enable
> preemption on A6XX targets:
> 
> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
> Changes in v4:
> - Added missing register in pwrup list
> - Removed and rearrange barriers
> - Renamed `skip_inline_wptr` to `restore_wptr`
> - Track ctx seqno per ring
> - Removed secure preempt context
> - NOP out postamble to disable it instantly
> - Only emit pwrup reglist once
> - Document bv_rptr_addr
> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
> - Set name on preempt record buffer
> - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com
> 
> Changes in v3:
> - Added documentation about preemption
> - Use quirks to determine which target supports preemption
> - Add a module parameter to force disabling or enabling preemption
> - Clear postamble when profiling
> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> - Make preemption records MAP_PRIV
> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>    anymore
> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
> 
> Changes in v2:
> - Added preept_record_size for X185 in PATCH 3/7
> - Added patches to reset perf counters
> - Dropped unused defines
> - Dropped unused variable (fixes warning)
> - Only enable preemption on a750
> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> - Added Neil's Tested-By tags
> - Added explanation for UAPI changes in commit message
> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
> 
> ---
> Antonino Maniscalco (11):
>        drm/msm: Fix bv_fence being used as bv_rptr
>        drm/msm/A6XX: Track current_ctx_seqno per ring
>        drm/msm: Add a `preempt_record_size` field
>        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>        drm/msm/A6xx: Implement preemption for A7XX targets
>        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>        drm/msm/A6xx: Use posamble to reset counters on preemption
>        drm/msm/A6xx: Add traces for preemption
>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>        drm/msm/A6xx: Enable preemption for A750
>        Documentation: document adreno preemption
> 
>   Documentation/gpu/msm-preemption.rst               |  98 +++++
>   drivers/gpu/drm/msm/Makefile                       |   1 +
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>   drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
>   drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
>   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>   drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
>   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>   include/uapi/drm/msm_drm.h                         |   5 +-
>   20 files changed, 1117 insertions(+), 66 deletions(-)
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240815-preemption-a750-t-fcee9a844b39
> 
> Best regards,

I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 from Yocto)
on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in default value
and forced to 1, and I've seen no regression so far

On SM8550, I've seen a few:
platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Unexpected message id 2743 on the response queue
but it's unrelated to preempt

and on SM8450:
platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     completed fence: 331235
msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     submitted fence: 331236
adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 0000000000000000/0000
msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support.

So you can also add:
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK

Thanks,
Neil

