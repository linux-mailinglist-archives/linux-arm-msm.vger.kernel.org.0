Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C625D3EF884
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 05:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhHRDat (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 23:30:49 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60702 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbhHRDas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 23:30:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629257414; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1y56E3o44D1mWDD4Gttj6uFNfqf7S9hSJW9noeXOgE4=;
 b=fdf/HRxehEPLX+EeLELnfr6xq7LkwwHn+D6hVeizVKJpWGuVcu+l6qbcXFYp/p1uanZlQeMd
 c+Nvh+c7A1M630EZbXJx1cNjeA+QGlWuDT19S6/3Tu3WzlInD6p5l6FuoJrq+qH2Xe7d6RxU
 oX6Ko7i3sgYpITEIWfgqY9qwUD0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 611c7ebe9507ca1a34797be1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:30:06
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E822AC43616; Wed, 18 Aug 2021 03:30:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E681AC4338F;
        Wed, 18 Aug 2021 03:30:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 20:30:02 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 4/7] drm/msm/dpu: allow just single IRQ
 callback
In-Reply-To: <20210617222029.463045-5-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
 <20210617222029.463045-5-dmitry.baryshkov@linaro.org>
Message-ID: <94b676d85f52bcc1cdb051d4fff7af8a@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-17 15:20, Dmitry Baryshkov wrote:
> DPU interrupts code allows multiple callbacks per interrut. In reality
/interrupt
> none of the interrupts is shared between blocks (and will probably 
> never
> be). Drop support for registering multiple callbacks per interrupt to
> simplify interrupt handling code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I need to check on why we had this design originally and we still do.
the idx with which we are registering today can generate only one hw 
interrupt.
But i am not sure if something for planned for future use. Will update 
in a day or two.

