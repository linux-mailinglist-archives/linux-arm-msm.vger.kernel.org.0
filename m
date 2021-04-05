Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF0A3546CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 20:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhDESqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 14:46:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55028 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbhDESqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 14:46:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617648407; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Svgu08p5S1sVzyKEcr60eUGS2Un7/iA9DoqFSsQRPyo=;
 b=gA+Zn9cgiBL/8gCzz2CXqZFsDBiEjd6ZpHqLJGIrMhTfdl38e+LG3pwSLgZN0hRBrDKOC8jl
 ebXqd9LZCe1ryggtmONZkdI+Fsorizz9VmMrVpHxcTk9YrnNDfY68CE/NNiLaAs8MaRTgHgC
 gznuqkWh6DAMN1jWEhpHIO3fySQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606b5b16febcffa80f6fa6c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 18:46:46
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2BB19C433ED; Mon,  5 Apr 2021 18:46:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36C8EC433CA;
        Mon,  5 Apr 2021 18:46:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 05 Apr 2021 11:46:45 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210331182700.GL15610@work>
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
 <20210331171252.GK15610@work>
 <CAMZdPi-M5fYPs7QfsBx4Gy6ywCLue5yqJLn0XthGhTeON1wWfw@mail.gmail.com>
 <20210331182700.GL15610@work>
Message-ID: <fe857b91841caf67c53e6a9ad967eb84@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-31 11:27 AM, Manivannan Sadhasivam wrote:
> On Wed, Mar 31, 2021 at 07:38:55PM +0200, Loic Poulain wrote:
>> Hi Mani,
>> 
>> Le mer. 31 mars 2021 à 19:12, Manivannan Sadhasivam <
>> manivannan.sadhasivam@linaro.org> a écrit :
>> 
>> > On Fri, Mar 05, 2021 at 06:02:23PM +0100, Loic Poulain wrote:
>> > > This change ensures that PM reference is always get during packet
>> > > queueing and released either after queuing completion (RX) or once
>> > > the buffer has been consumed (TX). This guarantees proper update for
>> > > underlying MHI controller runtime status (e.g. last_busy timestamp)
>> > > and prevents suspend to be triggered while TX packets are flying,
>> > > or before we completed update of the RX ring.
>> > >
>> >
>> > Any reason why you didn't wait for RX completion also?
>> 
>> 
>> Because on TX we know the buffer completion is going to happen really
>> quickly (we send data) whereas we never know when when RX packet will 
>> be
>> completed (we are waiting for data), so we want to be able to put the 
>> MHI
>> device in suspend while RX is pending (the device will wake up the 
>> host on
>> incoming data)
>> 
> 
> Device wakeup will only happen for device initiated suspend (M1) but 
> for
> host initiated suspend (M3), device will check for pending data to host
> and will initiate wakeup request before going for suspend. So I think 
> it
> is safe to wait for RX data.
> 
> Hemant/Bhaumik, any thoughts?
> 
> Thanks,
> Mani
> 
Agree with Loic here. Let's not depend on the device to determine host 
side
behavior and instead, assume that the device may or may not be following
protocol so as to reduce chances of higher power draw by host. Host 
should
not care when RX comes, but host should care about TX completion as 
that's
where our requirement ends.

There have been instances of delayed RX and in some cases, no TX 
completion
from a certain client (I think DIAG), where device thinks they have 
received
garbage and decide not to respond with a TX completion.

We want to be able to put device in suspend or at least initiate it 
while
host waits for incoming data. Once RX comes in, host will wake up to 
process it.

What Loic does in this patch is done in one way using patch [1]. 
However, that
does not update the last_busy timestamp. I am mostly in favor of this 
patch
going in but would like Loic to answer one question:

In mhi_reset_data_chan(), why not do a runtime_put(mhi_cntrl) inside the
pre-existing if (mhi_chan->dir == DMA_TO_DEVICE) at the start of the 
while loop:
while (tre_ring->rp != tre_ring->wp)? This would be balanced for each 
TX.
>> 
>> >
>> > Thanks,
>> > Mani
>> >
>> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> > > ---
>> > >  drivers/bus/mhi/core/main.c | 20 ++++++++++++++++----
>> > >  1 file changed, 16 insertions(+), 4 deletions(-)
>> > >
>> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> > > index c780234..16b9640 100644
>> > > --- a/drivers/bus/mhi/core/main.c
>> > > +++ b/drivers/bus/mhi/core/main.c
>> > > @@ -584,8 +584,11 @@ static int parse_xfer_event(struct mhi_controller
>> > *mhi_cntrl,
>> > >                       /* notify client */
>> > >                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>> > >
>> > > -                     if (mhi_chan->dir == DMA_TO_DEVICE)
>> > > +                     if (mhi_chan->dir == DMA_TO_DEVICE) {
>> > >                               atomic_dec(&mhi_cntrl->pending_pkts);
>> > > +                             /* Release the reference got from
>> > mhi_queue() */
>> > > +                             mhi_cntrl->runtime_put(mhi_cntrl);
>> > > +                     }
>> > >
>> > >                       /*
>> > >                        * Recycle the buffer if buffer is pre-allocated,
>> > > @@ -1021,9 +1024,11 @@ static int mhi_queue(struct mhi_device *mhi_dev,
>> > struct mhi_buf_info *buf_info,
>> > >       if (unlikely(ret))
>> > >               goto exit_unlock;
>> > >
>> > > -     /* trigger M3 exit if necessary */
>> > > -     if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> > > -             mhi_trigger_resume(mhi_cntrl);
>> > > +     /* Packet is queued, take a usage ref to exit M3 if necessary
>> > > +      * for host->device buffer, balanced put is done on buffer
>> > completion
>> > > +      * for device->host buffer, balanced put is after ringing the DB
>> > > +      */
>> > > +     mhi_cntrl->runtime_get(mhi_cntrl);
>> > >
>> > >       /* Assert dev_wake (to exit/prevent M1/M2)*/
>> > >       mhi_cntrl->wake_toggle(mhi_cntrl);
>> > > @@ -1034,6 +1039,9 @@ static int mhi_queue(struct mhi_device *mhi_dev,
>> > struct mhi_buf_info *buf_info,
>> > >       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>> > >               mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>> > >
>> > > +     if (dir == DMA_FROM_DEVICE)
>> > > +             mhi_cntrl->runtime_put(mhi_cntrl);
>> > > +
>> > >  exit_unlock:
>> > >       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>> > >
>> > > @@ -1431,6 +1439,10 @@ static void mhi_reset_data_chan(struct
>> > mhi_controller *mhi_cntrl,
>> > >                       result.buf_addr = buf_info->cb_buf;
>> > >                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>> > >               }
>> > > +
>> > > +             /* Release the reference got from mhi_queue() */
>> > > +             if (mhi_chan->dir == DMA_TO_DEVICE)
>> > > +                     mhi_cntrl->runtime_put(mhi_cntrl);
Can this runtime_put(mhi_cntrl); be moved to the if at the top of this 
while
loop?
>> > >       }
>> > >  }
>> > >
>> > > --
>> > > 2.7.4
>> > >
>> >

Thanks,
Bhaumik

[1] 
https://lore.kernel.org/r/20200929175218.8178-4-manivannan.sadhasivam@linaro.org
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
