Return-Path: <linux-arm-msm+bounces-48722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA63A3DF2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 321064200BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470F62010E6;
	Thu, 20 Feb 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36DLe0h3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551BD14A82
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066352; cv=none; b=oU4AIbtAyd9E4wxMRXgukYjyHylwkJ1Aa8nSS3ZJehqHUqb15YDHbz3afJs+WZFfJSQBjYOUcDHWEZGPEwMA3tY9p4wIGJhp7zsXQytFf7VL0yAc1qd0rJ2E8BPBV82sKZX0DUBeaQtrOqqr49zaxVJ1tibTRHKBpV2hr8pmG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066352; c=relaxed/simple;
	bh=8nqfJX3w087BB3lO1ulZy2OeY/jcdix2rHxd1pMHagA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hv+dgrOOOz3q94RKSCIzRxWOS3C51dctLCYvT8peyxhepsrE45Qvv93muykuGHENpubZchvajN5/ireaSsxn1l7jWmvqFBMAmlON+5+hy97KOolEeTiEczNXiIuDZpCGhNbR8QrO6RRG/SZeYchSCEURyjTeh4+5uJJO4csdT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36DLe0h3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-471fa3b19bcso302361cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740066349; x=1740671149; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRunbvLT85DBg6khdWG9PaOkKVGHgD5M/ABMScKZk1Q=;
        b=36DLe0h3tF5IFvTQ/VNEptPqOupC+laILvBEkC9IjgoJQ6F5klEXO66PEnYHtJAVjV
         g6iJj5T8ur4jeIAkRoJWEqtVJMeKU/u68kjOh72kMgTx56qT90vUqKiTFUOgks1vD/WS
         HWEFC4WSWQsBnlhriEB02O3NBrruRJpzfZMDvBgw5b8CVZBNr/VNTQ8nGaAj8kmFhl2b
         wf4kBpjn6a3gtb1HN8p64+btmvLEz82JNVYe5RJFi9ZMY4410U5x2CuLXf0lGvaAqAhB
         lcyJgFEHa+3BceqNa6eBYXnkhmuZtXCvdY3/3bkdm2UiEivUw4yBXeXOvzTOleYxmZYL
         OPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066349; x=1740671149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRunbvLT85DBg6khdWG9PaOkKVGHgD5M/ABMScKZk1Q=;
        b=Jy1FE6+kbdykLA5k7jcOQoU09uNhLmklPD9ToSmAVnvfK9kWJm2LEMR1nNpDKTcWX+
         w1wRjijE85RB47yvdtBZ4Rr9bIrE/H2j4bf/+pSLefzL8TtG0hzw82m3OkDqAA1gegIV
         R/6TE0a4dKG87qP6jl9pahaLV8CGXX3hoFY0uHjADxH25dtZ2s+XAa9TSvaOILj+zXml
         li/pAVD4Qgd6j9vXyUPdIcURKIUDX9kpOn5/34Ka0kyfzx2uu7lNdreHZUBmA+f2CGgP
         xo6fsNaPTJxZt/GT+e4nf9ymhCsuRScR6MjxWkqfM6I76UtB5UpI8NYhYBTybPOik90V
         aNew==
X-Forwarded-Encrypted: i=1; AJvYcCWqRjvJf98+kI6K65a8Iu30fn1/tvjtIoCa7IM3GHmTLlzHdFVUUPJsoCGn+5hYGUyx1kIGxplOBMZM9u7L@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv4zh15Ye6XkxNUdMe/O5PXd1Uu0Cw+GYOg6jLuRpu0EOFcSi8
	W/V/aJ44xyhlr6e17GepPEn6sM3gcRRxinDjh8HESqJ2B3+Y1u+WprVBlNEqbfJvPXG4/kl+c8l
	lJlLJD7PJMyEWtd11jE0BZRymEk2yo8LYFdK3jfZFZXzrTB6Eltx4Wos=
X-Gm-Gg: ASbGncvadOcxJw9YCVDIGeo+yv6qVJm40ZzmeCuPEDj2uF15yal0mUv8vRaoOziTIRb
	nlMbhy161nAMInXP2oN5Y4c+mT+Pr9A3X8320v8bgysruvKNpz5t0DNwaz7qdNuzz7RnnKOg=
X-Google-Smtp-Source: AGHT+IGPGeDCdhjKTGDGs8WXhPPJsKZbeZ4WlRZitPNggTb1vz2vjOkgr/eV7Mlg/mIFGnlXtY7abY8uAD3xhfxUMns=
X-Received: by 2002:ac8:5893:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-47217110c99mr3749061cf.9.1740066348801; Thu, 20 Feb 2025
 07:45:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com> <20250218172500.807733-4-tabba@google.com>
 <2cdc5414-a280-4c47-86d5-4261a12deab6@redhat.com> <CA+EHjTxh9GB93BHr7ymJ5j8c27Lka2cBjEgfNRXY9pYL25utfg@mail.gmail.com>
