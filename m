Return-Path: <linux-arm-msm+bounces-47807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01536A32E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3683A674C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249E9263F2D;
	Wed, 12 Feb 2025 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KCp6fFDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24883260A49
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384397; cv=none; b=cLUTO5YDrSmllPdQOFX0Prykut99gZVC3N0Fv11O9XlP5fYvfg/Wb6vAO/fqRSvh4Ti079l4qt+I/ZN619R7hUb9hxHA+90FK2NRC/5guH9a85125ym+6Nah3MMlPHrI+thqPa2RNDSqWmffOEvk9IDw7MDeKJOgCbiy9ebYlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384397; c=relaxed/simple;
	bh=SU45/sVZe3bX14PqfSrlPSD+s0TbnFHh43x1wYWkSkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odRV32VYxCnO6BV1e9atBEreiATbISks3stB9Iwb8r9s1ldOWDot3Mvl4Uhs82UjYHGJwsTUkT6ERwK8IbJ8cU3w+LHLX3u8J6PvD2d4HmzKH/9yT0j+HfU4Oho5R3nBQAmZjeSVllCWrFvZhS5y8TpoHXyRlEM42nPanJSHO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KCp6fFDm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739384394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7TaJyS8UpMoetirTb14n4MP+blnMrufFTQ0BeKyiM/A=;
	b=KCp6fFDm+s73lNC5ckkpXbvgtY4DzKoHe3drsjguU1KHA5d/j98zFG7UuRa4GR5ygkz/fK
	Dl2/F82NcPydk3HoGX0+GyNmYscIGYy7Q2DeROKUCHasTbyCLSRVhRRmLLWameJLevyqLu
	uQ325qEAkV0+RgY9Q4xQ2HbodG8Aa5s=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-hzX7lgdKOLGoITYv7oiuUg-1; Wed, 12 Feb 2025 13:19:45 -0500
X-MC-Unique: hzX7lgdKOLGoITYv7oiuUg-1
X-Mimecast-MFC-AGG-ID: hzX7lgdKOLGoITYv7oiuUg
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2a983c18244so94883fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739384384; x=1739989184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TaJyS8UpMoetirTb14n4MP+blnMrufFTQ0BeKyiM/A=;
        b=cLVi5qUeYid0Sk+EEGDMlJsMiR9cpEQabKDPeFA5/PzDpgTCh5XeRNqr1Qh2fl+fle
         B8Ts/ExXcUDojT9B+URNPSYB8V4edj20jhp4iUAnaKzhRWVD8x6UNqna0/d3RlPRxtxQ
         TPPaqUBXzyITbMCYec+jSFje5BoaXr1oE+5bh+Sq3dcGUuVeYg0Jm8bQWjj4ob6EB8bB
         U+tWpx074jov4w/hoCLkyEzkMsSEUrTdazjCKNzk09w6d/WhMzFk8efufGD7t07nY5i2
         Ss+Q4ClMSOGrLRsfTcXDKHeT57Cb900ANbVTneYNntJt+TEwnT+erIkBJTpm0B6v7hvs
         8ltA==
X-Forwarded-Encrypted: i=1; AJvYcCWpnI01LoAeXNeqOz92XNov3Qh4SxmY0gezyazDAmXmBcKpYF7w/Uy/5y6vL2+sXZ+hlFaz5lkJe6Pt1l/J@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmcnPmOSW7lDS78qpeT4odFWuGGmTuWKoMi+qcfOh7l9BRHHD
	LtSXC6UmDNylrZb+7XqKOTuu+zr+o/krKgTakSluRu2lgCINQNE8Y0jqlKRSzlb9j338Nk3jcO4
	vpsmvQRRTE1vRRjbP/AA/wsi1YLys4f15kBEa1d4V8yWBuHk+R9p0ypTt/nPnFng=
X-Gm-Gg: ASbGnctmvuOmY12UyUk5it4UMxIncisPf4unyeoz2pg+uYUfzHBV3ElKdJX8Uedwn0e
	Zad0EFhN78hPfYX/V/FBjuiMVxH9X3FmHmWIpCLWUJ28Xfp+Th/nYrEdmxOzMLGWldJULvUzpxm
	FnQFeRf2Jw1aV4rO/WDXf4Bm2/nKVCmzvY+wg0bu5tzao6URXmK32rRk9kJ9P8ruBAuTtc+T+B8
	RCCmCufP5GHn7WvNUjys2h8qODmb/Pov4ikrQFs7IxRsBo+jCllS+V/JjU=
X-Received: by 2002:a05:6870:910a:b0:288:6a16:fe1 with SMTP id 586e51a60fabf-2b8d65a165fmr2608384fac.18.1739384384110;
        Wed, 12 Feb 2025 10:19:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6yLCJZv0DxHVkLCCWT8uUox4uppNsodWZzjO6mSf7H+Gw6LNzcNxExlJipAp5dck6BfMKUA==
X-Received: by 2002:a05:6870:910a:b0:288:6a16:fe1 with SMTP id 586e51a60fabf-2b8d65a165fmr2608348fac.18.1739384383715;
        Wed, 12 Feb 2025 10:19:43 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b832f1e59asm4880842fac.49.2025.02.12.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 10:19:43 -0800 (PST)
