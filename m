Return-Path: <linux-arm-msm+bounces-51301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9CA5F718
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 14:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D1619C1130
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 13:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFEE267AEC;
	Thu, 13 Mar 2025 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yhYKvmtz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46D19ADB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741874296; cv=none; b=MZNE/g2jDUAEjCCTWJvsO3IhG5WTgBkclZ9SSpZmBwaT/Z08nzddQE9twH9IJDfPTqVRB37NiDNw/LLviE/mMlybPu95zDFWtovcaa1hANues0oCqpJdGZYKcjJ74UbKCyEFP9wBsJBjEIF7Ii3rZWtK6Jj0KTXgRl9ZKFWaNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741874296; c=relaxed/simple;
	bh=Yh042JdRGflLYZnDc3MvrtI6OLQ4UjLBEhglk5mc1Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUdKPdjdQCrHSeRWQ8DUydTTR9yCMZuLiJ389h2JZzO+az0bH7248oLbVx6Oa04aXFn4UJIPVKvQTnZGklf/KXjiAuknHnirrQKhZppiOIvHiwNsMkALRz7fwtretzwlIaG55KiPhZeDPV6ZLhwiZB9VSmGUn76GHMwizWguM1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yhYKvmtz; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476693c2cc2so236891cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741874293; x=1742479093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9FeCBAypR4IZrbp8p9GTIoHBEaomM5xLPYj8ATQh2A=;
        b=yhYKvmtzAkv01cPJ+tTfuVF4ROi9L6gKVF9XMKSTsyq3/M4GL7jqKo6plRXnym3929
         4NRqm0AKcpvykQwElmA63ky6jGeD45f5ovGeYG+aqJS236q8kOuPCqE2B4cg0R3mAVRH
         gHUruJIktOf8l8NyNUlLa5oy1u5d5PM4GB1d5mlyBQjR3T2yQeKK0KMlI2vV6aZeT8Sx
         GbBjEBuy0E2Ij+Vx3g1br7O/G5+A9oX7ji0YHiKW/Kyyx4a7iPiiEhFCHV1R/CwWSeIb
         jgqGDebKw0IoyVMD4KGwqpYDyYLaNj1vtvdbMVeuok4tWypdaJeSUtxkYBUzFJzcHmiQ
         ZgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741874293; x=1742479093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9FeCBAypR4IZrbp8p9GTIoHBEaomM5xLPYj8ATQh2A=;
        b=uGNWcgPGRKnxtSmd/lfMRrac9x+kj4dLphl3HzqCWAzUFzsNP74UPQLDpyLXwijLsQ
         LM0A0znaMZxa0X7oB1Gb4Cb5R6WrNgNWQGOw6BOMuemKhdkPrJpmPTwE48+jBMs8Lk3k
         f9yVcG77/08uCuFU11BXUW/74s47nuwUnCZKUezvoUYq40NAVIvJjjeozo9j477hSTCk
         hvaDF+VoSheD7YjuR4y0E+Od6L+c26cLNnyf5gLJBNYZmQDQvN4wJ/zruDSm1Lnsgw8v
         3z6S5VxyW+2fxslip4ljfN/WG8fUtDvWtzR37p305t+3zGOELRN/IHMTgwUyJK/thepH
         b9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUORQ/BrHbm8ji+PaUK6cRWULxhfE46Fbyk9W7foQqKtOidx3IwFKZgThZrj7okmB/YJu62mE2PljEMfUio@vger.kernel.org
X-Gm-Message-State: AOJu0YxoePF9gbvES+kvdxfVG1TQjt98wzLU7ykgCNFwiUYUSqGtenPC
	CRO06wvqbCjcd/2PrXTh+6z0E3QFzrnp/kiNXURHB09DDlkn+pGeZu4J71AzgqxVmpqrPYVN+lT
	php5xXr/ndd61tIxz3BGvEqrqgLUBL49gcfF5K0xik+BdYV53Cseh
X-Gm-Gg: ASbGncu95VpfKyqzJwb2lbmSNNVqa2w6Zu8bZsTBtyQptKEO6HyA4hZyT3ejyVIP13d
	NLSZ0Ol3mWbv2SXtP4MV5TLoU/vy4kSJ3GLRgUzHOBYy0CHE639aumNSS0v9r+ZGfRdLtmZ28dB
	7sfL2+j/MhvBdrBkp15xlxEPpnlKEGfOG9dlz5XjF9+6uB09nq58S+Zj4=
