Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C41B4F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 15:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfIQNgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 09:36:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbfIQNgr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 09:36:47 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBE97206C2;
        Tue, 17 Sep 2019 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568727406;
        bh=Ql3S5LeLxQu05wGmhaTM95fv1AHLxdIM1bfELOE4N7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sar6QHXnAAyU7CqcX6S4XEMZKCw1XqlFh7JOPCZcEm7NSSw7o9n4M4YTyIEluCTr+
         PlHd+kmgg4Vr/dK3w6I2fdh2OfNlJWZ1RrBSnCix074v+q0zWCpWT1ivxI6TO8Oge1
         wto9mDPRvI0UPcufLj8FL+blmnWYDbjxJUHoo8rI=
Date:   Tue, 17 Sep 2019 14:36:37 +0100
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Bruce Wang <bzwang@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Joe Perches <joe@perches.com>, Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sean Paul <seanpaul@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
Message-ID: <20190917133637.urqphz5drzmugern@willie-the-truck>
References: <20190906214409.26677-1-robdclark@gmail.com>
 <c43de10f-7768-592c-0fd8-6fb64b3fd43e@arm.com>
 <CAF6AEGv5WtwOuUE-+koL3SxuoXxcT5n=EooD7G_4YRh34HFTwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGv5WtwOuUE-+koL3SxuoXxcT5n=EooD7G_4YRh34HFTwQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 10, 2019 at 10:10:49AM -0700, Rob Clark wrote:
> On Tue, Sep 10, 2019 at 9:34 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > On 06/09/2019 22:44, Rob Clark wrote:
> > > NOTE that in discussion of previous revisions, RMRR came up.  This is
> > > not really a replacement for RMRR (nor does RMRR really provide any
> > > more information than we already get from EFI GOP, or DT in the
> > > simplefb case).  I also don't see how RMRR could help w/ SMMU handover
> > > of CB/SMR config (Bjorn's patchset[1]) without defining new tables.
> >
> > The point of RMRR-like-things is that they identify not just the memory
> > region but also the specific device accessing them, which means the
> > IOMMU driver knows up-front which IDs etc. it must be careful not to
> > disrupt. Obviously for SMMU that *would* be some new table (designed to
> > encompass everything relevant) since literal RMRRs are specifically an
> > Intel VT-d thing.
> 
> Perhaps I'm not looking in the right place, but the extent of what I
> could find about RMRR tables was:
> 
> https://github.com/tianocore/edk2/blob/master/MdePkg/Include/IndustryStandard/DmaRemappingReportingTable.h#L122
> 
> I couldn't really see how that specifies the device.  But entirely
> possible that I'm not seeing the whole picture.

I don't think anybody was planning to implement RMRR "as-is" for arm64, so
you might be better off looking at the proposal from Thierry, although it
has some issues that are still to be resolved:

http://lkml.kernel.org/r/20190829111407.17191-1-thierry.reding@gmail.com

Will
