Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA461ADACE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 12:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgDQKOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 06:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728440AbgDQKOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 06:14:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF27C061A0F
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 03:14:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 7so2049065pjo.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 03:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WrBQQciI2GN9qUSLUZEoGce/BUsxLeXSZswsBjv4T1g=;
        b=Rm7icIFHoqGjB4IXzM1pxwGbDFFjJDSqhBG8eH9/ssfDvokGojLRoDGcLTE3BMIvBP
         dtDYiLkzXMmR+TX9uIQMHDpso0SjLN/eUjFaiYt7ux2pKq7qCsbtsU1uyLTYFAgeoZii
         nt8L19tHKp6XYZLlJIK7HTbmcTBvrSuQiE3HdtZTWbJ2NUa6oW9pXczwcmjGlleMdwn5
         4GpnddbuTMwriD+a0d/A+II/1RTcRTm6t/W71+T18CMUjD8O4QbhcW2VX8QLvhPu+NSY
         5pOh2kXTK6dK9JLiPaW8h2rJwfCwU9Ti9FglzXtSJzq7FP1lSxkR3kbnP3zUMP0wao0R
         ZD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WrBQQciI2GN9qUSLUZEoGce/BUsxLeXSZswsBjv4T1g=;
        b=CrSY+fUljxNCByVBmAOOEiFVoBVb/UGbGmIsBVVSJDHRyQTCdHNDSe1oTaiUsqnIre
         1Az0ZRIFyYzS0zMl8R02LPEeFDMIFa2H130naCTYWxfT8GnBuqqC73DBDxjmzFRVmS1f
         iGcUmpS79VwlrppvITWTNYEsJjPHHqJXfispXhdkvEaCJ81bGeOaRIR5Apb8VEFo100F
         EZtHr/GAlEamFfto2IcdZU09TYblJI4Bka/VnrMnO5sJHKijlkwg+tofSY1wjQ8JDC+m
         Xog86OI3k+smAwloxhj6oXXx76IKL/Z2Bla0DwWJZ0NqXdmOQO5++WMVjUe29xf16CeL
         xLhg==
X-Gm-Message-State: AGi0PuaF+4c/rAAvDcrYA1Pa/K1LLr/TkUwKAUAffg8hBLr1iFv+SCVX
        XbMiIrI5xNmy0/PrgC7/moWttHKX9A==
X-Google-Smtp-Source: APiQypIXsxMBqT2YvpBF1SnrSY9KhyVbOFf85vY5Io0iSiLghKlrHbByDEni7GDya5pYSS8WhE1fnQ==
X-Received: by 2002:a17:90a:1503:: with SMTP id l3mr3394505pja.87.1587118475126;
        Fri, 17 Apr 2020 03:14:35 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630d:b86f:218c:c3f8:1490:7b19])
        by smtp.gmail.com with ESMTPSA id d22sm17701543pgh.11.2020.04.17.03.14.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 03:14:34 -0700 (PDT)
Date:   Fri, 17 Apr 2020 15:44:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-ID: <20200417101428.GA10295@Mani-XPS-13-9360>
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
 <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
> 
> On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> > Hi Dan,
> > 
> > On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
> > > Hello Manivannan Sadhasivam,
> > > 
> > > The patch 189ff97cca53: "bus: mhi: core: Add support for data
> > > transfer" from Feb 20, 2020, leads to the following static checker
> > > warning:
> > > 
> > > 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
> > > 	error: double locked 'mhi_chan->lock' (orig line 1110)
> > > 
> > > drivers/bus/mhi/core/main.c
> > >    1142          }
> > >    1143
> > >    1144          /* Toggle wake to exit out of M2 */
> > >    1145          mhi_cntrl->wake_toggle(mhi_cntrl);
> > >    1146
> > >    1147          if (mhi_chan->dir == DMA_TO_DEVICE)
> > >    1148                  atomic_inc(&mhi_cntrl->pending_pkts);
> > >    1149
> > >    1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))) {
> > >    1151                  unsigned long flags;
> > >    1152
> > >    1153                  read_lock_irqsave(&mhi_chan->lock, flags);
> 
> parse_xfer_event is taking read lock : read_lock_bh(&mhi_chan->lock); first
> and later
> 
> mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock, flags);
> 
> Both are read locks which are recursive, is this problematic ?
> 

read_locks are recursive but I wanted to make the static checker happy. But
looking into it further (and after having a chat with Arnd), we might need to
refactor the locking here.

Since 'chan->lock' only prevents 'mhi_chan->ch_state', how about doing something
like below?

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 3e9aa3b2da77..904f9be7a142 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -474,19 +474,12 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
        result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
                -EOVERFLOW : 0;
 
-       /*
-        * If it's a DB Event then we need to grab the lock
-        * with preemption disabled and as a write because we
-        * have to update db register and there are chances that
-        * another thread could be doing the same.
-        */
-       if (ev_code >= MHI_EV_CC_OOB)
-               write_lock_irqsave(&mhi_chan->lock, flags);
-       else
-               read_lock_bh(&mhi_chan->lock);
-
-       if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
-               goto end_process_tx_event;
+       read_lock_bh(&mhi_chan->lock);
+       if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+               read_unlock_bh(&mhi_chan->lock);
+               return 0;
+       }
+       read_unlock_bh(&mhi_chan->lock);
 
        switch (ev_code) {
        case MHI_EV_CC_OVERFLOW:
@@ -559,10 +552,12 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 
                mhi_chan->db_cfg.db_mode = 1;
                read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
+               write_lock_irqsave(&mhi_chan->lock, flags);
                if (tre_ring->wp != tre_ring->rp &&
                    MHI_DB_ACCESS_VALID(mhi_cntrl)) {
                        mhi_ring_chan_db(mhi_cntrl, mhi_chan);
                }
+               write_unlock_irqrestore(&mhi_chan->lock, flags);
                read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
                break;
        }
@@ -572,12 +567,6 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
                break;
        } /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
 
-end_process_tx_event:
-       if (ev_code >= MHI_EV_CC_OOB)
-               write_unlock_irqrestore(&mhi_chan->lock, flags);
-       else
-               read_unlock_bh(&mhi_chan->lock);
-
        return 0;
 }

Moreover, I do have couple of concerns:

1. 'mhi_chan->db_cfg.db_mode = 1' needs to be added to the critical section
above.

2. Why we have {write/read}_lock_irq variants for chan->lock? I don't see where
the db or ch_state got shared with hardirq handler. Maybe we should only have
*_bh (softirq) variants all over the place?

Thanks,
Mani 

> > >                                            ^^^^^^^^^^^^^^^
> > > The caller is already holding this lock.
> > > 
> > Hmm. We have one internal user of this function and that's where the locking
> > has gone wrong. Will fix it.
> > 
> > Thanks for reporting!
> > 
> > Regards,
> > Mani
> > 
> > >    1154                  mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> > >    1155                  read_unlock_irqrestore(&mhi_chan->lock, flags);
> > >    1156          }
> > >    1157
> > >    1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> > >    1159
> > >    1160          return 0;
> > >    1161  }
> > >    1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
> > > 
> > > regards,
> > > dan carpenter
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
