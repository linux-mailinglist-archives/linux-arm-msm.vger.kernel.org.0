Return-Path: <linux-arm-msm+bounces-117265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwpfKX3UTGreqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9B871A589
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:27:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=vJW3jw9F;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117265-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117265-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 156553079C4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F24D3E00BC;
	Tue,  7 Jul 2026 10:20:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873943E0C70
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:20:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419644; cv=none; b=cX3Up7cq9Gq2MrzRU6LFhCMeEBBc54+swXVjYgg5NFEkCUqH9y1oozHwhGy+vcLnhU2Zoh0V2m+qb61nUM8WIYuOhor2hqiJyopTUixIOrz7UQaSybzu4HYBEb30lb1/9xE7Lz/nHr0vVfwHhsei4SqgC/qfuwCGP/mFDYNC7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419644; c=relaxed/simple;
	bh=VCE9WS4zG0XYGDT6yveV9PjHBy3Cmcgk0yB8h8VkIU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=rB+/k3ADkmzpL7Sz6KBTFIjxz9mNzm6xqqOnSsSbFdbD33VOL1FBrI08RZFFVUT3r7TFXAjESWeNBEG+NXltAuR/vCCM8dMGn0vK+24OskO9/cJ0eSizrisVsw5LP8J9Bx6OKqhn39lUyL6dwpQ1Yyv4ewKX40tNdNzmcrQL+yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vJW3jw9F; arc=none smtp.client-ip=210.118.77.11
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707102035euoutp01d9470435bbe03893f82bf61124a29f47~-_rWxf_tA0069500695euoutp01b
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:20:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707102035euoutp01d9470435bbe03893f82bf61124a29f47~-_rWxf_tA0069500695euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783419635;
	bh=lmb/5Y9eqdFEyGZnoKkjY5KUURxdOJiW/7gAlorWsrg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=vJW3jw9FiZcG7/UHGkwH5JaAnf6ymNATTIxiifa8jlb3yOBOH89Uxh08+r7oDerxK
	 EsZlhcXiTTGBxrPKV9jqlCOxkEOVuGH7hnN2EzBNjFuPApcWvDHEmCGtwJRVBF100F
	 URSllvY91M4pWP+UFs1gKAqGZkVKvNvgkBMmLRYg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707102035eucas1p1c2fe59754f05ce2ac4d33a261d491e9f~-_rWYpPrG2875828758eucas1p16;
	Tue,  7 Jul 2026 10:20:35 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707102034eusmtip12c241a5a2db256b2323ea93fdaf0bc36~-_rVbfelg1926719267eusmtip14;
	Tue,  7 Jul 2026 10:20:34 +0000 (GMT)
Message-ID: <54596eee-191d-4370-a0e1-44b5b7387c3a@samsung.com>
Date: Tue, 7 Jul 2026 12:20:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 17/30] mm: prefer vma_[start,end]_pgoff() to
 vma->vm_pgoff in kernel/
To: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-sgx@vger.kernel.org,
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org,
	iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	damon@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260707102035eucas1p1c2fe59754f05ce2ac4d33a261d491e9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260629122451eucas1p29aab6e559201e31a45e7051d4a700347
X-EPHeader: CA
X-CMS-RootMailID: 20260629122451eucas1p29aab6e559201e31a45e7051d4a700347
References: <cover.1782735110.git.ljs@kernel.org>
	<CGME20260629122451eucas1p29aab6e559201e31a45e7051d4a700347@eucas1p2.samsung.com>
	<ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.15 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117265-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,samsung.com:from_mime,samsung.com:email,samsung.com:mid,samsung.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A9B871A589

On 29.06.2026 14:23, Lorenzo Stoakes wrote:
> Be consistent in using vma_start_pgoff() and vma_end_pgoff(), which clearly
> indicates which part of the VMA the page offset refers to and aids
> greppability.
>
> This is part of a broader series laying the ground to provide a virtual
> page offset for MAP_PRIVATE-file backed anon folios.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  kernel/dma/coherent.c      |  7 ++++---
>  kernel/dma/direct.c        |  6 ++++--
>  kernel/dma/mapping.c       |  8 +++++---
>  kernel/dma/ops_helpers.c   |  4 ++--


