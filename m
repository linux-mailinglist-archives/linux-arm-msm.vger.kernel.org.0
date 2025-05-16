Return-Path: <linux-arm-msm+bounces-58176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE366AB9664
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCFA9177BBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 07:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151BE225407;
	Fri, 16 May 2025 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HF6xKfWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E16224AE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747379275; cv=none; b=cPfSbkfQ/sNWQWPZdUprXyNQ8JY41yWxI7tlaHhDeN1miS3F/D2ERVcUJmymn7xSa43RCOPwTALQ8RtmnPzhNi2/lmJetyHvRwrjx+IIspY84fzfngB5KXh2eXs6krQQmSJjvDQsd+cKIft5CU1bIgyNX4UmEP5PhwnjChwm+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747379275; c=relaxed/simple;
	bh=3oLVKjT6FynUdAfD1yHKsv9E49xwhlj+0GLTikY4vhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZ0yaUPkb1hKCYucRbEpTJukQ5k6GydK2028HWj3YLsb+gQ+Bg5aBA9RlxFDbiZ4lXT0J9qq6gWg4/IlSWD6tiv0oVFJFeegwzANYzOlozsYutxno7VgaTUKIRkCVcDd6URtiQ77S4L+cScKmqfli712Njhq2yvPe0tzhTOvgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HF6xKfWq; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47e9fea29easo163601cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747379272; x=1747984072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tez76IHCMQvsnU7yC7Z3dKm3rIS9agTxMo2b8/a0wh8=;
        b=HF6xKfWqu5fZSCnJLsB1JTkxLDzMaYpJsyl+/4IoVJW5Sm5kXPOXkgeVjv+59Y3r3Z
         HKwFZCP+4Ax9xhqK7hykXHSAFR+rd+X0UWwtQtvL9onxLHZ5HrfpK3mS8Pwjx95yKegJ
         gEywPlXaybtQJMLPhZiAlSJy/JPdhoEbMA9ezFW4jMP9uWbkjeFaYfh+iMUeQCcdeMFW
         jHhXU/Yzp7XSq3lw7Sw0MAGR1hVukv5SxAamPUMATwtAjZZBeN77Ho6tvstt5Z//mMHM
         YHcGUDgseZQwlmb99ygpx4pI4hjJ+de0ZY7eB6v4oWBSkpVe6+W74ccfu9BqHW0Jdj7j
         baOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747379272; x=1747984072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tez76IHCMQvsnU7yC7Z3dKm3rIS9agTxMo2b8/a0wh8=;
        b=Nq52XbTFQ8nOYcm0/jqu83f1IrwHLxSoK4YsEkH1FOZgKZZZtvQa4NA0YxWB6nKv32
         aoOZN5fn2H8ZIGRPFIUO7maFDzrENAoM8y0Lk3EurowqsvHccItP1GbRxpKehmAAGyVp
         5q2b3eE7R1Oe0/ryJRiGJpGox7M5lT1B2XtRMGIJwl6CO5W4irvSkKfeNUV8MZu+a3uN
         Tk3mhPHdm/PppmlTYtaoMeaoxcgJgSs+qMhyWt+0ycCAmP53tXEHcFAxHmBugS3iHdc+
         SMfOKlmBD74jBMpkhiUg1Khy11YywCTfvawkr4XLl9BSLJtwiDR3HyRUjiz8fmAglOAl
         +jVA==
X-Forwarded-Encrypted: i=1; AJvYcCVjtZr5Jyo+rCyCeE51asxQiRNVV83nBdj8wgVK9hILiLoBfvPv1cEQcfcTG7jGyAmNr/fbrBeZ5WtxGu9r@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGA2VMdUd7UbaAihUU0FIqS68IYqhRPTYcthDN1wKht3BagXm
	ixhGWi2r9aZ7T4IYD7ZMlOkBJgy8N9k2MLl3tlR2g65SnGtyEhVPsIn1DsyBY1htr76qT+NT2Gx
	sfxciU17EqnVatEPSFQ9zIn1iYi0kJxL5SegkK9v6
