Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFFA2AF7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 19:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgKKSdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 13:33:36 -0500
Received: from z5.mailgun.us ([104.130.96.5]:30880 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgKKSdf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 13:33:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605119615; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FZoIibOKFJw2kMoMCDohAamStrjGwv81eB0/LyPnW2U=;
 b=ttcHKV7OapkpTv4f7FK43AQHqny3eTDqRnCeQcR9bgmkSSLrmgxbpHLjBGhe7kMxPSIl4n41
 0jN+QKTO53SMLygKQSzP1MLKL3zK2icZkZu/bnzRUGvqVjubSGjIePFPZT8svhXUv7U/lnKY
 lo5yD8SdzD286qu6VrQB2pgx940=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fac295dcecc309dcb23d80b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 18:11:39
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 87868C433C8; Wed, 11 Nov 2020 18:11:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79F98C433C6;
        Wed, 11 Nov 2020 18:11:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Nov 2020 10:11:37 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] bus: mhi: core: Add support to pause or resume
 channel data transfers
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi_b7U1iW79mWq7ikxE4jTr+n+-8Y+EZz8i1xro-UcJhjA@mail.gmail.com>
References: <1604961850-27671-1-git-send-email-bbhatt@codeaurora.org>
 <1604961850-27671-4-git-send-email-bbhatt@codeaurora.org>
 <CAMZdPi_dwT+hj26sxJdMS1v-X-MNd1ys34QD=Bf_O+dvmjOD2Q@mail.gmail.com>
 <3710a3051c480bf9d125362303815831@codeaurora.org>
 <CAMZdPi_b7U1iW79mWq7ikxE4jTr+n+-8Y+EZz8i1xro-UcJhjA@mail.gmail.com>
Message-ID: <c56fa0e7dcbe43d65bbe93cf287372a3@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 2020-11-11 01:33, Loic Poulain wrote:
> Hi Bhaumik,
> 
> On Wed, 11 Nov 2020 at 01:40, Bhaumik Bhatt <bbhatt@codeaurora.org> 
> wrote:
>> 
>> Hi Loic,
>> 
>> On 2020-11-10 03:14, Loic Poulain wrote:
>> > Hi Bhaumik,
>> >
>> > On Mon, 9 Nov 2020 at 23:44, Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > wrote:
>> >>
>> >> Some MHI clients may want to request for pausing or resuming of the
>> >> data transfers for their channels. Enable them to do so using the new
>> >> APIs provided for the same.
>> >>
>> >> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> >> ---
>> >>  drivers/bus/mhi/core/main.c | 41
>> >> +++++++++++++++++++++++++++++++++++++++++
>> >>  include/linux/mhi.h         | 16 ++++++++++++++++
>> >>  2 files changed, 57 insertions(+)
>> >>
>> >> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> >> index 1226933..01845c6 100644
>> >> --- a/drivers/bus/mhi/core/main.c
>> >> +++ b/drivers/bus/mhi/core/main.c
>> >> @@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct
>> >> mhi_device *mhi_dev)
>> >>  }
>> >>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
>> >>
>> >> +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
>> >> +                                    enum mhi_ch_state_type to_state)
>> >> +{
>> >> +       struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> >> +       struct mhi_chan *mhi_chan;
>> >> +       int dir, ret;
>> >> +
>> >> +       for (dir = 0; dir < 2; dir++) {
>> >> +               mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
>> >> +
>> >> +               if (!mhi_chan)
>> >> +                       continue;
>> >> +
>> >> +               /*
>> >> +                * Bail out if one of the channels fail as client will
>> >> reset
>> >> +                * both upon failure
>> >> +                */
>> >> +               mutex_lock(&mhi_chan->mutex);
>> >> +               ret = mhi_update_channel_state(mhi_cntrl, mhi_chan,
>> >> to_state);
>> >> +               if (ret) {
>> >> +                       mutex_unlock(&mhi_chan->mutex);
>> >> +                       return ret;
>> >> +               }
>> >> +               mutex_unlock(&mhi_chan->mutex);
>> >> +       }
>> >> +
>> >> +       return 0;
>> >> +}
>> >> +
>> >> +int mhi_pause_transfer(struct mhi_device *mhi_dev)
>> >> +{
>> >> +       return mhi_update_transfer_state(mhi_dev,
>> >> MHI_CH_STATE_TYPE_STOP);
>> >> +}
>> >> +EXPORT_SYMBOL_GPL(mhi_pause_transfer);
>> >> +
>> >> +int mhi_resume_transfer(struct mhi_device *mhi_dev)
>> >> +{
>> >> +       return mhi_update_transfer_state(mhi_dev,
>> >> MHI_CH_STATE_TYPE_START);
>> >> +}
>> >> +EXPORT_SYMBOL_GPL(mhi_resume_transfer);
>> >
>> > Look like it is stop and start, not pause and resume?
>> I wanted to keep it pause and resume because it could get confusing 
>> for
>> someone
>> looking at this pair of APIs, that a client driver would also need to
>> "start"
>> channels after "preparing" them. Since that is not that case, and the
>> mhi_prepare_for_transfer() API itself is supposed to also start the
>> channels, it
> 
> Yes, because prepare_for_transfer is actually init_and_start. I'm not
> in favor of hiding what is really done at mhi_core level, start is
> start and stop is stop, if it's correctly documented that should not
> be confusing. just saying (stop moves channels in stop state, start in
> enabled state), but other opinions are welcome.
> 
I can rename it and have it documented in the mhi_prepare_for_transfer() 
API
that we actually already start the channel, so it is not required to be 
used
at first. I can improve this documentation in mhi.h as a separate patch.