Acked-by: Marek Szyprowski <m.szyprowski@samsung.com> # for kernel/dma


>  kernel/events/core.c       | 20 +++++++++++---------
>  kernel/events/uprobes.c    | 11 +++++++----
>  kernel/kcov.c              |  2 +-
>  kernel/trace/ring_buffer.c |  3 ++-
>  8 files changed, 36 insertions(+), 25 deletions(-)
>
> diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> index bcdc0f76d2e8..2d3195eb7e83 100644
> --- a/kernel/dma/coherent.c
> +++ b/kernel/dma/coherent.c
> @@ -236,14 +236,15 @@ static int __dma_mmap_from_coherent(struct dma_coherent_mem *mem,
>  {
>  	if (mem && vaddr >= mem->virt_base && vaddr + size <=
>  		   (mem->virt_base + ((dma_addr_t)mem->size << PAGE_SHIFT))) {
> -		unsigned long off = vma->vm_pgoff;
> +		const pgoff_t pgoff_start = vma_start_pgoff(vma);
> +		const pgoff_t pgoff_end = vma_end_pgoff(vma);
>  		int start = (vaddr - mem->virt_base) >> PAGE_SHIFT;
>  		unsigned long user_count = vma_pages(vma);
>  		int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
>  
>  		*ret = -ENXIO;
> -		if (off < count && user_count <= count - off) {
> -			unsigned long pfn = mem->pfn_base + start + off;
> +		if (pgoff_start < count && pgoff_end <= count) {
> +			unsigned long pfn = mem->pfn_base + start + pgoff_start;
>  			*ret = remap_pfn_range(vma, vma->vm_start, pfn,
>  					       user_count << PAGE_SHIFT,
>  					       vma->vm_page_prot);
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4391b797d4db..436310d6e4a2 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -534,6 +534,8 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>  	unsigned long user_count = vma_pages(vma);
>  	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
>  	unsigned long pfn = PHYS_PFN(dma_to_phys(dev, dma_addr));
> +	const pgoff_t pgoff_start = vma_start_pgoff(vma);
> +	const pgoff_t pgoff_end = vma_end_pgoff(vma);
>  	int ret = -ENXIO;
>  
>  	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
> @@ -545,9 +547,9 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>  	if (dma_mmap_from_global_coherent(vma, cpu_addr, size, &ret))
>  		return ret;
>  
> -	if (vma->vm_pgoff >= count || user_count > count - vma->vm_pgoff)
> +	if (pgoff_start >= count || pgoff_end > count)
>  		return -ENXIO;
> -	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
> +	return remap_pfn_range(vma, vma->vm_start, pfn + pgoff_start,
>  			user_count << PAGE_SHIFT, vma->vm_page_prot);
>  }
>  
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 4fe04669e5e6..c986639044e9 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -761,12 +761,14 @@ EXPORT_SYMBOL_GPL(dma_free_pages);
>  int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
>  		size_t size, struct page *page)
>  {
> -	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	const pgoff_t pgoff_start = vma_start_pgoff(vma);
> +	const pgoff_t pgoff_end = vma_end_pgoff(vma);
> +	const unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
>  
> -	if (vma->vm_pgoff >= count || vma_pages(vma) > count - vma->vm_pgoff)
> +	if (pgoff_start >= count || pgoff_end > count)
>  		return -ENXIO;
>  	return remap_pfn_range(vma, vma->vm_start,
> -			       page_to_pfn(page) + vma->vm_pgoff,
> +			       page_to_pfn(page) + pgoff_start,
>  			       vma_pages(vma) << PAGE_SHIFT, vma->vm_page_prot);
>  }
>  EXPORT_SYMBOL_GPL(dma_mmap_pages);
> diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> index 20caf9cabf69..6b5f9208d31c 100644
> --- a/kernel/dma/ops_helpers.c
> +++ b/kernel/dma/ops_helpers.c
> @@ -39,7 +39,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
>  #ifdef CONFIG_MMU
>  	unsigned long user_count = vma_pages(vma);
>  	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> -	unsigned long off = vma->vm_pgoff;
> +	unsigned long off = vma_start_pgoff(vma);
>  	struct page *page = dma_common_vaddr_to_page(cpu_addr);
>  	int ret = -ENXIO;
>  
> @@ -52,7 +52,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
>  		return -ENXIO;
>  
>  	return remap_pfn_range(vma, vma->vm_start,
> -			page_to_pfn(page) + vma->vm_pgoff,
> +			page_to_pfn(page) + vma_start_pgoff(vma),
>  			user_count << PAGE_SHIFT, vma->vm_page_prot);
>  #else
>  	return -ENXIO;
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 954c36e28101..d6d2d557ccb8 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6998,7 +6998,7 @@ static void perf_mmap_open(struct vm_area_struct *vma)
>  	refcount_inc(&event->mmap_count);
>  	refcount_inc(&event->rb->mmap_count);
>  
> -	if (vma->vm_pgoff)
> +	if (vma_start_pgoff(vma))
>  		refcount_inc(&event->rb->aux_mmap_count);
>  
>  	if (mapped)
> @@ -7032,7 +7032,7 @@ static void perf_mmap_close(struct vm_area_struct *vma)
>  	 * The AUX buffer is strictly a sub-buffer, serialize using aux_mutex
>  	 * to avoid complications.
>  	 */
> -	if (rb_has_aux(rb) && vma->vm_pgoff == rb->aux_pgoff &&
> +	if (rb_has_aux(rb) && vma_start_pgoff(vma) == rb->aux_pgoff &&
>  	    refcount_dec_and_mutex_lock(&rb->aux_mmap_count, &rb->aux_mutex)) {
>  		/*
>  		 * Stop all AUX events that are writing to this buffer,
> @@ -7190,7 +7190,8 @@ static int map_range(struct perf_buffer *rb, struct vm_area_struct *vma)
>  	 */
>  	for (pagenum = 0; pagenum < nr_pages; pagenum++) {
>  		unsigned long va = vma->vm_start + PAGE_SIZE * pagenum;
> -		struct page *page = perf_mmap_to_page(rb, vma->vm_pgoff + pagenum);
> +		struct page *page = perf_mmap_to_page(rb,
> +				vma_start_pgoff(vma) + pagenum);
>  
>  		if (page == NULL) {
>  			err = -EINVAL;
> @@ -7348,6 +7349,7 @@ static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
>  	u64 aux_offset, aux_size;
>  	struct perf_buffer *rb;
>  	int ret, rb_flags = 0;
> +	const pgoff_t pgoff_start = vma_start_pgoff(vma);
>  
>  	rb = event->rb;
>  	if (!rb)
> @@ -7366,11 +7368,11 @@ static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
>  	if (aux_offset < perf_data_size(rb) + PAGE_SIZE)
>  		return -EINVAL;
>  
> -	if (aux_offset != vma->vm_pgoff << PAGE_SHIFT)
> +	if (aux_offset != pgoff_start << PAGE_SHIFT)
>  		return -EINVAL;
>  
>  	/* already mapped with a different offset */
> -	if (rb_has_aux(rb) && rb->aux_pgoff != vma->vm_pgoff)
> +	if (rb_has_aux(rb) && rb->aux_pgoff != pgoff_start)
>  		return -EINVAL;
>  
>  	if (aux_size != nr_pages * PAGE_SIZE)
> @@ -7400,7 +7402,7 @@ static int perf_mmap_aux(struct vm_area_struct *vma, struct perf_event *event,
>  		if (vma->vm_flags & VM_WRITE)
>  			rb_flags |= RING_BUFFER_WRITABLE;
>  
> -		ret = rb_alloc_aux(rb, event, vma->vm_pgoff, nr_pages,
> +		ret = rb_alloc_aux(rb, event, pgoff_start, nr_pages,
>  				   event->attr.aux_watermark, rb_flags);
>  		if (ret) {
>  			refcount_dec(&rb->mmap_count);
> @@ -7457,7 +7459,7 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
>  		if (event->state <= PERF_EVENT_STATE_REVOKED)
>  			return -ENODEV;
>  
> -		if (vma->vm_pgoff == 0)
> +		if (!vma_start_pgoff(vma))
>  			ret = perf_mmap_rb(vma, event, nr_pages);
>  		else
>  			ret = perf_mmap_aux(vma, event, nr_pages);
> @@ -9884,7 +9886,7 @@ static bool perf_addr_filter_vma_adjust(struct perf_addr_filter *filter,
>  					struct perf_addr_filter_range *fr)
>  {
>  	unsigned long vma_size = vma->vm_end - vma->vm_start;
> -	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
> +	unsigned long off = vma_start_pgoff(vma) << PAGE_SHIFT;
>  	struct file *file = vma->vm_file;
>  
>  	if (!perf_addr_filter_match(filter, file, off, vma_size))
> @@ -9974,7 +9976,7 @@ void perf_event_mmap(struct vm_area_struct *vma)
>  			/* .tid */
>  			.start  = vma->vm_start,
>  			.len    = vma->vm_end - vma->vm_start,
> -			.pgoff  = (u64)vma->vm_pgoff << PAGE_SHIFT,
> +			.pgoff  = (u64)vma_start_pgoff(vma) << PAGE_SHIFT,
>  		},
>  		/* .maj (attr_mmap2 only) */
>  		/* .min (attr_mmap2 only) */
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index f23cebacbc6d..244651380ca1 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -144,12 +144,14 @@ static bool valid_vma(struct vm_area_struct *vma, bool is_register)
>  
>  static unsigned long offset_to_vaddr(struct vm_area_struct *vma, loff_t offset)
>  {
> -	return vma->vm_start + offset - ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> +	return vma->vm_start + offset -
> +		((loff_t)vma_start_pgoff(vma) << PAGE_SHIFT);
>  }
>  
>  static loff_t vaddr_to_offset(struct vm_area_struct *vma, unsigned long vaddr)
>  {
> -	return ((loff_t)vma->vm_pgoff << PAGE_SHIFT) + (vaddr - vma->vm_start);
> +	return ((loff_t)vma_start_pgoff(vma) << PAGE_SHIFT) +
> +		(vaddr - vma->vm_start);
>  }
>  
>  /**
> @@ -1482,7 +1484,7 @@ static int unapply_uprobe(struct uprobe *uprobe, struct mm_struct *mm)
>  		    file_inode(vma->vm_file) != uprobe->inode)
>  			continue;
>  
> -		offset = (loff_t)vma->vm_pgoff << PAGE_SHIFT;
> +		offset = (loff_t)vma_start_pgoff(vma) << PAGE_SHIFT;
>  		if (uprobe->offset <  offset ||
>  		    uprobe->offset >= offset + vma->vm_end - vma->vm_start)
>  			continue;
> @@ -2453,7 +2455,8 @@ static struct uprobe *find_active_uprobe_speculative(unsigned long bp_vaddr)
>  	if (!vm_file)
>  		return NULL;
>  
> -	offset = (loff_t)(vma->vm_pgoff << PAGE_SHIFT) + (bp_vaddr - vma->vm_start);
> +	offset = (loff_t)(vma_start_pgoff(vma) << PAGE_SHIFT) +
> +		(bp_vaddr - vma->vm_start);
>  	uprobe = find_uprobe_rcu(vm_file->f_inode, offset);
>  	if (!uprobe)
>  		return NULL;
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 1df373fb562b..b19b473c366a 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -512,7 +512,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
>  
>  	spin_lock_irqsave(&kcov->lock, flags);
>  	size = kcov->size * sizeof(unsigned long);
> -	if (kcov->area == NULL || vma->vm_pgoff != 0 ||
> +	if (kcov->area == NULL || vma_start_pgoff(vma) ||
>  	    vma->vm_end - vma->vm_start != size) {
>  		res = -EINVAL;
>  		goto exit;
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 56a328e94395..dfa493d54ef9 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7613,7 +7613,8 @@ static int __rb_inc_dec_mapped(struct ring_buffer_per_cpu *cpu_buffer,
>  static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
>  			struct vm_area_struct *vma)
>  {
> -	unsigned long nr_subbufs, nr_pages, nr_vma_pages, pgoff = vma->vm_pgoff;
> +	unsigned long nr_subbufs, nr_pages, nr_vma_pages;
> +	pgoff_t pgoff = vma_start_pgoff(vma);
>  	unsigned int subbuf_pages, subbuf_order;
>  	struct page **pages __free(kfree) = NULL;
>  	int p = 0, s = 0;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


