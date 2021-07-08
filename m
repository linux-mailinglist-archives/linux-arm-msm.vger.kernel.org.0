Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184F63BF42F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 05:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhGHDJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 23:09:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:47314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230244AbhGHDJU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 23:09:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 798C061CD8;
        Thu,  8 Jul 2021 03:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625713599;
        bh=6F/8uwp0QQX/TuFD9rV5pWa6HQHl1QeOXWD67IOOPXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kWeyfZeoW/AuwHFhfWY4/QqzTpxxyWvDXzs4BA3H+zLIBZJmDQawjzG84hxk0CNjb
         fXZTksSQHcgHoZLvgfb48r/W+fnaeI5Dj/kAYhD758KEezh07/twAcgEtMOzKjZnsp
         Nh6Oam2QTd9DLovISUQ94dojHoheJ8TR9dd9K0vVJZ39bIowUMFEpD2UrQ0UDq7A0t
         LaVG7Iq0nC4JJQKPXnpK68jKARH4khEFxorxmBsFPtIrV6xUziJ91GjHmbDP+4Vu2S
         yRZqInAwNkA4OlF6YKcIH9D9HEnmqDEc3oC65lStsivWeoFCrHrSB1XMxHkqiqt02/
         HB28mhhiV5WKQ==
Date:   Thu, 8 Jul 2021 11:06:31 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <20210708030631.GA22420@nchen>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOX6d+sBEJMP4V3q@yoga>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-07-07 14:03:19, Bjorn Andersson wrote:
> On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
> 
> Allow me to reorder your two questions:
> 
> > And why using a notifier need to concern core's deferral probe?
> 
> The problem at hand calls for the core for somehow invoking
> dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
> 
> This means that dwc3-qcom somehow needs to inform the dwc3-core about
> this (and stash the pointer). And this can't be done until dwc3-core
> actually exist, which it won't until dwc3_probe() has completed
> successfully (or in particular allocated struct dwc).

Maybe you misunderstood the notifier I meant previous, my pointer was
calling glue layer API directly.

Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
allocated successfully, you could call glue layer notifier at function
dwc3_usb_role_switch_set directly.
Some references of my idea [1] [2]

[1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205

> 
> > Why do you think we need to retry the parent's probe again?
> 
> There's four options here:
> 
> 0) Hope that of_platform_populate() always succeeds in invoking
> dwc3_probe() on the first attempt, so that it is available when
> of_find_device_by_node() is invoked in dwc3_qcom_probe() (and a few of
> the other platform's drivers).
> 
> 1) Ensure that the operations performed by dwc3_probe() happens
> synchronously and return a failure to dwc3-qcom, which depending on how
> dwc3_probe() failed can propagate that failure - i.e. either probe defer
> or clean up its resources if the failure from dwc3-core is permanent.
> 
> 2) Register the dwc3-core and then return from dwc3_qcom_probe() in some
> half-initialized state and through some yet to be invented notification
> mechanism continue the tail of dwc3_qcom_probe() once dwc3_probe() has
> finished. But I know of no such notification mechanism in place today
> and we can just register a callback, because of 1).
> Furthermore we'd leave dwc3-qcom half-initialized until the dwc3-core is
> done probing - which might never happen.
> 
> 3) Make drvdata of all the platform drivers be some known struct that
> dwc3-core can retrieve and dereference - containing the optional
> callback to the role_switch callback.
> 
> 
> We've tried the option 0) for a few years now. Option 2) is a variant of
> what we have today, where we patch one problem up and hope that nothing
> unexpected happens until things has fully probed. We're doing 3) in
> various other places, but in my view it's abusing a void * and has to be
> kept synchronized between all the possible parent drivers.
> 
> Left is 1), which will take some refactoring, but will leave the
> interaction between the two drivers in a state that's very easy to
> reason about.

Function of_find_device_by_node() invoked at glue layer is usually successfully,
The dwc3_probe failure doesn't affect it, unless you enable auto-suspend,
and glue layer's runtime suspend routine depends on dwc3 core's runtime suspend
routine. Would you please describe more about dwc3-core probe failure causes
dwc3-qcom's probe has failed or in half-initialized state you said?

> 
> > I know there are some downstream code which using this way, I would
> > like to know the shortcoming for it.
> > 
> 
> The shortcoming of having dwc3_qcom_probe() invoke dwc3_probe()
> "manually" and then returning -EPROBE_DEFER if the dwc3-core's resources
> aren't yet available is that we're wasting some time tearing down the
> dwc3-qcom state and then re-initialize it next time this is attempted.

Like above, would you explain more about it?

-- 

Thanks,
Peter Chen

