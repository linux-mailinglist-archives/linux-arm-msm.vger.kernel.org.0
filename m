Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0363EF861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 05:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbhHRDJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 23:09:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64999 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbhHRDJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 23:09:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629256117; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9g0Pq9D7VbNccWAqCcnea3yq4ZCeOdouS9FvfZAd2bI=;
 b=LUy8H43cseNcL5pJX9U/8wDHzg156vjuY3NpXKbKXip20q08Ew0OEYyX50/Mq7it5TWH7tjj
 3hETVnSPM64Y3YIZIgPpBQDeR7fXGI1zEXyIvQRh9KTLBzQLM7526sbxDn3BiaZgGwPqx9Wu
 1aYR5DnKN+m2gbJrap7HL1uYsV4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 611c799df746c298d99e98fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:08:13
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F28FBC4360C; Wed, 18 Aug 2021 03:08:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A47EC4338F;
        Wed, 18 Aug 2021 03:08:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 20:08:10 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 1/7] drm/msm/dpu: squash dpu_core_irq into
 dpu_hw_interrupts
In-Reply-To: <20210617222029.463045-2-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
 <20210617222029.463045-2-dmitry.baryshkov@linaro.org>
Message-ID: <b38353f70cd77a145504301c430c45d6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-17 15:20, Dmitry Baryshkov wrote:
> With dpu_core_irq being the wrapper around dpu_hw_interrupts, there is
> little sense in having them separate. Squash them together to remove
> another layer of abstraction (hw_intr ops).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Overall, I think this is a reasonable cleanup,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 256 -----------------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 269 ++++++++++++++----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  87 ------
>  4 files changed, 214 insertions(+), 399 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile 
> b/drivers/gpu/drm/msm/Makefile
> index 2c00aa70b708..a5245e8d0f14 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -51,7 +51,6 @@ msm-y := \
>  	disp/mdp5/mdp5_mixer.o \
>  	disp/mdp5/mdp5_plane.o \
>  	disp/mdp5/mdp5_smp.o \
> -	disp/dpu1/dpu_core_irq.o \
>  	disp/dpu1/dpu_core_perf.o \
>  	disp/dpu1/dpu_crtc.o \
>  	disp/dpu1/dpu_encoder.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> deleted file mode 100644
> index d2457490930b..000000000000
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ /dev/null
> @@ -1,256 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> - */
> -
> -#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> -
> -#include <linux/debugfs.h>
> -#include <linux/irqdomain.h>
> -#include <linux/irq.h>
> -#include <linux/kthread.h>
> -
> -#include "dpu_core_irq.h"
> -#include "dpu_trace.h"
> -
> -/**
> - * dpu_core_irq_callback_handler - dispatch core interrupts
> - * @arg:		private data of callback handler
> - * @irq_idx:		interrupt index
> - */
> -static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
> -{
> -	struct dpu_kms *dpu_kms = arg;
> -	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
> -	struct dpu_irq_callback *cb;
> -
> -	VERB("irq_idx=%d\n", irq_idx);
> -
> -	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
> -		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> -
> -	atomic_inc(&irq_obj->irq_counts[irq_idx]);
> -
> -	/*
> -	 * Perform registered function callback
> -	 */
> -	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
> -		if (cb->func)
> -			cb->func(cb->arg, irq_idx);
> -}
> -
> -u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool 
> clear)
> -{
> -	if (!dpu_kms->hw_intr ||
> -			!dpu_kms->hw_intr->ops.get_interrupt_status)
> -		return 0;
> -
> -	if (irq_idx < 0) {
> -		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
> -				__builtin_return_address(0), irq_idx);
> -		return 0;
> -	}
> -
> -	return dpu_kms->hw_intr->ops.get_interrupt_status(dpu_kms->hw_intr,
> -			irq_idx, clear);
> -}
> -
> -int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int 
> irq_idx,
> -		struct dpu_irq_callback *register_irq_cb)
> -{
> -	unsigned long irq_flags;
> -
> -	if (!dpu_kms->irq_obj.irq_cb_tbl) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!register_irq_cb || !register_irq_cb->func) {
> -		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> -				register_irq_cb != NULL,
> -				register_irq_cb ?
> -					register_irq_cb->func != NULL : -1);
> -		return -EINVAL;
> -	}
> -
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> -		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> -		return -EINVAL;
> -	}
> -
> -	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> -
> -	irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
> -	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
> -	list_del_init(&register_irq_cb->list);
> -	list_add_tail(&register_irq_cb->list,
> -			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
> -	if (list_is_first(&register_irq_cb->list,
> -			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> -		int ret = dpu_kms->hw_intr->ops.enable_irq_locked(
> -				dpu_kms->hw_intr,
> -				irq_idx);
> -		if (ret)
> -			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
> -					irq_idx);
> -	}
> -	dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
> -
> -	return 0;
> -}
> -
> -int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int 
> irq_idx,
> -		struct dpu_irq_callback *register_irq_cb)
> -{
> -	unsigned long irq_flags;
> -
> -	if (!dpu_kms->irq_obj.irq_cb_tbl) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -
> -	if (!register_irq_cb || !register_irq_cb->func) {
> -		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> -				register_irq_cb != NULL,
> -				register_irq_cb ?
> -					register_irq_cb->func != NULL : -1);
> -		return -EINVAL;
> -	}
> -
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> -		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> -		return -EINVAL;
> -	}
> -
> -	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> -
> -	irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
> -	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
> -	list_del_init(&register_irq_cb->list);
> -	/* empty callback list but interrupt is still enabled */
> -	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> -		int ret = dpu_kms->hw_intr->ops.disable_irq_locked(
> -				dpu_kms->hw_intr,
> -				irq_idx);
> -		if (ret)
> -			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
> -					irq_idx);
> -		VERB("irq_idx=%d ret=%d\n", irq_idx, ret);
> -	}
> -	dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
> -
> -	return 0;
> -}
> -
> -static void dpu_clear_all_irqs(struct dpu_kms *dpu_kms)
> -{
> -	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.clear_all_irqs)
> -		return;
> -
> -	dpu_kms->hw_intr->ops.clear_all_irqs(dpu_kms->hw_intr);
> -}
> -
> -static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
> -{
> -	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.disable_all_irqs)
> -		return;
> -
> -	dpu_kms->hw_intr->ops.disable_all_irqs(dpu_kms->hw_intr);
> -}
> -
> -#ifdef CONFIG_DEBUG_FS
> -static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
> -{
> -	struct dpu_kms *dpu_kms = s->private;
> -	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
> -	struct dpu_irq_callback *cb;
> -	unsigned long irq_flags;
> -	int i, irq_count, cb_count;
> -
> -	if (WARN_ON(!irq_obj->irq_cb_tbl))
> -		return 0;
> -
> -	for (i = 0; i < irq_obj->total_irqs; i++) {
> -		irq_flags = dpu_kms->hw_intr->ops.lock(dpu_kms->hw_intr);
> -		cb_count = 0;
> -		irq_count = atomic_read(&irq_obj->irq_counts[i]);
> -		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
> -			cb_count++;
> -		dpu_kms->hw_intr->ops.unlock(dpu_kms->hw_intr, irq_flags);
> -
> -		if (irq_count || cb_count)
> -			seq_printf(s, "idx:%d irq:%d cb:%d\n",
> -					i, irq_count, cb_count);
> -	}
> -
> -	return 0;
> -}
> -
> -DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
> -
> -void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
> -		struct dentry *parent)
> -{
> -	debugfs_create_file("core_irq", 0600, parent, dpu_kms,
> -		&dpu_debugfs_core_irq_fops);
> -}
> -#endif
> -
> -void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
> -{
> -	int i;
> -
> -	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	dpu_clear_all_irqs(dpu_kms);
> -	dpu_disable_all_irqs(dpu_kms);
> -	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> -
> -	/* Create irq callbacks for all possible irq_idx */
> -	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
> -	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
> -			sizeof(struct list_head), GFP_KERNEL);
> -	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
> -			sizeof(atomic_t), GFP_KERNEL);
> -	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
> -		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
> -		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
> -	}
> -}
> -
> -void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
> -{
> -	int i;
> -
> -	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
> -		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
> -			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> -
> -	dpu_clear_all_irqs(dpu_kms);
> -	dpu_disable_all_irqs(dpu_kms);
> -	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> -
> -	kfree(dpu_kms->irq_obj.irq_cb_tbl);
> -	kfree(dpu_kms->irq_obj.irq_counts);
> -	dpu_kms->irq_obj.irq_cb_tbl = NULL;
> -	dpu_kms->irq_obj.irq_counts = NULL;
> -	dpu_kms->irq_obj.total_irqs = 0;
> -}
> -
> -irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
> -{
> -	/*
> -	 * Dispatch to HW driver to handle interrupt lookup that is being
> -	 * fired. When matching interrupt is located, HW driver will call to
> -	 * dpu_core_irq_callback_handler with the irq_idx from the lookup 
> table.
> -	 * dpu_core_irq_callback_handler will perform the registered function
> -	 * callback, and do the interrupt status clearing once the registered
> -	 * callback is finished.
> -	 * Function will also clear the interrupt status after reading.
> -	 */
> -	dpu_kms->hw_intr->ops.dispatch_irqs(
> -			dpu_kms->hw_intr,
> -			dpu_core_irq_callback_handler,
> -			dpu_kms);
> -
> -	return IRQ_HANDLED;
> -}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 2e816f232e85..2437b0c7c073 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -3,12 +3,15 @@
>   */
> 
>  #include <linux/bitops.h>
> +#include <linux/debugfs.h>
>  #include <linux/slab.h>
> 
> +#include "dpu_core_irq.h"
>  #include "dpu_kms.h"
>  #include "dpu_hw_interrupts.h"
>  #include "dpu_hw_util.h"
>  #include "dpu_hw_mdss.h"
> +#include "dpu_trace.h"
> 
>  /**
>   * Register offsets in MDSS register file for the interrupt registers
> @@ -132,10 +135,34 @@ static void
> dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
>  	wmb();
>  }
> 
> -static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
> -		void (*cbfunc)(void *, int),
> -		void *arg)
> +/**
> + * dpu_core_irq_callback_handler - dispatch core interrupts
> + * @arg:		private data of callback handler
> + * @irq_idx:		interrupt index
> + */
> +static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int 
> irq_idx)
>  {
> +	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
> +	struct dpu_irq_callback *cb;
> +
> +	VERB("irq_idx=%d\n", irq_idx);
> +
> +	if (list_empty(&irq_obj->irq_cb_tbl[irq_idx]))
> +		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
> +
> +	atomic_inc(&irq_obj->irq_counts[irq_idx]);
> +
> +	/*
> +	 * Perform registered function callback
> +	 */
> +	list_for_each_entry(cb, &irq_obj->irq_cb_tbl[irq_idx], list)
> +		if (cb->func)
> +			cb->func(cb->arg, irq_idx);
> +}
> +
> +irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
> +{
> +	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>  	int reg_idx;
>  	int irq_idx;
>  	u32 irq_status;
> @@ -144,13 +171,8 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  	unsigned long irq_flags;
> 
>  	if (!intr)
> -		return;
> +		return IRQ_NONE;
> 
> -	/*
> -	 * The dispatcher will save the IRQ status before calling here.
> -	 * Now need to go through each IRQ status and find matching
> -	 * irq lookup index.
> -	 */
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
>  	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
>  		if (!test_bit(reg_idx, &intr->irq_mask))
> @@ -178,15 +200,8 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  		 */
>  		while ((bit = ffs(irq_status)) != 0) {
>  			irq_idx = DPU_IRQ_IDX(reg_idx, bit - 1);
> -			/*
> -			 * Once a match on irq mask, perform a callback
> -			 * to the given cbfunc. cbfunc will take care
> -			 * the interrupt status clearing. If cbfunc is
> -			 * not provided, then the interrupt clearing
> -			 * is here.
> -			 */
> -			if (cbfunc)
> -				cbfunc(arg, irq_idx);
> +
> +			dpu_core_irq_callback_handler(dpu_kms, irq_idx);
> 
>  			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
> 
> @@ -203,6 +218,8 @@ static void dpu_hw_intr_dispatch_irq(struct
> dpu_hw_intr *intr,
>  	wmb();
> 
>  	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
> +
> +	return IRQ_HANDLED;
>  }
> 
>  static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int 
> irq_idx)
> @@ -303,12 +320,13 @@ static int dpu_hw_intr_disable_irq_locked(struct
> dpu_hw_intr *intr, int irq_idx)
>  	return 0;
>  }
> 
> -static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
> +static void dpu_clear_irqs(struct dpu_kms *dpu_kms)
>  {
> +	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>  	int i;
> 
>  	if (!intr)
> -		return -EINVAL;
> +		return;
> 
>  	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
>  		if (test_bit(i, &intr->irq_mask))
> @@ -318,16 +336,15 @@ static int dpu_hw_intr_clear_irqs(struct
> dpu_hw_intr *intr)
> 
>  	/* ensure register writes go through */
>  	wmb();
> -
> -	return 0;
>  }
> 
> -static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
> +static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
>  {
> +	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>  	int i;
> 
>  	if (!intr)
> -		return -EINVAL;
> +		return;
> 
>  	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
>  		if (test_bit(i, &intr->irq_mask))
> @@ -337,13 +354,11 @@ static int dpu_hw_intr_disable_irqs(struct
> dpu_hw_intr *intr)
> 
>  	/* ensure register writes go through */
>  	wmb();
> -
> -	return 0;
>  }
> 
> -static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
> -		int irq_idx, bool clear)
> +u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool 
> clear)
>  {
> +	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>  	int reg_idx;
>  	unsigned long irq_flags;
>  	u32 intr_status;
> @@ -351,6 +366,12 @@ static u32
> dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
>  	if (!intr)
>  		return 0;
> 
> +	if (irq_idx < 0) {
> +		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
> +				__builtin_return_address(0), irq_idx);
> +		return 0;
> +	}
> +
>  	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return 0;
> @@ -374,32 +395,6 @@ static u32
> dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
>  	return intr_status;
>  }
> 
> -static unsigned long dpu_hw_intr_lock(struct dpu_hw_intr *intr)
> -{
> -	unsigned long irq_flags;
> -
> -	spin_lock_irqsave(&intr->irq_lock, irq_flags);
> -
> -	return irq_flags;
> -}
> -
> -static void dpu_hw_intr_unlock(struct dpu_hw_intr *intr, unsigned
> long irq_flags)
> -{
> -	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
> -}
> -
> -static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
> -{
> -	ops->enable_irq_locked = dpu_hw_intr_enable_irq_locked;
> -	ops->disable_irq_locked = dpu_hw_intr_disable_irq_locked;
> -	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
> -	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
> -	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
> -	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
> -	ops->lock = dpu_hw_intr_lock;
> -	ops->unlock = dpu_hw_intr_unlock;
> -}
> -
>  static void __intr_offset(struct dpu_mdss_cfg *m,
>  		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
>  {
> @@ -421,7 +416,6 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem 
> *addr,
>  		return ERR_PTR(-ENOMEM);
> 
>  	__intr_offset(m, addr, &intr->hw);
> -	__setup_intr_ops(&intr->ops);
> 
>  	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
> 
> @@ -447,3 +441,168 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr 
> *intr)
>  	}
>  }
> 
> +int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int 
> irq_idx,
> +		struct dpu_irq_callback *register_irq_cb)
> +{
> +	unsigned long irq_flags;
> +
> +	if (!dpu_kms->irq_obj.irq_cb_tbl) {
> +		DPU_ERROR("invalid params\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!register_irq_cb || !register_irq_cb->func) {
> +		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> +				register_irq_cb != NULL,
> +				register_irq_cb ?
> +					register_irq_cb->func != NULL : -1);
> +		return -EINVAL;
> +	}
> +
> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> +		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> +		return -EINVAL;
> +	}
> +
> +	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> +
> +	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
> +	list_del_init(&register_irq_cb->list);
> +	list_add_tail(&register_irq_cb->list,
> +			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
> +	if (list_is_first(&register_irq_cb->list,
> +			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> +		int ret = dpu_hw_intr_enable_irq_locked(
> +				dpu_kms->hw_intr,
> +				irq_idx);
> +		if (ret)
> +			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
> +					irq_idx);
> +	}
> +	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +
> +	return 0;
> +}
> +
> +int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int 
> irq_idx,
> +		struct dpu_irq_callback *register_irq_cb)
> +{
> +	unsigned long irq_flags;
> +
> +	if (!dpu_kms->irq_obj.irq_cb_tbl) {
> +		DPU_ERROR("invalid params\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!register_irq_cb || !register_irq_cb->func) {
> +		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> +				register_irq_cb != NULL,
> +				register_irq_cb ?
> +					register_irq_cb->func != NULL : -1);
> +		return -EINVAL;
> +	}
> +
> +	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> +		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> +		return -EINVAL;
> +	}
> +
> +	VERB("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> +
> +	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
> +	list_del_init(&register_irq_cb->list);
> +	/* empty callback list but interrupt is still enabled */
> +	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> +		int ret = dpu_hw_intr_disable_irq_locked(
> +				dpu_kms->hw_intr,
> +				irq_idx);
> +		if (ret)
> +			DPU_ERROR("Fail to disable IRQ for irq_idx:%d\n",
> +					irq_idx);
> +		VERB("irq_idx=%d ret=%d\n", irq_idx, ret);
> +	}
> +	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
> +{
> +	struct dpu_kms *dpu_kms = s->private;
> +	struct dpu_irq *irq_obj = &dpu_kms->irq_obj;
> +	struct dpu_irq_callback *cb;
> +	unsigned long irq_flags;
> +	int i, irq_count, cb_count;
> +
> +	if (WARN_ON(!irq_obj->irq_cb_tbl))
> +		return 0;
> +
> +	for (i = 0; i < irq_obj->total_irqs; i++) {
> +		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +		cb_count = 0;
> +		irq_count = atomic_read(&irq_obj->irq_counts[i]);
> +		list_for_each_entry(cb, &irq_obj->irq_cb_tbl[i], list)
> +			cb_count++;
> +		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> +
> +		if (irq_count || cb_count)
> +			seq_printf(s, "idx:%d irq:%d cb:%d\n",
> +					i, irq_count, cb_count);
> +	}
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
> +
> +void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
> +		struct dentry *parent)
> +{
> +	debugfs_create_file("core_irq", 0600, parent, dpu_kms,
> +		&dpu_debugfs_core_irq_fops);
> +}
> +#endif
> +
> +void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
> +{
> +	int i;
> +
> +	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +	dpu_clear_irqs(dpu_kms);
> +	dpu_disable_all_irqs(dpu_kms);
> +	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> +
> +	/* Create irq callbacks for all possible irq_idx */
> +	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
> +	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
> +			sizeof(struct list_head), GFP_KERNEL);
> +	dpu_kms->irq_obj.irq_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
> +			sizeof(atomic_t), GFP_KERNEL);
> +	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++) {
> +		INIT_LIST_HEAD(&dpu_kms->irq_obj.irq_cb_tbl[i]);
> +		atomic_set(&dpu_kms->irq_obj.irq_counts[i], 0);
> +	}
> +}
> +
> +void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
> +{
> +	int i;
> +
> +	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> +	for (i = 0; i < dpu_kms->irq_obj.total_irqs; i++)
> +		if (!list_empty(&dpu_kms->irq_obj.irq_cb_tbl[i]))
> +			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> +
> +	dpu_clear_irqs(dpu_kms);
> +	dpu_disable_all_irqs(dpu_kms);
> +	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> +
> +	kfree(dpu_kms->irq_obj.irq_cb_tbl);
> +	kfree(dpu_kms->irq_obj.irq_counts);
> +	dpu_kms->irq_obj.irq_cb_tbl = NULL;
> +	dpu_kms->irq_obj.irq_counts = NULL;
> +	dpu_kms->irq_obj.total_irqs = 0;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index ac83c1159815..99ab01f54aa6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -32,92 +32,6 @@ enum dpu_hw_intr_reg {
> 
>  #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
> 
> -struct dpu_hw_intr;
> -
> -/**
> - * Interrupt operations.
> - */
> -struct dpu_hw_intr_ops {
> -
> -	/**
> -	 * enable_irq - Enable IRQ based on lookup IRQ index
> -	 * @intr:	HW interrupt handle
> -	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
> -	 * @return:	0 for success, otherwise failure
> -	 */
> -	int (*enable_irq_locked)(
> -			struct dpu_hw_intr *intr,
> -			int irq_idx);
> -
> -	/**
> -	 * disable_irq - Disable IRQ based on lookup IRQ index
> -	 * @intr:	HW interrupt handle
> -	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
> -	 * @return:	0 for success, otherwise failure
> -	 */
> -	int (*disable_irq_locked)(
> -			struct dpu_hw_intr *intr,
> -			int irq_idx);
> -
> -	/**
> -	 * clear_all_irqs - Clears all the interrupts (i.e. acknowledges
> -	 *                  any asserted IRQs). Useful during reset.
> -	 * @intr:	HW interrupt handle
> -	 * @return:	0 for success, otherwise failure
> -	 */
> -	int (*clear_all_irqs)(
> -			struct dpu_hw_intr *intr);
> -
> -	/**
> -	 * disable_all_irqs - Disables all the interrupts. Useful during 
> reset.
> -	 * @intr:	HW interrupt handle
> -	 * @return:	0 for success, otherwise failure
> -	 */
> -	int (*disable_all_irqs)(
> -			struct dpu_hw_intr *intr);
> -
> -	/**
> -	 * dispatch_irqs - IRQ dispatcher will call the given callback
> -	 *                 function when a matching interrupt status bit is
> -	 *                 found in the irq mapping table.
> -	 * @intr:	HW interrupt handle
> -	 * @cbfunc:	Callback function pointer
> -	 * @arg:	Argument to pass back during callback
> -	 */
> -	void (*dispatch_irqs)(
> -			struct dpu_hw_intr *intr,
> -			void (*cbfunc)(void *arg, int irq_idx),
> -			void *arg);
> -
> -	/**
> -	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
> -	 *                        based on given lookup IRQ index.
> -	 * @intr:	HW interrupt handle
> -	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
> -	 * @clear:	True to clear irq after read
> -	 */
> -	u32 (*get_interrupt_status)(
> -			struct dpu_hw_intr *intr,
> -			int irq_idx,
> -			bool clear);
> -
> -	/**
> -	 * lock - take the IRQ lock
> -	 * @intr:	HW interrupt handle
> -	 * @return:	irq_flags for the taken spinlock
> -	 */
> -	unsigned long (*lock)(
> -			struct dpu_hw_intr *intr);
> -
> -	/**
> -	 * unlock - take the IRQ lock
> -	 * @intr:	HW interrupt handle
> -	 * @irq_flags:  the irq_flags returned from lock
> -	 */
> -	void (*unlock)(
> -			struct dpu_hw_intr *intr, unsigned long irq_flags);
> -};
> -
>  /**
>   * struct dpu_hw_intr: hw interrupts handling data structure
>   * @hw:               virtual address mapping
> @@ -129,7 +43,6 @@ struct dpu_hw_intr_ops {
>   */
>  struct dpu_hw_intr {
>  	struct dpu_hw_blk_reg_map hw;
> -	struct dpu_hw_intr_ops ops;
>  	u32 *cache_irq_mask;
>  	u32 *save_irq_status;
>  	u32 total_irqs;
