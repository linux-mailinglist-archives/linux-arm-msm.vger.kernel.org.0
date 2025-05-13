Return-Path: <linux-arm-msm+bounces-57756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BADAAB5DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4DF5170E40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0343E1F0E50;
	Tue, 13 May 2025 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shBpmf6k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502EF1A304A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168278; cv=none; b=aTAhAcP0VSzXYDzJK6dVrnJL95f1hltUCAPXWt5pZJwwEESQZfXzvMfA1xU8k6WsQCmkOtc8TnG8+ibd90xx8sf1v63KhQIfXy3lQaLhCZoQ08WqCraXNaV7eLAGwYa1qmKKRyfGAp3nShpLBh5gwYtPO4xYF+mPtmvyW8Uy4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168278; c=relaxed/simple;
	bh=eukdgL7HjzdAPLnNNjWgukvc5Jd0Hh12/+oj1Q2I44w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaVT8tcOqtuxi5pOZs6MAeDpmmk/w3o0m25ywDrieSiA+UfZsAnZc6Ay6W/HlunE9NS3Q1Sx7W01XPrcTPE2YPWbPTqFHG0LgcnjYGBtWLOo+Z9KEkh9TcJ5WCdVRofrlWlRDsSZBZaAknH9aBcH5BzhcAWs9NU144NJOIYqmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shBpmf6k; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7053f85f059so53988877b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 13:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747168275; x=1747773075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wndENPomq86wkRuZwYmTmMXKU/XseQeSKbjljEbFCQw=;
        b=shBpmf6kEKBUmQ42aFVYOO53J9PfO/W65EQoaA/zfEzQy2wRGwIkuTJCy6lIYgPOjp
         Zx6Ymoi0Sh07XvCRkN8ZRaOl7Wwdcqrth35X6DX0kIqG9VBLcBX0n2e2dv08TVhOIL/K
         gOqBLGNzGs5qxurD+YSFBmC/8R+lova4iduPhUBvWmj2FFrUs/JPFO26YgIVemkSWFsd
         oaBgOiIM3KLXYDvs62ls1R9aqGqjmNOddKqVM9tT1mm3EELBfRv2kYyzwCD45l0mz5nw
         NO2jSkAowldvC1vb2cn7dWUeK6oWtTlX2MkrRWRe2zcVgTIL/IA5hHmyxskwK8oQVARN
         wj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168275; x=1747773075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wndENPomq86wkRuZwYmTmMXKU/XseQeSKbjljEbFCQw=;
        b=mK92oPojQbjFiYIIp6C/OWdRkWnPU3950clo6VVmCPkELfjp5nvOEabFyOB/LZwlJR
         mNLl9aEIRSGw9BABxU2wyFndmySRJDPTRSdINXbt99wYg2WLSQrHe9Qj0fUQ6zzZG7Ep
         RGwqaUT789S24kubS5Iwqg9fIoLhU6pH2ncMphjG1FqdBOj8e5Go37mVqMUYZDIVqVh7
         bG9pIS9xfMYcPWBFoK5LNyqczHuQddgOwtx2k4BsXwNqi9TFtfyOj64KMtU/FuahgRMD
         P5HlOT5+fDdap2nEFvbSUIBL2XUAY+uh9J7PQtFwzNpxsg3JMxabE5F9i7Vq/wUmKwjp
         +slw==
X-Forwarded-Encrypted: i=1; AJvYcCXGRGxxA3SWIImAypW6gnfaDs2Izfai6ND15GVuxXGO6ZpfSrJ9eseOMkHzzaaq/BGsOwhlIxb8yXzVQePv@vger.kernel.org
X-Gm-Message-State: AOJu0YykGiIsmwmNFCfg3nu29DgHPE3PF4dN1cvBDwHtDfelIT/67ap3
	6/sx1ed6s/xWBJym9Q2ZknpCuajE7TwVqZFj8POho0ow7DSeawefaIrUxKuGFfeq5kbsI8RdqK9
	EVAF+UywKvVC8f/Vj8prq1bV+rqwof0U3hWvbK2hSjMDJeCdtEAlnkKs=