X-Google-Smtp-Source: AGHT+IHZKP40UVewA/vJRjgDyWhTUkmD5Qfh8851rd5xaGWMIfILX9lGOwDg+GHbpMgYlv2sihmm4GI4y8y2iDfckZU=
X-Received: by 2002:a05:622a:1443:b0:475:1464:561f with SMTP id
 d75a77b69052e-476bb2dab31mr3323841cf.11.1741874292884; Thu, 13 Mar 2025
 06:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312175824.1809636-4-tabba@google.com> <diqzy0x9rqf4.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzy0x9rqf4.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 13 Mar 2025 13:57:36 +0000
X-Gm-Features: AQ5f1Jp3h1NrwogZy_vhsvnRTLO20AfpSQ9DOzDE2jKtNqepfxzrqM8MsiWv6Vk
Message-ID: <CA+EHjTxJE=_BjUE8z81r1JOyeiEXXt7vW7MhviS1jQXpwFOk_Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] KVM: guest_memfd: Handle kvm_gmem_handle_folio_put()
 for KVM as a module
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
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

On Thu, 13 Mar 2025 at 13:49, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > In some architectures, KVM could be defined as a module. If there is a
> > pending folio_put() while KVM is unloaded, the system could crash. By
> > having a helper check for that and call the function only if it's
> > available, we are able to handle that case more gracefully.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> >
> > ---
> >
> > This patch could be squashed with the previous one of the maintainers
> > think it would be better.
> > ---
> >  include/linux/kvm_host.h |  5 +----
> >  mm/swap.c                | 20 +++++++++++++++++++-
> >  virt/kvm/guest_memfd.c   |  8 ++++++++
> >  3 files changed, 28 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 7788e3625f6d..3ad0719bfc4f 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2572,10 +2572,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  #endif
> >
> >  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > -static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> > -{
> > -     WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> > -}
> > +void kvm_gmem_handle_folio_put(struct folio *folio);
> >  #endif
> >
> >  #endif
> > diff --git a/mm/swap.c b/mm/swap.c
> > index 241880a46358..27dfd75536c8 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -98,6 +98,24 @@ static void page_cache_release(struct folio *folio)
> >               unlock_page_lruvec_irqrestore(lruvec, flags);
> >  }
> >
> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > +static void gmem_folio_put(struct folio *folio)
> > +{
> > +#if IS_MODULE(CONFIG_KVM)
> > +     void (*fn)(struct folio *folio);
> > +
> > +     fn = symbol_get(kvm_gmem_handle_folio_put);
> > +     if (WARN_ON_ONCE(!fn))
> > +             return;
> > +
> > +     fn(folio);
> > +     symbol_put(kvm_gmem_handle_folio_put);
> > +#else
> > +     kvm_gmem_handle_folio_put(folio);
> > +#endif
> > +}
> > +#endif
>
> Sorry about the premature sending earlier!
>
> I was thinking about having a static function pointer in mm/swap.c that
> will be filled in when KVM is loaded and cleared when KVM is unloaded.
>
> One benefit I see is that it'll avoid the lookup that symbol_get() does
> on every folio_put(), but some other pinning on KVM would have to be
> done to prevent KVM from being unloaded in the middle of
> kvm_gmem_handle_folio_put() call.
>
> Do you/anyone else see pros/cons either way?

To be honest, I didn't do it that way (or even think of doing it that
way) since that's how vfio does it, e.g.,:

https://elixir.bootlin.com/linux/v6.14-rc6/source/virt/kvm/vfio.c#L38

Like you said, your suggestion would require something like
try_module_get()/put() to ensure that it's not unloaded. Is that
better? I don't know... Maybe someone with more experience could chime
in.

Thanks!
/fuad


> > +
> >  static void free_typed_folio(struct folio *folio)
> >  {
> >       switch (folio_get_type(folio)) {
> > @@ -108,7 +126,7 @@ static void free_typed_folio(struct folio *folio)
> >  #endif
> >  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >       case PGTY_guestmem:
> > -             kvm_gmem_handle_folio_put(folio);
> > +             gmem_folio_put(folio);
> >               return;
> >  #endif
> >       default:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index b2aa6bf24d3a..5fc414becae5 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -13,6 +13,14 @@ struct kvm_gmem {
> >       struct list_head entry;
> >  };
> >
> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > +void kvm_gmem_handle_folio_put(struct folio *folio)
> > +{
> > +     WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
> > +#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
> > +
> >  /**
> >   * folio_file_pfn - like folio_file_page, but return a pfn.
> >   * @folio: The folio which contains this index.

