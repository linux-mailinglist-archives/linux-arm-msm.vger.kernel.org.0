Return-Path: <linux-arm-msm+bounces-115973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ridAKNORmrAQQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:42:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D46F6DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:42:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Zh8gMbcs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vtJW1UBj;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Zh8gMbcs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vtJW1UBj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0D993030137
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCA444D015;
	Thu,  2 Jul 2026 11:40:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DB546AF3B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 11:40:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992440; cv=none; b=KMDx09WQQ+NBOijKyjrSjr5uXdEfI4NEp4g8XJNaUK5j1PT2R7D41tHqbuaQOH3IWQom7FdZ8Lo5t6RVEvMAl3aCkuASofqoqTFC6x0E5rVO/FBxQM+zMolGj1Iw0bvnsfDs67wWTTbsUkIw2ueIM7Sq5Escxh2pz+1gMGfUzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992440; c=relaxed/simple;
	bh=/KU+qwds20JhaSAHS/0qK/0mpH1n/3CgmSllPI3f0zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdu4n0w+XhA4f5Detb6JtdqqXXMm96FCPRLxaa7QJQFqK9VpyC5BpxV1L2z/IK6gSbEUCFzRsRRGsA9dryMu4fd4Qxlm7ZrdaoO1M1vUmvpXrFuk2+fgtbDMZyKqicVdkyZA7FoExj95XuVwlxMnvZk7j0LZ01X5MKHSabAF4yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zh8gMbcs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vtJW1UBj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zh8gMbcs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vtJW1UBj; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9145C75B6A;
	Thu,  2 Jul 2026 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782992436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYFKxI5JULp8gb+ekuRNTWlzvX21cjaKiqCcXlOBcMI=;
	b=Zh8gMbcsGVZsWYcj7s6NxFpfr5kyL+dCesoL+NYZ+EODYF9IH6Hd/X0L9JWcLlDuAVVzRD
	lkFU6fooAwjkvyipCSd6pYrI7ul5JbqcH2WSEGXi2kMhtzt1GEarB+i/bLdIQKj10vBGbz
	EhZtRvw0lzIZvhvJ2rPwW99GAu7sGKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782992436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYFKxI5JULp8gb+ekuRNTWlzvX21cjaKiqCcXlOBcMI=;
	b=vtJW1UBjyxnbfNoeO2SWUq2seB26JDH9poeuyJMl+C0R4u0Xqidess1m7AhGShw5crqNPY
	FyMzXeg34AXEWFBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782992436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYFKxI5JULp8gb+ekuRNTWlzvX21cjaKiqCcXlOBcMI=;
	b=Zh8gMbcsGVZsWYcj7s6NxFpfr5kyL+dCesoL+NYZ+EODYF9IH6Hd/X0L9JWcLlDuAVVzRD
	lkFU6fooAwjkvyipCSd6pYrI7ul5JbqcH2WSEGXi2kMhtzt1GEarB+i/bLdIQKj10vBGbz
	EhZtRvw0lzIZvhvJ2rPwW99GAu7sGKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782992436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYFKxI5JULp8gb+ekuRNTWlzvX21cjaKiqCcXlOBcMI=;
	b=vtJW1UBjyxnbfNoeO2SWUq2seB26JDH9poeuyJMl+C0R4u0Xqidess1m7AhGShw5crqNPY
	FyMzXeg34AXEWFBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16BA4779AA;
	Thu,  2 Jul 2026 11:40:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1gA3AjBORmrpAgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 02 Jul 2026 11:40:32 +0000
Date: Thu, 2 Jul 2026 12:40:30 +0100
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
Subject: Re: [PATCH 27/30] mm/vma: correct incorrect vma.h inclusion
Message-ID: <akZNiN5Y9fPk8bZH@pedro-suse.lan>
References: <cover.1782735110.git.ljs@kernel.org>
 <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22d0f4e3fe11f6fd1312734e242d008267ad142c.1782735110.git.ljs@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	TAGGED_FROM(0.00)[bounces-115973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szyprow
 ski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pedro-suse.lan:mid,suse.de:dkim,suse.de:email,suse.de:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 834D46F6DF5

On Mon, Jun 29, 2026 at 01:23:38PM +0100, Lorenzo Stoakes wrote:
> The only files which should be including vma.h are the implementation files
> for the core VMA logic - vma.c, vma_init.c, and vma_exec.c.
> 
> This is in order to allow for userland testing of core VMA logic. In this
> cases, vma_internal.h and vma.h are included, providing both the
> dependencies upon which the core VMA logic requires and its declarations.
> 
> Userland testable VMA logic is achieved by having separate vma_internal.h
> implementations for userland and kernel.
> 
> Callers other than the core VMA implementation should include internal.h
> instead. This header does not need to include vma_internal.h as it only
> contains the vma.h declarations, for which the includes already present
> suffice.
> 
> Update code to reflect this, update comments to reflect the fact there are
> 3 VMA implementation files and document things more clearly.
> 
> While we're here, slightly improve the language of the comment describing
> vma_exec.c.

Two random thoughts:
1) perhaps vma.h -> vma_private.h
2) https://lore.kernel.org/all/CAHk-=wghMm2c+AYEcwYY7drSVXB27DYqc-ZXpFiq=XFs-w59wA@mail.gmail.com/
   mm/vma/whatever.c :) would PROBABLY solve the issue of people snooping vma.h

> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

> ---
>  mm/mmu_notifier.c | 2 +-
>  mm/nommu.c        | 1 -
>  mm/vma.c          | 4 ++++
>  mm/vma.h          | 9 ++++++++-
>  mm/vma_exec.c     | 8 ++++++--
>  mm/vma_init.c     | 4 ++++
>  mm/vma_internal.h | 4 ++--
>  7 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 245b74f39f91..df69ba6e797f 100644
> --- a/mm/mmu_notifier.c
> +++ b/mm/mmu_notifier.c
> @@ -19,7 +19,7 @@
>  #include <linux/sched/mm.h>
>  #include <linux/slab.h>
>  
> -#include "vma.h"
> +#include "internal.h"
>  
>  /* global SRCU for all MMs */
>  DEFINE_STATIC_SRCU(srcu);
> diff --git a/mm/nommu.c b/mm/nommu.c
> index ba1c923c0942..4fef6fbbd6e9 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -41,7 +41,6 @@
>  #include <asm/tlbflush.h>
>  #include <asm/mmu_context.h>
>  #include "internal.h"
> -#include "vma.h"
>  
>  unsigned long highest_memmap_pfn;
>  int heap_stack_gap = 0;
> diff --git a/mm/vma.c b/mm/vma.c
> index d727150e377a..5c3062e0e706 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -4,6 +4,10 @@
>   * VMA-specific functions.
>   */
>  
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
>  #include "vma_internal.h"
>  #include "vma.h"
>  
> diff --git a/mm/vma.h b/mm/vma.h
> index 155eadda47aa..f4f885615a92 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -2,7 +2,14 @@
>  /*
>   * vma.h
>   *
> - * Core VMA manipulation API implemented in vma.c.
> + * Core VMA manipulation API implemented in vma.c, vma_init.c and vma_exec.c.
> + *
> + * Note that, in order for VMA logic to be userland testable, this header
> + * intentionally includes no dependencies.
> + *
> + * This is specifically scoped to mm-only. Users of this functionality (other
> + * than the core VMA implementation itself) should not include this header
> + * directly, but rather include internal.h.
>   */
>  #ifndef __MM_VMA_H
>  #define __MM_VMA_H
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 0107a6e3918c..c0f7ba2cfb27 100644
> --- a/mm/vma_exec.c
> +++ b/mm/vma_exec.c
> @@ -1,10 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  /*
> - * Functions explicitly implemented for exec functionality which however are
> - * explicitly VMA-only logic.
> + * Functions provided for exec functionality which however are
> + * specifically VMA-only logic.
>   */
>  
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
>  #include "vma_internal.h"
>  #include "vma.h"
>  
> diff --git a/mm/vma_init.c b/mm/vma_init.c
> index a459669a1654..715feee283f0 100644
> --- a/mm/vma_init.c
> +++ b/mm/vma_init.c
> @@ -5,6 +5,10 @@
>   * between CONFIG_MMU and non-CONFIG_MMU kernel configurations.
>   */
>  
> +/*
> + * To allow for userland testing we place internal dependencies in
> + * vma_internal.h and external VMA API declarations in vma.h.
> + */
>  #include "vma_internal.h"
>  #include "vma.h"
>  
> diff --git a/mm/vma_internal.h b/mm/vma_internal.h
> index 2da6d224c1a8..4d300e7bbaf4 100644
> --- a/mm/vma_internal.h
> +++ b/mm/vma_internal.h
> @@ -2,8 +2,8 @@
>  /*
>   * vma_internal.h
>   *
> - * Headers required by vma.c, which can be substituted accordingly when testing
> - * VMA functionality.
> + * Headers required by vma.c, vma_init.c and vma_exec.c, which can be
> + * substituted accordingly when testing VMA functionality.
>   */
>  
>  #ifndef __MM_VMA_INTERNAL_H
> -- 
> 2.54.0
> 

-- 
Pedro

