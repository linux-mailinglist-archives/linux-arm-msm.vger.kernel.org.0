Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDA5274717
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 19:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVRA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 13:00:26 -0400
Received: from z5.mailgun.us ([104.130.96.5]:49807 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgIVRA0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 13:00:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600794025; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Im3F+W8MIOfmRt75vkZIASWX2D/KCtpMsDrEarObrkg=;
 b=VeXaVgNqMSIGxjLKY8oExer8K21C9rJV4V1G4aPSMgHY0ZK8oxVz17bQyKMktxwuH8WCALek
 z/kpYi7X4zTR+evk49PxgUfO610/eRQ/TRYoAm89PejFinP66nqu5Iu5bmHedKy0IOe609Uf
 dpH2mM7s/aB4EttH9XxDwAQX0aQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f6a2d9f3e7bfb5c37f04e3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 17:00:15
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BED7FC433F1; Tue, 22 Sep 2020 17:00:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53849C433C8;
        Tue, 22 Sep 2020 17:00:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Sep 2020 10:00:14 -0700
From:   bbhatt@codeaurora.org
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Move irq check in controller registration
In-Reply-To: <1600762066-25849-1-git-send-email-loic.poulain@linaro.org>
References: <1600762066-25849-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <c052dbd8dcc2bd625b300b6c21638e3b@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-22 01:07, Loic Poulain wrote:
> Move irq number check early in mhi_register_controller along
> with other mandatory parameters checking.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  drivers/bus/mhi/core/pm.c   | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index ca08437..34f9ae3 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -871,7 +871,7 @@ int mhi_register_controller(struct mhi_controller
> *mhi_cntrl,
> 
>  	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>  	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> -	    !mhi_cntrl->write_reg)
> +	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
>  		return -EINVAL;
> 
>  	ret = parse_config(mhi_cntrl, config);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 3de7b16..07efdbc 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -918,9 +918,6 @@ int mhi_async_power_up(struct mhi_controller 
> *mhi_cntrl)
> 
>  	dev_info(dev, "Requested to power ON\n");
> 
> -	if (mhi_cntrl->nr_irqs < 1)
> -		return -EINVAL;
> -
>  	/* Supply default wake routines if not provided by controller driver 
> */
>  	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
>  	    !mhi_cntrl->wake_toggle) {
Hi Loic,

Can you please add a Suggested-by: Bhaumik Bhatt <bbhatt@codeaurora.org> 
tag with my name?

Also, I made this patch myself too but you can submit it. It'd be nice 
to add some more
details in the commit text.

Mine goes like this:

bus: mhi: core: Check for IRQ availability during registration

     Current design allows a controller to register with MHI successfully
     without the need to have any IRQs available for use. If no IRQs are
     available, power up requests to MHI can fail after a successful
     registration with MHI. Improve the design by checking for the number
     of IRQs available sooner within the mhi_regsiter_controller() API as
     it is required to be specified by the controller.

Thanks,
Bhaumik
