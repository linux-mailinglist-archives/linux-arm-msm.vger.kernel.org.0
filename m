Return-Path: <linux-arm-msm+bounces-48684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F83A3D97C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 13:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5089189FADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594201BD01F;
	Thu, 20 Feb 2025 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wOLpWDti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978801F236C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053132; cv=none; b=Rjx49jflA6C7YBCOZsfgHwygRkVSukDxIvvu0wNuiw7f+UX8kr6+3slswo8d9I5HfZC7JyDhJqdmeQzkDu0avAqTj/AbOc7T/LsfwCkAvZHAeUuz1dLVDiWaClqNacEIEMhkOsKRfDeyNxYPKfp3TtXxmbmF16NmBcYhQgX1H4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053132; c=relaxed/simple;
	bh=bOLlOqbVArivBWDPBMut57sgRmc/gLlGzUtDxPSmsdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0jQKZzUkODkZcIW9747DxpNRyrfD7Rwu7OH/ECla5r3KgKQwfRR/cK2zJ+P2F3eR2gzdxon4ktMaa3QlDTW+L75fU79bI2gZ8thu7XvB8ojgj/4xStxUSWL9rXW9IIrmh7wKI3ajnGq7y4tQSuP9RaugpENBfcC/OWOSt051GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wOLpWDti; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-472098e6e75so225021cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 04:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740053129; x=1740657929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tC6goll+lleAOD0GHwuo3lpYGQVHyXNfS5gixgBS9ZU=;
        b=wOLpWDtix+ZHl83Jxjd0nqCv8MyOSsc6EaKN0Q7e5i8BO2/nPraWMS9NVpYXnK6hT8
         eN9CejqFZd+yXDoxidtzrecNxsdwJfzxlUnmvWs7usbNt8jre0TZ5cTVsZJ/icrHhLv3
         s7MbqQilm4Qw6R/DhtuaoafxFS9iQlQJsEidDfqQda7Ij1fCEeMqZldcGxL5DBnZMtfj
         WyueDqC9W4cYDkA6P7MDt0Iv0KZ7dV2vxgLPcH5KhXoFVlGgF/vUgbZsp9m6YF9MWEZE
         1uqGZsY4kCie/JQ0TRwZMYskjmOajODnfLmBvuZtz4FOeZrDsvd1xT7EwICeOoe6ooA5
         9Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053129; x=1740657929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC6goll+lleAOD0GHwuo3lpYGQVHyXNfS5gixgBS9ZU=;
        b=E1zcxX7lKXeMxF2Lse2Wh3MOR8KPCSp1bIeyg81OF+ohXUbZN0Bu82JE8oDSq7XuCs
         8g1WT0ejFGaoRNdnh6cBIsIGennEAPI+5reoxXKJVfgkUNy5XuMoOXxxrVwcXxcmONmv
         DR35ixVYIuxtVlMiCqE0pNbVQ34qz862LIM4GbPfQMI6VbAIpAl8HM+B5QiCq+Q7gTHg
         5XRzw5svZ4X5h1DxAupCr69j03I9Y2DyEX7b/F7Fw6fKyd0qi8ApHsm+vb9LMP3n618i
         u24XopNErJaO99vBRsRdUKzJH/A2CYUbXe5GuE3KqWvbJPNCalp/qQLIIcwcU8LH+MN3
         /WGA==
X-Forwarded-Encrypted: i=1; AJvYcCXAKme5jHN89xGqwAidlUo8+NaaAT+3ZW8FRBuok/SgdPgo4rR1wLXAgMspw0MSkOy9x0m2oXBr/DPwUj7I@vger.kernel.org
X-Gm-Message-State: AOJu0YzNFzsiW0uGFjYs8iEaAFuAQC/Z+5sCADGUQ6P6Sajazv5JHFS2
	6ONw9D5fh7yr7ABmWPI3iCa0vCX6YnDqipzFnLdY4RJ0sRZdV703ggvRP/Bws1sBwI4zatiqdNf
	5BxCkeRbmuDiacLjeM8IpdwGWEwcdR+FHXKS5
