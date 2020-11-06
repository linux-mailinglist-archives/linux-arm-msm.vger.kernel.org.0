Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5822A9E37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 20:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgKFTlp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 14:41:45 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:31914 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbgKFTlp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 14:41:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604691704; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZMYgPyvbguxZpSaZECnSIqvfGASG5f6osdSwFVa/NOw=;
 b=qZRd5aPga+nFP6whFdsqJJJNYNugcPtUfVeiGIj1t9I3t7ZH+a5cjqxregHAPLVVQksHW2dD
 LE+GFnXy+uZ0LrzTWw3MiKHeP705VOZYLGKPckjh4ohGR2w1OF6bWadaq1Ipv7o+XI107peO
 AYU5a2vTwo+1GCmdUhbgN/Xy7GE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fa5a6de18b2aa4b1f04b303 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 19:41:18
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5776DC433C8; Fri,  6 Nov 2020 19:41:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6309C433C6;
        Fri,  6 Nov 2020 19:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 06 Nov 2020 11:41:16 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <4a9fec5ce7e0c8ca72041252344b5347@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 02:07, Loic Poulain wrote:
> Some MHI device drivers need to stop the channels in their driver
> remove callback (e.g. module unloading), but the unprepare function
> is aborted because MHI core moved the channels to suspended state
> prior calling driver remove callback. This prevents the driver to
> send a proper MHI RESET CHAN command to the device. Device is then
> unaware of the stopped state of these channels.
> 
> This causes issue when driver tries to start the channels again (e.g.
> module is reloaded), since device considers channels as already
> started (inconsistent state).
> 
> Fix this by allowing channel reset when channel is suspended.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index d20967a..a588eac 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1232,7 +1232,8 @@ static void __mhi_unprepare_channel(struct
> mhi_controller *mhi_cntrl,
>  	/* no more processing events for this channel */
>  	mutex_lock(&mhi_chan->mutex);
>  	write_lock_irq(&mhi_chan->lock);
> -	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> +	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> +	    mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
>  		write_unlock_irq(&mhi_chan->lock);
>  		mutex_unlock(&mhi_chan->mutex);
>  		return;

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
