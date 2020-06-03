Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25621ED4D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 19:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgFCRRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 13:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgFCRRZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 13:17:25 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03ADEC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 10:17:25 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id 205so2958080qkg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 10:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tca5PL5G3jMZ5q+yoTDdNeUHtiqDxoLd+E1VkbqOCao=;
        b=ZrySjX+VU3OMH1iSsB4egs/hSq6OcZaGoLE7o62quR4uxuVCmYKlvsdlqjU6TqXmKJ
         Wfl8UIuXwHuGv8wOn9whjYmBCFNcgQgM2Mt1aZ/+G6rEI7Tcf0SN3yFfgXU9eP/JmqA6
         BNCzSCSR+BpiQR6JbFPo/7n2yWADBFjYxyYziaoUe8OzVcXiOwuBMp3R7hLeMarVX/T+
         +jYkNyfRQdvWLK2OjsC4GTxlSTvXHm4j9vXeVfVpLZIMAIch9aiOi10j2OfuPsYXl3va
         5WzjmzUsGxGiuzML4/2j7+U009Th2+QHzf7oRgU9PZfOcmgI/avAqjlWKHlTZ7ADiBrD
         Zc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tca5PL5G3jMZ5q+yoTDdNeUHtiqDxoLd+E1VkbqOCao=;
        b=CLCP7B47mqEoQG0oeFmdoCt+NJJX9SrV4gugegtO5Mh2ea6/6r0AcjLvZZFQYZxJQl
         p9llYTuVsofHp1iUb/xx2AIgc10HrlrD9H0kGIeDyhDNRvTp7nccCXZM1Tr5tY2KMJpI
         jb/F6878+rz5rITn82iKlktvGnvilH+VaKt2H9gRXGoGxAVhNC2Wk7ncWzo29p9rlXu8
         3OaH8DbEAAOpubwrBacALJEJP4LiWqoKKej8yHj/7ITFPUc8Q7QEfDpyFTaTqR48/dUQ
         a6WPp/KujXBwre3KHs6p28HclOBxOs/fKoHpbe195RAc/r4hEwNqLhRerr9JnWQEEq8d
         fAGw==
X-Gm-Message-State: AOAM531X7jnUPuzYbGFSHRI6qlVNE4uwvuAOXc53hkpOs9jaKYFaxZbv
        XXpl8mebZepwlxkvRMz8rcwxRA==
X-Google-Smtp-Source: ABdhPJzr+sfCjAiiPvYMFHYu/Lq221Ix+g6cd5j0fefoqQHjk7ENZK/CkBW/NAMM0IO4sJi7Ae8Lgw==
X-Received: by 2002:a05:620a:1525:: with SMTP id n5mr713015qkk.328.1591204643913;
        Wed, 03 Jun 2020 10:17:23 -0700 (PDT)
Received: from yoga ([2607:fb90:84f0:6dc6:b843:e3ff:fe62:cb58])
        by smtp.gmail.com with ESMTPSA id p22sm2507665qtc.7.2020.06.03.10.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 10:17:22 -0700 (PDT)
Date:   Wed, 3 Jun 2020 10:17:17 -0700
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
Message-ID: <20200603171717.GV11847@yoga>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602110216.GA3354422@ulmo>
 <20200602193249.GC1799770@builder.lan>
 <20200603102446.GA3478467@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603102446.GA3478467@ulmo>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Jun 03:24 PDT 2020, Thierry Reding wrote:

