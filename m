Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79FEA4AA490
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Feb 2022 00:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240640AbiBDXnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 18:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiBDXno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 18:43:44 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68688E003923
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 15:43:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id l27so10742595lfe.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 15:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I9SLsGTaQIWmnEslyu2vrKcAcySi1+aQolYgkiScq+c=;
        b=FtmGDSE/HVbfzUr9cDemSWWCo48IB2tcXQdZIGkytnJYxRS1QX9qSlYdpbA9soM6cM
         92cJVrOZsOc5+jQetdRrkjHHDIy4b46393jhy5EE2VGmFB28dy5YOucdka/37tOyH8N6
         N8KWMLIAg6cASDIdP1moIH8G0iwUKvE5fbOD285brTWRS7jlFuVEfamwIqgLkyWKspC2
         KL0pGhMJ8+ITAn9PQyYNb49EgLCCOGhaugN0g9u+dt3TQHqqhnic65NgIN/3NinMpHLR
         viMh7pKOnEi+c92tmV6ru6KV1vg1wINPHi1Dg0XOVw1oA63kQUdbB7DvoJ/DKog2TKVB
         poIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I9SLsGTaQIWmnEslyu2vrKcAcySi1+aQolYgkiScq+c=;
        b=BiaMg70tTLvJJiMW3FAAMZmywy2q+bPiW1FBpZN9al2M6PW99U/xIfDu0lEKtH3sV5
         qRS3MHWp4QBO01kJ9mBvdkln/8NdUxjaZckdvCsiCkPVvbbS1Gy2AF+GqDTHBJYkt9d0
         s6ZDOMGb+8KS5O2BgYtlcjqRBy4NW8PMalShmaSV8hwTuAzqtWQRWsRYXbrgDMaCmm90
         e6CbCjLfV+6GfKcRQDVEqG4DxInMGyiSgq0qyg6oXMJ1ZmTS4ZonjS+Ia+UeF5jmF/yx
         tf/52kBMni2hxp4Qi8widKAKdgME4/S0orlFOINgk+MKiE0ap6rEYb9jLzfAeR9pJG0g
         AoCg==
X-Gm-Message-State: AOAM533LYw/FTDQXHRx+4iOBN3Jk7hfR968kYXM+OYE5hgAMa2NVtewA
        Mb9DZegQpF2TqXSKYF/qFois+Q==
X-Google-Smtp-Source: ABdhPJxvUaL71wHQ+qE+bnzW0Jk3WCWnWBZgSW0xAeVCf3cyup0reb1xXY94Oy204A5GyhPXAHgGzQ==
X-Received: by 2002:a05:6512:2283:: with SMTP id f3mr944546lfu.198.1644018219598;
        Fri, 04 Feb 2022 15:43:39 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p16sm437499ljc.86.2022.02.04.15.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 15:43:39 -0800 (PST)
Message-ID: <64ced3f1-5656-d5e1-28bf-eb84cfae8021@linaro.org>
Date:   Sat, 5 Feb 2022 02:43:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/12] drm/msm/dpu: add writeback blocks to DPU RM
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org, daniel@ffwll.ch,
        markyacoub@chromium.org, quic_jesszhan@quicinc.com
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-4-git-send-email-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-4-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Add writeback blocks to DPU resource manager so that
> writeback encoders can request for writeback hardware blocks
> through RM and their usage can be tracked.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

[please excuse me for the duplicate, I've sent the email without the 
proper distribution list]

We have WB blocks being allocated manually. Could you please consider 
following the ideas from 
https://patchwork.freedesktop.org/patch/470394/?series=99175&rev=1 ?

