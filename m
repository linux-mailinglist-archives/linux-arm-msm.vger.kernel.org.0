Return-Path: <linux-arm-msm+bounces-72622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3899B4969A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7095E165535
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53FA3126AF;
	Mon,  8 Sep 2025 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IsTeU0Pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E146130E0D1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351485; cv=none; b=KyYby4ZLVCnEXCkzHabd7g6MoUvDVzWVFuxGwzjxiTZxVXF/IyuGQN+I5LfH/HmOHxqSNLD1JqivoDWSFLaAZ0h+d/oRWNxh4ZiVTuEGijjmRQmH/oUmo6Qv1vI/UzX9NxY2rRnt/0WDcpF1byYAn7swfyrOnlk7RRAC/NuA2oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351485; c=relaxed/simple;
	bh=DavoxOhjLPcLDMahL3Y9U/VbM03JitHAgDMsWBFVdO0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tZB2iFzWAYFmtMPMv2ygO8Yi/ZYo7sfW4O116O9uccybMWcNu49cMID5wK1IKvOchcxt3e+/ITzMInfDb55vF/laY0MZSVueuU5mbE8UfkC8a1V/j+BHnYIVpfMcuGi6OVgj2u9A1C7hAbGl5mPIfSYipzPMMMPoGljyTMKyQtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IsTeU0Pm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3db9641b725so4735789f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757351482; x=1757956282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXRt87N5KcbZYpVffvCLbSJic16B7wGhz6E/yGN+Uxg=;
        b=IsTeU0PmzwSYDbg3EIr3zQLnnf0NAyu84FP2kNyCbJvnuGT0pWQN0tYhfZesdCK+jJ
         owCDBZ5MrzTyU7GtP65hf7XsbgZD5bzLZAJTDl4OYpCAWyPHy027Uo9hEL644atQMG46
         JjOYuYgVBhvBh86fcyS80xnKbQsAdr5K+hLiZQr7Uw4rdVBXiLdnHlo2KAINc14viD60
         1gAxsy15XxGLJy4HB5apgJR/CpJU6DG5ss4to+aPE/YZFeMEURMJvQAWbTBYLX9ACk0J
         JqLHOv3a7G0WRBYJrHPgaQYwYoAkEzBItr5H+MZ+Th6AodrwBBq47TsZhFg7LnJ4G3Pj
         FaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351482; x=1757956282;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JXRt87N5KcbZYpVffvCLbSJic16B7wGhz6E/yGN+Uxg=;
        b=WDQUIyPOBjwRc9/d71LiUOhQ60FP+Y681CLOgoxXQiGq9Ig+zGyyE1y4ZMs72PP46K
         tyfKP+3UszdWduFhs+f7eLkRHdlmR34IR00Nxxtv9t+gVYYMnOXO6gs2x/rjOnxU45Q+
         +V4ZdZ1RcB3h/2ZO0bx8s3l0eg0oB9M1Vu5MFl0821VVjbKVG4vxGIvvd+GEXw2AM34x
         r55gglmWI/71z/BzT9yd9bo1T+yRVe4xZO7jK+rm7nGIGzwcHONcKQ+OiMNI45Y9nbiY
         1uKmDiak4jRZv36v6d4F3EHCKIYSmIRpaCjKzocbIYMQNGL0C6fWhf1wW9Af1lJ2gtU1
         kIOg==
X-Gm-Message-State: AOJu0YwdxBijHtEuexptbj/t1XBjIKPZTDg+1GzJGKgDOyu4Noc6QNpv
	SNwnEgItU/M8IhwjgSB0336EwKGYZcO57NkXCQIcv3/whPSrwIitLaiMd+m6e/Pb4Hc=
X-Gm-Gg: ASbGncvWPe5nmwWJOe2Uo+SW2mwVb3Mb0defYtkGgNl0ESWcNPwpWp04GArlK3vyW4J
	nEX6tuDdbafv3DQG/UaZpW0U3VBbNW8w2PcaTbazI/Ak7dUFGVNbGyE7K6/RGLPvLSIHwTZ7EfZ
	ej3fHBeNjN95lHTd6ZLeEB026AxZZe6NTKD6B7KYefmbEbiM/pNM+bKObRaqfzQW+yIAPOVhCfM
	6AO0QdMrh9dzcqlSMxuCG5X7jMMy+0jfEMqsB8JrjXKRanp5qJdIhwyRrIfbbiaZsRkushrqh1R
	8XX7WzocYXbIubxddrqbtr132AZl8b6VU7MsVPoicpPne998a3pxr/Nnr/p2s0xF80akiYCgQfe
	omKfZfnE2h3WzkVxOMfmhBoiBrspfG+mk973rUXRy5HAz225gh9hvaKIhdazESS8wrytpCjLGlw
	I=
