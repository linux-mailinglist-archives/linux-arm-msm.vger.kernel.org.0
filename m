Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68ED63546D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 20:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbhDESvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 14:51:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19138 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235442AbhDESvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 14:51:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617648685; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Um8t0peWpTZ291rX+7KLfjjfHsMnQ6CF6bYSIU8muug=;
 b=jFLlLM+oV7ufUl59jvBU7g+qMDDygLN5xYBePwg997GmLlItUBJtycdLSM9vAcqH4snPNE71
 odzpxoAzWgQ+Z7NTMxLgq1eg6/si+wKcv7ENbPdG5uUU6ttm2gVH9T8r2oy4vqqAJ5NMqqho
 QAzgLJ0T6DkE8zoERpFD1OdIr34=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606b5c2a8807bcde1dc491a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 18:51:22
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 142B1C433CA; Mon,  5 Apr 2021 18:51:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B0BCC433C6;
        Mon,  5 Apr 2021 18:51:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Apr 2021 11:51:21 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: pm: reduce PM state change verbosity
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1614963744-25962-2-git-send-email-loic.poulain@linaro.org>
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
 <1614963744-25962-2-git-send-email-loic.poulain@linaro.org>
Message-ID: <1c2e88c2f4ba5c5fa1fbde8f1b06517e@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-05 09:02 AM, Loic Poulain wrote:
> Since M3 can be entered/exited quite a lot when used for runtime PM,
> keep the mhi suspend/resume transitions quiet.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/pm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index edd7794..0cd6445 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -858,7 +858,7 @@ int mhi_pm_suspend(struct mhi_controller 
> *mhi_cntrl)
>  		return -EBUSY;
>  	}
> 
> -	dev_info(dev, "Allowing M3 transition\n");
> +	dev_dbg(dev, "Allowing M3 transition\n");
>  	new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_M3_ENTER);
>  	if (new_state != MHI_PM_M3_ENTER) {
>  		write_unlock_irq(&mhi_cntrl->pm_lock);
> @@ -872,7 +872,7 @@ int mhi_pm_suspend(struct mhi_controller 
> *mhi_cntrl)
>  	/* Set MHI to M3 and wait for completion */
>  	mhi_set_mhi_state(mhi_cntrl, MHI_STATE_M3);
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
> -	dev_info(dev, "Wait for M3 completion\n");
> +	dev_dbg(dev, "Wait for M3 completion\n");
> 
>  	ret = wait_event_timeout(mhi_cntrl->state_event,
>  				 mhi_cntrl->dev_state == MHI_STATE_M3 ||
> @@ -906,7 +906,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  	enum mhi_pm_state cur_state;
>  	int ret;
> 
> -	dev_info(dev, "Entered with PM state: %s, MHI state: %s\n",
> +	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
>  		 to_mhi_pm_state_str(mhi_cntrl->pm_state),
>  		 TO_MHI_STATE_STR(mhi_cntrl->dev_state));
Since we go from 4 chars (info) to 3 chars (dbg), there is need to 
adjust
the two parameters here in the next two lines, right?

If that's needed and is done, you can add my tag for:

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

We can just push this patch as a standalone one not dependent on the 1/2
in this series.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
