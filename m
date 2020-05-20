Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561961DAD8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 10:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETIeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 04:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETIeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 04:34:31 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2430BC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:34:31 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id l6so2218583oic.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1L1JOS2/7OGTnjyzE28TzRr49jWHnoSPZa2y83NoajY=;
        b=Qn5uiJsI1CiTUY1rMY/hdjYr4HiyDhfSz/K8IUT9Ct0Li9bZDcjTdmeeXfA+hvr4ye
         La4sGIwutRbBBmkURH52DondGQmalrdmlRIin7Ill0HhbtbF6vFYpxeVZtTbZ9uc0pM2
         QzWq0FNBS5CUP5cJj0ELZ9iBqOymG/dGQAeYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1L1JOS2/7OGTnjyzE28TzRr49jWHnoSPZa2y83NoajY=;
        b=RbQHU0TcK/Z8ul+U+FQO6OmSjJqDkKqnUEZNxhy2bnkFBcy6yXXiTNjKnkg4hg79Ix
         Vq6agNUx6yHYvNhLxbe/LHJdZWOrVblToJC6dvAUNyHGL4C+jv4t1fJGWA1sE9Cn+fh5
         skGMjuGV5DqGMPm04MwgeCtDuQYUSOK2QTtA3Pacg4lm/Hut2KZnWF4q26XMh/KOnlOl
         BV7lZUXqILGPBm1GPvIWTZp6rvmuucjJj1CjYGKNQPuUF5RQKynRr7oVEehUwe4tFmH4
         xPpHALGPdoEcXVLkMrfvqmAi1w9Gu5YDJfRAbnRLTMnlblI1gBr6AP0Ipbu05kDJOR7p
         ZAcQ==
X-Gm-Message-State: AOAM532IshFP5UpaZuPCCr0WXKAnhxPS0yJtKZYvQQXawEJDEsDGh6AC
        M6/gi+zQRjlTDP1Kn2dtEdxCzW+Y2AqjN4jSoPl0VA==
X-Google-Smtp-Source: ABdhPJzRbDLGTxxiGJOBqDYbay1jUZRZiOz0ftQQbB6lk0Qs5tbLJUocvqI+dvatbwDgQkZMRCmeij1RrgUlJ6saFTg=
X-Received: by 2002:a05:6808:282:: with SMTP id z2mr2215511oic.101.1589963670477;
 Wed, 20 May 2020 01:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
 <20200520051536.GA2141566@kroah.com>
In-Reply-To: <20200520051536.GA2141566@kroah.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 20 May 2020 10:34:19 +0200
Message-ID: <CAKMK7uEbwTK68sxhf452fPHzAreQqRbRc7=RLGX-9SesXnJnLQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Olof Johansson <olof.johansson@gmail.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
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

On Wed, May 20, 2020 at 7:15 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> > On Tue, May 19, 2020 at 07:41:20PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, May 19, 2020 at 08:57:38AM -0600, Jeffrey Hugo wrote:
> > > > On 5/18/2020 11:08 PM, Dave Airlie wrote:
> > > > > On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > > > > >
> > > > > > Introduction:
> > > > > > Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
> > > > > > SoC ASIC for the purpose of efficently running Deep Learning inference
> > > > > > workloads in a data center environment.
> > > > > >
> > > > > > The offical press release can be found at -
> > > > > > https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
> > > > > >
> > > > > > The offical product website is -
> > > > > > https://www.qualcomm.com/products/datacenter-artificial-intelligence
> > > > > >
> > > > > > At the time of the offical press release, numerious technology news sites
> > > > > > also covered the product.  Doing a search of your favorite site is likely
> > > > > > to find their coverage of it.
> > > > > >
> > > > > > It is our goal to have the kernel driver for the product fully upstream.
> > > > > > The purpose of this RFC is to start that process.  We are still doing
> > > > > > development (see below), and thus not quite looking to gain acceptance quite
> > > > > > yet, but now that we have a working driver we beleive we are at the stage
> > > > > > where meaningful conversation with the community can occur.
> > > > >
> > > > >
> > > > > Hi Jeffery,
> > > > >
> > > > > Just wondering what the userspace/testing plans for this driver.
> > > > >
> > > > > This introduces a new user facing API for a device without pointers to
> > > > > users or tests for that API.
> > > >
> > > > We have daily internal testing, although I don't expect you to take my word
> > > > for that.
> > > >
> > > > I would like to get one of these devices into the hands of Linaro, so that
> > > > it can be put into KernelCI.  Similar to other Qualcomm products. I'm trying
> > > > to convince the powers that be to make this happen.
> > > >
> > > > Regarding what the community could do on its own, everything but the Linux
> > > > driver is considered proprietary - that includes the on device firmware and
> > > > the entire userspace stack.  This is a decision above my pay grade.
> > >
> > > Ok, that's a decision you are going to have to push upward on, as we
> > > really can't take this without a working, open, userspace.
> >
> > Uh wut.
> >
> > So the merge criteria for drivers/accel (atm still drivers/misc but I
> > thought that was interim until more drivers showed up) isn't actually
> > "totally-not-a-gpu accel driver without open source userspace".
> >
> > Instead it's "totally-not-a-gpu accel driver without open source
> > userspace" _and_ you have to be best buddies with Greg. Or at least
> > not be on the naughty company list. Since for habanalabs all you
> > wanted is a few test cases to exercise the ioctls. Not the entire
> > userspace.
>
> Also, to be fair, I have changed my mind after seeing the mess of
> complexity that these "ioctls for everyone!" type of pass-through
> these kinds of drivers are creating.  You were right, we need open
> userspace code in order to be able to properly evaluate and figure out
> what they are doing is right or not and be able to maintain things over
> time correctly.
>
> So I was wrong, and you were right, my apologies for my previous
> stubbornness.

Awesome and don't worry, I'm pretty sure we've all been stubborn
occasionally :-)

From a drivers/gpu pov I think still not quite there since we also
want to see the compiler for these programmable accelerator thingies.
But just having a fairly good consensus that "userspace library with
all the runtime stuff excluding compiler must be open" is a huge step
forward. Next step may be that we (kernel overall, drivers/gpu will
still ask for the full thing) have ISA docs for these programmable
things, so that we can also evaluate that aspect and gauge how many
security issues there might be. Plus have a fighting chance to fix up
the security leaks when (post smeltdown I don't really want to
consider this an if) someone finds a hole in the hw security wall. At
least in drivers/gpu we historically have a ton of drivers with
command checkers to validate what userspace wants to run on the
accelerator thingie. Both in cases where the hw was accidentally too
strict, and not strict enough.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
