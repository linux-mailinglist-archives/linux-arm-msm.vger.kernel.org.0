Return-Path: <linux-arm-msm+bounces-58226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C7AB9E8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 16:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821901881C8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3156153BED;
	Fri, 16 May 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/CNFniB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5B139579
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405301; cv=none; b=KFiONBFeytdTvKh5dpnPIQWP/t4qMa6A+MQGjX0OwNaaMla4RTEeAzT67vfiSb69IczKGdzCVIpUoVSEy0ODb0Yy2at+ttiMHBE6VNKGLmCsk6BD0t8Vqs58+4nTmU8X2DuPvdS2MadLwD/vVF+z2FOB9eg8GTzOM7DpwmKDrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405301; c=relaxed/simple;
	bh=EVkKLFS+FB4G/g2QYE9biq/j8EBnMuGWOFYlp5uz1OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FheIQsjsqPC6fhAXwaTazx/nP9NoyWfhSz7imhptEptCY+IyiEQmniF2d2ygxln7Wh390SN+NnU6/NTgpoAs3TckDYGdtplsVrrKgnURlQAEHiEENbSllRy9c3o8SLpeY0b2xzMuFdRX6pm1cRGYD0jXkUWgrQ8AgLC8MLWvmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/CNFniB; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4774611d40bso300111cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747405299; x=1748010099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gx95MeEuG9a5F4o5TlfsgBawZJUohJXGboelCMmm1E=;
        b=G/CNFniB8TM0+qGCs81Bt5cWciQ4XXv7YM90tZGwdA/EE26O3wZlGa5w9tBYSrhEpx
         TU4XbgEVAQoyz5jnP4oXtmytmtCNRD8AJMuOs3vL6GEAy6QbjHJuyTIT8/7/LQKRFZci
         UV6AORpiQEC6vRXSUt1h3NeRySMpJtVQrnvsY8Pi4wMFoRxDXuD9I4hTfVd7qpdfkwoK
         3GVD8PmNnaUgexTZ8bavoAzypaOWhf7AMTg3T1pCUz9R/ocmJAdLciLVT3w8g7hYSdJv
         zJgdXP5df+zNS/dmvOipOl7h5HZ0zogZaxHfZOg4lUAoD1o6TCFn9Jrzg8BLceDEOMQg
         SLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747405299; x=1748010099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Gx95MeEuG9a5F4o5TlfsgBawZJUohJXGboelCMmm1E=;
        b=l8jP4ZuYsq9KeEtPzjIke6LCRGuuyngfWe8PnZQ0CDugo6ERoS+20cNDirH0HCmgo7
         y8vyZbTKhdioryEaXGBy/TPa2Vt6e9P/gE50lH4qUCfcNMcmt7y0qbuNceT6vw5gvfya
         l9qsl9r7TfpB0IFVzJ08l+I+zUCVZie5kwqt8Z6cCMheI0k9s0pb5JA4rVjdLPbPuaNk
         9h4Ue/+Ag/msRk42NBLtQq1MAb1g0YfWx0fHedCiGYcZP01ae9qtJ26Rp8xccl3ZZNh/
         /BOynHl3XAOQdFKMxfQbKoJjsQFXdi6F7ZunjO5PthAL9wpZMo6GMl7twFgDZUU/v88b
         F6Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+iBF6h7dXXYMIlWWGoN5Lsipc6goBgT6qGyp/EI86XnzEu3eROUvybL8lFAU5z0xA/XLDrcsxXpyJopW@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqncCV64fHPEeWcw1F9jwy6+fO0zBaT9SsFg7vvlv7tt3VN+S
	9gKN+s05VMfQCG3apb7J39WUsGPXsC9L3dh7QEtNGzLwRoILqQCCM3KzzWUW1HtfgaBBSmfA3HG
	LMXMRsno7/t/o2nK8r7ngW0P1FruHbS+P3h4BgCgA
X-Gm-Gg: ASbGnctsRKQKeyMxH41NBPPBlmlbu5YuvJR7m8IpEShSJfwKYTrJ5+6SVPd9UuoV6S1
	AbOLn+8Q9yixuoLkqESB067az+oQVMoF4D5lVO17hKTKjZejikdcjuIDN5SYsIYI8lTV2m8fAKO
	ZJTbQL4oF2P47+Bjgcrro8y/qlcTNlstHrO/WPckoozsZhT8Zys0vRH5dEdyM=
