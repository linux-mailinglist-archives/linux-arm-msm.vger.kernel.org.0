Return-Path: <linux-arm-msm+bounces-115184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SWPiCcaJQmqZ9QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:05:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBD6DC705
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:05:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Fb4gXdfC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B365B30A72E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4703426D2B;
	Mon, 29 Jun 2026 14:57:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FD3E2AA1;
	Mon, 29 Jun 2026 14:57:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745032; cv=none; b=k+3WDCFauvgrn3wjhCIfjjQlN18OhLIIUYCZE/vOwlGbxO19o0shaX8WQYww1KfC4bAKEA9grHmTP9qUEbom/hnPm3rC1WQyDqfm7ySvNW2sAFwPE1sUAXcbIpZIWKDBlVXSuqXozawHn1wOPNp9d+Mv7mD/k/2eDciEXwjIl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745032; c=relaxed/simple;
	bh=LNgB0LZoHZw0fP3mNzpypR694eprJdbAT8t2kv7BsKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI5/5Ra45V/YDwNMQz8ePGi4cIwOMbqC2HJnXjf5w0BEYBatRgQbj7tczWiijqHkQ7/4oIbkOokcphb3MA8FcCQX0eBE4REHvb6MyP2hRLev9vZbyT9xWMfZcF58B7hG+65FCiqyJotAVyWNfsJ7b8uKGTU9MMv6a+ggv3Fs/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb4gXdfC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466751F00A3A;
	Mon, 29 Jun 2026 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782745029;
	bh=c8iLIqBeF3LyAyaueUWtK1sqEjRS1M9AqqZ5Dyw7Z58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fb4gXdfCr+2KFrFMF2IByaqjqN6OTvaWqQOC5SC3n+FH76BIVh2JDagVQM04zbj4i
	 z9UqiAHTat+mRSFXdSoYoJyzmoUlF3p6Jal6xe6vOj0QLi7S2K5h9jaYFUYjI+BSuq
	 9d7IwNlxDTjp3VQUkRtwL9oT//Ua6zIzQzWpQkWh48TlIzq75ChfxoMs7JMB6YBa+Q
	 ZxwQy1+SAoBg4NhXVNiEOzrZ3Dhl/wVvyFl01n5vJfnD+QDhnTEyYlWVs30E2o8W8y
	 wepBBBkvWmHWS2C9RD6SaF8XQCZzAuIK1yFyi3oKvRdndjk8kenHlAuuXYQ9iZ77Xx
	 OWjGalyUwbbUQ==
Date: Mon, 29 Jun 2026 15:56:48 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Lucas Stach <l.stach@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Christian Koenig <christian.koenig@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-sgx@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, kvm@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, damon@lists.linux.dev, 
	Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Message-ID: <akKHUPxEVCSlifn5@lucifer>
References: <cover.1782735110.git.ljs@kernel.org>
 <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
 <21c4d96a-cd1b-4c65-8a66-2223df3b6109@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21c4d96a-cd1b-4c65-8a66-2223df3b6109@suse.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115184-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprowski@samsung.com,m
 :peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:pfalcato@suse.de,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,suse.de,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,vger.kernel.org:from_smtp,lucifer:mid,suse.com:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3FBD6DC705

On Mon, Jun 29, 2026 at 03:56:33PM +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 29.06.26 um 14:23 schrieb Lorenzo Stoakes:
> > There are a number of places where we open code what linear_page_index()
> > and linear_page_delta() calculate.
> >
> > Replace this code with the appropriate functions for consistency.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>
> For the DRM changes:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

