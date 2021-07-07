Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F0E3BEFFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 21:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhGGTGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 15:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhGGTGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 15:06:03 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5B5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 12:03:22 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l21so4619686oig.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KaPa84ygk+ZcA+IJ9wP//R6Sdf66KLaVmf1OOXt+eKw=;
        b=EaMA37B8VTcVuwQu4Z9R//TNXKuPEFYvn9v63yOFjkiJJohvwjdmiOXDCULD5UoAtk
         7Kalmal7q9ccJcHax5+vk2t4yQO/kY4A3rdXVz9YWodlWW0/VW58Tp+241AK5jspCHmU
         gP0xDqGraXLDXxRFY/CwW81JApodt/k28dWrN3m/lHrah0dznplAXjwIeB5VpWosGPbh
         w9q1OX1x/D5KbaUiyBGbzuNgdcPaeXDsiPUORTkzWK4SUetYNiz4IWRCJpmEtp6IwS2/
         Xg1DaXZYV4N3gUj7geYF4d2mjMbZaNyaINKe5ZvTN4gmL8obuFpRobWlH2sre5g2FUUH
         Jfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KaPa84ygk+ZcA+IJ9wP//R6Sdf66KLaVmf1OOXt+eKw=;
        b=pPR9shLWt2S/L3eMArD73I670w5lNVGUexVwZFyNobno0t4uM/0DUHE0LCeJSPBFOO
         ZIguenXX1prhTj7AFfCscatFyjjlYdl0EFHHwomAdR6/6zCGyJ10/LvtWd7g0HctFDdz
         O5787ua6gw5snl4twI4AsqEy6GONaDevO8CXPYh/oWG4ENE9i/j/lHn/deAZSiyMAAUI
         rY9nc1FkAFHBRXEA0n5tMfIInJbY9cRa+FAME1he7/TNS6a1U2kLsVWcyPF1BxMRWcyz
         eVjLkOxFLeqnIG7EBmeJ8aTr5DywKgfwkyLglEAX5ErRNm4AtHHAON8PDXyKnV5IObef
         YXQA==
X-Gm-Message-State: AOAM533F0uPlT91eoI08eC7/LWSYydD6kFdEwUmBWHs6yj1em4gWZEMX
        XHX4e/T/i7KMXqZSUfwR3kFoPA==
X-Google-Smtp-Source: ABdhPJxSexRgy/TYKYqFmb8UjONCN7q/tdJupQ0Un9NIoyq8OMGPfaE1CWUFJSKXfysd0oOEa4DUZg==
X-Received: by 2002:a05:6808:200d:: with SMTP id q13mr20086393oiw.24.1625684602159;
        Wed, 07 Jul 2021 12:03:22 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21sm3668547ooe.36.2021.07.07.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 12:03:21 -0700 (PDT)
Date:   Wed, 7 Jul 2021 14:03:19 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YOX6d+sBEJMP4V3q@yoga>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707015704.GA28125@nchen>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:

> On 21-07-04 02:33:11, Bryan O'Donoghue wrote:
> > This is a topic we have been discussing for some time, initially in the
> > context of gpio usb-c-connector role-switching.
> > 
> > https://lore.kernel.org/linux-usb/20200311191501.8165-1-bryan.odonoghue@linaro.org
> > 
> > Hardware availability constraints limited scope to finish that off.
> > 
> > Thankfully Wesley Cheng made a new set of USB role-switch related patches
> > for dwc3-qcom, this time in conjunction with the qcom pm8150b type-c
> > silicon.
> > 
> > https://lore.kernel.org/linux-usb/20201009082843.28503-1-wcheng@codeaurora.org
> > 
> > For the RB5 project we picked Wesley's changes and developed them further,
> > around a type-c port manager.
> > 
> > As a precursor to that TCPM I reposted Wesley's patches
> > https://lore.kernel.org/linux-usb/20210629144449.2550737-1-bryan.odonoghue@linaro.org
> > 
> > Bjorn pointed out that having the role-switch triggered from dwc3-qcom to
> > dwc3-drd is not the right way around, indicating a preference for the
> > original notifier from dwc3-drd to dwc3-qcom.
> > 
> > There are two approaches I considred and prototyped to accomplish the
> > desired dwc3-drd -> dwc3-qcom messaging.
> > 
> > #1 Using a notifier in dwc3-drd to trigger dwc3-qcom
> > 
> >    This would be nice since it would accomplish the desired layering
> >    dwc3-drd -> dwc3-qcom.
> > 
> >    However:
> >    a) It would be a real mess as dwc3-qcom is the parent device of
> >       dwc3-core so, if the child-device dwc3-core deferred probing for
> >       whatever reason we would have to detect this and retry the parent's
> >       probe again.
> 

Allow me to reorder your two questions:

> And why using a notifier need to concern core's deferral probe?

The problem at hand calls for the core for somehow invoking
dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.

This means that dwc3-qcom somehow needs to inform the dwc3-core about
this (and stash the pointer). And this can't be done until dwc3-core
actually exist, which it won't until dwc3_probe() has completed
successfully (or in particular allocated struct dwc).

> Why do you think we need to retry the parent's probe again?

There's four options here:

0) Hope that of_platform_populate() always succeeds in invoking
dwc3_probe() on the first attempt, so that it is available when
of_find_device_by_node() is invoked in dwc3_qcom_probe() (and a few of
the other platform's drivers).

1) Ensure that the operations performed by dwc3_probe() happens
synchronously and return a failure to dwc3-qcom, which depending on how
dwc3_probe() failed can propagate that failure - i.e. either probe defer
or clean up its resources if the failure from dwc3-core is permanent.

