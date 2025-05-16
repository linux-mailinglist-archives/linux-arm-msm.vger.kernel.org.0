Return-Path: <linux-arm-msm+bounces-58180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA7AB96F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC4BA00984
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 07:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB99922AE7A;
	Fri, 16 May 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PZxYxTfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3D22A4EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382241; cv=none; b=VuM59ynwtzG+50USeP9Ljf348eoy10ikz7w7kuztUI/y8A0HiYANHsr4PLGPxK1HGlj5bOu+kMY0WWVy/gUd+ZKcGcHbTNUkFoloUgStXCXI0PQshQGtw2sSrVaXakxgWtboGtr7mjVxaBkWweGBGHVBWZfbG5cwIa+HMVF+mvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382241; c=relaxed/simple;
	bh=2Xe2E/kHvoxjxWu0Pb3uOMNnbXKgBwRPMFf36qsD7T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2FzVolnQkPrVVH3OtznGLdcnfzkqc29RrkNsSjeWLyIbckQtpwqyYd7uGAADxArwHW0mqQxDWiS14cAYVDIPWPjfNle+XN2ke26A1MbwGOd2Ph4t18rqfciLKMCQXwGxurtXRDIp0q4MTwIWtFCjwqGmmCOtwrhxvpdTJhJ2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PZxYxTfr; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47666573242so257541cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747382238; x=1747987038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c3Jp6kgbpokvgF/j4fzbi4O9fxQfi2BTNxp2Nw2geBk=;
        b=PZxYxTfrUL48S+8Yq+P2+MKtfaFQjHONSFVf3Ap1HhbAQRJHvI6GlDAtJ2vcdDusQ7
         UOan/D7YwBmP1jO1iTcnii3I9qCN5+JZ+KdAlZ6c63GVHBNVw3u9cLGDs5z7v/ed1fbI
         Xw9M65RCN+i0ZwlCxOqJrR1GsCrGI54jb6VavHUsm4bqqXk42sMZ24vnqKPXGnZFcYLV
         jBU+yjHVOwNaVwtNnbIXNhr9pHGjO6MFqnykS5/kUKHxmetyTihT+RMhaqGVmhRBr5me
         M7l5XpONe4DnazOAocsrwjMiUjiVfABnZB+zOBqOdQULwE/qbCvT+Fvo3B8kGZAZKOlt
         bp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382238; x=1747987038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3Jp6kgbpokvgF/j4fzbi4O9fxQfi2BTNxp2Nw2geBk=;
        b=iT0BAfQ5LkuE0rXMVSPG0GXp2V3XgOv1kT6f2TXv6W4//KTBGLiG0RtQCb/TtMP1Ga
         YJ8S+dbd4YVJatzkcbztmE6WsLVayX40nm2RVvBURCKbeDr4T3bALfvQUYIi8MDfcpir
         r0wD4vAaR092cgw1Skyr0v8KVP/Yx0J1dcGVxrAblXYSQAKEtvCR14FRpnU3AidONjox
         NNGcYp/hVgpKEn3FxJeg4c+Qw7wWXA8VBsSMRBTbV10E+ekaz2XWv2ENUia1tmJX//W5
         COXY24ij72eC5tfKuixH+JBbRjQQU+Jqhh5nPPE1BjFF1UMXgfwN9eMAOgNuG/+Kkv51
         uQDw==
X-Forwarded-Encrypted: i=1; AJvYcCXCuacChtGA4yG5O10/6J9jKOg9le4KAfsbDPl2Hh9iOw700SRm5uXq505zG6mmIOuziuU6O411oX0J+n95@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhkvPmaTwYyT+E+nLVriHe8gOI1n4SljE8ePRQXW+imbFu0ms
	5eYALwlL+G4Bd+IrZgxoky0FGOicctBaCfIOmTrnmxP7s8F6OrI0e/AzHFiBzxFYEVL7eA0PzA7
	fOtxKFvAaP09KgCUe9ZfBUf5wVJJ2tKA8S9d28GyL
X-Gm-Gg: ASbGncsslag4rReL6IyPpErLLJCIh5AZHn2UXiu7j3Jcdbxz8IUOcvxcwi4EdrNerqA
	iqx3AjeSabKGobZ/T4Ods2zVchsgytjfOgZtXNyXfK0dX0jBA7iEaVPuqHxXdoC/k91HgVlaMmX
	+j1RaBNZCM1zf2/8Ksm4tzOE7HqVQsb0CwTRDdoOtiucFCoQ0gVSvdVr0hUz0ZyfEhhuc2Ow==
X-Google-Smtp-Source: AGHT+IF/V6uW3bEV/QeZYXYvfB0OwV6WFGk/h+346eJJtcMY/gVnuOalQpd686iaC+A67ZGGGKAJiTFIjn6pAEoEFKg=
X-Received: by 2002:a05:622a:13c8:b0:494:58a3:d3d3 with SMTP id
 d75a77b69052e-494a1dcf605mr7242811cf.20.1747382237556; Fri, 16 May 2025
 00:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-8-tabba@google.com>
 <c48843fb-c492-44d4-8000-705413aa9f08@redhat.com>
