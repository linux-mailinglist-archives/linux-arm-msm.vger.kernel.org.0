Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B853940F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 12:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbhE1Ke7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 06:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbhE1Ke7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 06:34:59 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295ADC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:33:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w7so4617214lji.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z5pkaY52V88halWOj7AU276ivDp4wZj1ZWxe/+O9pbQ=;
        b=qMxr/+2Eq/qlwrAifwv1gZgySWtqs7mw2XfsmcLWOoadF4lv7eFE7t78UykzyoE/mt
         6uvOlJS/9IclCgf3IRDaIU8KaJCmt0Urjc1/95FY802u6M70Wp6zB9FmCnDTGZ85s/kg
         319wTjcq31yNBNK08Kj2sCD46BCPPn6NO6wGNBQHcB1+nNnp4+yJIee8iRXrD/v9OS2J
         dsSftsM2XVtNM1xA5utOKJ9XI0cZPAnF1S1k7QvxET2KK42WGUW2uvIUsGA3lhkE9SnF
         VxAnnmiV011Al1JAvku7ZURd9fk1QyGnOd7vX9ylg9itwzLBjATHkBxgWeTzQ0iKbaaw
         vSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z5pkaY52V88halWOj7AU276ivDp4wZj1ZWxe/+O9pbQ=;
        b=YvWkeP3huhEJb52d76EhRHpSzYbQ0ju/8GfS36bxkVnJ1Kn/00DcCe1ZbsAjQDtxlc
         nbfUvfHbR19sjGZlDJyUGJ30Kex2sQonRjKxcGt+RjE9TdB20zb0sbEaxaMa6PjqJ+P6
         Qqqa/vz/i+dzzS/hd+4Jy9E+KYO+MVaVCCLaB+dcpvn1Jgb/ftyR5PSEj6muXUjiFGef
         Z4MD62ICshuxRMuv3YpwI4JUf1DuF83fpqObsWg6Jg8VaNLDYVYvXGyKcbviiRgVkJYI
         b29I4QbgGWALH0+EfsY+Nb45MquX2HwvI88u1h1ekqhgW/2b4N8m6K36504oI0faXlgS
         OmCQ==
X-Gm-Message-State: AOAM531d3/G7uutitWwHt/L9JhhZMKjJyiuXM9mE5KzQ/2jiZLzqtR7K
        /yuIP22L8E8BzpqHWenGPmjhRg==
X-Google-Smtp-Source: ABdhPJzgP5lFlaZED/O/MHGL+87/8TfG5Lk9cp6TXKWq2cAlpMz+H0eKLCoVgXjfMhBNop6FI7Xc+w==
X-Received: by 2002:a2e:bf2a:: with SMTP id c42mr6085008ljr.1.1622198002336;
        Fri, 28 May 2021 03:33:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x16sm434442lfa.244.2021.05.28.03.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 03:33:21 -0700 (PDT)
Subject: Re: [RFC PATCH 06/13] drm/msm/disp/dpu1: Add DSC support in RM
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-10-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e251b6b6-0030-f36b-b726-2f9549a34d7a@linaro.org>
Date:   Fri, 28 May 2021 13:33:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-10-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2021 15:49, Vinod Koul wrote:
> This add the bits in RM to enable the DSC blocks
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 32 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
>   3 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d6717d6672f7..d56c05146dfe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -165,6 +165,7 @@ struct dpu_global_state {
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>   	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>   	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>   };
>   
>   struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index fd2d104f0a91..4da6d72b7996 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -11,6 +11,7 @@
>   #include "dpu_hw_intf.h"
>   #include "dpu_hw_dspp.h"
>   #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_dsc.h"
>   #include "dpu_encoder.h"
>   #include "dpu_trace.h"
>   
> @@ -75,6 +76,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   			dpu_hw_intf_destroy(hw);
>   		}
>   	}
> +	for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
> +		struct dpu_hw_dsc *hw;
> +
> +		if (rm->intf_blks[i]) {
> +			hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
> +			dpu_hw_dsc_destroy(hw);
> +		}
> +	}
>   
>   	return 0;
>   }
> @@ -221,6 +230,19 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>   	}
>   
> +	for (i = 0; i < cat->dsc_count; i++) {
> +		struct dpu_hw_dsc *hw;
> +		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
> +
> +		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
> +		if (IS_ERR_OR_NULL(hw)) {
> +			rc = PTR_ERR(hw);
> +			DPU_ERROR("failed dsc object creation: err %d\n", rc);
> +			goto fail;
> +		}
> +		rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
> +	}
> +
>   	return 0;
>   
>   fail:
> @@ -476,6 +498,9 @@ static int _dpu_rm_reserve_intf(
>   	}
>   
>   	global_state->intf_to_enc_id[idx] = enc_id;
> +
> +	global_state->dsc_to_enc_id[0] = enc_id;
> +	global_state->dsc_to_enc_id[1] = enc_id;

This should bear at least the FIXME.

>   	return 0;
>   }
>   
> @@ -567,6 +592,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>   	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>   		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> +		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>   }
>   
>   int dpu_rm_reserve(
> @@ -640,6 +667,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   		hw_to_enc_id = global_state->dspp_to_enc_id;
>   		max_blks = ARRAY_SIZE(rm->dspp_blks);
>   		break;
> +	case DPU_HW_BLK_DSC:
> +		hw_blks = rm->dsc_blks;
> +		hw_to_enc_id = global_state->dsc_to_enc_id;
> +		max_blks = ARRAY_SIZE(rm->dsc_blks);
> +		break;
>   	default:
>   		DPU_ERROR("blk type %d not managed by rm\n", type);
>   		return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..278d2a510b80 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -30,6 +30,7 @@ struct dpu_rm {
>   	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
>   	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>   	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> +	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>   
>   	uint32_t lm_max_width;
>   };
> 


-- 
With best wishes
Dmitry
