Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156A91EC2CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 21:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgFBTdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 15:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgFBTds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 15:33:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F6BC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 12:33:48 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x207so3740297pfc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j2731q8TZbNlQF3Z/Bp/V56dsnSlRnzdVVRnH3OA0YQ=;
        b=u+KiM8rkKC+5ACEm+D37UxEKMAjZpNWVemeVjQ2DlN/fbrQljAtpcLea19wo9SJ3zZ
         tQD9Muiy3zxy6qdkHFEJTgb6g9vfXw5yNvNf50QdKL9StCfj1dQx4T74d2GFrwnesuve
         3y2hdJMz2NeBaNDZCPcbB1beX/WCymmiYkJ6ajWy16pHf2psCTbQaaxkhMwZNJUtUiiM
         A/kug+5FjorSKZRndPov3hQGuBYD8lAxS4Yu6dNmw6n5B1YOo1h0G6fUxDqT7uDBpSL2
         BZ3mKtdCY9SIwElxLu9t82mJ2t/CGRZYxVV3ZKd5e55Z+N8Yy9TCalBwiFSp2GgYyAw8
         Qg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j2731q8TZbNlQF3Z/Bp/V56dsnSlRnzdVVRnH3OA0YQ=;
        b=sBcK+eN4iV0wGJkUh63+Ba2BgtwIWdVdlTlMZSXvWgW8Da1MOGGDPfk42ej9p5DBHy
         YdIc0c2e/0CkQuv7DY0gH4g50jNBAq39XXl4nK3Ivu3NxgLN3KsiSIxzHkPC96UraLx3
         PnonxPp6EsGeikyGiKa45zTdpfsbZhzKT0+tbsnm/7FfUhZHZMl/sE6L7E0HYDaxGRsa
         MGFNKi2tMQPX6AEeC+pQRj77bjvFW4DTExsfKtCE8vA6KvsvSvbqtrZV8ua4JFF+AGt5
         cSAkWtgML5GQsNiu56sJNeL144LMu8h/LHplA0Ah1wSikAq6B71nIblTCHZrHHQdwyPK
         oELA==
X-Gm-Message-State: AOAM532O6qcOaX8WdFNrume9pM10PW3iu0Z+uIX5FabGUG2HH5ksY7Yl
        GQCKw9r5EWXwKtF6VIV8cu2T8g==
X-Google-Smtp-Source: ABdhPJyUesfEHfZc8D0N1MFN1N5Jd1zZeoohNWHEhngaOfdDpGXggsJuQz2Z7OJYnatzZFTs893Z9A==
X-Received: by 2002:a63:cc12:: with SMTP id x18mr25062622pgf.140.1591126427475;
        Tue, 02 Jun 2020 12:33:47 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m2sm2955054pjk.52.2020.06.02.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 12:33:46 -0700 (PDT)
Date:   Tue, 2 Jun 2020 12:32:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-tegra@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200602193249.GC1799770@builder.lan>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602110216.GA3354422@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602110216.GA3354422@ulmo>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 02 Jun 04:02 PDT 2020, Thierry Reding wrote:

