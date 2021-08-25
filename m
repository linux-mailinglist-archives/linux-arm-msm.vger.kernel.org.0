Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A193F7842
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 17:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241008AbhHYP2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 11:28:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:33236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240735AbhHYP2l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 11:28:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2B5161052;
        Wed, 25 Aug 2021 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629905275;
        bh=bVKCJUpCCNY0q/iaIznbUuRHh87Y8W0hrWtIM2XmI74=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=d/RDNQYbCkvMJmdz1J86Hrx/cNcbICylPjJe4qormGeWay6gkoN4V4LM3Y20i27+T
         pvPFQoi2YuoIr8o7ivF9t8CE7k9HuQuEUxDaEnvpfhCCfK4ilLzdFQFHWpGsKsV4wB
         Z6fpqg7T+GTRKu3rhJozkbctvcJeUEORhYKCoaK0RRPVpWBIOU5wcIu4SsNrj1rjJv
         /yVfAufOxENOOpC7z7DDPv8C/Rc3Z16xBBq7VDtJLzrRJbhVZhi0Nvbgu2hOjgkWKH
         iRwzqhqj+m7U8LKT3bsLSgHbQAWNsNJqLcPnntoNMPi2HsYjInERYRo/aiXBsyJAdH
         7Dq2CIgJQ+d8w==
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org> <YSZCmDEedJaJyI0u@ripper>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd
 to dwc3-qcom
Date:   Wed, 25 Aug 2021 18:22:20 +0300
In-reply-to: <YSZCmDEedJaJyI0u@ripper>
Message-ID: <87mtp5a6ix.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> > On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:
>> >
>> >> On 21-07-07 14:03:19, Bjorn Andersson wrote:
>> >> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
>> >> > 
>> >> > Allow me to reorder your two questions:
>> >> > 
>> >> > > And why using a notifier need to concern core's deferral probe?
>> >> > 
>> >> > The problem at hand calls for the core for somehow invoking
>> >> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
>> >> > 
>> >> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
>> >> > this (and stash the pointer). And this can't be done until dwc3-core
>> >> > actually exist, which it won't until dwc3_probe() has completed
>> >> > successfully (or in particular allocated struct dwc).
>> >> 
>> >> Maybe you misunderstood the notifier I meant previous, my pointer was
>> >> calling glue layer API directly.
>> >> 
>> >> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
>> >> allocated successfully, you could call glue layer notifier at function
>> >> dwc3_usb_role_switch_set directly.
>> >> Some references of my idea [1] [2]
>> >> 
>> >> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
>> >> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
>> >> 
>> >
>> > Hi Peter, I took a proper look at this again, hoping to find a way to
>> > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
>> > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
>> > changes.
>> 
>> I would rather keep the strict separation between glue and core.
>> 
>
> I'm okay with that goal, but the result is that both the OMAP and
> Qualcomm driver duplicates the extcon interface already present in the
> DRD, and the Meson driver duplicates the usb_role_switch. In addition to
> the code duplication this manifest itself in the need for us to link
> extcon to both the glue and core nodes in DeviceTree.
>
> In order to function in a USB-C based setup we now need to register a 
> usb_role_switch from the Qualcomm glue and we need to evolve the
> usb_role_switch implementation to allow for the Type-C controller to
> notify more than a single role-switcher.
>
> So we're facing the need to introduce another bunch of duplication and
> the DT will be quite ugly with both glue and core having to set up an
> of_graph with the Type-C controller.
>
>
> I really would like for us to come up with a way where the core can
> notify the glue that role switching is occurring, so that we instead of
> adding more duplication could aim to, over time, remove the extcon and
> usb_role_switch logic from the Qualcomm, OMAP and Meson drivers.

We can make a comparison between clk rate notifiers. Anyone can
subscribe to a clk rate notification and react to the notification. A
generic dual role notification system should allow for something
similar. I really don't get why folks want to treat a glue and core
driver differently in this case.

Why do we want to pass function pointers around instead of letting
whatever role notification mechanism to be able to notify more than one
user?

Also keep in mind that we have dwc3 implementations which are dual role
capable but don't ship the synopsys DRD block. Rather, there's a
peripheral-only dwc3 instance and a separate xhci with custom logic
handling role swap.

If we were to provide a dwc3-specific role swap function-pointer based
interface, we would just create yet another special case for this. A
better approach would be to start consolidating all of these different
role-swap mechanisms in a generic layer that "knows-it-all". If dwc3 is
generating the role notification or a separate type-c controller or even
some EC IRQ, that shouldn't matter for the listeners.

-- 
balbi
