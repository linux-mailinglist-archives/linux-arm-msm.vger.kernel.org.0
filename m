Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F85D39C216
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhFDVM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:12:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24728 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhFDVMX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:12:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622841036; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M2a8aoOv3EI6mp/CgBK8zMe95aEpKXurrJwsbb/BuL0=;
 b=vgLmI4YqzgjwCsKDwf2bRihJgraQ1EMhCvAIlQjNbP6MWgE2zA/dvTyL2jwmf/i0jQclpodi
 PHE1vzG2DdTovUqvRX3o+pr+bKott3u2H0GHh3Vcd3b9pd2QRUbgNo4JT8rCFwJ3zAT6DyJk
 w5B/YcyZz50Hmcsj8vm0i5phwXs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60ba96a9f726fa4188b59b2a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 21:10:01
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5855EC43143; Fri,  4 Jun 2021 21:10:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 528D1C4338A;
        Fri,  4 Jun 2021 21:09:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 14:09:57 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v3 3/4] drm/msm/dpu: use struct
 dpu_hw_merge_3d in dpu_hw_pingpong
In-Reply-To: <20210515190909.1809050-4-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
 <20210515190909.1809050-4-dmitry.baryshkov@linaro.org>
Message-ID: <75924e8e083e5416c548f3206d7448e5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-15 12:09, Dmitry Baryshkov wrote:
> Use struct dpu_hw_merge_3d pointer in struct dpu_hw_pingpong rather
> than using struct dpu_hw_blk. This is the only user of dpu_hw_blk.id,
> which will be cleaned in the next patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 ++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h      |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               |  2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0e06b7e73c7a..4feec24162bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -284,7 +284,7 @@ static void 
> dpu_encoder_phys_vid_setup_timing_engine(
>  	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>  	if (phys_enc->hw_pp->merge_3d)
> -		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->id;
> +		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
> 
>  	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>  	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
> @@ -298,11 +298,8 @@ static void 
> dpu_encoder_phys_vid_setup_timing_engine(
>  				true,
>  				phys_enc->hw_pp->idx);
> 
> -	if (phys_enc->hw_pp->merge_3d) {
> -		struct dpu_hw_merge_3d *merge_3d =
> to_dpu_hw_merge_3d(phys_enc->hw_pp->merge_3d);
> -
> -		merge_3d->ops.setup_3d_mode(merge_3d, intf_cfg.mode_3d);
> -	}
> +	if (phys_enc->hw_pp->merge_3d)
> +		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
> intf_cfg.mode_3d);
> 
>  	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
> 
> @@ -461,7 +458,7 @@ static void dpu_encoder_phys_vid_enable(struct
> dpu_encoder_phys *phys_enc)
> 
>  	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
>  	if (ctl->ops.update_pending_flush_merge_3d && 
> phys_enc->hw_pp->merge_3d)
> -		ctl->ops.update_pending_flush_merge_3d(ctl, 
> phys_enc->hw_pp->merge_3d->id);
> +		ctl->ops.update_pending_flush_merge_3d(ctl, 
> phys_enc->hw_pp->merge_3d->idx);
> 
>  skip_flush:
>  	DPU_DEBUG_VIDENC(phys_enc,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index 845b9ce80e31..89d08a715c16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -126,6 +126,8 @@ struct dpu_hw_pingpong_ops {
>  			struct dpu_hw_dither_cfg *cfg);
>  };
> 
> +struct dpu_hw_merge_3d;
> +
>  struct dpu_hw_pingpong {
>  	struct dpu_hw_blk base;
>  	struct dpu_hw_blk_reg_map hw;
> @@ -133,7 +135,7 @@ struct dpu_hw_pingpong {
>  	/* pingpong */
>  	enum dpu_pingpong idx;
>  	const struct dpu_pingpong_cfg *caps;
> -	struct dpu_hw_blk *merge_3d;
> +	struct dpu_hw_merge_3d *merge_3d;
> 
>  	/* ops */
>  	struct dpu_hw_pingpong_ops ops;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index fd2d104f0a91..c0eec12498e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -162,7 +162,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>  			goto fail;
>  		}
>  		if (pp->merge_3d && pp->merge_3d < MERGE_3D_MAX)
> -			hw->merge_3d = rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0];
> +			hw->merge_3d = to_dpu_hw_merge_3d(rm->merge_3d_blks[pp->merge_3d -
> MERGE_3D_0]);
>  		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
>  	}
