Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC6932694C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 22:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhBZVQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 16:16:37 -0500
Received: from z11.mailgun.us ([104.130.96.11]:62700 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230018AbhBZVQf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 16:16:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614374174; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i4IYjP9ShPsCXpO54hPGJdefd6O+Ag/UKRehCX9Zvq4=; b=r6HJX67Tjd4QDx2XVnaqNZJEiAnJVCsgdbN2aDloUG/6yiXGRO0yimW0z2LAjZpi0RSO7B+u
 ug3OpiDjPyzgPH4EdIpFkEHrv+9iR+QbohrZL3Ipm0uamu23+73Ro6LNAgGxUjPNWnH9Y0sA
 sHUAwUL7Ld21WlAdFHyZ5SiNeC8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 603964ffea39d1db6d7ce592 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 21:15:43
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9EEDAC43461; Fri, 26 Feb 2021 21:15:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70E90C433C6;
        Fri, 26 Feb 2021 21:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70E90C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2] mhi: Fix invalid error returning in mhi_queue
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     jhugo@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org
References: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <bb208948-64e7-a304-999c-adf2a71657c2@codeaurora.org>
Date:   Fri, 26 Feb 2021 13:15:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 2/26/21 2:53 AM, Loic Poulain wrote:
> mhi_queue returns an error when the doorbell is not accessible in
> the current state. This can happen when the device is in non M0
> state, like M3, and needs to be waken-up prior ringing the DB. This
> case is managed earlier by triggering an asynchronous M3 exit via
> controller resume/suspend callbacks, that in turn will cause M0
> transition and DB update.
> 
> So, since it's not an error but just delaying of doorbell update, there
> is no reason to return an error.
> 
> This also fixes a use after free error for skb case, indeed a caller
> queuing skb will try to free the skb if the queueing fails, but in
> that case queueing has been done.
> 
> Fixes: a8f75cb348fd ("mhi: core: Factorize mhi queuing")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   v2: - Fix/reword commit message
>       - Add Fixes tag
> 
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
Caller of all of the ring db APIs mhi_ring_chan/er/cmd_db are checking 
this if condition "if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))" every 
where in the code. Does it make sense to move this check inside the APIs
itself, as a clean up.
>   
>   exit_unlock:
>   	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