X-Google-Smtp-Source: AGHT+IG9BQbe3D6OYznrgokRiyHAr+oO2Hki2vzSI5InxPp964z0WMUS12BNQkJEUsPjbiIDcuFg4vmGiIRRO2BGv8g=
X-Received: by 2002:a05:622a:13ca:b0:494:58a3:d3e6 with SMTP id
 d75a77b69052e-494a1dc9945mr9046861cf.26.1747405298218; Fri, 16 May 2025
 07:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-8-tabba@google.com>
 <c48843fb-c492-44d4-8000-705413aa9f08@redhat.com> <CA+EHjTwYfZf0rsFa-O386qowRKCsKHvhUjtc-q_+9aKddRVCFQ@mail.gmail.com>
 <de375d2e-21ec-4494-8a8e-800e66076647@redhat.com>
In-Reply-To: <de375d2e-21ec-4494-8a8e-800e66076647@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 16 May 2025 16:20:00 +0200
X-Gm-Features: AX0GCFs9MZr6pehdoYL4Z29-N60sTr4wuO1DvLFNqQOlgs5ePz8Qsa7qzqPuLrE
Message-ID: <CA+EHjTwsYoTZHsv+yvy=aRLamGuxMNbTqACXmZ5Hw+5XCi7aHA@mail.gmail.com>
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