meanwhile some comments and questions below.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  18 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   2 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  10 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 144 +++++++-----------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  10 +-
>  9 files changed, 86 insertions(+), 134 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index 90ae6c9ccc95..44ab97fb2964 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -46,10 +46,8 @@ u32 dpu_core_irq_read(
>   *                             interrupt
>   * @dpu_kms:		DPU handle
>   * @irq_idx:		irq index
> - * @irq_cb:		IRQ callback structure, containing callback function
> - *			and argument. Passing NULL for irq_cb will unregister
> - *			the callback for the given irq_idx
> - *			This must exist until un-registration.
> + * @irq_cb:		IRQ callback funcion.
> + * @irq_arg:		IRQ callback argument.
>   * @return:		0 for success registering callback, otherwise failure
>   *
>   * This function supports registration of multiple callbacks for each
> interrupt.
> @@ -57,17 +55,16 @@ u32 dpu_core_irq_read(
>  int dpu_core_irq_register_callback(
>  		struct dpu_kms *dpu_kms,
>  		int irq_idx,
> -		struct dpu_irq_callback *irq_cb);
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg);
> 
>  /**
>   * dpu_core_irq_unregister_callback - For unregistering callback
> function on IRQ
>   *                             interrupt
>   * @dpu_kms:		DPU handle
>   * @irq_idx:		irq index
> - * @irq_cb:		IRQ callback structure, containing callback function
> - *			and argument. Passing NULL for irq_cb will unregister
> - *			the callback for the given irq_idx
> - *			This must match with registration.
> + * @irq_cb:		IRQ callback funcion.
/function
this typo is there in multiple places
> + * @irq_arg:		IRQ callback argument.
>   * @return:		0 for success registering callback, otherwise failure
>   *
>   * This function supports registration of multiple callbacks for each
> interrupt.
> @@ -75,7 +72,8 @@ int dpu_core_irq_register_callback(
>  int dpu_core_irq_unregister_callback(
>  		struct dpu_kms *dpu_kms,
>  		int irq_idx,
> -		struct dpu_irq_callback *irq_cb);
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg);
> 
>  /**
>   * dpu_debugfs_core_irq_init - register core irq debugfs
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1c04b7cce43e..d3557b0f4db9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -310,7 +310,7 @@ int dpu_encoder_helper_wait_for_irq(struct
> dpu_encoder_phys *phys_enc,
>  				      phys_enc->hw_pp->idx - PINGPONG_0,
>  				      atomic_read(wait_info->atomic_cnt));
>  			local_irq_save(flags);
> -			irq->cb.func(phys_enc, irq->irq_idx);
> +			irq->func(phys_enc, irq->irq_idx);
>  			local_irq_restore(flags);
>  			ret = 0;
>  		} else {
> @@ -352,7 +352,7 @@ int dpu_encoder_helper_register_irq(struct
> dpu_encoder_phys *phys_enc,
>  	}
> 
>  	ret = dpu_core_irq_register_callback(phys_enc->dpu_kms, irq->irq_idx,
> -			&irq->cb);
> +			irq->func, phys_enc);
>  	if (ret) {
>  		DPU_ERROR_PHYS(phys_enc,
>  			"failed to register IRQ callback for %s\n",
> @@ -384,7 +384,7 @@ int dpu_encoder_helper_unregister_irq(struct
> dpu_encoder_phys *phys_enc,
>  	}
> 
>  	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, 
> irq->irq_idx,
> -			&irq->cb);
> +			irq->func, phys_enc);
>  	if (ret) {
>  		DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
>  			  DRMID(phys_enc->parent), intr_idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..80d87871fd94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -174,7 +174,7 @@ struct dpu_encoder_irq {
>  	const char *name;
>  	enum dpu_intr_idx intr_idx;
>  	int irq_idx;
> -	struct dpu_irq_callback cb;
> +	void (*func)(void *arg, int irq_idx);
>  };
> 
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index aa01698d6b25..f921a5c99456 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -782,30 +782,28 @@ struct dpu_encoder_phys 
> *dpu_encoder_phys_cmd_init(
>  	phys_enc->enable_state = DPU_ENC_DISABLED;
>  	for (i = 0; i < INTR_IDX_MAX; i++) {
>  		irq = &phys_enc->irq[i];
> -		INIT_LIST_HEAD(&irq->cb.list);
>  		irq->irq_idx = -EINVAL;
> -		irq->cb.arg = phys_enc;
>  	}
> 
>  	irq = &phys_enc->irq[INTR_IDX_CTL_START];
>  	irq->name = "ctl_start";
>  	irq->intr_idx = INTR_IDX_CTL_START;
> -	irq->cb.func = dpu_encoder_phys_cmd_ctl_start_irq;
> +	irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
>  	irq->name = "pp_done";
>  	irq->intr_idx = INTR_IDX_PINGPONG;
> -	irq->cb.func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> +	irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_RDPTR];
>  	irq->name = "pp_rd_ptr";
>  	irq->intr_idx = INTR_IDX_RDPTR;
> -	irq->cb.func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> +	irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>  	irq->name = "underrun";
>  	irq->intr_idx = INTR_IDX_UNDERRUN;
> -	irq->cb.func = dpu_encoder_phys_cmd_underrun_irq;
> +	irq->func = dpu_encoder_phys_cmd_underrun_irq;
> 
>  	atomic_set(&phys_enc->vblank_refcount, 0);
>  	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 185379b18572..437af231d6a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -725,20 +725,18 @@ struct dpu_encoder_phys 
> *dpu_encoder_phys_vid_init(
>  	phys_enc->enc_spinlock = p->enc_spinlock;
>  	for (i = 0; i < INTR_IDX_MAX; i++) {
>  		irq = &phys_enc->irq[i];
> -		INIT_LIST_HEAD(&irq->cb.list);
>  		irq->irq_idx = -EINVAL;
> -		irq->cb.arg = phys_enc;
>  	}
> 
>  	irq = &phys_enc->irq[INTR_IDX_VSYNC];
>  	irq->name = "vsync_irq";
>  	irq->intr_idx = INTR_IDX_VSYNC;
> -	irq->cb.func = dpu_encoder_phys_vid_vblank_irq;
> +	irq->func = dpu_encoder_phys_vid_vblank_irq;
> 
>  	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>  	irq->name = "underrun";
>  	irq->intr_idx = INTR_IDX_UNDERRUN;
> -	irq->cb.func = dpu_encoder_phys_vid_underrun_irq;
> +	irq->func = dpu_encoder_phys_vid_underrun_irq;
> 
>  	atomic_set(&phys_enc->vblank_refcount, 0);
>  	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index d2b6dca487e3..7062e7f0e860 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -127,21 +127,17 @@ static const struct dpu_intr_reg dpu_intr_set[] = 
> {
>   */
>  static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int 
> irq_idx)
>  {
> -	struct dpu_irq_callback *cb;
> -
>  	VERB("irq_idx=%d\n", irq_idx);
> 
> -	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]))
> +	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
>  		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> 
> -	atomic_inc(&dpu_kms->hw_intr->irq_counts[irq_idx]);
> +	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
> 
>  	/*
>  	 * Perform registered function callback
>  	 */
> -	list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[irq_idx], list)
> -		if (cb->func)
> -			cb->func(cb->arg, irq_idx);
> +	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg,
> irq_idx);
>  }
> 
>  irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
> @@ -389,24 +385,18 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem 
> *addr,
>  		struct dpu_mdss_cfg *m)
>  {
>  	struct dpu_hw_intr *intr;
> +	int nirq = MDP_INTR_MAX * 32;
> 
>  	if (!addr || !m)
>  		return ERR_PTR(-EINVAL);
> 
> -	intr = kzalloc(sizeof(*intr), GFP_KERNEL);
> +	intr = kzalloc(struct_size(intr, irq_tbl, nirq), GFP_KERNEL);
>  	if (!intr)
>  		return ERR_PTR(-ENOMEM);
> 
>  	__intr_offset(m, addr, &intr->hw);
> 
> -	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
> -
> -	intr->cache_irq_mask = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
> -			GFP_KERNEL);
> -	if (intr->cache_irq_mask == NULL) {
> -		kfree(intr);
> -		return ERR_PTR(-ENOMEM);
> -	}
> +	intr->total_irqs = nirq;
> 
>  	intr->irq_mask = m->mdss_irqs;
> 
> @@ -417,31 +407,19 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem 
> *addr,
> 
>  void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
>  {
> -	if (intr) {
> -		kfree(intr->cache_irq_mask);
> -
> -		kfree(intr->irq_cb_tbl);
> -		kfree(intr->irq_counts);
> -
> +	if (intr)
>  		kfree(intr);
> -	}
>  }
> 
>  int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int 
> irq_idx,
> -		struct dpu_irq_callback *register_irq_cb)
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg)
>  {
>  	unsigned long irq_flags;
> +	int ret;
> 
> -	if (!dpu_kms->hw_intr->irq_cb_tbl) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!register_irq_cb || !register_irq_cb->func) {
> -		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> -				register_irq_cb != NULL,
> -				register_irq_cb ?
> -					register_irq_cb->func != NULL : -1);
> +	if (!irq_cb) {
> +		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
>  		return -EINVAL;
>  	}
> 
> @@ -453,39 +431,37 @@ int dpu_core_irq_register_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> 
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> -	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
> -	list_del_init(&register_irq_cb->list);
> -	list_add_tail(&register_irq_cb->list,
> -			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx]);
> -	if (list_is_first(&register_irq_cb->list,
> -			&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
> -		int ret = dpu_hw_intr_enable_irq_locked(
> +
> +	if (dpu_kms->hw_intr->irq_tbl[irq_idx].cb) {
> +		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +
> +		return -EBUSY;
> +	}
Why is this check present? Ideally there should be only one callback 
registered.
> +
> +	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
> +	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
> +	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
> +
> +	ret = dpu_hw_intr_enable_irq_locked(
>  				dpu_kms->hw_intr,
>  				irq_idx);
> -		if (ret)
> -			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
> +	if (ret)
> +		DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
>  					irq_idx);
> -	}
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> 
>  	return 0;
>  }
> 
>  int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int 
> irq_idx,
> -		struct dpu_irq_callback *register_irq_cb)
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg)
>  {
>  	unsigned long irq_flags;
> +	int ret;
> 
> -	if (!dpu_kms->hw_intr->irq_cb_tbl) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!register_irq_cb || !register_irq_cb->func) {
> -		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> -				register_irq_cb != NULL,
> -				register_irq_cb ?
> -					register_irq_cb->func != NULL : -1);
> +	if (!irq_cb) {
> +		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
>  		return -EINVAL;
>  	}
> 
> @@ -497,18 +473,23 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> 
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> -	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
> -	list_del_init(&register_irq_cb->list);
> -	/* empty callback list but interrupt is still enabled */
> -	if (list_empty(&dpu_kms->hw_intr->irq_cb_tbl[irq_idx])) {
> -		int ret = dpu_hw_intr_disable_irq_locked(
> -				dpu_kms->hw_intr,
> -				irq_idx);
> -		if (ret)
> -			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
> -					irq_idx);
> -		VERB("irq_idx=%d ret=%d\n", irq_idx, ret);
> +	trace_dpu_core_irq_unregister_callback(irq_idx, irq_cb);
> +
> +	if (WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb != irq_cb ||
> +		    dpu_kms->hw_intr->irq_tbl[irq_idx].arg != irq_arg)) {
> +		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +
> +		return -EINVAL;
>  	}

