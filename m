Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613FF39C1DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhFDVKr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:10:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61350 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229665AbhFDVKq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:10:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622840939; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1T6umcJycSVQoUHcG4vq7H78PYAR9Vv9yUFHXU9Ym7E=;
 b=SKpSQ50HVILdA/ZfvnRMY3VHKNadhC5+odpawbztWJT5kt+QwkTb2xqleesLnaSX8WWQGiOH
 Nz/jW3nSV5OK1JGVISTKc/G0fAfE0eSuexq37tkycXV4EEC42qYT3s5z0Zn+bLV0YHtw6N3R
 FoNQqgw88qFb4lD9935K/SlhLpU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60ba966ae27c0cc77f78d02c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 21:08:58
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE439C4338A; Fri,  4 Jun 2021 21:08:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 794D7C433D3;
        Fri,  4 Jun 2021 21:08:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 14:08:56 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v3 2/4] drm/msm/dpu: drop dpu_hw_blk_destroy
 function
In-Reply-To: <20210515190909.1809050-3-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
 <20210515190909.1809050-3-dmitry.baryshkov@linaro.org>
Message-ID: <24553e016e8e97b9b78e0e731d9719b5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-15 12:09, Dmitry Baryshkov wrote:
> The dpu_hw_blk_destroy() function is empty, so we can drop it now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c      | 13 -------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h      |  1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     |  3 ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      |  2 --
>  10 files changed, 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> index abad043f35f5..1f2b74b9eb65 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> @@ -22,16 +22,3 @@ void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32
> type, int id)
>  	hw_blk->type = type;
>  	hw_blk->id = id;
>  }
> -
> -/**
> - * dpu_hw_blk_destroy - destroy hw block object.
> - * @hw_blk:  pointer to hw block object
> - * return: none
> - */
> -void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk)
> -{
> -	if (!hw_blk) {
> -		pr_err("invalid parameters\n");
> -		return;
> -	}
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> index fb3be9a36a50..7768694b558a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
> @@ -24,5 +24,4 @@ struct dpu_hw_blk {
>  };
> 
>  void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
> -void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk);
>  #endif /*_DPU_HW_BLK_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 04a2c4b9a357..441f66a4fb37 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -620,7 +620,5 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl 
> idx,
> 
>  void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx)
>  {
> -	if (ctx)
> -		dpu_hw_blk_destroy(&ctx->base);
>  	kfree(ctx);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index d2f1045a736a..977b25968f34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -117,9 +117,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp 
> idx,
> 
>  void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp)
>  {
> -	if (dspp)
> -		dpu_hw_blk_destroy(&dspp->base);
> -
>  	kfree(dspp);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6ffe97601716..17224556d5a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -332,8 +332,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf 
> idx,
> 
>  void dpu_hw_intf_destroy(struct dpu_hw_intf *intf)
>  {
> -	if (intf)
> -		dpu_hw_blk_destroy(&intf->base);
>  	kfree(intf);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 554bb881de3a..76f8b8f75b82 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -189,7 +189,5 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm 
> idx,
> 
>  void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
>  {
> -	if (lm)
> -		dpu_hw_blk_destroy(&lm->base);
>  	kfree(lm);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> index 863229dd0140..406ba950a066 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> @@ -86,7 +86,5 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum
> dpu_merge_3d idx,
> 
>  void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *hw)
>  {
> -	if (hw)
> -		dpu_hw_blk_destroy(&hw->base);
>  	kfree(hw);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 334d5b28f533..92cd724263ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -289,7 +289,5 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum
> dpu_pingpong idx,
> 
>  void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp)
>  {
> -	if (pp)
> -		dpu_hw_blk_destroy(&pp->base);
>  	kfree(pp);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index ceb2488ea270..8734a47040aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -740,8 +740,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
> idx,
> 
>  void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
>  {
> -	if (ctx)
> -		dpu_hw_blk_destroy(&ctx->base);
>  	kfree(ctx);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 5d2c33ec1de7..dae77d9c2c74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -329,8 +329,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp 
> idx,
> 
>  void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
>  {
> -	if (mdp)
> -		dpu_hw_blk_destroy(&mdp->base);
>  	kfree(mdp);
>  }
