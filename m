Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5F92AEDA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 10:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgKKJ13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 04:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgKKJ12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 04:27:28 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EF0C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 01:27:28 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id v4so1580144edi.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 01:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hto8516HAJLzFc1AEPbd08Jp3k7UFBmINebfBvvB8M0=;
        b=pMiryk4sK1KUjZSBUMqz/g3gf2OJTek3O/E7Dv76J6n2bPpbAA1UMakfMGtkZowtOT
         1YRYSZlZXAQEQpI+HIm4HcQfwwdUliUP0hTaUrQxWJNmaVvQ3fuhBI8R6vDnC+cQcus0
         BxEKp2ur2o26qtAGL6jyQC9DjxWht1Zv+3JyatFry3GEE53t+N4NfV37exEMaW7eMqVX
         k6BbEjtkdiYPxGWEO/5aCCuqqX/ZgzmGNXWRxYoia0xyls2251v5m8WaS9nCTuOUzvW5
         V4Pu/v+Q4LcBUt2u/fSxvez+qyX18beme9uNOVo1huIBdcT4XV/ka8v+JR67Opt0IKr6
         /cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hto8516HAJLzFc1AEPbd08Jp3k7UFBmINebfBvvB8M0=;
        b=M0/kNe2VR5dCd1dIGSzfXC0s9LRULXuhAGWeW9HHF3h+ITHmKb64B9WAVrJE0beBeT
         7cdKoTzk0NtoU3C62SvpZiixcNpTbBO+GlSbT9baA6brlvhSI2iEN/bs++LLNSgdfHEK
         1i4DfUkzO4MFPSVHg7g9+BnXfCdnpZVZ1iXDTyOJeKgU07PWkIuyR1Mk8PQJk5xPBTLI
         76oWIOy2rxFPeSxrNDxGQ3m13fJrM5jUueH3lzdbHda/zsYlqfN7wSBSAg172cDfI354
         kNwxbTCANZnhfLf2jYE6BiZYvM9CISzNIX13u8IIK2ZUayvmhDEyss4+EP6rjHzyiRHr
         9Onw==
X-Gm-Message-State: AOAM532O7RsafDaZWFWOYj9dNkADbkV69Mk+Fn3Nkq6H0SYImuxCFzKF
        wF5ycu8GPSwWnFAOhgsPcBEa+TfmmUWPS2xIJ2ZxY22pNwROzA==
X-Google-Smtp-Source: ABdhPJyDZqMw0/uivuYHvlxYf5nXeobTb69zfbsl9GiONy9tDSPCtzM37wWP7321vlpfFB5xt8Utt/ALeYp8YKQplCs=
X-Received: by 2002:a05:6402:88d:: with SMTP id e13mr26629041edy.366.1605086846758;
 Wed, 11 Nov 2020 01:27:26 -0800 (PST)
MIME-Version: 1.0
References: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org>
 <1604961850-27671-4-git-send-email-bbhatt@codeaurora.org> <CAMZdPi_dwT+hj26sxJdMS1v-X-MNd1ys34QD=Bf_O+dvmjOD2Q@mail.gmail.com>
 <3710a3051c480bf9d125362303815831@codeaurora.org>
