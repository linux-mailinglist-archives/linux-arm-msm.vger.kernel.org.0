Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E45332535F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 17:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhBYQTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 11:19:25 -0500
Received: from z11.mailgun.us ([104.130.96.11]:14625 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233159AbhBYQTG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 11:19:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614269929; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uL5kORNFUPTj0VZj13q8jFOv26gDBZT7GDeEl5T/6nc=; b=pwzXgsyY9CidnlpkD4YessqUlFXkKUaNWwcPZlA8N0f3nz06fR58mlLsgYXlWh9FHRpZqOHn
 yea2qFcQPNePUTkQVeF1P5wS6RlQDtNpLYQkyYXCRw6v3Y/lspSDEvCotaUy6mX4fkzG4nS7
 pllaZbFnXdlbK3VFlZRIagF9o2w=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6037cdc07ea222fbf5d5cb72 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 16:18:08
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 180E0C43462; Thu, 25 Feb 2021 16:18:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D231DC433ED;
        Thu, 25 Feb 2021 16:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D231DC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] mhi: Fix invalid error returning in mhi_queue
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1614247980-1776-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <b2ddde03-cc80-ad5a-97b0-62ea2091271b@codeaurora.org>
Date:   Thu, 25 Feb 2021 09:18:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614247980-1776-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/25/2021 3:13 AM, Loic Poulain wrote:
> mhi_queue returns an error when the doorbell is not accessible in
> the current state. This can happen when the device is in non M0
> state, like M3, and needs to be waken-up prior ringing the DB. this
> case is manager earlier by triggering an asynchronous M3 exit via

"This case is managed"?

> controller resume/suspend callbacks, that in turn will cause M0
> transition and DB update.
> 
> So, since it's not an error but just delaying of doorbell update do not
> return an error.
> 
> That also fix a use after free error for skb case, indeed a caller

"This also fixes"?

> queuing skb will try to free the skb if the queueing fails, but in
> that case queueing has been done.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Is Fixes appropriate since you mention fixing a use after free?

> ---
>   drivers/bus/mhi/core/main.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 7fc2482..c780234 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1031,12 +1031,8 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>   	if (mhi_chan->dir == DMA_TO_DEVICE)
>   		atomic_inc(&mhi_cntrl->pending_pkts);
>   
> -	if (unlikely(!MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> -		ret = -EIO;
> -		goto exit_unlock;
> -	}
> -
> -	mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> +	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> +		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>   
>   exit_unlock:
>   	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> 

Seems good to me.  Feel free to add the below on the next revision -
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
