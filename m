Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185453A2E81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhFJOrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:47:25 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:39692 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhFJOrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:47:23 -0400
Received: by mail-ot1-f53.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so26645889otu.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5r1JUAnf5vqj0yEA5qbVlT9HSVi/kDaJI1P3a5pkfsU=;
        b=W70cv9kRs5vC91D+5krSiC2wgrRgfcRqDBAvHN6Jz57LjX2QVyZmsMEhHTP67RchNg
         qOLEMa6gQuxFjFntv/fypYATIKLR/Bdo11s57OcCPfIP5M4k2gXoq7tRYnSsADHUBL61
         /6/U9NGTqfT0AfqKcIcb0zYJr1y/r0NI/dAfWCMYFiS2Wco5+JOwEof1nQMYLQHIKlHe
         NASNPYOQ63fs3H4YA94pAv/O8n6F80sT5CuspLWbFS3W9Y5aT2oWbHk9bUmVVtKCU5DI
         Xb95PoULP6bLz93XftyUEJRHt0V69MydJiwUUJPsCIZRsCVOCXSQowzCAHE22j++5wRa
         pc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5r1JUAnf5vqj0yEA5qbVlT9HSVi/kDaJI1P3a5pkfsU=;
        b=LdIYZCo5Qyn+3A99zseYJ4OFa/YtSpBOjNHTLfgXavXx9HdrEojCNRSeWG4ST58nz4
         smagp8vFOwYwZTsEGbYT3a+NvnxA3ESWMwGM8QhWs84uEodtRtdkdYly8271keCBrV6t
         PI93mEoyRW/K3HlhZAWMdVzxIAn5dpNIHEd2Efr9lPwudyg8qnPgdZdJLRnRelSc57hq
         lkflnRaK+fbnFaDUD0+fUVjctCduuxF1VmYpGGwSoqiqMDhVymU07rT8DK0K2uYr5GG9
         5epc6NtZr0EcCPIqocm5uY9tx0Ne5+qqGoIGuNF5FA+DT0MBPIG37YJBjKaCi4jkAntY
         V88w==
X-Gm-Message-State: AOAM530gRHio97pYq3DDR7ARddSq+dxez/+Y93ef2rZxESGV1/j/BIOD
        zLnoGpAEK4hVh7b/JXk56gCOdQ==
X-Google-Smtp-Source: ABdhPJyU40SttyHVQTJlyA84enWC1soa+5ksDd5YxGOEO8l6OO67Iv+5BiAGIy1r5b60eDx25QCl9A==
X-Received: by 2002:a9d:65:: with SMTP id 92mr2691191ota.239.1623336267233;
        Thu, 10 Jun 2021 07:44:27 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f2sm562397ooj.22.2021.06.10.07.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 07:44:26 -0700 (PDT)
Date:   Thu, 10 Jun 2021 09:44:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Avoid ABBA deadlock between IRQ modules
Message-ID: <YMIlSHlRoF4Lhhdb@yoga>
References: <20210609231507.3031904-1-bjorn.andersson@linaro.org>
 <faf0dbb2-a219-51fe-5cbd-752848a0286f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faf0dbb2-a219-51fe-5cbd-752848a0286f@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Jun 06:46 CDT 2021, Dmitry Baryshkov wrote:

> On 10/06/2021 02:15, Bjorn Andersson wrote:
> > Handling of the interrupt callback lists is done in dpu_core_irq.c,
> > under the "cb_lock" spinlock. When these operations results in the need
> > for enableing or disabling the IRQ in the hardware the code jumps to
> > dpu_hw_interrupts.c, which protects its operations with "irq_lock"
> > spinlock.
> > 
> > When an interrupt fires, dpu_hw_intr_dispatch_irq() inspects the
> > hardware state while holding the "irq_lock" spinlock and jumps to
> > dpu_core_irq_callback_handler() to invoke the registered handlers, which
> > traverses the callback list under the "cb_lock" spinlock.
> > 
> > As such, in the event that these happens concurrently we'll end up with
> > a deadlock.
> > 
> > Prior to '1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")'
> > the enable/disable of the hardware interrupt was done outside the
> > "cb_lock" region, optimitically by using an atomic enable-counter for
> > each interrupt and an warning print if someone changed the list between
> > the atomic_read and the time the operation concluded.
> > 
> > Rather than re-introducing the large array of atomics, serialize the
> > register/unregister operations under a single mutex.
> > 
> > Fixes: 1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> I have been thinking about this for quite some time. I'm still not confident
> about the proposed scheme.
> 
> What more intrusive, but more obvious change:
>  - Drop dpu_kms->irq_obj.cb_lock alltogether. Use hw_intr's irq_lock instead
> in the register/unregister path and no locks in the callback itself.

