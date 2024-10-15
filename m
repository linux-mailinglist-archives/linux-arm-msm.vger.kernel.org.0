Return-Path: <linux-arm-msm+bounces-34412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CCE99E426
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3DD1F23878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305741EC01D;
	Tue, 15 Oct 2024 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SlbOHwWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB021E631A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988466; cv=none; b=GXWpHYoKFBMT134kuIFvxU3WB4BhiKshHgewUOqTRvYeW4Xs6v0wfYvXMpwXZb/39zoGVeuZqPHAlt1ton0hNMfYMGF+87iewxLZJ/+U6YlnQzj0pNmK3gUBqTZwXeY2EG1kcYCpSDeUTJISloYYmiBXTLw9MCYeyTce0K0oMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988466; c=relaxed/simple;
	bh=PYZ5EE2vMDn1SRvukAMdxICdjN0+80EJSJ3JS7OQtfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj3uy2vxWa1k+ghdETeeNkoImQKRXXULLPNkruTKUN2iOEi9M4OD+Uo9VyeUY8VCTjd94FR8YFCDBzt2XF5M2QkRQRkm/YPpY7HmRdHHth+P/KLWFPPAfZHXbAOwfPnx9CIGwqzEzV6hpZqUbBgfM983SAnBEMuuHGxU+nuAZ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SlbOHwWC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e681ba70so41060e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728988462; x=1729593262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ls9qVHIptEAZv3+i0xxsNbaVKH5zPevNm/KyhuMv4Nk=;
        b=SlbOHwWCeW1Yza1xn/NsGGqDhzeQqiSFbjAmAWKxFhe3vdG54QJu2YBvKULLOGwRqX
         711L0VkvyJAhk6DNLZsXlLQGztIwkg+bU8xWmMdmg5rrJp1A6nO114oNzoTp+TtE90MK
         mMgPqrC2zoXf/JNShFKGJW3CIsVJAoCYfDbe8HMxjZg4HaOV3zDRlqMNEFRHRJGaxSEb
         JGwH8NcBSclG7Rr39XF9r1kVWb+xa+PbRKBKavG2fVVVVe18p0yAyddFCrvOwlOlCWdg
         YV4ImDM/2xmi53g/8Qd6wQBANxkuWDHCUT9wn92vDR1t/AkCmAL3ntamP2K/qsn9eJB/
         rIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728988462; x=1729593262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ls9qVHIptEAZv3+i0xxsNbaVKH5zPevNm/KyhuMv4Nk=;
        b=R8kXZeTpac4ZsbqXRL38WoGlY2ga9Vcbp58OELqJuva7LGhQP/sclp2A7NnP865/vn
         pfdid0b/lrLlt+S2wN9+Ftu/qov6bZmBBodPCTby3WI6gesWqjNQIDQdsMTghyQUnx2C
         kqSE7cKIJR79EfelvG/r+dReFZTuGcGjSd1EulPQltKu73Q+E6wDR/Miitec2IaSCeoq
         ienZCT6nhNKu4vEno3nDlWG6442oOsyZN6mymljSyc5bVvMQl0qbMI2ImextCqrWQeg9
         VNa3vsGysRgNGRUQaVajnU5VzQ/YdqBUT0u2dIK75ARhux7Q9JITlI4ziPxa3txJgup5
         kXow==
X-Forwarded-Encrypted: i=1; AJvYcCVyigVyqCB0Q4GrwdbnsZ3cvjUoILNW2/IeV6E5M1mNXItG1VzOY61xx2uYrI4isEki+YALWR3YUMTN7fqC@vger.kernel.org
X-Gm-Message-State: AOJu0YyvvyJ96i4llsDRtlD08MRDKiFfCB+X+QDua1IsOhcdmAqpD0QF
	tKVZljrnAgn1XA8IzhUX9DgjzIVwG4zaOQXTN8iAhwZHjalfsBdqKUKKqBGgcb0Wn4EM0/NCxMP
	1l2pW9pU83sZ6FOaPDKPkSB31DcisSk5Zhi5GnybiV4GUv9qW8gCk
X-Google-Smtp-Source: AGHT+IGhIOkgp+vdho98+s1VXHkGsQFC3YRpV/3TZtq0jPLTeXJSZKx86L7VaFVGL8B9pRLy+6IGKh0OMNK9BkTyuL0=
X-Received: by 2002:a05:6512:ba5:b0:538:9e44:3034 with SMTP id
 2adb3069b0e04-539e5f9fcb7mr947797e87.6.1728988462001; Tue, 15 Oct 2024
 03:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com> <20241010085930.1546800-7-tabba@google.com>
 <d6762bf9-b1ef-44d5-b42f-3e5fd4f47b4b@arm.com>
In-Reply-To: <d6762bf9-b1ef-44d5-b42f-3e5fd4f47b4b@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 15 Oct 2024 11:33:44 +0100
Message-ID: <CA+EHjTzPOLz1dx0nAdjNSmHXtOGvhVrFmtNvUyFTju1pda1D6g@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] KVM: guest_memfd: Add KVM capability to check if
 guest_memfd is host mappable
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Suzuki,

On Tue, 15 Oct 2024 at 11:30, Suzuki K Poulose <suzuki.poulose@arm.com> wro=
te:
>
> Hi Fuad
>
> On 10/10/2024 09:59, Fuad Tabba wrote:
> > Add the KVM capability KVM_CAP_GUEST_MEMFD_MAPPABLE, which is
> > true if mapping guest memory is supported by the host.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   include/uapi/linux/kvm.h | 1 +
> >   virt/kvm/kvm_main.c      | 4 ++++
> >   2 files changed, 5 insertions(+)
> >
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 637efc055145..2c6057bab71c 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -933,6 +933,7 @@ struct kvm_enable_cap {
> >   #define KVM_CAP_PRE_FAULT_MEMORY 236
> >   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
> >   #define KVM_CAP_X86_GUEST_MODE 238
> > +#define KVM_CAP_GUEST_MEMFD_MAPPABLE 239
> >
> >   struct kvm_irq_routing_irqchip {
> >       __u32 irqchip;
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 77e6412034b9..c2ff09197795 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -5176,6 +5176,10 @@ static int kvm_vm_ioctl_check_extension_generic(=
struct kvm *kvm, long arg)
> >   #ifdef CONFIG_KVM_PRIVATE_MEM
> >       case KVM_CAP_GUEST_MEMFD:
> >               return !kvm || kvm_arch_has_private_mem(kvm);
> > +#endif
> > +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> > +     case KVM_CAP_GUEST_MEMFD_MAPPABLE:
> > +             return !kvm || kvm_arch_has_private_mem(kvm);
>
> minor nit: Keying this on whether the "kvm" instance has private mem
> may not be flexible enough to support other types of CC guest that
> may use guestmem, but not "mappable" memory.  e.g. CCA may not
> support "mappable", unless we have a way to explicitly pass down
> "you can map a shared page from the guest_memfd, but it is not
> sharable in place".
>
> We could solve it when we get there, but it might be worth
> considering.

I did consider that, but I assumed that the configuration option would
be sufficient. Otherwise, we could make it dependent on the VM type.

Cheers,
/fuad

> Suzuki
>
>
>
>
> >   #endif
> >       default:
> >               break;
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

