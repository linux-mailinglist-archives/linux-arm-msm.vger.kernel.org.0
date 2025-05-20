Return-Path: <linux-arm-msm+bounces-58722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F9FABDBA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624514C7556
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F764245038;
	Tue, 20 May 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMWSAyXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F52F37;
	Tue, 20 May 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749976; cv=none; b=eKKBr5bnCuU99eo/WNjs503o+p4ikqHhw9SYCCtspTx2sq+yAVooToymTvsornrogQOceHyamhZ3i98bZI1L6aloZx7M7QC0sFd4hatC9NU/b8392hwyoSk5A4D7vTNvkRG3s4qBUlf5Q/4p9aGhEfEGPfXZxi5Zw/hm+7wJyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749976; c=relaxed/simple;
	bh=FUqSs96axAp0W6GBkmXg9C3eBD616pCiipr3QPKpK+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJvUWDFVgouhBMcDHXv2VIjJDkW0GkW8TkurvmLbRsB1w/+CzPe6znQAa/wF0lY3prTW7NSz7gi15Z0kUP+s1dMnm7pr1+BMqP+bNVrCo+Qi5kPnHr3WL39iU6+8BYnPVg3ndfjTOfV1zNwM7H8DoPfoQ2WvPZc1yRvQDiBn3uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMWSAyXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55123C4CEEA;
	Tue, 20 May 2025 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747749975;
	bh=FUqSs96axAp0W6GBkmXg9C3eBD616pCiipr3QPKpK+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMWSAyXuMbLx1/hbp6qcHRyhEmrh+SwjzHgggk6nisBANRAgI0i2pSTllwRw20cOO
	 4A4Oxub/EL3+D9pSsqqSiyc5uZupxkGtEnvqvT1Ke5BlHfmfJSMU627RwkoS5Txqfe
	 YTXqS/bp+ydnNVd4pr2lPAKgC69XUrspKcOqi7sYJoaiSUWIcUIOW5D7q5k9y0SMgd
	 qGnGkmP//B2jNxvIw6zidR5e7qDCX4kaEgzkbNP3zWYjZzikqMPSNJNFk16pAtyD0g
	 c1V0am5JaXH8EZDohQWKaZa7ba4ir0qmi1nz7/IuD+8tqOKskzTtyNYlOINeVPNOCv
	 dTHtLvUkValbw==
Date: Tue, 20 May 2025 15:06:10 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250520140609.GB18711@willie-the-truck>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
 <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
 <20250520113146.GA18435@willie-the-truck>
 <def13dd2-3a23-4091-a732-e4c079df7f41@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <def13dd2-3a23-4091-a732-e4c079df7f41@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, May 20, 2025 at 02:06:09PM +0100, Robin Murphy wrote:
> On 2025-05-20 12:31 pm, Will Deacon wrote:
> > On Thu, May 15, 2025 at 07:48:39AM -0700, Rob Clark wrote:
> > > On Thu, May 15, 2025 at 7:33 AM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > > > > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > > > > index bba2a51c87d2..639b8f4fb87d 100644
> > > > > --- a/include/linux/io-pgtable.h
> > > > > +++ b/include/linux/io-pgtable.h
> > > > > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> > > > >         *
> > > > >         * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
> > > > >         * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> > > > > +      *
> > > > > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > > > > +      *      mappings, but silently return -EEXISTS.  Normally an attempt
> > > > > +      *      to map over an existing mapping would indicate some sort of
> > > > > +      *      kernel bug, which would justify the WARN_ON().  But for GPU
> > > > > +      *      drivers, this could be under control of userspace.  Which
> > > > > +      *      deserves an error return, but not to spam dmesg.
> > > > >         */
> > > > >        #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> > > > >        #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > > > > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> > > > >        #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> > > > >        #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> > > > >        #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > > > > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> > > > 
> > > > This feels a bit fragile to me:
> > > >    * IOMMU-API users of io-pgtable shouldn't be passing this quirk
> > > >      but might end up doing so to paper over driver bugs.
> > > > 
> > > >    * Low-level users of io-pgtable who expose page-table operations to
> > > >      userspace need to pass the quirk, but might well not bother because
> > > >      well-behaved userspace doesn't trigger the warning.
> > > > 
> > > > So overall, it's all a bit unsatisfactory. Is there a way we could have
> > > > the warnings only when invoked via the IOMMU API?
> > > 
> > > iommu drivers _not_ setting this flag seems like a good way to achieve that ;-)
> > > 
> > > The alternative is to move the warns to the iommu driver... but they
> > > could just as easily remove the WARN_ON()s as they could set the
> > > NO_WARN_ON quirk, so :shrug:?
> > 
> > Bah, I also don't have a good idea to improve this, so I guess I'll take
> > what you have for now.
> 
> Hmm, just a nit on reflection, how about fixing up the name to just
> IO_PGTABLE_QUIRK_NO_WARN? Given that it's already quite long, and we have a
> well-established DMA_ATTR_NO_WARN with equivalent semantics over in the DMA
> API.

Sure, I'll do that now...

Will

