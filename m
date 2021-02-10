Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1092F316D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 18:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhBJRqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 12:46:04 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:58712 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232996AbhBJRqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 12:46:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612979132; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F1GpcX34diCDt4/f/fDxZq3DY8kVl7gzwfc9irW1MRA=;
 b=lpRMZlrhUbrbT1PYjnUQzR3G1K0DYdhMwRboSJnMMZRtgqklz7a48yb02S+3bOAoYgXz161M
 D64lD6RuAQuZU3HeWKYQ6jVjAl0XxiKbJo5A3xuKE7UWTAggFcBhRDMhTYp+qp7TKc1ZL1Ar
 4Romgb6nwTTPY3uZVHafl5t4jXQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60241baad5a7a3baae1835e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 17:45:14
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A01FC43468; Wed, 10 Feb 2021 17:45:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76594C43461;
        Wed, 10 Feb 2021 17:45:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 10 Feb 2021 09:45:13 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh@linuxfoundation.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH 1/1] mhi: Fix double dma free
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210210082538.2494-2-manivannan.sadhasivam@linaro.org>
References: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
 <20210210082538.2494-2-manivannan.sadhasivam@linaro.org>
Message-ID: <a6771f11aa2b3e032223e94f744d2f32@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-10 12:25 AM, Manivannan Sadhasivam wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
s/functionthat/function that, uninitializing
> resources, including unmapping coherent MHI areas, can be called
> from different path in case of controller unregistering/removal:
>  - From a client driver remove callback, via mhi_unprepare_channel
>  - From mhi_driver_remove that unitialize all channels
uninitialize
> 
> mhi_driver_remove()
> |-> driver->remove()
> |    |-> mhi_unprepare_channel()
> |        |-> mhi_deinit_chan_ctxt()
> |...
> |-> mhi_deinit_chan_ctxt()
> 
> This leads to double dma freeing...
> 
> Fix that by preventing deinit for already uninitialized channel.
> 
> Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver 
> remove")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Tested-by: Kalle Valo <kvalo@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Link:
> https://lore.kernel.org/r/1612894264-15956-1-git-send-email-loic.poulain@linaro.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index aa575d3fb3ae..be4eebb0971b 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -557,6 +557,9 @@ void mhi_deinit_chan_ctxt(struct mhi_controller 
> *mhi_cntrl,
>  	tre_ring = &mhi_chan->tre_ring;
>  	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
> 
> +	if (!chan_ctxt->rbase) /* Already uninitialized */
> +		return;
> +
>  	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
>  			  tre_ring->pre_aligned, tre_ring->dma_handle);
>  	vfree(buf_ring->base);

As mentioned in my previous email, I see some improvements can be made 
to the commit
message and title of this patch. Highlighted those above.

Please update title to "bus: mhi: core: Fix double DMA free from 
mhi_deinit_chan_ctxt()".

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
