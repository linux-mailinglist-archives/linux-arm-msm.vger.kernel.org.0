Return-Path: <linux-arm-msm+bounces-51637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF4A65918
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DDE97ACD17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 16:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C8C19CCF5;
	Mon, 17 Mar 2025 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WDeEc73W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CF1A23B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230263; cv=none; b=kdyz03VH2TyW7d/J4jGJQGZ2a2Su82FC7Zf/klPqF8z1ZKnrfBJSrWA/uX6k1/PL0oWarfS4DQTY0o9z4aYJEqQpUK36ylbHzC9O/WaffPiiFDiYN7T83tLMeMNdayrO5TOr0X1a1G6s+6IcLXqu0O1Im8tWqvRyF8fYcgDZdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230263; c=relaxed/simple;
	bh=AYvKn9lvR53vfvVtkQ1ZWMYY3LZiEmRqnffjlMGPRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1v1VTMr845XmqbYb1FeBex1yX4MXAZ5APrQL5NwGhrvdp4Yfo3aEuZkLPdiBQODxvBa/5thJber5mMW5WNKFXoBSBPrAGzgQFUI4IZ2T+ipuf1mD+wc+ycu/c1m7974A5wfxpOOxQN32/9qJABMj7gC5WQpEOktxYChIprX4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WDeEc73W; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476693c2cc2so82231cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 09:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742230260; x=1742835060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BMJCbVZNzWKyrw0PFDa/hXbadO5iF//m5/R/8CU725g=;
        b=WDeEc73WUThzX1Iw5csGSn0Q1UoT/oHPwrJ08ijfPGcB64st99V3RaIF5rZO4cyD26
         7VuE/0L6H8qY1A70Yo+xt0reifRMjhG2icGI2W6QIIg+9Cly1ItZXV4NGh6niG05tvGb
         gwX38F/1/Cbt/wyJzwfwQOcexErXxPh7mPUbySMcB8yATC0Pec98aZ4eGDZyJ9FLOlrZ
         Xw4v+wgzMQmO0ezH33Z4NLw9wCP+d+Uqhi4jVUIkyw6N31ZRhFP7h0N/w0PJciqyCknh
         VvwxX1maIYHgGZFY2M12Eq0/hIE/RBCFKNC5Bwkv5y2EmkrWaOnhFr6I5VgqW7lOYSNu
         4jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230260; x=1742835060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMJCbVZNzWKyrw0PFDa/hXbadO5iF//m5/R/8CU725g=;
        b=Lu+cYniZsVcndIYbUuki6NqC/h4XQtas0xq2Bc+JgWGZSlYRMgzPSVXAlpJMZelPzR
         170/bzXGtec/aUihMFFu5UMj7nb5uUSiAmoUJwXx/xToXr5RPPFzq84g197LcHBPNaLf
         eX+37Nn22cRHuv80zzJIfRM0dvicd/pIMEOJ+cpJAcIGj4Qd52P1rxEv/KUp9bhE2Zuw
         NNydJfsiYJQgOIuXpQ7TloL3zfSBFNZlm7fuHPXR4SP3om61nVtBnJCRz174YBvOcoes
         +I98xyVKPA1HSnnYwnNRTA6xBK2hNDOwKvwh/w0Mt9j5aElSfGDNOY77/v7wACOWxj6E
         +nNw==
X-Forwarded-Encrypted: i=1; AJvYcCXvxtJGIp9/59/MJizY9Lp0Z55w9pDX3zPORj8xPH10suj5Ao0+Ru7OZF8aHIpDQb6jDuXb+IPsYo+n+epK@vger.kernel.org
X-Gm-Message-State: AOJu0YytTE79ycHm2wZuz0p75UB42xVTeAaq39wdmqpxc9WKw7olBqow
	vq9I3l2T0EN06wTIjOOh+/MY97+ldGE7kNZjRAQD8ri4nKD1cQnUZxIVgir+8G00GAtjNDemw08
	mUeut0U7cQOaudjU4knIeN1fgKHsDtRsQsihD