I think it simplifies the code and shows exact correspondence between WB 
and dpu_encoder.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  3 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +
>   4 files changed, 78 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index e241914..cc10436 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -21,9 +22,11 @@
>   /**
>    * Encoder functions and data types
>    * @intfs:	Interfaces this encoder is using, INTF_MODE_NONE if unused
> + * @wbs:    Writeback blocks this encoder is using
>    */
>   struct dpu_encoder_hw_resources {
>   	enum dpu_intf_mode intfs[INTF_MAX];
> +	enum dpu_intf_mode wbs[WB_MAX];
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 2d385b4..1e00804 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -146,6 +147,7 @@ struct dpu_global_state {
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>   	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>   	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t wb_to_enc_id[WB_MAX - WB_0];
>   };
>   
>   struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6..edd0b7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>    */
>   
> @@ -9,6 +10,7 @@
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_pingpong.h"
>   #include "dpu_hw_intf.h"
> +#include "dpu_hw_wb.h"
>   #include "dpu_hw_dspp.h"
>   #include "dpu_hw_merge3d.h"
>   #include "dpu_encoder.h"
> @@ -75,6 +77,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   			dpu_hw_intf_destroy(hw);
>   		}
>   	}
> +	for (i = 0; i < ARRAY_SIZE(rm->wb_blks); i++) {
> +		struct dpu_hw_wb *hw;
> +
> +		if (rm->wb_blks[i]) {
> +			hw = to_dpu_hw_wb(rm->wb_blks[i]);
> +			dpu_hw_wb_destroy(hw);
> +		}
> +	}
>   
>   	return 0;
>   }
> @@ -187,6 +197,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		rm->intf_blks[intf->id - INTF_0] = &hw->base;
>   	}
>   
> +	for (i = 0; i < cat->wb_count; i++) {
> +		struct dpu_hw_wb *hw;
> +		const struct dpu_wb_cfg *wb = &cat->wb[i];
> +
> +		if (wb->id < WB_0 || wb->id >= WB_MAX) {
> +			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
> +			continue;
> +		}
> +
> +		hw = dpu_hw_wb_init(wb->id, mmio, cat);
> +		if (IS_ERR_OR_NULL(hw)) {
> +			rc = PTR_ERR(hw);
> +			DPU_ERROR("failed wb object creation: err %d\n", rc);
> +			goto fail;
> +		}
> +		rm->wb_blks[wb->id - WB_0] = &hw->base;
> +	}
> +
>   	for (i = 0; i < cat->ctl_count; i++) {
>   		struct dpu_hw_ctl *hw;
>   		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
> @@ -479,6 +507,33 @@ static int _dpu_rm_reserve_intf(
>   	return 0;
>   }
>   
> +static int _dpu_rm_reserve_wb(
> +		struct dpu_rm *rm,
> +		struct dpu_global_state *global_state,
> +		uint32_t enc_id,
> +		uint32_t id)
> +{
> +	int idx = id - WB_0;
> +
> +	if (idx < 0 || idx >= ARRAY_SIZE(rm->wb_blks)) {
> +		DPU_ERROR("invalid intf id: %d", id);
> +		return -EINVAL;
> +	}
> +
> +	if (!rm->wb_blks[idx]) {
> +		DPU_ERROR("couldn't find wb id %d\n", id);
> +		return -EINVAL;
> +	}
> +
> +	if (reserved_by_other(global_state->wb_to_enc_id, idx, enc_id)) {
> +		DPU_ERROR("intf id %d already reserved\n", id);
> +		return -ENAVAIL;
> +	}
> +
> +	global_state->wb_to_enc_id[idx] = enc_id;
> +	return 0;
> +}
> +
>   static int _dpu_rm_reserve_intf_related_hw(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> @@ -497,6 +552,15 @@ static int _dpu_rm_reserve_intf_related_hw(
>   			return ret;
>   	}
>   
> +	for (i = 0; i < ARRAY_SIZE(hw_res->wbs); i++) {
> +		if (hw_res->wbs[i] == INTF_MODE_NONE)
> +			continue;
> +		id = i + WB_0;
> +		ret = _dpu_rm_reserve_wb(rm, global_state, enc_id, id);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	return ret;
>   }
>   
> @@ -567,6 +631,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>   	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>   		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->wb_to_enc_id,
> +		ARRAY_SIZE(global_state->wb_to_enc_id), enc->base.id);
>   }
>   
>   int dpu_rm_reserve(
> @@ -635,6 +701,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   		hw_to_enc_id = global_state->intf_to_enc_id;
>   		max_blks = ARRAY_SIZE(rm->intf_blks);
>   		break;
> +	case DPU_HW_BLK_WB:
> +		hw_blks = rm->wb_blks;
> +		hw_to_enc_id = global_state->wb_to_enc_id;
> +		max_blks = ARRAY_SIZE(rm->wb_blks);
> +		break;
>   	case DPU_HW_BLK_DSPP:
>   		hw_blks = rm->dspp_blks;
>   		hw_to_enc_id = global_state->dspp_to_enc_id;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d..a021409 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>    */
>   
> @@ -30,6 +31,7 @@ struct dpu_rm {
>   	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
>   	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>   	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> +	struct dpu_hw_blk *wb_blks[WB_MAX - WB_0];
>   
>   	uint32_t lm_max_width;
>   };


-- 
With best wishes
Dmitry
