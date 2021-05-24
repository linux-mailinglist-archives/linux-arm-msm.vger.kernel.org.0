Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005B938F521
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 23:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbhEXVsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 17:48:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:13313 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbhEXVsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 17:48:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621892815; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iuMZ7NHOOCQRFnLCy4z3+T2NDUrS1h9BmXlfUxms4V4=;
 b=HNuQAJyeLVTLqDR2ixrTDSikS7PG7GkhrnMwt4Hl6XR4FpJZtAnBXThf+r5VaRBHIEZaIqNs
 75PYt9DPr/Q7hVZNYkLynXFnaz/walMLd0hmsRBGaPvg4F/FP0plaPGni9KXgLwJq7/htpu5
 gGB4JuFAFJSLUN691G8MXe2msEY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60ac1ec6ceebd0e93208ed3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 21:46:46
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9C2DC433F1; Mon, 24 May 2021 21:46:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 683CDC433D3;
        Mon, 24 May 2021 21:46:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 14:46:45 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 2/6] drm/msm/dpu: hw_intr: always call
 dpu_hw_intr_clear_intr_status_nolock
In-Reply-To: <20210516202910.2141079-3-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
 <20210516202910.2141079-3-dmitry.baryshkov@linaro.org>
Message-ID: <038aa09417740fd70b97312879c7facb@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-16 13:29, Dmitry Baryshkov wrote:
> Always call dpu_hw_intr_clear_intr_status_nolock() from the
> dpu_hw_intr_dispatch_irqs(). This simplifies the callback function
> (which call clears the interrupts anyway) and enforces clearing the hw
> interrupt status.
> 
In the subject line you can remove the "hw_intr:"

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
With that nit fixed,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  9 -----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 39 +++++++++----------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  9 -----
>  3 files changed, 18 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index 54b34746a587..fd11a2aeab6c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -41,15 +41,6 @@ static void dpu_core_irq_callback_handler(void
> *arg, int irq_idx)
>  		if (cb->func)
>  			cb->func(cb->arg, irq_idx);
>  	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> -
> -	/*
> -	 * Clear pending interrupt status in HW.
> -	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
> -	 *       spinlock, so it is safe to clear any interrupt status here.
> -	 */
> -	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
> -			dpu_kms->hw_intr,
> -			irq_idx);
>  }
> 
>  int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index cf9bfd45aa59..8bd22e060437 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -1362,6 +1362,22 @@ static int dpu_hw_intr_irqidx_lookup(struct
> dpu_hw_intr *intr,
>  	return -EINVAL;
>  }
> 
> +static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr 
> *intr,
> +		int irq_idx)
> +{
> +	int reg_idx;
> +
> +	if (!intr)
> +		return;
> +
> +	reg_idx = dpu_irq_map[irq_idx].reg_idx;
> +	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> +			dpu_irq_map[irq_idx].irq_mask);
> +
> +	/* ensure register writes go through */
> +	wmb();
> +}
> +
>  static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  		void (*cbfunc)(void *, int),
>  		void *arg)
> @@ -1430,9 +1446,8 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  				 */
>  				if (cbfunc)
>  					cbfunc(arg, irq_idx);
> -				else
> -					intr->ops.clear_intr_status_nolock(
> -							intr, irq_idx);
> +
> +				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
> 
>  				/*
>  				 * When callback finish, clear the irq_status
> @@ -1597,23 +1612,6 @@ static int dpu_hw_intr_disable_irqs(struct
> dpu_hw_intr *intr)
>  	return 0;
>  }
> 
> -
> -static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr 
> *intr,
> -		int irq_idx)
> -{
> -	int reg_idx;
> -
> -	if (!intr)
> -		return;
> -
> -	reg_idx = dpu_irq_map[irq_idx].reg_idx;
> -	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> -			dpu_irq_map[irq_idx].irq_mask);
> -
> -	/* ensure register writes go through */
> -	wmb();
> -}
> -
>  static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
>  		int irq_idx, bool clear)
>  {
> @@ -1655,7 +1653,6 @@ static void __setup_intr_ops(struct 
> dpu_hw_intr_ops *ops)
>  	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
>  	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
>  	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
> -	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
>  	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 5a1c304ba93f..5bade5637ecc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -142,15 +142,6 @@ struct dpu_hw_intr_ops {
>  			void (*cbfunc)(void *arg, int irq_idx),
>  			void *arg);
> 
> -	/**
> -	 * clear_intr_status_nolock() - clears the HW interrupts without lock
> -	 * @intr:	HW interrupt handle
> -	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
> -	 */
> -	void (*clear_intr_status_nolock)(
> -			struct dpu_hw_intr *intr,
> -			int irq_idx);
> -
>  	/**
>  	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
>  	 *                        based on given lookup IRQ index.