X-Gm-Gg: ASbGncvi9me9Eh6cisOj8KZmY4LmQIyPlFSV3WUaOzGxdqHzoEclmnLDGomQ0jW5vWX
	QwMA2f04txLJOVeRc6FZSl3o0Yk5wSYFvZLbsEb/6hoX0ll38NjUxg3gcr1MZdMf9ubQIPULD+J
	QeU0NtJqF/djOgwDDEfr/Lh5d+EZMsZDyKMpuUruv6E0Y7yV+HzY7yef2ftcg=
X-Google-Smtp-Source: AGHT+IH1mZBkYFzRyPJJzHe/yhizT4xopI+iUzKMP75ZWa3A53DZt9+qbKlgib2wRN1O5HYqi0njFiCig3+NWslOs0Y=
X-Received: by 2002:a05:622a:1646:b0:47d:c9f0:da47 with SMTP id
 d75a77b69052e-494a3399474mr6319641cf.19.1747379271821; Fri, 16 May 2025
 00:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-15-tabba@google.com>
 <CADrL8HXN=9r0Kat5Rix8OdAFmHK+qqRNqyCU93XPK7WbM4f2vg@mail.gmail.com>
In-Reply-To: <CADrL8HXN=9r0Kat5Rix8OdAFmHK+qqRNqyCU93XPK7WbM4f2vg@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 16 May 2025 09:07:14 +0200
X-Gm-Features: AX0GCFumrLCfwGJXXpv4sHDm4HWDeYyncTUE9HPJGeDi50TPwzgeh3m6MxJtEMo
Message-ID: <CA+EHjTzrsx+=mfAOpQ4mT1vOYotMTAz9c3MBMVDu3m-eZaTAbA@mail.gmail.com>
Subject: Re: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
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

On Fri, 16 May 2025 at 01:51, James Houghton <jthoughton@google.com> wrote:
>
> On Tue, May 13, 2025 at 9:35=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
> >
> > Enable mapping guest_memfd in arm64. For now, it applies to all
> > VMs in arm64 that use guest_memfd. In the future, new VM types
> > can restrict this via kvm_arch_gmem_supports_shared_mem().
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
> >  arch/arm64/kvm/Kconfig            |  1 +
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm=
/kvm_host.h
> > index 08ba91e6fb03..2514779f5131 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1593,4 +1593,14 @@ static inline bool kvm_arch_has_irq_bypass(void)
> >         return true;
> >  }
> >
> > +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
> > +{
> > +       return IS_ENABLED(CONFIG_KVM_GMEM);
> > +}
>
> This is written as if it is okay for CONFIG_KVM_GMEM not to be
> enabled, but when disabling CONFIG_KVM_GMEM you will get an error for
> redefining kvm_arch_supports_gmem().
>
> I think you either want to include:
>
> #define kvm_arch_supports_gmem kvm_arch_supports_gmem
>
> or just do something closer to what x86 does:
>
> #ifdef CONFIG_KVM_GMEM
> #define kvm_arch_supports_gmem(kvm) true
> #endif
> > +
> > +static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kv=
m)
> > +{
> > +       return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
> > +}
>
> And this applies here as well.
>
> #define kvm_arch_vm_supports_gmem_shared_mem
> kvm_arch_vm_supports_gmem_shared_mem
>
> or
>
> #ifdef CONFIG_KVM_GMEM
> #define kvm_arch_vm_supports_gmem_shared_mem(kvm)
> IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
> #endif
>
> > +
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 096e45acadb2..8c1e1964b46a 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -38,6 +38,7 @@ menuconfig KVM
> >         select HAVE_KVM_VCPU_RUN_PID_CHANGE
> >         select SCHED_INFO
> >         select GUEST_PERF_EVENTS if PERF_EVENTS
> > +       select KVM_GMEM_SHARED_MEM
>
> This makes it impossible to see the error, but I think we should fix
> it anyway. :)

Ack.

Thank you!
/fuad

> >         help
> >           Support hosting virtualized guest machines.
> >
> > --
> > 2.49.0.1045.g170613ef41-goog
> >