X-Gm-Gg: ASbGncs251SIoloEs8C3jyXHdWCHv0BVBCOEduVJI4SwLrbgnIbNgjTyX0/nJ8gb5vx
	h2nr6vCwli3fHh4AivioyJ3ziBbZljBNfq7vppH+mnNANrKxit5YFCPksrVSE28who73c2fI=
X-Google-Smtp-Source: AGHT+IGqv2omEcXYZh+zeMt25c/cWZda38ROllkjZAbPHeeub8AGnjq5z0rnwPwyYbAlyoBizqH1Tq5qnHzxi+9chwQ=
X-Received: by 2002:ac8:7d4f:0:b0:471:939c:a304 with SMTP id
 d75a77b69052e-47215beb9bcmr3661491cf.8.1740053129093; Thu, 20 Feb 2025
 04:05:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com> <20250218172500.807733-4-tabba@google.com>
 <2cdc5414-a280-4c47-86d5-4261a12deab6@redhat.com>
In-Reply-To: <2cdc5414-a280-4c47-86d5-4261a12deab6@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 20 Feb 2025 12:04:52 +0000
X-Gm-Features: AWEUYZn5G0GFm0jvs3Hnrk6KLDrgXfy_elTFvfFXpStQbGg36tNQypYCQ5puB8s
Message-ID: <CA+EHjTxh9GB93BHr7ymJ5j8c27Lka2cBjEgfNRXY9pYL25utfg@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 11:58, David Hildenbrand <david@redhat.com> wrote:
>
> On 18.02.25 18:24, Fuad Tabba wrote:
> > Add support for mmap() and fault() for guest_memfd backed memory
> > in the host for VMs that support in-place conversion between
> > shared and private. To that end, this patch adds the ability to
> > check whether the VM type supports in-place conversion, and only
> > allows mapping its memory if that's the case.
> >
> > This behavior is also gated by the configuration option
> > KVM_GMEM_SHARED_MEM.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   include/linux/kvm_host.h |  11 +++++
> >   virt/kvm/guest_memfd.c   | 103 +++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 114 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3ad0719bfc4f..f9e8b10a4b09 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> >   }
> >   #endif
> >
> > +/*
> > + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
> > + * private memory is enabled and it supports in-place shared/private conversion.
> > + */
> > +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
> > +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> >   #ifndef kvm_arch_has_readonly_mem
> >   static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
> >   {
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index c6f6792bec2a..30b47ff0e6d2 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -317,9 +317,112 @@ void kvm_gmem_handle_folio_put(struct folio *folio)
> >   {
> >       WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> >   }
> > +
> > +static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
> > +{
> > +     struct kvm_gmem *gmem = file->private_data;
> > +
> > +     /* For now, VMs that support shared memory share all their memory. */
> > +     return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
> > +}
> > +
> > +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > +{
> > +     struct inode *inode = file_inode(vmf->vma->vm_file);
> > +     struct folio *folio;
> > +     vm_fault_t ret = VM_FAULT_LOCKED;
> > +
> > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > +
> > +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> > +     if (IS_ERR(folio)) {
> > +             switch (PTR_ERR(folio)) {
> > +             case -EAGAIN:
> > +                     ret = VM_FAULT_RETRY;
> > +                     break;
> > +             case -ENOMEM:
> > +                     ret = VM_FAULT_OOM;
> > +                     break;
> > +             default:
> > +                     ret = VM_FAULT_SIGBUS;
> > +                     break;
> > +             }
> > +             goto out_filemap;
> > +     }
> > +
> > +     if (folio_test_hwpoison(folio)) {
> > +             ret = VM_FAULT_HWPOISON;
> > +             goto out_folio;
> > +     }
> > +
> > +     /* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
> > +     if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
> > +     /*
> > +      * Only private folios are marked as "guestmem" so far, and we never
> > +      * expect private folios at this point.
> > +      */
> > +     if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
> > +     /* No support for huge pages. */
> > +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
> > +     if (!folio_test_uptodate(folio)) {
> > +             clear_highpage(folio_page(folio, 0));
> > +             kvm_gmem_mark_prepared(folio);
> > +     }
>
> kvm_gmem_get_pfn()->__kvm_gmem_get_pfn() seems to call
> kvm_gmem_prepare_folio() instead.
>
> Could we do the same here?

Will do.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

