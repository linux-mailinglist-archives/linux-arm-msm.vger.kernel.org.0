Return-Path: <linux-arm-msm+bounces-119231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SlzLI/x4V2o3OwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:11:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352775DF33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:11:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dgoekp6t;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119231-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119231-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC60630D14E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF8644C66F;
	Wed, 15 Jul 2026 12:03:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797C444BCB4;
	Wed, 15 Jul 2026 12:03:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117013; cv=none; b=AqHM5fLcyCVF78H6whAdjV3S3jPA7IYT4gB3p2GVWX2IOKHkwjfp74UMyJO1oiKSiB5YtEImZJMksAusnqG2uWFQ3e+oBFrF3ktXv3L1BlBw9h5roOaXKXNpaY1NbwQJtooRgkj/c+QzGv6DXmYaFXWzGad0wNuuMkYFZ/cqgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117013; c=relaxed/simple;
	bh=JAjiROYJEbjJo09m+q1axGPBaAEhweQNEycvH/1HrgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCZV5iL0hjnIaiCvoinICPoA7yNbD2if6Xgk+U7Ihcq1G3Gl9/1FTePD0QceDzPV9jalMwX2shlK+xHPu8W3pL+zvcEsNMzlcMCp6vEpPwM+IR70x5M8GWbXhB4V98H2hH5vsazhRWTQUiJoOHwbOZDZbeWekV20ul8SdmMFrUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgoekp6t; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FA21F000E9;
	Wed, 15 Jul 2026 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117008;
	bh=/7ZqQUQ8cgaxKWXeJyGjzq+OTwqxLCWIQt2QhPkSk4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dgoekp6tg/cWwLwIo+C7mFpK8kF06UfEo4Chrbi3LavY6sy1QOQg0MhXDIQVwWbgi
	 f3F55c2trpg+d5M1T4A9C2SLo9OZPGVgkNGAA31txg86NTkU3VypMs59waGWViKmO0
	 yRKBMypgWDBxujJReTUvepotNz4P6B7Ywn7EsI2YodA2ZzMIcYKdF+idtVoVFrQprD
	 R+nIqeeZnrTOLe36iahZhRGOPyhIwbX4fuiQeMYHuBPRk/2/DFMotFFjoRQ79RoWI2
	 LSkd4EoOdYQUK51gLT3uVpb2fdyxRJD8jTaZPlW+0rMLLimAVTclIRFX7pRvTtFWq+
	 GUFEhopNxw8LA==
Date: Wed, 15 Jul 2026 13:03:22 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <ald3CuddY6I7gml1@willie-the-truck>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715113913.GA3775915@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-119231-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1352775DF33

On Wed, Jul 15, 2026 at 08:39:13AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 11:25:42AM +0530, Vijayanand Jitta wrote:
> > On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
> > > On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
> > >> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> > >>
> > >> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > >> When a set of consecutive PTEs map a naturally-aligned contiguous block
> > >> of memory, the CONT bit can be set on all entries in the group to allow
> > >> the hardware to combine them into a single TLB entry, improving TLB
> > >> utilization.
> > >>
> > >> The contiguous hint sizes per granule are:
> > >>
> > >>   Page Size | CONT PTE |  PMD  | CONT PMD
> > >>   ----------+----------+-------+---------
> > >>       4K    |   64K    |   2M  |   32M
> > >>      16K    |    2M    |  32M  |    1G
> > >>      64K    |    2M    | 512M  |   16G
> > > 
> > > My series to convert smmuv3 to the iommupt takes care of this and
> > > supports all the orders too. I'd rather we move forward with that then
> > > try to patch up this.
> > 
> > Thanks for details, I have gone through your series. As this patch
> > targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
> > Apple DART, etc.), not just SMMUv3. I think there will still be value in
> > this patch for the other users.
> 
> If other users care they should also be converted to iommupt, there
> are many benefits to this besides just cont support.

I really have no interest in maintaining two copies of the page-table
code, so I agree that we should convert users of the architectural (long
descriptor) page-table format over to iommupt with a view to removing
the io-pgtable implementation eventually. If you want two parallel
implementations, then one should really be in rust :)

From what I can tell, the fiddly parts for iommupt will be:

  1. Hardware bugs / quirks. Some of the simpler ones could probably be
     handled but for the more invasive stuff like the Mali format
     format, io-pgtable will probably need to hang around. Perhaps
     it becomes io-pgtable-mali.c?

  2. The pKVM work from Mostafa. We'll probably end up with something
     separate at EL2 for this (ideally, just reusing the CPU page-table
     code when it learns about BBML3).

  3. Non-coherent walkers, although I think this might actually be fine
     because x86 needs it anyway?

So, for now, I wouldn't require new drivers to use iommupt but I'm not
particularly keen about teaching io-pgtable new architectural tricks
either.

Will

