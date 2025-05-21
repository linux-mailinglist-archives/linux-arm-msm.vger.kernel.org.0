Return-Path: <linux-arm-msm+bounces-58881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B0ABF1A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90A2A1784EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9ED325E457;
	Wed, 21 May 2025 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mEoOn2H7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30523099F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823395; cv=none; b=PUThfDL4TXqFwJ80BylqNkoorFXW1Q5zJPnaibIXYj/2q7jpeN9XGFZ6CvxpUuOAh/4Yxl2VhCo+WEK42kPLRaojpxyPXAKO7f2cgNuNl+8ufFAMtYXIjIuVqdK8bdOjUUH0TMS/LUb0Yb6tonaJOh8XH7kbC5NRwvKPd4Kb990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823395; c=relaxed/simple;
	bh=ZkHj+kg61/z+IEwlQ0+ggT4xnMCs60FN/wXZNGb2mFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwWBQ1432Sv6dR/Eh0NeOLfsomS4mDxX+/5b4nPRQqYHaZB2IfGWNCRehsMt0HDfPYEeLP91BSleEOPSGyeM4XgBAU5i3qvpsFjA+7jNHKGwKcZqz7J/4JL0LFsfyaPR8dd2lEE6WEngB4FXmjN89vk6v5RAAKeFZmhPNzDOyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mEoOn2H7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-48b7747f881so1389241cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747823392; x=1748428192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LS/q/Xqm57jDra6kJD1/9ABO+ZjNU6M5tBzG/N+TE04=;
        b=mEoOn2H7BBhhLviGe2SUYcsYYcwrtx8U/E7A7D/hBLU2w4P04xshuSCg2HQA8+898O
         uaKjCPgae+4UBV2yhn/nJh8N71gAKzDzgTGAtG8PteUmsxFsHvtvCgY2rME0gjNauCnK
         idyHdOCrQrF1fHDESPJfMz4mE/2Bg1j+ZekMGBv23Gdl49vI6qMlqwFS+tYGjAJVyK3n
         +XiKIz2P4uKmimmTkT5vLGlYEeqzbHyBLg9EEMx7aCYmiB17F9oSpzQmKCZW/PtubTWu
         DMAedDujhIOXE/sLkyw8gHmmRyA/z3iYp94G5/NlfmNL9BJUindlzt1txXH/OPVYZcJB
         8FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823392; x=1748428192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS/q/Xqm57jDra6kJD1/9ABO+ZjNU6M5tBzG/N+TE04=;
        b=ay/gO8XHxky0YEKSM1ls3WR8ZHuXwE5Yz3r6gWkRCcFOnv9aNQf853D9mLbQofms2h
         aBK60lzQ1460a+dGA2zyCaJf4PBDhDLA7iq5i8HKiG80nrxed3fWoiDX2sCkUEb8aATs
         PRv2VTDXUdPomulqi6qab9ZdR03UChDjaWRjfcOiv74YcgpzjSpb3EYxCZFdC1pD9zQO
         lT78EmdodpJ4NpSlXDwr3ydfNbKSyLyhMGjhcO3e5W5xB6+lVzw9zJQWh6f2XWYxCusf
         CYpvpyyKe6wCuS2E8h7visutS1i43lSknN4uSlRixffjOvjPxuOBPRP/v6T0+ohQBzy9
         +a1w==
X-Forwarded-Encrypted: i=1; AJvYcCX8ayAHNveBG74B6XQJwP8V7H6FbdjPhhHD0Wr7TxB3fbJF4/XLBe/g47DtI4ZOb2ZqnwKR3O5+yk6l6WlO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0/3CC+uWohnWWVtIpCFdiH0D8sW8PTeAueyrzAxvskpvvHC2
	1o+JEAYYV8XhRhA5zIqpbzZaZbmwvVBQNqD/4MGgvWBZ0jA8VS7fj+f2BNZ3Y674Uupvb35I8qP
	gjTsCwt2FUaR2TfpAFM0tJjorTKgUqOllDUhYCHcB
