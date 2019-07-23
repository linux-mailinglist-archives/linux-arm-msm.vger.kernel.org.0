Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 205DD71480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 11:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387675AbfGWJAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 05:00:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48808 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727748AbfGWJAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 05:00:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0209561157; Tue, 23 Jul 2019 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563872454;
        bh=EVKnOWzRkie6voTuz/y+NN9iApwRNseO39HZ9ZaKztA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iu7/PaC6J/cQuDrieBBS2cua4nRXyV5klWe1RXJRLji2Um8rYBpk99MlHvC49XUDQ
         7jPng3hAcfOQGDaaMrqDg6t6ML1ZmjKjofeMYdQxyWLtDJmwtHYbehUCdgPKsubiPx
         pfnFWlk21nrSCFTP8mRgsZ+MfA7OIl05MKdMJ98g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 49C1A60850;
        Tue, 23 Jul 2019 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563872453;
        bh=EVKnOWzRkie6voTuz/y+NN9iApwRNseO39HZ9ZaKztA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f7h8K/NXZds7GQUIs+jKmAA2h8iL4yr4lRdC+V4qjGHGWXw0VvECrsvNDsWId3+G6
         ulKshuZncQcWC87abYZ9AzrF7r6uHyTrCP5E+ZkCM1FuAGtXOU6+Mzfl/KIwAP9ajN
         yNFTL6WfS/lGUdL/GuGirdsDVtO2TV9geClo2koE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 23 Jul 2019 14:30:53 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom: Move glink_ssr notification after stop
In-Reply-To: <20190716050327.8866-1-bjorn.andersson@linaro.org>
References: <20190716050327.8866-1-bjorn.andersson@linaro.org>
Message-ID: <6259ebabc6183efb0045f9f990747d5e@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Tested-by: Sibi Sankar <sibis@codeaurora.org>

On 2019-07-16 10:33, Bjorn Andersson wrote:
> glink_ssr is used to signal a remote processor "A" about the stopping 
> of
> another remote processor "B", so that in the event that remote 
> processor
> B is ever booted again the fifos of the glink channel between A and B 
> is
> in a known state.
> 
> But if remote processor A receives this notification before B is
> actually stopped the newly reset fifo indices will be interpreted as
> there being "data" on the channel and either side of the channel will
> enter a fatal error handler.
> 
> Move the glink_ssr notification to the "unprepare" state of the
> rproc_subdev to avoid this issue.
> 
> This has the side effect of us not notifying the dying remote processor
> itself about its fate, which has been seen to block in certain resource
> constraint scenarios.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c 
> b/drivers/remoteproc/qcom_common.c
> index 6a448429f223..60650bcc8c67 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -200,7 +200,7 @@ void qcom_unregister_ssr_notifier(struct 
> notifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
> 
> -static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
> +static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> 
> @@ -220,7 +220,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc,
> struct qcom_rproc_ssr *ssr,
>  			 const char *ssr_name)
>  {
>  	ssr->name = ssr_name;
> -	ssr->subdev.stop = ssr_notify_stop;
> +	ssr->subdev.unprepare = ssr_notify_unprepare;
> 
>  	rproc_add_subdev(rproc, &ssr->subdev);
>  }

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
