Return-Path: <linux-arm-msm+bounces-58713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FAFABD6D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE853AEF1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81F0274FD0;
	Tue, 20 May 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofdYLbVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910921A45A;
	Tue, 20 May 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740713; cv=none; b=Cfdwxxacv/CLNVilKFiB41XmN+xEF0agT3Jed8+k0f+KNQcAtjlLZkhPTHZ4HYySheL8oBk1tk99dvZ70bduHWNB0BTE8lTG28t3mxvvfIi05k+/P96Y+vUpbkfZLiUm4U57kMu92eC6phs/qDimr1bgvK4FKVEiI5Q+vkQSH50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740713; c=relaxed/simple;
	bh=CvDybhlQLGgsaauWyvnvy0fUfy35kQUTWzKrr9rQm+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2hszaevYOhM4uDxGs6iYWT5FSAAL29yh2PQ9RSBjTms3S4RfyGytIP+NNnO3NvyslD5GRKxpnxbxfU9ffjiQMPf3voJfiF/BVtXpCyq6Pp31YRpP0DwAHgaVW8gWj+FKqF0XGrMoXCe78VEe/K3ffqr5pgEiOzLpeQI4EEIPMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofdYLbVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9268CC4CEEB;
	Tue, 20 May 2025 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747740713;
	bh=CvDybhlQLGgsaauWyvnvy0fUfy35kQUTWzKrr9rQm+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofdYLbVw9naWOMB+EzGo9kBZvwW4kLEAFulhRj7U1+SNOP7XzubmjaDjq3xXD81HE
	 asVMbkGWrhZ02beHdrEgtHSSE9HSvsdrEJbtnnivmJKg77MuwnIMOFtxW0CgeSVNmf
	 EqKNtxziB0IwrCIK/8elCyKsALdB9DCl+ciWml5O6Uh2Dm1ucCGNJVn2++eMOpAQLr
	 yJeOi8layAs/ZP0wKWsmnlJiJS9PTXienZtRWaYPw2Whbu1eOKsSbLKLE69kPDiTZi
	 DBZexSPA57nr7OzlVuH3WE/qc0XzVc3H6bg35HEBDqxL3dGvQ+qZhssW/A47l2JlYh
	 DhtXNITYVLfkw==
Date: Tue, 20 May 2025 12:31:47 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250520113146.GA18435@willie-the-truck>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
 <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 15, 2025 at 07:48:39AM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 7:33 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In situations where mapping/unmapping sequence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> > >
> > > Now that there is a quirk, we can also drop the selftest_running
> > > flag, and use the quirk instead for selftests.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Acked-by: Robin Murphy <robin.murphy@arm.com>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
> > >  include/linux/io-pgtable.h     |  8 ++++++++
> > >  2 files changed, 22 insertions(+), 13 deletions(-)
> >
> > [...]
> >
> > > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > > index bba2a51c87d2..639b8f4fb87d 100644
> > > --- a/include/linux/io-pgtable.h
> > > +++ b/include/linux/io-pgtable.h
> > > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> > >        *
> > >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
> > >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> > > +      *
> > > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > > +      *      mappings, but silently return -EEXISTS.  Normally an attempt
> > > +      *      to map over an existing mapping would indicate some sort of
> > > +      *      kernel bug, which would justify the WARN_ON().  But for GPU
> > > +      *      drivers, this could be under control of userspace.  Which
> > > +      *      deserves an error return, but not to spam dmesg.
> > >        */
> > >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> > >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> > >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> > >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> > >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> >
> > This feels a bit fragile to me:
> >   * IOMMU-API users of io-pgtable shouldn't be passing this quirk
> >     but might end up doing so to paper over driver bugs.
> >
> >   * Low-level users of io-pgtable who expose page-table operations to
> >     userspace need to pass the quirk, but might well not bother because
> >     well-behaved userspace doesn't trigger the warning.
> >
> > So overall, it's all a bit unsatisfactory. Is there a way we could have
> > the warnings only when invoked via the IOMMU API?
> 
> iommu drivers _not_ setting this flag seems like a good way to achieve that ;-)
> 
> The alternative is to move the warns to the iommu driver... but they
> could just as easily remove the WARN_ON()s as they could set the
> NO_WARN_ON quirk, so :shrug:?

Bah, I also don't have a good idea to improve this, so I guess I'll take
what you have for now.

Will

