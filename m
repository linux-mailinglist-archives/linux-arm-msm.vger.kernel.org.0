Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BB31ED4E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 19:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgFCRXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 13:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgFCRXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 13:23:23 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1831BC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 10:23:22 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b5so2027840pfp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3ar3esfA/vt48SBclsM8WJOD1g7kG4QWgmN6yHU/oXc=;
        b=tNO9sJQ61o9UyfrhBb16ZezG7kOCbgIYdGMnrrumT9Vk/c2n/h/s+PdRpzJbFe8FYO
         yeudGjKQZ0Pt1ICeNO6VcYJ6HjF/icPSuk1BuGZ4bH81kkEfIl/ZxByLmoGxLyCKrRFm
         CJQOubP39NApW2ReGmIXspA3q3P+0DvsyPH4488eYYXQrgcihobQVr7F2xydvRMhgc3m
         Sm4C4d2gcq2qEYqHdEZN9NoysyOvYSqiL6EXV+myDnpzY74kA6JYPfBm3qsqVuyiZWwR
         6GfEnxHpL5HlA5n+IFWn4+eIHxMiZ0XstV7KGsJiw6xOdlWck+YVpE9IQLD+F9s1wVmC
         6GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ar3esfA/vt48SBclsM8WJOD1g7kG4QWgmN6yHU/oXc=;
        b=WnPum1t2/z2R+bS5naMhDE2GvSR69gDeiU3DuPKLsKR7aB++DeaQDMGmjOXaZhkrf/
         RHYdSx9ZffHWcGtsO6/YPCFUEU5ss9DY+GvT7TffFAq9X8jhBxiPr68AuJBpOxnIQF0L
         /hN8yPiMIa9jJeLfa6SXhQK/Tjg6+dwX7ZAsq68Fqne0O8Y+xrCRNgOsk6Vb0pVyttPf
         BOPrAfGGOuShqiqKn7nfhmkoCv7B74lSQ2cVIkpsEGAUSul12Z/jtIlTPHDsVhyD8cb2
         M3EVTDqgkNIcOYlMTMMcchG9wwYsKDZOEWoS132jOEcwsdUJZkX4w+/pRs9VC6dI3A+I
         N6dg==
X-Gm-Message-State: AOAM5320CJqAe4LO31jTx/odYsRpGf8PEoeip3g9XEq9GuM0NsH7b7Ji
        H1cFZlh/XGQoBC1D6Tli0SPQrQ==
X-Google-Smtp-Source: ABdhPJxy8Q5HTd5Gs4lSKz3+cPkTGrkqopHgfHUy1PStfA94XjybI5ykp5i4gqE6gRIaSm04U9EfmQ==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr445454pgp.146.1591205001388;
        Wed, 03 Jun 2020 10:23:21 -0700 (PDT)
Received: from yoga ([2607:fb90:84f0:6dc6:b843:e3ff:fe62:cb58])
        by smtp.gmail.com with ESMTPSA id y187sm2358942pfb.46.2020.06.03.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 10:23:20 -0700 (PDT)
Date:   Wed, 3 Jun 2020 10:23:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-tegra@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200603172316.GW11847@yoga>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602063210.GT11847@yoga>
 <20200603111159.GA8408@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603111159.GA8408@willie-the-truck>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Jun 04:11 PDT 2020, Will Deacon wrote:

