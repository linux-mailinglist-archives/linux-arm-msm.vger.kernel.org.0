Return-Path: <linux-arm-msm+bounces-33612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831829958F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 23:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D021C21652
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 21:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469B4215F53;
	Tue,  8 Oct 2024 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="iMrmLS85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DF5213ED6;
	Tue,  8 Oct 2024 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728421821; cv=none; b=PMSmSjTLLqTeT8NbtAGfebFPAqKmg2h+E7FxYNdRwA1Z02+iGtpvonocC5Y0p1R4m1LZ0R06B2ilaxIu/YWzJFdVC3O69B36ce7X/M4RmoTIgzJ0SrkNDUFd3LKTbEEzjy1v6N8X3M4C0aZRJcLIt1cB1GgO4bwCyhWrnfdYhMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728421821; c=relaxed/simple;
	bh=lp34xle93S64JDLrFewD47jcAq158vsvHfk6XjoYYqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRZIs3dROzz1LiAW0BOa7J/7flq55Wi33ml+cMCPq0hjdSKGd9UmiJPoRcy/Pb0YlAeqeRJkDXk8j8REiE5kxbftORTeBjkpWhP1AJChDHsFeF7rFO6g1cpK0fufnobcVPqYwfHm3uUH848swBK71eVVRYDZZ0CvPFBCv4OheoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=iMrmLS85; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1728421817; bh=lp34xle93S64JDLrFewD47jcAq158vsvHfk6XjoYYqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iMrmLS853loo0HAldVopE0pLNxAhpMt24hXWKsvcwmLTsDeZSG04JOrEnQzzfggRM
	 ofvMczhyer48zQmPTwav/TKFaxsM+EIr3gfFL4XT70bkSsmLLPGFNJ7WjavDMoMXCM
	 XQj1sjDApUXfQPp+bZ9WnjJA9yXBjNE/hIClhpddnYP9KfkxP0YeMO/au0d56okYC/
	 qkQxZSz5pjO76hqsBrUoSvDeO2xJn75o6Qu7EDdM0HN/Dudg+Kzas2c6zOezzHn4Bn
	 5jvoz2IBa5x8DhtrRiA9lEciZ/UWnlwAI3PGdL4AtFfyu4jXOV5J2k9oDKeVFTwzPh
	 mo8xWu4/HRz3OP9zDqYMRDBMRIlNnwV3+AIOeQdvulDyarO1aThWhkV5pAuVhXcUA+
	 +pqKIRRBEC+v6oZ/v7kD2bDp0laVA6SrCU4fFKgDQefPxpu9jw3yMbYqwcIREvi0yc
	 AuuImkurDVtHLpF1zlV80lmB3YzYkWGNusrV3ztK3u1DWiojUqrYdfoyuNTXhBHF0B
	 CmQueOQvzubkRB4/wkqS/xyXAQS7QeAZB1u41plaYuyhn3uT/u1+TkUiBqlpaazMSU
	 tkjLb6hx2PgM+lGKL6qNtLeILttuJOm75VODMsxHEkzkCRln8oiywPxcg1ftROmPM6
	 J4Q+Tp55TrdaQoWq+2JNaWVc=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 0420C16B16D;
	Tue,  8 Oct 2024 23:10:16 +0200 (CEST)
Message-ID: <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
Date: Tue, 8 Oct 2024 23:10:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
> Add trace points corresponding to preemption being triggered and being
> completed for latency measurement purposes.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -7,6 +7,7 @@
>   #include "a6xx_gpu.h"
>   #include "a6xx_gmu.xml.h"
>   #include "msm_mmu.h"
> +#include "msm_gpu_trace.h"
>   
>   /*
>    * Try to transition the preemption state from old to new. Return
> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>   
>   	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>   
> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> +
>   	/*
>   	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>   	 * is skipped due to it being already in flight when requested.
> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>   	 */
>   	ring->restore_wptr = false;
>   
> +	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
> +		ring ? ring->id : -1);
> +
There is no need for the ternary operator. "ring" should be non-NULL, 
otherwise the code would have already crashed.
So the change can just be
     trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
-- 
Kees

