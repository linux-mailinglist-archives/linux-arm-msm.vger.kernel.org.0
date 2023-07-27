Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBDC765C75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 21:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjG0Tvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 15:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbjG0Tvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 15:51:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4614130E3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 12:51:36 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb7589b187so2355162e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690487494; x=1691092294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gI2//8zS+AN4Q7xyBtzQafzjJUrT2RfB13EWGa2b8ko=;
        b=NJrk9w8SaciiMvhA79XAEFpI6UfZ//yo0myBn3+3ZtlA1jlMwOtdgOKsu66cigTnEu
         a/1Kx+eRF+pGjvvrJT88r7hca7LozkVaiOuSxX0wGQJC5Hw8PQaEPB65TnbYB7rcyDyc
         hRiZVJV3zDcQZdvbXUA/lZHoHQHZh0RgXpz6IU0iPKaa8of3SnNn3ipK/8UU54Ltm6Ec
         EzD1xzvtaa5+zvNZd85LzPBDL7xkDGsbCclTc2VEOsTA6pFsgKg5TujMM4CQtD5sPfiE
         nJpo1QDeTC3h8iQTOWkYEbDfZf/d9S+ZTqVn/rq6U01o1hcVaosMm5kpNBX2qUdsy19o
         yFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487494; x=1691092294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gI2//8zS+AN4Q7xyBtzQafzjJUrT2RfB13EWGa2b8ko=;
        b=WX5JLSKyiBUYqNxzsLmyNIGhu8Kv8mMH1ybYxegyf9faoB8OR84UeuHBTPbHEc7nWb
         5oQEIX0cZU0ht0BzuFgBir7mR0B+yUA5iLJm60asNe7dPXsFNhH1KjPEdG0CV4gBmhxq
         AFhcvAWLSznKSdUr/urcLzvps2d+crJk3YmDjqJwl/Ru7dHX7sZaCI8ZoJuhmpViPiqb
         XOhZbCIc/9XMerQJLlkfheKyhwJzuCl3Pln0uErm3dce2TNMnnQNHGoBoI2Y59m/U6F+
         W5qPVckwubQtySfPPG8MDrRP/EQRStbRPcqlwcFor3nXMLfJLDtZdMQMvI2NwJ8Lssda
         Zu2g==
X-Gm-Message-State: ABy/qLb3XklGPMcTSjxzs1vCN4VxToG1/+r7HqBQyDUEZ/vZArjtlJU1
        Kz1Y7ML0sITsbVNs9pOox0Jy8Q==
X-Google-Smtp-Source: APBJJlH4L5MCh4NmYlYVxzm0/h0wKot4bsTp2aHyEB/qmW8a18zAo+bXMcQvDgBdSIiyoWHZpXlZbQ==
X-Received: by 2002:a05:6512:5d5:b0:4fb:7be5:7404 with SMTP id o21-20020a05651205d500b004fb7be57404mr98616lfo.63.1690487494461;
        Thu, 27 Jul 2023 12:51:34 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020a50ea84000000b005221f0b75b7sm970037edo.27.2023.07.27.12.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 12:51:34 -0700 (PDT)
Message-ID: <2e20d0ac-0fb5-3f33-910c-438d34d8109e@linaro.org>
Date:   Thu, 27 Jul 2023 22:51:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
 <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
 <7b7e0a8a-392c-19c3-6642-7479c28d4ed8@linaro.org>
 <zilvhfz4qgvnz4thp6wlbg6al7hahen2gw2k5el5o6pi2ysxb6@qhwzla4zmze5>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <zilvhfz4qgvnz4thp6wlbg6al7hahen2gw2k5el5o6pi2ysxb6@qhwzla4zmze5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 22:41, Marijn Suijten wrote:
> On 2023-07-27 22:34:59, Dmitry Baryshkov wrote:
>> On 27/07/2023 22:29, Marijn Suijten wrote:
>>> On 2023-07-27 18:04:54, Dmitry Baryshkov wrote:
>>>> In preparation to reworking the IRQ indices, move irq_tbl access to
>>>> separate helper.
>>>
>>> I am not seeing the advantage of the helper, but making every function
>>> look up dpu_kms->hw_intr->irq_tbl[irq_idx] only once and storing that in
>>> a local dpu_hw_intr_entry pointer is much tidier.
>>
>> There was a bonus point when I tried to do a irq_idx-1 in the next
>> patch. But since that code has gone, maybe I can drop this patch too.
> 
> Don't drop the whole patch though.  While maybe not necessary, having
> the lookup only once is much easier to follow.

Then it's easier to keep it as is.