In-Reply-To: <c48843fb-c492-44d4-8000-705413aa9f08@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 16 May 2025 09:56:40 +0200
X-Gm-Features: AX0GCFu_obOMEV6g2Z1S4ek2joHav2c-LHI4X8n0urIcq6zSRgkZfd8hv3mz17Y
Message-ID: <CA+EHjTwYfZf0rsFa-O386qowRKCsKHvhUjtc-q_+9aKddRVCFQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: Gavin Shan <gshan@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Gavin,

On Fri, 16 May 2025 at 08:09, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/14/25 2:34 AM, Fuad Tabba wrote:
> > This patch enables support for shared memory in guest_memfd, including
> > mapping that memory at the host userspace. This support is gated by the
> > configuration option KVM_GMEM_SHARED_MEM, and toggled by the guest_memfd
> > flag GUEST_MEMFD_FLAG_SUPPORT_SHARED, which can be set when creating a
> > guest_memfd instance.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h | 10 ++++
> >   include/linux/kvm_host.h        | 13 +++++
> >   include/uapi/linux/kvm.h        |  1 +
> >   virt/kvm/Kconfig                |  5 ++
> >   virt/kvm/guest_memfd.c          | 88 +++++++++++++++++++++++++++++++++
> >   5 files changed, 117 insertions(+)
> >
>
> [...]
>
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 6db515833f61..8e6d1866b55e 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -312,7 +312,88 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >       return gfn - slot->base_gfn + slot->gmem.pgoff;
> >   }
> >
> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > +
> > +static bool kvm_gmem_supports_shared(struct inode *inode)
> > +{
> > +     uint64_t flags = (uint64_t)inode->i_private;
> > +
> > +     return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> > +}
> > +
> > +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)
> > +{
> > +     struct inode *inode = file_inode(vmf->vma->vm_file);
> > +     struct folio *folio;
> > +     vm_fault_t ret = VM_FAULT_LOCKED;
> > +
> > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > +
> > +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> > +     if (IS_ERR(folio)) {
> > +             int err = PTR_ERR(folio);
> > +
> > +             if (err == -EAGAIN)
> > +                     ret = VM_FAULT_RETRY;
> > +             else
> > +                     ret = vmf_error(err);
> > +
> > +             goto out_filemap;
> > +     }
> > +
> > +     if (folio_test_hwpoison(folio)) {
> > +             ret = VM_FAULT_HWPOISON;
> > +             goto out_folio;
> > +     }
> > +
> > +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
>
> I don't think there is a large folio involved since the max/min folio order
> (stored in struct address_space::flags) should have been set to 0, meaning
> only order-0 is possible when the folio (page) is allocated and added to the
> page-cache. More details can be referred to AS_FOLIO_ORDER_MASK. It's unnecessary
> check but not harmful. Maybe a comment is needed to mention large folio isn't
> around yet, but double confirm.

The idea is to document the lack of hugepage support in code, but if
you think it's necessary, I could add a comment.


>
> > +     if (!folio_test_uptodate(folio)) {
> > +             clear_highpage(folio_page(folio, 0));
> > +             kvm_gmem_mark_prepared(folio);
> > +     }
> > +
>
> I must be missing some thing here. This chunk of code is out of sync to kvm_gmem_get_pfn(),
> where kvm_gmem_prepare_folio() and kvm_arch_gmem_prepare() are executed, and then
> PG_uptodate is set after that. In the latest ARM CCA series, kvm_arch_gmem_prepare()
> isn't used, but it would delegate the folio (page) with the prerequisite that
> the folio belongs to the private address space.
>
> I guess that kvm_arch_gmem_prepare() is skipped here because we have the assumption that
> the folio belongs to the shared address space? However, this assumption isn't always
> true. We probably need to ensure the folio range is really belonging to the shared
> address space by poking kvm->mem_attr_array, which can be modified by VMM through
> ioctl KVM_SET_MEMORY_ATTRIBUTES.

This series only supports shared memory, and the idea is not to use
the attributes to check. We ensure that only certain VM types can set
the flag (e.g., VM_TYPE_DEFAULT and KVM_X86_SW_PROTECTED_VM).

In the patch series that builds on it, with in-place conversion
between private and shared, we do add a check that the memory faulted
in is in-fact shared.

Thanks,
/fuad

> > +     vmf->page = folio_file_page(folio, vmf->pgoff);
> > +
> > +out_folio:
> > +     if (ret != VM_FAULT_LOCKED) {
> > +             folio_unlock(folio);
> > +             folio_put(folio);
> > +     }
> > +
> > +out_filemap:
> > +     filemap_invalidate_unlock_shared(inode->i_mapping);
> > +
> > +     return ret;
> > +}
> > +
>
> Thanks,
> Gavin
>

