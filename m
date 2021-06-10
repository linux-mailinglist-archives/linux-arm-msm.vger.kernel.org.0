Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6783A2A97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 13:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhFJLs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 07:48:58 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:43644 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhFJLs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 07:48:58 -0400
Received: by mail-lf1-f47.google.com with SMTP id n12so2739028lft.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 04:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MN3eVGwG+hH7sCw5HF13ulT0gGa8uU+HkoCqMe7S2Ao=;
        b=fX3FxI/4MOjcAxHIg9QbP0j/n8RrfuDUz8YnTisYoONbyXHwQOwbsV+YqkGbdUI1IF
         V+7shM5z3XaE1i+s2JTRlRTDHsUiCMQlxxUziKQhcISyQ7iqX/iucWonz7gV3Kl5x5jA
         YLC6hHf8ZspCcEXbe+QenOPht1kLkNsjl2qwyNQh+GFlzzEuaB9MNCa6v3urUQcBmiBS
         Zy4CmBYrNN+4EiFoQtdj39F8avo2WuAjLRt60904LZqXa2UvmkgrffAA+IFicfDT3DQ6
         PlHKXUrYYQsfQvG5BB5lFxRGBEVEi7+2KrsamTFApoZkz0xWtcJicwBeIvmuOuTyRpne
         WCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MN3eVGwG+hH7sCw5HF13ulT0gGa8uU+HkoCqMe7S2Ao=;
        b=Hvo1sACMnvgtQOETAXdRbLM6WLf4WucF7qXpkAlp7xRxv91sdRn8evIlrowegvqLMK
         WEt34F7fPefFynhwkeCmG+2ZHolBND+FdJiNTKZvWeDlTa8BLp+o6/l8GSKplClJmGFq
         NEp8011V1uwgGZrjdImoTPnsv22jn6bpoNSyPdo4rDzeE68uw3zVoBZsWVud2wUfOBYm
         bRw/AR2jxELr+D7Er2LUIY/5QTRAjN/1eO5fIPX5KsM3/rJZIDjwXluMArffbRoaxFpg
         ekm90OOe0zgHuUgIb/fEyrTMTezhZ0wUCuih00WdZ0vG7Wnh3QE4/AV8nfccSIXVfnj/
         tbCw==
X-Gm-Message-State: AOAM532ZQ/FezE9egUi33VdeqQIACicHNGt81IG81t7XYmJ3QwE6eQjB
        GDrpfTk7a3G47FfHDtGXHAv1MQ==
X-Google-Smtp-Source: ABdhPJy/bZ8AH0U03fXrAjx9cu0WxQPFgQcSWCWAYZ1MmJ4nqea59qPaHjQq+CsddifBf0WRNFTKdQ==
X-Received: by 2002:a05:6512:304b:: with SMTP id b11mr1707676lfb.581.1623325561634;
        Thu, 10 Jun 2021 04:46:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f6sm273541lfh.299.2021.06.10.04.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 04:46:01 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: Avoid ABBA deadlock between IRQ modules
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210609231507.3031904-1-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <faf0dbb2-a219-51fe-5cbd-752848a0286f@linaro.org>
Date:   Thu, 10 Jun 2021 14:46:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210609231507.3031904-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/06/2021 02:15, Bjorn Andersson wrote:
> Handling of the interrupt callback lists is done in dpu_core_irq.c,
> under the "cb_lock" spinlock. When these operations results in the need
> for enableing or disabling the IRQ in the hardware the code jumps to
> dpu_hw_interrupts.c, which protects its operations with "irq_lock"
> spinlock.
> 
> When an interrupt fires, dpu_hw_intr_dispatch_irq() inspects the
> hardware state while holding the "irq_lock" spinlock and jumps to
> dpu_core_irq_callback_handler() to invoke the registered handlers, which
> traverses the callback list under the "cb_lock" spinlock.
> 
> As such, in the event that these happens concurrently we'll end up with
> a deadlock.
> 
> Prior to '1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")'
> the enable/disable of the hardware interrupt was done outside the
> "cb_lock" region, optimitically by using an atomic enable-counter for
> each interrupt and an warning print if someone changed the list between
> the atomic_read and the time the operation concluded.
> 
> Rather than re-introducing the large array of atomics, serialize the
> register/unregister operations under a single mutex.
> 
> Fixes: 1c1e7763a6d4 ("drm/msm/dpu: simplify IRQ enabling/disabling")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I have been thinking about this for quite some time. I'm still not 
confident about the proposed scheme.

