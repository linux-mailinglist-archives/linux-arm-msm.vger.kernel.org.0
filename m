Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADE951E284
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 01:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445009AbiEFXg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 19:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445008AbiEFXg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 19:36:58 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E89712CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 16:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651879993; x=1683415993;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4Kh+GvAbr/YI/Pds4w5Pm9hZwgEXo4x7FfflSbKt5go=;
  b=kEqS1L/Y7dsxBRKvvVz0g854C74R1SxfnzY4yag09Lmu0INhP1Y3eXlk
   iMDr6oEti1upk1jtOhBOvcun5qzyG2G9ry80cJ1dTbRh56o2a4R+LJOgc
   0aYQ4PAZBwlFk7L46A0o1QHorMbN/HtQiOHl6vDFdUHnegtNibz0JG+lN
   Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 06 May 2022 16:33:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 16:33:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 16:33:11 -0700
Received: from [10.111.168.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 16:33:08 -0700
Message-ID: <888eb1c7-67fa-dbb4-a589-da629d175486@quicinc.com>
Date:   Fri, 6 May 2022 16:33:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 12/25] drm/msm/dpu: inline _dpu_plane_set_scanout
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
 <20220209172520.3719906-13-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> In preparation to reworking dpu_plane_sspp_atomic_update() inline the
> _dpu_plane_set_scanout() function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 ++++++++++-------------
>   1 file changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d029ce806039..3ce7dcc285e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -490,28 +490,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
>   	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
>   }
>   
> -static void _dpu_plane_set_scanout(struct drm_plane *plane,
> -		struct dpu_plane_state *pstate,
> -		struct dpu_hw_pipe_cfg *pipe_cfg,
> -		struct drm_framebuffer *fb)
> -{
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> -	struct msm_gem_address_space *aspace = kms->base.aspace;
> -	int ret;
> -
> -	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
> -	if (ret == -EAGAIN)
> -		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
> -	else if (ret)
> -		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> -	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
> -		trace_dpu_plane_set_scanout(&pstate->pipe,
> -					    &pipe_cfg->layout);
> -		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
> -	}
> -}
> -
>   static void _dpu_plane_setup_scaler3(struct dpu_hw_pipe *pipe_hw,
>   		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>   		struct dpu_hw_scaler3_cfg *scale_cfg,
> @@ -1074,10 +1052,27 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	const struct dpu_format *fmt =
>   		to_dpu_format(msm_framebuffer_format(fb));
>   	struct dpu_hw_pipe_cfg pipe_cfg;
> +	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> +	struct msm_gem_address_space *aspace = kms->base.aspace;
> +	bool update_src_addr = true;
> +	int ret;
>   
>   	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>   
> -	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> +	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
> +	if (ret == -EAGAIN) {
> +		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
> +		update_src_addr = false;
> +	} else if (ret) {
> +		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> +		update_src_addr = false;
> +	}
> +
Do we need update_src_addr?

It seems we can just do

if (!ret &&  pipe->sspp->ops.setup_sourceaddress) {
	.....
	.....
}

> +	if (update_src_addr &&
> +	    pipe->sspp->ops.setup_sourceaddress) {
> +		trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
> +		pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
> +	}
>   
>   	pstate->pending = true;
>   
