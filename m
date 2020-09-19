Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4107270A1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgISCnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:43:45 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:18688 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgISCnp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:43:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600483424; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ba7dBm2ndlgmqK79zONY4EgonhQis4QJFa/xLQhocuM=;
 b=rWACYpE+OiuJ1a0mL4GEpM01WlikgwWZdO9ZpiycJ4rDFVTkWQrQVJdNM2X4b6qdrHxZKCA+
 H0HofJO/c7W1YmbTor+ELUzvXnFYZx8E4W6ScUpdOP2dVR8v+E8GZXicAg3Oy8QRlpuR1ivr
 FskADFDW/pfLD9sqKq23c/FCRU8=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f6570450049ea5816161297 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:43:17
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A2D3C433CB; Sat, 19 Sep 2020 02:43:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A00BC433C8;
        Sat, 19 Sep 2020 02:43:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 19:43:16 -0700
From:   bbhatt@codeaurora.org
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Allow shared IRQ for event rings
In-Reply-To: <1600414128-5510-1-git-send-email-loic.poulain@linaro.org>
References: <1600414128-5510-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <c7d5abb9ecb9d9558c154dddb53385b1@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-18 00:28, Loic Poulain wrote:
> There is no requirement for using a dedicated IRQ per event ring.
> Some systems does not support multiple MSI vectors (e.g. intel
> without CONFIG_IRQ_REMAP), In that case the MHI controller can
> configure all the event rings to use the same interrupt (as fallback).
> 
> Allow this by removing the nr_irqs = ev_ring test and add extra check
> in the irq_setup function.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 10 ++++++++++
>  drivers/bus/mhi/core/pm.c   |  3 ---
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index d232938..ac19067 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -113,6 +113,9 @@ int mhi_init_irq_setup(struct mhi_controller 
> *mhi_cntrl)
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	int i, ret;
> 
> +	if (mhi_cntrl->nr_irqs < 1)
> +		return -EINVAL;
> +

It would be better to move this check earlier in 
mhi_register_controller() because if
the resource is not available, we do not have to proceed to even allow 
power up.

>  	/* Setup BHI_INTVEC IRQ */
>  	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>  				   mhi_intvec_threaded_handler,
> @@ -125,6 +128,13 @@ int mhi_init_irq_setup(struct mhi_controller 
> *mhi_cntrl)
>  		if (mhi_event->offload_ev)
>  			continue;
> 
> +		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> +			dev_err(dev, "irq %d not available for event ring\n",
> +				mhi_event->irq);
> +			ret = -EINVAL;
> +			goto error_request;
> +		}
> +
>  		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>  				  mhi_irq_handler,
>  				  IRQF_SHARED | IRQF_NO_SUSPEND,
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index ce4d969..07efdbc 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -918,9 +918,6 @@ int mhi_async_power_up(struct mhi_controller 
> *mhi_cntrl)
> 
>  	dev_info(dev, "Requested to power ON\n");
> 
> -	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
> -		return -EINVAL;
> -
>  	/* Supply default wake routines if not provided by controller driver 
> */
>  	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
>  	    !mhi_cntrl->wake_toggle) {

Maybe another clean-up patch is also good to remove usage of 
"mhi_cntrl->nr_irqs_req"
as it is deemed optional anyway and is unused in the driver.

Thanks,
Bhaumik

'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project'