In-Reply-To: <CA+EHjTxh9GB93BHr7ymJ5j8c27Lka2cBjEgfNRXY9pYL25utfg@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 20 Feb 2025 15:45:11 +0000
X-Gm-Features: AWEUYZkaReiezGeqdLtbjD5EPo_UXo1HYmVg_Diqu1lPPjK9JJzKuwaLxA5T9bo
Message-ID: <CA+EHjTyyXEMuQrg8yFo=+SVuM+ZfvZJksS9Z4DAOr2KsuO5M-Q@mail.gmail.com>
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

Hi David,

On Thu, 20 Feb 2025 at 12:04, Fuad Tabba <tabba@google.com> wrote:
>
> On Thu, 20 Feb 2025 at 11:58, David Hildenbrand <david@redhat.com> wrote:
> >
> > On 18.02.25 18:24, Fuad Tabba wrote:
> > > Add support for mmap() and fault() for guest_memfd backed memory
> > > in the host for VMs that support in-place conversion between
> > > shared and private. To that end, this patch adds the ability to
> > > check whether the VM type supports in-place conversion, and only
> > > allows mapping its memory if that's the case.
> > >
> > > This behavior is also gated by the configuration option
> > > KVM_GMEM_SHARED_MEM.
> > >
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > ---
> > >   include/linux/kvm_host.h |  11 +++++
> > >   virt/kvm/guest_memfd.c   | 103 +++++++++++++++++++++++++++++++++++++++
> > >   2 files changed, 114 insertions(+)
> > >
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 3ad0719bfc4f..f9e8b10a4b09 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> > >   }
> > >   #endif
> > >
> > > +/*
> > > + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
> > > + * private memory is enabled and it supports in-place shared/private conversion.
> > > + */
> > > +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
> > > +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
> > > +{
> > > +     return false;
> > > +}
> > > +#endif
> > > +
> > >   #ifndef kvm_arch_has_readonly_mem
> > >   static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
> > >   {
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index c6f6792bec2a..30b47ff0e6d2 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -317,9 +317,112 @@ void kvm_gmem_handle_folio_put(struct folio *folio)
> > >   {
> > >       WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> > >   }
> > > +
> > > +static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
> > > +{
> > > +     struct kvm_gmem *gmem = file->private_data;
> > > +
> > > +     /* For now, VMs that support shared memory share all their memory. */
> > > +     return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
> > > +}
> > > +
> > > +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > > +{
> > > +     struct inode *inode = file_inode(vmf->vma->vm_file);
> > > +     struct folio *folio;
> > > +     vm_fault_t ret = VM_FAULT_LOCKED;
> > > +
> > > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > > +
> > > +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> > > +     if (IS_ERR(folio)) {
> > > +             switch (PTR_ERR(folio)) {
> > > +             case -EAGAIN:
> > > +                     ret = VM_FAULT_RETRY;
> > > +                     break;
> > > +             case -ENOMEM:
> > > +                     ret = VM_FAULT_OOM;
> > > +                     break;
> > > +             default:
> > > +                     ret = VM_FAULT_SIGBUS;
> > > +                     break;
> > > +             }
> > > +             goto out_filemap;
> > > +     }
> > > +
> > > +     if (folio_test_hwpoison(folio)) {
> > > +             ret = VM_FAULT_HWPOISON;
> > > +             goto out_folio;
> > > +     }
> > > +
> > > +     /* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
> > > +     if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
> > > +             ret = VM_FAULT_SIGBUS;
> > > +             goto out_folio;
> > > +     }
> > > +
> > > +     /*
> > > +      * Only private folios are marked as "guestmem" so far, and we never
> > > +      * expect private folios at this point.
> > > +      */
> > > +     if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> > > +             ret = VM_FAULT_SIGBUS;
> > > +             goto out_folio;
> > > +     }
> > > +
> > > +     /* No support for huge pages. */
> > > +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> > > +             ret = VM_FAULT_SIGBUS;
> > > +             goto out_folio;
> > > +     }
> > > +
> > > +     if (!folio_test_uptodate(folio)) {
> > > +             clear_highpage(folio_page(folio, 0));
> > > +             kvm_gmem_mark_prepared(folio);
> > > +     }
> >
> > kvm_gmem_get_pfn()->__kvm_gmem_get_pfn() seems to call
> > kvm_gmem_prepare_folio() instead.
> >
> > Could we do the same here?
>
> Will do.

I realized it's not that straightforward. __kvm_gmem_prepare_folio()
requires the kvm_memory_slot, which is used to calculate the gfn. At
that point we have neither, and it's not just an issue of access, but
there might not be a slot associated with that yet.

Cheers,
/fuad
>
> Thanks,
> /fuad
>
> > --
> > Cheers,
> >
> > David / dhildenb
> >

