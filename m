Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E04A5269BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 20:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383511AbiEMS7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 14:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383497AbiEMS65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 14:58:57 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81BF52E51
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 11:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652468335; x=1684004335;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WovHoMuqo9A0fd8tbWBc6pP4IO2QFbNOgAsN/NVWHo4=;
  b=aL7G6bTjwhvorGPpwSMtvSV3E7mCYoGPgv5TRI+CeyLlSKSqlfQUGwXN
   keA6mwTQCM73QBXBGeRACTarAbBQwPUf2ucCS/InuUbehOa4eeU6nayrr
   HYAY08vzI84L1/D/UtXZrUiuyPDxuWYkGKksg993YmLPmKB2NhwYkcV0q
   s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 13 May 2022 11:58:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 11:58:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 11:58:55 -0700
Received: from [10.38.247.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 13 May
 2022 11:58:53 -0700
Message-ID: <9dbc62ba-2170-8f60-fb47-d8aff77c35d3@quicinc.com>
Date:   Fri, 13 May 2022 11:58:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 15/25] drm/msm/dpu: remove dpu_hw_fmt_layout from struct
 dpu_hw_pipe_cfg
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-16-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> Remove dpu_hw_fmt_layout instance from struct dpu_hw_fmt_layout, leaving
> only src_rect and dst_rect.

I believe you meant "remove dpu_hw_fmt_layout instance from struct 
dpu_hw_pipe_cfg" ?.

Otherwise nothing wrong with the change as such, but other than making 
struct dpu_hw_pipe_cfg lighter, is there any other motivation behind 
this change?

Dont you think that dpu_hw_fmt_layout remaining to be a part of the 
struct dpu_hw_pipe_cfg is better and they are indeed tied closely.



> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 ++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  7 ++---
>   3 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 2186506e6315..df6698778b6d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   }
>   
>   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> -		struct dpu_hw_pipe_cfg *cfg)
> +		struct dpu_hw_fmt_layout *layout)
>   {
>   	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	u32 ystride0, ystride1;
> @@ -497,41 +497,41 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		return;
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> -		for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
> +		for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
>   			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
> -					cfg->layout.plane_addr[i]);
> +					layout->plane_addr[i]);
>   	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
> -				cfg->layout.plane_addr[0]);
> +				layout->plane_addr[0]);
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
> -				cfg->layout.plane_addr[2]);
> +				layout->plane_addr[2]);
>   	} else {
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
> -				cfg->layout.plane_addr[0]);
> +				layout->plane_addr[0]);
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
> -				cfg->layout.plane_addr[2]);
> +				layout->plane_addr[2]);
>   	}
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> -		ystride0 = (cfg->layout.plane_pitch[0]) |
> -			(cfg->layout.plane_pitch[1] << 16);
> -		ystride1 = (cfg->layout.plane_pitch[2]) |
> -			(cfg->layout.plane_pitch[3] << 16);
> +		ystride0 = (layout->plane_pitch[0]) |
> +			(layout->plane_pitch[1] << 16);
> +		ystride1 = (layout->plane_pitch[2]) |
> +			(layout->plane_pitch[3] << 16);
>   	} else {
>   		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
>   		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
>   
>   		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>   			ystride0 = (ystride0 & 0xFFFF0000) |
> -				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> +				(layout->plane_pitch[0] & 0x0000FFFF);
>   			ystride1 = (ystride1 & 0xFFFF0000)|
> -				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> +				(layout->plane_pitch[2] & 0x0000FFFF);
>   		} else {
>   			ystride0 = (ystride0 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[0] << 16) &
> +				((layout->plane_pitch[0] << 16) &
>   				 0xFFFF0000);
>   			ystride1 = (ystride1 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[2] << 16) &
> +				((layout->plane_pitch[2] << 16) &
>   				 0xFFFF0000);
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index eee8501ea80d..93b60545ba98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -155,13 +155,11 @@ struct dpu_hw_pixel_ext {
>   
>   /**
>    * struct dpu_hw_pipe_cfg : Pipe description
> - * @layout:    format layout information for programming buffer to hardware
>    * @src_rect:  src ROI, caller takes into account the different operations
>    *             such as decimation, flip etc to program this field
>    * @dest_rect: destination ROI.
>    */
>   struct dpu_hw_pipe_cfg {
> -	struct dpu_hw_fmt_layout layout;
>   	struct drm_rect src_rect;
>   	struct drm_rect dst_rect;
>   };
> @@ -260,10 +258,10 @@ struct dpu_hw_sspp_ops {
>   	/**
>   	 * setup_sourceaddress - setup pipe source addresses
>   	 * @pipe: Pointer to software pipe context
> -	 * @cfg: Pointer to pipe config structure
> +	 * @layout: format layout information for programming buffer to hardware
>   	 */
>   	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
> -			struct dpu_hw_pipe_cfg *cfg);
> +			struct dpu_hw_fmt_layout *layout);
>   
>   	/**
>   	 * setup_csc - setup color space coversion
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index e9421fa2fb2e..a521c0681af6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1052,6 +1052,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	const struct dpu_format *fmt =
>   		to_dpu_format(msm_framebuffer_format(fb));
>   	struct dpu_hw_pipe_cfg pipe_cfg;
> +	struct dpu_hw_fmt_layout layout;
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	struct msm_gem_address_space *aspace = kms->base.aspace;
>   	bool update_src_addr = true;
> @@ -1059,7 +1060,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>   
> -	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
> +	ret = dpu_format_populate_layout(aspace, fb, &layout);
>   	if (ret == -EAGAIN) {
>   		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>   		update_src_addr = false;
> @@ -1070,8 +1071,8 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   	if (update_src_addr &&
>   	    pipe->sspp->ops.setup_sourceaddress) {
> -		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
> -		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
> +		trace_dpu_plane_set_scanout(pipe, &layout);
> +		pipe->sspp->ops.setup_sourceaddress(pipe, &layout);
>   	}
>   
>   	pstate->pending = true;
