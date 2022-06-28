Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551C355D64E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiF1MIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiF1MIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:08:46 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893633334A
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:08:45 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e40so17282046eda.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3XA6dQx2okYJlav+7EBcRXTzZuGUDtxOanRBdKGs0BY=;
        b=SXKEXVwV1LXjuUVs4Grljr7qurz7/UMqbt1kPD6WOCog/OUfNetmO279XsQQ+MC4wA
         ywSLYTwl7UaleD8jnS80jxMkLOA8GGgr8inMKWBgf9Aytr6nx4pttcrB3vYcU4OeAvqM
         8Q0FqOX0MaUxqwEDBxSxFlSU1M4ca3cjjeX4NAsVhUAbkhPFXgWVcWPbJGoh1D0EeoMh
         AZpzV/LkdRANyEnweW1WJMwM8NyhgXY/QKsBy4wDew068v6WGBPCTac9GRARakGHvg6z
         NR+jSjWAU3kaFLy3qMc0eR5tT01eJvBCELfK7d99IH4E1CdhH4sU2CBy9JM3puE4kxmR
         SpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3XA6dQx2okYJlav+7EBcRXTzZuGUDtxOanRBdKGs0BY=;
        b=wfCWr4ntSsnTYO93hIHg161ZL0+wEhRfLmq/N1pV2DWJiQAfjIdhIi4x7D5WGfKlUG
         RdvGdkzAjF+GexPKpo0EIWXubj1mdcFb5ubKM1KQi5KywzUXkVuXtj5ghyWsiJJPo+Fo
         clUOgw3gZKW6B0SQTSgRoVVln6dEmLs6USpkTV6Hj/1P6nymjtcVOPCx49IH7MDFtnwH
         m7ljQKYER9lcu/7bTmQNQNKqC4WAeVBRnbygVeFg+SDvcUjzRcOtENCvJ9YM8PLE5J7t
         jouu1Nh6sE/KEX8F+1zW49kyjF3c7X1er02OmSiN0u3VimV4aNpmuPiSYojw5wNdTw+v
         fnNw==
X-Gm-Message-State: AJIora9xaf++yMOsqAIpVHBBhgVuIduh+u4ynOosSOWUfSbTbwUsoba/
        h4aiBt5QIaYonqqWxaLYa1s3JgRHOfqsrg==
X-Google-Smtp-Source: AGRyM1vUdPv1z7krju/JzGlkrdZAX/ui0fe0v7Wt3M0AUy4HrRMyYxZ0SlKj7VUtKzy9mMRE2Wi0+w==
X-Received: by 2002:a05:6402:1e93:b0:435:7f3f:407f with SMTP id f19-20020a0564021e9300b004357f3f407fmr23061634edf.173.1656418124118;
        Tue, 28 Jun 2022 05:08:44 -0700 (PDT)
Received: from [192.168.1.12] (88-107-17-60.dynamic.dsl.as9105.com. [88.107.17.60])
        by smtp.gmail.com with ESMTPSA id w20-20020aa7dcd4000000b0042dc882c823sm9322319edu.70.2022.06.28.05.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 05:08:43 -0700 (PDT)
Message-ID: <408cb630-9ded-0e47-5dcd-6fc8feec79e0@linaro.org>
Date:   Tue, 28 Jun 2022 13:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: fix runtime PM underflow
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220609195043.1544625-1-caleb.connolly@linaro.org>
 <Yqs3bypHiAgkg4dp@matsya>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <Yqs3bypHiAgkg4dp@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/06/2022 15:00, Vinod Koul wrote:
> On 09-06-22, 20:50, Caleb Connolly wrote:
>> When PM runtime is disabled, pm_runtime_get() isn't called, but
>> pm_runtime_put() still is. Fix this by creating a matching wrapper
>> on pm_runtime_put_autosuspend().
>>
>> Fixes: dbad41e7bb5f ("dmaengine: qcom: bam_dma: check if the runtime pm enabled")
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>   drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index 87f6ca1541cf..a36dedee262e 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
>> @@ -566,6 +566,14 @@ static int bam_pm_runtime_get_sync(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int bam_pm_runtime_put_autosuspend(struct device *dev)
>> +{
>> +	if (pm_runtime_enabled(dev))
>> +		return pm_runtime_put_autosuspend(dev);
>> +
>> +	return 0;
>> +}
> 
> should we really do a wrapper to fix this ;-) I would think dropping the
> get wrapper and calling pm_runtime_get() unconditionally would be
> better..?
The original pm_runtime_get() wrapper was added because _get() returns -EACCES 
if PM is disabled for the device, I've read through some of the pm_runtime docs 
and I don't see any way to handle this nicely in the framework. I think the real 
fix will have to be in pm_runtime.

I can rework this to explicitly check for -EACCES on every _get() call, but we 
still need to check if pm_runtime is enabled before calling _put().
> 
>> +
>>   /**
>>    * bam_free_chan - Frees dma resources associated with specific channel
>>    * @chan: specified channel
>> @@ -617,7 +625,7 @@ static void bam_free_chan(struct dma_chan *chan)
>>   
>>   err:
>>   	pm_runtime_mark_last_busy(bdev->dev);
>> -	pm_runtime_put_autosuspend(bdev->dev);
>> +	bam_pm_runtime_put_autosuspend(bdev->dev);
>>   }
>>   
>>   /**
>> @@ -793,7 +801,7 @@ static int bam_pause(struct dma_chan *chan)
>>   	bchan->paused = 1;
>>   	spin_unlock_irqrestore(&bchan->vc.lock, flag);
>>   	pm_runtime_mark_last_busy(bdev->dev);
>> -	pm_runtime_put_autosuspend(bdev->dev);
>> +	bam_pm_runtime_put_autosuspend(bdev->dev);
>>   
>>   	return 0;
>>   }
>> @@ -819,7 +827,7 @@ static int bam_resume(struct dma_chan *chan)
>>   	bchan->paused = 0;
>>   	spin_unlock_irqrestore(&bchan->vc.lock, flag);
>>   	pm_runtime_mark_last_busy(bdev->dev);
>> -	pm_runtime_put_autosuspend(bdev->dev);
>> +	bam_pm_runtime_put_autosuspend(bdev->dev);
>>   
>>   	return 0;
>>   }
>> @@ -936,7 +944,7 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
>>   	}
>>   
>>   	pm_runtime_mark_last_busy(bdev->dev);
>> -	pm_runtime_put_autosuspend(bdev->dev);
>> +	bam_pm_runtime_put_autosuspend(bdev->dev);
>>   
>>   	return IRQ_HANDLED;
>>   }
>> @@ -1111,7 +1119,7 @@ static void bam_start_dma(struct bam_chan *bchan)
>>   			bam_addr(bdev, bchan->id, BAM_P_EVNT_REG));
>>   
>>   	pm_runtime_mark_last_busy(bdev->dev);
>> -	pm_runtime_put_autosuspend(bdev->dev);
>> +	bam_pm_runtime_put_autosuspend(bdev->dev);
>>   }
>>   
>>   /**
>> -- 
>> 2.36.1
> 

-- 
Kind Regards,
Caleb (they/he)
