Return-Path: <linux-arm-msm+bounces-53196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB5A7B850
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 354303B90C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 07:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B680E1953BB;
	Fri,  4 Apr 2025 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gjOnTkZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFCC1917F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752438; cv=none; b=cGJS7hKg4oNQSeywcPTSvh+40H29jv4z7xd+B6YNpLpb7+XDgNK1wWI3iVW3UGLlu1VPUQvSYxdWUCrC2T3y0/7ydX0lL5NnQze0Qvddyv2ANk3mq2Q70UzRt1FBjM4m1uh8wifiwa4oxm5Hqlm3c6phm10wimRm6dVa5D50vCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752438; c=relaxed/simple;
	bh=sjzVQvVa1uqblMttCsVGpLok+Avn0ska1LUiRUgNDE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YznVNeXT9Oad9AV0NzRllyGNkzmzZYvsuxC3KW9ixPpyxnurNkXuO8bKV0a3Y2xOAe5l9yX+Ap7g/iJviPaBPfZvrXVY0ewG47qjP35emVoAu/movN/Knz48IVOr74yqyBdWLYIShb1fEV2Ev0TiMAt89R2QzX2tk0EBn51V5VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gjOnTkZr; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4769e30af66so177621cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743752436; x=1744357236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Br9fTXMROs5VR9w4FKT6n7aN+mcJkt+3kBtbpV2Oo8A=;
        b=gjOnTkZrIf/lVB53Sk80Y4SuALNXhTvGeh9qiRPQHUiqWrWjIOH1OD+C1mV6OAL2M/
         wV8wU6B0Q8lTsfDrVdzowJN16+NtKW10nDYZwjRNBUI1ilKT8sM5oEh0hwXoN0GKWQKS
         maNEySQFQrkV6DFtdTpK8fBGI6Le9EnK30z9SrVdgNwV7RLxI10T3ZE4TH8AO9fyxFqO
         9s58oZWtRHMAekQzDfLJNIS7zLiU9AYa79ddlJeCVBgTPpwQTlnncU7S89sVbibrnfMS
         lNPm6DNtviDmkdQB5eqHD+OBSbnIeLnf/8qvzCgwUKIlnbBIwV5l5yOvAycYtFf2LJLM
         r7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752436; x=1744357236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br9fTXMROs5VR9w4FKT6n7aN+mcJkt+3kBtbpV2Oo8A=;
        b=pzWpvTFcOrhpWlm04+LRKGo4oSdIEiNEVY9sMNjtieDgtlUmGYCIfDY2S2p+GJPBNJ
         YiUY7kRIC4AYR+MrvKqn3VAPcRz0Al0+9sOJfxDej/5m9qG9kDLS6aALxadKHd5d6LVL
         TiKe6G3L2+wsj4GHTAZ1HG46sxENSrorposqkE5i84Z6+BrumFH+pjkX8tFMULyC5O9J
         XVRB1YkDsDXJn74W0Plnl+7cqMjJzjxvKb4nmZW2aCqvQq7HPaGYRuQAHMvr/saOtvzY
         5Qsz7e6G2prmH3/u52s5GArz+BFsrRl5L6uqaBib6NIAlqIWMYR0aq/04CFG9nfyJhIW
         ESUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/CHwZYPREQPA0ALaNjrAaACC1W9PI21VcAkDpuBAafOhnh/LRgxasj3xLqNstkNWO0BtA7IrWwbnwT+Js@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5V7ybYI+eyC+0uOJlt058dkqsFAukq18b0T3JekDaFhfZdoGB
	pt6qaT8L84iIk86J3P59aQsksnwXriNw/ggzRXlK7Ntip+ckXzWP7gMvDyrvpLAtpfr0sK0qwcU
	xAlgSoEyOc1Zh4HckIbJLSGqDWZbFAO8uAK1H
X-Gm-Gg: ASbGncsREyqguZCUywFkftjdLgDEYaGD9OISKtmoIEauM+BiC9+zU8RwH/JbENO0M+q
	W2UIXPuP0I8NChI6FIE2UXd71J9crse97L90X5HnpK1HGHM9PtrFwIeTImNdLU1SwZRkuRg628G
	TeAhm68q6iRQQGUJm/IK8fLxhK9w==
X-Google-Smtp-Source: AGHT+IHh8o/6bgfsrn4MOo/LfDZvpVO0g+kpT4fjlgLXJoUO0EWOqh4XIHc3wOChI4rmlnpnV9UyfyMJyIj6psRylco=
X-Received: by 2002:a05:622a:309:b0:476:6232:183f with SMTP id
 d75a77b69052e-479266bfe08mr2230591cf.19.1743752435191; Fri, 04 Apr 2025
 00:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153133.3504118-8-tabba@google.com> <diqzy0wimb9c.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzy0wimb9c.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 4 Apr 2025 08:39:58 +0100
