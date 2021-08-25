Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1899D3F74D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 14:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240592AbhHYMNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 08:13:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232681AbhHYMNN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 08:13:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8450061178;
        Wed, 25 Aug 2021 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629893547;
        bh=iRrgIZb6x6gSLL+IvnF6y+vPYTBLqazRKlY69EWADXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RoPO65MJ9+AD30txEiQ/xi9V5vRY1bG7766W3m+mgMAVP5iDWTRSJHY1GdVjZ2MRT
         Gif9RhV+Ggd1cLqrOv7tMB0055pnVA7+eF++tDIeRbL1Ufs3ZblS/JAHzR2GzVwJBb
         uEK/Uts/a77alru9KwoLmg1JAbhCtx3KR6BmJ2R3xWsB8dPFey8PwY1/Rd8meZmf4o
         COH6+UDvLm7X6jx6l7UeqDTWgwrn83iZmCv3JrSzaj4K4afvAwBygWZwOxgfduD3lh
         x/UF835bi0ImxzAOWo5qTqCPBVoSkn9KaHxefr2t7gnLQw2RvLLvX2ceAlQjbmbUII
         EEf8edjBqFgZQ==
Received: by mail-ej1-f52.google.com with SMTP id n27so19120613eja.5;
        Wed, 25 Aug 2021 05:12:27 -0700 (PDT)
X-Gm-Message-State: AOAM531OGhAqZZSSd/bA8/uIIWDwyZP3hIYHM3ELWJEcUknHD81062qV
        kskP7WdgRB0rntQRMhT/ZzGtS0qVhW4Ngm/tpA==
X-Google-Smtp-Source: ABdhPJw1uKoHYgEW5cFrmwc+eFCDKj4S2M5gn7ug/tBjrGQfwSYcqOijKoq2GA1se3Wt3yYEwzzkHUPaGTXZK6PZyyo=
X-Received: by 2002:a17:906:ff41:: with SMTP id zo1mr15275941ejb.525.1629893546173;
 Wed, 25 Aug 2021 05:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga> <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper> <87zgt65avm.fsf@kernel.org>
In-Reply-To: <87zgt65avm.fsf@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 25 Aug 2021 07:12:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxm6P0KyYtUFvB5otR3BUkJN7dN89QixeWh67WoDtunA@mail.gmail.com>
Message-ID: <CAL_JsqLxm6P0KyYtUFvB5otR3BUkJN7dN89QixeWh67WoDtunA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to dwc3-qcom
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Gross, Andy" <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <jackp@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 25, 2021 at 12:52 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> > On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:
> >
> >> On 21-07-07 14:03:19, Bjorn Andersson wrote:
> >> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
> >> >
> >> > Allow me to reorder your two questions:
> >> >
> >> > > And why using a notifier need to concern core's deferral probe?
> >> >
> >> > The problem at hand calls for the core for somehow invoking
> >> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
> >> >
> >> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
> >> > this (and stash the pointer). And this can't be done until dwc3-core
> >> > actually exist, which it won't until dwc3_probe() has completed
> >> > successfully (or in particular allocated struct dwc).
> >>
> >> Maybe you misunderstood the notifier I meant previous, my pointer was
> >> calling glue layer API directly.
> >>
> >> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
> >> allocated successfully, you could call glue layer notifier at function
> >> dwc3_usb_role_switch_set directly.
> >> Some references of my idea [1] [2]
> >>
> >> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
> >> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
> >>
> >
> > Hi Peter, I took a proper look at this again, hoping to find a way to
> > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> > changes.
>
> I would rather keep the strict separation between glue and core.

On the surface that seems nice, but obviously there are issues with
the approach. It's also not how pretty much every other instance of
licensed IP blocks are structured.

The specific need here seems to be multiple entities needing role
switch notifications. Seems like that should be solved in a generic
way.

Rob
