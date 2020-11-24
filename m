Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4982C2D0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390452AbgKXQgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:36:41 -0500
Received: from z5.mailgun.us ([104.130.96.5]:22779 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390374AbgKXQgl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:36:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606235801; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gCBKOXdqtAx4+AXKdvyMKYwidXGV5tKBLcl5wBj6jAQ=; b=FFlN1IDwcVrLk5mwr3ABpPIEuJa9blS47F6O/IMKVPniUtr1I2xngc3j6Qx9H7dYlCTT9zsh
 oj1vJqc45PWzYeegcYVa9b9dmlGHdk/TWCEkHRWjwC9jY+U3JuX/hic0NclprkZBqzT9J13e
 uo7WbQUWsjw5WjG4zDdsluTwbDg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fbd3690e714ea65012c4034 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 16:36:32
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2BDF6C43462; Tue, 24 Nov 2020 16:36:32 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9551C433C6;
        Tue, 24 Nov 2020 16:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9551C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org
References: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <b66d5f09-7560-3b82-84a3-b7cf40c9532e@codeaurora.org>
Date:   Tue, 24 Nov 2020 09:36:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/24/2020 9:18 AM, Loic Poulain wrote:
> A MHI client device should be child of the MHI controller device.
> Today both MHI controller and its MHI clients are direct children
> of the same bus device. This patch fixes the hierarchy.

Why?

I'm not particularly arguing for or against this change (I think it 
affects me slightly, but not in a breaking way), but this commit text 
seems pretty generic.  It doesn't really help me understand the 
relevance of this change.  It seems to be only describing what you are 
doing, but not the why.  How did you find this?  How does this affect 
the client drivers?  Does it make something the client drivers care 
about better?

To put this another way, "should" is an opinion, and you've provided no 
facts to assert why your opinion is superior to others.

> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   v2: fix commit message
> 
>   drivers/bus/mhi/core/init.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 436221c..c7a7354 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1137,7 +1137,15 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
>   	device_initialize(dev);
>   	dev->bus = &mhi_bus_type;
>   	dev->release = mhi_release_device;
> -	dev->parent = mhi_cntrl->cntrl_dev;
> +
> +	if (mhi_cntrl->mhi_dev) {
> +		/* for MHI client devices, parent is the MHI controller device */
> +		dev->parent = &mhi_cntrl->mhi_dev->dev;
> +	} else {
> +		/* for MHI controller device, parent is the bus device (e.g. pci device) */
> +		dev->parent = mhi_cntrl->cntrl_dev;
> +	}
> +
>   	mhi_dev->mhi_cntrl = mhi_cntrl;
>   	mhi_dev->dev_wake = 0;
>   
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
