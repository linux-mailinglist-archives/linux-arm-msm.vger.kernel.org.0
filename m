Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937F06F5258
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 09:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjECHx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 03:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjECHxK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 03:53:10 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EF340F1
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 00:53:07 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4DBEA1F512;
        Wed,  3 May 2023 09:53:05 +0200 (CEST)
Date:   Wed, 3 May 2023 09:53:03 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit
Message-ID: <b23c55ffjxvjuqbjzaa7rkueaivori6lt2h2kczi7cfzhuvuz3@pvhex7vv7ukp>
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-02 14:02:57, Kuogee Hsieh wrote:
> Legacy DPU requires PP block to be involved during DSC setting up.

This patch should clarify that "legacy" means DPU < 7.0.0, as we found
out in [1] that PINGPONG has no more register remaining in 7.x.  In
addition, it seems that the DCE enable register/flag moved to INTF, as
added by Jessica in [2].  Perhaps those patches should be part of this
series too, and this patch should mention that it was moved?

[1]: https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-7-27ce1a5ab5c6@somainline.org/
[2]: https://lore.kernel.org/linux-arm-msm/20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com/T/#t

> This patch adds DDPU_PINGPONG_DSC feature bit to indicate that both
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_enable() pingpong ops
> functions are required to complete DSC data path set up and start

datapath setup*

As already suggested by Dmitry's review in a different way, this patch
doesn't "indicate that both ops are required to complete DSC datapath
setup", this patch removes those callbacks from PP since DPU 7.0.0 as
the registers are no longer present (and have been moved to the INTF in
some form).

The *implementation* is good though, and I'd r-b it after addressing the
nits - thanks!

> DSC engine.
> 
> Reported-by : Marijn Suijten <marijn.suijten@somainline.org>

drop the space before :.

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h  | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd..c07a6b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,6 +144,7 @@ enum {
>   * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>   * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
>   * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DSC,	    PP ops functions required for DSC

Mixing tab indentation, and the comma shouldn't be there.

- Marijn

>   * @DPU_PINGPONG_MAX
>   */
>  enum {
> @@ -152,6 +153,7 @@ enum {
>  	DPU_PINGPONG_SPLIT,
>  	DPU_PINGPONG_SLAVE,
>  	DPU_PINGPONG_DITHER,
> +	DPU_PINGPONG_DSC,
>  	DPU_PINGPONG_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 3822e06..f255a04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>  	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>  	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> -	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +
> +	if (features & BIT(DPU_PINGPONG_DSC)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
>  
>  	if (test_bit(DPU_PINGPONG_DITHER, &features))
>  		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
