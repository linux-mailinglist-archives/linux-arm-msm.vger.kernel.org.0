Return-Path: <linux-arm-msm+bounces-57846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EECAB6D2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6514C3877
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0083718BC0C;
	Wed, 14 May 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HlEEiDYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4498D22615
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230456; cv=none; b=R4Ov8tPydlnlAUjdfyHS8fcwfrk97ICK7h7G5j2YrVfu0Nf80y7lmL9kykbOVqZOJ1oVi5aabRI5tVqYQxm4oCtTiPLRXHp5gDLyV45cbsQVrIMutAPW35bEtUd07ia/FFGopTqY4pSozJFtWvZPc3t9NLV3WwdqsM8a43I8f0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230456; c=relaxed/simple;
	bh=nDyduVLgFBFH3gTMueLQbgt/yrdrb7IJ6t26wAPoNcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iMgVBpVEjdsTD6PmRq8JZV+4rUQOH796Bbke/c2jCyrO64kU5OdA5K1PStxw7NSO4BK6syNzcmo7KgmEzsrl7wQZqtjn5AerP3sr8i+GToY6FHWSI3iCNu/G3Yy63ejdoDbqxXPz/mD/Ro/dLGy9vjZ2YZ+499lYyHAz+2U50cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HlEEiDYL; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a96aca21eso6967359a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747230454; x=1747835254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAeeCNPnco32qDMK0805AT1A5LqfUBAlcHGKeMgxKz0=;
        b=HlEEiDYLoaiJXy5DrBzEvc5N6g5s7LQbTh7U42FNP5jelx9OIZYyOPR6fWF+cyrY5U
         TqIeVUxnAvCpFaPRR4zlX+Zd/VdvYFIKVRZQC/sSAwdKusp0atbLfxDMjbloeBH53oTt
         iqZcEuK8Q/PV202gVK+3TYDVD9xptQuMtjZBd0KsIAymAVdR3fDLlU0StYm8/8gH34vZ
         tiGUmAy+7w+aGuCD/eu1RkLvWkGdrHR1wSi9smaZcgxUgbBPRoWxtPjIKBpBaBi7K36Q
         /I2kfLoxQmfQ+8yhMu1qTWX6S3Kwbn//i3eAaSVzvi2/ngrphAal31TBJ42o4QyPLv/+
         lQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230454; x=1747835254;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NAeeCNPnco32qDMK0805AT1A5LqfUBAlcHGKeMgxKz0=;
        b=PGnIkf5tkDw8mCC8IXuvWLPOWQdPRZ3bDiIKt3jcruFJ758cT1+tAzBad2pPKrZFNo
         NO24bDIZdkFEVmx4/JcFsSJp/8nCuhd9QTuIlb3VoqHPitd/A6+f1qniE3U08oCJpqYq
         a4xWWJOjy/mUfeJCr6b33q8WsjJ/kbOCHkSjvnDfQG5HFFR/H/JlgGYUiNwtTG5vTMJ5
         LA1LPdlK0vX0J8pPFLtIuATNKchEkmRVVP1bnRAmuQkjYdeO3kk5BM/MZLWd+2PbmpJT
         9yQuGEavqTQhvlm9ELDb+xf56fURYBMHVf1ph1KNnIUNBIeSi9/V93E+ZGJ5hdCW3f4U
         ZIlg==
X-Forwarded-Encrypted: i=1; AJvYcCVxVX3aVsYMw1WbIh7UZB/nlzUcyOW18+q3F+iGtM/fL6lBfess52o3N4tms55QwvX3BdCoXB0GI7PINiM2@vger.kernel.org
X-Gm-Message-State: AOJu0YwzI3g/O83tSk0Q2FGIe0XGhW/mURsBtObprjHjclE73Ngu1Jay
	Jffk6DSfIOo4nMKenzEVpB+zmsEL44/YeoC6Y6wyWXtRcwbRbSB+GpyNVsZ/qIOY+S6ulqFXjS7
	dLp5l7LEuAZ8s/NXyga5MsQ==
X-Google-Smtp-Source: AGHT+IFlOuQgyMPVc1YUUtLXJF5y8ehrcWnysunLFjMxE8p4X6GNDVE1Npu94fwETvyfjq0ALu78lCMC+AguGK3AiA==
X-Received: from pjbsy12.prod.google.com ([2002:a17:90b:2d0c:b0:2fc:2b96:2d4b])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b85:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-30e2e644d22mr5148468a91.35.1747230454332;
 Wed, 14 May 2025 06:47:34 -0700 (PDT)
Date: Wed, 14 May 2025 06:47:33 -0700
In-Reply-To: <aCSbfjoD2_Dj_t6b@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-9-tabba@google.com>
 <CADrL8HVikf9OK_j4aUk2NZ-BB2sTdavGnDza9244TMeDWjxbCQ@mail.gmail.com>
 <CA+EHjTyWOJA8u3iXS9txF8oDKF-soykjJm8HPPEW+6VpM+uvtg@mail.gmail.com> <aCSbfjoD2_Dj_t6b@google.com>
