Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D281A671C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 15:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbgDMNfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 09:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbgDMNe5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 09:34:57 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BADC0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 06:34:56 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m21so658587pff.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1JN6avybO82F4crf8FcX/q7NMZhJ1JWzMzy6qTX4X8k=;
        b=vxcTuhav4yy4JQwxSniGoXbBjDr5myxRSBYYHOKTqNiI0lud/L5F1lcu1a9a5DIJXg
         WM1ewpgXdBm4+ivKee6+yrj55G1Z6wOXzdW4BS88F/HCsHyuvl4je4WfLLD1yvt5z5sc
         uY3w4AjlSWNuZRofQZnpT5KRcLAeiHJPIVU8WU65aOvPlcTRT9bbso1EhqJJ8+gVEfbS
         a3GjCwBpNEZMcBNrIKEY5ey+7CrLFa2fw8U6eZ3/sjbs4BaRy8dN0CAnHet3Sufmb97/
         /Wp4PgOsKma+nOLbaSgqgeRqe39U8Pg6X+XVkT2b7BAY38THs7szSrv0iXPESwFUkJWz
         LSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1JN6avybO82F4crf8FcX/q7NMZhJ1JWzMzy6qTX4X8k=;
        b=K8uLxpbSmB6OaDaVYSRgSYWq8zkoACD59PzLx1k5YrIWNM+wVL/o2rGREfewYbqq+g
         W6a1bKoLiwx5/Hx1wLxmFN/2aHe2f64wn9Uz86ITB3JlydqXq2GEg7nwJvTqOtT8yIY2
         bZvuxZsNWftJUXpzn95P71GtZA18eDXoDVP99LwSGuFNw0ILXbkiNnZA6jyfARNh9sq+
         VvRf740tKGLJO4uZURFdORYeE4d2jP5l8BK1KNMpETV9UF4qIWbUCN57LwFBs3zHc9E7
         A7tgmaQRoqC07o8n9lgpGXdjherJ+DHRccYMGUTxYxJWC+hlMqlB9k8Y11yqxfOObRqj
         Zpdw==
X-Gm-Message-State: AGi0PuZhbCxNtKw6uxbNTlvCluF/XRuy3viKOX8Dak/PfT2DcZ0DIvJQ
        +fBiGxZ4KCgMGv0vBk3GNJuZ
X-Google-Smtp-Source: APiQypJls8wi6wm4t+C0attwFKw+xakF1IRrfRh77tKOQkZZDDz4p+M0ZMDbTmxY+Ta6b9lKQYVxzA==
X-Received: by 2002:a63:594:: with SMTP id 142mr16628334pgf.418.1586784895785;
        Mon, 13 Apr 2020 06:34:55 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:621d:5eab:88eb:9bf8:e528:ec6])
        by smtp.gmail.com with ESMTPSA id 62sm1634561pfu.181.2020.04.13.06.34.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 06:34:53 -0700 (PDT)
Date:   Mon, 13 Apr 2020 19:04:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Bhaumik Vasav Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
Message-ID: <20200413133447.GA19124@Mani-XPS-13-9360>
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
 <1768ba6e-12c2-7b4f-0f17-44fecc6473b9@codeaurora.org>
 <11d9f35b-b911-7985-8846-0a45904ceed1@codeaurora.org>
 <5c4efe13-42a4-e802-4070-5d9d30b8cac2@codeaurora.org>
 <79feeb0b-0837-c5b6-087d-856c3e238c67@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79feeb0b-0837-c5b6-087d-856c3e238c67@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 10, 2020 at 03:39:57PM -0600, Jeffrey Hugo wrote:
> On 4/10/2020 2:37 PM, Bhaumik Vasav Bhatt wrote:
> > Hi Jeff,
> > 
> > We will always have the mhi_intvec_handler registered and trigger your
> > wake_up state event when you write MHI RESET. BHI INTVEC IRQ using
> > mhi_cntrl->irq[0] is _not_ unregistered once you enter AMSS EE.
> 
> I understand it is not unregistered.  However mhi_cntrl->irq[0] may be
> reserved for BHI, and thus only exercised by PBL EE.  Where as,
> mhi_cntrl->irq[1..N] may be only exercised by AMSS EE. mhi_intvec_handler is
> not called in response to mhi_cntrl->irq[1..N].
> 
> Additionally, I re-reviewed the MHI spec, and I don't see where the spec
> requires the device to issue an interrupt upon completion of the RESET
> request.
> 
> Under section 3.5, step 11 states -
> 
> "The host must poll for the value of the RESET bit to detect the completion
> of the reset procedure by the device (RESET is set to 0)."
> 

If this is the scenario then we need to change all of the wait_event_timeout()
implementation for MHI RESET in current stack to polling.

Or the interrupt generation is not defined in spec (sheet) but part of the
existing implementation?

Thanks,
Mani