X-Google-Smtp-Source: AGHT+IEg/f9S1DLAfQQk3JRLZENFZPwKbjav2YVjwZU30nhH+LDJfuSBQA045+uH1/8zST8dM70ckw==
X-Received: by 2002:a05:6000:230e:b0:3ca:3206:29f with SMTP id ffacd0b85a97d-3e642f91891mr7571829f8f.40.1757351482100;
        Mon, 08 Sep 2025 10:11:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:61c1:5d31:4427:381b? ([2a01:e0a:3d9:2080:61c1:5d31:4427:381b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33add504sm41829503f8f.30.2025.09.08.10.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 10:11:21 -0700 (PDT)
Message-ID: <6fe68880-44a4-4b7e-a978-2c65d50f018c@linaro.org>
Date: Mon, 8 Sep 2025 19:11:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/16] drm/msm: Support for Inter Frame Power Collapse
 (IFPC) feature
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
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
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2025 10:26, Akhil P Oommen wrote:
> This patch series introduces the IFPC feature to the DRM-MSM driver for
> Adreno GPUs. IFPC enables GMU to quickly transition GPU into a low power
> state when idle and quickly resume gpu to active state upon workload
> submission, hence the name 'Inter Frame Power Collapse'. Since the KMD is
> unaware of these transitions, it must perform a handshake with the
> hardware (eg: fenced_write, OOB signaling etc) before accessing registers
> in the GX power domain.
> 
> Initial patches address a few existing issues that were not exposed in the
> absence of IFPC. Rest of the patches are additional changes required for
> IFPC. This series adds the necessary restore register list for X1-85/A750
> GPUs and enables IFPC support for them.
> 
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Antonino Maniscalco <antomani103@gmail.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Antonino Maniscalco <antomani103@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Elaborate commit text and add Fixes tags (Dmitry/Konrad)
> - Document GMU_IDLE_STATE_RESERVED (Konrad)
> - Add a memory barrier in fenced_write
> - Move an error print in fenced_write to after polling
> - %s/set_keepalive_vote/a6xx[gpu|preempt]_keepalive_vote (Dmitry)
> - Add an "unlikely()" to read_gmu_ao_counter() (Konrad/Rob)
> - Define IFPC_LONG_HYST to document a magic number
> - Add a new patch to enable IFPC on A750 GPU (Neil/Antonino)
> - Drop patch 12 & 17 from v1 revision
> - Link to v1: https://lore.kernel.org/r/20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (16):
>        drm/msm: Update GMU register xml
>        drm/msm: a6xx: Fix gx_is_on check for a7x family
>        drm/msm/a6xx: Poll additional DRV status
>        drm/msm/a6xx: Fix PDC sleep sequence
>        drm/msm: a6xx: Refactor a6xx_sptprac_enable()
>        drm/msm: Add an ftrace for gpu register access
>        drm/msm/adreno: Add fenced regwrite support
>        drm/msm/a6xx: Set Keep-alive votes to block IFPC
>        drm/msm/a6xx: Switch to GMU AO counter
>        drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
>        drm/msm: Add support for IFPC
>        drm/msm/a6xx: Fix hangcheck for IFPC
>        drm/msm/adreno: Disable IFPC when sysprof is active
>        drm/msm/a6xx: Make crashstate capture IFPC safe
>        drm/msm/a6xx: Enable IFPC on Adreno X1-85
>        drm/msm/a6xx: Enable IFPC on A750 GPU
> 
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c         |  71 ++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 105 ++++++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  14 ++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 221 ++++++++++++++++++----
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   3 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c       |  10 +-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  34 +++-
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c         |  40 +++-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   1 +
>   drivers/gpu/drm/msm/msm_gpu.h                     |   9 +
>   drivers/gpu/drm/msm/msm_gpu_trace.h               |  12 ++
>   drivers/gpu/drm/msm/msm_submitqueue.c             |   4 +
>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  11 ++
>   13 files changed, 459 insertions(+), 76 deletions(-)
> ---
> base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
> change-id: 20241216-ifpc-support-3b80167b3532
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

