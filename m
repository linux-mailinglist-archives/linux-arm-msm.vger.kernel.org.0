Return-Path: <linux-arm-msm+bounces-64763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA7B03740
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27093A5583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 06:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A66F2253A9;
	Mon, 14 Jul 2025 06:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkJvaydY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BB214811
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474980; cv=none; b=k0oavEm0s8ETV4U6c8hIFVeYjGGRrRZgqLzm5ln3x/FfGBM7me3VkFhhjj+eKIX6FH8c1YBBQ1vuTZzuRSi0sEF1zwED8NLnsIshIqR3vMghzEekuB7/u9/jQH+XRgQAhu3wQlP7zX4FKR5Uu+s71mkGBVC/KYOtTJe5Smu0oRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474980; c=relaxed/simple;
	bh=QE8xgqkvQss00D2u8wVq8zJ1bkSAtUbpo+nglj+nK7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udPklTO9GzwdJZJ2xgygv72vGDIayRDULVU8WR1v9W9nb8n6ENHRp4MnV5pz1rhExSyCJNfBRdBLyWT+HyLaGe+jPN4ro+qlBgxCKW9J2vj79DMdhDeOD2nHH279qSP1N6o2JWucZ+1IJnJ2DEzCa9FNv/DqULSn6ZlzxLyaqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dkJvaydY; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ab3855fca3so594921cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 23:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752474978; x=1753079778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dZF+Ky0ktDSi2tu4HY/pzm8qU38Pe1SoFQA75nYTHJk=;
        b=dkJvaydYTWJOA8G8MMW2MgQqU94MwWUMyzhMbbIp5RcrwBBzRwiOnbmyfq5z1MqICc
         vey0SSJkqAsuhtwgNi+wO9xJq4XVAqrJnPrc85LyZfDDf8sHN3o6Q/CrY34hOfeDyd9k
         yNV/sAXJnD9KXVZ914WYhRNZg3bg8s2HmSRRpF3cEKJRIBlVIL2f955XDlcURlQRm4dq
         S6AiaTW0IYW+OUayaxf2Wx+SXZUiASELYMZdpZOd5qnZ3M9Lryug/h4R+63bfOPNWUZT
         zRSYPblzbytY6R1//PjSi+RYnTrrebRGQTvFFMyR31+f9NZnFYaI/Y+n0kTG8MTDGi8O
         KRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474978; x=1753079778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZF+Ky0ktDSi2tu4HY/pzm8qU38Pe1SoFQA75nYTHJk=;
        b=CP5FHNglKLt+5OkxJm7WWcNae8OOndP/2g7XLoanqJhBuCYQdA2SrA6Q/JbFTmJSH3
         Bc+XWJGcRnaPGdHvHFgt1abDnWExiaVA8dTNIbJ1bQr39awLLAMXw7/byjdKop1sJAbh
         dmZAlYn2dv+trglIe/WBFQ+YE5QEAXfMi7lU/2gVM7uETgFhqhvOJ61rOjaMDwDXq4sw
         uYz+nXs+B/M+Bf4nJ+bcnN3jj0PMMS08Zg2GHnooFaQSlapR+pmEagQQZSi1bbjsiVk9
         UfIlpYgzLhypqE/u9ayXRIHXEb77fmWvW0gXvJSlnUSl38+nvVmon5NXwBWseTV4LxLb
         HuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5V/w0Lh3Qe5r6gka8TVQ1RFmSMk3lvCm6GT06kHCwnEFaTA3oGxFhdNe4ThTd65SegIVUNzzBYcJToyFs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpa3a25nEePytRsIvA4KylrToz+aVtuBuBtuCw5Vqi8B1TTUZj
	DdEPDHA+QwPDxld1MMDoPb+zDx85JfFumtAHpOS7cSTgpoSSC774yN9Z5onNUfuhgHCmMpyJLIb
	4xnpbudLClFzNqpDj4q69zusRmAALj2BPeGSAuEQB
X-Gm-Gg: ASbGnctyooKi1WaPwjxOrfr4tVt42uinz/GJKpWoWEX018K7wHGzA2gfWnzo2w1y0T1
	B1b0YZC4+Op/XxR1eRoBoiz8IfOe464Wa5lDdNAReu4VV/Om0S/FYOAEH+E1O5BEObQTioX7gqp
	q2u2o5MlRnqB1GQA8O0zQ/3ruVk0yG1gDttZObLcNhdYSeUzPGA7rKmeisSqO+p6ITxkxwVAcgC
	IU3TpU=
X-Google-Smtp-Source: AGHT+IGUAkWGqNwyYlfnsIV6EkkPBFxL4VHZi8XE1tnkXrW7n/ZbY/7gbbYRwSh5UmMPS2fHVD8oBu3+Ej09sHNYdeM=
X-Received: by 2002:a05:622a:1450:b0:4a5:a83d:f50d with SMTP id
 d75a77b69052e-4ab544ec3a4mr4630431cf.11.1752474977130; Sun, 13 Jul 2025
 23:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709105946.4009897-17-tabba@google.com> <20250711095937.22365-1-roypat@amazon.co.uk>
 <86a55aalbv.wl-maz@kernel.org> <CA+EHjTz-MWYUKA6dbcZGvt=rRXnorrpJHbNLq-Kng5q7yaLERA@mail.gmail.com>
 <867c0eafu4.wl-maz@kernel.org>
