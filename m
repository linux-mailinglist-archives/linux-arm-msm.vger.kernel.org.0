Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B245C972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 17:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241902AbhKXQEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235256AbhKXQEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:04:13 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF38C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 08:01:03 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu18so8657662lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uDIkuwm2DEbdWoKLg3faezc8ngMrw8G/6t1s5qdiZ1s=;
        b=oSxgAL04L9coz89nvFqlOSCRJj9FWO+A0Xgk2Ak3gxw8ghVVzjDYsXAqbg0ujFpVb6
         RfIsUjZX2YERgyJcziYdgpat5BNzghfJ7XnFthqxO2rFbt7P5GKgGcxc87StkdhV1IZU
         8EtD7e4yLSwwjkd4DVUilD36ys/pBlRuso3rcdbf/h5p/L2UtDCVtdmLAnrCEtcKVXdE
         b6XhKSrpBlOhCVtZuQ/hHvbvzHDcQ/my/mteJf05X0YVz6ianVUZ5yTuPf0e4yn3P76j
         l+WDwMDsLrwprINf0uEkqy2IqFLk91YQNA9jeTmGeVoUITDx40uWkC6iGr1S0e1vCFMH
         GfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uDIkuwm2DEbdWoKLg3faezc8ngMrw8G/6t1s5qdiZ1s=;
        b=pwdwQlcCnClSnkKZgmUOFIppmAizZaPB4Y5YRbODLOzSPLqAMjm107uONXpp46zClu
         8ksk2niPd8Yud9UxzmOoX/K+m3SPi8TyvbDsJ4ZWHqAuK0xBQ6dg5v20j5y/glq0LC9z
         7+hiNVBevc3kJs37RzowlEJzcALujJxze/kngCrXIWZQtvU+dRZLegOK9Ut04CkARvBe
         gppuz98jwBb9dkg/gOqHMl0zQz24i1ccbHkLlKt9n0kEh9JeCZzcrcm6e1ca14MBi/eJ
         hORRuYyUHPbbvWlduM8IJDVysxxibQI0TRXqEc2BorECtpQxFCR3Ysh73jFzz2Jr9VgO
         tMfw==
X-Gm-Message-State: AOAM531dtK/sfdm07E+cr/dFxEV9Mm7IhIpXE5YyqjE1A91AYPGT8In6
        JEgXU+0/NWjj1s+2ZXa/dnuPPg==
X-Google-Smtp-Source: ABdhPJxav31tn7OR0ESHUj6PrQU3MjNZWl9xawSdI1YSrLLc4QTJKSP0E7SbT48zMgTq5poNlU+pMQ==
X-Received: by 2002:a05:6512:104e:: with SMTP id c14mr16218846lfb.30.1637769661531;
        Wed, 24 Nov 2021 08:01:01 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 27sm18444lft.299.2021.11.24.08.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:01:01 -0800 (PST)
Subject: Re: [PATCH v3 10/13] drm/msm/disp/dpu1: Add DSC support in RM
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
 <20211116062256.2417186-11-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <26315aac-02ef-1e79-4564-08c75e334634@linaro.org>
Date:   Wed, 24 Nov 2021 19:01:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-11-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2021 09:22, Vinod Koul wrote:
> This add the bits in RM to enable the DSC blocks
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 66 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
>   3 files changed, 68 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 775bcbda860f..fd6672efb096 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -146,6 +146,7 @@ struct dpu_global_state {
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>   	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>   	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>   };
>   
>   struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6e427a..c9d0fc765aaf 100644
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
> +		if (rm->dsc_blks[i]) {
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
> @@ -476,6 +498,7 @@ static int _dpu_rm_reserve_intf(
>   	}
>   
>   	global_state->intf_to_enc_id[idx] = enc_id;
> +
>   	return 0;
>   }
>   
> @@ -500,6 +523,38 @@ static int _dpu_rm_reserve_intf_related_hw(
>   	return ret;
>   }
>   
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +			       struct dpu_global_state *global_state,
> +			       struct drm_encoder *enc,
> +			       const struct msm_display_topology *top)
> +{
> +	struct msm_drm_private *priv;
> +	int num_dsc = top->num_dsc;
> +	int i;
> +
> +	priv = enc->dev->dev_private;
> +
> +	if (!priv)
> +		return -EIO;
> +
> +	/* check if DSC is supported */
> +	if (!priv->dsc)
> +		return 0;

I don't think this check is necessary. If topology requests the DSC, 
just give away required amount of hw blocks.

> +
> +	/* check if DSC required are allocated or not */
> +	for (i = 0; i < num_dsc; i++) {
> +		if (global_state->dsc_to_enc_id[i]) {
> +			DPU_ERROR("DSC %d is already allocated\n", i);
> +			return -EIO;
> +		}
> +	}
> +
> +	for (i = 0; i < num_dsc; i++)
> +		global_state->dsc_to_enc_id[i] = enc->base.id;
> +
> +	return 0;
> +}
> +
>   static int _dpu_rm_make_reservation(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> @@ -526,6 +581,10 @@ static int _dpu_rm_make_reservation(
>   	if (ret)
>   		return ret;
>   
> +	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> +	if (ret)
> +		return ret;
> +
>   	return ret;
>   }
>   
> @@ -567,6 +626,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>   	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>   		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> +		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>   }
>   
>   int dpu_rm_reserve(
> @@ -640,6 +701,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