What more intrusive, but more obvious change:
  - Drop dpu_kms->irq_obj.cb_lock alltogether. Use hw_intr's irq_lock 
instead in the register/unregister path and no locks in the callback itself.
  - Do not take locks in the dpu_hw_intr_enable_irq/disable_irq (as we 
are already locked outside).

The core_irq is the only user of the hw_intr framework. In fact I'd like 
to squash them together at some point (if I get some time, I'll send 
patches during this cycle).


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c | 10 +++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  2 ++
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index 4f110c428b60..62bbe35eff7b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -82,11 +82,13 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>   
>   	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
>   
> +	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
>   	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
>   	trace_dpu_core_irq_register_callback(irq_idx, register_irq_cb);
>   	list_del_init(&register_irq_cb->list);
>   	list_add_tail(&register_irq_cb->list,
>   			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx]);
> +	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
>   	if (list_is_first(&register_irq_cb->list,
>   			&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
>   		int ret = dpu_kms->hw_intr->ops.enable_irq(
> @@ -96,8 +98,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>   			DPU_ERROR("Fail to enable IRQ for irq_idx:%d\n",
>   					irq_idx);
>   	}
> -
> -	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> +	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
>   
>   	return 0;
>   }
> @@ -127,9 +128,11 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
>   
>   	DPU_DEBUG("[%pS] irq_idx=%d\n", __builtin_return_address(0), irq_idx);
>   
> +	mutex_lock(&dpu_kms->irq_obj.hw_enable_lock);
>   	spin_lock_irqsave(&dpu_kms->irq_obj.cb_lock, irq_flags);
>   	trace_dpu_core_irq_unregister_callback(irq_idx, register_irq_cb);
>   	list_del_init(&register_irq_cb->list);
> +	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
>   	/* empty callback list but interrupt is still enabled */
>   	if (list_empty(&dpu_kms->irq_obj.irq_cb_tbl[irq_idx])) {
>   		int ret = dpu_kms->hw_intr->ops.disable_irq(
> @@ -140,7 +143,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
>   					irq_idx);
>   		DPU_DEBUG("irq_idx=%d ret=%d\n", irq_idx, ret);
>   	}
> -	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> +	mutex_unlock(&dpu_kms->irq_obj.hw_enable_lock);
>   
>   	return 0;
>   }
> @@ -207,6 +210,7 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
>   	dpu_disable_all_irqs(dpu_kms);
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   
> +	mutex_init(&dpu_kms->irq_obj.hw_enable_lock);
>   	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
>   
>   	/* Create irq callbacks for all possible irq_idx */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index f6840b1af6e4..5a162caea29d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -83,6 +83,7 @@ struct dpu_irq_callback {
>    * @total_irq:    total number of irq_idx obtained from HW interrupts mapping
>    * @irq_cb_tbl:   array of IRQ callbacks setting
>    * @cb_lock:      callback lock
> + * @hw_enable_lock: lock to synchronize callback register and unregister
>    * @debugfs_file: debugfs file for irq statistics
>    */
>   struct dpu_irq {
> @@ -90,6 +91,7 @@ struct dpu_irq {
>   	struct list_head *irq_cb_tbl;
>   	atomic_t *irq_counts;
>   	spinlock_t cb_lock;
> +	struct mutex hw_enable_lock;
>   };
>   
>   struct dpu_kms {
> 


-- 
With best wishes
Dmitry