On Fri, 16 May 2025 at 13:12, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/16/25 5:56 PM, Fuad Tabba wrote:
> > On Fri, 16 May 2025 at 08:09, Gavin Shan <gshan@redhat.com> wrote:
> >> On 5/14/25 2:34 AM, Fuad Tabba wrote:
> >>> This patch enables support for shared memory in guest_memfd, including
> >>> mapping that memory at the host userspace. This support is gated by the
> >>> configuration option KVM_GMEM_SHARED_MEM, and toggled by the guest_memfd
> >>> flag GUEST_MEMFD_FLAG_SUPPORT_SHARED, which can be set when creating a
> >>> guest_memfd instance.
> >>>
> >>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> >>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>> ---
> >>>    arch/x86/include/asm/kvm_host.h | 10 ++++
> >>>    include/linux/kvm_host.h        | 13 +++++
> >>>    include/uapi/linux/kvm.h        |  1 +
> >>>    virt/kvm/Kconfig                |  5 ++
> >>>    virt/kvm/guest_memfd.c          | 88 +++++++++++++++++++++++++++++++++
> >>>    5 files changed, 117 insertions(+)
> >>>
> >>
> >> [...]
> >>
> >>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> >>> index 6db515833f61..8e6d1866b55e 100644
> >>> --- a/virt/kvm/guest_memfd.c
> >>> +++ b/virt/kvm/guest_memfd.c
> >>> @@ -312,7 +312,88 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >>>        return gfn - slot->base_gfn + slot->gmem.pgoff;
> >>>    }
> >>>
> >>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> >>> +
> >>> +static bool kvm_gmem_supports_shared(struct inode *inode)
> >>> +{
> >>> +     uint64_t flags = (uint64_t)inode->i_private;
> >>> +
> >>> +     return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> >>> +}
> >>> +
> >>> +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)
> >>> +{
> >>> +     struct inode *inode = file_inode(vmf->vma->vm_file);
> >>> +     struct folio *folio;
> >>> +     vm_fault_t ret = VM_FAULT_LOCKED;
> >>> +
> >>> +     filemap_invalidate_lock_shared(inode->i_mapping);
> >>> +
> >>> +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> >>> +     if (IS_ERR(folio)) {
> >>> +             int err = PTR_ERR(folio);
> >>> +
> >>> +             if (err == -EAGAIN)
> >>> +                     ret = VM_FAULT_RETRY;
> >>> +             else
> >>> +                     ret = vmf_error(err);
> >>> +
> >>> +             goto out_filemap;
> >>> +     }
> >>> +
> >>> +     if (folio_test_hwpoison(folio)) {
> >>> +             ret = VM_FAULT_HWPOISON;
> >>> +             goto out_folio;
> >>> +     }
> >>> +
> >>> +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> >>> +             ret = VM_FAULT_SIGBUS;
> >>> +             goto out_folio;
> >>> +     }
> >>> +
> >>
> >> I don't think there is a large folio involved since the max/min folio order
> >> (stored in struct address_space::flags) should have been set to 0, meaning
> >> only order-0 is possible when the folio (page) is allocated and added to the
> >> page-cache. More details can be referred to AS_FOLIO_ORDER_MASK. It's unnecessary
> >> check but not harmful. Maybe a comment is needed to mention large folio isn't
> >> around yet, but double confirm.
> >
> > The idea is to document the lack of hugepage support in code, but if
> > you think it's necessary, I could add a comment.
> >
>
> Ok, I was actually nit-picky since we're at v9, which is close to integration,
> I guess. If another respin is needed, a comment wouldn't be harmful, but it's
> also perfectly fine without it :)
>
> >
> >>
> >>> +     if (!folio_test_uptodate(folio)) {
> >>> +             clear_highpage(folio_page(folio, 0));
> >>> +             kvm_gmem_mark_prepared(folio);
> >>> +     }
> >>> +
> >>
> >> I must be missing some thing here. This chunk of code is out of sync to kvm_gmem_get_pfn(),
> >> where kvm_gmem_prepare_folio() and kvm_arch_gmem_prepare() are executed, and then
> >> PG_uptodate is set after that. In the latest ARM CCA series, kvm_arch_gmem_prepare()
> >> isn't used, but it would delegate the folio (page) with the prerequisite that
> >> the folio belongs to the private address space.
> >>
> >> I guess that kvm_arch_gmem_prepare() is skipped here because we have the assumption that
> >> the folio belongs to the shared address space? However, this assumption isn't always
> >> true. We probably need to ensure the folio range is really belonging to the shared
> >> address space by poking kvm->mem_attr_array, which can be modified by VMM through
> >> ioctl KVM_SET_MEMORY_ATTRIBUTES.
> >
> > This series only supports shared memory, and the idea is not to use
> > the attributes to check. We ensure that only certain VM types can set
> > the flag (e.g., VM_TYPE_DEFAULT and KVM_X86_SW_PROTECTED_VM).
> >
> > In the patch series that builds on it, with in-place conversion
> > between private and shared, we do add a check that the memory faulted
> > in is in-fact shared.
> >
>
> Ok, thanks for your clarification. I plan to review that series, but not
> getting a chance yet. Right, it's sensible to limit the capability of modifying
> page's attribute (private vs shared) to the particular machine types since
> the whole feature (restricted mmap and in-place conversion) is applicable
> to particular machine types. I can understand KVM_X86_SW_PROTECTED_VM
> (similar to pKVM) needs the feature, but I don't understand why VM_TYPE_DEFAULT
> needs the feature. I guess we may want to use guest-memfd as to tmpfs or
> shmem, meaning all the address space associated with a guest-memfd is shared,
> but without the corresponding private space pointed by struct kvm_userspace_memory_region2
> ::userspace_addr. Instead, the 'userspace_addr' will be mmap(guest-memfd) from
> VMM's perspective if I'm correct.

There are two reasons for why we're adding this feature for
VM_TYPE_DEFAULT. The first is for VMMs like Firecracker to be able to
run guests backed completely by guest_memfd [1]. Combined with
Patrick's series for direct map removal in guest_memfd [2], this would
allow running VMs that offer additional hardening against Spectre-like
transient execution attacks. The other one is that, in the long term,
the hope is for guest_memfd to become the main way for backing guests,
regardless of the type of guest they represent.

If you're interested to find out more, we had a discussion about this
a couple of weeks ago during the bi-weekly guest_memfd upstream call
(May 1) [3].

Cheers,
/fuad

[1] https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hiding
[2] https://lore.kernel.org/all/20250221160728.1584559-1-roypat@amazon.co.uk/
[3] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?tab=t.0#heading=h.jwwteecellpo





> Thanks,
> Gavin
>
> > Thanks,
> > /fuad
> >
> >>> +     vmf->page = folio_file_page(folio, vmf->pgoff);
> >>> +
> >>> +out_folio:
> >>> +     if (ret != VM_FAULT_LOCKED) {
> >>> +             folio_unlock(folio);
> >>> +             folio_put(folio);
> >>> +     }
> >>> +
> >>> +out_filemap:
> >>> +     filemap_invalidate_unlock_shared(inode->i_mapping);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>
> >> Thanks,
> >> Gavin
> >>
> >
>