Message-ID: <diqzo6vvpami.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v9 08/17] KVM: guest_memfd: Check that userspace_addr and
 fd+offset refer to same range
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
	peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Wed, May 14, 2025, Fuad Tabba wrote:
>> On Tue, 13 May 2025 at 21:31, James Houghton <jthoughton@google.com> wro=
te:
>> >
>> > On Tue, May 13, 2025 at 9:34=E2=80=AFAM Fuad Tabba <tabba@google.com> =
wrote:
>> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> > > index 8e6d1866b55e..2f499021df66 100644
>> > > --- a/virt/kvm/guest_memfd.c
>> > > +++ b/virt/kvm/guest_memfd.c
>> > > @@ -556,6 +556,32 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm=
_create_guest_memfd *args)
>> > >         return __kvm_gmem_create(kvm, size, flags);
>> > >  }
>> > >
>> > > +static bool kvm_gmem_is_same_range(struct kvm *kvm,
>> > > +                                  struct kvm_memory_slot *slot,
>> > > +                                  struct file *file, loff_t offset)
>> > > +{
>> > > +       struct mm_struct *mm =3D kvm->mm;
>> > > +       loff_t userspace_addr_offset;
>> > > +       struct vm_area_struct *vma;
>> > > +       bool ret =3D false;
>> > > +
>> > > +       mmap_read_lock(mm);
>> > > +
>> > > +       vma =3D vma_lookup(mm, slot->userspace_addr);
>> > > +       if (!vma)
>> > > +               goto out;
>> > > +
>> > > +       if (vma->vm_file !=3D file)
>> > > +               goto out;
>> > > +
>> > > +       userspace_addr_offset =3D slot->userspace_addr - vma->vm_sta=
rt;
>> > > +       ret =3D userspace_addr_offset + (vma->vm_pgoff << PAGE_SHIFT=
) =3D=3D offset;
>> > > +out:
>> > > +       mmap_read_unlock(mm);
>> > > +
>> > > +       return ret;
>> > > +}
>> > > +
>> > >  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>> > >                   unsigned int fd, loff_t offset)
>> > >  {
>> > > @@ -585,9 +611,14 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_m=
emory_slot *slot,
>> > >             offset + size > i_size_read(inode))
>> > >                 goto err;
>> > >
>> > > -       if (kvm_gmem_supports_shared(inode) &&
>> > > -           !kvm_arch_vm_supports_gmem_shared_mem(kvm))
>> > > -               goto err;
>> > > +       if (kvm_gmem_supports_shared(inode)) {
>> > > +               if (!kvm_arch_vm_supports_gmem_shared_mem(kvm))
>> > > +                       goto err;
>> > > +
>> > > +               if (slot->userspace_addr &&
>> > > +                   !kvm_gmem_is_same_range(kvm, slot, file, offset)=
)
>> > > +                       goto err;
>> >
>> > This is very nit-picky, but I would rather this not be -EINVAL, maybe
>> > -EIO instead? Or maybe a pr_warn_once() and let the call proceed?
>
> Or just omit the check entirely.  The check isn't binding (ba-dump, ching=
!),
> because the mapping/VMA can change the instant mmap_read_unlock() is call=
ed.
>
>> > The userspace_addr we got isn't invalid per se, we're just trying to
>> > give a hint to the user that their VMAs (or the userspace address they
>> > gave us) are messed up. I don't really like lumping this in with truly
>> > invalid arguments.
>>=20
>> I don't mind changing the return error, but I don't think that we
>> should have a kernel warning (pr_warn_once) for something userspace
>> can trigger.
>
> This isn't a WARN, e.g. won't trip panic_on_warn.  In practice, it's not
> meaningfully different than pr_info().  That said, I agree that printing =
anything
> is a bad approach.
>
>> It's not an IO error either. I think that this is an invalid argument
>> (EINVAL).
>
> I agree with James, this isn't an invalid argument.  Having the validity =
of an
> input hinge on the ordering between a KVM ioctl() and mmap() is quite odd=
.  I
> know KVM arm64 does exactly this for KVM_SET_USER_MEMORY_REGION{,2}, but =
I don't
> love the semantics.  And unlike that scenario, where e.g. MTE tags are ve=
rified
> again at fault-time, KVM won't re-check the VMA when accessing guest memo=
ry via
> the userspace mapping, e.g. through uaccess.
>
> Unless I'm forgetting something, I'm leaning toward omitting the check en=
tirely.
>

I'm good with dropping this patch. I might have misunderstood the
conclusion of the guest_memfd call.

>> That said, other than opposing the idea of pr_warn, I am happy to change=
 it.

