Return-Path: <linux-arm-msm+bounces-48742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F315A3E21F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E51991887F1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FD0212B04;
	Thu, 20 Feb 2025 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qx5VoexN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58EA20D4E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071461; cv=none; b=KSfH8A5NpUGQkkVbg6329s3FfKD4GXOrTF+AR4/0UIIvpkIdanYHZiyJlJMUzUe3HkhzcO4HzHzz5nAw0y55Ds6Simn+aJeLDArK1yt6TCyD+QbqOKracIsQz9NI2yL705Kfq2bJKBiEWTO85fCFbLAW8SpJjVnbz0t8G5w2eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071461; c=relaxed/simple;
	bh=WcBIwL1Hxyw/Lmt7dgmemIGoe0byyw0Et+ikXOThAEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4/lz+ZW+h5VsZjX3j1LUVADaje2rpeGZVIy5hPCch7UQOh0pAsKzbTf06N+H116NoouP8tY+cvw1OJKH6X3P1Lr9ztrWa1kll/uvYHTwmWV2gJrA/ZFQVVwwo9f9i3PZ54ZlGvC11nHlyy46p8miOqdG684LYTI07+FzjyZhQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qx5VoexN; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-471fbfe8b89so471661cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740071459; x=1740676259; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=csE1lxdbw4PoIV6OjaA2TVMtZGu4HQa1m39VTDpWUbw=;
        b=qx5VoexNIy151mmHtGdWKJRxc8qqEuscAdeegF26TSHTa8qD94A0btaUx+qLT+l+BF
         ovvnd1uHZQBhc6UnB9cge8jmjAPoa1B0PhZ8ThZTjiCeUrzjk/Cx4u4ufCxN9BQAlA2a
         i3qui830NMBteRt37TKvHPog6QSKZ9G8ohR2vDiJUvFYCgZzulJnIHVuWESXvKtSQs4v
         GrnUtL7nRV9IgOUE93XwLce2/NoM+5MQGaLyUykaFNpQrC8vjts3zjg1T+9HViyREpua
         LK06W2JXBCnHDN7Sg+h1Cx8SwW7R4tiVUNNnRvupbKcg0MHZR2rS9ATV6GDpaTvIs5Tk
         +wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071459; x=1740676259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csE1lxdbw4PoIV6OjaA2TVMtZGu4HQa1m39VTDpWUbw=;
        b=Obzy11BKr3ueaMbNB6k5U+25456kzYGZvYVp1h+aDpWq/8XixlKTbD5VsvIH+q3cjL
         GrBVGQVa9ndHRYROxfRYfGtycMF1LVokE3wpwSJSAsO6wTGC/UkKlLXH50e0E2aalSC+
         vTziSStZei/TSx6gift1sQM7YfDavy+4lvqog5EdsF6IwtOzsH7Tta7HSxF/ZjkfHqG8
         w1FDLvuURmSKnJ3DEq40QFMy+3abT3HWyA6xfqgA4B61FwFVV6hZeSaM7qGujc/eeENi
         wf2anWFClvxoTZTLXLC9t1zox1c8jRKYajHWH5rCI99a8D42CZw9p677k8/N4nm/SvCq
         aM2g==
X-Forwarded-Encrypted: i=1; AJvYcCXxXkXMWvGWoALMSoHr0wRjENrl1M4aT1htH+Ch3JEs4QbQB5eX+nBQvS2Dh63PMZeMZFmEs4Qc6qdjBTmL@vger.kernel.org
X-Gm-Message-State: AOJu0YxGroqHKCMZtt0fdadOyhK/vJMjDmkwKScSgNkko1Qw30byxwyy
	n7gItqBnsEZkNts/B6YKYGDCL29HGhpe1+OlDxsqPgaigBrCpNP73dXKpfFRDaqVFaTifUEMd8U
	2yRo6HNKAGliPp5ftvfQm9k4DbgMXnxhe0vPI
