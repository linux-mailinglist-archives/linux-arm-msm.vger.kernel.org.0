Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECBA1B1E5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 07:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgDUFw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 01:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725881AbgDUFwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 01:52:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4727C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:52:25 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e6so905618pjt.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mJgvtzAo6PiW+teMlYV8oXA7KbzTUyqEYabZe2Afi1U=;
        b=jtCOcXA1pDRNgt+oeZMeN8OptbUKeipNHN9yrrqgQ1UL+ee5zqFAN2MntBwE4ihYkn
         zWYksnZLufzYrKWHcDmHm/DARQNay06V4yMpw2PJ86CRSCSYfxa3Jr32UwobVKNAfFO7
         Hg85ykHH4wPUNEQjG02Uowq5rG0EXYSLg0QadN2ODzvwpjrLpwirgpkYJ8HMc2QtZvFf
         f7KwPKNtL9tuYUJDiHV8GpG6e9sTGpwcFjfy3JMO0h/Hgx4ovqgdEco9qKPx5PTZcbi8
         WKNJvzZCI4AWdv/wuAuN5wxSDpEABsm38UCDjD6YtktJHwji9fCyS4f9kW6B3D5ip4WH
         0ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mJgvtzAo6PiW+teMlYV8oXA7KbzTUyqEYabZe2Afi1U=;
        b=MHwLuWBx0vsi69/WjQ19ZTtKrvAqeRRJCCyDXQqcCSmCU6TYX53FAsa0lMHaShnd2C
         07wuYNDQpbMCEIhrlUdehWWzZaLttJ3P68MZHAtriaZ/YLqmQcaUF4JFdZOdo/vj53Fa
         49Lw6m7qWgx7d5caWugn0hLasnJD+lcWBZbuKGzrux5ozWTuU7st8j3WceDrxCf2oFDL
         qINlgRKyfheVYg1hiDG1urHAlzvYr2WfJ+2XQDNbRaJfKcQ5d5XJdgXpzQfkXAvj6GgU
         V6UlMQuPPrXNQy2l4FlS2hJxSrv3ZF8Tc3Hk1FeolFuuc2dpbku4jagMyLXEHsMp0Z2W
         nH+w==
X-Gm-Message-State: AGi0PuYv2QQH9UBDnQdw52G58UCgB5Q7vJ5NECAz0CGnu3Z52Bf8v4Mz
        UhxGKfgC299V7U3F1TbipHnt
X-Google-Smtp-Source: APiQypLz5WIUL21BrJFE2X1cS9KhMxg7CGPrcjoobEXkFmcrR0iFtbhrYaDce7BSFRhVmvSP/4TTxQ==
X-Received: by 2002:a17:902:ba89:: with SMTP id k9mr19854616pls.199.1587448343924;
        Mon, 20 Apr 2020 22:52:23 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6289:7463:c15b:2de1:b77e:d971])
        by smtp.gmail.com with ESMTPSA id s44sm1252851pjc.28.2020.04.20.22.52.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 22:52:23 -0700 (PDT)
Date:   Tue, 21 Apr 2020 11:22:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200421055218.GA4327@Mani-XPS-13-9360>
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
 <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
 <20200417101428.GA10295@Mani-XPS-13-9360>
 <184d0d8e-1d5f-c317-a40b-1b44e79ad293@codeaurora.org>
 <19504ACB-4E2A-4883-92E2-7AAC056CE3B4@linaro.org>
 <7d1bda90-dec3-3cfe-9bfc-dbcf97f9a72d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d1bda90-dec3-3cfe-9bfc-dbcf97f9a72d@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 20, 2020 at 03:57:58PM -0700, Hemant Kumar wrote:
