Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257D444BA32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 03:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhKJCPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 21:15:41 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:64600 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhKJCPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 21:15:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636510374; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ecADr3wzM0TFbc43Pij7QByXJevYCIvrf32QJg2deLQ=;
 b=vkHpIjEzEMraafxvTraqRJfVroZWlQn6W7KYB2Rbp+VrSq+7uobi1Cxbw3XbXlnK554fKmEK
 j4U2PGrCC9X8OSOqEwFMVmRrWxxnQMw2ds80Nh6YmJIjGZHQRxvyeD7nPAJbFgEdftZEPppD
 BG/rSyCh/hupfTDqorNZ3a6Ybtg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 618b2aa2335d9047e19925b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 02:12:50
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EAA61C43619; Wed, 10 Nov 2021 02:12:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9A9BC4338F;
        Wed, 10 Nov 2021 02:12:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Nov 2021 18:12:48 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 21/22] drm/msm/dpu: fix CDP setup to
 account for multirect index
In-Reply-To: <20210705012115.4179824-22-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-22-dmitry.baryshkov@linaro.org>
Message-ID: <1fb08ef9aa4d5d2e7d76453386bd2b75@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> Client driven prefetch (CDP) is properly setup only for SSPP REC0
> currently. Enable client driven prefetch also for SSPP REC1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 12 ++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index f93cdeb08ac7..96f2f3f12f34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -75,6 +75,7 @@
>  #define SSPP_TRAFFIC_SHAPER                0x130
>  #define SSPP_CDP_CNTL                      0x134
>  #define SSPP_UBWC_ERROR_STATUS             0x138
> +#define SSPP_CDP_CNTL_REC1                 0x13c
>  #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
>  #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
>  #define SSPP_TRAFFIC_SHAPER_REC1           0x158
> @@ -624,10 +625,12 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct
> dpu_hw_pipe *ctx,
>  }
> 
>  static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cdp_cfg *cfg)
> +		struct dpu_hw_pipe_cdp_cfg *cfg,
> +		enum dpu_sspp_multirect_index index)
>  {
>  	u32 idx;
>  	u32 cdp_cntl = 0;
> +	u32 cdp_cntl_offset = 0;
> 
>  	if (!ctx || !cfg)
>  		return;
> @@ -635,6 +638,11 @@ static void dpu_hw_sspp_setup_cdp(struct 
> dpu_hw_pipe *ctx,
>  	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>  		return;
> 
> +	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
> +		cdp_cntl_offset = SSPP_CDP_CNTL;
> +	else
> +		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
> +
>  	if (cfg->enable)
>  		cdp_cntl |= BIT(0);
>  	if (cfg->ubwc_meta_enable)
> @@ -644,7 +652,7 @@ static void dpu_hw_sspp_setup_cdp(struct 
> dpu_hw_pipe *ctx,
>  	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
>  		cdp_cntl |= BIT(3);
> 
> -	DPU_REG_WRITE(&ctx->hw, SSPP_CDP_CNTL, cdp_cntl);
> +	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
>  }
> 
>  static void _setup_layer_ops(struct dpu_hw_pipe *c,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index c5ac8defa073..19c5358b962c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -358,9 +358,11 @@ struct dpu_hw_sspp_ops {
>  	 * setup_cdp - setup client driven prefetch
>  	 * @ctx: Pointer to pipe context
>  	 * @cfg: Pointer to cdp configuration
> +	 * @index: rectangle index in multirect
>  	 */
>  	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_cdp_cfg *cfg);
> +			struct dpu_hw_pipe_cdp_cfg *cfg,
> +			enum dpu_sspp_multirect_index index);
>  };
> 
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d692136884ad..420cdd90e89b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1241,7 +1241,7 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
>  					DPU_FORMAT_IS_TILE(fmt);
>  			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> 
> -			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg);
> +			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg,
> pstate->multirect_index);
>  		}
>  	}
