Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCEF2C46FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 18:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730347AbgKYRqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 12:46:19 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:53342 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730214AbgKYRqT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 12:46:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606326379; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZTQ18HzkDOdjIi15SvFd8imsErtsWlcZQq7abNAHxHI=; b=HtZCLvXgHIjfdGPVcoN1BWDhv8u1cjvo+QDK/omuh+mi/PcT9bJc3pcJlNR53O80nReHIetA
 wrcdOn4ylZhUeMdfMpD0lXTfH0HeIrDfwxpHMhb7hfeHRkMn1YMnOMzWzd8eP8xifIzaMvkn
 CU1ESzd9Kuu9nLPhBrGisjo+9vA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fbe98631dba509aaee7517d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 17:46:11
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 83133C43460; Wed, 25 Nov 2020 17:46:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 735BCC433ED;
        Wed, 25 Nov 2020 17:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 735BCC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Ensure correct ring update ordering with memory
 barrier
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1605867751-22819-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <3b3f8d33-ed7f-d197-4621-5714a6ec1c94@codeaurora.org>
Date:   Wed, 25 Nov 2020 10:46:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1605867751-22819-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/20/2020 3:22 AM, Loic Poulain wrote:
> The ring element data, though being part of coherent memory, still need
> to be performed before updating the ring context to point to this new
> element. That can be guaranteed with a memory barrier (dma_wmb).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/core/main.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 94be0f8..188501c0 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -111,7 +111,13 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>   	dma_addr_t db;
>   
>   	db = ring->iommu_base + (ring->wp - ring->base);
> +
> +	/* Writes to the new ring element must be visible to the hardware
> +	 * before letting h/w know there is new element to fetch.
> +	 */

This doesn't look like the correct style for multi-line comments.

> +	dma_wmb();
>   	*ring->ctxt_wp = db;
> +
>   	mhi_chan->db_cfg.process_db(mhi_cntrl, &mhi_chan->db_cfg,
>   				    ring->db_addr, db);
>   }
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
