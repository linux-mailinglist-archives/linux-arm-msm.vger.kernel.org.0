Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B073BF459
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 05:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhGHD5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 23:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhGHD5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 23:57:33 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D77C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 20:54:51 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id s24so6263672oiw.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 20:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1qXP4gtbwHean/LQ/A6mORbEga74iVgJefmkV0boO/o=;
        b=si31gLEvqYGYco6O5bFhQ2Bnvs/gPuJrl9RTa4vPZxZUVOvDYjEIzdIW0oFSRT/g5o
         ITdbIxAx1XK7KFXabjNBZ+kAKBI2v5auH235i3tnfQKVhH7LtUHt1aurZMzKJJLsBXPf
         AKIY6gTXe+F4lKWPHw+apAG++whbqH3aKtXr1OWkINDPr0o9sXQXl43ju7sDWdjM7zAu
         EeF1lgQLdP3qm91tkN9WlLIazHCR8fYOcSF4Q389WHrdt8AO2kBwjGxH9QLsR9LuJmIA
         3Qt1ztSo1QsHcscV1QtIpJZYMRmBew22Ia/eV7SvBVkik9Jm+XXwhaqBjgp5duEfno9Y
         qoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1qXP4gtbwHean/LQ/A6mORbEga74iVgJefmkV0boO/o=;
        b=pfVSOX0b+8L7M4gOXMvTMFrQJOmO76Ijc+PxjTsEWxwn2dzaXvJP00XqVVQDEUFlad
         ObJWxDTUKZvJ3IRbxLWHmdlrRA8IqXnYFYOm+ybEdgclYFO0KGJN47DPKds8Mn/QakFn
         A4O7vx4u1NHekHnr1mmU9U2d+XFOli8sLFn2ZigASyjtVz/ferZtxEde1X5e38CZ1+M1
         eWVgPvdsivTOsm6/gOFWNOtJCSepd1euJrCmvecjthSK1ar0FLLewocIyQ3BP5u28+AB
         B3ppgr4r+KysJazbN78zpN2f9lixQbEQYw6sxgdOUXHaxyOw6MfEUa5Ke5H73D2QYI9T
         YvLQ==
X-Gm-Message-State: AOAM531huH764G1+2Sc0kPtq2D6x5xITn0XM8Iy72ZoU34mEUQx1CB+k
        vxwraa2Dbq7k5la56phC8MbDoA==
X-Google-Smtp-Source: ABdhPJz6dqndkSMk9k2kNwCfD6s5M9qBXZXyu0xMsZdS13hBWBzEpugfp9/4+OHdPKNX/hw3wAqzkQ==
X-Received: by 2002:aca:4f53:: with SMTP id d80mr2050390oib.111.1625716491265;
        Wed, 07 Jul 2021 20:54:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v7sm189855ooj.46.2021.07.07.20.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 20:54:50 -0700 (PDT)
Date:   Wed, 7 Jul 2021 22:54:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YOZ3CBNTXFTa+fNx@yoga>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708030631.GA22420@nchen>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Jul 22:06 CDT 2021, Peter Chen wrote:

> On 21-07-07 14:03:19, Bjorn Andersson wrote:
> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
> > 
> > Allow me to reorder your two questions:
> > 
> > > And why using a notifier need to concern core's deferral probe?
> > 
> > The problem at hand calls for the core for somehow invoking
> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
> > 
> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
> > this (and stash the pointer). And this can't be done until dwc3-core
> > actually exist, which it won't until dwc3_probe() has completed
> > successfully (or in particular allocated struct dwc).
> 
> Maybe you misunderstood the notifier I meant previous, my pointer was
> calling glue layer API directly.
> 
> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
> allocated successfully, you could call glue layer notifier at function
> dwc3_usb_role_switch_set directly.
> Some references of my idea [1] [2]
> 

It's probably 5+ years since I ran into something using platform_data,
had totally forgotten about it.

Defining a dwc3_platdata to allow the glue drivers to pass a function
pointer (and Wesley's bool) to the core driver sounds like a possible
way out of this.

> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
> 
> > 
> > > Why do you think we need to retry the parent's probe again?
> > 
> > There's four options here:
> > 
> > 0) Hope that of_platform_populate() always succeeds in invoking
> > dwc3_probe() on the first attempt, so that it is available when
> > of_find_device_by_node() is invoked in dwc3_qcom_probe() (and a few of
> > the other platform's drivers).
> > 
> > 1) Ensure that the operations performed by dwc3_probe() happens
> > synchronously and return a failure to dwc3-qcom, which depending on how
> > dwc3_probe() failed can propagate that failure - i.e. either probe defer
> > or clean up its resources if the failure from dwc3-core is permanent.
> > 
> > 2) Register the dwc3-core and then return from dwc3_qcom_probe() in some
> > half-initialized state and through some yet to be invented notification
> > mechanism continue the tail of dwc3_qcom_probe() once dwc3_probe() has
> > finished. But I know of no such notification mechanism in place today
> > and we can just register a callback, because of 1).
> > Furthermore we'd leave dwc3-qcom half-initialized until the dwc3-core is
> > done probing - which might never happen.
> > 
> > 3) Make drvdata of all the platform drivers be some known struct that
> > dwc3-core can retrieve and dereference - containing the optional
> > callback to the role_switch callback.
> > 
> > 
> > We've tried the option 0) for a few years now. Option 2) is a variant of
> > what we have today, where we patch one problem up and hope that nothing
> > unexpected happens until things has fully probed. We're doing 3) in
> > various other places, but in my view it's abusing a void * and has to be
> > kept synchronized between all the possible parent drivers.
> > 
> > Left is 1), which will take some refactoring, but will leave the
> > interaction between the two drivers in a state that's very easy to
> > reason about.
> 
> Function of_find_device_by_node() invoked at glue layer is usually successfully,

Went spelunking in drivers/base again, and I think you're right.

of_find_device_by_node() looks for devices on the platform_bus's klist
of devices, so if of_platform_populate() ends up successfully getting
through device_add() the we will find something. It might not have
probed yet, but as long as we don't rely on that we should be good...

> The dwc3_probe failure doesn't affect it, unless you enable auto-suspend,
> and glue layer's runtime suspend routine depends on dwc3 core's runtime suspend
> routine.

Right, if we hit qcom_dwc3_resume_irq() before the core driver has
probed it certainly looks like we're going to hit a NULL pointer.

> Would you please describe more about dwc3-core probe failure causes
> dwc3-qcom's probe has failed or in half-initialized state you said?
> 

Bryan had a previous patch where the glue layer was notified about role
switching (iirc) and as soon as we hit a probe deferal in the core
driver we'd dereference some pointer in the glue layer. I don't find the
patch right now, but I suspect it might have been caused by the same
platform_get_drvdata() as we see in qcom_dwc3_resume_irq().

> > 
> > > I know there are some downstream code which using this way, I would
> > > like to know the shortcoming for it.
> > > 
> > 
> > The shortcoming of having dwc3_qcom_probe() invoke dwc3_probe()
> > "manually" and then returning -EPROBE_DEFER if the dwc3-core's resources
> > aren't yet available is that we're wasting some time tearing down the
> > dwc3-qcom state and then re-initialize it next time this is attempted.
> 
> Like above, would you explain more about it?
> 

I could, but I guess if we use platform_data to pass the callbacks to
the core it doesn't matter if the core driver probes synchronously or in
a week (except if the glue hits qcom_dwc3_resume_irq(), but if that can
happen it can be fixed separately)...

Regards,
Bjorn
