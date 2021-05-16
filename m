Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F72381CA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 06:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhEPEb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 00:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhEPEb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 00:31:56 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BEBC061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 21:30:42 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so2818352otp.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 21:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e74y6ugh/2n9+XcEKST7FME5xcBBrUDXAPlw9l3AAlY=;
        b=Gqr7tPAHSdEwQ7gR4T5FNkkqDjPSImq77N7EISWH1gkQ+DKhijHinD5fIjlD52XmKA
         1PMhamuSIJxKeVMwP57gJ+ocFYPYvDTsWBS55QU0TPZWbb6mEJNn6l9AiiADNpTfVf8t
         m07fjPP0AzIbvMh+TUV1/+LP324sntiT9y+OHvGHe7T61N1xNoh2y3vgPYcVjwFMxA8p
         GuVjMWXhv3u/rEfJ9lRVgi3gVPi9Y/PrVyOooSkhVAGwT6Mm/FOVoqjfu5Dh1Uq4uGl6
         Qc6LRQzIiJYnE4ep2/jRsBnNoENgaBmBK05i+Ov5BLMCMRJWssSV/D/WSv9ZY3SBjekO
         xWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e74y6ugh/2n9+XcEKST7FME5xcBBrUDXAPlw9l3AAlY=;
        b=JP4NvBbZZ74Yla2ZSaXjUlI3ur18XoJKTA2AWFeFb+kb9MjeNnBqkNAg2eITzAO2Na
         wZ1NhBzq0zSfoiuUl9uOAwwaJIkyAJUfvb4eoGRwnTJlI2GFSxcUkyDYn5Z6KBQmGh93
         Ir6uOR2lPbMUlJ1LcCiYyRikY7JL88Ljc+d5EiCl0HQlgTox6HXQ2ZZJ2HVJ1JGc6i5R
         X363H+ymld3ErkkIxJqA8ORKcXa1teZcE+2G8/leOqDmspG4K4scQjJvJA3SSgWleGiC
         Ed0A8eP6GRwOX3wUc4aaddBq5AnRZNPs+NE3zqlUbdaLp2uvtQ087QL8LJalqI5cXi+X
         tmSw==
X-Gm-Message-State: AOAM533AEAqTlcrJqcMbGgbUFgEa5ALM4SPz6D8Kb7oX2ctw5Qrehw5B
        /7sD/xUfwfF9d+QB4Hr1B3OUhA==
X-Google-Smtp-Source: ABdhPJxJyNYuHCCf8qTD2zmDNac6oibp47z0oDTAoLDk4tnIlzjo9JBd8+7dPXXQiRUrYtfCSmRQ1w==
X-Received: by 2002:a9d:4f15:: with SMTP id d21mr3019535otl.155.1621139441797;
        Sat, 15 May 2021 21:30:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z15sm2399468otp.20.2021.05.15.21.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 21:30:41 -0700 (PDT)
Date:   Sat, 15 May 2021 23:30:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v1 1/3] drm/msm/dpu: merge
 dpu_hw_intr_get_interrupt_statuses into dpu_hw_intr_dispatch_irqs
Message-ID: <20210516043039.GO2484@yoga>
References: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
 <20210412000954.2049141-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412000954.2049141-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 11 Apr 19:09 CDT 2021, Dmitry Baryshkov wrote:

