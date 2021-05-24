Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF0E38E08F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 06:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhEXFA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 01:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbhEXFA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 01:00:28 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6707C06138A
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 21:59:00 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id q25so1805059pfn.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IAKmLQlo5yIdWFUbaREDZ8KxE5immhhtLzqjh0rXTzU=;
        b=H5h59/wSyUEhLnaxOLf44Zjv9gy+xDh48y2q4T/os8Y8uxva6P8+92uyMOv+sWLFbK
         JuF/KQtRv5FjWZQwkwwrkOdW0PSXCmjd76fkNmdcab/1klMOdj4g6t30ECwXWYuD6DJP
         Cqtd41QwDuk9WYBYUuKSQ4r9YOxAUtDQek7VWfJd6qASaKuOBU/FmrFre2awHaHZRW53
         7DPlTgaybhl7HlnG20B1a0crNXPQdPNkNDS075IO9sGjXZghcwuqerKIENVgeuvUmVYU
         irXoN3/Zz6AVWFqn6bhp3HUmt3/6FnN8lAOIh5I172hPN8WU+UCzAFBN7O2FOm5ZXUoW
         ZDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IAKmLQlo5yIdWFUbaREDZ8KxE5immhhtLzqjh0rXTzU=;
        b=Bd4SLScZTvHyY9/H6Dpyfr1KQFjKKr2HxegtlB3sc+u0ZGx0LNPkMYSIWSwJ+B4GLP
         onVi8t4qXtc5GHZNE9zyOTZDDF2Yhq3J87bfXPT8S9Dkr/E1hXbzMyapJi5H3B0wPCqE
         wmq6Sv7OwAwRxBAKKqGIxFrrX6qOC6/pQxMcwva8tOoZoKp7JUMB0UeQdA6oKFxZSxN3
         4gfosGklcDpW1veZ8LJAumTcO0KUYkcXY6UtsdZBDVfk9afGC3DX8CaWWxDVnNWoLIhA
         AmwG+3b3yYmQZYDvWdkD/1Z2SWOto4TRz6d+/5H8Yx9qpoHjrtRHC20pFAbBsgCw2KB4
         chGg==
X-Gm-Message-State: AOAM532M0uby65lg4mzV2S+ilrSA4i2iZqgIka/bnkJvZ+KCnBzqZmwT
        cNCU6GwyGuW1Ncehw3xUmH0K6HKe9TR4
X-Google-Smtp-Source: ABdhPJwdpF2fWwKYkGCy+MvDtZC8h+uirh0J8BSq/MBac0zgzhRyoIqggx05touQCKqS4xEMPxiGQw==
X-Received: by 2002:a65:4608:: with SMTP id v8mr11564805pgq.435.1621832339503;
        Sun, 23 May 2021 21:58:59 -0700 (PDT)
Received: from work ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id b2sm13529363pji.28.2021.05.23.21.58.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 May 2021 21:58:58 -0700 (PDT)
Date:   Mon, 24 May 2021 10:28:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Baochen Qiang <bqiang@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Message-ID: <20210524045855.GF8823@work>
References: <20210524040312.14409-1-bqiang@codeaurora.org>
 <20210524043740.GC8823@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524043740.GC8823@work>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 24, 2021 at 10:07:40AM +0530, Manivannan Sadhasivam wrote:
> On Mon, May 24, 2021 at 12:03:12PM +0800, Baochen Qiang wrote:
> > During system resume, MHI host triggers M3->M0 transition and then waits
> > for target device to enter M0 state. Once done, the device queues a state
> > change event into ctrl event ring and notifies MHI host by raising an
> > interrupt, where a tasklet is scheduled to process this event. In most cases,
> > the tasklet is served timely and wait operation succeeds.
> > 
> > However, there are cases where CPU is busy and cannot serve this tasklet
> > for some time. Once delay goes long enough, the device moves itself to M1
> > state and also interrupts MHI host after inserting a new state change
> > event to ctrl ring. Later CPU finally has time to process the ring, however
> > there are two events in it now:
> > 	1. for M3->M0 event, which is processed first as queued first,
> > 	   tasklet handler updates device state to M0 and wakes up the task,
> > 	   i.e., the MHI host.
> > 	2. for M0->M1 event, which is processed later, tasklet handler
> > 	   triggers M1->M2 transition and updates device state to M2 directly,
> > 	   then wakes up the MHI host(if still sleeping on this wait queue).
> > Note that although MHI host has been woken up while processing the first
> > event, it may still has no chance to run before the second event is processed.
> > In other words, MHI host has to keep waiting till timeout cause the M0 state
> > has been missed.
> > 
> > kernel log here:
> > ...
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
> > ...
> > 
> > Fix this issue by simply adding M2 as a valid state for resume.
> > 
> > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> > 
> > Fixes: 0c6b20a1d720 ("bus: mhi: core: Add support for MHI suspend and resume")
> > Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> 
> Applied to mhi-fixes!
> 

Sorry this has been applied to mhi-next!

Thanks,
Mani

> Thanks,
> Mani
> 
> > ---
> >  drivers/bus/mhi/core/pm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index e2e59a341fef..59b009a3ee9b 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -934,6 +934,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> >  
> >  	ret = wait_event_timeout(mhi_cntrl->state_event,
> >  				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
> > +				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
> >  				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> >  				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
> >  
> > -- 
> > 2.25.1
> > 