> On Wed, May 27, 2020 at 12:03:44PM +0100, Will Deacon wrote:
> > Hi John, Bjorn,
> > 
> > On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
> > > On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
> > > >
> > > > Rob, Will, we're reaching the point where upstream has enough
> > > > functionality that this is becoming a critical issue for us.
> > > >
> > > > E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> > > > mainline with display, GPU, WiFi and audio working and the story is
> > > > similar on several devboards.
> > > >
> > > > As previously described, the only thing I want is the stream mapping
> > > > related to the display controller in place, either with the CB with
> > > > translation disabled or possibly with a way to specify the framebuffer
> > > > region (although this turns out to mess things up in the display
> > > > driver...)
> > > >
> > > > I did pick this up again recently and concluded that by omitting the
> > > > streams for the USB controllers causes an instability issue seen on one
> > > > of the controller to disappear. So I would prefer if we somehow could
> > > > have a mechanism to only pick the display streams and the context
> > > > allocation for this.
> > > >
> > > >
> > > > Can you please share some pointers/insights/wishes for how we can
> > > > conclude on this subject?
> > > 
> > > Ping? I just wanted to follow up on this discussion as this small
> > > series is crucial for booting mainline on the Dragonboard 845c
> > > devboard. It would be really valuable to be able to get some solution
> > > upstream so we can test mainline w/o adding additional patches.
> > 
> > Sorry, it's been insanely busy recently and I haven't had a chance to think
> > about this on top of everything else. We're also carrying a hack in Android
> > for you :)
> > 
> > > The rest of the db845c series has been moving forward smoothly, but
> > > this set seems to be very stuck with no visible progress since Dec.
> > > 
> > > Are there any pointers for what folks would prefer to see?
> > 
> > I've had a chat with Robin about this. Originally, I was hoping that
> > people would all work together towards an idyllic future where firmware
> > would be able to describe arbitrary pre-existing mappings for devices,
> > irrespective of the IOMMU through which they master and Linux could
> > inherit this configuration. However, that hasn't materialised (there was
> > supposed to be an IORT update, but I don't know what happened to that)
> > and, in actual fact, the problem that you have on db845 is /far/ more
> > restricted than the general problem.
> 
> It doesn't sound to me like implementing platform-specific workarounds
> is a good long-term solution (especially since, according to Bjorn, they
> aren't as trivial to implement as it sounds). And we already have all
> the infrastructure in place to implement what you describe, so I don't
> see why we shouldn't do that. This patchset uses standard device tree
> bindings that were designed for exactly this kind of use-case.
> 

I think my results would imply that we would have to end up with (at
least) some special case of your proposal (i.e. we need a context bank
allocated).

> So at least for device-tree based boot firmware can already describe
> these pre-existing mappings. If something standard materializes for ACPI
> eventually I'm sure we can find ways to integrate that into whatever we
> come up with now for DT.
> 
> I think between Bjorn, John, Laurentiu and myself there's pretty broad
> consensus (correct me if I'm wrong, guys) that solving this via reserved
> memory regions is a good solution that works. So I think what's really
> missing is feedback on whether the changes proposed here or Laurentiu's
> updated proposal[0] are acceptable, and if not, what the preference is
> for getting something equivalent upstream.
> 

As described in my reply to your proposal, the one problem I ran into
was that I haven't figured out how to reliably "move" my display streams
from one mapping entry to another.

With the current scheme I see that their will either be gaps in time
with no mapping for my display, or multiple mappings.


The other thing I noticed in your proposal was that I have a whole bunch
of DT nodes with both iommus and memory-region properties that I really
don't care to set up mappings for, but I've not finalized my thoughts on
this causing actual problems...

> Just to highlight: the IOMMU framework already provides infrastructure
> to create direct mappings (via iommu_get_resv_regions(), called from
> iommu_create_device_direct_mappings()). I have patches that make use of
> this on Tegra210 and earlier where a non-ARM SMMU is used and where the
> IOMMU driver enables translations (and doesn't fault by default) only at
> device attachment time. That works perfectly using reserved-memory
> regions. Perhaps that infrastructure could be extended to cover the
> kinds of early mappings that we're discussing here. On the other hand it
> might be a bit premature at this point because the ARM SMMU is the only
> device that currently needs this, as far as I can tell.
> 

For Qualcomm we got patches picked up for 5.8 that will cause the
display controller to be attached with direct mapping, so I think all
missing now is the lack of stream mappings between arm-smmu probe and
display driver probe...

Regards,
Bjorn

> Thierry
> 
> [0]: https://patchwork.ozlabs.org/project/linux-tegra/list/?series=164853
> 
> > Could you please try hacking something along the following lines and see
> > how you get on? You may need my for-joerg/arm-smmu/updates branch for
> > all the pieces:
> > 
> >   1. Use the ->cfg_probe() callback to reserve the SMR/S2CRs you need
> >      "pinning" and configure for bypass.
> > 
> >   2. Use the ->def_domain_type() callback to return IOMMU_DOMAIN_IDENTITY
> >      for the display controller
> > 
> > I /think/ that's sufficient, but note that it differs from the current
> > approach because we don't end up reserving a CB -- bypass is configured
> > in the S2CR instead. Some invalidation might therefore be needed in
> > ->cfg_probe() after unhooking the CB.
> > 
> > Thanks, and please yell if you run into problems with this approach.
> > 
> > Will