X-Gm-Gg: ASbGncsAIttWDiYPCjPBRU2Y9zLLX1s6urtV20A/XhUg/7PWNuPh8of41QQMggC2KEU
	9P6X2BfRk1AOb574qRaAHuHFgmXcAYN8/uDFUEVSYNyUzxMXmfSeGObccP0i/2B+UK1G4WWn0Ak
	pb7CnzX1n2BXApLirkoGa6ayzcEgjHilRj9p1l2/i3qVVFbgT4u8DoZ43SJ7+uHrg=
X-Google-Smtp-Source: AGHT+IEJ//qlNq1IfQ8rszc1Uy0wYOfxOKqHuRzaKHQXJfYeS586E36Upwbf5PhuHR4JTdlQ6vVkRXVhxuhmBC3Wnz8=
X-Received: by 2002:a05:690c:650e:b0:709:1dc6:7b9e with SMTP id
 00721157ae682-70c7f14430fmr14931947b3.19.1747168274750; Tue, 13 May 2025
 13:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-9-tabba@google.com>
In-Reply-To: <20250513163438.3942405-9-tabba@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 13 May 2025 13:30:39 -0700
X-Gm-Features: AX0GCFt3Ej-rtuSDxZfEtQ8esrXhZrxKtQ6g_vg8HorUwKkG7FEfYYyIODDgNRk
Message-ID: <CADrL8HVikf9OK_j4aUk2NZ-BB2sTdavGnDza9244TMeDWjxbCQ@mail.gmail.com>
Subject: Re: [PATCH v9 08/17] KVM: guest_memfd: Check that userspace_addr and
 fd+offset refer to same range
To: Fuad Tabba <tabba@google.com>
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

On Tue, May 13, 2025 at 9:34=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> On binding of a guest_memfd with a memslot, check that the slot's
> userspace_addr and the requested fd and offset refer to the same memory
> range.
>
> This check is best-effort: nothing prevents userspace from later mapping
> other memory to the same provided in slot->userspace_addr and breaking
> guest operation.
>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  virt/kvm/guest_memfd.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 8e6d1866b55e..2f499021df66 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -556,6 +556,32 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_crea=
te_guest_memfd *args)
>         return __kvm_gmem_create(kvm, size, flags);
>  }
>
> +static bool kvm_gmem_is_same_range(struct kvm *kvm,
> +                                  struct kvm_memory_slot *slot,
> +                                  struct file *file, loff_t offset)
> +{
> +       struct mm_struct *mm =3D kvm->mm;
> +       loff_t userspace_addr_offset;
> +       struct vm_area_struct *vma;
> +       bool ret =3D false;
> +
> +       mmap_read_lock(mm);
> +
> +       vma =3D vma_lookup(mm, slot->userspace_addr);
> +       if (!vma)
> +               goto out;
> +
> +       if (vma->vm_file !=3D file)
> +               goto out;
> +
> +       userspace_addr_offset =3D slot->userspace_addr - vma->vm_start;
> +       ret =3D userspace_addr_offset + (vma->vm_pgoff << PAGE_SHIFT) =3D=
=3D offset;
> +out:
> +       mmap_read_unlock(mm);
> +
> +       return ret;
> +}
> +
>  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>                   unsigned int fd, loff_t offset)
>  {
> @@ -585,9 +611,14 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory=
_slot *slot,
>             offset + size > i_size_read(inode))
>                 goto err;
>
> -       if (kvm_gmem_supports_shared(inode) &&
> -           !kvm_arch_vm_supports_gmem_shared_mem(kvm))
> -               goto err;
> +       if (kvm_gmem_supports_shared(inode)) {
> +               if (!kvm_arch_vm_supports_gmem_shared_mem(kvm))
> +                       goto err;
> +
> +               if (slot->userspace_addr &&
> +                   !kvm_gmem_is_same_range(kvm, slot, file, offset))
> +                       goto err;

This is very nit-picky, but I would rather this not be -EINVAL, maybe
-EIO instead? Or maybe a pr_warn_once() and let the call proceed?

The userspace_addr we got isn't invalid per se, we're just trying to
give a hint to the user that their VMAs (or the userspace address they
gave us) are messed up. I don't really like lumping this in with truly
invalid arguments.

> +       }
>
>         filemap_invalidate_lock(inode->i_mapping);
>
> --
> 2.49.0.1045.g170613ef41-goog
>

