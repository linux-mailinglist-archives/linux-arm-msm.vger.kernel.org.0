Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25190354B68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 05:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhDFDyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 23:54:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11994 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbhDFDyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 23:54:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617681285; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KUuxkc5YXA9Y56b409F6cdtvM9khotnClG/wSf/5OnM=; b=BkmLlrGuF/kN1gB/dY9h3Tn2qYHqaR41mtuau4Xx/+0y0y32UQaGs239nJXLc4Pdk4/e7xJC
 Fq/iCQqlcUKloqUbeEOjBYMjqm0A2P99GUmxcmG9y6y4Ml21yQHofWx0d2NZFkA+BJAWB1Mk
 KY9dkqKQ5riKyXF3/Y4A05J3rgo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 606bdb728166b7eff7049ec4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 03:54:26
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9303BC43462; Tue,  6 Apr 2021 03:54:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 380F3C433CA;
        Tue,  6 Apr 2021 03:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 380F3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
To:     bbhatt@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
 <20210331171252.GK15610@work>
 <CAMZdPi-M5fYPs7QfsBx4Gy6ywCLue5yqJLn0XthGhTeON1wWfw@mail.gmail.com>
 <20210331182700.GL15610@work>
 <fe857b91841caf67c53e6a9ad967eb84@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <8456ccb0-f644-80b2-a555-af8d0ca4e351@codeaurora.org>
