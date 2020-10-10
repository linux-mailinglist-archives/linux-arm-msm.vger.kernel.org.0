Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632F6289CB4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Oct 2020 02:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgJJAY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 20:24:56 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:61999 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728967AbgJJAX3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 20:23:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602289398; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+CGIEFrvuX1zH2nKlfxyFqE9L6A9wSai8/c4cFXOjrk=;
 b=FKncU/kTzU3Tll7ZzqH3YsUvflpqQIGPZbCVkCJcDt0/1jdpigXt0gheg2wJGJlGgwxlNJ72
 irwgVMUHd0P6aXOpC/izParwkW7KdRjfZLPcYsxjb/g/rY8LcjwZMCxyGgTHCNc42hg7Nr+4
 IRUE2zjvlYN+s7kwGfr45C/mXQo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f80fef4d6d00c7a9eb7706d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Oct 2020 00:23:16
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F235EC433FE; Sat, 10 Oct 2020 00:23:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 331DAC433CB;
        Sat, 10 Oct 2020 00:23:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Oct 2020 17:23:15 -0700
From:   bbhatt@codeaurora.org
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
In-Reply-To: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <a86c540450437bad818b0baab4e620bc@codeaurora.org>
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
Hi Loic,

There should not be any reason for drivers to do an "unprepare" and send 
a reset channel
command during remove, as the channel context gets cleaned up after the 
remove callback
returns.

We do not want to allow moving from MHI_CH_STATE_SUSPENDED to 
MHI_CH_STATE_DISABLED state
because if a remove is called, channel context being cleaned up implies 
a reset.

Also, I have a bunch of channel state machine related patches coming up 
soon which solve
this issue and more. We are also introducing some missing features with 
that.

It would be nice if you can review/comment on those as it overhauls the 
state machine.

Let me know what you think.

Thanks,
Bhaumik
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
