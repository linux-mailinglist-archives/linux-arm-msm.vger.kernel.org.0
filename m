Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD635064A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234743AbhCaS1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbhCaS1G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:27:06 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38394C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:27:04 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id l1so8339200plg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=STao7uXp/RqSsc9B0Ax9i31J8MY7vB04C9H9nnIj7d8=;
        b=sxvscZr/6uy1ompDEMHNaoh2e4i89b5fSEvjNEMCn8s1lqzdzKkXqovoGV3N3H6vHu
         NNsBYGH/0PfvX3NwTRHjjCBjfWL56xLdCFwqLP9N4dZjZ3nPQeQH5K27E3oNrzikQvSo
         1rCDrQSsnaYCeEH1Nyz9sY1uyN3/FP5Ip1TqexwhSDwQsq9BwXlkxamBEIxkL1jvZTU7
         AC46HDBeQL3Pb5jtnxnMWh6iy1i/z9LcQVVqSSN4UQI+BsOtssX0XMLNWsa2VofA6tis
         JAG5gCVgLEkGJJuLJhvtTxef7vkUbatuSd52Y5JYhVPuqPJRo6HpwucqjOVcGHUX5emH
         GANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=STao7uXp/RqSsc9B0Ax9i31J8MY7vB04C9H9nnIj7d8=;
        b=Ne+YecSytHkxUS8ia6tBJjegJWvIy/aC52w7KmsPk1uQvnwxC5sW8cXAbwYQ13xwGB
         XoBc/sb2PbTWtjE+fZLaoykiqC7GVZNYwGDBpEZCg6AoXwspjm7F44fQ0CZxTciOXnN+
         kqxzu5xhzR98KTfs6s322wgRAhLRQQ4NqgLZt6PKOaEQfBD1RQuYOW4zhXRqJS9ZsP0k
         Vy2QHVWytU7NqZs01fgEeqnpqSApm/ABJYG8/AUJRh8FXFY3LR9uZZ4OnERMmnzygnmt
         UdRaCX+IA88JgbpuLo60t0mGrCAXpZUwuECYmAbjM0o4Rmmow4/TkQmZl4VauVxlVMhr
         MSZw==
X-Gm-Message-State: AOAM531v1cajd0hKHKGw+nbHe2V8Ws+KS/8ZFI+Eel70PXLfNck+UNOo
        UF9+HYX+wnjxPc1iMEIg7k1jRJqm53MG86E=
X-Google-Smtp-Source: ABdhPJztMTuaHTorhkGh5cUl0AGTfknSLmBuLauh+bUkY+PG48EXUHslex6ZavfoHZRszjSqRRvqvg==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id fr10mr4828568pjb.18.1617215223577;
        Wed, 31 Mar 2021 11:27:03 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id d11sm2933689pjz.47.2021.03.31.11.27.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 11:27:02 -0700 (PDT)
Date:   Wed, 31 Mar 2021 23:57:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix MHI runtime_pm behavior
Message-ID: <20210331182700.GL15610@work>
References: <1614963744-25962-1-git-send-email-loic.poulain@linaro.org>
 <20210331171252.GK15610@work>
 <CAMZdPi-M5fYPs7QfsBx4Gy6ywCLue5yqJLn0XthGhTeON1wWfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi-M5fYPs7QfsBx4Gy6ywCLue5yqJLn0XthGhTeON1wWfw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 07:38:55PM +0200, Loic Poulain wrote:
> Hi Mani,
> 
> Le mer. 31 mars 2021 à 19:12, Manivannan Sadhasivam <
> manivannan.sadhasivam@linaro.org> a écrit :
> 
> > On Fri, Mar 05, 2021 at 06:02:23PM +0100, Loic Poulain wrote:
> > > This change ensures that PM reference is always get during packet
> > > queueing and released either after queuing completion (RX) or once
> > > the buffer has been consumed (TX). This guarantees proper update for
> > > underlying MHI controller runtime status (e.g. last_busy timestamp)
> > > and prevents suspend to be triggered while TX packets are flying,
> > > or before we completed update of the RX ring.
> > >
> >
> > Any reason why you didn't wait for RX completion also?
> 
> 
> Because on TX we know the buffer completion is going to happen really
> quickly (we send data) whereas we never know when when RX packet will be
> completed (we are waiting for data), so we want to be able to put the MHI
> device in suspend while RX is pending (the device will wake up the host on
> incoming data)
> 

Device wakeup will only happen for device initiated suspend (M1) but for
host initiated suspend (M3), device will check for pending data to host
and will initiate wakeup request before going for suspend. So I think it
is safe to wait for RX data.

Hemant/Bhaumik, any thoughts?

Thanks,
Mani

> 
> >
> > Thanks,
> > Mani
> >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  drivers/bus/mhi/core/main.c | 20 ++++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index c780234..16b9640 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -584,8 +584,11 @@ static int parse_xfer_event(struct mhi_controller
> > *mhi_cntrl,
> > >                       /* notify client */
> > >                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> > >
> > > -                     if (mhi_chan->dir == DMA_TO_DEVICE)
> > > +                     if (mhi_chan->dir == DMA_TO_DEVICE) {
> > >                               atomic_dec(&mhi_cntrl->pending_pkts);
> > > +                             /* Release the reference got from
> > mhi_queue() */
> > > +                             mhi_cntrl->runtime_put(mhi_cntrl);
> > > +                     }
> > >
> > >                       /*
> > >                        * Recycle the buffer if buffer is pre-allocated,
> > > @@ -1021,9 +1024,11 @@ static int mhi_queue(struct mhi_device *mhi_dev,
> > struct mhi_buf_info *buf_info,
> > >       if (unlikely(ret))
> > >               goto exit_unlock;
> > >
> > > -     /* trigger M3 exit if necessary */
> > > -     if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> > > -             mhi_trigger_resume(mhi_cntrl);
> > > +     /* Packet is queued, take a usage ref to exit M3 if necessary
> > > +      * for host->device buffer, balanced put is done on buffer
> > completion
> > > +      * for device->host buffer, balanced put is after ringing the DB
> > > +      */
> > > +     mhi_cntrl->runtime_get(mhi_cntrl);
> > >
> > >       /* Assert dev_wake (to exit/prevent M1/M2)*/
> > >       mhi_cntrl->wake_toggle(mhi_cntrl);
> > > @@ -1034,6 +1039,9 @@ static int mhi_queue(struct mhi_device *mhi_dev,
> > struct mhi_buf_info *buf_info,
> > >       if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
> > >               mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> > >
> > > +     if (dir == DMA_FROM_DEVICE)
> > > +             mhi_cntrl->runtime_put(mhi_cntrl);
> > > +
> > >  exit_unlock:
> > >       read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> > >
> > > @@ -1431,6 +1439,10 @@ static void mhi_reset_data_chan(struct
> > mhi_controller *mhi_cntrl,
> > >                       result.buf_addr = buf_info->cb_buf;
> > >                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> > >               }
> > > +
> > > +             /* Release the reference got from mhi_queue() */
> > > +             if (mhi_chan->dir == DMA_TO_DEVICE)
> > > +                     mhi_cntrl->runtime_put(mhi_cntrl);
> > >       }
> > >  }
> > >
> > > --
> > > 2.7.4
> > >
> >
