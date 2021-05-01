Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0400237046D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 May 2021 02:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhEAAbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 20:31:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44447 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230290AbhEAAbj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 20:31:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619829050; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=WvWz0gbRm48kAWe+L3LFpw5iHaX9Gmr44pfC0e7Kx8I=; b=rG6GSbta3mgVGF/1t/S0XZQHOdQo5qfMY4qUh+mWQQRf+GnP/ZQIqd+0s/7UhJvg97ZQpWPM
 OIbQ5HdxulpbZmTjgJfDuVX4G6j7f14eTwGlh4rQ5MwAx8H1PZQZvrTtMSgxQFJVEjhzwsNi
 zWoNosnPGCtDf9OS2+/V+CWnZ84=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 608ca12efebcffa80f391557 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 May 2021 00:30:38
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8D0DC4338A; Sat,  1 May 2021 00:30:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D8CBC433F1;
        Sat,  1 May 2021 00:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D8CBC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Improve debug messages for power on
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
References: <1619485258-35689-1-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <c26a8005-3bd6-eab0-185d-6341419dd59c@codeaurora.org>
Date:   Fri, 30 Apr 2021 17:30:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1619485258-35689-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Bhaumik,

On 4/26/21 6:00 PM, Bhaumik Bhatt wrote:
> Improve error message to be more descriptive if a failure occurs
> with an invalid power on execution environment. Also add a debug
> message to print the execution environment and MHI state before
> a power on is attempted to get a better view of device states.
Can we add a scenario where this dbg log can help ? That gives a good 
justification for addition of new log.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/pm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index adf426c..f4a8b9a 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1076,12 +1076,16 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>   
>   	/* Confirm that the device is in valid exec env */
>   	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
> -		dev_err(dev, "Not a valid EE for power on\n");
> +		dev_err(dev, "%s is not a valid EE for power on\n",
> +			TO_MHI_EXEC_STR(current_ee));
>   		ret = -EIO;
>   		goto error_async_power_up;
>   	}
>   
>   	state = mhi_get_mhi_state(mhi_cntrl);
> +	dev_dbg(dev, "Attempting power on with EE: %s, state: %s\n",
> +		TO_MHI_EXEC_STR(current_ee), TO_MHI_STATE_STR(state));
> +
>   	if (state == MHI_STATE_SYS_ERR) {
>   		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>   		ret = wait_event_timeout(mhi_cntrl->state_event,
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
