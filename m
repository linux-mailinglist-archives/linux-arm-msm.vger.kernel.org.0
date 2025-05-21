Return-Path: <linux-arm-msm+bounces-58878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F37ABF11C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B7377A4128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0452725B1E3;
	Wed, 21 May 2025 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hFGQbFua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B625A64D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822397; cv=none; b=B0NclDSs0Tnqz8UZgjmCeo5Zn48TFYuTuYXlGQ0d7YBpxoU3F8AkAWzun8SKYUOLrJ0j174bRpvO58i0FTiTuts4VufXb7QMnYeRA77aE3Nw+Z4LkWtMtSLR6X34EI/F3srzL9npRC7zCUcrCFW0JJJkBGERrTUB7vgMjPzrUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822397; c=relaxed/simple;
	bh=m83btPvFhxbMayVbe9ilisXmcIu5rZKCaqS5e/Ewk9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7+9tOECOJtDsTxn6RPf/ub8FLlkLm9q5TbeDj60PIRKbMeYyYEVXkRJjtQDQ52Rq2DdaDwyfWSaNF91NnToJA9nT8bKElsKutVVbYEuIianTvIFahwRyOyMqg+JbbXeQSyzYAEBL4HOjlA0tQar6rq3pQPA9tUI2x/L90BSqG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hFGQbFua; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo1628191cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 03:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747822395; x=1748427195; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5QSndPkKAQ5vtrh+loQIW/5wevzzB6SrBoHRCKbDvk=;
        b=hFGQbFua/9mHiQlDSpGBT6Q0/mr3vnnP1nJAygPkwpsVAdclFbyVJ4/iS2xhJxCjwu
         GArUgUgyCjVBU37FmM5ZQadHlB8WQKtWrqHnDUBmy5W5ZVGF0lfhmTjIV71ySbjBoYH2
         3zn2+aaGS48JPTe+Z6S3toUaKe2qxOgMKxkXHXq0R1fVTaNoouz3MeEhqWyUyS5H3qHf
         VPCPpTbwdAp2WU96BQxSF2KpHnnJ6uu2M03AbjoDIeOzcx08ig/s9iUkE4G6Sg7kdmvK
         az2nNLJHKQtXMYPOCQxMApUxKPj2H42dt76wtjrE39MSRWUoSGzKWS2oTX5oZdA3jPsP
         I0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822395; x=1748427195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5QSndPkKAQ5vtrh+loQIW/5wevzzB6SrBoHRCKbDvk=;
        b=ICbqG3gQnFqfx7HTmqAmfhj5iIxOAKNP/R04AUFVuYN5MeNBcuyC/tLFG04fXTNEFU
         JaW07baJ0IvxHhDrRJ/6+9aVi/YXAgTd6sPeAzA98qspS5Rl8mAxxa0mSlWJ7FOaZmAc
         zo8xYzyY9BpLuh36HpY7pu65ov2G6Y/erAiuHCV5FDkbwxUrpHZIKIjtbJqMP11H/nuJ
         IVTe67QPQ88l1Bvv0Z2L3wyabhAJchzrp0VDzlS/IsyHy0aS7UK73UGdGzlCQSFTxB5x
         +VNO4qw6VFunErPvmlAtER4nXtrjBIHrWLiQtKxYUWp/fTEEBaSCrqZbUJIvjdbKX2/1
         5Gow==
X-Forwarded-Encrypted: i=1; AJvYcCX6l6YXMpmhDqA4uTAvztwJFUqOKfuv1RqzSynajyAVVdctP/qwJNWM9bjuD/N29ime8BUJHypznTJIip31@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2T4HaG8GCBqEInAVG9zP6aGBcsRHKQIw6pLaGd1Qe+IJSzleN
	iq1QBtcYg8I7GpKJtDbdx0kZZSHACDiB1sOLVFzGJKIjsBChxEKsn5NEjORGqEqejGw2eJtIStl
	7w5sxO/qqz8v61aytpttHVYZFKZ8f2EiZwGD2dzW7
X-Gm-Gg: ASbGncvFXNTSKBBwvkthdFOB6VHENvvwwCrthJ+4Q59evaDiIrcTk3X9uU+ZAry79L0
	+VqQ1lrWm02GiuT3crXySGKXg2GiaOqkU4tWxprZuWQfK2dfs1Uiy3BaG505MUZmbxcwPKzanPX
	bOYxat93znEquEHhAMcgEK+9M0QXOs0GT2cAN1Dvk0Pr8qXJgPBOXC6gITZHzMILWSluJfeOW7
X-Google-Smtp-Source: AGHT+IFBSwGTdaQw/b8ps6ywr/tb178e/gz6GEZe1xfE1CXyjCsW9YbGLGngSw4suyfsuW4AGbCdMTzW2uSsF1TF0qk=
X-Received: by 2002:a05:622a:1826:b0:494:af4b:59fd with SMTP id
 d75a77b69052e-49595d52c6emr16768151cf.18.1747822394826; Wed, 21 May 2025
 03:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-15-tabba@google.com>
 <2084504e-2a11-404a-bbe8-930384106f53@redhat.com>
In-Reply-To: <2084504e-2a11-404a-bbe8-930384106f53@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 11:12:37 +0100
X-Gm-Features: AX0GCFs6mm4R5LsozR4hLz8YIdTF39WQ3BoVlZqAx_u_jdRTh6jdrQkuKqVFCts
Message-ID: <CA+EHjTyz4M4wGCTBzFwHLB_0LUJHq6J135f=DVOhGKQE4thrtQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
	pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 21 May 2025 at 09:05, David Hildenbrand <david@redhat.com> wrote:
>
> On 13.05.25 18:34, Fuad Tabba wrote:
> > Enable mapping guest_memfd in arm64. For now, it applies to all
> > VMs in arm64 that use guest_memfd. In the future, new VM types
> > can restrict this via kvm_arch_gmem_supports_shared_mem().
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
> >   arch/arm64/kvm/Kconfig            |  1 +
> >   2 files changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 08ba91e6fb03..2514779f5131 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1593,4 +1593,14 @@ static inline bool kvm_arch_has_irq_bypass(void)
> >       return true;
> >   }
> >
> > +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
> > +{
> > +     return IS_ENABLED(CONFIG_KVM_GMEM);
> > +}
> > +
> > +static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
> > +{
> > +     return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
> > +}
> > +
> >   #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 096e45acadb2..8c1e1964b46a 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -38,6 +38,7 @@ menuconfig KVM
> >       select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >       select SCHED_INFO
> >       select GUEST_PERF_EVENTS if PERF_EVENTS
> > +     select KVM_GMEM_SHARED_MEM
> >       help
> >         Support hosting virtualized guest machines.
> >
>
> Do we have to reject somewhere if we are given a guest_memfd that was
> *not* created using the SHARED flag? Or will existing checks already
> reject that?

We don't reject, but I don't think we need to. A user can create a
guest_memfd that's private in arm64, it would just be useless.

Cheers,
/fuad
> --
> Cheers,
>
> David / dhildenb
>

