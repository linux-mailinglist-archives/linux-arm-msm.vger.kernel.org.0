Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E5331D2E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 23:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhBPW66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 17:58:58 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:51580 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhBPW65 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 17:58:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613516318; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xufzHw9jEo/iWIDfIpIw4U4Wbd5Ej3k0WcIimpzscVM=;
 b=vYp/Lo06QYXEBkbCAfr2X0ZuYWMr2Cpwu172OCE/aAbwGImed+MUSwpD1z0Ino5clafouHoX
 Njyo4tRNfmKs+xg0oryqU6N1cVe+oRzU4MdD6UBxJT6FhE/2kjw3WWEUHSJKguXIcvVS2jyO
 5vhnOgk0wHk0x0ycK77bvQFBLgE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 602c4dfd9f8fd267c23dd4a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 22:58:05
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5DF7C433CA; Tue, 16 Feb 2021 22:58:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D975C433C6;
        Tue, 16 Feb 2021 22:58:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Feb 2021 14:58:04 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] mhi_bus: core: Check state before processing power_down
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1613511496-22271-1-git-send-email-jhugo@codeaurora.org>
References: <1613511496-22271-1-git-send-email-jhugo@codeaurora.org>
Message-ID: <6ed2bb4fb04ac47b86ff4bacab1d3b15@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-16 01:38 PM, Jeffrey Hugo wrote:
> We cannot process a power_down if the power state is DISABLED.  There 
> is
> no valid mhi_ctxt in that case, so attepting to process the power_down
> will likely result in a null pointer dereference.  If the power state 
> is
> DISABLED, there is nothing to do anyways, so just bail early.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 56ba3ab..dc69074 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1144,6 +1144,7 @@ int mhi_async_power_up(struct mhi_controller 
> *mhi_cntrl)
>  		mhi_deinit_dev_ctxt(mhi_cntrl);
> 
>  error_dev_ctxt:
> +	mhi_cntrl->pm_state = MHI_PM_DISABLE;
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
> 
>  	return ret;
> @@ -1155,6 +1156,12 @@ void mhi_power_down(struct mhi_controller
> *mhi_cntrl, bool graceful)
>  	enum mhi_pm_state cur_state, transition_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> 
> +	mutex_lock(&mhi_cntrl->pm_mutex);
> +	cur_state = mhi_cntrl->pm_state;
> +	mutex_unlock(&mhi_cntrl->pm_mutex);
> +	if (cur_state == MHI_PM_DISABLE)
Let's unlock the mutex here and not at the top. We acquire it below 
anyway.
> +		return; /* Already powered down */
> +
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
>  	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
>  			   MHI_PM_LD_ERR_FATAL_DETECT;

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