X-Gm-Gg: ASbGncuy46lViNNy0N46/0XRR1XAM0Q0nccQfSseCp0yLFmVCqeme3TYp1unmcYh0Cv
	UoO6GUpflTVkaon9eDCW4h8rLhPzPwM0arTMMN7xFUCVv0DE3L8KajaHDIKYRrFAR5HgEc8KqMH
	2YUoclj88psWPiM8hKD2DL41QJLaidJxGtBK/PDtDsz2/PSZ28o1+HGiiEK8j6uPwK3E2vbAqf
X-Google-Smtp-Source: AGHT+IFa/+nuwKHhuv405C1/QA7LzwIHaKLgKUa3xINuyOP9FO1wNH6D98dRYDdnD5Y6pR5oYmZ/tiws31p6X75UxrY=
X-Received: by 2002:ac8:5946:0:b0:480:1561:837f with SMTP id
 d75a77b69052e-4958cd27020mr15929471cf.8.1747823391740; Wed, 21 May 2025
 03:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-15-tabba@google.com>
 <2084504e-2a11-404a-bbe8-930384106f53@redhat.com> <CA+EHjTyz4M4wGCTBzFwHLB_0LUJHq6J135f=DVOhGKQE4thrtQ@mail.gmail.com>
 <d5983511-6de3-42cb-9c2f-4a0377ea5e2d@redhat.com>
In-Reply-To: <d5983511-6de3-42cb-9c2f-4a0377ea5e2d@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 11:29:14 +0100
X-Gm-Features: AX0GCFtp1C5WS7koE3vXh__qYSYt1ZsWt-4VJOAZFQTaZFrfaysMtz-msa--LUE
Message-ID: <CA+EHjTxhirJDCR4hdTt4-FJ+vo9986PE-CGwikN8zN_1H1q5jQ@mail.gmail.com>
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

On Wed, 21 May 2025 at 11:26, David Hildenbrand <david@redhat.com> wrote:
>
> On 21.05.25 12:12, Fuad Tabba wrote:
> > Hi David,
> >
> > On Wed, 21 May 2025 at 09:05, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 13.05.25 18:34, Fuad Tabba wrote:
> >>> Enable mapping guest_memfd in arm64. For now, it applies to all
> >>> VMs in arm64 that use guest_memfd. In the future, new VM types
> >>> can restrict this via kvm_arch_gmem_supports_shared_mem().
> >>>
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>> ---
> >>>    arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
> >>>    arch/arm64/kvm/Kconfig            |  1 +
> >>>    2 files changed, 11 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> >>> index 08ba91e6fb03..2514779f5131 100644
> >>> --- a/arch/arm64/include/asm/kvm_host.h
> >>> +++ b/arch/arm64/include/asm/kvm_host.h
> >>> @@ -1593,4 +1593,14 @@ static inline bool kvm_arch_has_irq_bypass(void)
> >>>        return true;
> >>>    }
> >>>
> >>> +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
> >>> +{
> >>> +     return IS_ENABLED(CONFIG_KVM_GMEM);
> >>> +}
> >>> +
> >>> +static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
> >>> +{
> >>> +     return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
> >>> +}
> >>> +
> >>>    #endif /* __ARM64_KVM_HOST_H__ */
> >>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> >>> index 096e45acadb2..8c1e1964b46a 100644
> >>> --- a/arch/arm64/kvm/Kconfig
> >>> +++ b/arch/arm64/kvm/Kconfig
> >>> @@ -38,6 +38,7 @@ menuconfig KVM
> >>>        select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >>>        select SCHED_INFO
> >>>        select GUEST_PERF_EVENTS if PERF_EVENTS
> >>> +     select KVM_GMEM_SHARED_MEM
> >>>        help
> >>>          Support hosting virtualized guest machines.
> >>>
> >>
> >> Do we have to reject somewhere if we are given a guest_memfd that was
> >> *not* created using the SHARED flag? Or will existing checks already
> >> reject that?
> >
> > We don't reject, but I don't think we need to. A user can create a
> > guest_memfd that's private in arm64, it would just be useless.
>
> But the arm64 fault routine would not be able to handle that properly, no?

Actually it would. The function user_mem_abort() doesn't care whether
it's private or shared. It would fault it into the guest correctly
regardless.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

