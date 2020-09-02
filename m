Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B177425B563
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 22:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBUlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 16:41:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23406 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgIBUlI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 16:41:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599079267; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ItMRyIeX4np4JSQjaT+BlHS0iWdkB//XkRrvXZ7e/40=; b=ctcDx1r10zaM64gNMHuBEA2Tr1kc3+8dn07VAuGWaXPR3ISDTqYO2Q+OFjuHMptzGUhIGUdo
 ++GPPTwgGrHeR8M0yx4gjHhc3vgcrrhM65Li3Dp5sAvAIxm0cG98CWWVujk2Yf1Qc9KUltSs
 zaw8S8nlJMljuJQh7XGFYXe1EX0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f500353238e1efa372b6a8f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 20:40:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79A60C433A1; Wed,  2 Sep 2020 20:40:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F17FC433CA;
        Wed,  2 Sep 2020 20:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F17FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 2 Sep 2020 14:40:45 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/msm/gpu: Add GPU freq_change traces
Message-ID: <20200902204045.GA22040@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901154200.2451899-1-robdclark@gmail.com>
 <20200901154200.2451899-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901154200.2451899-2-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 01, 2020 at 08:41:54AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Technically the GMU specific one is a bit redundant, but it was useful
> to track down a bug.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +++
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 ++
>  drivers/gpu/drm/msm/msm_gpu_trace.h   | 31 +++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 46a29e383bfd..ab1e9eb619e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -11,6 +11,7 @@
>  #include "a6xx_gpu.h"
>  #include "a6xx_gmu.xml.h"
>  #include "msm_gem.h"
> +#include "msm_gpu_trace.h"
>  #include "msm_mmu.h"
>  
>  static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
> @@ -124,6 +125,8 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>  	gmu->current_perf_index = perf_index;
>  	gmu->freq = gmu->gpu_freqs[perf_index];
>  
> +	trace_msm_gmu_freq_change(gmu->freq, perf_index);
> +
>  	/*
>  	 * This can get called from devfreq while the hardware is idle. Don't
>  	 * bring up the power if it isn't already active
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d5645472b25d..b02866527386 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -32,6 +32,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  
> +	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
> +
>  	if (gpu->funcs->gpu_set_freq)
>  		gpu->funcs->gpu_set_freq(gpu, opp);
>  	else
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index 122b84789238..07572ab179fa 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -83,6 +83,37 @@ TRACE_EVENT(msm_gpu_submit_retired,
>  		    __entry->start_ticks, __entry->end_ticks)
>  );
>  
> +
> +TRACE_EVENT(msm_gpu_freq_change,
> +		TP_PROTO(u32 freq),
> +		TP_ARGS(freq),
> +		TP_STRUCT__entry(
> +			__field(u32, freq)
> +			),
> +		TP_fast_assign(
> +			/* trace freq in MHz to match intel_gpu_freq_change, to make life easier
> +			 * for userspace
> +			 */
> +			__entry->freq = DIV_ROUND_UP(freq, 1000000);
> +			),
> +		TP_printk("new_freq=%u", __entry->freq)
> +);
> +
> +
> +TRACE_EVENT(msm_gmu_freq_change,
> +		TP_PROTO(u32 freq, u32 perf_index),
> +		TP_ARGS(freq, perf_index),
> +		TP_STRUCT__entry(
> +			__field(u32, freq)
> +			__field(u32, perf_index)
> +			),
> +		TP_fast_assign(
> +			__entry->freq = freq;
> +			__entry->perf_index = perf_index;
> +			),
> +		TP_printk("freq=%u, perf_index=%u", __entry->freq, __entry->perf_index)
> +);
> +
>  #endif
>  
>  #undef TRACE_INCLUDE_PATH
> -- 
> 2.26.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
