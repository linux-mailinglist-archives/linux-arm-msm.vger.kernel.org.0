Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 376A7768787
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjG3TlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjG3TlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:41:14 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536F210CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:41:13 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8145E201AC;
        Sun, 30 Jul 2023 21:41:11 +0200 (CEST)
Date:   Sun, 30 Jul 2023 21:41:10 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
Message-ID: <qn2zf75tqavc6opgfdlt6rd7o36twtq6w6o6dvhcg2tfsuq5qo@px46w7rlpc5m>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
 <20230730003518.349197-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730003518.349197-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-30 03:35:11, Dmitry Baryshkov wrote:
> Inline the _setup_pingpong_ops() function, it makes it easier to handle
> different conditions involving PINGPONG configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 39 ++++++++-----------
>  1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 437d9e62a841..9298c166b213 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -281,27 +281,6 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>  	return 0;
>  }
>  
> -static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
> -				unsigned long features)
> -{
> -	if (test_bit(DPU_PINGPONG_TE, &features)) {
> -		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> -		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
> -		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> -		c->ops.get_line_count = dpu_hw_pp_get_line_count;
> -		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> -	}
> -
> -	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> -		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> -	}
> -
> -	if (test_bit(DPU_PINGPONG_DITHER, &features))
> -		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> -};
> -
>  struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>  		void __iomem *addr)
>  {
> @@ -316,7 +295,23 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>  
>  	c->idx = cfg->id;
>  	c->caps = cfg;
> -	_setup_pingpong_ops(c, c->caps->features);
> +
> +	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
> +		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> +		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
> +		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> +		c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> +	}
> +
> +	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
> +	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
> +		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>  
>  	return c;
>  }
> -- 
> 2.39.2
> 