In-Reply-To: <867c0eafu4.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 14 Jul 2025 07:35:40 +0100
X-Gm-Features: Ac12FXz5OVPVA8v7QODq4KbEi6-bkk4Mp_oA-Ws0GJ1yiq68_TYv2mw4lRKzfA4
Message-ID: <CA+EHjTziOm5d-0M53hPzF3Naz+NQtNKZxJk_ZjmVv3MeX+h3Lg@mail.gmail.com>
Subject: Re: [PATCH v13 16/20] KVM: arm64: Handle guest_memfd-backed guest
 page faults
To: Marc Zyngier <maz@kernel.org>
Cc: "Roy, Patrick" <roypat@amazon.co.uk>, "ackerleytng@google.com" <ackerleytng@google.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "amoorthy@google.com" <amoorthy@google.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"brauner@kernel.org" <brauner@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	"dmatlack@google.com" <dmatlack@google.com>, "fvdl@google.com" <fvdl@google.com>, 
	"hch@infradead.org" <hch@infradead.org>, "hughd@google.com" <hughd@google.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "james.morse@arm.com" <james.morse@arm.com>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "jthoughton@google.com" <jthoughton@google.com>, 
	"keirf@google.com" <keirf@google.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, "mic@digikod.net" <mic@digikod.net>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"peterx@redhat.com" <peterx@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"quic_cvanscha@quicinc.com" <quic_cvanscha@quicinc.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, 
	"quic_mnalajal@quicinc.com" <quic_mnalajal@quicinc.com>, 
	"quic_pderrin@quicinc.com" <quic_pderrin@quicinc.com>, 
	"quic_pheragu@quicinc.com" <quic_pheragu@quicinc.com>, 
	"quic_svaddagi@quicinc.com" <quic_svaddagi@quicinc.com>, 
	"quic_tsoni@quicinc.com" <quic_tsoni@quicinc.com>, "rientjes@google.com" <rientjes@google.com>, 
	"seanjc@google.com" <seanjc@google.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "wei.w.wang@intel.com" <wei.w.wang@intel.com>, 
	"will@kernel.org" <will@kernel.org>, "willy@infradead.org" <willy@infradead.org>, 
	"xiaoyao.li@intel.com" <xiaoyao.li@intel.com>, "yilun.xu@intel.com" <yilun.xu@intel.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 11 Jul 2025 at 16:48, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 11 Jul 2025 15:17:46 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Fri, 11 Jul 2025 at 14:50, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 11 Jul 2025 10:59:39 +0100,
