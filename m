Return-Path: <linux-arm-msm+bounces-115964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2MqFO6ZPRmoOQgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:46:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED746F6F75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:46:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b1V0EUVs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VpW3Ejyl;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b1V0EUVs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VpW3Ejyl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115964-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115964-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3A0931B36BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20904189D4;
	Thu,  2 Jul 2026 11:30:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82B3909A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:30:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991805; cv=none; b=MLclvfXFQV6Jo9YSMTirTGmfUG3xDeY/jCZNEBLDQOmp8mZ9HwgNsApLLSgF3WYbvlApnZQUfGqhMDXHDJvigyKP7mw7h3jo3cZhWxh/ilnYcUbTZ6GtzBP3Jk4GJxvUw7v3TsUxDi3yrR5R4g4/SXJ77anAsEgM8iPSAcLxANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991805; c=relaxed/simple;
	bh=8jjfSPYg5U66L8zK7oshft2R9Q5n1QusWIFSP0r0Zy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+sw6H4eaPC/RnnNtqSnzt69Bjrqh9skFzRyNYDg1dYw7R5Wb43HJy/QCjcIxK09UdBswKHixURExLrh/H+YXp9wvm4OQG4KzeMN+VpmvYR7loBIkWLQHS6AzzdaCUGacZzoUQlqZaGEMTgqBxAwOxmNOd5fALmGX//cahKMy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b1V0EUVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VpW3Ejyl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b1V0EUVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VpW3Ejyl; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B0B874188;
	Thu,  2 Jul 2026 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782991801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ5WNGbzin/8vtFDbM8MbJVMoDULad2+FK2cbMLRvxc=;
	b=b1V0EUVs7Ryzq47sXHyoMJr4JZZKjRZAq5PgvmgMFnAklikv2OYEmEeg7B9svz/QHBrX66
	mB5yghfOAlHB0fX34t3q3IyNpEXuiXPxIfmxCvscO3OL7qd/yQ7G0KmD4Jd8J5jXHJYIVS
	NCERshvGZ/f1dJtc20DF60zU/Yynep8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782991801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ5WNGbzin/8vtFDbM8MbJVMoDULad2+FK2cbMLRvxc=;
	b=VpW3EjylCJF5yoxNrG2csldpuwjxwS7DCjeAVumRCzdwPhw4Sr5LNXAnK/UsjhF5SleOX3
	PJir6mDWAi97z3AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782991801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ5WNGbzin/8vtFDbM8MbJVMoDULad2+FK2cbMLRvxc=;
	b=b1V0EUVs7Ryzq47sXHyoMJr4JZZKjRZAq5PgvmgMFnAklikv2OYEmEeg7B9svz/QHBrX66
	mB5yghfOAlHB0fX34t3q3IyNpEXuiXPxIfmxCvscO3OL7qd/yQ7G0KmD4Jd8J5jXHJYIVS
	NCERshvGZ/f1dJtc20DF60zU/Yynep8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782991801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ5WNGbzin/8vtFDbM8MbJVMoDULad2+FK2cbMLRvxc=;
	b=VpW3EjylCJF5yoxNrG2csldpuwjxwS7DCjeAVumRCzdwPhw4Sr5LNXAnK/UsjhF5SleOX3
	PJir6mDWAi97z3AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F893779AA;
	Thu,  2 Jul 2026 11:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4DAfI7RLRmr5dgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 02 Jul 2026 11:29:56 +0000
Date: Thu, 2 Jul 2026 12:29:54 +0100
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
Subject: Re: [PATCH 25/30] mm/vma: update vmg_adjust_set_range() to offset
 pgoff instead
Message-ID: <akZLhkjsJ_3sGdox@pedro-suse.lan>
References: <cover.1782735110.git.ljs@kernel.org>
 <910f7b5be78232304dc7ca01cd57c6f5ca8f3d13.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910f7b5be78232304dc7ca01cd57c6f5ca8f3d13.1782735110.git.ljs@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-115964-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pedro-suse.lan:mid,suse.de:dkim,suse.de:email,suse.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ED746F6F75

On Mon, Jun 29, 2026 at 01:23:36PM +0100, Lorenzo Stoakes wrote:
> We are calculating the pgoff as an offset, since we have vma_add_pgoff()
> and vma_sub_pgoff() available, just offset this value directly and use
> __vma_set_range() for vma->vm_[start, end] values.
> 
> We take care to update the range before offsetting the page offset, so the
> adjusted VMA's vm_start and vm_pgoff are mutually consistent at the point
> the page offset helpers operate - this matters once vma_set_pgoff() comes
> to assert invariants which relate the two.
> 
> Doing so lays the foundation for future work which allows for use of
> virtual page offsets for MAP_PRIVATE-file backed mappings.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  mm/vma.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index e3355eab11f2..0579fc8c9bd5 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -714,9 +714,6 @@ void validate_mm(struct mm_struct *mm)
>   */
>  static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
>  {
> -	struct vm_area_struct *adjust;
> -	pgoff_t pgoff;
> -
>  	if (vmg->__adjust_middle_start) {
>  		/*
>  		 * vmg->start    vmg->end
> @@ -735,8 +732,8 @@ static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
>  		struct vm_area_struct *middle = vmg->middle;
>  		const unsigned long delta = vmg->end - middle->vm_start;
>  
> -		pgoff = vma_start_pgoff(middle) + (delta >> PAGE_SHIFT);
> -		adjust = middle;
> +		__vma_set_range(middle, vmg->end, middle->vm_end);
> +		vma_add_pgoff(middle, delta >> PAGE_SHIFT);
>  	} else if (vmg->__adjust_next_start) {
>  		/*
>  		 *                Originally:
> @@ -764,13 +761,9 @@ static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
>  		struct vm_area_struct *next = vmg->next;
>  		const unsigned long delta = next->vm_start - vmg->end;
>  
> -		pgoff = vma_start_pgoff(next) - (delta >> PAGE_SHIFT);
> -		adjust = next;
> -	} else {
> -		return;
> +		__vma_set_range(next, vmg->end, next->vm_end);
> +		vma_sub_pgoff(next, delta >> PAGE_SHIFT);
>  	}
> -
> -	vma_set_range(adjust, vmg->end, adjust->vm_end, pgoff);
>  }

Maybe this should be squashed with That Other Patch that touches this.

Anyway,

Reviewed-by: Pedro Falcato <pfalcato@suse.de> 

-- 
Pedro

