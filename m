Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BBE2EC84C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 03:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbhAGCqL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 21:46:11 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:39457 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbhAGCqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 21:46:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609987552; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iYm4bQqq8yAWThmxKgok8rq1h6/g/rQwkJSBuc3fKWw=; b=Fg6mbz6Nm7BxqrIg0lOHQMh4yct5r42W8vLMWKpNTh9d3McOmst+VQtz2igSMSkdyxNWM5NQ
 YddBFkKc0cREpk5NXm2PBJo7kmDycmVw+9sqt1eOXRA4Wzn+2PqASFTl9KVk2fC2SDs7nsZq
 cKlYU5f8Hi05Bn9bRIOo6T2/t1k=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ff675bbb00f200123764c88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 02:45:15
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D8E3C433CA; Thu,  7 Jan 2021 02:45:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F308C43462;
        Thu,  7 Jan 2021 02:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F308C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] mhi: core: Factorize mhi queuing
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1607599892-6229-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <a6f80ba7-928c-1577-ddbf-9ec58241d77e@codeaurora.org>
Date:   Wed, 6 Jan 2021 18:45:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607599892-6229-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 12/10/20 3:31 AM, Loic Poulain wrote:
> Instead of duplicating queuing procedure in mhi_queue_dma(),
> mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
> as common helper.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/core/main.c | 160 +++++++++++---------------------------------
>   1 file changed, 38 insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 3871ef0..4fa4c88 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -963,118 +963,78 @@ static bool mhi_is_ring_full(struct mhi_controller *mhi_cntrl,
>   	return (tmp == ring->rp);
>   }
>   
> -int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct sk_buff *skb, size_t len, enum mhi_flags mflags)
> +static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
> +		     enum dma_data_direction dir, enum mhi_flags mflags)
>   {
>   	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>   	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
>   							     mhi_dev->dl_chan;
>   	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
> -	struct mhi_buf_info buf_info = { };
> +	unsigned long flags;
>   	int ret;
>   
> -	/* If MHI host pre-allocates buffers then client drivers cannot queue */
> -	if (mhi_chan->pre_alloc)
Are we getting rid of auto_queue ?
> -		return -EINVAL;
> +	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
> +		return -EIO;
>   
> -	if (mhi_is_ring_full(mhi_cntrl, tre_ring))
> -		return -ENOMEM;
> +	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
This is something used in mhi_queue_buf and rest of the (_skb, _dma) 
used read_lock_bh. I see that now you are making it a re-interant as you
identified before :) So irq ver is disabling irq on the core this code 
is running and disabling preemption, where as bh ver is preemptiable. Is 
that the reason you chose irq instead of bh ?
[..]

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
