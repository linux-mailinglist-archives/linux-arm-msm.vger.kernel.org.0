Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B1D42DB32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 16:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhJNONq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 10:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbhJNONq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 10:13:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AEEC061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 07:11:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so27847971lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dz1BtAV2YCICCCENmgsdfWY3o4zWzERdcu0Eo2dtfD4=;
        b=jpg5ZXbRALieaGk/qsz3ib4Lb8BrDMsMRt2rh7a8I3Caa5BeKM5Ni6G6xGOocUp6+k
         tLUdE5/mtv/6NfcBOxm/OUeRgrsXJeU508glRrOyIR7Q5+8a1mElSMMKqQy/WLWEoA5s
         e2PMgdDEHWjCPe40GR/WAs1pIEdBzCwnCWlNnTEij7a3klzlEts4s+F3CrCSgLsP1Ffl
         bOX5isL4l3wl5XzbIJPIJJD4VwiYDQgaNfv0XFKLJHoT2gohsjrtJzhYu8h8xDWLzz96
         OEG/3XaYB/ByuuQfcgV5QqQsA3QKJTWifFuSKQoNuZDPsvsb0NbeXxqaUMYIHk5+4bev
         SwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dz1BtAV2YCICCCENmgsdfWY3o4zWzERdcu0Eo2dtfD4=;
        b=XMsokoUjGSCElX67iHT44yxkfl+l9wLAcpxwpgbIz7RgAtpLZJZY6EtgIbre0RHPfm
         bKXp8juQmqlBtCtOFu0tK4N8Jog8hcwtYKGTSJCQdQEsboAGhs0ZJBCifreLBHzvFAx+
         KC93GlLGJIQwSuLnaC1ORU3fSWgo5sQb7LX6MIoS9N3o5SyuB3nTcDOOfyty3zOp44+K
         j3H1hBuzv6aCMBc2+K45GXx94mwC+IFukM2aNcGriHuValp76uGJIHBert3RCVG0yxZL
         UrkLSxF22Kj0tRxap5ZrmmRQdMZTNQG+oFTzKWgEhSKfawYJK1bFea5UP6901tjz37pU
         8A9g==
X-Gm-Message-State: AOAM5330SMV0hdcPq5Bl3IL1XvH08IGdNooSoqUWEDyFETGBFRs6GuBx
        AxEgYNt7dwTMtHXzS5jP27WnYQ==
X-Google-Smtp-Source: ABdhPJz1I3MiQCqr6HR734lVC8G1ofaoeGqwLziOfnKGPQRfM6TphExVPw35yrt4mBmr+c3DHfRPGw==
X-Received: by 2002:a2e:1f12:: with SMTP id f18mr6183857ljf.464.1634220699569;
        Thu, 14 Oct 2021 07:11:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l5sm182509lje.33.2021.10.14.07.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 07:11:39 -0700 (PDT)
Subject: Re: [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support in RM
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
 <20211007070900.456044-5-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org>
Date:   Thu, 14 Oct 2021 17:11:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-5-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2021 10:08, Vinod Koul wrote:
> This add the bits in RM to enable the DSC blocks
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since
> v1:
>   - Add _dpu_rm_reserve_dsc() function which checks if DSC is enabled
>   - Fix to use dsc_blks
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 61 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
>   3 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 323a6bce9e64..da646817585d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -159,6 +159,7 @@ struct dpu_global_state {
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>   	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>   	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>   };
>   
>   struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6e427a..95bdabc16280 100644
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
> @@ -500,6 +523,33 @@ static int _dpu_rm_reserve_intf_related_hw(
>   	return ret;
>   }
>   
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +			       struct dpu_global_state *global_state,
> +			       struct drm_encoder *enc)
> +{
> +	struct msm_drm_private *priv;
> +
> +	priv = enc->dev->dev_private;
> +
> +	if (!priv)
> +		return -EIO;
> +
> +	/* check if DSC is supported */
> +	if (!priv->dsc)
> +		return 0;
> +
> +	/* check if DSC 0 & 1 and allocated or not */
> +	if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
> +		DPU_ERROR("DSC 0|1 is already allocated\n");
> +		return -EIO;
> +	}
> +
> +	global_state->dsc_to_enc_id[0] = enc->base.id;
> +	global_state->dsc_to_enc_id[1] = enc->base.id;

Still hardcoding DSC_0 and DSC_1.

Could you please add num_dsc to the topology and allocate the requested 
amount of DSC blocks? Otherwise this would break for the DSI + DP case.

> +
> +	return 0;
> +}
> +
>   static int _dpu_rm_make_reservation(
>   		struct dpu_rm *rm,
>   		struct dpu_global_state *global_state,
> @@ -526,6 +576,10 @@ static int _dpu_rm_make_reservation(
>   	if (ret)
>   		return ret;
>   
> +	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc);
> +	if (ret)
> +		return ret;
> +
>   	return ret;
>   }
>   
> @@ -567,6 +621,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>   	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>   		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> +		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>   }
>   
>   int dpu_rm_reserve(
> @@ -640,6 +696,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