> So, by this, my proposed solution appears to be spec compliant, where as
> what Hemant proposed is not.
> 
> > 
> > So, your below assumption is not true:
> >  >>>So, if we are in the PBL EE, we would expect to see the BHI
> > interrupt, but if we are in the AMSS EE, we would expect to see a MHI
> > interrupt.
> > 
> > At the start of mhi_async_power_up(), you've already registered for the
> > BHI interrupt as we do setup for IRQ and it is only unregistered from
> > power down if power up on the same cycle was a success.
> 
> You seem to have misunderstood my point.  If the BHI irq is only for BHI
> activity, which is activity restricted to the PBL EE, and the MHI
> interrupt(s) are restricted to MHI activity, which for the purposes of this
> discussion only occur in the AMSS EE, then my assumption is correct.  When
> the device is in PBL EE, we should only observe BHI irqs, and when the
> device is in AMSS EE, we should only observe MHI irqs.
> 
> This is a statement of what IRQ lines the device is raising, and not a
> statement of what handlers the host has, or has not registered.
> 
> Again, if the BHI irq is only generated in the PBL EE, and we rely on the
> BHI irq for "sensing" the state_event - we will never see the state_event in
> the AMSS EE, unless the same IRQ line is used for both MHI and BHI (which is
> only a select set of usecases, and not universal).
> 
> > 
> > On 4/10/20 8:03 AM, Jeffrey Hugo wrote:
> > > On 4/9/2020 6:55 PM, Hemant Kumar wrote:
> > > > 
> > > > On 4/7/20 9:50 AM, Jeffrey Hugo wrote:
> > > > > The MHI device may be in the syserr state when we attempt to init it in
> > > > > power_up().  Since we have no local state, the handling is simple -
> > > > > reset the device and wait for it to transition out of the reset state.
> > > > > 
> > > > > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > > > ---
> > > > >   drivers/bus/mhi/core/pm.c | 20 ++++++++++++++++++++
> > > > >   1 file changed, 20 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > > > index 52690cb..3285c9e 100644
> > > > > --- a/drivers/bus/mhi/core/pm.c
> > > > > +++ b/drivers/bus/mhi/core/pm.c
> > > > > @@ -9,6 +9,7 @@
> > > > >   #include <linux/dma-direction.h>
> > > > >   #include <linux/dma-mapping.h>
> > > > >   #include <linux/interrupt.h>
> > > > > +#include <linux/iopoll.h>
> > > > >   #include <linux/list.h>
> > > > >   #include <linux/mhi.h>
> > > > >   #include <linux/module.h>
> > > > > @@ -760,6 +761,7 @@ static void mhi_deassert_dev_wake(struct
> > > > > mhi_controller *mhi_cntrl,
> > > > >   int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
> > > > >   {
> > > > > +    enum mhi_state state;
> > > > >       enum mhi_ee_type current_ee;
> > > > >       enum dev_st_transition next_state;
> > > > >       struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > > > > @@ -829,6 +831,24 @@ int mhi_async_power_up(struct
> > > > > mhi_controller *mhi_cntrl)
> > > > >           goto error_bhi_offset;
> > > > >       }
> > > > > +    state = mhi_get_mhi_state(mhi_cntrl);
> > > > > +    if (state == MHI_STATE_SYS_ERR) {
> > > > > +        mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> > > > > +        ret = readl_poll_timeout(mhi_cntrl->regs + MHICTRL, val,
> > > > > +                     !(val & MHICTRL_RESET_MASK), 1000,
> > > > > +                     mhi_cntrl->timeout_ms * 1000);
> > > > can we use this instead of polling because MSI is configures and
> > > > int_vec handler is registered
> > > > 
> > > >      wait_event_timeout(mhi_cntrl->state_event,
> > > >                 MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
> > > >                mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
> > > >                            MHICTRL_RESET_MASK,
> > > >                            MHICTRL_RESET_SHIFT, &reset) || !reset ,
> > > >                 msecs_to_jiffies(mhi_cntrl->timeout_ms));
> > > > 
> > > > 1) In case of MHI_PM_IN_FATAL_STATE we would not be accessing MHI reg
> > > > 2) Consistent with current MHI driver code.
> > > 
> > > I'm not sure this works in the way you intend.
> > > 
> > > state_event is linked to the intvec, which is the BHI interrupt. I
> > > don't see that the state_event is triggered in the MHI interrupt
> > > path (mhi_irq_handler).  So, if we are in the PBL EE, we would
> > > expect to see the BHI interrupt, but if we are in the AMSS EE, we
> > > would expect to see a MHI interrupt.
> > > 
> > > Now, for my concerned usecase, those two interrupts happen to be the
> > > same interrupt, so both will get triggered, but I don't expect that
> > > to be the same for all usecases.
> > > 
> > > So, with the solution I propose, we exit the wait (poll loop) as
> > > soon as we see the register change values.
> > > 
> > > With the solution you propose, if we only get the MHI interrupt,
> > > we'll have to wait out the entire timeout value, and then check the
> > > register. In this scenario, we are almost guaranteed to wait for
> > > longer than necessary.
> > > 
> > > Did I miss something?
> > > 
> > > > > +        if (ret) {
> > > > > +            dev_info(dev, "Failed to reset MHI due to
> > > > > syserr state\n");
> > > > > +            goto error_bhi_offset;
> > > > > +        }
> > > > > +
> > > > > +        /*
> > > > > +         * device cleares INTVEC as part of RESET processing,
> > > > > +         * re-program it
> > > > > +         */
> > > > > +        mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> > > > > +    }
> > > > > +
> > > > >       /* Transition to next state */
> > > > >       next_state = MHI_IN_PBL(current_ee) ?
> > > > >           DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
> > > > 
> > > 
> > > 
> 
> 
> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