X-Gm-Features: ATxdqUES1GQahg7fTolYInex80Nv9poFQfIEx56A1_oFSbplzfZGtv-MWgV4DME
Message-ID: <CA+EHjTz34Rq8q9TDAb0OZYYaMXZATOAEf1_wMwA_sDgAKDwvnQ@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] KVM: guest_memfd: Add a guest_memfd() flag to
 initialize it as shared
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Wed, 2 Apr 2025 at 23:47, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > Not all use cases require guest_memfd() to be shared with the host when
> > first created. Add a new flag, GUEST_MEMFD_FLAG_INIT_SHARED, which when
> > set on KVM_CREATE_GUEST_MEMFD initializes the memory as shared with the
> > host, and therefore mappable by it. Otherwise, memory is private until
> > explicitly shared by the guest with the host.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  Documentation/virt/kvm/api.rst                 |  4 ++++
> >  include/uapi/linux/kvm.h                       |  1 +
> >  tools/testing/selftests/kvm/guest_memfd_test.c |  7 +++++--
> >  virt/kvm/guest_memfd.c                         | 12 ++++++++++++
> >  4 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 2b52eb77e29c..a5496d7d323b 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6386,6 +6386,10 @@ most one mapping per page, i.e. binding multiple memory regions to a single
> >  guest_memfd range is not allowed (any number of memory regions can be bound to
> >  a single guest_memfd file, but the bound ranges must not overlap).
> >
> > +If the capability KVM_CAP_GMEM_SHARED_MEM is supported, then the flags field
> > +supports GUEST_MEMFD_FLAG_INIT_SHARED, which initializes the memory as shared
> > +with the host, and thereby, mappable by it.
> > +
> >  See KVM_SET_USER_MEMORY_REGION2 for additional details.
> >
> >  4.143 KVM_PRE_FAULT_MEMORY
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 117937a895da..22d7e33bf09c 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1566,6 +1566,7 @@ struct kvm_memory_attributes {
> >  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> >
> >  #define KVM_CREATE_GUEST_MEMFD       _IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
> > +#define GUEST_MEMFD_FLAG_INIT_SHARED         (1UL << 0)
> >
> >  struct kvm_create_guest_memfd {
> >       __u64 size;
> > diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> > index 38c501e49e0e..4a7fcd6aa372 100644
> > --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> > +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> > @@ -159,7 +159,7 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
> >  static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> >  {
> >       size_t page_size = getpagesize();
> > -     uint64_t flag;
> > +     uint64_t flag = BIT(0);
> >       size_t size;
> >       int fd;
> >
> > @@ -170,7 +170,10 @@ static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> >                           size);
> >       }
> >
> > -     for (flag = BIT(0); flag; flag <<= 1) {
> > +     if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
> > +             flag = GUEST_MEMFD_FLAG_INIT_SHARED << 1;
> > +
> > +     for (; flag; flag <<= 1) {
>
> This would end up shifting the GUEST_MEMFD_FLAG_INIT_SHARED flag for
> each loop.

Yes. That's my intention. This tests whether the flags are invalid.
Without GUEST_MEMFD_FLAG_INIT_SHARED, no flag is valid, so it starts
with bit zero and goes through all the flags.

If KVM_CAP_GMEM_SHARED_MEM is available, then we want to start from
bit 1 (i.e., skip bit 0, which is GUEST_MEMFD_FLAG_INIT_SHARED).

Cheers,
/fuad

> >               fd = __vm_create_guest_memfd(vm, page_size, flag);
> >               TEST_ASSERT(fd == -1 && errno == EINVAL,
> >                           "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index eec9d5e09f09..32e149478b04 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -1069,6 +1069,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> >               goto err_gmem;
> >       }
> >
> > +     if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&
> > +         (flags & GUEST_MEMFD_FLAG_INIT_SHARED)) {
> > +             err = kvm_gmem_offset_range_set_shared(file_inode(file), 0, size >> PAGE_SHIFT);
> > +             if (err) {
> > +                     fput(file);
> > +                     goto err_gmem;
> > +             }
> > +     }
> > +
> >       kvm_get_kvm(kvm);
> >       gmem->kvm = kvm;
> >       xa_init(&gmem->bindings);
> > @@ -1090,6 +1099,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> >       u64 flags = args->flags;
> >       u64 valid_flags = 0;
> >
> > +     if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
> > +             valid_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> > +
> >       if (flags & ~valid_flags)
> >               return -EINVAL;

