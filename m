Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8382E45DAEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 14:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355398AbhKYNX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 08:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352149AbhKYNVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 08:21:53 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC03C06175B
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 05:18:37 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 207so12414165ljf.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 05:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7XBFggeh8IckItnr2Q57d0Mkoh9xBKhCLWH6EgGBPIo=;
        b=F0/ENKSmCv+SLaHXwzi0TugpqOvK2WTxkl+OGniIMywaJRz/GiNmXQP56IjV4S4f3I
         bUzwpfIeDw8BzrnYDfyoe/T8n5eNXqmSKeQpHz149MP2CLQzto9BOTOLAghj2IOXiJ82
         Et2VC9w1t8/he3CJZCUp9TGPR5V2pGF2UxByJnekM+FT2N1x82oSb284g9t/xTxLJF1Q
         /X0np7y+e5cNAcgRvcUvlzpzljsOsLkwFHcTuL/J8rtVz9SSaBu6dBww7qB/e9aYHd/z
         0C9cUlvfEEj4h/VujjyV3n9CXdBSCzvDHU57QwyUk1vw/jGZOPtEqoMz9dEgRrTDdxL4
         bVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7XBFggeh8IckItnr2Q57d0Mkoh9xBKhCLWH6EgGBPIo=;
        b=Bjb1VXsaekHj9p3ehKQMARpgP5KTEq1qCauUbBhPDEEsZzbUOSFAUYSfo8Bxig18Ay
         8nuz8/wwLS7z66i1Jqj0Lp+Nn8VhLIcVCEx/GKynE06RC/Z4WxdggN7fyC1S/VmTdBnd
         MWFEirakbGj2i8990OaWioX2zCa8BZobx/JhfHZNAoSi2HWFseIdTlhrqOOHgpEPVa5M
         On1vARq+prG+s0pwNzK8PWlHo+t/+Ow8FOcBb0wU2H4UEWpNH1VwfagIeYrv55mbjObo
         5LSRmp7yNXXbGttp7kepn+inAZpPmpncfMmC2+99tbs5U35ARj3FeIEGYFQMH9ps1X6J
         syow==
X-Gm-Message-State: AOAM531Cem0sDlYIFKla3rYIYwKBLP6ZryczFuy56YJwm8gzoEoz6198
        +ZS+bp+3pWPINR4ksd4JxiXMbA==
X-Google-Smtp-Source: ABdhPJz7os6YWpibVr7fl1dw2tPzTi3TG/9iIcoH5iXzKc1nYBgzFGeZa1zp0jk73DVdpbBUf9eO7A==
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr23996491lji.101.1637846315621;
        Thu, 25 Nov 2021 05:18:35 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k15sm260906lfo.239.2021.11.25.05.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 05:18:35 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Fix potential NULL dereference in DPU
To:     Jessica Zhang <jesszhan@codeaurora.org>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dan.carpenter@oracle.com,
        dri-devel@lists.freedesktop.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, abhinavk@codeaurora.org
References: <20211020183837.959-1-jesszhan@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c2ca794c-ae89-f018-1476-447bf4b2aba9@linaro.org>
Date:   Thu, 25 Nov 2021 16:18:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020183837.959-1-jesszhan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/10/2021 21:38, Jessica Zhang wrote:
> Add NULL checks in KMS CRTC funcs to avoid potential NULL
> dereference.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

I believe that single Fixes is incorrect here. For example snapshot 
support was added later. I'd suggest to split the patch and provide 
correct Fixes tags.

> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c      | 8 ++++++++

No such file.

>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          | 5 +++++
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c        | 3 +++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 3 +++
>   drivers/gpu/drm/msm/msm_gpu.c                     | 3 +++
>   5 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index d2457490930b..53d80572181e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -208,8 +208,16 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
>   	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
>   	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
>   			sizeof(struct list_head), GFP_KERNEL);
> +
> +	if (!dpu_kms->irq_obj.irq_cb_tbl)
> +		return;
> +
>   	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
>   			sizeof(atomic_t), GFP_KERNEL);
> +
> +	if (!dpu_kms->irq_obj.irq_counts)
> +		return;
> +
>   	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
>   		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
>   		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 768012243b44..0a1cad0cfcc0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -921,6 +921,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
>   
> +	if (!pstates) {
> +		rc = -ENOMEM;
> +		goto end;
> +	}
> +
>   	if (!crtc_state->enable || !crtc_state->active) {
>   		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>   				crtc->base.id, crtc_state->enable,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69afcbac8..09751b480db5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -92,6 +92,9 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>   	kfree(to_mdp5_plane_state(plane->state));
>   	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
>   
> +	if (!mdp5_state)
> +		return;
> +
>   	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>   		mdp5_state->base.zpos = STAGE_BASE;
>   	else
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index cabe15190ec1..71e209d07120 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -170,6 +170,9 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
>   
>   	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
>   
> +	if (!new_blk)
> +		return;
> +
>   	va_start(va, fmt);
>   
>   	vaf.fmt = fmt;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8a3a592da3a4..ddd23f3a4a99 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -296,6 +296,9 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>   		state->bos = kcalloc(nr,
>   			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
>   
> +		if (!state->bos)
> +			return;
> +
>   		for (i = 0; i < submit->nr_bos; i++) {
>   			if (should_dump(submit, i)) {
>   				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
> 


-- 
With best wishes
Dmitry
