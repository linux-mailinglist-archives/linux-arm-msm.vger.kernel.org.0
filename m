Return-Path: <linux-arm-msm+bounces-61141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3739AD790A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 19:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D17A3AB2CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 17:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1CE27146B;
	Thu, 12 Jun 2025 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tdQ+6SiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C299187FE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749666; cv=none; b=dU1//kYE64slqfjxK9pNPT4Tdzd4dKxgkMKiMUWOrOdUxF+iesQFYB3CZ55GFCeDe2gsu52TMDMvmTpQOAyFyXM9TdEt7onVYgnuDvneLr6pse7RkhlrsiScelEsqojcjUgrGDkaZ28vQcZTbt4w9I/dn+IKNmvgUjuWalIT9wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749666; c=relaxed/simple;
	bh=tUQaclW9DMkN0TzMOFrjK9idmQHqc6kQxHKKF2mXtBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkIXnGi5uhPCM3+adAbEbSlyD0mc0i6eKA6A1mk0AR9vWb2/rq7E2EiWFQAqZP7LC8dhqdd+/nbEAGZYsOlRRpXzY/85MQHhlDgn1uMCKVHovHmWgLB75TTGq9Mjjsp+OI0fqqibJ02W5QyomyLUqtR6gH8h4UHPPu8GjUFY3rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tdQ+6SiT; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e812c817de0so1162048276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749749663; x=1750354463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrafqKRYjLIYlVlnQCbScViLttcaCCEtpwvofjO7Z3g=;
        b=tdQ+6SiTJa6TI9lELAFQ21XSi4oylJJzrn1ZojS2kBWzwrFZAcNECoMrAuqaJkT0uw
         DjSBafoOknr4bvdHU9OrjYWEUG282HT0eb9BCNJCnr34qcHWJvQN5B26lF2fU0SJt3Gb
         lDaWYfbNEI3GP4MMi3ljhvsP5pBBmmRF2FvRG6g4i+Dxln+ymnEPcM6f5C0cIp/iGxMW
         whIJunNEFjeVLyckSLvSJ/cxCpzDnenIqxQxQ8Hl7BhP9aZCqnMxJ0KG0i5KZO6S5Xkp
         Uj632EMCutWCkTu+I69Lzd3UW5d7hCuz4ZnzzVXo7VoCgV/h80oNE7MYKo9UbrLUgUpS
         YdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749663; x=1750354463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrafqKRYjLIYlVlnQCbScViLttcaCCEtpwvofjO7Z3g=;
        b=PuX7UbYK6jELszKimkQUt0WXb1PqyYtM8MaUQcpDqenJW5XzuYARGWtXQc6JVbj8rO
         GP3rHGvxQR1ijkRuOjcK6iosMocN7PFU5y4VEVcZrZysYdBCGOi0xaGRmKE0k8eBaqrw
         5I4rt7P1xgaDf7N/3aXm8XNhHlx7iLyQmm6MhahQ8WbuUprQnCq+7tWJAWK4+Cose1oj
         3CAJy0HadZ3ga2EwSsDF1sktHXUTitX85VlxBZs7dRgTRUlourDoJw4kdBJaMtuZL0WU
         dXcEOz1T47mWNwx+D7YpAel7fk0ljqjaJDvjkgJGkjobhUDBOC7mMoV6R7/NgNEJPEBM
         EYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/4h1RUUfmcpcY0hwMBZHJ1ZinAY+2mROB5L6oLgD0F1nZ7fyEVpcOU+NYlljcxmI8dw+01cXHkvz26fVX@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKeLT2e45Q1TwDJMa35ebzHfQNmSK/ePEojgKfE9sDaMLMNLo
	TT02PdI/PFIcTIVWW3x5a2ZsVhJdJQoqyrMfiJRLXuqJX4NUj3nbtkhM8/kqUjybo/A7e4SAtpv
	+ed4t2xBM4+5iCsLC+AwG4EOntqZmRd4zGCLoDHpLLFL5EPMK7EXkVW+X6YNZOQ==
X-Gm-Gg: ASbGncuTC90PTYTCWBFURXGKvGVpwRbCSv/nSnWov/DBZtO8IHgWOvwR2nZVoE0yqxW
	vF8uwxRH7Gfo7EIdxn19amEBjcFKV2nFdnC2ZVmfZj9drplO4YfHR+FmumHjcakXaV8OYx1evGl
	NtLHvLCatPHMVcCSAAufWKfEXSQ39wB/GPnVU2LP8g41RUEIQgPK3xFPGsrL1YOkkM04VWWmQjR
	A==
X-Google-Smtp-Source: AGHT+IHNPVWH/wdAnpO1y45I/cUg3DbI1iBJvNgZPDWKkOk4cJBH+ECPTzUrI9HlwvktnMn+hMUL/g6xVT13xGjgqFM=
X-Received: by 2002:a05:6902:844:b0:e81:20c5:cd04 with SMTP id
 3f1490d57ef6-e821aa1bd6cmr629551276.46.1749749663065; Thu, 12 Jun 2025
 10:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <20250611133330.1514028-15-tabba@google.com>
