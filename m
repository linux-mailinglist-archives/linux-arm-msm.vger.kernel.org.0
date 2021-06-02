Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E133397DF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 03:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhFBBPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 21:15:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15952 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229687AbhFBBPn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 21:15:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622596441; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hKglAPiVYbV31DHmy8vQ0bt8VvAv7z1gB5l3wmTEObE=;
 b=QeyIwh3PDbHXPreh6wm3ZEtPN2YSHrfwCkt7IQCDUPSGab9w9kreM6mJ2KMI5VZ/Prhnzfuv
 JUpDtfWLaUe33VSVHQrPgyggjntLliok41E+gehIJ5rGPZcpB4rU9P81XmfGPlZUyULOTYoL
 ePtYbenxHARfZgaevC3zvTDo77Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60b6db59265e7370f7b28628 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 01:14:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7DA0BC4338A; Wed,  2 Jun 2021 01:14:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9CC3C433D3;
        Wed,  2 Jun 2021 01:13:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Jun 2021 18:13:58 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Resume success on SYS_ERR
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1622449813-3850-1-git-send-email-loic.poulain@linaro.org>
References: <1622449813-3850-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <9affdb403a2b12fe81a1aa4cad0fe090@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-31 01:30 AM, Loic Poulain wrote:
> When a crash occurs while in suspended state M3/D3hot, the host
> only discovers SYS_ERR pm-state change on resume. Handle this
> state as valid transition for resume procedure, giving a chance
> to the MHI core to manage the state (sbl transition, etc...).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/pm.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 704a5e2..e8eae4f 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -898,8 +898,27 @@ int mhi_pm_resume(struct mhi_controller 
> *mhi_cntrl)
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>  		return -EIO;
> 
> -	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> +	if (mhi_get_mhi_state(mhi_cntrl) == MHI_STATE_SYS_ERR) {
> +		/* If we are in SYS_ERR state, let MHI stack manages the error
Nitpick: manage (instead of manages)
> +		 * and resume successfully.
> +		 */
> +		dev_warn(dev, "Entered error while suspended\n");
> +
> +		write_lock_irq(&mhi_cntrl->pm_lock);
> +		cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_DETECT);
> +		write_unlock_irq(&mhi_cntrl->pm_lock);
> +
> +		if (cur_state == MHI_PM_SYS_ERR_DETECT) {
> +			mhi_pm_sys_err_handler(mhi_cntrl);
> +			return 0;
> +		}
> +	}
> +
> +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
> +		dev_warn(dev, "Is not in M3 state, resume failed %d\n",
Maybe this log can be improved to say, "Resume failed. Current state: 
%d, expected M3.\n"
> +			 mhi_get_mhi_state(mhi_cntrl));
>  		return -EINVAL;
> +	}
> 
>  	/* Notify clients about exiting LPM */
>  	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {

We can add RDDM handling here as well since this hole exists in RDDM 
handling too.
This means we can include the below within if (cur_state == 
MHI_PM_SYS_ERR_DETECT):

if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
	mhi_cntrl->ee = ee;
	wake_up_all(&mhi_cntrl->state_event);
	return 0;
}

It can be added in a separate patch as well following this one if you're 
fine
with that. In its current state + nitpick addressed, you can add my:

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
