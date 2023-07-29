Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86085768123
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 21:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjG2TBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 15:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG2TBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 15:01:37 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242ABE7D
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 12:01:35 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 447393F34C;
        Sat, 29 Jul 2023 21:01:33 +0200 (CEST)
Date:   Sat, 29 Jul 2023 21:01:31 +0200
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
Subject: Re: [PATCH v3 5/6] drm/msm/dpu: stop using raw IRQ indices in the
 kernel output
Message-ID: <e56epivej35nflx3bvs4noiyjilasxeintrlnvmva27x6nmitf@mdasompabaq7>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Title suggestion: replace "stop using" with "Replace RAW IRQ indices in
prints with tuple" or something else that describes what the new case is
that we can expect after this PR was applied (at your discretion, it
might be hard to fit that in 72 chars).  Otherwise this reads as if you
just dropped the index from printk's and systfs altogether.

On 2023-07-29 02:31:59, Dmitry Baryshkov wrote:
> In preparation to reworking IRQ indcies, stop using raw indices in
> kernel output (both printk and debugfs). Instead use a pair of register
> index and bit. This corresponds closer to the values in HW catalog.

This is rather painful to read:

irq=[%d, %d]
IRQ:[%d, %d]
IRQ: [%d, %d]
IRQ [%d, %d]

Four variations within the first **four** hunks.  It looks like you
tried to consistenize some of them, but can we please go all the way?

Perhaps we also want to correct the format in dpu_trace.h?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 49 ++++++++++++-------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 308b122059cd..6071d3f05b0c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -199,6 +199,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> +#define DPU_IRQ_BIT(irq_idx)	(ffs(DPU_IRQ_MASK(irq_idx)) - 1)
>  
>  static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
>  					 int irq_idx)
> @@ -221,10 +222,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>  {
>  	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
>  
> -	VERB("irq_idx=%d\n", irq_idx);
> +	VERB("irq=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	if (!irq_entry->cb)
> -		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> +		DRM_ERROR("no registered cb, IRQ:[%d, %d]\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	atomic_inc(&irq_entry->count);
>  
> @@ -306,7 +308,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		return -EINVAL;
>  
>  	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
> -		pr_err("invalid IRQ index: [%d]\n", irq_idx);
> +		pr_err("invalid IRQ: [%d, %d]\n",
> +		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> @@ -342,7 +345,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
>  	}
>  
> -	pr_debug("DPU IRQ %d %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
> +	pr_debug("DPU IRQ [%d, %d] %senabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
> +		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
>  			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
>  
>  	return 0;
> @@ -359,7 +363,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		return -EINVAL;
>  
>  	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
> -		pr_err("invalid IRQ index: [%d]\n", irq_idx);
> +		pr_err("invalid IRQ: [%d, %d]\n",
> +		       DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> @@ -391,7 +396,8 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
>  	}
>  
> -	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", irq_idx, dbgstr,
> +	pr_debug("DPU IRQ [%d, %d] %sdisabled: MASK:0x%.8lx, CACHE-MASK:0x%.8x\n",
> +		 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), dbgstr,
>  			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
>  
>  	return 0;
> @@ -444,7 +450,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>  		return 0;
>  
>  	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
> -		pr_err("invalid IRQ index: [%d]\n", irq_idx);
> +		pr_err("invalid IRQ: [%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return 0;
>  	}
>  
> @@ -520,16 +526,19 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  	int ret;
>  
>  	if (!irq_cb) {
> -		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
> +		DPU_ERROR("invalid ird_IRQ:[%d, %d] irq_cb:%ps\n",

I think this was a typo that should have been irq_idx in the original
code, so this just becomes IRQ (with one of the variations to settle on,
as brought up above).

> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
>  		return -EINVAL;
>  	}
>  
>  	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
> -		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> +		DPU_ERROR("invalid IRQ: [%d, %d]\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> -	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> +	VERB("[%pS] irq=[%d, %d]\n", __builtin_return_address(0),
> +	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> @@ -548,8 +557,8 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  				dpu_kms->hw_intr,
>  				irq_idx);
>  	if (ret)
> -		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
> -					irq_idx);
> +		DPU_ERROR("Fail to enable IRQ for [%d, %d]\n",

And let's just make this `Failed to enable IRQ:[%d, %d]`, following one
of the variations discussed above.

> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  	trace_dpu_irq_register_success(irq_idx);
> @@ -564,19 +573,21 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  	int ret;
>  
>  	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
> -		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> +		DPU_ERROR("invalid IRQ: [%d, %d]\n",
> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  		return -EINVAL;
>  	}
>  
> -	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> +	VERB("[%pS] irq=[%d, %d]\n", __builtin_return_address(0),
> +	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  	trace_dpu_core_irq_unregister_callback(irq_idx);
>  
>  	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
>  	if (ret)
> -		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
> -					irq_idx, ret);
> +		DPU_ERROR("Fail to disable IRQ for [%d, %d]: %d\n",

And let's drop "for" here too, it's unreadable.

- Marijn

> +			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), ret);
>  
>  	irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, irq_idx);
>  	irq_entry->cb = NULL;
> @@ -606,7 +617,8 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
>  		if (irq_count || cb)
> -			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
> +			seq_printf(s, "IRQ:[%d, %d] count:%d cb:%ps\n",
> +				   DPU_IRQ_REG(i), DPU_IRQ_BIT(i), irq_count, cb);
>  	}
>  
>  	return 0;
> @@ -652,7 +664,8 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
>  	for (i = 0; i < DPU_NUM_IRQS; i++) {
>  		irq_entry = dpu_core_irq_get_entry(dpu_kms->hw_intr, i);
>  		if (irq_entry->cb)
> -			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> +			DPU_ERROR("irq=[%d, %d] still enabled/registered\n",
> +				  DPU_IRQ_REG(i), DPU_IRQ_BIT(i));
>  	}
>  
>  	dpu_clear_irqs(dpu_kms);
> -- 
> 2.39.2
> 