> > > "Roy, Patrick" <roypat@amazon.co.uk> wrote:
> > > >
> > > >
> > > > Hi Fuad,
> > > >
> > > > On Wed, 2025-07-09 at 11:59 +0100, Fuad Tabba wrote:> -snip-
> > > > > +#define KVM_PGTABLE_WALK_MEMABORT_FLAGS (KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED)
> > > > > +
> > > > > +static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > > > +                     struct kvm_s2_trans *nested,
> > > > > +                     struct kvm_memory_slot *memslot, bool is_perm)
> > > > > +{
> > > > > +       bool write_fault, exec_fault, writable;
> > > > > +       enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_MEMABORT_FLAGS;
> > > > > +       enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> > > > > +       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> > > > > +       struct page *page;
> > > > > +       struct kvm *kvm = vcpu->kvm;
> > > > > +       void *memcache;
> > > > > +       kvm_pfn_t pfn;
> > > > > +       gfn_t gfn;
> > > > > +       int ret;
> > > > > +
> > > > > +       ret = prepare_mmu_memcache(vcpu, true, &memcache);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       if (nested)
> > > > > +               gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
> > > > > +       else
> > > > > +               gfn = fault_ipa >> PAGE_SHIFT;
> > > > > +
> > > > > +       write_fault = kvm_is_write_fault(vcpu);
> > > > > +       exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> > > > > +
> > > > > +       if (write_fault && exec_fault) {
> > > > > +               kvm_err("Simultaneous write and execution fault\n");
> > > > > +               return -EFAULT;
> > > > > +       }
> > > > > +
> > > > > +       if (is_perm && !write_fault && !exec_fault) {
> > > > > +               kvm_err("Unexpected L2 read permission error\n");
> > > > > +               return -EFAULT;
> > > > > +       }
> > > > > +
> > > > > +       ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> > > > > +       if (ret) {
> > > > > +               kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
> > > > > +                                             write_fault, exec_fault, false);
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       writable = !(memslot->flags & KVM_MEM_READONLY);
> > > > > +
> > > > > +       if (nested)
> > > > > +               adjust_nested_fault_perms(nested, &prot, &writable);
> > > > > +
> > > > > +       if (writable)
> > > > > +               prot |= KVM_PGTABLE_PROT_W;
> > > > > +
> > > > > +       if (exec_fault ||
> > > > > +           (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
> > > > > +            (!nested || kvm_s2_trans_executable(nested))))
> > > > > +               prot |= KVM_PGTABLE_PROT_X;
> > > > > +
> > > > > +       kvm_fault_lock(kvm);
> > > >
> > > > Doesn't this race with gmem invalidations (e.g. fallocate(PUNCH_HOLE))?
> > > > E.g. if between kvm_gmem_get_pfn() above and this kvm_fault_lock() a
> > > > gmem invalidation occurs, don't we end up with stage-2 page tables
> > > > refering to a stale host page? In user_mem_abort() there's the "grab
> > > > mmu_invalidate_seq before dropping mmap_lock and check it hasnt changed
> > > > after grabbing mmu_lock" which prevents this, but I don't really see an
> > > > equivalent here.
> > >
> > > Indeed. We have a similar construct in kvm_translate_vncr() as well,
> > > and I'd definitely expect something of the sort 'round here. If for
> > > some reason this is not needed, then a comment explaining why would be
> > > welcome.
> > >
> > > But this brings me to another interesting bit: kvm_translate_vncr() is
> > > another path that deals with a guest translation fault (despite being
> > > caught as an EL2 S1 fault), and calls kvm_faultin_pfn(). What happens
> > > when the backing store is gmem? Probably nothin
> >
> > I'll add guest_memfd handling logic to kvm_translate_vncr().
> >
> > > I don't immediately see why NV and gmem should be incompatible, so
> > > something must be done on that front too (including the return to
> > > userspace if the page is gone).
> >
> > Should it return to userspace or go back to the guest?
> > user_mem_abort() returns to the guest if the page disappears (I don't
> > quite understand the rationale behind that, but it was a deliberate
> > change [1]): on mmu_invalidate_retry() it sets ret to -EAGAIN [2],
> > which gets flipped to 0 on returning from user_mem_abort() [3].
>
> Outside of gmem, racing with an invalidation (resulting in -EAGAIN) is
> never a problem. We just replay the faulting instruction.  Also,
> kvm_faultin_pfn() never fails outside of error cases (guest accessing
> non-memory, or writing to RO memory). So returning to the guest is
> always the right thing to do, and userspace never needs to see any of
> that (I ignore userfaultfd here, as that's a different matter).
>
> With gmem, you don't really have a choice. Whoever is in charge of the
> memory told you it can't get to it, and it's only fair to go back to
> userspace for it to sort it out (if at all possible).

Makes sense.

> So when it comes to VNCR faults, the behaviour should be the same,
> given that the faulting page *is* a guest page, even if this isn't a
> stage-2 mapping that we are dealing with.
>
> I'd expect something along the lines of the hack below, (completely
> untested, as usual).

Thanks!
/fuad

> Thanks,
>
>         M.
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 5b191f4dc5668..98b1d6d4688a6 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1172,8 +1172,9 @@ static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
>         return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
>  }
>
> -static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
> +static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *gmem)
>  {
> +       struct kvm_memory_slot *memslot;
>         bool write_fault, writable;
>         unsigned long mmu_seq;
>         struct vncr_tlb *vt;
> @@ -1216,9 +1217,21 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
>         smp_rmb();
>
>         gfn = vt->wr.pa >> PAGE_SHIFT;
> -       pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writable, &page);
> -       if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
> -               return -EFAULT;
> +       memslot = gfn_to_memslot(vcpu->kvm, gfn);
> +       *gmem = kvm_slot_has_gmem(memslot);
> +       if (!*gmem) {
> +               pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
> +                                       &writable, &page);
> +               if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
> +                       return -EFAULT;
> +       } else {
> +               ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL);
> +               if (ret) {
> +                       kvm_prepare_memory_fault_exit(vcpu, vt->wr.pa, PAGE_SIZE,
> +                                                     write_fault, false, false);
> +                       return ret;
> +               }
> +       }
>
>         scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
>                 if (mmu_invalidate_retry(vcpu->kvm, mmu_seq))
> @@ -1292,14 +1305,14 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
>         if (esr_fsc_is_permission_fault(esr)) {
>                 inject_vncr_perm(vcpu);
>         } else if (esr_fsc_is_translation_fault(esr)) {
> -               bool valid;
> +               bool valid, gmem = false;
>                 int ret;
>
>                 scoped_guard(read_lock, &vcpu->kvm->mmu_lock)
>                         valid = kvm_vncr_tlb_lookup(vcpu);
>
>                 if (!valid)
> -                       ret = kvm_translate_vncr(vcpu);
> +                       ret = kvm_translate_vncr(vcpu, &gmem);
>                 else
>                         ret = -EPERM;
>
> @@ -1309,6 +1322,14 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
>                         /* Let's try again... */
>                         break;
>                 case -EFAULT:
> +               case -EIO:
> +                       /*
> +                        * FIXME: Add whatever other error cases the
> +                        * GMEM stuff can spit out.
> +                        */
> +                       if (gmem)
> +                               return 0;
> +                       fallthrough;
>                 case -EINVAL:
>                 case -ENOENT:
>                 case -EACCES:
>
> --
> Without deviation from the norm, progress is not possible.

