Return-Path: <linux-arm-msm+bounces-48201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118BA38195
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9C2116E637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC3E217713;
	Mon, 17 Feb 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f34DcyPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E072135C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791339; cv=none; b=ptWOZSchtfX8vjKBVE1rZVYnXe0LDutZR+QkUo2nqWgE2y+3DYtxHIeXNABHrMxljhqIST9eCqMmS+EYwg73EltjzeUglvejEJZYiE9f5LX2iBTCZZ+MmqUwNLZINlgAHpJ2nZ3SiOryx4RpSfELtUbgXx8T2Dsiuhv+xOt4JKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791339; c=relaxed/simple;
	bh=7qquluh9TQbi1pHehmFpm8jVc2msqQEg1hq155LXWrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnIk15aLdG12p4LuLG8SWycsYHo50LC12k5/RFnpaE/IxgftND6NgvZvq5oi1mjLJ47Ewf898ww5lkf+ojaV7a8H9+XyJeUL17t9AHUVszO07VyTYTOLhZpWmh/d4hJWRSv5iU8UOL6gCZsDmsZDr+O1td3j1PnKyMMgDXQuvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f34DcyPc; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4718aea0718so433141cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 03:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739791336; x=1740396136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2BNFct3UePzHwIotoHJ2GKRNF14AfZG/WsMOMMP2GWA=;
        b=f34DcyPcun1aBSBg3zIatvEVrWTdxx413RChLNOpODwih+feJsiUJvS64gCsK+J0fI
         MiwFRBN3IVGlvupfjR9VJyWfpf2u2OUG0QyX81fcPP1EshuXCbGYaaTIHYJRNze4kvOK
         l6pYt5czYgGcnFuQp/kmroFNrenCmX14AOohfBFnwCz9IgQf0EORtSihr92N/hLuENEo
         kbgaZI+Tqj2Rbmtp41CS9nbhM3pa3/sqjsjtowDeWlzEXgosoRxIdMaCV4gdmLcy1jsk
         p54aYd5ImsjLRbi2tZqs2HyFzEGJFdS3CTr2I5xWb/Sb46dmmfTOGQTyy6WwsRtSyAG3
         RYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739791336; x=1740396136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BNFct3UePzHwIotoHJ2GKRNF14AfZG/WsMOMMP2GWA=;
        b=fjQS4UCb2X0FAPUloeadHA6tA4IKIQOBVeg/l/aD2ZrsipqZDWYr8wsNichSQInxPe
         QpmiM9RyADj4OhYcDlZybBbMgpc9rbg5iQzJ+Q3RzOOUM3LAT0tCZsH5+o2EM6yHUeQz
         O2XuFLswr59dWPtMiVj84VRI9zP0ctUIqEWLm2S6l9fss80xbHsJ69s68bZmrgHvfhD7
         AGxwYjWBAwEGfGQOanOqfmivwgVXzLdN6QwG+0WDaFMLaiXiMwZz2R3s1JQWwI9aYWj4
         tZ2al6CCcvrO6M+FeRjSZfw3A2ty17XKBTRe4VeTO2uHLRhax4jHl6nG1ru08pbK8m3n
         ggzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxoQ1/UUFc09T022dRyVUVnIMS9Asp09Lu3gRE0f5SR1XhrSDPx+a9llqNqj8rFlb00w/j3f2bpDF8IJaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3X/m2wd1dgd7JmXT7NqtLkAbY0+mAW04j9hvDa0jssOj0lC0O
	Oa7Hi96TIfU81+ubMUlFbinJrJKgdAR6IijPQTE2NdnkNtJbns/RhoOwwBp7GOycnP1r+NEyc3B
	4ANktWmOJwvMIN42jygBVfN+xDMsru/r2OzI5
X-Gm-Gg: ASbGncuQKzzRSS0EHRrqz2cOYs00UgdmQ1t5BBIVoh1EPsB/5yqvXa3y54v01VtMi4A
	x/VInASGNVRqP915X2z0t/vAZH4EsPU4Wg8LTK4XlSurHctPWflHoY9sSRT0nPvPSjlOQE00=
X-Google-Smtp-Source: AGHT+IGDUh34bmbyxSqWLPTSAJ5itWnJM39TpQStwZ9ZwHdgk/yvqH+R9kp7FeNsIeAxQHY19whrtQnqkUDlrS/JJKA=
X-Received: by 2002:ac8:7d52:0:b0:466:9af1:5a35 with SMTP id
 d75a77b69052e-471dc776b3emr6184571cf.10.1739791336049; Mon, 17 Feb 2025
 03:22:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com> <20250211121128.703390-3-tabba@google.com>
 <4311493d-c709-485a-a36d-456e5c57c593@suse.cz> <CA+EHjTxOmSQA90joVqR90cJ_eTrdvNfmAgtUmopP_ZdcaCPcjQ@mail.gmail.com>
 <5a2f8aaa-1664-48ee-8fb0-3fa80e2e8a23@suse.cz>