X-Gm-Gg: ASbGncuxPZ9GsNho4SkE0RVZzoxgdoAmh/4lg4wzd8XntrMKMKYVw1PDzya+Jo9WjhP
	OyBgA3L9PrcAVglze6wLM9EnbtmKH2FwwtVWYDCAyfzRwGdR7qgtUWCL54Jb2BjoytH4l1Ps=
X-Google-Smtp-Source: AGHT+IGV5ilwyuGxVvkxrmkgq9M3vn2k0B9ezXlr7SSZ3+TzYxaqtBgcjqG32cJt4SvBepbls8LGETqKuuV9x8V1oxM=
X-Received: by 2002:ac8:7fc2:0:b0:471:83af:c8d3 with SMTP id
 d75a77b69052e-47215bfad6dmr4249761cf.14.1740071458321; Thu, 20 Feb 2025
 09:10:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com> <20250218172500.807733-4-tabba@google.com>
 <2cdc5414-a280-4c47-86d5-4261a12deab6@redhat.com> <CA+EHjTxh9GB93BHr7ymJ5j8c27Lka2cBjEgfNRXY9pYL25utfg@mail.gmail.com>
 <CA+EHjTyyXEMuQrg8yFo=+SVuM+ZfvZJksS9Z4DAOr2KsuO5M-Q@mail.gmail.com> <69467908-17a5-4700-b5da-efc0446b8663@redhat.com>
In-Reply-To: <69467908-17a5-4700-b5da-efc0446b8663@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 20 Feb 2025 17:10:20 +0000
X-Gm-Features: AWEUYZkgND9iO_-ICqCPCwj2nu9sTiSbmtQCnVyN_ILdjE-Q8jiXphkxiuthWr4
Message-ID: <CA+EHjTz0RpD7wA4dF79zh85w3nzQ0Y4GAuTa+=zyOw66i0O9WA@mail.gmail.com>
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