Date:   Mon, 5 Apr 2021 20:54:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fe857b91841caf67c53e6a9ad967eb84@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 4/5/21 11:46 AM, Bhaumik Bhatt wrote:
> On 2021-03-31 11:27 AM, Manivannan Sadhasivam wrote:
>> On Wed, Mar 31, 2021 at 07:38:55PM +0200, Loic Poulain wrote:
>>> Hi Mani,
>>>
>>> Le mer. 31 mars 2021 à 19:12, Manivannan Sadhasivam <
>>> manivannan.sadhasivam@linaro.org> a écrit :
>>>
>>> > On Fri, Mar 05, 2021 at 06:02:23PM +0100, Loic Poulain wrote:
>>> > > This change ensures that PM reference is always get during packet
>>> > > queueing and released either after queuing completion (RX) or once
>>> > > the buffer has been consumed (TX). This guarantees proper update for
>>> > > underlying MHI controller runtime status (e.g. last_busy timestamp)
>>> > > and prevents suspend to be triggered while TX packets are flying,
>>> > > or before we completed update of the RX ring.
>>> > >
>>> >
>>> > Any reason why you didn't wait for RX completion also?
>>>
>>>
>>> Because on TX we know the buffer completion is going to happen really
>>> quickly (we send data) whereas we never know when when RX packet will be
>>> completed (we are waiting for data), so we want to be able to put the 
>>> MHI
>>> device in suspend while RX is pending (the device will wake up the 
>>> host on
>>> incoming data)
>>>
>>
>> Device wakeup will only happen for device initiated suspend (M1) but for
>> host initiated suspend (M3), device will check for pending data to host
>> and will initiate wakeup request before going for suspend. So I think it
>> is safe to wait for RX data.
>>
>> Hemant/Bhaumik, any thoughts?
>>
>> Thanks,
>> Mani
>>
> Agree with Loic here. Let's not depend on the device to determine host side
> behavior and instead, assume that the device may or may not be following
> protocol so as to reduce chances of higher power draw by host. Host should
> not care when RX comes, but host should care about TX completion as that's
> where our requirement ends.
> 
> There have been instances of delayed RX and in some cases, no TX completion
> from a certain client (I think DIAG), where device thinks they have 
> received
> garbage and decide not to respond with a TX completion.
> 
> We want to be able to put device in suspend or at least initiate it while
> host waits for incoming data. Once RX comes in, host will wake up to 
> process it.
Agree with Bhaumik and Loic about not waiting for Rx data.
> 
> What Loic does in this patch is done in one way using patch [1]. 
> However, that
> does not update the last_busy timestamp. I am mostly in favor of this patch
> going in but would like Loic to answer one question:
> 
> In mhi_reset_data_chan(), why not do a runtime_put(mhi_cntrl) inside the
> pre-existing if (mhi_chan->dir == DMA_TO_DEVICE) at the start of the 
> while loop:
> while (tre_ring->rp != tre_ring->wp)? This would be balanced for each TX.
I got same question when i looked at the patch.
>>>
>>> >
>>> > Thanks,
>>> > Mani
>>> >
>>> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> > > ---
>>> > >  drivers/bus/mhi/core/main.c | 20 ++++++++++++++++----
>>> > >  1 file changed, 16 insertions(+), 4 deletions(-)
>>> > >
>>> > > diff --git a/drivers/bus/mhi/core/main.c 
>>> b/drivers/bus/mhi/core/main.c
>>> > > index c780234..16b9640 100644
>>> > > --- a/drivers/bus/mhi/core/main.c
>>> > > +++ b/drivers/bus/mhi/core/main.c
>>> > > @@ -584,8 +584,11 @@ static int parse_xfer_event(struct 
>>> mhi_controller
>>> > *mhi_cntrl,
>>> > >                       /* notify client */
>>> > >                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>> > >
>>> > > -                     if (mhi_chan->dir == DMA_TO_DEVICE)
>>> > > +                     if (mhi_chan->dir == DMA_TO_DEVICE) {
>>> > >                               atomic_dec(&mhi_cntrl->pending_pkts);
>>> > > +                             /* Release the reference got from
>>> > mhi_queue() */
>>> > > +                             mhi_cntrl->runtime_put(mhi_cntrl);
>>> > > +                     }
>>> > >
>>> > >                       /*
>>> > >                        * Recycle the buffer if buffer is 
>>> pre-allocated,
>>> > > @@ -1021,9 +1024,11 @@ static int mhi_queue(struct mhi_device 
>>> *mhi_dev,
>>> > struct mhi_buf_info *buf_info,
>>> > >       if (unlikely(ret))
>>> > >               goto exit_unlock;
>>> > >
>>> > > -     /* trigger M3 exit if necessary */
>>> > > -     if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>>> > > -             mhi_trigger_resume(mhi_cntrl);
>>> > > +     /* Packet is queued, take a usage ref to exit M3 if necessary
>>> > > +      * for host->device buffer, balanced put is done on buffer
>>> > completion
>>> > > +      * for device->host buffer, balanced put is after ringing 
>>> the DB
>>> > > +      */
>>> > > +     mhi_cntrl->runtime_get(mhi_cntrl);
>>> > >
>>> > >       /* Assert dev_wake (to exit/prevent M1/M2)*/
>>> > >       mhi_cntrl->wake_toggle(mhi_cntrl);
>>> > > @@ -1034,6 +1039,9 @@ static int mhi_queue(struct mhi_device 
>>> *mhi_dev,
>>> > struct mhi_buf_info *buf_info,
>>> > >       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>>> > >               mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>>> > >
>>> > > +     if (dir == DMA_FROM_DEVICE)
>>> > > +             mhi_cntrl->runtime_put(mhi_cntrl);
>>> > > +
>>> > >  exit_unlock:
>>> > >       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>>> > >
>>> > > @@ -1431,6 +1439,10 @@ static void mhi_reset_data_chan(struct
>>> > mhi_controller *mhi_cntrl,
>>> > >                       result.buf_addr = buf_info->cb_buf;
>>> > >                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>>> > >               }
>>> > > +
>>> > > +             /* Release the reference got from mhi_queue() */
>>> > > +             if (mhi_chan->dir == DMA_TO_DEVICE)
>>> > > +                     mhi_cntrl->runtime_put(mhi_cntrl);
> Can this runtime_put(mhi_cntrl); be moved to the if at the top of this 
> while
> loop?
>>> > >       }
>>> > >  }
>>> > >
>>> > > --
>>> > > 2.7.4
>>> > >
>>> >
> 
> Thanks,
> Bhaumik
> 
> [1] 
> https://lore.kernel.org/r/20200929175218.8178-4-manivannan.sadhasivam@linaro.org 
> 
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
