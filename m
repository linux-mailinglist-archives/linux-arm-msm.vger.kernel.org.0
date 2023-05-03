Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A296F52A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 10:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjECIFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 04:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjECIEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 04:04:52 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DF23C3F
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 01:03:53 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 315111F96A;
        Wed,  3 May 2023 10:03:35 +0200 (CEST)
Date:   Wed, 3 May 2023 10:03:33 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] drm/msm/dpu: add PINGPONG_NONE to disconnect DSC
 from PINGPONG
Message-ID: <csyytksa77vbi2hwwv25voocdf3khsbp2kxtd4jcucoobcpjdv@6xkqzk33dn5u>
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-5-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683061382-32651-5-git-send-email-quic_khsieh@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-02 14:02:59, Kuogee Hsieh wrote:
> During DSC setup, the crossbar mux need to be programmed to engage
> DSC to specified PINGPONG. Hence during tear down, the crossbar mux
> need to be reset to disengage DSC from PINGPONG. This patch add
> PINGPONG_NONE to serve as disable to reset crossbar mux.

This patch doesn't *just add* PINGPONG_NONE to reset the crossbar; that
functionality was already available thanks to a `bool enable` function
parameter.  Instead it should explain why you think PINGPONG_NONE is
more convenient than passing a bool that warrants this replacement.
(Hint: I think because you don't have a hw_pp->idx available in the
 teardown path, and/or its value is not relevant for the disable case
 anyway.)

In addition I don't see this series use PINGPONG_NONE anywhere yet: will
that be added in the DSC 1.2 series for DP (to support hotplug)?

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 7 +++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 3 ++-
>  4 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1dc5dbe..d9ad334 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1839,7 +1839,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>  		hw_pp->ops.setup_dsc(hw_pp);
>  
>  	if (hw_dsc->ops.dsc_bind_pingpong_blk)
> -		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, hw_pp->idx);
>  
>  	if (hw_pp->ops.enable_dsc)
>  		hw_pp->ops.enable_dsc(hw_pp);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 4a6bbcc..3e68d47 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -157,7 +157,6 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
>  
>  static void dpu_hw_dsc_bind_pingpong_blk(
>  		struct dpu_hw_dsc *hw_dsc,
> -		bool enable,
>  		const enum dpu_pingpong pp)
>  {
>  	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> @@ -166,13 +165,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>  
>  	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
>  
> -	if (enable)
> +	if (pp)
>  		mux_cfg = (pp - PINGPONG_0) & 0x7;
>  
>  	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
> -			enable ? "Binding" : "Unbinding",
> +			pp ? "Binding" : "Unbinding",
>  			hw_dsc->idx - DSC_0,
> -			enable ? "to" : "from",
> +			pp ? "to" : "from",
>  			pp - PINGPONG_0);

PINGPONG_NONE - PINGPONG_0 = -1, so this whole debug log likely needs to
be rewritten for the disable case as we don't know what PINGPONG it is
being unbound from.  How about:

	if (pp)
		DRM_DEBUG_KMS("Binding dsc:%d to pp:%d\n",
				hw_dsc->idx - DSC_0,
				pp - PINGPONG_0);
	else
		DRM_DEBUG_KMS("Unbinding dsc:%d from any pp\n",
				hw_dsc->idx - DSC_0);

- Marijn

>  
>  	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index 287ec5f..138080a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -44,7 +44,6 @@ struct dpu_hw_dsc_ops {
>  				  struct drm_dsc_config *dsc);
>  
>  	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
> -				  bool enable,
>  				  enum dpu_pingpong pp);
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 2d9192a..56826a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -191,7 +191,8 @@ enum dpu_dsc {
>  };
>  
>  enum dpu_pingpong {
> -	PINGPONG_0 = 1,
> +	PINGPONG_NONE,
> +	PINGPONG_0,
>  	PINGPONG_1,
>  	PINGPONG_2,
>  	PINGPONG_3,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
