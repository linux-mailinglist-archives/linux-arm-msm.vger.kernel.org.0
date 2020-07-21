Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A122289E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 22:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbgGUU1B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 16:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730021AbgGUU1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 16:27:00 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6705BC0619DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 13:27:00 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id m21so51282vkp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KLCByWF4yLz2SmZ5rErGQplCKH4CPMVPAEbJkDh8hXg=;
        b=Q1goVVRy0qIKIyOTfwTHQM8HUc5zxIwUwDM+oHWmOwuqPRrbRupgAs25ujIwSPdoz5
         1M6Zj7yl2+wNwXwZqkRzsITMucTg+XuAkgiInPP/IjjvqA8bHsxKyojhuHc+3CbEYWsS
         nkc34p1lczVQ3GD1B7C3Ty7SgYCP5T9b0dvGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KLCByWF4yLz2SmZ5rErGQplCKH4CPMVPAEbJkDh8hXg=;
        b=uKo9p2jKgaKj39giIyMATc6lndSKEl2pic3ZX/K+wNnMQg4VhN4Abak/jZXlQHBzCq
         SpTbHxSDxXXrmW8UsD6mN+BAOVJCzHMYIZLR9ap1T0Ik0q7j1wnl+sPBNFjMcFupsk2+
         zCkV++xIm6meG6FjOwy36y6cYb/zYmmITepfua47x1MkdRm6EIhNnyhXE84wJ/zt4C6P
         f1NvZJgmVR2o/fhFUXrzErC1RHAF4xJo7O2/9L+FYDWU7LAOH5B5N3OcX+iv1ljSKPDb
         PKGzBOdSAL6W3J4vj4ZFk8nRB/FZu2HteU1htsnCzFgiQPozax4LtiQ9N9n4RvedHI2Z
         j/Ug==
X-Gm-Message-State: AOAM530W2fleUnX6sZ0WF4DnIczQGkM19HU6RWPd741RmdEF17zxT7tj
        B6cNOxTumOyQ+dMfjGNIGybMCljxxCY=
X-Google-Smtp-Source: ABdhPJxyuB0c0YV81dkpmc3uSGz2wJ1F4ioeRmdwfeSuSfwDdoDjTxYAJabAUzmRwL9QQ1DVQaDmHw==
X-Received: by 2002:a1f:185:: with SMTP id 127mr22566179vkb.102.1595363219003;
        Tue, 21 Jul 2020 13:26:59 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id f7sm2797107vso.5.2020.07.21.13.26.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 13:26:58 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id q15so6666806uap.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 13:26:57 -0700 (PDT)
X-Received: by 2002:a9f:3dc6:: with SMTP id e6mr22533941uaj.104.1595363217358;
 Tue, 21 Jul 2020 13:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com>
 <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
 <CAD=FV=X=NDym3V31dQ8c341UwQm9pDybUCR8jFF1JR99XeVKVw@mail.gmail.com> <159535775253.3847286.5195740102798837524@swboyd.mtv.corp.google.com>
In-Reply-To: <159535775253.3847286.5195740102798837524@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 21 Jul 2020 13:26:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhsPkaB_cLNzGuuBrAEHiyrM9TGGvhUY4+0C=SzWwsHA@mail.gmail.com>
Message-ID: <CAD=FV=WhsPkaB_cLNzGuuBrAEHiyrM9TGGvhUY4+0C=SzWwsHA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 21, 2020 at 11:55 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-07-21 09:18:35)
> > On Tue, Jul 21, 2020 at 12:08 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Stephen Boyd (2020-07-20 22:59:14)
> > > >
> > > > I worry that we also need a dmb() here to make sure the dma buffer is
> > > > properly mapped before this write to the device is attempted. But it may
> > > > only matter to be before the I2C_READ.
> > > >
> > >
> > > I'm suggesting this patch instead where we make geni_se_setup_m_cmd()
> > > use a writel() so that it has the proper barrier semantics to wait for
> > > the other memory writes that happened in program order before this point
> > > to complete before the device is kicked to do a read or a write.
> >
> > Are you saying that dma_map_single() isn't guaranteed to have a
> > barrier or something?  I tried to do some searching and found a thread
> > [1] where someone tried to add a barrierless variant of them.  To me
> > that means that the current APIs have barriers.
> >
> > ...or is there something else you're worried about?
>
> I'm not really thinking about dma_map_single() having a barrier or not.
> The patch you mention is from 2010. Many things have changed in the last
> decade. Does it have barrier semantics? The presence of a patch on the
> mailing list doesn't mean much.

Yes, it's pretty old, but if you follow the thread and look at the
patch I'm fairly certain it's still relevant.  Specifically, following
one thread of dma_map_single() on arm64:

dma_map_single()
-> dma_map_single_attrs()
--> dma_map_page_attrs()
---> dma_direct_map_page()
----> arch_sync_dma_for_device()
-----> __dma_map_area()
------> __dma_inv_area() which has a "dsb"

I'm sure there are lots of other possible paths, but one thing pointed
out by following that path is 'DMA_ATTR_SKIP_CPU_SYNC'.  The
documentation of that option talks about the normal flow.  It says
that in the normal flow that dma_map_{single,page,sg} will
synchronize.  We are in the normal flow here.

As far as I understand, the whole point of dma_map_single() is to take
a given buffer and get it all ready so that if a device does DMA on it
right after the function exits that it's all set.


> Specifically I'm looking at "KERNEL I/O BARRIER EFFECTS" of
> Documentation/memory-barriers.txt and noticing that this driver is using
> relaxed IO accessors meaning that the reads and writes aren't ordered
> with respect to other memory accesses. They're only ordered to
> themselves within the same device. I'm concerned that the CPU will issue
> the IO access to start the write DMA operation before the buffer is
> copied over due to out of order execution.

I'm not an expert either, but it really looks like dma_map_single()
does all that we need it to.


> I'm not an expert in this area, but this is why we ask driver authors to
> use the non-relaxed accessors because they have the appropriate
> semantics built in to make them easy to reason about. They do what they
> say when they say to do it.

I'm all for avoiding using the relaxed variants too except if it's
been shown to be a performance problem.  The one hesitation I have,
though, is that I've spent time poking a bunch at the geni SPI driver.
We do _a lot_ of very small SPI transfers on our system.  For each of
these it's gotta setup a lot of commands.  When I was poking I
definitely noticed the difference between writel() and
writel_relaxed().  If we can save a few microseconds on each one of
these transfers it's probably worth it since it's effectively in the
inner loop of some transfers.

One option I thought of was to track the mode (DMA vs. FIFO) and only
do writel() for DMA mode.  If you're not convinced by my arguments
about dma_map_single(), would you be good with just doing the
non-relaxed version if we're in DMA mode?

-Doug
