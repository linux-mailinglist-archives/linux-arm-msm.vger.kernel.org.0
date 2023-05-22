Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB25170CD8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 00:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjEVWMg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 18:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjEVWMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 18:12:36 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AD79E
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 15:12:34 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 363043F20F;
        Tue, 23 May 2023 00:12:33 +0200 (CEST)
Date:   Tue, 23 May 2023 00:12:31 +0200
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
Subject: Re: [PATCH v2 4/6] drm/msm/dpu: autodetect supported interrupts
Message-ID: <j4sprk5c7wiafq5w5246xab2qgrevyz26bcwukgdk7zcac4ylk@pyt4s2ms5fyk>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522214527.190054-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-23 00:45:25, Dmitry Baryshkov wrote:
> Declaring the mask of supported interrupts proved to be error-prone. It
> is very easy to add a bit with no corresponding backing block or to miss
> the INTF TE bit. Replace this with looping over the enabled INTF blocks
> to setup the irq mask.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index a03d826bb9ad..01f2660a2354 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  {
>  	struct dpu_hw_intr *intr;
>  	int nirq = MDP_INTR_MAX * 32;
> +	unsigned int i;
>  
>  	if (!addr || !m)
>  		return ERR_PTR(-EINVAL);
> @@ -480,7 +481,24 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  
>  	intr->total_irqs = nirq;
>  
> -	intr->irq_mask = m->mdss_irqs;
> +	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
> +			 BIT(MDP_SSPP_TOP0_INTR2) |
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR);
> +	for (i = 0; i < m->intf_count; i++) {
> +		const struct dpu_intf_cfg *intf = &m->intf[i];
> +
> +		if (intf->type == INTF_NONE)
> +			continue;
> +
> +		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
> +
> +		if (test_bit(DPU_INTF_TE, &intf->features)) {
> +			unsigned idx = MDP_INTFn_TEAR_INTR(intf->id);
> +
> +			if (!WARN_ON(idx == -1))

We don't need to validate the catalog?  But warning users about this
(and accidentally turning on all interrupt bits hiding the issue anyway)
is a nice side effect though, as you showed it was already going wrong
in patch 1/6.

OTOH you might have inlined the macro and provided a more useful warning
message (DPU_INTF_TE can only be present on INTF1/2)... and then one
could assert on INTF_DSI etc etc etc...

- Marijn

> +				intr->irq_mask |= BIT(idx);
> +		}
> +	}
>  
>  	spin_lock_init(&intr->irq_lock);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index f329d6d7f646..f0b92c9e3b09 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
>  	MDP_SSPP_TOP0_INTR,
>  	MDP_SSPP_TOP0_INTR2,
>  	MDP_SSPP_TOP0_HIST_INTR,
> +	/* All MDP_INTFn_INTR should come sequentially */
>  	MDP_INTF0_INTR,
>  	MDP_INTF1_INTR,
>  	MDP_INTF2_INTR,
> @@ -33,6 +34,11 @@ enum dpu_hw_intr_reg {
>  	MDP_INTR_MAX,
>  };
>  
> +#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
> +#define MDP_INTFn_TEAR_INTR(intf) (intf == INTF_1 ? MDP_INTF1_TEAR_INTR : \
> +				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
> +				   -1)
> +
>  /* compatibility */
>  #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
>  #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
> -- 
> 2.39.2
> 