In-Reply-To: <20250611133330.1514028-15-tabba@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 12 Jun 2025 10:33:46 -0700
X-Gm-Features: AX0GCFuVfQClbw8rWB8Zsoe-K68LX2FzWt7lzfa3ax3n8aK0kznpkuCU2qIdi7Q
Message-ID: <CADrL8HXGzxVsBZC0GX044skYXR8thZpDQNcOMZ_+Azp=w-hOoA@mail.gmail.com>
Subject: Re: [PATCH v12 14/18] KVM: arm64: Handle guest_memfd-backed guest
 page faults
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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

On Wed, Jun 11, 2025 at 6:34=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
>
> Add arm64 support for handling guest page faults on guest_memfd backed
> memslots. Until guest_memfd supports huge pages, the fault granule is
> restricted to PAGE_SIZE.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>

Thanks Fuad! Hopefully Oliver and/or Marc can take a look at these Arm
patches soon. :)

Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  arch/arm64/kvm/mmu.c | 82 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 58662e0ef13e..71f8b53683e7 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1512,6 +1512,78 @@ static void adjust_nested_fault_perms(struct kvm_s=
2_trans *nested,
>         *prot |=3D kvm_encode_nested_level(nested);
>  }
>
> +#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT |=
 KVM_PGTABLE_WALK_SHARED)
> +
> +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> +                     struct kvm_s2_trans *nested,
> +                     struct kvm_memory_slot *memslot, bool is_perm)
> +{
> +       bool write_fault, exec_fault, writable;
> +       enum kvm_pgtable_walk_flags flags =3D KVM_PGTABLE_WALK_MEMABORT_F=
LAGS;
> +       enum kvm_pgtable_prot prot =3D KVM_PGTABLE_PROT_R;
> +       struct kvm_pgtable *pgt =3D vcpu->arch.hw_mmu->pgt;
> +       struct page *page;
> +       struct kvm *kvm =3D vcpu->kvm;
> +       void *memcache;
> +       kvm_pfn_t pfn;
> +       gfn_t gfn;
> +       int ret;
> +
> +       ret =3D prepare_mmu_memcache(vcpu, true, &memcache);
> +       if (ret)
> +               return ret;
> +
> +       if (nested)
> +               gfn =3D kvm_s2_trans_output(nested) >> PAGE_SHIFT;
> +       else
> +               gfn =3D fault_ipa >> PAGE_SHIFT;
> +
> +       write_fault =3D kvm_is_write_fault(vcpu);
> +       exec_fault =3D kvm_vcpu_trap_is_exec_fault(vcpu);
> +
> +       if (write_fault && exec_fault) {
> +               kvm_err("Simultaneous write and execution fault\n");
> +               return -EFAULT;
> +       }
> +
> +       if (is_perm && !write_fault && !exec_fault) {
> +               kvm_err("Unexpected L2 read permission error\n");
> +               return -EFAULT;
> +       }
> +
> +       ret =3D kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> +       if (ret) {
> +               kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> +                                             write_fault, exec_fault, fa=
lse);
> +               return ret;
> +       }
> +
> +       writable =3D !(memslot->flags & KVM_MEM_READONLY);
> +
> +       if (nested)
> +               adjust_nested_fault_perms(nested, &prot, &writable);
> +
> +       if (writable)
> +               prot |=3D KVM_PGTABLE_PROT_W;
> +
> +       if (exec_fault ||
> +           (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
> +            (!nested || kvm_s2_trans_executable(nested))))
> +               prot |=3D KVM_PGTABLE_PROT_X;
> +
> +       kvm_fault_lock(kvm);
> +       ret =3D KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_S=
IZE,
> +                                                __pfn_to_phys(pfn), prot=
,
> +                                                memcache, flags);
> +       kvm_release_faultin_page(kvm, page, !!ret, writable);
> +       kvm_fault_unlock(kvm);
> +
> +       if (writable && !ret)
> +               mark_page_dirty_in_slot(kvm, memslot, gfn);
> +
> +       return ret !=3D -EAGAIN ? ret : 0;
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                           struct kvm_s2_trans *nested,
>                           struct kvm_memory_slot *memslot, unsigned long =
hva,
> @@ -1536,7 +1608,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, ph=
ys_addr_t fault_ipa,
>         enum kvm_pgtable_prot prot =3D KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt;
>         struct page *page;
> -       enum kvm_pgtable_walk_flags flags =3D KVM_PGTABLE_WALK_HANDLE_FAU=
LT | KVM_PGTABLE_WALK_SHARED;
> +       enum kvm_pgtable_walk_flags flags =3D KVM_PGTABLE_WALK_MEMABORT_F=
LAGS;
>
>         if (fault_is_perm)
>                 fault_granule =3D kvm_vcpu_trap_get_perm_fault_granule(vc=
pu);
> @@ -1963,8 +2035,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                 goto out_unlock;
>         }
>
> -       ret =3D user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> -                            esr_fsc_is_permission_fault(esr));
> +       if (kvm_slot_has_gmem(memslot))
> +               ret =3D gmem_abort(vcpu, fault_ipa, nested, memslot,
> +                                esr_fsc_is_permission_fault(esr));
> +       else
> +               ret =3D user_mem_abort(vcpu, fault_ipa, nested, memslot, =
hva,
> +                                    esr_fsc_is_permission_fault(esr));
>         if (ret =3D=3D 0)
>                 ret =3D 1;
>  out:
> --
> 2.50.0.rc0.642.g800a2b2222-goog
>

