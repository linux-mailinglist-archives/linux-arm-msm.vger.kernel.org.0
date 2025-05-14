Return-Path: <linux-arm-msm+bounces-57805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A67AB647F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 09:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BE9D18831D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510E383A14;
	Wed, 14 May 2025 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hdroa7zU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A4E55B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208058; cv=none; b=aZGQ3XMORW9aeOKTTpj0RojowJAWNwNwUwsBgUCdAl6vOo+FKMEpCYLlIlt1g0nw98UgjXoe77NKd+h3w+ok+utWqhFou9IPo3LZJ5e/7Qrg4aEr0U18fRXONlatC/t9SYOinD8RYv0gC3MwxXZEF43Fc/MQ4zlNqLmnl9niolY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208058; c=relaxed/simple;
	bh=Zk8AYXc+N9zzRDvLpBlVY2w1heLxebTxSA5YZ2AGjxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8yd8lL1IexewNmVjxWGPK0r9M/whTVt0LCwvpmU8QVGqN/KZeijwav6mQ3fYZcC4TFLdmA0PyPVBxNMVuyiLnpwW/+u/SyLiqAOFAf859bTsI9aczwwXET8R9H5uJbPCqz0RwF0YlTBWNQT3jeNi/0WjlIbn9bjY0s6MbYswOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hdroa7zU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47666573242so249501cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747208055; x=1747812855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K04p3I7lu9J1Ks0C4ES0/2cH0wDYip+VLHtbctoxbA=;
        b=Hdroa7zUN4jPhx/Q/Vn7CmDCVrY6kIB2AvlKzXmD+27FKQh5rxWxKkqn7PXBzAy05y
         uQ2IhNPfsTmwZKk5vXuFYYNbHutdkgVeuSUPM3jxl+Af+ng9immRUvjWm2cxJa7YG0yB
         BJr2oGFD3Za03sY0lBk1OR2//ZsjrojZs4/mqR7Jk78R6ocDhXanjfpUuvWxXqv68N1O
         L3SDR5cPxeVhvCa5w7h4ItMhRfVqn1VzvCDyrxARndXdZvfifnPtAQGoikWTBgqG/b9l
         2P7ew/QlYS75SChVvA4Kqz3vW803OfqfTVwNn8I/8slB1MMeR7xH07GqbDPDWOXwSMvi
         u0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747208055; x=1747812855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+K04p3I7lu9J1Ks0C4ES0/2cH0wDYip+VLHtbctoxbA=;
        b=aPHfCpr1aclQMX4SmFpQVgHo8YCCVnaNlx26Py1MBAgehTrAlrubOh3kHvH0xyVUUN
         UF9QfOylEaY0ZzLnT+kAIPiuOZDrrNl+f/vFXDyQZK+JJ3MS3oN1l5QAf7rL2a2utMK3
         r9I4Cy7RdUT5GbEVEkKyvS4JN3QGc5R7eJepPraRHJyY4YnhON8t+37iarHVCnsUFujn
         XijrgL2lbqkrnwTQy2mcYdw4nnfxbKt9tr7GSGBKKxMJvPTBs8S0dQc4ryG8xYOdBlWr
         9RAw/0kPwW91Lrk5abgQxKhledFo6WJLMq0ZZl5LTV7evn+4L8gWoNKb2vzMOLpiP/Vi
         LHRA==
X-Forwarded-Encrypted: i=1; AJvYcCXDyUW20QicAlm2SAFRy4dq8ShOKoEYoqsKGUtfWUklHkdmXHAID04m6WL4Lwc5x013Q9IzT9br3BERhwdY@vger.kernel.org
X-Gm-Message-State: AOJu0YyoNZ9uhPlUS5djnTfUfOlrHGF8l8kY/uLRMA5IpvUJXZHX9MqD
	C2wdqOJKAAHokqBy8GFEPX0bcXQdc7SY0YMZN2aLykOg1SvSzcrKwS+Jq41DeSl8cBCfj/aRlTA
	lpwAN5FI9wGsg7huD9IdH0hPOtJHBhcqIpHOiT1QGmPhBAHueh6zzt3g0lrc=
X-Gm-Gg: ASbGncswTgZ9r0fIKU1JKyrLGfDY9DgUqF+05pkQv8PVR6HRgsedOiIA+Ovg/bemdss
	RSu/1+7POBlTY3el0MiU9YpL4zpE6MMgfDQVhLYWcdgJFNwxHMZNC9iPumI1LRNaZah1A8gDTM+
	LP4JTZy7N6U4ZyDZAkTk2Lmi3Qe4sppo7wOQ==
