Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBCA32ED75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 15:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhCEOt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 09:49:59 -0500
Received: from z11.mailgun.us ([104.130.96.11]:16842 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhCEOts (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 09:49:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614955787; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vKfsDD6E67PEDDrXFRajmZQTbfwg5aWfkQSK+6n3z+Y=; b=rAqkHXJJDCT568An5OFm0mWpU4LCe/dg2319+nvRlHEI40KjX8stw8xdtY/1WZKj53aIOp/q
 zn3BEHbGLam4AfpsXHs2Tszz/AWSmG+zSy31zmOK4c5nb+0NqpM0F6Ufxl/LUxGr3HRHWoSc
 m4Dvxh+ex8r/zYHwTtBCcDe8fDw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6042450ae5eea4c43b98a138 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 14:49:46
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6742FC433ED; Fri,  5 Mar 2021 14:49:46 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2914DC433CA;
        Fri,  5 Mar 2021 14:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2914DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: pm: Change mhi_pm_resume timeout value
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <153fe801-3855-5aa3-8698-ac7fde697255@codeaurora.org>
Date:   Fri, 5 Mar 2021 07:49:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/5/2021 7:09 AM, Loic Poulain wrote:
> mhi_cntrl->timeout_ms is set by the controller and indicates the
> maximum amount of time the controller device will take to be ready.
> In case of PCI modems, this value is quite high given modems can take
> up to 15 seconds from cold boot to be ready.
> 
> Reusing this value in mhi_pm_resume can cause huge resuming latency
> and delay the whole system resume (in case of system wide suspend/
> resume), leading to bad use experience.

I think this needs more explanation.  The timeout is a maximum value. 
You indicate that 2 seconds is more than enough for any MHI device to 
exit M3 (citation needed), but 15 seconds is too much?  The difference 
should only be apparent when the device doesn't transition in the timeout.

Put another way, this doesn't say why 15 seconds is bad, if every device 
only needs 2, given that wait_event_timeout() doesn't always wait for 
the entire timeout value if the event occurs earlier.

> 
> This change adjusts the resume timeout to a fixed 2s value, which is
> more than enough for any MHI device for exiting M3.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/core/pm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 0cd6445..e2d83a9 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -17,6 +17,8 @@
>   #include <linux/wait.h>
>   #include "internal.h"
>   
> +#define MHI_PM_RESUME_TIMEOUT_MS 2000
> +
>   /*
>    * Not all MHI state transitions are synchronous. Transitions like Linkdown,
>    * SYS_ERR, and shutdown can happen anytime asynchronously. This function will
> @@ -942,7 +944,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>   	ret = wait_event_timeout(mhi_cntrl->state_event,
>   				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
>   				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> -				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
> +				 msecs_to_jiffies(MHI_PM_RESUME_TIMEOUT_MS));
>   
>   	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>   		dev_err(dev,
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
