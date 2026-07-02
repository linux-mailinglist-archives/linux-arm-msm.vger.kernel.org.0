Return-Path: <linux-arm-msm+bounces-115960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3RyKNpSRmorQwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:00:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B7D6F72FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:00:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ro4PTTVY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6MM1Lq6H;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="GV/Itq01";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5nYhQVu3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5BF83197CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1114189A7;
	Thu,  2 Jul 2026 11:23:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4923F0ABE
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:23:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991386; cv=none; b=IuH4HNll6rwzdmd9JkSq2RVJnYW2oh11rdkhISmUMXvSiPkszTCsf9+1vq1N07hW1dM1eoJpwAtmHJIJgJq8Zd4tZYqW7n3DnX0W0zU/gsFv+NGi+SSNsOAgWeHcHJm94qSGVRzBogk9FFqJb8SbP1uqKPAlO+WGXmxtkWaLqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991386; c=relaxed/simple;
	bh=Cm3h5kw0hq4Y1dxxfDTE2i/+ct+FWNfrNzTgxOAOkUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uormmLmxRerXHCurpl+7q8LrBCMVcDC9Qt7wPHeGaGXgm54Ktq2q/HzK8/bNm5oftDgj/Z76JURtg9WA23H1VI3yUQCL1wpGNQkywp2U1Gcl0sb+Lq/O+cPW1HR1r60O2fVp8jhFF3p4RiqnZOYB35evq/JFRkUuYrhrLQwSo00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ro4PTTVY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6MM1Lq6H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GV/Itq01; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5nYhQVu3; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFA6A7417E;
	Thu,  2 Jul 2026 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782991383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7xaY1chatxMbDS+bkHdDKtz5gi7DevdjEG9fkMCV6s=;
	b=Ro4PTTVYWY+1Q+fSKwEyvVu2C8wg4A/3I9Q78iaZYGw4wsBf4KYe0OjW/ycxajPQ+NinaV
	U+7AQsUiUzpmFuQW/oC4SHwm2oHtjCqvi8LHkj68eHuO6Ksqvr1sL+WX60ZsbMFQN4KMst
	xTAmxu8wNPqPfjnqdMkbdmwQi3Caduk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782991383;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7xaY1chatxMbDS+bkHdDKtz5gi7DevdjEG9fkMCV6s=;
	b=6MM1Lq6HQfyxs23J5i59XCUkYNE2uNE4hmunNf3pUp3/RQC4CiUp48fbAw7FGDghW9TAgJ
	NHrffu9XmvyHcgCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782991382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7xaY1chatxMbDS+bkHdDKtz5gi7DevdjEG9fkMCV6s=;
	b=GV/Itq01reePFivyP3CzosxcP5ecDENo4J5Kb17SNf2kRfHaporyigMdzRpOwyOqbJKxMT
	yNQAHWPINUpghfaUYXSCO0RuwIer22uaBWzD7KSeu9/4sqjBPRzEJ7tnmgoiLkyTh0CcJe
	W/nOvqyP59iPAm2xDJhADX3K4PTVAcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782991382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7xaY1chatxMbDS+bkHdDKtz5gi7DevdjEG9fkMCV6s=;
	b=5nYhQVu33i5FNBtO6J/0n4fnuPm9MNAx2mPkD+UuzyB0lIrDOEiiXfZF1wNHS7blpDFYY9
	/SawYRTr7rSaIHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58DC0779AA;
	Thu,  2 Jul 2026 11:22:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rIgoEhJKRmoEcAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 02 Jul 2026 11:22:58 +0000