> 
> - Marijn
> 
>>> Maybe I expected it to do extra mutations to irq_idx in 4/4?
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>>> ---
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
>>>>    2 files changed, 41 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>>> index eaae7f11f57f..ede7161ae904 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>>> @@ -199,6 +199,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>>>>    
>>>>    #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
>>>>    
>>>> +static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
>>>> +							       int irq_idx)
>>>> +{
>>>> +	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
>>>> +}
>>>> +
>>>>    /**
>>>>     * dpu_core_irq_callback_handler - dispatch core interrupts
>>>>     * @dpu_kms:		Pointer to DPU's KMS structure
>>>> @@ -206,17 +212,19 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>>>>     */
>>>>    static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>>>>    {
>>>> +	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
>>>> +
>>>>    	VERB("irq_idx=%d\n", irq_idx);
>>>>    
>>>> -	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
>>>> +	if (!irq_entry->cb)
>>>>    		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
>>>>    
>>>> -	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
>>>> +	atomic_inc(&irq_entry->count);
>>>>    
>>>>    	/*
>>>>    	 * Perform registered function callback
>>>>    	 */
>>>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
>>>> +	irq_entry->cb(irq_entry->arg);
>>>>    }
>>>>    
>>>>    irqreturn_t dpu_core_irq(struct msm_kms *kms)
>>>> @@ -509,6 +517,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>>>    		void (*irq_cb)(void *arg),
>>>>    		void *irq_arg)
>>>>    {
>>>> +	struct dpu_hw_intr_entry *irq_entry;
>>>>    	unsigned long irq_flags;
>>>>    	int ret;
>>>>    
>>>> @@ -526,15 +535,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>>>    
>>>>    	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>>>    
>>>> -	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
>>>> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
>>>> +	if (unlikely(WARN_ON(irq_entry->cb))) {
>>>>    		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>>>    
>>>>    		return -EBUSY;
>>>>    	}
>>>>    
>>>>    	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
>>>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
>>>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
>>>> +	irq_entry->arg = irq_arg;
>>>> +	irq_entry->cb = irq_cb;
>>>>    
>>>>    	ret = dpu_hw_intr_enable_irq_locked(
>>>>    				dpu_kms->hw_intr,
>>>> @@ -551,6 +561,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>>>    
>>>>    int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>>>>    {
>>>> +	struct dpu_hw_intr_entry *irq_entry;
>>>>    	unsigned long irq_flags;
>>>>    	int ret;
>>>>    
>>>> @@ -569,8 +580,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>>>>    		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
>>>>    					irq_idx, ret);
>>>>    
>>>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
>>>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
>>>> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
>>>> +	irq_entry->cb = NULL;
>>>> +	irq_entry->arg = NULL;
>>>>    
>>>>    	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>>>    
>>>> @@ -583,14 +595,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>>>>    static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>>>>    {
>>>>    	struct dpu_kms *dpu_kms = s->private;
>>>> +	struct dpu_hw_intr_entry *irq_entry;
>>>>    	unsigned long irq_flags;
>>>>    	int i, irq_count;
>>>>    	void *cb;
>>>>    
>>>>    	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>>>>    		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>>> -		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
>>>> -		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
>>>> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
>>>> +		irq_count = atomic_read(&irq_entry->count);
>>>> +		cb = irq_entry->cb;
>>>>    		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>>>    
>>>>    		if (irq_count || cb)
>>>> @@ -613,6 +627,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
>>>>    void dpu_core_irq_preinstall(struct msm_kms *kms)
>>>>    {
>>>>    	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>>>> +	struct dpu_hw_intr_entry *irq_entry;
>>>>    	int i;
>>>>    
>>>>    	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>>> @@ -620,22 +635,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
>>>>    	dpu_disable_all_irqs(dpu_kms);
>>>>    	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>>    
>>>> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
>>>> -		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
>>>> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>>>> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
>>>> +		atomic_set(&irq_entry->count, 0);
>>>> +	}
>>>>    }
>>>>    
>>>>    void dpu_core_irq_uninstall(struct msm_kms *kms)
>>>>    {
>>>>    	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>>>> +	struct dpu_hw_intr_entry *irq_entry;
>>>>    	int i;
>>>>    
>>>>    	if (!dpu_kms->hw_intr)
>>>>    		return;
>>>>    
>>>>    	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>>> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
>>>> -		if (dpu_kms->hw_intr->irq_tbl[i].cb)
>>>> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>>>> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
>>>> +		if (irq_entry->cb)
>>>>    			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
>>>> +	}
>>>>    
>>>>    	dpu_clear_irqs(dpu_kms);
>>>>    	dpu_disable_all_irqs(dpu_kms);
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>>> index 3a988a4e4f33..59bde8ab50c8 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>>> @@ -40,6 +40,12 @@ enum dpu_hw_intr_reg {
>>>>    #define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
>>>>    #define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
>>>>    
>>>> +struct dpu_hw_intr_entry {
>>>> +	void (*cb)(void *arg);
>>>> +	void *arg;
>>>> +	atomic_t count;
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct dpu_hw_intr: hw interrupts handling data structure
>>>>     * @hw:               virtual address mapping
>>>> @@ -59,11 +65,7 @@ struct dpu_hw_intr {
>>>>    	unsigned long irq_mask;
>>>>    	const struct dpu_intr_reg *intr_set;
>>>>    
>>>> -	struct {
>>>> -		void (*cb)(void *arg);
>>>> -		void *arg;
>>>> -		atomic_t count;
>>>> -	} irq_tbl[];
>>>> +	struct dpu_hw_intr_entry irq_tbl[];
>>>>    };
>>>>    
>>>>    /**
>>>> -- 
>>>> 2.39.2
>>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

