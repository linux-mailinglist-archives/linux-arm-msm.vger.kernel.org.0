Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC9042DB1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 16:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhJNOJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 10:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJNOJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 10:09:02 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354B8C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 07:06:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so27775206lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NmsJjrVQJSlytBdvRLJ3ylqzzRy6zWoqsrRac2baw+c=;
        b=sb7T7XzNrVtwl4mRGWO4qD1nEdPKy7Kx1pkV2JH/REWHrjss75eGRBgsiRxcUq70Ao
         puQfNnsGz8tgygFBblTZcnT/TfI3yPsuZQFtJDZGRVqsNtXpAOSuI+pJMbJPu7l5ilV7
         A09cLsg/I4Q1NYjIqXx+ea4pyz9bWDfko1Pg04XELVMJ8rxjos5O97yIhYjaKfXB+xDL
         YQtmmszU1/L43CHRHa98ZKfGkIKXxNbzFtlLhy7IRGdbfy5XZqd+MIMHsIQN1xutcjVY
         Azh+cVR3qkIeHjmarxZ/RyeptC0WO27fpFKhsKCLHVyGFYXBSj0IcBgtoFWzF7OuFqxt
         Y4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NmsJjrVQJSlytBdvRLJ3ylqzzRy6zWoqsrRac2baw+c=;
        b=lnVJ7cG/yKfSGoxLbCdi1p5NJJWaGuLH9JJ0UK0H4dtu4bpmVoDoMxmZ0IZy06wxcJ
         AqsB3TOX33mwVUKh+R1hDSwTDo5FweWqP9LPX0Jq9jDnIEyz5CHSVH60u+P8Jw90Bd5w
         UHYjdQDiucubtfh6mwcTQQqAiUSvHMS0KKFUD1LbzCStEK+Mj/Cdbg74Zuz4ph+hOadQ
         e/Eaq8Y34qC1r8XtAlqvUeh3073mMGj93KtvyPq6LTYaiiZWuVRV73ZQCFR9I9txHBm0
         ssl6VXI4xY0FUr1AF6H+m7IZfhQ8iIh+jAGDQA/XsC2nEK9RIlOVWguP3SZOngeHu8Xg
         vt+w==
X-Gm-Message-State: AOAM5309OnBDkvvW7OWS7riP/SeQoPnmWASfdOsBNDdl/Z73yiqMjLOU
        BvbhjmX8PJGdq/PjTVyOZgKKog==
X-Google-Smtp-Source: ABdhPJyxK3AwQzRzBtxFgS1FXOW7JElIYl5Bz3tyIwNYJjqtzC/ecfpq6sVRYwHf92Tb20np6K9jIQ==
X-Received: by 2002:a2e:9e15:: with SMTP id e21mr6291412ljk.351.1634220415573;
        Thu, 14 Oct 2021 07:06:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d6sm234448lfi.137.2021.10.14.07.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 07:06:54 -0700 (PDT)
Subject: Re: [PATCH v2 07/11] drm/msm/disp/dpu1: Add DSC support in hw_ctl
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
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-8-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f5f6162c-7ed0-2964-7cf9-0bb894c8b4f5@linaro.org>
Date:   Thu, 14 Oct 2021 17:06:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-8-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2021 10:08, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> bits so that DSC would work there as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since
> v1:
>   - Move this patch from 6 to 7 due to dependency on 6th one
>   - Use DSC indices for programming DSC registers and program only on non
>     null indices
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 3c79bd9c2fe5..8ea9d8dce3f7 100644
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
>   static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> -
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>   				ctx->pending_merge_3d_flush_mask);
> @@ -128,7 +130,6 @@ static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>   				ctx->pending_intf_flush_mask);
>   
> -	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);

This would break non-DSC case.

>   }
>   
>   static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
> @@ -498,6 +499,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	u32 intf_active = 0;
>   	u32 mode_sel = 0;
>   
> +	if (cfg->dsc)
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> +
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -509,6 +513,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	if (cfg->dsc) {
> +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  BIT(DSC_IDX));

Why?

> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> +	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> 


-- 
With best wishes
Dmitry