Date: Wed, 12 Feb 2025 13:19:37 -0500
From: Peter Xu <peterx@redhat.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	xiaoyao.li@intel.com, yilun.xu@intel.com,
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
	dmatlack@google.com, yu.c.zhang@linux.intel.com,
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
	vannapurve@google.com, ackerleytng@google.com,
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
	wei.w.wang@intel.com, liam.merwick@oracle.com,
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
	quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
	quic_pheragu@quicinc.com, catalin.marinas@arm.com,
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
	maz@kernel.org, will@kernel.org, qperret@google.com,
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org,
	hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
	jthoughton@google.com
Subject: Re: [PATCH v3 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
Message-ID: <Z6zmOQLrAjhhM1Pn@x1.local>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-3-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250211121128.703390-3-tabba@google.com>

On Tue, Feb 11, 2025 at 12:11:18PM +0000, Fuad Tabba wrote:
> Before transitioning a guest_memfd folio to unshared, thereby
> disallowing access by the host and allowing the hypervisor to
> transition its view of the guest page as private, we need to be
> sure that the host doesn't have any references to the folio.
> 
> This patch introduces a new type for guest_memfd folios, which
> isn't activated in this series but is here as a placeholder and
> to facilitate the code in the next patch. This will be used in
> the future to register a callback that informs the guest_memfd
> subsystem when the last reference is dropped, therefore knowing
> that the host doesn't have any remaining references.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  include/linux/kvm_host.h   |  9 +++++++++
>  include/linux/page-flags.h | 17 +++++++++++++++++
>  mm/debug.c                 |  1 +
>  mm/swap.c                  |  9 +++++++++
>  virt/kvm/guest_memfd.c     |  7 +++++++
>  5 files changed, 43 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f34f4cfaa513..8b5f28f6efff 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2571,4 +2571,13 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  				    struct kvm_pre_fault_memory *range);
>  #endif
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +void kvm_gmem_handle_folio_put(struct folio *folio);
> +#else
> +static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> +{
> +	WARN_ON_ONCE(1);
> +}
> +#endif
> +
>  #endif
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 6dc2494bd002..734afda268ab 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -933,6 +933,17 @@ enum pagetype {
>  	PGTY_slab	= 0xf5,
>  	PGTY_zsmalloc	= 0xf6,
>  	PGTY_unaccepted	= 0xf7,
> +	/*
> +	 * guestmem folios are used to back VM memory as managed by guest_memfd.
> +	 * Once the last reference is put, instead of freeing these folios back
> +	 * to the page allocator, they are returned to guest_memfd.
> +	 *
> +	 * For now, guestmem will only be set on these folios as long as they
> +	 * cannot be mapped to user space ("private state"), with the plan of
> +	 * always setting that type once typed folios can be mapped to user
> +	 * space cleanly.

Does it imply that gmem folios can be mapped to userspace at some point?
It'll be great if you can share more about it, since as of now it looks
like anything has a page type cannot use the per-page mapcount.

When looking at this, I also found that __folio_rmap_sanity_checks() has
some folio_test_hugetlb() tests, not sure whether they're prone to be
changed too e.g. to cover all pages that have a type, so as to cover gmem.

For the longer term, it'll be definitely nice if gmem folios can be
mapcounted just like normal file folios.  It can enable gmem as a backstore
just like what normal memfd would do, with gmem managing the folios.

> +	 */
> +	PGTY_guestmem	= 0xf8,
>  
>  	PGTY_mapcount_underflow = 0xff
>  };
> @@ -1082,6 +1093,12 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
>  FOLIO_TEST_FLAG_FALSE(hugetlb)
>  #endif
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM

This seems to only be defined in follow up patches.. so may need some
adjustments.

> +FOLIO_TYPE_OPS(guestmem, guestmem)
> +#else
> +FOLIO_TEST_FLAG_FALSE(guestmem)
> +#endif
> +
>  PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
>  
>  /*
> diff --git a/mm/debug.c b/mm/debug.c
> index 8d2acf432385..08bc42c6cba8 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -56,6 +56,7 @@ static const char *page_type_names[] = {
>  	DEF_PAGETYPE_NAME(table),
>  	DEF_PAGETYPE_NAME(buddy),
>  	DEF_PAGETYPE_NAME(unaccepted),
> +	DEF_PAGETYPE_NAME(guestmem),
>  };
>  
>  static const char *page_type_name(unsigned int page_type)
> diff --git a/mm/swap.c b/mm/swap.c
> index 47bc1bb919cc..241880a46358 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -38,6 +38,10 @@
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +#include <linux/kvm_host.h>
> +#endif
> +
>  #include "internal.h"
>  
>  #define CREATE_TRACE_POINTS
> @@ -101,6 +105,11 @@ static void free_typed_folio(struct folio *folio)
>  	case PGTY_hugetlb:
>  		free_huge_folio(folio);
>  		return;
> +#endif
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +	case PGTY_guestmem:
> +		kvm_gmem_handle_folio_put(folio);
> +		return;
>  #endif
>  	default:
>  		WARN_ON_ONCE(1);
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b2aa6bf24d3a..c6f6792bec2a 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -312,6 +312,13 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>  	return gfn - slot->base_gfn + slot->gmem.pgoff;
>  }
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +void kvm_gmem_handle_folio_put(struct folio *folio)
> +{
> +	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> +}
> +#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
> +
>  static struct file_operations kvm_gmem_fops = {
>  	.open		= generic_file_open,
>  	.release	= kvm_gmem_release,
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 
> 

-- 
Peter Xu