X-Gm-Gg: ASbGncsMO3Uu4l5TPazw3lJlHzw7miNeBULyrNH5Fg2X20M8v83ROWahdR5w4GAjIoo
	/ECGure6IREcjpmghlXylSpt/KWOe3efXH+3n4OUrBwitl1Yh4ZduhsR+vf7nV3bRFiv1/6AxGf
	PDIgt6y6pdsQn97xNb4lZP5K3T
X-Google-Smtp-Source: AGHT+IF6Orr4sUHoJpUx90HW8r5dlBhwAPLedSUqI8aM7Wg0m66ieHSV0fIkeZ/KxvbrgcW2stl5fVd/vCyh98qDxow=
X-Received: by 2002:a05:622a:2d1:b0:476:d668:fd1c with SMTP id
 d75a77b69052e-476d668fd5bmr5944231cf.2.1742230260012; Mon, 17 Mar 2025
 09:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <diqzy0x9rqf4.fsf@ackerleytng-ctop.c.googlers.com>
 <fe2955d4-c0a2-411a-9e50-a25cc15c75dd@suse.cz> <diqzmsdjk4fr.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzmsdjk4fr.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Mar 2025 16:50:22 +0000
X-Gm-Features: AQ5f1JphqvzmOeuUctWoYWwk76QOo4D6Zmd-e11cY6CJEXV8UR8W47qbNU6GbeI
Message-ID: <CA+EHjTymxxJVCQGufmEfRGFQRiG7G3thQraTW87SxiNXwauEwA@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] KVM: guest_memfd: Handle kvm_gmem_handle_folio_put()
 for KVM as a module
