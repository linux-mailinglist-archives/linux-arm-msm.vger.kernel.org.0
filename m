Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19A81ECE07
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 13:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgFCLMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 07:12:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbgFCLMF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 07:12:05 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30E882067B;
        Wed,  3 Jun 2020 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591182724;
        bh=Xza7Kf3c+nc+4WelfKWntJ9cpTKEbMrpBSWK718FdBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NANcdNB0vCZOqbyeeJf8M2LCgAsngzmzsHvZLb86tzCuCPkSpOIa/lju/l9/CcnG/
         CYfCtPG9X5ls7k40e8pb3GV5gopQoeV3XY4yGLR/+ZEZ3LWxRkTgd5ynPDZhnUNsPu
         24iaoPVLFdOoXINYwwq+YkYBnVvIjrrZnikV25og=
Date:   Wed, 3 Jun 2020 12:11:59 +0100
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-tegra@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200603111159.GA8408@willie-the-truck>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602063210.GT11847@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602063210.GT11847@yoga>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 01, 2020 at 11:32:10PM -0700, Bjorn Andersson wrote:
> On Wed 27 May 04:03 PDT 2020, Will Deacon wrote:
> 
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
> 
> Thanks for taking the time to get back to us on this!
> 
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
> > 
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
> 
> This sounded straight forward and cleaner, so I implemented it...
> 
> Unfortunately the hypervisor is playing tricks on me when writing to
> S2CR registers:
> - TRANS writes lands as requested
> - BYPASS writes ends up in the register as requested, with type FAULT
> - FAULT writes are ignored
> 
> In other words, the Qualcomm firmware prevents us from relying on
> marking the relevant streams as BYPASS type.

Is this for all S2CR registers, or only the ones in use by the display
controller? Is there any scope for stopping the hypervisor from doing this?

It makes it really difficult for the driver when the hardware is emulated
in a way that doesn't match the architecture...

Will