I did consider this as well, but while I certainly don't like the
current design I think it would be easy to miss the fact that the two
"different" modules share the lock.

>  - Do not take locks in the dpu_hw_intr_enable_irq/disable_irq (as we are
> already locked outside).
> 

This is correct.

> The core_irq is the only user of the hw_intr framework. In fact I'd like to
> squash them together at some point (if I get some time, I'll send patches
> during this cycle).
> 

As we've seen the two modules are tightly coupled, and it's full of slow
function pointer calls, so I'm definitely in favor of us refactoring
this into a single thing.

Further more, rather than dealing with the callback lists in
dpu_core_irq, I think we should explore just implementing this as
another chained irq handler, and just use the common IRQ code directly -
it has a known API and is known to work.


That said, such redesign will take a little bit of time and we
definitely need to squash the deadlock, as my laptop only survives 10-15
minutes with two displays active.

So if we agree that we want to squash the two modules, then your
suggestion of sharing the lock seems like a reasonable intermediate
workaround. I'll respin and retest my patch accordingly.

Thanks,
Bjorn

> 
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 10 +++++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  2 ++
> >   2 files changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> > index 4f110c428b60..62bbe35eff7b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> > @@ -82,11 +82,13 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >   	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> > +	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
> >   	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
> >   	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
> >   	list_del_init(&register_irq_cb->list);
> >   	list_add_tail(&register_irq_cb->list,
> >   			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
> > +	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> >   	if (list_is_first(&register_irq_cb->list,
> >   			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> >   		int ret = dpu_kms->hw_intr->ops.enable_irq(
> > @@ -96,8 +98,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >   			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
> >   					irq_idx);
> >   	}
> > -
> > -	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> > +	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
> >   	return 0;
> >   }
> > @@ -127,9 +128,11 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >   	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
> > +	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
> >   	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
> >   	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
> >   	list_del_init(&register_irq_cb->list);
> > +	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> >   	/* empty callback list but interrupt is still enabled */
> >   	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
> >   		int ret = dpu_kms->hw_intr->ops.disable_irq(
> > @@ -140,7 +143,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >   					irq_idx);
> >   		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
> >   	}
> > -	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> > +	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
> >   	return 0;
> >   }
> > @@ -207,6 +210,7 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
> >   	dpu_disable_all_irqs(dpu_kms);
> >   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> > +	mutex_init(&dpu_kms->irq_obj.hw_enable_lock);
> >   	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
> >   	/* Create irq callbacks for all possible irq_idx */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index f6840b1af6e4..5a162caea29d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -83,6 +83,7 @@ struct dpu_irq_callback {
> >    * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
> >    * @irq_cb_tbl:   array of IRQ callbacks setting
> >    * @cb_lock:      callback lock
> > + * @hw_enable_lock: lock to synchronize callback register and unregister
> >    * @debugfs_file: debugfs file for irq statistics
> >    */
> >   struct dpu_irq {
> > @@ -90,6 +91,7 @@ struct dpu_irq {
> >   	struct list_head *irq_cb_tbl;
> >   	atomic_t *irq_counts;
> >   	spinlock_t cb_lock;
> > +	struct mutex hw_enable_lock;
> >   };
> >   struct dpu_kms {
> > 
> 
> 
> -- 
> With best wishes
> Dmitry
