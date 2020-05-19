Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9551DA2ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 22:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgESUl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 16:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgESUl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 16:41:26 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0753C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:41:26 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id z6so265918ooz.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2020 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=KqlY0HTT+IOHyYqsNVke69dYQGA7KHepidrczDemEV0=;
        b=QGdyhJkp1DdKBLPoQNQnIKYhC6fJq0diB6e3HUnQosmcbIHkLgsPCnpZZi9nhFUBFR
         ufALg9+CDJQTkIQruWIWbMiIcF8x8D/WIXcptC6CfuaVQF9VEhxW1ob6ud8UhpSGeqgZ
         0jEzm47h0mp5kRVqaZC50bC3SLA3QwhfruNp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=KqlY0HTT+IOHyYqsNVke69dYQGA7KHepidrczDemEV0=;
        b=rpVLTu41ynI8fSrFsSW4sQu+9p8qU0QKqSPvqbZ2ow/YJ4MurWvNHJa+8K7atgTC+i
         /BBofw8ijIbPeAGsMtiOQAARSZDq9sCmEU37No68LwksWintakpGcEFwfuiWKJrRvdV3
         LHXSE+3dHwUxkFdZ70D8D0VHzFc5HsRrseXqy2XhFf8+1nV7MzgLSIfDdrzVezEFhWhy
         3czw9A5e1Q9rwzJn5PaZvdjeVAunPzLWBTgz9XAhnPtuPn4q8L3AoAlt2/JjKiSb0Kaq
         rdRNQQo9MI7c0oRvw4I9VsWXOm8Mze+/qfFD1s5hfXVDt691+F809qUx26bKBXbuC7Iz
         uRvA==
X-Gm-Message-State: AOAM532+Nl7wjeprpEFVsk0GMJTf+OrEbL47Z1ZEXrDjIDYFgBhPldEM
        Lbr1eo4MD8rPyh/VcDLrIEEzNx29SQTbfaPnuouJQA==
X-Google-Smtp-Source: ABdhPJy+sQPtCXPvRCO/dG83ZBie1tD9S+4htYq0udq/GYRMDdPlJYAdylJ2iilHdgbiPgeFjf/3wmKXl3/gjVPYxwo=
X-Received: by 2002:a4a:d136:: with SMTP id n22mr785994oor.85.1589920886046;
 Tue, 19 May 2020 13:41:26 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 19 May 2020 22:41:15 +0200
Message-ID: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Olof Johansson <olof.johansson@gmail.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 07:41:20PM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 19, 2020 at 08:57:38AM -0600, Jeffrey Hugo wrote:
> > On 5/18/2020 11:08 PM, Dave Airlie wrote:
> > > On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > > >
> > > > Introduction:
> > > > Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
> > > > SoC ASIC for the purpose of efficently running Deep Learning inference
> > > > workloads in a data center environment.
> > > >
> > > > The offical press release can be found at -
> > > > https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
> > > >
> > > > The offical product website is -
> > > > https://www.qualcomm.com/products/datacenter-artificial-intelligence
> > > >
> > > > At the time of the offical press release, numerious technology news sites
> > > > also covered the product.  Doing a search of your favorite site is likely
> > > > to find their coverage of it.
> > > >
> > > > It is our goal to have the kernel driver for the product fully upstream.
> > > > The purpose of this RFC is to start that process.  We are still doing
> > > > development (see below), and thus not quite looking to gain acceptance quite
> > > > yet, but now that we have a working driver we beleive we are at the stage
> > > > where meaningful conversation with the community can occur.
> > >
> > >
> > > Hi Jeffery,
> > >
> > > Just wondering what the userspace/testing plans for this driver.
> > >
> > > This introduces a new user facing API for a device without pointers to
> > > users or tests for that API.
> >
> > We have daily internal testing, although I don't expect you to take my word
> > for that.
> >
> > I would like to get one of these devices into the hands of Linaro, so that
> > it can be put into KernelCI.  Similar to other Qualcomm products. I'm trying
> > to convince the powers that be to make this happen.
> >
> > Regarding what the community could do on its own, everything but the Linux
> > driver is considered proprietary - that includes the on device firmware and
> > the entire userspace stack.  This is a decision above my pay grade.
>
> Ok, that's a decision you are going to have to push upward on, as we
> really can't take this without a working, open, userspace.

Uh wut.

So the merge criteria for drivers/accel (atm still drivers/misc but I
thought that was interim until more drivers showed up) isn't actually
"totally-not-a-gpu accel driver without open source userspace".

Instead it's "totally-not-a-gpu accel driver without open source
userspace" _and_ you have to be best buddies with Greg. Or at least
not be on the naughty company list. Since for habanalabs all you
wanted is a few test cases to exercise the ioctls. Not the entire
userspace.

The most bonkers part here is that drivers/gpu actually does have a bunch
of active contributors from codeaurora ...

> Especially given the copyright owner of this code, that would be just
> crazy and foolish to not have open userspace code as well.  Firmware
> would also be wonderful as well, go poke your lawyers about derivative
> work issues and the like for fun conversations :)
>
> So without that changed, I'm not going to take this, and push to object
> that anyone else take this.
>
> I'm not going to be able to review any of this code anymore until that
> changes, sorry.

So you couldn't review the habanalabs driver either?

Get some consistency into your decision making as maintainer. And don't
tell me or anyone else that this is complicated, gpu and rdma driver folks
very much told you and Olof last year that this is what you're getting
yourself into.

Cheers, Daniel

PS: I guess congrats for figuring out you can't write a totally-not-a-gpu
accel driver without making kernel and userspace parts derivatives works
of each another. We told you that last year.
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