> On Mon, Jun 01, 2020 at 11:32:10PM -0700, Bjorn Andersson wrote:
> > On Wed 27 May 04:03 PDT 2020, Will Deacon wrote:
> > 
> > > Hi John, Bjorn,
> > > 
> > > On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
> > > > On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
> > > > >
> > > > > Rob, Will, we're reaching the point where upstream has enough
> > > > > functionality that this is becoming a critical issue for us.
> > > > >
> > > > > E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> > > > > mainline with display, GPU, WiFi and audio working and the story is
> > > > > similar on several devboards.
> > > > >
> > > > > As previously described, the only thing I want is the stream mapping
> > > > > related to the display controller in place, either with the CB with
> > > > > translation disabled or possibly with a way to specify the framebuffer
> > > > > region (although this turns out to mess things up in the display
> > > > > driver...)
> > > > >
> > > > > I did pick this up again recently and concluded that by omitting the
> > > > > streams for the USB controllers causes an instability issue seen on one
> > > > > of the controller to disappear. So I would prefer if we somehow could
> > > > > have a mechanism to only pick the display streams and the context
> > > > > allocation for this.
> > > > >
> > > > >
> > > > > Can you please share some pointers/insights/wishes for how we can
> > > > > conclude on this subject?
> > > > 
> > > > Ping? I just wanted to follow up on this discussion as this small
> > > > series is crucial for booting mainline on the Dragonboard 845c
> > > > devboard. It would be really valuable to be able to get some solution
> > > > upstream so we can test mainline w/o adding additional patches.
> > > 
> > > Sorry, it's been insanely busy recently and I haven't had a chance to think
> > > about this on top of everything else. We're also carrying a hack in Android
> > > for you :)
> > > 
> > 
> > Thanks for taking the time to get back to us on this!
> > 
> > > > The rest of the db845c series has been moving forward smoothly, but
> > > > this set seems to be very stuck with no visible progress since Dec.
> > > > 
> > > > Are there any pointers for what folks would prefer to see?
> > > 
> > > I've had a chat with Robin about this. Originally, I was hoping that
> > > people would all work together towards an idyllic future where firmware
> > > would be able to describe arbitrary pre-existing mappings for devices,
> > > irrespective of the IOMMU through which they master and Linux could
> > > inherit this configuration. However, that hasn't materialised (there was
> > > supposed to be an IORT update, but I don't know what happened to that)
> > > and, in actual fact, the problem that you have on db845 is /far/ more
> > > restricted than the general problem.
> > > 
> > > Could you please try hacking something along the following lines and see
> > > how you get on? You may need my for-joerg/arm-smmu/updates branch for
> > > all the pieces:
> > > 
> > >   1. Use the ->cfg_probe() callback to reserve the SMR/S2CRs you need
> > >      "pinning" and configure for bypass.
> > > 
> > >   2. Use the ->def_domain_type() callback to return IOMMU_DOMAIN_IDENTITY
> > >      for the display controller
> > > 
> > > I /think/ that's sufficient, but note that it differs from the current
> > > approach because we don't end up reserving a CB -- bypass is configured
> > > in the S2CR instead. Some invalidation might therefore be needed in
> > > ->cfg_probe() after unhooking the CB.
> > > 
> > > Thanks, and please yell if you run into problems with this approach.
> > > 
> > 
> > This sounded straight forward and cleaner, so I implemented it...
> > 
> > Unfortunately the hypervisor is playing tricks on me when writing to
> > S2CR registers:
> > - TRANS writes lands as requested
> > - BYPASS writes ends up in the register as requested, with type FAULT
> > - FAULT writes are ignored
> > 
> > In other words, the Qualcomm firmware prevents us from relying on
> > marking the relevant streams as BYPASS type.
> 
> Is this for all S2CR registers, or only the ones in use by the display
> controller? Is there any scope for stopping the hypervisor from doing this?
> 

This is for all S2CR registers. There's no chance to change this and get
it deployed on all the devices people care about.

As you know John need this for the RB3/db845c, where we might have a
chance to modify the firmware.

But I'm writing this on my Lenovo Yoga C630 and John and his colleagues
are working on various phones, such as Pixel 3. None of these boots
without this "workaround" and I don't expect that we can propagate a
firmware modification to any of them - and definitely not all of them.

> It makes it really difficult for the driver when the hardware is emulated
> in a way that doesn't match the architecture...
> 

Understood.

Regards,
Bjorn
