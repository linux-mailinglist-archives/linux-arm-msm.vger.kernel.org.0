Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59522730A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 19:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgIURHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 13:07:11 -0400
Received: from z5.mailgun.us ([104.130.96.5]:28003 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728553AbgIURHL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 13:07:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600708030; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YNUrwGQP5v2+ExnkMy9kjA5Wqilb3g1U+GsJxi06Mns=;
 b=sZpJeMXeP79aQYDAmQbGzc0sur6Ly4hr0Ce42dd83P7ZshQ0BRgawUE05ECReobxI/kqR/wx
 xHn18Qxd/DRePTm5n+YwgBRuT+TQzUgpAYXQoiRZDtVRINYWdPgf0iznHbymBvzVnyWVx+QG
 BoZ2LaOF4NcpIHM8tDDcBMV7LU4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f68dda46b1937bb65d3854a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Sep 2020 17:06:44
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A083BC433C8; Mon, 21 Sep 2020 17:06:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EDDDFC433FE;
        Mon, 21 Sep 2020 17:06:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Sep 2020 10:06:43 -0700
From:   bbhatt@codeaurora.org
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        clew@codeaurora.org
Subject: Re: [PATCH v2 1/2] bus: mhi: core: Allow shared IRQ for event rings
In-Reply-To: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
References: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <12883193b4f2f8404b6291f1e6370269@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-21 00:36, Loic Poulain wrote:
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
>  v2: keep nr_irqs check early in init sequence
> 
>  drivers/bus/mhi/core/init.c | 7 +++++++
>  drivers/bus/mhi/core/pm.c   | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 19ade8a..31961af 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -125,6 +125,13 @@ int mhi_init_irq_setup(struct mhi_controller 
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
> index ce4d969..3de7b16 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -918,7 +918,7 @@ int mhi_async_power_up(struct mhi_controller 
> *mhi_cntrl)
> 
>  	dev_info(dev, "Requested to power ON\n");
> 
> -	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
> +	if (mhi_cntrl->nr_irqs < 1)
>  		return -EINVAL;
> 
>  	/* Supply default wake routines if not provided by controller driver 
> */
It would be better if we can remove this check altogether from the 
mhi_async_power_up()
function and instead place it as one of the checks in 
mhi_register_controller() in init.c.

That way, we don't have to wait until power up attempt to determine 
whether the provided
controller configuration is acceptable and can bail out early from the
mhi_register_controller() function itself.

if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
     !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
-    !mhi_cntrl->write_reg)
+    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)

Thanks,
Bhaumik
