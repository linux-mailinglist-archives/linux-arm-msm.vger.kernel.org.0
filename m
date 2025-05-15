Return-Path: <linux-arm-msm+bounces-58152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9AFAB92E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 01:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1142B7AB97E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 23:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42525211A16;
	Thu, 15 May 2025 23:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1CtJqb6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86F17993
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 23:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353085; cv=none; b=kAgtHKqHs424T8dF24eSKkkSIbeMCbUKVWWJfvPhVxnsiSjcZp47UP7ZMI+wkcRndIungtyrSbJbf0WHqmMtsMzwrYumDot42lCzCYnM3jSU1kWdypB04DXADR4NU0RRmJCLKRvsy3Vg+srz51HTtHviSo70ten/pus+nFZuvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353085; c=relaxed/simple;
	bh=AfXZUnoHkQOtVDGyZJxH9KXA4kgHaJBtdGiOM+DpRo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qx+2M/8tHuut6kwmoG8+RwouQu+4CLrLKQBwLrbaj6JGbBpGDWQq8yZknAj+TeE3+hUPBwM+PUATxlO0DMV+x+iHfecOcHYJlj19BO+vLi8WusHKwYaj5XXsADJmTezN32GPwg7GFGAQls7cQ5ketxr9x6Ua89X+r8jv6IDK03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1CtJqb6o; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70a1f2eb39aso14297447b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747353082; x=1747957882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPr3QgE6XopAJbneoL2gWRrUZHMd+L1uMUHvEpVxd34=;
        b=1CtJqb6o/HN+LDS0jcnoZjd1riuadkwMfbutpCpg0j38xn6RHtmy/w5ydkx5FwDWmT
         03RokmAvCbGqfjegXbDbGRXcUauCKlFq2LHoqomUA0v+TccgOIohXlTxSfsJFYrpm9c/
         cC7sLCVIrodL+fSRMrjj0sx9nZkmsso+b01p59PtmdhTXFw5TI09irZR7wBtnt9NzZtp
         YUW52RLrMCwupdj5+2mzRURkt8DLKpogGBzB1n7wglPkVHbAjsTKrhbVkRnIMLNYlH2H
         2wXqL1eKFIVj+Oj2mfePe/U/bOF8iQyl2yaHkbAgKqCAOkiP3CE6PHrJx3e5HWXUnWo8
         pP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747353082; x=1747957882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPr3QgE6XopAJbneoL2gWRrUZHMd+L1uMUHvEpVxd34=;
        b=V4wL2pF7RTPYJAQTuS5eaegDhVNRDHdAO1ORCjj8O61ETtv+SWfjVWFj75hVS9rSq8
         q3utDzcMJh4UYwvl9DrF8gBT+0jH7e401nogPiJ4wYFGoVbyFEPsZjFw8VNjcwABoreP
         DEp63iViHlZ8EJRmUSKRhy9HExuMJXM48ixvKX7vP6csiK6VlJyxiBxFL8xm1TclYajD
         NE9+RsLb3XvppnyTJlT1uZX+9/dFnMOUQTZifEhSPBJIPW+TXviG6+KHXvLBjpu+0MiH
         2dpFbrpQr5PBpLrLRL4Vsy0KgzTbBiSa12xDtBauFsjrhuMmW/2fazWiKiLsfJ2fn9VV
         KT8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3rV6+SrqPBLYFAyj4hLCSYI5e+xBNO2XCP3G4CrhrxtJ77LF6NmUMfF7Wj1KHNDMvTFvbJAVv05H9n0Wu@vger.kernel.org
X-Gm-Message-State: AOJu0YzHa6nicNqSD0xzlCqiNHu0SZGJM6REDA/j56+89f++YuA2XPFx
	4M1NS5TIkzgLZKtjKqjDliRIs89B59FpekHBrU8bBXWx3EA1bkd3ayycxt3mqZn0VGPssLz04hN
	OvNV6Xv3RWbHBxNeT6Tp1iib1LtmS6YgDCCuZT5uP
X-Gm-Gg: ASbGnctFzl5Tu7eS7aSCvJoX++jc53f3R+vxIfBLx4xNkKxYcXZYaOzx/Y5vV947Ip5
	Z0CW9i97b7EzldZrfmCjc0JZ4BA9uxdIK5AEwaGF4tYCP0qfLvoJcQW4qyYsrpzbsVKwHt9cxCA
	sHnlHHeHJVeD7RMSgONVOOFu4cdxPbmDTz+F3uMW5HqeP1crdwlYY6Ju3tuIyicGNNUEascJP4o
	g==
X-Google-Smtp-Source: AGHT+IFtFp+P9O4VK8Qg9OzC+jX855YZKb1zj5TbuTuZP6rzUXb2ZUvAPIYYnFVnT20lddtCCBfDaOJ6HpF0TmLVRBg=
X-Received: by 2002:a05:690c:74c8:b0:709:32df:b41d with SMTP id
 00721157ae682-70ca797c496mr28163037b3.8.1747353082130; Thu, 15 May 2025
 16:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-15-tabba@google.com>
In-Reply-To: <20250513163438.3942405-15-tabba@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 15 May 2025 16:50:45 -0700
X-Gm-Features: AX0GCFsvPupUGBEWmI9iLoV-X7DO-vyiE5FRi3DFqxSHp3h36n9H0MRG3xg22Hg
Message-ID: <CADrL8HXN=9r0Kat5Rix8OdAFmHK+qqRNqyCU93XPK7WbM4f2vg@mail.gmail.com>
Subject: Re: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
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

On Tue, May 13, 2025 at 9:35=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
>
> Enable mapping guest_memfd in arm64. For now, it applies to all
> VMs in arm64 that use guest_memfd. In the future, new VM types
> can restrict this via kvm_arch_gmem_supports_shared_mem().
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
>  arch/arm64/kvm/Kconfig            |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/k=
vm_host.h
> index 08ba91e6fb03..2514779f5131 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1593,4 +1593,14 @@ static inline bool kvm_arch_has_irq_bypass(void)
>         return true;
>  }
>
> +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
> +{
> +       return IS_ENABLED(CONFIG_KVM_GMEM);
> +}

This is written as if it is okay for CONFIG_KVM_GMEM not to be
enabled, but when disabling CONFIG_KVM_GMEM you will get an error for
redefining kvm_arch_supports_gmem().

I think you either want to include:

#define kvm_arch_supports_gmem kvm_arch_supports_gmem

or just do something closer to what x86 does:

#ifdef CONFIG_KVM_GMEM
#define kvm_arch_supports_gmem(kvm) true
#endif

> +
> +static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
> +{
> +       return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
> +}

And this applies here as well.

#define kvm_arch_vm_supports_gmem_shared_mem
kvm_arch_vm_supports_gmem_shared_mem

or

#ifdef CONFIG_KVM_GMEM
#define kvm_arch_vm_supports_gmem_shared_mem(kvm)
IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
#endif

> +
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 096e45acadb2..8c1e1964b46a 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -38,6 +38,7 @@ menuconfig KVM
>         select HAVE_KVM_VCPU_RUN_PID_CHANGE
>         select SCHED_INFO
>         select GUEST_PERF_EVENTS if PERF_EVENTS
> +       select KVM_GMEM_SHARED_MEM

This makes it impossible to see the error, but I think we should fix
it anyway. :)

>         help
>           Support hosting virtualized guest machines.
>
> --
> 2.49.0.1045.g170613ef41-goog
>

