Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A97289EA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Oct 2020 08:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgJJGBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 02:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgJJGBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 02:01:08 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8470CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 23:01:06 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l16so11607455eds.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 23:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vzbcL0U0zXi5F4a9LhURlhH/mzBYLXZABTSRLs0+29o=;
        b=Lvm9wFIBwlFnNpp9/cRPd7Z90GeH4CDLQ19OoTm2RlFx99DHpESaK+USShcyiVop+A
         OHR9zzY5HbseDmzjneskYV8uwxnBea2FuEJ9wa20kIBmXtNrs8VWX8N7c/xCwbIEskwA
         WCmLwosMANSE0lYeXYeL7L8++EkyBkosRV+M9KBX9kShO26LugDEKldE9kL3TlJcD5vs
         ECd+8ggn0j1cxmAgIDRbn16kaJb5wfug6H6Qb2fGF6d7PAAbe9vLuXamEdNie7KoNc7g
         xSIwlzS9iV5OqwHXChWy8NcvnwYT6ojHjVveJheeNFP0k5k2diHhlRMP1uOZMQ2/C7tV
         Symw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vzbcL0U0zXi5F4a9LhURlhH/mzBYLXZABTSRLs0+29o=;
        b=Zxkiu8si0frhfRc6lbHD/SeEaFm5f/M5zgMFE2AHvB6RHF1P8PQS8Hxr7KPRmKjJkL
         aePBSs+3bQOVR3A8vVEtqf8/SER9AQspzZwhyJKn0AinPpWqMwa6gNYHqixavh4cWGQl
         1Fi6n/KRV7Gys0alhvAyZ85CDJyw+iBqcVDZi1zzBJOKqafBGqMGLnno68QRuW/zlec+
         c+b1QPHaq4r8Ku/MJg4SD6otKEHhs7CR2jqttUrW9js+1cEhTftqjkJugUOOB3RM95kf
         62l7q7Z25XItZQRNc88aM38QK0xwkcUqfuBCIpS3mf5b7B84PZG8Sxpkg9kPKAfZazux
         JbdQ==
X-Gm-Message-State: AOAM530yJGBEz7lb3M424CnCOCAKNWcL8NEv4+SZQbyZiwrPJsU9L0a4
        mWLP7fRMC7jX9FxYmW72qsEa65rekNylkUGINf8vQg==
X-Google-Smtp-Source: ABdhPJxnDQvISHZznV2w9rexdzLfi7p63H4AGiQYQ80tu+GXg4iTw/uy+i5OcuHGp8VlXxyoQzCHsdwl/zVfTASftK4=
X-Received: by 2002:aa7:c447:: with SMTP id n7mr2933099edr.134.1602309664913;
 Fri, 09 Oct 2020 23:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org> <a86c540450437bad818b0baab4e620bc@codeaurora.org>
In-Reply-To: <a86c540450437bad818b0baab4e620bc@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Sat, 10 Oct 2020 08:06:39 +0200
Message-ID: <CAMZdPi9891HAFoiUUQPhsM2FHyoR=bLCPaodJLxjyb05i6sSRA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
To:     bbhatt@codeaurora.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI Bhaumik,

On Sat, 10 Oct 2020 at 02:23, <bbhatt@codeaurora.org> wrote:
>
> On 2020-10-09 02:07, Loic Poulain wrote:
> > Some MHI device drivers need to stop the channels in their driver
> > remove callback (e.g. module unloading), but the unprepare function
> > is aborted because MHI core moved the channels to suspended state
> > prior calling driver remove callback. This prevents the driver to
> > send a proper MHI RESET CHAN command to the device. Device is then
> > unaware of the stopped state of these channels.
> >
> > This causes issue when driver tries to start the channels again (e.g.
> > module is reloaded), since device considers channels as already
> > started (inconsistent state).
> >
> > Fix this by allowing channel reset when channel is suspended.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/core/main.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > index d20967a..a588eac 100644
> > --- a/drivers/bus/mhi/core/main.c
> > +++ b/drivers/bus/mhi/core/main.c
> > @@ -1232,7 +1232,8 @@ static void __mhi_unprepare_channel(struct
> > mhi_controller *mhi_cntrl,
> >       /* no more processing events for this channel */
> >       mutex_lock(&mhi_chan->mutex);
> >       write_lock_irq(&mhi_chan->lock);
> > -     if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> > +     if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED &&
> > +         mhi_chan->ch_state != MHI_CH_STATE_SUSPENDED) {
> >               write_unlock_irq(&mhi_chan->lock);
> >               mutex_unlock(&mhi_chan->mutex);
> >               return;
> Hi Loic,
>
> There should not be any reason for drivers to do an "unprepare" and send
> a reset channel
> command during remove, as the channel context gets cleaned up after the
> remove callback
> returns.

Well, a good practice is to have a balanced interface, and everything we do in
probe() should be undoable in remove(). Here we start the channel in probe()
and explicitly stop them in remove(), So I think doing unprepare in
remove should
work anyway, even if the MHI stack does some cleanup on its own.

>
>
> We do not want to allow moving from MHI_CH_STATE_SUSPENDED to
> MHI_CH_STATE_DISABLED state
> because if a remove is called, channel context being cleaned up implies
> a reset.

AFAIK today, no reset command is sent on remove.

>
> Also, I have a bunch of channel state machine related patches coming up
> soon which solve
> this issue and more. We are also introducing some missing features with
> that.
>
> It would be nice if you can review/comment on those as it overhauls the
> state machine.

Sure, feel free to submit.

Regards,
Loic
