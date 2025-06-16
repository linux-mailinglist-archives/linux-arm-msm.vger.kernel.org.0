Return-Path: <linux-arm-msm+bounces-61381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6CADA911
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2AB41885136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409D81F4C8E;
	Mon, 16 Jun 2025 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwN+Xszw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC351F4703
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058057; cv=none; b=R0qOQIRZknmJ8jDqNNODLi7DLBuT15YLHW2CYvUooEMQWK5eWRuKWfVg5op8W4DnQqY1Bh93kClw5FX/D8Uo7zPhVfnzGOwpaFFlM2WKqZCp0XFfYudBOCEjf7e7rql0nSgheT3i2b3Ab+A87CqLX+TMcrQf7nSN176mYOYma28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058057; c=relaxed/simple;
	bh=5B+m8LJRszE/eOQ7rN2wxVR0e0sQd7dvBxHZtcWiquo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdFgzZZouxPVUXvnmKmCmKg+jK1U5xbO8FXlB5uuNnca04r01osZheZVOMPZrW15gYAWsTpu9WrwfC3VCKYrMrXO3dq0SBeWSF5hC7zVrAuqZzuZbXsZPuGVYQMOlLnfNqL3n4RiBc+e3hbWkOD/sv+cc9KF2Z5gHFZkLmoe83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YwN+Xszw; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58ef58a38so293351cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750058054; x=1750662854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4dscraCi99Sxb2AdbSI/1exeAb4GQbHQ2olocOXtjo=;
        b=YwN+Xszw0eW/yG5YhFbtK2PVtM0xbhj5ey4JrQhMEf+Ir1D9+AzvXRkunkpaY/TIHt
         NAIgqQNLrZLZK/ITvgNgmZIOEzhZ2EXb6V63JHrKVQ6ZOexvfNO4oEGkv2KFxaxg5n2p
         h6ok+Iw9hwMfbd1XHiyAG5qKusgnjRVejOdOI4Rb2lm1rEBqg/31cgovdFRYh0pHns+y
         RfCmlPFsiiKaFBxsmaEHkoVeFsJPbeHE1Gd05k4H0XBHOEpGV+SCka1gwxyxZ24W9/AD
         KxjmhV2HD7muI0JTORAezU3Q3DPIz47aZjB1kIFvpT1cO///LgfqlRRceGXWchPhH8dT
         1q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058054; x=1750662854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4dscraCi99Sxb2AdbSI/1exeAb4GQbHQ2olocOXtjo=;
        b=JvWpQNflFhvz9p0UbZb9yS0YjqM6YN7+75RPkd4goNRZnkOXh9KXBN4wgznud16TJJ
         nuzN1G+K6l07C4aWsx8dvTU0olH+27OcOkqHmmAQEEQHnxtZ3aK8UVKKbrqxtrxlJ560
         1JLiNmr6ep7dwffPI7TiS6V8sT9YtOJxm0FFJ9CHKqv036hqAuFgLOfRFETmRBEFk5jZ
         pe5umzpc34+eGV7+UEh7GxMBUu6R71ZIZQVFH6iZO2vBI8sTH8t1GqILBZqfgshxC2nq
         dx2IaVIKxNVhXLkPSDQUcq4eRCxTomjAQKVeQKREk43H8mmMz8It04n6nIO1CQuHx+g4
         w6aw==
X-Forwarded-Encrypted: i=1; AJvYcCW8EJ25mtSKTtE+NXuRicaBYOS1aeCL0nollTAFSLtabGzm8LTOWt+mASmt3hWlOj+Gw2URiOKK2oE0sU56@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKq0dD5kkCsd74kbDXMfmIacw+6wNiDxrmWeQb1YfEhy+6J5B
	NEQqsfCfruD5ep9SiG4t1UQ2lCWlSl1bb1fXlNndhTgQ8WSsp3iJPX0ZxoAcs8eI4lpNrvwdbcD
	X9J1sWM7hIcqXRc97DVK3QF7cv4eHV/7R+3/Mv4H8
X-Gm-Gg: ASbGncviyioaBtmFY6TMD6pKKot6p21b605hb+sSySnBvAP4a2Y7TFcoCyXFrALCBoW
	lpAm3cPgnws9lL8TeC1Kuc9aIX50mfEJIN9uzab5+UKsNJyW+JrxbTeULyHNCXJQ4UR2G+CzxA/
	JgDslloCc0PwBsiimTVe18dj3Yjr51O4sqUsg/2qAJOXoFA9plKbgB6g==
