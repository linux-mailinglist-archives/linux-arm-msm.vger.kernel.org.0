Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251DE45C8EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 16:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239302AbhKXPoe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 10:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344435AbhKXPoH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 10:44:07 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAFBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:40:56 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t26so8283848lfk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ct6e7raFIfJnrSO6761xJZnYXxwRFHc4ll3Hg+6j23I=;
        b=e0yHJ/2cNOU3Q3MfWPzshVL3y7RJLzdbpY4Yj+RpFFz1fDpiXxQluXirFlbwhU3AoL
         LVDrhitfuMA5B66OAp9IwH/ojRHJBOjennAQ8zrqdPgbMFJ52B8cC9ga1TQmmthvpOVZ
         MFoJc6/TEvuPGnZq4aZLE2dsHo23kljpgjziZqw5nNvOzDh3DfnZBCZfXpcHtF4Dah8U
         N8Pv3NRO9Of1qO9LfV5+1mS88mATRCza4D2IoJxCUg+0BPp3Fojfl3KBqyZ0UkKUUr2J
         Mb9cuagPbjF966Q0rpqWMk+axlEo41sjHRYwXsoOm+fyLiknITXQWjrXyDi3mSVIm+ho
         uhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ct6e7raFIfJnrSO6761xJZnYXxwRFHc4ll3Hg+6j23I=;
        b=oT9f5ZEZjLCzodCES9HpilBmnHvTst/tTGLOI9rnVrWxrtYGGX100TbsugzqLXrr5C
         d9St29P1+0eKhUWdXi+yYq0AN8hZENJvDkx7dc0yvtPelv+APL795wOqWbV4wqSMKMkr
         e6bra6XR8rlWbpDjLcKKoTMkVTwpaaKjD/oUfyX2Ix9HfvcNo0sycSWtCkgauKclRcfJ
         nolKvWuxDQ96LJJFziTog480xe5qDxgFunEnoXNjibTDuWR7ShlU7Die3mbEiPpSd3Cl
         ORQqgKL8DYXM+6SRixXn4k+fywgQ5QSBDLEcnIHa9ZKuC/vXWlgJySujqGpw8x0eVP3T
         SBjA==
X-Gm-Message-State: AOAM530lq5QAA77kwIyStQpBmmpKNBd29fhG0o9Ju2ErAx8UsSPFdPp3
        hE6wpyxFEvBgWp6GHx9+sdJLhA==
X-Google-Smtp-Source: ABdhPJx9LId8LP06Ry3fcdy7LIKYvSMhClBVAGTV/+cQ3EQDpxhxCuri2bUz4bXgF/Tfgmk8DMtt/Q==
X-Received: by 2002:ac2:515a:: with SMTP id q26mr15625028lfd.658.1637768455296;
        Wed, 24 Nov 2021 07:40:55 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p3sm13990lfg.273.2021.11.24.07.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 07:40:54 -0800 (PST)
Subject: Re: [PATCH v3 06/13] drm/msm/disp/dpu1: Add DSC support in hw_ctl
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-7-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3e96567a-029d-69ca-4e28-47b3c06b1351@linaro.org>
Date:   Wed, 24 Nov 2021 18:40:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-7-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2021 09:22, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> bits so that DSC would work there as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 36831457a91b..66b0c44118d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -25,6 +25,8 @@
>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>   #define   CTL_INTF_ACTIVE               0x0F4
>   #define   CTL_MERGE_3D_FLUSH            0x100
> +#define   CTL_DSC_ACTIVE                0x0E8
> +#define   CTL_DSC_FLUSH                0x104
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -34,6 +36,7 @@
>   
>   #define DPU_REG_RESET_TIMEOUT_US        2000
>   #define  MERGE_3D_IDX   23
> +#define  DSC_IDX        22
>   #define  INTF_IDX       31
>   #define CTL_INVALID_BIT                 0xffff
>   
> @@ -120,7 +123,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> -
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>   				ctx->pending_merge_3d_flush_mask);
> @@ -498,6 +500,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	u32 intf_active = 0;
>   	u32 mode_sel = 0;
>   
> +	if (cfg->dsc)
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> +
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -509,6 +514,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	if (cfg->dsc) {
> +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, cfg->dsc);
> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> +	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> 


-- 
With best wishes
Dmitry