> There is little sense in reading interrupt statuses and right after that
> going after the array of statuses to dispatch them. Merge both loops
> into single function doing read and dispatch.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 10 +--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 66 ++++++-------------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  8 ---
>  3 files changed, 20 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index cdec3fbe6ff4..54b34746a587 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -376,15 +376,6 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
>  
>  irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
>  {
> -	/*
> -	 * Read interrupt status from all sources. Interrupt status are
> -	 * stored within hw_intr.
> -	 * Function will also clear the interrupt status after reading.
> -	 * Individual interrupt status bit will only get stored if it
> -	 * is enabled.
> -	 */
> -	dpu_kms->hw_intr->ops.get_interrupt_statuses(dpu_kms->hw_intr);
> -
>  	/*
>  	 * Dispatch to HW driver to handle interrupt lookup that is being
>  	 * fired. When matching interrupt is located, HW driver will call to
> @@ -392,6 +383,7 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
>  	 * dpu_core_irq_callback_handler will perform the registered function
>  	 * callback, and do the interrupt status clearing once the registered
>  	 * callback is finished.
> +	 * Function will also clear the interrupt status after reading.
>  	 */
>  	dpu_kms->hw_intr->ops.dispatch_irqs(
>  			dpu_kms->hw_intr,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 48c96b812126..cf9bfd45aa59 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -1371,6 +1371,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  	int start_idx;
>  	int end_idx;
>  	u32 irq_status;
> +	u32 enable_mask;
>  	unsigned long irq_flags;
>  
>  	if (!intr)
> @@ -1383,8 +1384,6 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  	 */
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
>  	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
> -		irq_status = intr->save_irq_status[reg_idx];
> -
>  		/*
>  		 * Each Interrupt register has a range of 64 indexes, and
>  		 * that is static for dpu_irq_map.
> @@ -1396,6 +1395,20 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  			start_idx >= ARRAY_SIZE(dpu_irq_map))
>  			continue;
>  
> +		/* Read interrupt status */
> +		irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
> +
> +		/* Read enable mask */
> +		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
> +
> +		/* and clear the interrupt */
> +		if (irq_status)
> +			DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> +				     irq_status);
> +
> +		/* Finally update IRQ status based on enable mask */
> +		irq_status &= enable_mask;
> +
>  		/*
>  		 * Search through matching intr status from irq map.
>  		 * start_idx and end_idx defined the search range in
> @@ -1429,6 +1442,10 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  				irq_status &= ~dpu_irq_map[irq_idx].irq_mask;
>  			}
>  	}
> +
> +	/* ensure register writes go through */
> +	wmb();
> +
>  	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
>  }
>  
> @@ -1580,41 +1597,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
>  	return 0;
>  }
>  
> -static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
> -{
> -	int i;
> -	u32 enable_mask;
> -	unsigned long irq_flags;
> -
> -	if (!intr)
> -		return;
> -
> -	spin_lock_irqsave(&intr->irq_lock, irq_flags);
> -	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> -		if (!test_bit(i, &intr->irq_mask))
> -			continue;
> -
> -		/* Read interrupt status */
> -		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
> -				dpu_intr_set[i].status_off);
> -
> -		/* Read enable mask */
> -		enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[i].en_off);
> -
> -		/* and clear the interrupt */
> -		if (intr->save_irq_status[i])
> -			DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off,
> -					intr->save_irq_status[i]);
> -
> -		/* Finally update IRQ status based on enable mask */
> -		intr->save_irq_status[i] &= enable_mask;
> -	}
> -
> -	/* ensure register writes go through */
> -	wmb();
> -
> -	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
> -}
>  
>  static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
>  		int irq_idx)
> @@ -1673,7 +1655,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
>  	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
>  	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
>  	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
> -	ops->get_interrupt_statuses = dpu_hw_intr_get_interrupt_statuses;
>  	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
>  	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
>  }
> @@ -1710,14 +1691,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> -	intr->save_irq_status = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
> -			GFP_KERNEL);
> -	if (intr->save_irq_status == NULL) {
> -		kfree(intr->cache_irq_mask);
> -		kfree(intr);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
>  	intr->irq_mask = m->mdss_irqs;
>  	intr->obsolete_irq = m->obsolete_irq;
>  
> @@ -1730,7 +1703,6 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
>  {
>  	if (intr) {
>  		kfree(intr->cache_irq_mask);
> -		kfree(intr->save_irq_status);
>  		kfree(intr);
>  	}
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 5d6f9a7a5195..5a1c304ba93f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -142,14 +142,6 @@ struct dpu_hw_intr_ops {
>  			void (*cbfunc)(void *arg, int irq_idx),
>  			void *arg);
>  
> -	/**
> -	 * get_interrupt_statuses - Gets and store value from all interrupt
> -	 *                          status registers that are currently fired.
> -	 * @intr:	HW interrupt handle
> -	 */
> -	void (*get_interrupt_statuses)(
> -			struct dpu_hw_intr *intr);
> -
>  	/**
>  	 * clear_intr_status_nolock() - clears the HW interrupts without lock
>  	 * @intr:	HW interrupt handle
> -- 
> 2.30.2
> 