2) Register the dwc3-core and then return from dwc3_qcom_probe() in some
half-initialized state and through some yet to be invented notification
mechanism continue the tail of dwc3_qcom_probe() once dwc3_probe() has
finished. But I know of no such notification mechanism in place today
and we can just register a callback, because of 1).
Furthermore we'd leave dwc3-qcom half-initialized until the dwc3-core is
done probing - which might never happen.

3) Make drvdata of all the platform drivers be some known struct that
dwc3-core can retrieve and dereference - containing the optional
callback to the role_switch callback.


We've tried the option 0) for a few years now. Option 2) is a variant of
what we have today, where we patch one problem up and hope that nothing
unexpected happens until things has fully probed. We're doing 3) in
various other places, but in my view it's abusing a void * and has to be
kept synchronized between all the possible parent drivers.

Left is 1), which will take some refactoring, but will leave the
interaction between the two drivers in a state that's very easy to
reason about.

> I know there are some downstream code which using this way, I would
> like to know the shortcoming for it.
> 

The shortcoming of having dwc3_qcom_probe() invoke dwc3_probe()
"manually" and then returning -EPROBE_DEFER if the dwc3-core's resources
aren't yet available is that we're wasting some time tearing down the
dwc3-qcom state and then re-initialize it next time this is attempted.

But as this is the idiomatic way to deal with the problem of "resources
not yet ready" there are mitigation being put in place to reduce the
number of such attempts being made.

Regards,
Bjorn

> Peter
> 
> >	The point in time that dwc3-qcom could potentially parse
> >       such a deferral in the child device is late. It would also be weird
> >       and messy to try to roll back the parent's probe because of a child
> >       device deferral.
> > 
> >       I considered making some sort of worker in the parent to check for
> >       child device probe but, again this seemed like an atrocious hack so,
> >       I didn't even try to prototype that.
> > 
> >    b) One potential solution was using "__weak" linkage in a function
> >       provided by dwc3-drd that a wrapper such as dwc3-qcom could then
> >       over-ride.
> > 
> >       If a wrapper such as dwc3-qcom then implemented a function with
> >       regular linkage it would over-ride the __weak function and provide a
> >       method for the dwc3-drd code to call into dwc3-qcom when probing was
> >       complete, thus allowing registration of the notifier when the child
> >       was ready.
> > 
> >       This would work up until the point that you tried to compile two
> >       implementations of a dwc3 wrapper into the one kernel module or the
> >       one kernel image say dwc3-qcom and a similar implementation in
> >       dwc3-meson. At that point you would get linker breakage.
> > 
> > #2 Using USB role switching for the notification
> > 
> >    Wesley's implementation took the approach dwc3-qcom -> dwc3-drd, whereas
> >    the approach I'm proposing here is dwc3-drd -> dwc3-qcom, which is also
> >    what we discussed on the list.
> > 
> >    Having implemented it, I think USB role-switching in the direction
> >    dwc3-drd -> dwc3-qcom is also a much cleaner solution for several
> >    reasons.
> > 
> >    a) Handling probe deferral is built into Linux' USB role switching today
> >       so we don't have to re-invent that wheel, unlike with the original
> >       notifier model.
> > 
> >    b) There is no "wiring up" or traversing the graph tree for the wrapper
> >       layer to determine if the parent device has a compliant type-c
> >       connector associated with it, unlike in the dwc3-qcom -> dwc3-drd
> >       model.
> > 
> >       All that has to happen is "usb-role-switch" is declared in the parent
> >       dwc3-qcom node and the role-switch API takes care of the rest.
> > 
> >       That means its possible to use a usb-c-connector, qcom type-c pm8150b
> >       driver, a USCI, a tps659x, a fusb302 or something like ChromeOS
> >       cros_ec to notify dwc3-drd without dwc3-qcom having to have
> >       the slighest clue which type of device is sending the signal.
> > 
> >       All dwc3-qcom needs to do is waggle UTMI signals in a register when a
> >       role-switch happens.
> > 
> >    c) It "feels" like a layering violation to have the dwc3-qcom SoC
> >       wrapper receive the event and trigger the dwc3-drd core.
> > 
> >       The standard model of parent/child role switching or remote-endpoint
> >       traversal that USB role switching already has works just fine for
> >       dwc3-drd, we just need to trigger dwc3-qcom for the role-switch in a
> >       non-vendor and non-SoC specific way.
> > 
> >    d) Less code. It turns out there's less code implementing as a
> >       role-switch interface in the direction dwc3-drd -> dwc3-qcom.
> > 
> >    e) Portability. The mechanism used for dwc3-drd -> dwc3 qcom can be
> >       reused for any other similar wrapper which models the wrapper as a
> >       parent of the dwc3-drd.
> > 
> > For all of those reasons I've opted to use USB role-switch notification
> > from dwc3-drd to dwc3-qcom.
> > 
> > git add bod git://git.linaro.org/people/bryan.odonoghue/kernel.git
> > git fetch bod
> > git diff usb-next-5.13.rcx-rb5-tcpm..usb-next-5.13.rcx-rb5-tcpm-v2
> > 
> > Bryan O'Donoghue (2):
> >   usb: dwc3: Add role switch relay support
> >   usb: dwc3: dwc3-qcom: Make dwc3-qcom a role-switch signal recipient
> > 
> > Wesley Cheng (1):
> >   usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API
> > 
> >  drivers/usb/dwc3/core.h      |  2 +
> >  drivers/usb/dwc3/drd.c       | 10 +++++
> >  drivers/usb/dwc3/dwc3-qcom.c | 77 ++++++++++++++++++++++++++++++++++--
> >  3 files changed, 85 insertions(+), 4 deletions(-)
> > 
> > -- 
> > 2.30.1
> > 
> 
> -- 
> 
> Thanks,
> Peter Chen
> 