On Thu, 20 Feb 2025 at 15:58, David Hildenbrand <david@redhat.com> wrote:
>
> On 20.02.25 16:45, Fuad Tabba wrote:
> > Hi David,
> >
> > On Thu, 20 Feb 2025 at 12:04, Fuad Tabba <tabba@google.com> wrote:
> >>
> >> On Thu, 20 Feb 2025 at 11:58, David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> On 18.02.25 18:24, Fuad Tabba wrote:
> >>>> Add support for mmap() and fault() for guest_memfd backed memory
> >>>> in the host for VMs that support in-place conversion between
> >>>> shared and private. To that end, this patch adds the ability to
> >>>> check whether the VM type supports in-place conversion, and only
> >>>> allows mapping its memory if that's the case.
> >>>>
> >>>> This behavior is also gated by the configuration option
> >>>> KVM_GMEM_SHARED_MEM.
> >>>>
> >>>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>>> ---
> >>>>    include/linux/kvm_host.h |  11 +++++
> >>>>    virt/kvm/guest_memfd.c   | 103 +++++++++++++++++++++++++++++++++++++++
> >>>>    2 files changed, 114 insertions(+)
> >>>>
> >>>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> >>>> index 3ad0719bfc4f..f9e8b10a4b09 100644
> >>>> --- a/include/linux/kvm_host.h
> >>>> +++ b/include/linux/kvm_host.h
> >>>> @@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> >>>>    }
> >>>>    #endif
> >>>>
> >>>> +/*
> >>>> + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
> >>>> + * private memory is enabled and it supports in-place shared/private conversion.
> >>>> + */
> >>>> +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
> >>>> +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
> >>>> +{
> >>>> +     return false;
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>>    #ifndef kvm_arch_has_readonly_mem
> >>>>    static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
> >>>>    {
> >>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> >>>> index c6f6792bec2a..30b47ff0e6d2 100644
> >>>> --- a/virt/kvm/guest_memfd.c
> >>>> +++ b/virt/kvm/guest_memfd.c
> >>>> @@ -317,9 +317,112 @@ void kvm_gmem_handle_folio_put(struct folio *folio)
> >>>>    {
> >>>>        WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> >>>>    }
> >>>> +
> >>>> +static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
> >>>> +{
> >>>> +     struct kvm_gmem *gmem = file->private_data;
> >>>> +
> >>>> +     /* For now, VMs that support shared memory share all their memory. */
> >>>> +     return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
> >>>> +}
> >>>> +
> >>>> +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> >>>> +{
> >>>> +     struct inode *inode = file_inode(vmf->vma->vm_file);
> >>>> +     struct folio *folio;
> >>>> +     vm_fault_t ret = VM_FAULT_LOCKED;
> >>>> +
> >>>> +     filemap_invalidate_lock_shared(inode->i_mapping);
> >>>> +
> >>>> +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> >>>> +     if (IS_ERR(folio)) {
> >>>> +             switch (PTR_ERR(folio)) {
> >>>> +             case -EAGAIN:
> >>>> +                     ret = VM_FAULT_RETRY;
> >>>> +                     break;
> >>>> +             case -ENOMEM:
> >>>> +                     ret = VM_FAULT_OOM;
> >>>> +                     break;
> >>>> +             default:
> >>>> +                     ret = VM_FAULT_SIGBUS;
> >>>> +                     break;
> >>>> +             }
> >>>> +             goto out_filemap;
> >>>> +     }
> >>>> +
> >>>> +     if (folio_test_hwpoison(folio)) {
> >>>> +             ret = VM_FAULT_HWPOISON;
> >>>> +             goto out_folio;
> >>>> +     }
> >>>> +
> >>>> +     /* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
> >>>> +     if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
> >>>> +             ret = VM_FAULT_SIGBUS;
> >>>> +             goto out_folio;
> >>>> +     }
> >>>> +
> >>>> +     /*
> >>>> +      * Only private folios are marked as "guestmem" so far, and we never
> >>>> +      * expect private folios at this point.
> >>>> +      */
> >>>> +     if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> >>>> +             ret = VM_FAULT_SIGBUS;
> >>>> +             goto out_folio;
> >>>> +     }
> >>>> +
> >>>> +     /* No support for huge pages. */
> >>>> +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> >>>> +             ret = VM_FAULT_SIGBUS;
> >>>> +             goto out_folio;
> >>>> +     }
> >>>> +
> >>>> +     if (!folio_test_uptodate(folio)) {
> >>>> +             clear_highpage(folio_page(folio, 0));
> >>>> +             kvm_gmem_mark_prepared(folio);
> >>>> +     }
> >>>
> >>> kvm_gmem_get_pfn()->__kvm_gmem_get_pfn() seems to call
> >>> kvm_gmem_prepare_folio() instead.
> >>>
> >>> Could we do the same here?
> >>
> >> Will do.
> >
> > I realized it's not that straightforward. __kvm_gmem_prepare_folio()
> > requires the kvm_memory_slot, which is used to calculate the gfn. At
> > that point we have neither, and it's not just an issue of access, but
> > there might not be a slot associated with that yet.
>
> Hmm, right ... I wonder if that might be problematic. I assume no
> memslot == no memory attribute telling us if it is private or shared at
> least for now?
>
> Once guest_memfd maintains that state, it might be "cleaner" ? What's
> your thought?

The idea is that this doesn't determine whether it's shared or private
by the guest_memfd's attributes, but by the new state added in the
other patch series. That's independent of memslots and guest addresses
altogether.

One scenario you can imagine is the host wanting to fault in memory to
initialize it before associating it with a memslot. I guess we could
make it a requirement that you cannot fault-in pages unless they are
associated with a memslot, but that might be too restrictive.

Cheers,
/fuad



> --
> Cheers,
>
> David / dhildenb
>

