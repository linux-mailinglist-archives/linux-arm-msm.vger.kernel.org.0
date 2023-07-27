Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4BF3765C3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 21:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjG0TlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 15:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjG0TlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 15:41:17 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A665C2D75
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 12:41:14 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4A0461FAD3;
        Thu, 27 Jul 2023 21:41:12 +0200 (CEST)
Date:   Thu, 27 Jul 2023 21:41:10 +0200
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
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Message-ID: <zilvhfz4qgvnz4thp6wlbg6al7hahen2gw2k5el5o6pi2ysxb6@qhwzla4zmze5>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
 <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
 <7b7e0a8a-392c-19c3-6642-7479c28d4ed8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b7e0a8a-392c-19c3-6642-7479c28d4ed8@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-27 22:34:59, Dmitry Baryshkov wrote:
> On 27/07/2023 22:29, Marijn Suijten wrote:
> > On 2023-07-27 18:04:54, Dmitry Baryshkov wrote:
> >> In preparation to reworking the IRQ indices, move irq_tbl access to
> >> separate helper.
> > 
> > I am not seeing the advantage of the helper, but making every function
> > look up dpu_kms->hw_intr->irq_tbl[irq_idx] only once and storing that in
> > a local dpu_hw_intr_entry pointer is much tidier.
> 
> There was a bonus point when I tried to do a irq_idx-1 in the next 
> patch. But since that code has gone, maybe I can drop this patch too.

Don't drop the whole patch though.  While maybe not necessary, having
the lookup only once is much easier to follow.

- Marijn

> > Maybe I expected it to do extra mutations to irq_idx in 4/4?
> > 
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
> >>   2 files changed, 41 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> index eaae7f11f57f..ede7161ae904 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> @@ -199,6 +199,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
> >>   
> >>   #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
> >>   
> >> +static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
> >> +							       int irq_idx)
> >> +{
> >> +	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
> >> +}
> >> +
> >>   /**
> >>    * dpu_core_irq_callback_handler - dispatch core interrupts
> >>    * @dpu_kms:		Pointer to DPU's KMS structure
> >> @@ -206,17 +212,19 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
> >>    */
> >>   static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
> >>   {
> >> +	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
> >> +
> >>   	VERB("irq_idx=%d\n", irq_idx);
> >>   
> >> -	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
> >> +	if (!irq_entry->cb)
> >>   		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> >>   
> >> -	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
> >> +	atomic_inc(&irq_entry->count);
> >>   
> >>   	/*
> >>   	 * Perform registered function callback
> >>   	 */
> >> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
> >> +	irq_entry->cb(irq_entry->arg);
> >>   }
> >>   
> >>   irqreturn_t dpu_core_irq(struct msm_kms *kms)
> >> @@ -509,6 +517,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >>   		void (*irq_cb)(void *arg),
> >>   		void *irq_arg)
> >>   {
> >> +	struct dpu_hw_intr_entry *irq_entry;
> >>   	unsigned long irq_flags;
> >>   	int ret;
> >>   
> >> @@ -526,15 +535,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >>   
> >>   	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >>   
> >> -	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
> >> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
> >> +	if (unlikely(WARN_ON(irq_entry->cb))) {
> >>   		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >>   
> >>   		return -EBUSY;
> >>   	}
> >>   
> >>   	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
> >> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
> >> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
> >> +	irq_entry->arg = irq_arg;
> >> +	irq_entry->cb = irq_cb;
> >>   
> >>   	ret = dpu_hw_intr_enable_irq_locked(
> >>   				dpu_kms->hw_intr,
> >> @@ -551,6 +561,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >>   
> >>   int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
> >>   {
> >> +	struct dpu_hw_intr_entry *irq_entry;
> >>   	unsigned long irq_flags;
> >>   	int ret;
> >>   
> >> @@ -569,8 +580,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
> >>   		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
> >>   					irq_idx, ret);
> >>   
> >> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
> >> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
> >> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
> >> +	irq_entry->cb = NULL;
> >> +	irq_entry->arg = NULL;
> >>   
> >>   	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >>   
> >> @@ -583,14 +595,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
> >>   static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
> >>   {
> >>   	struct dpu_kms *dpu_kms = s->private;
> >> +	struct dpu_hw_intr_entry *irq_entry;
> >>   	unsigned long irq_flags;
> >>   	int i, irq_count;
> >>   	void *cb;
> >>   
> >>   	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> >>   		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >> -		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
> >> -		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
> >> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> >> +		irq_count = atomic_read(&irq_entry->count);
> >> +		cb = irq_entry->cb;
> >>   		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >>   
> >>   		if (irq_count || cb)
> >> @@ -613,6 +627,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
> >>   void dpu_core_irq_preinstall(struct msm_kms *kms)
> >>   {
> >>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> >> +	struct dpu_hw_intr_entry *irq_entry;
> >>   	int i;
> >>   
> >>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> >> @@ -620,22 +635,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
> >>   	dpu_disable_all_irqs(dpu_kms);
> >>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> >>   
> >> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> >> -		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
> >> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> >> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> >> +		atomic_set(&irq_entry->count, 0);
> >> +	}
> >>   }
> >>   
> >>   void dpu_core_irq_uninstall(struct msm_kms *kms)
> >>   {
> >>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> >> +	struct dpu_hw_intr_entry *irq_entry;
> >>   	int i;
> >>   
> >>   	if (!dpu_kms->hw_intr)
> >>   		return;
> >>   
> >>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> >> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
> >> -		if (dpu_kms->hw_intr->irq_tbl[i].cb)
> >> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> >> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> >> +		if (irq_entry->cb)
> >>   			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> >> +	}
> >>   
> >>   	dpu_clear_irqs(dpu_kms);
> >>   	dpu_disable_all_irqs(dpu_kms);
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> >> index 3a988a4e4f33..59bde8ab50c8 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> >> @@ -40,6 +40,12 @@ enum dpu_hw_intr_reg {
> >>   #define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
> >>   #define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
> >>   
> >> +struct dpu_hw_intr_entry {
> >> +	void (*cb)(void *arg);
> >> +	void *arg;
> >> +	atomic_t count;
> >> +};
> >> +
> >>   /**
> >>    * struct dpu_hw_intr: hw interrupts handling data structure
> >>    * @hw:               virtual address mapping
> >> @@ -59,11 +65,7 @@ struct dpu_hw_intr {
> >>   	unsigned long irq_mask;
> >>   	const struct dpu_intr_reg *intr_set;
> >>   
> >> -	struct {
> >> -		void (*cb)(void *arg);
> >> -		void *arg;
> >> -		atomic_t count;
> >> -	} irq_tbl[];
> >> +	struct dpu_hw_intr_entry irq_tbl[];
> >>   };
> >>   
> >>   /**
> >> -- 
> >> 2.39.2
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