Date: Thu, 2 Jul 2026 12:22:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <ljs@kernel.org>
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
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>, 
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
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 22/30] mm/vma: move __install_special_mapping() to vma.c
Message-ID: <akZJjNic8u0pDxgD@pedro-suse.lan>
References: <cover.1782735110.git.ljs@kernel.org>
 <b3254231831037ca3e9757e3e05c90072e04a6aa.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3254231831037ca3e9757e3e05c90072e04a6aa.1782735110.git.ljs@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	TAGGED_FROM(0.00)[bounces-115960-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:from_mime,pedro-suse.lan:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20B7D6F72FD

On Mon, Jun 29, 2026 at 01:23:33PM +0100, Lorenzo Stoakes wrote:
> This function is operating on VMAs and rightly belongs in vma.c, where it
> can be subject to VMA userland testing and allows us to isolate it from the
> rest of mm.
> 
> The _install_special_mapping() function will remain in mmap.c as a wrapper,
> since this is used by architecture-specific code.
> 
> Doing so allows us to isolate more functions in vma.c for the same reasons.
> 
> This forms part of work to allow for tracking MAP_PRIVATE file-backed
> mappings by their anonymous virtual page offset, as doing so allows us to
> isolate and keep code that interacts with this together.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  mm/mmap.c | 38 --------------------------------------
>  mm/vma.c  | 38 ++++++++++++++++++++++++++++++++++++++
>  mm/vma.h  |  5 +++++
>  3 files changed, 43 insertions(+), 38 deletions(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 2d09a57e3620..46174e706bbe 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1447,44 +1447,6 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf)
>  	return VM_FAULT_SIGBUS;
>  }
>  
> -static struct vm_area_struct *__install_special_mapping(
> -	struct mm_struct *mm,
> -	unsigned long addr, unsigned long len,
> -	vm_flags_t vm_flags, void *priv,
> -	const struct vm_operations_struct *ops)
> -{
> -	int ret;
> -	struct vm_area_struct *vma;
> -
> -	vma = vm_area_alloc(mm);
> -	if (unlikely(vma == NULL))
> -		return ERR_PTR(-ENOMEM);
> -
> -	vma_set_range(vma, addr, addr + len, 0);
> -	vm_flags |= mm->def_flags | VM_DONTEXPAND;
> -	if (pgtable_supports_soft_dirty())
> -		vm_flags |= VM_SOFTDIRTY;
> -	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> -	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -
> -	vma->vm_ops = ops;
> -	vma->vm_private_data = priv;
> -
> -	ret = insert_vm_struct(mm, vma);
> -	if (ret)
> -		goto out;
> -
> -	vm_stat_account(mm, vma->vm_flags, len >> PAGE_SHIFT);
> -
> -	perf_event_mmap(vma);
> -
> -	return vma;
> -
> -out:
> -	vm_area_free(vma);
> -	return ERR_PTR(ret);
> -}
> -
>  bool vma_is_special_mapping(const struct vm_area_struct *vma,
>  	const struct vm_special_mapping *sm)
>  {
> diff --git a/mm/vma.c b/mm/vma.c
> index cb7222e20c93..f4de706a2728 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -3399,3 +3399,41 @@ __weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
>  {
>  	return vma_kernel_pagesize(vma);
>  }
> +
> +struct vm_area_struct *__install_special_mapping(
> +	struct mm_struct *mm,
> +	unsigned long addr, unsigned long len,
> +	vm_flags_t vm_flags, void *priv,
> +	const struct vm_operations_struct *ops)
> +{
> +	int ret;
> +	struct vm_area_struct *vma;
> +
> +	vma = vm_area_alloc(mm);
> +	if (unlikely(vma == NULL))
> +		return ERR_PTR(-ENOMEM);
> +
> +	vma_set_range(vma, addr, addr + len, 0);
> +	vm_flags |= mm->def_flags | VM_DONTEXPAND;
> +	if (pgtable_supports_soft_dirty())
> +		vm_flags |= VM_SOFTDIRTY;
> +	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> +
> +	vma->vm_ops = ops;
> +	vma->vm_private_data = priv;
> +
> +	ret = insert_vm_struct(mm, vma);
> +	if (ret)
> +		goto out;
> +
> +	vm_stat_account(mm, vma->vm_flags, len >> PAGE_SHIFT);
> +
> +	perf_event_mmap(vma);
> +
> +	return vma;
> +
> +out:
> +	vm_area_free(vma);
> +	return ERR_PTR(ret);
> +}
> diff --git a/mm/vma.h b/mm/vma.h
> index 47fe35e5307e..14f026bf3be4 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -775,4 +775,9 @@ static inline bool map_deny_write_exec(const vma_flags_t *old,
>  }
>  #endif
>  
> +struct vm_area_struct *__install_special_mapping(struct mm_struct *mm,
> +		unsigned long addr, unsigned long len,
> +		vm_flags_t vm_flags, void *priv,
> +		const struct vm_operations_struct *ops);
> +
>  #endif	/* __MM_VMA_H */

I'm really annoyed that _install_special_mapping has a leading underscore.
That's it.

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro

