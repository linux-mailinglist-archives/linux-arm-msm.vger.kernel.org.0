Return-Path: <linux-arm-msm+bounces-60366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE4DACF595
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A84418837FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC47E2777EC;
	Thu,  5 Jun 2025 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0RLEvct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDF1D90DF
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145421; cv=none; b=V2/9pXSzs7g5R2mmYhGHScZ7pJhg+McoEi8dufjgupnvwKqKYyPyFSg3uq+NkIRTEA/mf0rvo/UDRoia2w1naSEMAkleIRt5g7EKGddCL7DkjZeCnndEBzi+z2PIoJKi3rSaso2AtcKmiWGOYJMFm3ei4T0ELRS/dqFhZx7/R3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145421; c=relaxed/simple;
	bh=6IbE76cGNJM5qHpMo9ixtF0wChLEBepSlKgRGQcpAhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYApjAz/F39tI+UZxTKAF66af1C38AFvI2ILwPE3uZ/M0uCe/YBVDHm1TjF8ft5WNWS7VmaejsUdktWgDUzaPqtps8+5W1XcDr2l/98DW8GN+Azd2H9fgg9FxcvMt/NX6ryUp8nwE8XnSbMPiBKUhHcFAXbfdRzl9/a334SMtzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0RLEvct; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47e9fea29easo40931cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749145419; x=1749750219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z2CqoZ0AEAzoUtqdrcArln2L/gsL8eatF4pYDcOE/Uc=;
        b=I0RLEvctApZE5sju6xDInANy1WgORJNS/pnEbeshI0QhIUtGUog3gld9Ex96ZX03Xu
         BStrDE1tFCwhhG/wKFnMVG8XDERttJRt02uzduRRTe83Ndorfb8ai1S3ysQR7sSx1Imn
         EqmZl59W456Xj454p8HdpyosoeeyNQNs3YSKRrmdziDUEH1AynJJjqsGZQhGE3N4S86e
         Z699uLhVTHoj4s85VUP1AaLzhG6OjOuSDWUFeKL/GgWnggwnX+fRneHScZo4unAUSrvY
         DsSLOVIsCHjeT4l5cuRPn/WqGtMTs0EjcdYIXs78ueqogLE7KCu7Eq1h2njN0cYy/gzI
         DfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145419; x=1749750219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2CqoZ0AEAzoUtqdrcArln2L/gsL8eatF4pYDcOE/Uc=;
        b=sC8A7i5V6vjtwkeqYz5P6qI1I6/mE0eQ9lfiKsPJu1TZBAHZ9jVdWUFS0ZEYP8+ptM
         qy0FnA6iT3nW4gU+6RjywHF8AFvms7DB0akhP2ry5IWEQzsbaFGzL+whDzQ3DLd3bTYN
         atyZ+LeeyDF6uT12ahkyOFBko7J7wUs/aSLgvc3THu/OkBK1Ph+bDkH6V3YK3Lm3/MlE
         +jTGH5nbdFEMG/vBXmzMMoTqRpVRsDfCekcd0Bcgvpl1YCNFySLqEH4c1tCvGodugYhr
         HKB4gfzwCvGfBukAccPAl9sQHDKhivtxdlZCYuu6RU+IXv5irgYFS2s945UBzjx5rVdF
         bb0A==
X-Forwarded-Encrypted: i=1; AJvYcCWgM65etwW6yPiSQt5BlgZAXIS9tcK5mMrcND0iXFta0jW2zCAH7j02j1N5u5gyBxfUdIC6m/PZUz3+foUO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0ymYT+bbeWQUJ0DyA47u94KQS+Hi7kSq/bphfu/HIXdOeLup
	GSmYjlZ0aPCE2vB1kF9zXGoQOJ0GoSKznV+7MWBXWzoDNiJ0YQ1uUNkicuGCgPzX6c4GGWQgpo+
	xGd24rdoS/JpqWhzQGICX1JkLIkRr5eEUGHji4yQM4eIrDFMjtmYGayc9e7yyBA==
X-Gm-Gg: ASbGncth1Td+X+Z7l4KGmWMjzUcGmfxuI6uCKLwaNXvbJptLSjm3x7+ex0iUvETgav/
	hfdYhBUe52+fYKyaJivihzdQXVZyt8djYhvH0cvEQo+4qW2BchNfhEiXsH+7Hux2raVRphtNy8b
	8TCYMcBGhsgEqjsPsDtYbCtS2m9QWYnV0x9hCg0iCDsuk=
X-Google-Smtp-Source: AGHT+IExAG9FOhA/JYGGXSBKDCzqV2Xo5C2y6Ta3UELn/eRIfFUiL+Rqeg9GPUYw/hiNAJoKYymR8PDaqjOB4BS/zFM=
X-Received: by 2002:ac8:5c8f:0:b0:494:763e:d971 with SMTP id
 d75a77b69052e-4a5b0e31c8bmr4317101cf.23.1749145418575; Thu, 05 Jun 2025
 10:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com> <20250605153800.557144-13-tabba@google.com>
 <4909d6dc-09f5-4960-b8be-5150b2a03e45@redhat.com> <CA+EHjTwnAV=tu1eUjixyKAhE4bpNc3XV7EhnMME3+WJ-cu6PNA@mail.gmail.com>
 <8782284c-0ffc-489d-adfe-b25d5ccb77b3@redhat.com>
In-Reply-To: <8782284c-0ffc-489d-adfe-b25d5ccb77b3@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 5 Jun 2025 18:43:02 +0100
X-Gm-Features: AX0GCFvljLgP25GVDAuLamDWQ4LY_vKhcAYVWztfS80gbr2QcR5zJxfpTOOCjHo
Message-ID: <CA+EHjTw-dgn+QbHd5aCxjLXCGamx7eTr75qcFm+o16qyVydnBQ@mail.gmail.com>
Subject: Re: [PATCH v11 12/18] KVM: x86: Enable guest_memfd shared memory for
 SW-protected VMs
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
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

On Thu, 5 Jun 2025 at 18:35, David Hildenbrand <david@redhat.com> wrote:
>
> On 05.06.25 18:11, Fuad Tabba wrote:
> > On Thu, 5 Jun 2025 at 16:49, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 05.06.25 17:37, Fuad Tabba wrote:
> >>> Define the architecture-specific macro to enable shared memory support
> >>> in guest_memfd for relevant software-only VM types, specifically
> >>> KVM_X86_DEFAULT_VM and KVM_X86_SW_PROTECTED_VM.
> >>>
> >>> Enable the KVM_GMEM_SHARED_MEM Kconfig option if KVM_SW_PROTECTED_VM is
> >>> enabled.
> >>>
> >>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> >>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>> ---
> >>>    arch/x86/include/asm/kvm_host.h | 10 ++++++++++
> >>>    arch/x86/kvm/Kconfig            |  1 +
> >>>    arch/x86/kvm/x86.c              |  3 ++-
> >>>    3 files changed, 13 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> >>> index 709cc2a7ba66..ce9ad4cd93c5 100644
> >>> --- a/arch/x86/include/asm/kvm_host.h
> >>> +++ b/arch/x86/include/asm/kvm_host.h
> >>> @@ -2255,8 +2255,18 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
> >>>
> >>>    #ifdef CONFIG_KVM_GMEM
> >>>    #define kvm_arch_supports_gmem(kvm) ((kvm)->arch.supports_gmem)
> >>> +
> >>> +/*
> >>> + * CoCo VMs with hardware support that use guest_memfd only for backing private
> >>> + * memory, e.g., TDX, cannot use guest_memfd with userspace mapping enabled.
> >>> + */
> >>> +#define kvm_arch_supports_gmem_shared_mem(kvm)                       \
> >>> +     (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&                      \
> >>> +      ((kvm)->arch.vm_type == KVM_X86_SW_PROTECTED_VM ||             \
> >>> +       (kvm)->arch.vm_type == KVM_X86_DEFAULT_VM))
> >>>    #else
> >>>    #define kvm_arch_supports_gmem(kvm) false
> >>> +#define kvm_arch_supports_gmem_shared_mem(kvm) false
> >>>    #endif
> >>>
> >>>    #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
> >>> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> >>> index b37258253543..fdf24b50af9d 100644
> >>> --- a/arch/x86/kvm/Kconfig
> >>> +++ b/arch/x86/kvm/Kconfig
> >>> @@ -47,6 +47,7 @@ config KVM_X86
> >>>        select KVM_GENERIC_HARDWARE_ENABLING
> >>>        select KVM_GENERIC_PRE_FAULT_MEMORY
> >>>        select KVM_GENERIC_GMEM_POPULATE if KVM_SW_PROTECTED_VM
> >>> +     select KVM_GMEM_SHARED_MEM if KVM_SW_PROTECTED_VM
> >>>        select KVM_WERROR if WERROR
> >>
> >> Is $subject and this still true, given that it's now also supported for
> >> KVM_X86_DEFAULT_VM?
> >
> > True, just not the whole truth :)
> >
> > I guess a better one would be, for Software VMs (remove protected)?
>
> Now I am curious, what is a Hardware VM? :)

The opposite of a software one! ;) i.e., hardware-supported CoCo,
e.g., TDX, CCA...

Cheers,
/fuad
> --
> Cheers,
>
> David / dhildenb
>