X-Google-Smtp-Source: AGHT+IFSOID1ICFA/5WT/TzMHfPgJnDU6FMA0qEBlUg4UzroG9ERy4wAxu21kXkOFoFF7O5R0YHNgip2tFvVC5FLwQQ=
X-Received: by 2002:a05:622a:10a:b0:477:1f86:178c with SMTP id
 d75a77b69052e-49496168dcdmr3009381cf.26.1747208055027; Wed, 14 May 2025
 00:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-9-tabba@google.com>
 <CADrL8HVikf9OK_j4aUk2NZ-BB2sTdavGnDza9244TMeDWjxbCQ@mail.gmail.com>
In-Reply-To: <CADrL8HVikf9OK_j4aUk2NZ-BB2sTdavGnDza9244TMeDWjxbCQ@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 14 May 2025 08:33:38 +0100
X-Gm-Features: AX0GCFtAIOxW0CKUqlf7YJqpRk8IDw3vPXES_-izSP0Sdin8tzyjcQYf2tlC9j4
Message-ID: <CA+EHjTyWOJA8u3iXS9txF8oDKF-soykjJm8HPPEW+6VpM+uvtg@mail.gmail.com>
Subject: Re: [PATCH v9 08/17] KVM: guest_memfd: Check that userspace_addr and
 fd+offset refer to same range
To: James Houghton <jthoughton@google.com>
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
	peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

On Tue, 13 May 2025 at 21:31, James Houghton <jthoughton@google.com> wrote:
>
> On Tue, May 13, 2025 at 9:34=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
> >
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > On binding of a guest_memfd with a memslot, check that the slot's
> > userspace_addr and the requested fd and offset refer to the same memory
> > range.
> >
> > This check is best-effort: nothing prevents userspace from later mappin=
g
> > other memory to the same provided in slot->userspace_addr and breaking
> > guest operation.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  virt/kvm/guest_memfd.c | 37 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 8e6d1866b55e..2f499021df66 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -556,6 +556,32 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_cr=
eate_guest_memfd *args)
> >         return __kvm_gmem_create(kvm, size, flags);
> >  }
> >
> > +static bool kvm_gmem_is_same_range(struct kvm *kvm,
> > +                                  struct kvm_memory_slot *slot,
> > +                                  struct file *file, loff_t offset)
> > +{
> > +       struct mm_struct *mm =3D kvm->mm;
> > +       loff_t userspace_addr_offset;
> > +       struct vm_area_struct *vma;
> > +       bool ret =3D false;
> > +
> > +       mmap_read_lock(mm);
> > +
> > +       vma =3D vma_lookup(mm, slot->userspace_addr);
> > +       if (!vma)
> > +               goto out;
> > +
> > +       if (vma->vm_file !=3D file)
> > +               goto out;
> > +
> > +       userspace_addr_offset =3D slot->userspace_addr - vma->vm_start;
> > +       ret =3D userspace_addr_offset + (vma->vm_pgoff << PAGE_SHIFT) =
=3D=3D offset;
> > +out:
> > +       mmap_read_unlock(mm);
> > +
> > +       return ret;
> > +}
> > +
> >  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> >                   unsigned int fd, loff_t offset)
> >  {
> > @@ -585,9 +611,14 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memo=
ry_slot *slot,
> >             offset + size > i_size_read(inode))
> >                 goto err;
> >
> > -       if (kvm_gmem_supports_shared(inode) &&
> > -           !kvm_arch_vm_supports_gmem_shared_mem(kvm))
> > -               goto err;
> > +       if (kvm_gmem_supports_shared(inode)) {
> > +               if (!kvm_arch_vm_supports_gmem_shared_mem(kvm))
> > +                       goto err;
> > +
> > +               if (slot->userspace_addr &&
> > +                   !kvm_gmem_is_same_range(kvm, slot, file, offset))
> > +                       goto err;
>
> This is very nit-picky, but I would rather this not be -EINVAL, maybe
> -EIO instead? Or maybe a pr_warn_once() and let the call proceed?
>
> The userspace_addr we got isn't invalid per se, we're just trying to
> give a hint to the user that their VMAs (or the userspace address they
> gave us) are messed up. I don't really like lumping this in with truly
> invalid arguments.

I don't mind changing the return error, but I don't think that we
should have a kernel warning (pr_warn_once) for something userspace
can trigger.

It's not an IO error either. I think that this is an invalid argument
(EINVAL). That said, other than opposing the idea of pr_warn, I am
happy to change it.

Cheers,
/fuad

> > +       }
> >
> >         filemap_invalidate_lock(inode->i_mapping);
> >
> > --
> > 2.49.0.1045.g170613ef41-goog
> >

