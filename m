Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9C43F7A97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 18:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241662AbhHYQcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 12:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241390AbhHYQcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 12:32:51 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9419BC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 09:32:05 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t35so126632oiw.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iyZ0YUaYjK9x5P/A83iXmFuX3wEI6dD5JCZ4X2lvVG4=;
        b=LtR5LU6RWAY04ix4rtC9F31eamHa4Pw+I7AruZGH0DFu6xw9pKqQoUi8GQO9qtMx3d
         9VBzOncleEj2EeKwJDEBuy1qzuI+RCLeqNnXXHzlH0MRvtKLQ/awJury+qHtLnmaK+Uo
         Gjo3QzAX+As4RCFe4SD6WWPC7BEmFQdZt6Ts6Lbd9qB+Gvu5MZbCxItnO6CFioCPJ2yB
         eZ5WNWD5ood6okslFoYRiZRvFRCFzqUOzb/Kilxb72h8EJw+/E8pmPj9PtMueiBpdRQo
         Yrn0oQivtnFM/yMEhYgRsOOg6hUseWZuC7QK+QTi/KUpeSZp4J1jdGe3jaCk8sM5gdHH
         TDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iyZ0YUaYjK9x5P/A83iXmFuX3wEI6dD5JCZ4X2lvVG4=;
        b=BRMu3mVOQOjXqyHevkr08bNnAt7GiJO7f6qHIBt+hnisHhKrZG07gF0ZlSEP/o1TEs
         z2fHi4U/EhI2rN5yV4816AhAzIiG/PZzK1Kwd16nsvlDNEU5Cr1zCPA+u8EAAEc5bOZn
         EOwG2FNUW56JPgc9BwIwq/UJgiNWAlu72AeD1PzkQPK4I+EpUs7+4wDpR8L6vF993ymr
         qHzcwRF5lfGh2Gqzh21mSvWlwsCVp83fOYJahpyfV0sRTatmM38atvBu7jZCSDmnukJE
         G5eJjXJv4GipifgVBKYF6pySYQ9Z+qKgOGoiZD5muikSQdTtVcIAEJs73IkRcwmsMnAm
         T7pA==
X-Gm-Message-State: AOAM5334DNd2KQSVujeOVbYG2+U9624e6h+X4x7XDwsagS5ubQIVabxI
        bxJZYp2chTH4wWf+uKVrX67KuQ==
X-Google-Smtp-Source: ABdhPJw7MpYhscF4WTcEjQWcDliFD36W5hjVENt1CL0UQFlWUGR7yiYd6WzfvgjWZuKydN9nRyD9/A==
X-Received: by 2002:aca:3857:: with SMTP id f84mr7432889oia.96.1629909124727;
        Wed, 25 Aug 2021 09:32:04 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 67sm47099ota.70.2021.08.25.09.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:32:04 -0700 (PDT)
Date:   Wed, 25 Aug 2021 09:33:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSZw0LGNji8JvQUa@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <YSZCmDEedJaJyI0u@ripper>
 <87mtp5a6ix.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtp5a6ix.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 25 Aug 08:22 PDT 2021, Felipe Balbi wrote:

> 
> Hi,
> 
> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >> > On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:
> >> >
> >> >> On 21-07-07 14:03:19, Bjorn Andersson wrote:
> >> >> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
> >> >> > 
> >> >> > Allow me to reorder your two questions:
> >> >> > 
> >> >> > > And why using a notifier need to concern core's deferral probe?
> >> >> > 
> >> >> > The problem at hand calls for the core for somehow invoking
> >> >> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
> >> >> > 
> >> >> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
> >> >> > this (and stash the pointer). And this can't be done until dwc3-core
> >> >> > actually exist, which it won't until dwc3_probe() has completed
> >> >> > successfully (or in particular allocated struct dwc).
> >> >> 
> >> >> Maybe you misunderstood the notifier I meant previous, my pointer was
> >> >> calling glue layer API directly.
> >> >> 
> >> >> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
> >> >> allocated successfully, you could call glue layer notifier at function
> >> >> dwc3_usb_role_switch_set directly.
> >> >> Some references of my idea [1] [2]
> >> >> 
> >> >> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
> >> >> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
> >> >> 
> >> >
> >> > Hi Peter, I took a proper look at this again, hoping to find a way to
> >> > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> >> > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> >> > changes.
> >> 
> >> I would rather keep the strict separation between glue and core.
> >> 
> >
> > I'm okay with that goal, but the result is that both the OMAP and
> > Qualcomm driver duplicates the extcon interface already present in the
> > DRD, and the Meson driver duplicates the usb_role_switch. In addition to
> > the code duplication this manifest itself in the need for us to link
> > extcon to both the glue and core nodes in DeviceTree.
> >
> > In order to function in a USB-C based setup we now need to register a 
> > usb_role_switch from the Qualcomm glue and we need to evolve the
> > usb_role_switch implementation to allow for the Type-C controller to
> > notify more than a single role-switcher.
> >
> > So we're facing the need to introduce another bunch of duplication and
> > the DT will be quite ugly with both glue and core having to set up an
> > of_graph with the Type-C controller.
> >
> >
> > I really would like for us to come up with a way where the core can
> > notify the glue that role switching is occurring, so that we instead of
> > adding more duplication could aim to, over time, remove the extcon and
> > usb_role_switch logic from the Qualcomm, OMAP and Meson drivers.
> 
> We can make a comparison between clk rate notifiers. Anyone can
> subscribe to a clk rate notification and react to the notification. A
> generic dual role notification system should allow for something
> similar. I really don't get why folks want to treat a glue and core
> driver differently in this case.
> 
> Why do we want to pass function pointers around instead of letting
> whatever role notification mechanism to be able to notify more than one
> user?
> 
> Also keep in mind that we have dwc3 implementations which are dual role
> capable but don't ship the synopsys DRD block. Rather, there's a
> peripheral-only dwc3 instance and a separate xhci with custom logic
> handling role swap.
> 

So you're suggesting that we invent a 3rd mechanism (in addition to the
already existing duplication between extcon and usb_role_switch) for
propagating role switching notifications through the kernel?

> If we were to provide a dwc3-specific role swap function-pointer based
> interface, we would just create yet another special case for this. A
> better approach would be to start consolidating all of these different
> role-swap mechanisms in a generic layer that "knows-it-all". If dwc3 is
> generating the role notification or a separate type-c controller or even
> some EC IRQ, that shouldn't matter for the listeners.
> 

I was under the impression that usb_role_switch is the attempt to
replace extcon as the one solution. The problem in the dwc3 case is that
the same piece of hardware (i.e. _the_ USB controller) needs to
implement and wired up as two separate consumers of that message.

I recognize the complexity caused by the flexibility in DWC3 based
designs, but I would like to see whatever combination be seen as a
single entity to the rest of the system - rather than building the
notification plumbing between the two pieces using DeviceTree.

Regards,
Bjorn