Why do we need this check too? Any condition where this wont match?

> +
> +	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
> +	if (ret)
> +		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
> +					irq_idx, ret);
> +
> +	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
> +	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
> +
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> 
>  	return 0;
> @@ -518,24 +499,18 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
>  static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>  {
>  	struct dpu_kms *dpu_kms = s->private;
> -	struct dpu_irq_callback *cb;
>  	unsigned long irq_flags;
> -	int i, irq_count, cb_count;
> -
> -	if (WARN_ON(!dpu_kms->hw_intr->irq_cb_tbl))
> -		return 0;
> +	int i, irq_count;
> +	void *cb;
> 
>  	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>  		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> -		cb_count = 0;
> -		irq_count = atomic_read(&dpu_kms->hw_intr->irq_counts[i]);
> -		list_for_each_entry(cb, &dpu_kms->hw_intr->irq_cb_tbl[i], list)
> -			cb_count++;
> +		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
> +		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
>  		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> 
> -		if (irq_count || cb_count)
> -			seq_printf(s, "idx:%d irq:%d cb:%d\n",
> -					i, irq_count, cb_count);
> +		if (irq_count || cb)
> +			seq_printf(s, "idx:%d irq:%d cb:%ps\n", i, irq_count, cb);
>  	}
> 
>  	return 0;
> @@ -560,15 +535,8 @@ void dpu_core_irq_preinstall(struct dpu_kms 
> *dpu_kms)
>  	dpu_disable_all_irqs(dpu_kms);
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> 
> -	/* Create irq callbacks for all possible irq_idx */
> -	dpu_kms->hw_intr->irq_cb_tbl = kcalloc(dpu_kms->hw_intr->total_irqs,
> -			sizeof(struct list_head), GFP_KERNEL);
> -	dpu_kms->hw_intr->irq_counts = kcalloc(dpu_kms->hw_intr->total_irqs,
> -			sizeof(atomic_t), GFP_KERNEL);
> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> -		INIT_LIST_HEAD(&dpu_kms->hw_intr->irq_cb_tbl[i]);
> -		atomic_set(&dpu_kms->hw_intr->irq_counts[i], 0);
> -	}
> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> +		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
>  }
> 
>  void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
> @@ -577,7 +545,7 @@ void dpu_core_irq_uninstall(struct dpu_kms 
> *dpu_kms)
> 
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>  	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> -		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
> +		if (dpu_kms->hw_intr->irq_tbl[i].cb)
>  			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> 
>  	dpu_clear_irqs(dpu_kms);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index d50e78c9f148..9855e176b173 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -40,19 +40,21 @@ enum dpu_hw_intr_reg {
>   * @save_irq_status:  array of IRQ status reg storage created during 
> init
>   * @total_irqs: total number of irq_idx mapped in the hw_interrupts
>   * @irq_lock:         spinlock for accessing IRQ resources
> - * @irq_cb_tbl:       array of IRQ callbacks lists
> - * @irq_counts:       array of IRQ counts
> + * @irq_cb_tbl:       array of IRQ callbacks
>   */
>  struct dpu_hw_intr {
>  	struct dpu_hw_blk_reg_map hw;
> -	u32 *cache_irq_mask;
> +	u32 cache_irq_mask[MDP_INTR_MAX];
>  	u32 *save_irq_status;
>  	u32 total_irqs;
>  	spinlock_t irq_lock;
>  	unsigned long irq_mask;
> 
> -	struct list_head *irq_cb_tbl;
> -	atomic_t *irq_counts;
> +	struct {
> +		void (*cb)(void *arg, int irq_idx);
> +		void *arg;
> +		atomic_t count;
> +	} irq_tbl[];
>  };
> 
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 775bcbda860f..d24dcd852d2e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -66,18 +66,6 @@
> 
>  #define DPU_NAME_SIZE  12
> 
> -/*
> - * struct dpu_irq_callback - IRQ callback handlers
> - * @list: list to callback
> - * @func: intr handler
> - * @arg: argument for the handler
> - */
> -struct dpu_irq_callback {
> -	struct list_head list;
> -	void (*func)(void *arg, int irq_idx);
> -	void *arg;
> -};
> -
>  struct dpu_kms {
>  	struct msm_kms base;
>  	struct drm_device *dev;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 37bba57675a8..1e2619556f93 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -876,25 +876,25 @@ TRACE_EVENT(dpu_pp_connect_ext_te,
>  );
> 
>  DECLARE_EVENT_CLASS(dpu_core_irq_callback_template,
> -	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
> +	TP_PROTO(int irq_idx, void *callback),
>  	TP_ARGS(irq_idx, callback),
>  	TP_STRUCT__entry(
>  		__field(	int,				irq_idx	)
> -		__field(	struct dpu_irq_callback *,	callback)
> +		__field(	void *,				callback)
>  	),
>  	TP_fast_assign(
>  		__entry->irq_idx = irq_idx;
>  		__entry->callback = callback;
>  	),
> -	TP_printk("irq_idx:%d callback:%pK", __entry->irq_idx,
> +	TP_printk("irq_idx:%d callback:%ps", __entry->irq_idx,
>  		  __entry->callback)
>  );
>  DEFINE_EVENT(dpu_core_irq_callback_template, 
> dpu_core_irq_register_callback,
> -	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
> +	TP_PROTO(int irq_idx, void *callback),
>  	TP_ARGS(irq_idx, callback)
>  );
>  DEFINE_EVENT(dpu_core_irq_callback_template, 
> dpu_core_irq_unregister_callback,
> -	TP_PROTO(int irq_idx, struct dpu_irq_callback *callback),
> +	TP_PROTO(int irq_idx, void *callback),
>  	TP_ARGS(irq_idx, callback)
>  );