> On Tue, Jun 02, 2020 at 12:32:49PM -0700, Bjorn Andersson wrote:
> > On Tue 02 Jun 04:02 PDT 2020, Thierry Reding wrote:
> > 
> > > On Wed, May 27, 2020 at 12:03:44PM +0100, Will Deacon wrote:
> > > > Hi John, Bjorn,
> > > > 
> > > > On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
> > > > > On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
> > > > > >
> > > > > > Rob, Will, we're reaching the point where upstream has enough
> > > > > > functionality that this is becoming a critical issue for us.
> > > > > >
> > > > > > E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> > > > > > mainline with display, GPU, WiFi and audio working and the story is
> > > > > > similar on several devboards.
> > > > > >
> > > > > > As previously described, the only thing I want is the stream mapping
> > > > > > related to the display controller in place, either with the CB with
> > > > > > translation disabled or possibly with a way to specify the framebuffer
> > > > > > region (although this turns out to mess things up in the display
> > > > > > driver...)
> > > > > >
> > > > > > I did pick this up again recently and concluded that by omitting the
> > > > > > streams for the USB controllers causes an instability issue seen on one
> > > > > > of the controller to disappear. So I would prefer if we somehow could
> > > > > > have a mechanism to only pick the display streams and the context
> > > > > > allocation for this.
> > > > > >
> > > > > >
> > > > > > Can you please share some pointers/insights/wishes for how we can
> > > > > > conclude on this subject?
> > > > > 
> > > > > Ping? I just wanted to follow up on this discussion as this small
> > > > > series is crucial for booting mainline on the Dragonboard 845c
> > > > > devboard. It would be really valuable to be able to get some solution
> > > > > upstream so we can test mainline w/o adding additional patches.
> > > > 
> > > > Sorry, it's been insanely busy recently and I haven't had a chance to think
> > > > about this on top of everything else. We're also carrying a hack in Android
> > > > for you :)
> > > > 
> > > > > The rest of the db845c series has been moving forward smoothly, but
> > > > > this set seems to be very stuck with no visible progress since Dec.
> > > > > 
> > > > > Are there any pointers for what folks would prefer to see?
> > > > 
> > > > I've had a chat with Robin about this. Originally, I was hoping that
> > > > people would all work together towards an idyllic future where firmware
> > > > would be able to describe arbitrary pre-existing mappings for devices,
> > > > irrespective of the IOMMU through which they master and Linux could
> > > > inherit this configuration. However, that hasn't materialised (there was
> > > > supposed to be an IORT update, but I don't know what happened to that)
> > > > and, in actual fact, the problem that you have on db845 is /far/ more
> > > > restricted than the general problem.
> > > 
> > > It doesn't sound to me like implementing platform-specific workarounds
> > > is a good long-term solution (especially since, according to Bjorn, they
> > > aren't as trivial to implement as it sounds). And we already have all
> > > the infrastructure in place to implement what you describe, so I don't
> > > see why we shouldn't do that. This patchset uses standard device tree
> > > bindings that were designed for exactly this kind of use-case.
> > > 
> > 
> > I think my results would imply that we would have to end up with (at
> > least) some special case of your proposal (i.e. we need a context bank
> > allocated).
> 
> I wasn't talking about implementation details, but rather about the
> surrounding infrastructure. It seemed like Will was suggesting that
> there's no way of conveying what memory regions to direct-map from
> the firmware to the kernel. But that really isn't the problem here,
> is it? What we're really looking for is how to take what we have in
> device tree and use it in the ARM SMMU driver to create an early
> mapping that will stay in place until a device has been properly
> attached to the IOMMU domain.
> 

I agree.

We do have the iommu properties from our display node and we typically
do have a reserved-memory region for the existing framebuffer that we
want to associate with those properties.

The one exception is on devices targeted to run Windows, where the
memory region is passed to the kernel using UEFI GOP.

But as you say, the information is available to the kernel already.

> > > So at least for device-tree based boot firmware can already describe
> > > these pre-existing mappings. If something standard materializes for ACPI
> > > eventually I'm sure we can find ways to integrate that into whatever we
> > > come up with now for DT.
> > > 
> > > I think between Bjorn, John, Laurentiu and myself there's pretty broad
> > > consensus (correct me if I'm wrong, guys) that solving this via reserved
> > > memory regions is a good solution that works. So I think what's really
> > > missing is feedback on whether the changes proposed here or Laurentiu's
> > > updated proposal[0] are acceptable, and if not, what the preference is
> > > for getting something equivalent upstream.
> > > 
> > 
> > As described in my reply to your proposal, the one problem I ran into
> > was that I haven't figured out how to reliably "move" my display streams
> > from one mapping entry to another.
> > 
> > With the current scheme I see that their will either be gaps in time
> > with no mapping for my display, or multiple mappings.
> 
> I think you would inevitably end up with two mappings for a transitional
> period while you prepare the final mapping that you want to switch to.
> 

I think that's fine, I saw that there's a bit to configure if multiple
SMR matches is considered a fault or not, so I will verify if this is
what causes the faults I saw on one of my platforms and if I can change
it.

I still would need that we ensure that we don't have lapses in time
where we're lacking mappings among the SMRs.

> > The other thing I noticed in your proposal was that I have a whole bunch
> > of DT nodes with both iommus and memory-region properties that I really
> > don't care to set up mappings for, but I've not finalized my thoughts on
> > this causing actual problems...
> 
> Can you be more specific? It'd be useful to understand all of the
> existing uses of reserved memory regions in order to make sure we
> accomodate all of them.
> 

I have reserved-memory regions for a number of co-processors, to
facilitate static access configuration, as such I ended up with having
100+MB of various DSP memory mapped into the temporary context.

> I'd be surprised, though, if setting up mappings for any of these
> regions would actually cause breakage. If a device tree node has a
> memory-region property it means that this memory region is eventually
> going to be used by the device and if the device tree node also has an
> iommus property it means that it's meant to use the IOMMU for
> translating memory accesses. It's therefore very likely that the memory
> region will need to be mapped. Whether it needs to be a direct mapping
> or not might be worth having a discussion about.
> 

Right, I think that before any of these are actually used we will have a
device attached and the region properly mapped (as is done today
already).

> > > Just to highlight: the IOMMU framework already provides infrastructure
> > > to create direct mappings (via iommu_get_resv_regions(), called from
> > > iommu_create_device_direct_mappings()). I have patches that make use of
> > > this on Tegra210 and earlier where a non-ARM SMMU is used and where the
> > > IOMMU driver enables translations (and doesn't fault by default) only at
> > > device attachment time. That works perfectly using reserved-memory
> > > regions. Perhaps that infrastructure could be extended to cover the
> > > kinds of early mappings that we're discussing here. On the other hand it
> > > might be a bit premature at this point because the ARM SMMU is the only
> > > device that currently needs this, as far as I can tell.
> > > 
> > 
> > For Qualcomm we got patches picked up for 5.8 that will cause the
> > display controller to be attached with direct mapping, so I think all
> > missing now is the lack of stream mappings between arm-smmu probe and
> > display driver probe...
> 
> Can you point me at those patches? I'd like to look at them and see if
> they match what I have planned for Tegra or if we can somehow converge
> on a common scheme.
> 

You can find this in:

0e764a01015d ("iommu/arm-smmu: Allow client devices to select direct mapping")

Which conceptually follows what is done on x86 machines.

Regards,
Bjorn