> Hi Mani,
> 
> On 4/18/20 12:19 PM, Manivannan Sadhasivam wrote:
> > Hi Hemant,
> > 
> > Please try to use an email client supporting plain text mode like mutt. Your reply looks mangled.
> > 
> > On 18 April 2020 12:40:10 PM IST, Hemant Kumar <hemantk@codeaurora.org> wrote:
> > > Hi Mani,
> > > 
> > > On 4/17/20 3:14 AM, Manivannan Sadhasivam wrote:
> > > > Hi Hemant,
> > > > 
> > > > On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
> > > > > On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> > > > > > Hi Dan,
> > > > > > 
> > > > > > On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
> > > > > > > Hello Manivannan Sadhasivam,
> > > > > > > 
> > > > > > > The patch 189ff97cca53: "bus: mhi: core: Add support for data
> > > > > > > transfer" from Feb 20, 2020, leads to the following static checker
> > > > > > > warning:
> > > > > > > 
> > > > > > > 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
> > > > > > > 	error: double locked 'mhi_chan->lock' (orig line 1110)
> > > > > > > 
> > > > > > > drivers/bus/mhi/core/main.c
> > > > > > >      1142          }
> > > > > > >      1143
> > > > > > >      1144          /* Toggle wake to exit out of M2 */
> > > > > > >      1145          mhi_cntrl->wake_toggle(mhi_cntrl);
> > > > > > >      1146
> > > > > > >      1147          if (mhi_chan->dir == DMA_TO_DEVICE)
> > > > > > >      1148                  atomic_inc(&mhi_cntrl->pending_pkts);
> > > > > > >      1149
> > > > > > >      1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> > > > > > >      1151                  unsigned long flags;
> > > > > > >      1152
> > > > > > >      1153                  read_lock_irqsave(&mhi_chan->lock,
> > > flags);
> > > > > parse_xfer_event is taking read lock :
> > > read_lock_bh(&mhi_chan->lock); first
> > > > > and later
> > > > > 
> > > > > mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock,
> > > flags);
> > > > > 
> > > > > Both are read locks which are recursive, is this problematic ?
> > > > > 
> > > > read_locks are recursive but I wanted to make the static checker
> > > happy. But
> > > > looking into it further (and after having a chat with Arnd), we might
> > > need to
> > > > refactor the locking here.
> > > > 
> > > > Since 'chan->lock' only prevents 'mhi_chan->ch_state', how about
> > > doing something
> > > > like below?
> > > 
> > > As comment mentioned for OOB (to enter  DB mode) write lock is acquired
> > > 
> > > with preemption disabled (irqsave ver). In case of OOB event control
> > > does not go to mhi_queue_buf
> > > 
> > > path.
> > 
> > Again, why do we need irq version of write lock. It should only be used if the data is shared with hardirq handlers which I don't see. Otherwise, write_lock_bh() looks sufficient to me as this itself is an exclusive lock.
> irq ver disables preemption where as bh ver does not. In case of OOB event,
> idea is not get preempted and this is for short duration of ringing the
> channel doorbell.

This is a clear abuse of write_lock_irq() API. write_lock_irq() should _only_
be used when the data is shared with a hardirq handler. The original comment
says,

"If it's a DB Event then we need to grab the lock with preemption disabled and
as a write because we have to update db register and there are chances that
another thread could be doing the same."

If the 'another' thread has the lock for this piece of code then we don't need
to disable the irq, isn't it? The irq needs to be disabled only if the 'another'
thread is a hardirq handler. I think the problem here is you are caution of not
getting preempted while mhi_ring_chan_db() which I don't see why. Is this
function non reentrant? I don't think so.

Furthermore, there are _lot_ of places the *_irq and *_bh versions of locks are
mixed. One such instance is mhi_queue_buf() where the read_lock_irq() is used
for mhi_ring_chan_db() while mhi_queue_skb() uses read_lock_bh().

> > 
> > > For transfer completion events >read_lock_bh is acquired and
> > > channel state is checked.
> > > 
> > > This lock is held for entire handling of the transfer completion so
> > > that
> > > in case
> > > 
> > > __mhi_unprepare_channel() is called from power down context write lock
> > > is acquired
> > > 
> > > for channel lock to change channel state, which would wait until
> > > parse_xfer_event for
> > > 
> > > data transfer is done (reader is in critical section).  In case if
> > > __mhi_unprepare_channel() wins then
> > > 
> > > parse_xfer_event is skipped otherwise parse_xfer_event is done and then
> > > 
> > > channel state is changed.
> > > 
> > 
> > So if we get unprepare_channel() after checking the channel state in parse_xfer_event(), what could go wrong?
> > Also, grabbing the lock for the entire function doesn't look good to me. The purpose of the chan->lock is just to protect 'chan_state'/DB and not the whole function.
> > 
> main problem unprepare_channel and parse_xfer_event have lot in common due
> to that we can not let them run in parallel. For example -parse_xfer_event
> is working on transfer ring (rp and wp updates)
> -parse_xfer_event calling dma_unmap_single on buffer
> -__mhi_unprepare_channel() calling mhi_reset_chan() and
> mhi_deinit_chan_ctxt().

