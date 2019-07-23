Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFCD71BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 17:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfGWPib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 11:38:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727598AbfGWPia (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 11:38:30 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FC15217D4;
        Tue, 23 Jul 2019 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563896310;
        bh=6BjcRpGUXnApNQz7lAjtezIG7TvYHSpnsTToA6ldcuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iW3wa0oYpaL//UuyWsMLm+i+ND0M4tiRPisfgZng7jScBCMId0zVJa49Mdc8nwHLu
         hpaqz0kgnbWK8ct6/KTj2+eF9ntu+s0xnTiUavTb6xKJKLg+QXKysth4nuK7evoo8o
         d2fcuUXNNxoXFbVMXP4iuPbe3D77Nir5iUNw/TAw=
Date:   Tue, 23 Jul 2019 16:38:23 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu
 explicitly
Message-ID: <20190723153822.gm4ossn43nvqbyak@willie-the-truck>
References: <20190702202631.32148-2-robdclark@gmail.com>
 <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org>
 <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
 <20190722154803.GG12009@8bytes.org>
 <CAF6AEGvWf3ZOrbyyWjORuOVEPOcPr+JSEO78aYjhL-GVhDZnTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvWf3ZOrbyyWjORuOVEPOcPr+JSEO78aYjhL-GVhDZnTg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 09:23:48AM -0700, Rob Clark wrote:
> On Mon, Jul 22, 2019 at 8:48 AM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > On Mon, Jul 22, 2019 at 08:41:34AM -0700, Rob Clark wrote:
> > > It is set by the driver:
> > >
> > > https://patchwork.freedesktop.org/patch/315291/
> > >
> > > (This doesn't really belong in devicetree, since it isn't a
> > > description of the hardware, so the driver is really the only place to
> > > set this.. which is fine because it is about a detail of how the
> > > driver works.)
> >
> > It is more a detail about how the firmware works. IIUC the problem is
> > that the firmware initializes the context mappings for the GPU and the
> > OS doesn't know anything about that and just overwrites them, causing
> > the firmware GPU driver to fail badly.
> >
> > So I think it is the task of the firmware to tell the OS not to touch
> > the devices mappings until the OS device driver takes over. On x86 there
> > is something similar with the RMRR/unity-map tables from the firmware.
> >
> 
> Bjorn had a patchset[1] to inherit the config from firmware/bootloader
> when arm-smmu is probed which handles that part of the problem.  My
> patch is intended to be used on top of his patchset.  This seems to me
> like the best solution, if we don't have control over the firmware.

Hmm, but the feedback from Robin on the thread you cite was that this should
be generalised to look more like RMRR, so there seems to be a clear message
here.

Will