In-Reply-To: <3710a3051c480bf9d125362303815831@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 11 Nov 2020 10:33:16 +0100
Message-ID: <CAMZdPi_b7U1iW79mWq7ikxE4jTr+n+-8Y+EZz8i1xro-UcJhjA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] bus: mhi: core: Add support to pause or resume
 channel data transfers
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Wed, 11 Nov 2020 at 01:40, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 2020-11-10 03:14, Loic Poulain wrote:
> > Hi Bhaumik,
> >
> > On Mon, 9 Nov 2020 at 23:44, Bhaumik Bhatt <bbhatt@codeaurora.org>
> > wrote:
> >>
> >> Some MHI clients may want to request for pausing or resuming of the
> >> data transfers for their channels. Enable them to do so using the new
> >> APIs provided for the same.
> >>
> >> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> >> ---
> >>  drivers/bus/mhi/core/main.c | 41
> >> +++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/mhi.h         | 16 ++++++++++++++++
> >>  2 files changed, 57 insertions(+)
> >>
> >> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> >> index 1226933..01845c6 100644
> >> --- a/drivers/bus/mhi/core/main.c
> >> +++ b/drivers/bus/mhi/core/main.c
> >> @@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct
> >> mhi_device *mhi_dev)
> >>  }
> >>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> >>
> >> +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
> >> +                                    enum mhi_ch_state_type to_state)
> >> +{
> >> +       struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> >> +       struct mhi_chan *mhi_chan;
> >> +       int dir, ret;
> >> +
> >> +       for (dir = 0; dir < 2; dir++) {
> >> +               mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> >> +
> >> +               if (!mhi_chan)
> >> +                       continue;
> >> +
> >> +               /*
> >> +                * Bail out if one of the channels fail as client will
> >> reset
> >> +                * both upon failure
> >> +                */
> >> +               mutex_lock(&mhi_chan->mutex);
> >> +               ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
> >> to_state);
> >> +               if (ret) {
> >> +                       mutex_unlock(&mhi_chan->mutex);
> >> +                       return ret;
> >> +               }
> >> +               mutex_unlock(&mhi_chan->mutex);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +int mhi_pause_transfer(struct mhi_device *mhi_dev)
> >> +{
> >> +       return mhi_update_transfer_state(mhi_dev,
> >> MHI_CH_STATE_TYPE_STOP);
> >> +}
> >> +EXPORT_SYMBOL_GPL(mhi_pause_transfer);
> >> +
> >> +int mhi_resume_transfer(struct mhi_device *mhi_dev)
> >> +{
> >> +       return mhi_update_transfer_state(mhi_dev,
> >> MHI_CH_STATE_TYPE_START);
> >> +}
> >> +EXPORT_SYMBOL_GPL(mhi_resume_transfer);
> >
> > Look like it is stop and start, not pause and resume?
> I wanted to keep it pause and resume because it could get confusing for
> someone
> looking at this pair of APIs, that a client driver would also need to
> "start"
> channels after "preparing" them. Since that is not that case, and the
> mhi_prepare_for_transfer() API itself is supposed to also start the
> channels, it

Yes, because prepare_for_transfer is actually init_and_start. I'm not
in favor of hiding what is really done at mhi_core level, start is
start and stop is stop, if it's correctly documented that should not
be confusing. just saying (stop moves channels in stop state, start in
enabled state), but other opinions are welcome.

> would be better to keep these as "pause" and "resume" instead IMO.
>
> Any comments in favor or "stop" and "start"?
> >
> > TBH maybe we should rework/clarify MHI core and having well-defined
> > states, maybe something like that:
> >
> > 1. When MHI core detects device for a driver, MHI core resets and
> > initializes the channel(s), then call client driver probe function
> >     => channel UNKNOWN->DISABLED state
> >     => channel DISABLED->ENABLED state
> > 2. When driver is ready for sending data, drivers calls
> > mhi_start_transfer
> >     => Channel is ENABLED->RUNNING state
> > 3. Driver performs normal data transfers
> > 4. The driver can suspend/resume transfer, it stops (suspend) the
> > channel, can
> >     => Channel is RUNNING->STOP
> >     => Channel is STOP->RUNNING
> >    ...
> > 5. When device is removed, MHI core reset the channel
> >     => channel is (RUNNING|STOP) -> DISABLED
> >
> > Today mhi_prepare_for_transfer performs both ENABLE and RUNNING
> > transition, the idea would be to keep channel enabling/disabling in
> > the MHI core (before/after driver probe/remove) and channel start/stop
> > managed by the client driver.
> >
> > Regards,
> > Loic
>
> Your idea is good but it would not have much additional benefits and
> would
> involve MHI core "enabling" channels and allocating memory for each
> channel
> context when they are only declared as supported by the controller but
> are not
> actually being put to use.

Ok, your point is valid.

>
> mhi_prepare_for_transfer() does both channel context initialization and
> starts
> the channels, which is good because it allocates memory when needed. So,
> this
> benefits system memory if a controller with support for many channels
> exists but
> only a few channels are used.
>
> Regarding the states to track from host:
> -> DISABLED (We know channels are not active: in reset state or not
> probed yet)
> -> ENABLED (Active and running when needed for data transfers)
> -> STOP (Paused: leaves the channel context as is since channels are not
> reset)
> -> SUSPENDED (Unload in progress: Entered before resetting
> channels/remove())
>
> BTW, we have the debugfs entry for "channels" that dumps the context to
> show
> exactly what the channel states are from device perspective. We can rely
> on it
> if needed.
>
> If there are some comments I can add to make things clear, please let me
> know.
>
> Thanks,
> Bhaumik
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
> a Linux Foundation Collaborative Project
