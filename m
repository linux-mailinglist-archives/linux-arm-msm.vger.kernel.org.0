Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231FC22145C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 20:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgGOShy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 14:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgGOShx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 14:37:53 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FB4C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 11:37:53 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id k18so2507145qtm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wu5L69ovDWpf3LlRTghHvSZ9xDVM0oBpBNBxh9J31aU=;
        b=X41U7h2bTsN1nK0Puc/tLb924o67b+2UV9G0xJtvqBnjtGU2GJVoLTPmPc2FM+tUrb
         Yqa/M22owsTFVTn8qQuvMAhKKdbOchqlqkKcL3i9UZ7cUvoSJemVue+leOt2xxf4Udl8
         0QdSDzjGO8hph3oKTCCMmWEFoJT7nzr3yBVxVmuVLny7X4bnY73FE7kXEKyzlggqVxvG
         ilX0nPTbXIaLsc5zdeyl8IwR+yURCMy/1WPaHPWiskOYpN8t4ShR35rLkwoy8ME/5pnH
         P+ys0a1HCyZMA23ZGY+NOI1MtM773J6j+OiXsBamFl5mwJG04FdBbpXcVaX0EsJ17Cia
         EHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wu5L69ovDWpf3LlRTghHvSZ9xDVM0oBpBNBxh9J31aU=;
        b=XqFIQJI/qVYihA0kDHZ9zhsolAwrJDLbnyOmX8DuQ/PZVa27FzrJm+twEigiy5HOV4
         Fmn2JMpb+l4NRPRJRU6ftcO2lTcX+AqTS+9tf2P8ciTDGwJnjCD+jr+wMOaYQidU1q5D
         sUtmAEtW32ib5ljISKxvDb7/aZwd6ukCgWlQalWA4vQrXYmQA7n/kisjjv0fX2oHk+3B
         4+Y8WQAHWUEpNF78PIUg5vPpRPI8JxB/rfsL9W1F4aJAyq3I7wAgIM6nCEsu2doDlhYK
         2Gr1ES3YUV/2Taf3dExrdOVKd6zhwwFNHMMT2eBfGG85u95+0YKlCoKIBm4Iku9PRoa6
         uGAA==
X-Gm-Message-State: AOAM532wE6zRcx8sC3ApsPTfRA1ZmAOTdiZL49QQjBm9UhdLdL1frLZl
        0cNQSxo2fVGRCpgBCx4HZCxZGA==
X-Google-Smtp-Source: ABdhPJz3H5u/h/w/d+GjGc1uZlqsx1rCJM9E4KLLiOaeaJjvmt5xA4eeQYXiFdMY+OuSMREJ5zLqug==
X-Received: by 2002:ac8:5542:: with SMTP id o2mr1219868qtr.47.1594838272913;
        Wed, 15 Jul 2020 11:37:52 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id z60sm4010802qtc.30.2020.07.15.11.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 11:37:52 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        John Stultz <john.stultz@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200715182955.3081774-1-robdclark@gmail.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <baef95e0-e44f-be7d-f60f-0ba75b550050@marek.ca>
Date:   Wed, 15 Jul 2020 14:36:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200715182955.3081774-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/15/20 2:29 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If there is no interconnect-names, but there is an interconnects
> property, then of_icc_get(dev, "gfx-mem"); would return an error
> rather than NULL.
> 
> Also, if there is no interconnect-names property, there will never
> be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
> instead of -ENODATA.  Just don't bother trying in this case.
> 
> Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0527e85184e1..c4ac998b90c8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -979,6 +979,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	struct adreno_platform_config *config = dev->platform_data;
>   	struct msm_gpu_config adreno_gpu_config  = { 0 };
>   	struct msm_gpu *gpu = &adreno_gpu->base;
> +	bool has_interconnect_names = true;
>   	int ret;
>   
>   	adreno_gpu->funcs = funcs;
> @@ -1005,12 +1006,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   
>   	/* Check for an interconnect path for the bus */
>   	gpu->icc_path = of_icc_get(dev, "gfx-mem");
> -	if (!gpu->icc_path) {
> +	if (IS_ERR_OR_NULL(gpu->icc_path)) {
>   		/*
>   		 * Keep compatbility with device trees that don't have an
>   		 * interconnect-names property.
>   		 */
>   		gpu->icc_path = of_icc_get(dev, NULL);

This is misleading because if it gets a EPROBE_DEFER error (or any other 
error), it will hit this path. Maybe there's a specific error you can 
check for instead to identify the "no-interconnect-names" case?

Also don't think its a good idea to be calling of_icc_get(dev, NULL) 
again when there's a EPROBE_DEFER, the interconnect driver could come up 
between the two calls

> +		has_interconnect_names = false;
>   	}
>   	if (IS_ERR(gpu->icc_path)) {
>   		ret = PTR_ERR(gpu->icc_path);
> @@ -1018,7 +1020,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   		return ret;
>   	}
>   
> -	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +	if (has_interconnect_names)
> +		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +
>   	if (IS_ERR(gpu->ocmem_icc_path)) {
>   		ret = PTR_ERR(gpu->ocmem_icc_path);
>   		gpu->ocmem_icc_path = NULL;
> 