To: Ackerley Tng <ackerleytng@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Mon, 17 Mar 2025 at 16:27, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Vlastimil Babka <vbabka@suse.cz> writes:
>
> > On 3/13/25 14:49, Ackerley Tng wrote:
> >> Fuad Tabba <tabba@google.com> writes:
> >>
> >>> In some architectures, KVM could be defined as a module. If there is a
> >>> pending folio_put() while KVM is unloaded, the system could crash. By
> >>> having a helper check for that and call the function only if it's
> >>> available, we are able to handle that case more gracefully.
> >>>
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>>
> >>> ---
> >>>
> >>> This patch could be squashed with the previous one of the maintainers
> >>> think it would be better.
> >>> ---
> >>>  include/linux/kvm_host.h |  5 +----
> >>>  mm/swap.c                | 20 +++++++++++++++++++-
> >>>  virt/kvm/guest_memfd.c   |  8 ++++++++
> >>>  3 files changed, 28 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> >>> index 7788e3625f6d..3ad0719bfc4f 100644
> >>> --- a/include/linux/kvm_host.h
> >>> +++ b/include/linux/kvm_host.h
> >>> @@ -2572,10 +2572,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >>>  #endif
> >>>
> >>>  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >>> -static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> >>> -{
> >>> -   WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> >>> -}
> >>> +void kvm_gmem_handle_folio_put(struct folio *folio);
> >>>  #endif
> >>>
> >>>  #endif
> >>> diff --git a/mm/swap.c b/mm/swap.c
> >>> index 241880a46358..27dfd75536c8 100644
> >>> --- a/mm/swap.c
> >>> +++ b/mm/swap.c
> >>> @@ -98,6 +98,24 @@ static void page_cache_release(struct folio *folio)
> >>>             unlock_page_lruvec_irqrestore(lruvec, flags);
> >>>  }
> >>>
> >>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >>> +static void gmem_folio_put(struct folio *folio)
> >>> +{
> >>> +#if IS_MODULE(CONFIG_KVM)
> >>> +   void (*fn)(struct folio *folio);
> >>> +
> >>> +   fn = symbol_get(kvm_gmem_handle_folio_put);
> >>> +   if (WARN_ON_ONCE(!fn))
> >>> +           return;
> >>> +
> >>> +   fn(folio);
> >>> +   symbol_put(kvm_gmem_handle_folio_put);
> >>> +#else
> >>> +   kvm_gmem_handle_folio_put(folio);
> >>> +#endif
> >>> +}
> >>> +#endif
> >
> > Yeah, this is not great. The vfio code isn't setting a good example to follow :(
> >
> >> Sorry about the premature sending earlier!
> >>
> >> I was thinking about having a static function pointer in mm/swap.c that
> >> will be filled in when KVM is loaded and cleared when KVM is unloaded.
> >>
> >> One benefit I see is that it'll avoid the lookup that symbol_get() does
> >> on every folio_put(), but some other pinning on KVM would have to be
> >> done to prevent KVM from being unloaded in the middle of
> >> kvm_gmem_handle_folio_put() call.
> >
> > Isn't there some "natural" dependency between things such that at the point
> > the KVM module is able to unload itself, no guest_memfd areas should be
> > existing anymore at that point, and thus also not any pages that would use
> > this callback should exist? In that case it would mean there's a memory leak
> > if that happens so while we might be trying to avoid calling a function that
> > was unleaded, we don't need to try has hard as symbol_get()/put() on every
> > invocation, but a racy check would be good enough?
> > Or would such a late folio_put() be legitimate to happen because some
> > short-lived folio_get() from e.g. a pfn scanner could prolong the page's
> > lifetime beyond the KVM module? I'd hope that since you want to make pages
> > PGTY_guestmem only in certain points of their lifetime, then maybe this
> > should not be possible to happen?
> >
>
> IIUC the last refcount on a guest_memfd folio may not be held by
> guest_memfd if the folios is already truncated from guest_memfd. The
> inode could already be closed. If the inode is closed then the KVM is
> free to be unloaded.
>
> This means that someone could hold on to the last refcount, unload KVM,
> and then drop the last refcount and have the folio_put() call a
> non-existent callback.
>
> If we first check that folio->mapping != NULL and then do
> kvm_gmem_handle_folio_put(), then I think what you suggested would work,
> since folio->mapping is only NULL when the folio has been disassociated
> from the inode.
>
> gmem_folio_put() should probably end with
>
> if (folio_ref_count(folio) == 0)
>         __folio_put(folio)
>
> so that if kvm_gmem_handle_folio_put() is done with whatever it needs to
> (e.g. complete the conversion) gmem_folio_put() will free the folio.

Right, this is important. Into the next respin.

Thanks,
/fuad

> >> Do you/anyone else see pros/cons either way?
> >>
> >>> +
> >>>  static void free_typed_folio(struct folio *folio)
> >>>  {
> >>>     switch (folio_get_type(folio)) {
> >>> @@ -108,7 +126,7 @@ static void free_typed_folio(struct folio *folio)
> >>>  #endif
> >>>  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >>>     case PGTY_guestmem:
> >>> -           kvm_gmem_handle_folio_put(folio);
> >>> +           gmem_folio_put(folio);
> >>>             return;
> >>>  #endif
> >>>     default:
> >>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> >>> index b2aa6bf24d3a..5fc414becae5 100644
> >>> --- a/virt/kvm/guest_memfd.c
> >>> +++ b/virt/kvm/guest_memfd.c
> >>> @@ -13,6 +13,14 @@ struct kvm_gmem {
> >>>     struct list_head entry;
> >>>  };
> >>>
> >>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >>> +void kvm_gmem_handle_folio_put(struct folio *folio)
> >>> +{
> >>> +   WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
> >>> +#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
> >>> +
> >>>  /**
> >>>   * folio_file_pfn - like folio_file_page, but return a pfn.
> >>>   * @folio: The folio which contains this index.

