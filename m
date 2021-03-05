Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FEC32F121
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 18:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhCER1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 12:27:10 -0500
Received: from z11.mailgun.us ([104.130.96.11]:31475 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229906AbhCER07 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 12:26:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614965219; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=O2bynz/mx83VpaISsFN6eGoOY3/rAaHYcVcIGMqUnv0=;
 b=HW4czp69zzKqQx9b52JGH1XWWG3QwHmIblSW6fwLDMW3ld8p/XYCLdzfqP6GojqmLhD1gtXS
 lg5mslHa+gG5uDi4Gmbt1PUAS2MR8zC54CCNsnbSg24d6/yzV7+snFcmiTsD4Bt+eHBFDvXD
 kGMAah70LzZv8RrWl1uM607rfkE=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 604269e2f7ec0ea57c666e82 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 17:26:58
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6935C433CA; Fri,  5 Mar 2021 17:26:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 789B1C433C6;
        Fri,  5 Mar 2021 17:26:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Mar 2021 09:26:57 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Early MHI resume failure in non M3 state
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
References: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <59a13660c4177299e036baa9e1f219ea@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-05 08:14 AM, Loic Poulain wrote:
> MHI suspend/resume are symmetric and balanced procedures. If device is
> not in M3 state on a resume, that means something happened behind our
> back. In this case resume is aborded and error reported, to let the
s/aborded/aborted
> controller handling the situation.
> 
> This is mainly requested for system wide suspend-resume operation in
> PCI context which may lead to power-down/reset of the controller which
> will then lose its MHI context. In such cases, PCI driver is supposed
> to recover and reinitialize the device.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 0cd6445..725a0b2 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -916,6 +916,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>  		return -EIO;
> 
> +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> +		return -EINVAL;
> +
>  	/* Notify clients about exiting LPM */
>  	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
>  		mutex_lock(&itr->mutex);
We've had this check internally in the past but instead of reading the 
register,
we just used if (mhi_cntrl->pm_state != MHI_PM_M3) to panic.

I like this version better. No reason why we shouldn't attempt to access 
the
link due to read_reg being defined in the controller.

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