Later, if a client driver wants to issue stop and start commands, it can 
do so.
I'm not too picky with the name. Maybe Mani or someone else may have 
more
comments.

Thanks for looking in to this.
>> would be better to keep these as "pause" and "resume" instead IMO.
>> 
>> Any comments in favor or "stop" and "start"?
>> >
>> > TBH maybe we should rework/clarify MHI core and having well-defined
>> > states, maybe something like that:
>> >
>> > 1. When MHI core detects device for a driver, MHI core resets and
>> > initializes the channel(s), then call client driver probe function
>> >     => channel UNKNOWN->DISABLED state
>> >     => channel DISABLED->ENABLED state
>> > 2. When driver is ready for sending data, drivers calls
>> > mhi_start_transfer
>> >     => Channel is ENABLED->RUNNING state
>> > 3. Driver performs normal data transfers
>> > 4. The driver can suspend/resume transfer, it stops (suspend) the
>> > channel, can
>> >     => Channel is RUNNING->STOP
>> >     => Channel is STOP->RUNNING
>> >    ...
>> > 5. When device is removed, MHI core reset the channel
>> >     => channel is (RUNNING|STOP) -> DISABLED
>> >
>> > Today mhi_prepare_for_transfer performs both ENABLE and RUNNING
>> > transition, the idea would be to keep channel enabling/disabling in
>> > the MHI core (before/after driver probe/remove) and channel start/stop
>> > managed by the client driver.
>> >
>> > Regards,
>> > Loic
>> 
>> Your idea is good but it would not have much additional benefits and
>> would
>> involve MHI core "enabling" channels and allocating memory for each
>> channel
>> context when they are only declared as supported by the controller but
>> are not
>> actually being put to use.
> 
> Ok, your point is valid.
> 
>> 
>> mhi_prepare_for_transfer() does both channel context initialization 
>> and
>> starts
>> the channels, which is good because it allocates memory when needed. 
>> So,
>> this
>> benefits system memory if a controller with support for many channels
>> exists but
>> only a few channels are used.
>> 
>> Regarding the states to track from host:
>> -> DISABLED (We know channels are not active: in reset state or not
>> probed yet)
>> -> ENABLED (Active and running when needed for data transfers)
>> -> STOP (Paused: leaves the channel context as is since channels are 
>> not
>> reset)
>> -> SUSPENDED (Unload in progress: Entered before resetting
>> channels/remove())
>> 
>> BTW, we have the debugfs entry for "channels" that dumps the context 
>> to
>> show
>> exactly what the channel states are from device perspective. We can 
>> rely
>> on it
>> if needed.
>> 
>> If there are some comments I can add to make things clear, please let 
>> me
>> know.
>> 
>> Thanks,
>> Bhaumik
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum,
>> a Linux Foundation Collaborative Project

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