X-Google-Smtp-Source: AGHT+IHRP1CpUCig8F7p0iqSMmnDgYVd+hSQrG9KB86uiC6pnZNQNaE6PPvaROhLDIFwY0y51UIij5JffUL2jbFDWys=
X-Received: by 2002:ac8:58c8:0:b0:4a5:9b0f:a150 with SMTP id
 d75a77b69052e-4a73d63d978mr5025451cf.16.1750058053808; Mon, 16 Jun 2025
 00:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <20250611133330.1514028-5-tabba@google.com>
 <aEyLlbyMmNEBCAVj@google.com>
In-Reply-To: <aEyLlbyMmNEBCAVj@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Jun 2025 08:13:37 +0100
X-Gm-Features: AX0GCFulb2IhkWValvX9vFqGHI2nVg_Dnrs5LCKRKWUrkMeevUaVx5iPDic8k40
Message-ID: <CA+EHjTz=j==9evN7n1sGfTwxi5DKSr5k0yzXhDGzvwk7UawSGA@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] KVM: x86: Rename kvm->arch.has_private_mem to kvm->arch.supports_gmem
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
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
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Fri, 13 Jun 2025 at 21:35, Sean Christopherson <seanjc@google.com> wrote=
:
>
> On Wed, Jun 11, 2025, Fuad Tabba wrote:
> > The bool has_private_mem is used to indicate whether guest_memfd is
> > supported.
>
> No?  This is at best weird, and at worst flat out wrong:
>
>         if (kvm->arch.supports_gmem &&
>             fault->is_private !=3D kvm_mem_is_private(kvm, fault->gfn))
>                 return false;
>
> ditto for this code:
>
>         if (kvm_arch_supports_gmem(vcpu->kvm) &&
>             kvm_mem_is_private(vcpu->kvm, gpa_to_gfn(range->gpa)))i
>                 error_code |=3D PFERR_PRIVATE_ACCESS;
>
> and for the memory_attributes code.  E.g. IIRC, with guest_memfd() mmap s=
upport,
> private vs. shared will become a property of the guest_memfd inode, i.e. =
this will
> become wrong:
>
> static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> {
>         if (!kvm || kvm_arch_supports_gmem(kvm))
>                 return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>
>         return 0;
> }
>
> Instead of renaming kvm_arch_has_private_mem() =3D> kvm_arch_supports_gme=
m(), *add*
> kvm_arch_supports_gmem() and then kill off kvm_arch_has_private_mem() onc=
e non-x86
> usage is gone (i.e. query kvm->arch.has_private_mem directly).
>
> And then rather than rename has_private_mem, either add supports_gmem or =
do what
> you did for kvm_arch_supports_gmem_shared_mem() and explicitly check the =
VM type.

Will do.

To make sure we're on the same page, we should add `supports_gmem` and
keep `has_private_mem`, and continue using it for x86 code by querying
it directly once the helpers are added.

> > Rename it to supports_gmem to make its meaning clearer and to decouple =
memory
> > being private from guest_memfd.
> >
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Shivank Garg <shivankg@amd.com>
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> > Co-developed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h | 4 ++--
> >  arch/x86/kvm/mmu/mmu.c          | 2 +-
> >  arch/x86/kvm/svm/svm.c          | 4 ++--
> >  arch/x86/kvm/x86.c              | 3 +--
> >  4 files changed, 6 insertions(+), 7 deletions(-)
>
> This missed the usage in TDX (it's not a staleness problem, because this =
series
> was based on 6.16-rc1, which has the relevant code).
>
> arch/x86/kvm/vmx/tdx.c: In function =E2=80=98tdx_vm_init=E2=80=99:
> arch/x86/kvm/vmx/tdx.c:627:18: error: =E2=80=98struct kvm_arch=E2=80=99 h=
as no member named =E2=80=98has_private_mem=E2=80=99
>   627 |         kvm->arch.has_private_mem =3D true;
>       |                  ^
> make[5]: *** [scripts/Makefile.build:287: arch/x86/kvm/vmx/tdx.o] Error 1

I did test and run this before submitting the series. Building it on
x86 with x86_64_defconfig and with allmodconfig pass (I obviously
missed TDX though, apologies for that). I should have grepped for
has_private_mem. That said, if I understood your suggestion correctly,
this problem wouldn't happen again.

Cheers,
/fuad

