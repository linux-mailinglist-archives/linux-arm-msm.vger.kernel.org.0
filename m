Return-Path: <linux-arm-msm+bounces-47371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B0A2E684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 129047A31B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE1C198E8C;
	Mon, 10 Feb 2025 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qn9/dHcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D2170A11
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176427; cv=none; b=La1BGrrsK8b2S/g/wmOdgER/QN41WBkCLa3k/wO8Y9NGqy82Z70zc9ungoMe2/8hkrlDOqhD5RuKmg6PPKTswhFTHeHrYRut63gXapaHZPEFsVMxr1LQLywYww87P6WRykRwfI9gWndJA0ytmZhitYVmvGPbS6bV0o/+16igAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176427; c=relaxed/simple;
	bh=knqseBiuI/8OksRGqMj2Fn6GmSzADYw2u/InIBjEY84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCjPqAn0s3yUz7Z2AlL1RwGQlaiOiv02YWSmM2lGitoB3VjVRKU4jonK7j/POC6sjSB0E+MSqHRPsVEcgZqhiZ6OcYxGPl104lOh3T5nOVZ8pEK1KpsDeTibL3A9yHruFXy8qog7KJ0qoIDTCDoPINcSsWIFCH3kcwZ5q0Dvj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qn9/dHcM; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47180c199ebso291351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739176425; x=1739781225; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dOAVGjsBQL4bBRj67A5Za30Ewp25AmC5MtisUBkmLU4=;
        b=qn9/dHcMaNPxPkcqDgpqjoPBP6pfPDDMOliYHW5WtJYYx6mm79jtYurNuCguRaBt+3
         /85zDDE6jgCEU4TpMnMutEYg+uoHBHr0nsWIXN+YQFaOaltvPEEVroP7U2wGYIsYl6sk
         Tg7R3N2OoYMP2l2bzoUnD1PdVh42uIOHURZ2hl10CHnEDvM20Sf5wew5cZpNzbZMhp+E
         ar1SkL9BMe0FENO3HkQroDoN6/PQkTu5LXdU61toUSQ3GJoVuZfsFxoEsix+REpwcjSt
         Xqls3TKcSPkMAwRg8KHeQhJLkIJbUVkHKzrN3Q3w5Ln+740Gh+6wYj+6QhGpF/VWlvoj
         pQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176425; x=1739781225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOAVGjsBQL4bBRj67A5Za30Ewp25AmC5MtisUBkmLU4=;
        b=WBSNeO64Fs7LhzOcpLJ0NJTtd8CWZB/F5REKeWgZwUeuMtiQ1UkmUa3tQmFk8hxLjT
         sHeFh3at079tNbgqj4JI7+xPPhYl6QDmJnkRE0RhPY9ceM4W0W5YdrNHYHzzSpJgalYZ
         CZJdvl0ztixCtn1QG0OBcalIEXoKkO48m20UGCbBUJ2TkGz1L3ERuhJNeuEVWYCP6Moq
         GPEka+c+vvzOIrjFZqsiABZfaw3NcrU9uvtg+fFprADZQjZAa47dO89uguzwgbFVbEEw
         qHrBtpMl0tMHaiFZKOTCVS/8Jg/xg9na4oPJh3E3k0Q8iUHbGKpFtU/m1yqSTohEddA6
         It4w==
X-Forwarded-Encrypted: i=1; AJvYcCW6QngIHFlau433KPeu5/JfsyeaWGYm3JCTAxJv9dNBKz7YWzc9hKpcESFxrM/PjgvAak574VEKIeeNcPFs@vger.kernel.org
X-Gm-Message-State: AOJu0YxcKUdfK7aXqPhWVCPzP1I6n4jwnMuWzIH4huRwsNWYWM25fPbk
	JfIH3paD79YxDDTdJuXAL6NpIAo0k8AtacYNOBArf1Zegl6zJUkVpeJrE1TQn+aMzVYQlW7wr9A
	0yAy+znP+E+TYFR0/xZrijstWaYD7i7Qdxh6p
X-Gm-Gg: ASbGncvTa/7MW29ezjptANZVoMTr+aJWil5BM1nhvw5DCPn4D6eyUdIkkqOCpH3KakT
	yQq3/KyN9k0RXsJ3zl5Rn2kXehAb8mBC3HfJf2ixo1zMNnNWPdDeqOA/V+Z1VQA573sGEiWw=
