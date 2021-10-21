Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD32436E36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 01:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhJUXWK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 19:22:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26232 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231614AbhJUXWI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 19:22:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634858392; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1cJtc35Y53dzqjAKco4Zu4fuOLPBg8VT+uVqh64Zx88=;
 b=j+LsufkQ9+/Icvwq9QBRtKwhJ2aT9RuBChYMDCpv0a9bGmlI1owOWTCksPdVGO9AyvYZn+o0
 NHewENRFY3P/5selouddQiqPOaNwnRFrLOegY/1/u+ahsddk1egwiiOMlogQXmNxdDDRA/Wc
 7d0B4NkrzbzyG00760zrm/QyVvo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6171f58b59612e010059d12c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 23:19:39
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44680C4360C; Thu, 21 Oct 2021 23:19:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 105A6C4338F;
        Thu, 21 Oct 2021 23:19:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 16:19:36 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg
 from dpu_plane
In-Reply-To: <20210930140002.308628-9-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-9-dmitry.baryshkov@linaro.org>
Message-ID: <760a6495fb155ddda06e888dc9559c2e@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> Remove struct dpu_hw_pipe_cdp_cfg instance from dpu_plane, it is an
> interim configuration structure. Allocate it on stack instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 14 +++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 --
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index b8836c089863..d3ae0cb2047c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1182,20 +1182,20 @@ static void
> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  				pstate->multirect_index);
> 
>  		if (pdpu->pipe_hw->ops.setup_cdp) {
> -			struct dpu_hw_pipe_cdp_cfg *cdp_cfg = &pstate->cdp_cfg;
> +			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
> 
> -			memset(cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
> +			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
> 
> -			cdp_cfg->enable = pdpu->catalog->perf.cdp_cfg
> +			cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
>  					[DPU_PERF_CDP_USAGE_RT].rd_enable;
> -			cdp_cfg->ubwc_meta_enable =
> +			cdp_cfg.ubwc_meta_enable =
>  					DPU_FORMAT_IS_UBWC(fmt);
> -			cdp_cfg->tile_amortize_enable =
> +			cdp_cfg.tile_amortize_enable =
>  					DPU_FORMAT_IS_UBWC(fmt) ||
>  					DPU_FORMAT_IS_TILE(fmt);
> -			cdp_cfg->preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> +			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> 
> -			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, cdp_cfg);
> +			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
>  		}
>  	}
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 087194be3c22..1ee5ca5fcdf7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -23,7 +23,6 @@
>   * @multirect_index: index of the rectangle of SSPP
>   * @multirect_mode: parallel or time multiplex multirect mode
>   * @pending:	whether the current update is still pending
> - * @cdp_cfg:	CDP configuration
>   * @plane_fetch_bw: calculated BW per plane
>   * @plane_clk: calculated clk per plane
>   */
> @@ -36,7 +35,6 @@ struct dpu_plane_state {
>  	uint32_t multirect_mode;
>  	bool pending;
> 
> -	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
>  	u64 plane_fetch_bw;
>  	u64 plane_clk;
>  };