In-Reply-To: <5a2f8aaa-1664-48ee-8fb0-3fa80e2e8a23@suse.cz>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Feb 2025 11:21:39 +0000
X-Gm-Features: AWEUYZn1zu8baO-EPGcq1E5QUlaaFL8dKny9INkDAvKjV2vh7r75A7EttgWd8IM
Message-ID: <CA+EHjTzCUiE70LTzD4_RY61VzhvbMEKuYa8hztRt_KdjzQTffw@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 11:21, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 2/17/25 11:12, Fuad Tabba wrote:
> > Hi Vlastimil,
> >
> > On Mon, 17 Feb 2025 at 09:49, Vlastimil Babka <vbabka@suse.cz> wrote:
> >>
> >> On 2/11/25 13:11, Fuad Tabba wrote:
> >> > Before transitioning a guest_memfd folio to unshared, thereby
> >> > disallowing access by the host and allowing the hypervisor to
> >> > transition its view of the guest page as private, we need to be
> >> > sure that the host doesn't have any references to the folio.
> >> >
> >> > This patch introduces a new type for guest_memfd folios, which
> >> > isn't activated in this series but is here as a placeholder and
> >> > to facilitate the code in the next patch. This will be used in
> >>
> >> It's not clear to me how the code in the next page is facilitated as it
> >> doesn't use any of this?
> >
> > I'm sorry about that, I'm missing the word "series". i.e.,
> >
> >> > This patch introduces a new type for guest_memfd folios, which
> >> > isn't activated in this series but is here as a placeholder and
> >> > to facilitate the code in the next patch *series*.
> >
> > I'm referring to this series:
> > https://lore.kernel.org/all/20250117163001.2326672-1-tabba@google.com/
> >
> >> > the future to register a callback that informs the guest_memfd
> >> > subsystem when the last reference is dropped, therefore knowing
> >> > that the host doesn't have any remaining references.
> >> >
> >> > Signed-off-by: Fuad Tabba <tabba@google.com>
> >> > ---
> >> >  include/linux/kvm_host.h   |  9 +++++++++
> >> >  include/linux/page-flags.h | 17 +++++++++++++++++
> >> >  mm/debug.c                 |  1 +
> >> >  mm/swap.c                  |  9 +++++++++
> >> >  virt/kvm/guest_memfd.c     |  7 +++++++
> >> >  5 files changed, 43 insertions(+)
> >> >
> >> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> >> > index f34f4cfaa513..8b5f28f6efff 100644
> >> > --- a/include/linux/kvm_host.h
> >> > +++ b/include/linux/kvm_host.h
> >> > @@ -2571,4 +2571,13 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >> >                                   struct kvm_pre_fault_memory *range);
> >> >  #endif
> >> >
> >> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >> > +void kvm_gmem_handle_folio_put(struct folio *folio);
> >> > +#else
> >> > +static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> >> > +{
> >> > +     WARN_ON_ONCE(1);
> >> > +}
> >>
> >> Since the caller is guarded by CONFIG_KVM_GMEM_SHARED_MEM, do we need the
> >> CONFIG_KVM_GMEM_SHARED_MEM=n variant at all?
> >
> > No. I'll remove it.
> >
> >> > +#endif
> >> > +
> >> >  #endif
> >> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> >> > index 6dc2494bd002..734afda268ab 100644
> >> > --- a/include/linux/page-flags.h
> >> > +++ b/include/linux/page-flags.h
> >> > @@ -933,6 +933,17 @@ enum pagetype {
> >> >       PGTY_slab       = 0xf5,
> >> >       PGTY_zsmalloc   = 0xf6,
> >> >       PGTY_unaccepted = 0xf7,
> >> > +     /*
> >> > +      * guestmem folios are used to back VM memory as managed by guest_memfd.
> >> > +      * Once the last reference is put, instead of freeing these folios back
> >> > +      * to the page allocator, they are returned to guest_memfd.
> >> > +      *
> >> > +      * For now, guestmem will only be set on these folios as long as they
> >> > +      * cannot be mapped to user space ("private state"), with the plan of
> >>
> >> Might be a bit misleading as I don't think it's set yet as of this series.
> >> But I guess we can keep it to avoid another update later.
> >
> > You're right, it's not in this series. But as you said, the idea is to
> > have the least amount of churn in the core mm code.
> >
> >> > +      * always setting that type once typed folios can be mapped to user
> >> > +      * space cleanly.
> >> > +      */
> >> > +     PGTY_guestmem   = 0xf8,
> >> >
> >> >       PGTY_mapcount_underflow = 0xff
> >> >  };
> >> > @@ -1082,6 +1093,12 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
> >> >  FOLIO_TEST_FLAG_FALSE(hugetlb)
> >> >  #endif
> >> >
> >> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >> > +FOLIO_TYPE_OPS(guestmem, guestmem)
> >> > +#else
> >> > +FOLIO_TEST_FLAG_FALSE(guestmem)
> >> > +#endif
> >> > +
> >> >  PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
> >> >
> >> >  /*
> >> > diff --git a/mm/debug.c b/mm/debug.c
> >> > index 8d2acf432385..08bc42c6cba8 100644
> >> > --- a/mm/debug.c
> >> > +++ b/mm/debug.c
> >> > @@ -56,6 +56,7 @@ static const char *page_type_names[] = {
> >> >       DEF_PAGETYPE_NAME(table),
> >> >       DEF_PAGETYPE_NAME(buddy),
> >> >       DEF_PAGETYPE_NAME(unaccepted),
> >> > +     DEF_PAGETYPE_NAME(guestmem),
> >> >  };
> >> >
> >> >  static const char *page_type_name(unsigned int page_type)
> >> > diff --git a/mm/swap.c b/mm/swap.c
> >> > index 47bc1bb919cc..241880a46358 100644
> >> > --- a/mm/swap.c
> >> > +++ b/mm/swap.c
> >> > @@ -38,6 +38,10 @@
> >> >  #include <linux/local_lock.h>
> >> >  #include <linux/buffer_head.h>
> >> >
> >> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >> > +#include <linux/kvm_host.h>
> >> > +#endif
> >>
> >> Do we need to guard the include?
> >
> > Yes, otherwise allnoconfig complains due to many of the x86 things it
> > drags along if included but KVM isn't configured. I could put it in a
> > different header that doesn't have this problem, but I couldn't think
> > of a better header for this.
>
> Ok, you can add
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thank you!
/fuad