>
> See below for two additional comments.
>
>
> > ---
> >   arch/arm/mm/fault-armv.c              | 2 +-
> >   arch/x86/kernel/cpu/sgx/virt.c        | 3 ++-
> >   drivers/comedi/comedi_fops.c          | 3 ++-
> >   drivers/gpu/drm/etnaviv/etnaviv_gem.c | 3 ++-
> >   drivers/gpu/drm/gma500/gem.c          | 2 +-
> >   drivers/gpu/drm/msm/msm_gem.c         | 3 ++-
> >   drivers/gpu/drm/omapdrm/omap_gem.c    | 5 +++--
> >   drivers/gpu/drm/tegra/gem.c           | 3 ++-
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c       | 7 ++++---
> >   drivers/vfio/pci/nvgrace-gpu/main.c   | 3 ++-
> >   drivers/vfio/pci/vfio_pci_core.c      | 3 ++-
> >   mm/nommu.c                            | 2 +-
> >   mm/vma.c                              | 2 +-
> >   virt/kvm/guest_memfd.c                | 2 +-
> >   14 files changed, 26 insertions(+), 17 deletions(-)
> >
>
> [...]
>
> >   #include <linux/io.h>
> >   #include <linux/uaccess.h>
> > @@ -2462,7 +2463,7 @@ static int comedi_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >   {
> >   	struct comedi_buf_map *bm = vma->vm_private_data;
> >   	unsigned long offset =
> > -	    addr - vma->vm_start + (vma->vm_pgoff << PAGE_SHIFT);
> > +	    addr - vma->vm_start + (vma_start_pgoff(vma) << PAGE_SHIFT);
>
> This doesn't seem to belong here.

Ah yeah, I'll move that on a respin thanks!

>
> >   	if (len < 0)
> >   		return -EINVAL;
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > index b0436a1e103f..2e4d6d117ee2 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > @@ -6,6 +6,7 @@
> >   #include <drm/drm_prime.h>
> >   #include <drm/drm_print.h>
> >   #include <linux/dma-mapping.h>
> > +#include <linux/pagemap.h>
> >   #include <linux/shmem_fs.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/vmalloc.h>
> > @@ -188,7 +189,7 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
> >   	}
> >   	/* We don't use vmf->pgoff since that has the fake offset: */
> > -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +	pgoff = linear_page_delta(vma, vmf->address);
> >   	pfn = page_to_pfn(pages[pgoff]);
> > diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> > index 88f1e86c8903..2708e8c68f4c 100644
> > --- a/drivers/gpu/drm/gma500/gem.c
> > +++ b/drivers/gpu/drm/gma500/gem.c
> > @@ -288,7 +288,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
> >   	/* Page relative to the VMA start - we must calculate this ourselves
> >   	   because vmf->pgoff is the fake GEM offset */
> > -	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +	page_offset = linear_page_delta(vma, vmf->address);
> >   	/* CPU view of the page, don't go via the GART for CPU writes */
> >   	if (pobj->stolen)
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > index efd3d3c9a449..cbf723a5d86f 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/spinlock.h>
> >   #include <linux/shmem_fs.h>
> >   #include <linux/dma-buf.h>
> > +#include <linux/pagemap.h>
> >   #include <drm/drm_dumb_buffers.h>
> >   #include <drm/drm_prime.h>
> > @@ -360,7 +361,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
> >   	}
> >   	/* We don't use vmf->pgoff since that has the fake offset: */
> > -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +	pgoff = linear_page_delta(vma, vmf->address);
> >   	pfn = page_to_pfn(pages[pgoff]);
> > diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> > index 8e013e4f2c6b..00404fb6c29a 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> > @@ -5,6 +5,7 @@
> >    */
> >   #include <linux/dma-mapping.h>
> > +#include <linux/pagemap.h>
> >   #include <linux/seq_file.h>
> >   #include <linux/shmem_fs.h>
> >   #include <linux/spinlock.h>
> > @@ -359,7 +360,7 @@ static vm_fault_t omap_gem_fault_1d(struct drm_gem_object *obj,
> >   	pgoff_t pgoff;
> >   	/* We don't use vmf->pgoff since that has the fake offset: */
> > -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +	pgoff = linear_page_delta(vma, vmf->address);
> >   	if (omap_obj->pages) {
> >   		omap_gem_cpu_sync_page(obj, pgoff);
> > @@ -407,7 +408,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
> >   	const int m = DIV_ROUND_UP(omap_obj->width << fmt, PAGE_SIZE);
> >   	/* We don't use vmf->pgoff since that has the fake offset: */
> > -	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +	pgoff = linear_page_delta(vma, vmf->address);
> >   	/*
> >   	 * Actual address we start mapping at is rounded down to previous slot
> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > index 436394e04812..1d8d27a5ea89 100644
> > --- a/drivers/gpu/drm/tegra/gem.c
> > +++ b/drivers/gpu/drm/tegra/gem.c
> > @@ -13,6 +13,7 @@
> >   #include <linux/dma-buf.h>
> >   #include <linux/iommu.h>
> >   #include <linux/module.h>
> > +#include <linux/pagemap.h>
> >   #include <linux/vmalloc.h>
> >   #include <drm/drm_drv.h>
> > @@ -564,7 +565,7 @@ static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
> >   	if (!bo->pages)
> >   		return VM_FAULT_SIGBUS;
> > -	offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> > +	offset = linear_page_delta(vma, vmf->address);
> >   	page = bo->pages[offset];
> >   	return vmf_insert_page(vma, vmf->address, page);
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index a80510489c45..88babf435ac2 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -32,6 +32,7 @@
> >   #define pr_fmt(fmt) "[TTM] " fmt
> >   #include <linux/export.h>
> > +#include <linux/pagemap.h>
> >   #include <drm/ttm/ttm_bo.h>
> >   #include <drm/ttm/ttm_placement.h>
> > @@ -208,9 +209,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> >   	if (unlikely(err != 0))
> >   		return VM_FAULT_SIGBUS;
> > -	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
> > -		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
> > -	page_last = vma_pages(vma) + vma->vm_pgoff -
> > +	page_offset = linear_page_index(vma, address) -
> > +		drm_vma_node_start(&bo->base.vma_node);
> > +	page_last = vma_end_pgoff(vma) -
> >   		drm_vma_node_start(&bo->base.vma_node);
>
> Not your fault, but page_last seems misnamed here.

Yeah :)

>
> Best regards
> Thomas
>
> >   	if (unlikely(page_offset >= PFN_UP(bo->base.size)))
> > diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
> > index d07dcacb76bd..963fd8ded20d 100644
> > --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> > +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/jiffies.h>
> >   #include <linux/sched.h>
> >   #include <linux/pci-p2pdma.h>
> > +#include <linux/pagemap.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/memory-failure.h>
> > @@ -385,7 +386,7 @@ static unsigned long addr_to_pgoff(struct vm_area_struct *vma,
> >   	u64 pgoff = vma->vm_pgoff &
> >   		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
> > -	return ((addr - vma->vm_start) >> PAGE_SHIFT) + pgoff;
> > +	return linear_page_delta(vma, addr) + pgoff;
> >   }
> >   static vm_fault_t nvgrace_gpu_vfio_pci_huge_fault(struct vm_fault *vmf,
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index a28f1e99362c..55d4937d495a 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -19,6 +19,7 @@
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> >   #include <linux/notifier.h>
> > +#include <linux/pagemap.h>
> >   #include <linux/pci.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/slab.h>
> > @@ -1727,7 +1728,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
> >   	struct vm_area_struct *vma = vmf->vma;
> >   	struct vfio_pci_core_device *vdev = vma->vm_private_data;
> >   	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
> > -	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> > +	unsigned long pgoff = linear_page_delta(vma, addr);
> >   	unsigned long pfn = vma_to_pfn(vma) + pgoff;
> >   	vm_fault_t ret = VM_FAULT_FALLBACK;
> > diff --git a/mm/nommu.c b/mm/nommu.c
> > index 60560b2c457e..7333d855e974 100644
> > --- a/mm/nommu.c
> > +++ b/mm/nommu.c
> > @@ -1332,7 +1332,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >   	*region = *vma->vm_region;
> >   	new->vm_region = region;
> > -	npages = (addr - vma->vm_start) >> PAGE_SHIFT;
> > +	npages = linear_page_delta(vma, addr);
> >   	if (new_below) {
> >   		region->vm_top = region->vm_end = new->vm_end = addr;
> > diff --git a/mm/vma.c b/mm/vma.c
> > index ee3a8ca13d07..185d07397ca6 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -517,7 +517,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >   		new->vm_end = addr;
> >   	} else {
> >   		new->vm_start = addr;
> > -		new->vm_pgoff += ((addr - vma->vm_start) >> PAGE_SHIFT);
> > +		new->vm_pgoff += linear_page_delta(vma, addr);
> >   	}
> >   	err = -ENOMEM;
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index db57c5766ab6..f0e5da490866 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -440,7 +440,7 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
> >   static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> >   					     unsigned long addr, pgoff_t *ilx)
> >   {
> > -	pgoff_t pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> > +	pgoff_t pgoff = linear_page_index(vma, addr);
> >   	struct inode *inode = file_inode(vma->vm_file);
> >   	*ilx = inode->i_ino;
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
>
>

Cheers, Lorenzo