X-Google-Smtp-Source: AGHT+IHQGosnJPGAQecsf/1BlVSEE2bv83wRu81Ygb/yfS5vG3giDvP5a/v07YOyZMDd7sWgcbGsmfKjHTSAfh0Rfts=
X-Received: by 2002:ac8:44ca:0:b0:471:812b:508 with SMTP id
 d75a77b69052e-471812b08ffmr3428621cf.14.1739176423403; Mon, 10 Feb 2025
 00:33:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com> <20250129172320.950523-4-tabba@google.com>
 <0b1cc981-52e8-4f8f-846a-f19507e3a630@amazon.co.uk>
In-Reply-To: <0b1cc981-52e8-4f8f-846a-f19507e3a630@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 10 Feb 2025 08:33:05 +0000
X-Gm-Features: AWEUYZnqRWolgaEQBxdtLu3-bmijaxjyQYTiw-VQAkPGP95c4FrJsH5ujWBm14U
Message-ID: <CA+EHjTxnyjq2+SxhjfP2rzH_Uc2nP0HVN7miqNRHd4ra3-SZvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/11] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: Patrick Roy <roypat@amazon.co.uk>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 16:45, Patrick Roy <roypat@amazon.co.uk> wrote:
>
> Hi Fuad!
>
> On Wed, 2025-01-29 at 17:23 +0000, Fuad Tabba wrote:
> > Add support for mmap() and fault() for guest_memfd backed memory
> > in the host for VMs that support in-place conversion between
> > shared and private (shared memory). To that end, this patch adds
> > the ability to check whether the VM type has that support, and
> > only allows mapping its memory if that's the case.
> >
> > Additionally, this behavior is gated with a new configuration
> > option, CONFIG_KVM_GMEM_SHARED_MEM.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> >
> > ---
> >
> > This patch series will allow shared memory support for software
> > VMs in x86. It will also introduce a similar VM type for arm64
> > and allow shared memory support for that. In the future, pKVM
> > will also support shared memory.
> > ---
> >  include/linux/kvm_host.h | 11 ++++++
> >  virt/kvm/Kconfig         |  4 +++
> >  virt/kvm/guest_memfd.c   | 77 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 92 insertions(+)
> >
> > -snip-
> >
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 47a9f68f7b24..86441581c9ae 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -307,7 +307,84 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >         return gfn - slot->base_gfn + slot->gmem.pgoff;
> >  }
> >
> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > +{
> > +       struct inode *inode = file_inode(vmf->vma->vm_file);
> > +       struct folio *folio;
> > +       vm_fault_t ret = VM_FAULT_LOCKED;
> > +
> > +       filemap_invalidate_lock_shared(inode->i_mapping);
> > +
> > +       folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> > +       if (IS_ERR(folio)) {
> > +               ret = VM_FAULT_SIGBUS;
> > +               goto out_filemap;
> > +       }
> > +
> > +       if (folio_test_hwpoison(folio)) {
> > +               ret = VM_FAULT_HWPOISON;
> > +               goto out_folio;
> > +       }
> > +
> > +       if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> > +               ret = VM_FAULT_SIGBUS;
> > +               goto out_folio;
> > +       }
> > +
> > +       /* No support for huge pages. */
> > +       if (WARN_ON_ONCE(folio_nr_pages(folio) > 1)) {
> > +               ret = VM_FAULT_SIGBUS;
> > +               goto out_folio;
> > +       }
> > +
> > +       if (!folio_test_uptodate(folio)) {
> > +               clear_highpage(folio_page(folio, 0));
> > +               folio_mark_uptodate(folio);
>
> kvm_gmem_mark_prepared() instead of direct folio_mark_uptodate() here, I
> think (in preparation of things like [1])? Noticed this while rebasing
> my direct map removal series on top of this and wondering why mmap'd
> folios sometimes didn't get removed (since it hooks mark_prepared()).

Thanks for pointing that out. Will fix.
/fuad

> Best,
> Patrick
>
> [1]: https://lore.kernel.org/kvm/20241108155056.332412-1-pbonzini@redhat.com/

