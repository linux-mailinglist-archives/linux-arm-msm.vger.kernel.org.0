Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A39228F8ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 20:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391102AbgJOSxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 14:53:24 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:54219 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391038AbgJOSxX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 14:53:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602788001; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fvHp4z7owpVk5E/vuVeJKfC4TopUUpjdQdrAketqdOg=;
 b=caRjBqJIRsnYzW5evJijOzUlZ9DtbFaXs6x1LJZtm9WQPpZiIoqGOJzWALSuU0ICmCQSmcV7
 s6r2pwH6Y1VPw5GCSjlAYXjv8QRSaHyqRROFzx0OHlZQjfRu/WthEuq/aTrn+HwSNNz5TrUR
 DFXsKCt1x4pEHDV0P5Tfg5kERDc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f888c8fad37af35ec315e44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Oct 2020 17:53:19
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61ECAC55682; Thu, 15 Oct 2020 17:47:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A933C57D5E;
        Thu, 15 Oct 2020 17:47:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Oct 2020 10:47:27 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi9891HAFoiUUQPhsM2FHyoR=bLCPaodJLxjyb05i6sSRA@mail.gmail.com>
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
 <a86c540450437bad818b0baab4e620bc@codeaurora.org>
 <CAMZdPi9891HAFoiUUQPhsM2FHyoR=bLCPaodJLxjyb05i6sSRA@mail.gmail.com>
Message-ID: <fe76e2fe8f7b7d3201c3e2b6b8018f88@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 23:06, Loic Poulain wrote:
> HI Bhaumik,
> 
> On Sat, 10 Oct 2020 at 02:23, <bbhatt@codeaurora.org> wrote:
>> 
>> On 2020-10-09 02:07, Loic Poulain wrote:
>> > Some MHI device drivers need to stop the channels in their driver
>> > remove callback (e.g. module unloading), but the unprepare function
>> > is aborted because MHI core moved the channels to suspended state
>> > prior calling driver remove callback. This prevents the driver to
>> > send a proper MHI RESET CHAN command to the device. Device is then
>> > unaware of the stopped state of these channels.
>> >
>> > This causes issue when driver tries to start the channels again (e.g.
>> > module is reloaded), since device considers channels as already
>> > started (inconsistent state).
>> >
>> > Fix this by allowing channel reset when channel is suspended.
>> >
>> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > ---
>> >  drivers/bus/mhi/core/main.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> > index d20967a..a588eac 100644
>> > --- a/drivers/bus/mhi/core/main.c
>> > +++ b/drivers/bus/mhi/core/main.c
>> > @@ -1232,7 +1232,8 @@ static void __mhi_unprepare_channel(struct
>> > mhi_controller *mhi_cntrl,
>> >       /* no more processing events for this channel */
>> >       mutex_lock(&mhi_chan->mutex);
>> >       write_lock_irq(&mhi_chan->lock);
>> > -     if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
>> > +     if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
>> > +         mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
>> >               write_unlock_irq(&mhi_chan->lock);
>> >               mutex_unlock(&mhi_chan->mutex);
>> >               return;
>> Hi Loic,
>> 
>> There should not be any reason for drivers to do an "unprepare" and 
>> send
>> a reset channel
>> command during remove, as the channel context gets cleaned up after 
>> the
>> remove callback
>> returns.
> 
> Well, a good practice is to have a balanced interface, and everything 
> we do in
> probe() should be undoable in remove(). Here we start the channel in 
> probe()
> and explicitly stop them in remove(), So I think doing unprepare in
> remove should
> work anyway, even if the MHI stack does some cleanup on its own.
> 
I agree. You are allowed to call "unprepare" but MHI core driver decides 
what to
do with it. I can explain below why we do nothing if the channel is 
suspended.
>> 
>> 
>> We do not want to allow moving from MHI_CH_STATE_SUSPENDED to
>> MHI_CH_STATE_DISABLED state
>> because if a remove is called, channel context being cleaned up 
>> implies
>> a reset.
> 
> AFAIK today, no reset command is sent on remove.
> 
Yes. That's correct and it can be a problem for modules like yours 
because the
device never gets notified so it remains unable to clean up its local 
info
whereas host has moved on already.

Your change must go in to ensure that this clean up happens on device 
but there
need to be additional changes to make sure that we do not end up sending 
any
command if unnecessary.

These are the ways we could have a .remove call:
1. An explicit module unload such as yours
2. After a device crash or SYS_ERROR
3. After a host crash or host initiated shutdown where an explicit MHI 
RESET is
sent due to the host processor powering off MHI.

In cases #2 and #3, we cannot send individual channel reset commands 
because
MHI on device is already in a RESET state.
In #2, device will be dead, so we don't expect to receive any command 
responses.
In #3, the master switch MHI RESET command lets the device know not to 
attempt
any DDR accesses so no channel traffic will be there.

Both these cases allow us to clean up the channel context for individual
channels such as yours without the need to send an individual channel 
reset.

But in case #1, with your patch in place, if we allow channel reset to 
be sent,
we will also send this command and wait for a response in cases #2 and 
#3.
Hence, we need knowledge of MHI_PM_IN_ERROR_STATE() present in the 
"unprepare"
function or any check that allows us to skip sending a command. My 
upcoming set
of patches adds that along with other features.

If required, I can push these checks as a separate change to unblock 
this.
>> 
>> Also, I have a bunch of channel state machine related patches coming 
>> up
>> soon which solve
>> this issue and more. We are also introducing some missing features 
>> with
>> that.
>> 
>> It would be nice if you can review/comment on those as it overhauls 
>> the
>> state machine.
> 
> Sure, feel free to submit.
> 
> Regards,
> Loic

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
