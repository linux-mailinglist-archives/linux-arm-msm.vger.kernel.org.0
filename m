Return-Path: <linux-arm-msm+bounces-445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAD7E7B16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAB51F20C22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E142112E57;
	Fri, 10 Nov 2023 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D2bXB3Bb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A312E46
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 09:47:57 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3CC250AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 01:47:55 -0800 (PST)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C56ED66073EF;
	Fri, 10 Nov 2023 09:47:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699609674;
	bh=9v8ERUxib776BgthWEgOR4Rdi9JK7Ze5AX6GgNkbrYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D2bXB3Bb5ngfck8o5JTnqvd17k4yJ705vylfd/zS0SmSwWw0gWBa9zii735rViqRm
	 qK1Pr5GYMaRwU9YfpY8PxpYc4TydbhuOjM8a5uQlHiRpNFkvFtV6cVmjvgypK7jliP
	 gbuFgCIOydCoDZO5zYxGimPkiirg0rkBLBZws6A6FemImZL/FokU0YpW9yi2u5+AwX
	 z+HLp42pw/vAGP8e2pefMntlIWjeGaXEsgTl9R05aTifDpKLvY/LJJUbY2etEy5rny
	 hsKG8DHh+kLCKSnymsDkk1TVBKxHmQAsPOIlTk7GAC+zHPghfcm/nTbSEUoOrIgp10
	 EdkjRBNzNX/tA==
Date: Fri, 10 Nov 2023 10:47:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Steven Price <steven.price@arm.com>,
 Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux.dev>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/2] iommu: Allow passing custom allocators to pgtable
 drivers
Message-ID: <20231110104750.198b6967@collabora.com>
In-Reply-To: <84277a5c-a33f-a412-6dec-2ab786b1a47d@quicinc.com>
References: <20230809121744.2341454-1-boris.brezillon@collabora.com>
	<f72e5ab1-c6f2-ec03-68d6-1686145f3a4d@arm.com>
	<CAF6AEGtDxkiiM5NNT7Y9-sY5eCQX15ij=RzU-NX2Mvf6kNk2nA@mail.gmail.com>
	<84277a5c-a33f-a412-6dec-2ab786b1a47d@quicinc.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Gaurav,

On Tue, 7 Nov 2023 17:22:39 +0530
Gaurav Kohli <quic_gkohli@quicinc.com> wrote:

> On 10/24/2023 2:32 AM, Rob Clark wrote:
> > On Wed, Sep 20, 2023 at 6:12=E2=80=AFAM Steven Price <steven.price@arm.=
com> wrote: =20
> >>
> >> On 09/08/2023 13:17, Boris Brezillon wrote: =20
> >>> Hello,
> >>>
> >>> This patchset is an attempt at making page table allocation
> >>> customizable. This is useful to some GPU drivers for various reasons:
> >>>
> >>> - speed-up upcoming page table allocations by managing a pool of free
> >>>    pages
> >>> - batch page table allocation instead of allocating one page at a time
> >>> - pre-reserve pages for page tables needed for map/unmap operations a=
nd
> >>>    return the unused page tables to some pool
> >>>
> >>> The first and last reasons are particularly important for GPU drivers
> >>> wanting to implement asynchronous VM_BIND. Asynchronous VM_BIND requi=
res
> >>> that any page table needed for a map/unmap operation to succeed be
> >>> allocated at VM_BIND job creation time. At the time of the job creati=
on,
> >>> we don't know what the VM will look like when we get to execute the
> >>> map/unmap, and can't guess how many page tables we will need. Because
> >>> of that, we have to over-provision page tables for the worst case
> >>> scenario (page table tree is empty), which means we will allocate/free
> >>> a lot. Having pool a pool of free pages is crucial if we want to
> >>> speed-up VM_BIND requests.
> >>>
> >>> A real example of how such custom allocators can be used is available
> >>> here[1]. v2 of the Panthor driver is approaching submission, and I
> >>> figured I'd try to upstream the dependencies separately, which is
> >>> why I submit this series now, even though the user of this new API
> >>> will come afterwards. If you'd prefer to have those patches submitted
> >>> along with the Panthor driver, let me know.
> >>>
> >>> This approach has been discussed with Robin, and is hopefully not too
> >>> far from what he had in mind. =20
> >>
> >> The alternative would be to embed a cache of pages into the IOMMU
> >> framework, however kmem_cache sadly doesn't seem to support the
> >> 'reserve' of pages concept that we need. mempools could be a solution
> >> but the mempool would need to be created by the IOMMU framework as the
> >> alloc/free functions are specified when creating the pool. So it would
> >> be a much bigger change (to drivers/iommu).
> >>
> >> So, given that so far it's just Panthor this seems like the right
> >> approach for now - when/if other drivers want the same functionality
> >> then it might make sense to revisit the idea of doing the caching with=
in
> >> the IOMMU framework. =20
> >=20
> > I have some plans to use this as well for drm/msm.. but the reasons
> > and requirements are basically the same as for panthor.  I think I
> > prefer the custom allocator approach, rather than tying this to IOMMU
> > framework.  (But ofc custom allocators, I guess, does not prevent the
> > iommu driver from doing it's own caching.)
> >=20
> > BR,
> > -R
> >  =20
>=20
> We have also posted one RFC patch series which is based on this current=20
> patches by Boris and helping us to define our custom alloc and free=20
> pgtable call. For our side usecase we have a requirement to create=20
> pgtable from HLOS and then share it to different entity(VMID) and=20
> basically that also requires few smc calls and for that we need
> custom alloc/free callbacks.
>=20
> https://lore.kernel.org/all/20231101071144.16309-1-quic_gkohli@quicinc.co=
m/
>=20
>=20
> So custom allocator and free ops is helping for us also. Is there any=20
> plan to merge these patches from Boris.

Sorry for the late reply. I just sent a v2, but I forgot to add your
Tested-by :-/. Feel free to add it back.

Regards,

Boris