Hmm. So the issue will be when __mhi_unprepare_channel() gets called after
parse_xfer_event() checked the 'mhi_chan->ch_state'. So if we have the read_lock
for the whole case then it is guarenteed to run before __mhi_unprepare_channel()
does its part.

Let's keep it as it is. But please look into the irq vs bh part above.

Thanks,
Mani

> > Thanks,
> > Mani
> > 
> > > > 
> > > > diff --git a/drivers/bus/mhi/core/main.c
> > > b/drivers/bus/mhi/core/main.c
> > > > index 3e9aa3b2da77..904f9be7a142 100644
> > > > --- a/drivers/bus/mhi/core/main.c
> > > > +++ b/drivers/bus/mhi/core/main.c
> > > > @@ -474,19 +474,12 @@ static int parse_xfer_event(struct
> > > mhi_controller *mhi_cntrl,
> > > >           result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW)
> > > ?
> > > >                   -EOVERFLOW : 0;
> > > > -       /*
> > > > -        * If it's a DB Event then we need to grab the lock
> > > > -        * with preemption disabled and as a write because we
> > > > -        * have to update db register and there are chances that
> > > > -        * another thread could be doing the same.
> > > > -        */
> > > > -       if (ev_code >= MHI_EV_CC_OOB)
> > > > -               write_lock_irqsave(&mhi_chan->lock, flags);
> > > > -       else
> > > > -               read_lock_bh(&mhi_chan->lock);
> > > > -
> > > > -       if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
> > > > -               goto end_process_tx_event;
> > > > +       read_lock_bh(&mhi_chan->lock);
> > > > +       if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
> > > > +               read_unlock_bh(&mhi_chan->lock);
> > > > +               return 0;
> > > > +       }
> > > > +       read_unlock_bh(&mhi_chan->lock);
> > > >           switch (ev_code) {
> > > >           case MHI_EV_CC_OVERFLOW:
> > > > @@ -559,10 +552,12 @@ static int parse_xfer_event(struct
> > > mhi_controller *mhi_cntrl,
> > > >                   mhi_chan->db_cfg.db_mode = 1;
> > > >                   read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> > > > +               write_lock_irqsave(&mhi_chan->lock, flags);
> > > >                   if (tre_ring->wp != tre_ring->rp &&
> > > >                       MHI_DB_ACCESS_VALID(mhi_cntrl)) {
> > > >                           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> > > >                   }
> > > > +               write_unlock_irqrestore(&mhi_chan->lock, flags);
> > > >                   read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> > > >                   break;
> > > >           }
> > > > @@ -572,12 +567,6 @@ static int parse_xfer_event(struct
> > > mhi_controller *mhi_cntrl,
> > > >                   break;
> > > >           } /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
> > > > -end_process_tx_event:
> > > > -       if (ev_code >= MHI_EV_CC_OOB)
> > > > -               write_unlock_irqrestore(&mhi_chan->lock, flags);
> > > > -       else
> > > > -               read_unlock_bh(&mhi_chan->lock);
> > > > -
> > > >           return 0;
> > > >    }
> > > > 
> > > > Moreover, I do have couple of concerns:
> > > > 
> > > > 1. 'mhi_chan->db_cfg.db_mode = 1' needs to be added to the critical
> > > section
> > > > above.
> > > > 
> > > > 2. Why we have {write/read}_lock_irq variants for chan->lock? I don't
> > > see where
> > > > the db or ch_state got shared with hardirq handler. Maybe we should
> > > only have
> > > > *_bh (softirq) variants all over the place?
> > > > 
> > > > Thanks,
> > > > Mani
> > > > 
> > > > > > >                                              ^^^^^^^^^^^^^^^
> > > > > > > The caller is already holding this lock.
> > > > > > > 
> > > > > > Hmm. We have one internal user of this function and that's where
> > > the locking
> > > > > > has gone wrong. Will fix it.
> > > > > > 
> > > > > > Thanks for reporting!
> > > > > > 
> > > > > > Regards,
> > > > > > Mani
> > > > > > 
> > > > > > >      1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> > > > > > >      1155                  read_unlock_irqrestore(&mhi_chan->lock,
> > > flags);
> > > > > > >      1156          }
> > > > > > >      1157
> > > > > > >      1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock,
> > > flags);
> > > > > > >      1159
> > > > > > >      1160          return 0;
> > > > > > >      1161  }
> > > > > > >      1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
> > > > > > > 
> > > > > > > regards,
> > > > > > > dan carpenter
> > > > > -- 
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > > > a Linux Foundation Collaborative Project
> > 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
