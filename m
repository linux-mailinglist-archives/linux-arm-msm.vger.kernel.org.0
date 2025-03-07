Return-Path: <linux-arm-msm+bounces-50631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ECCA56314
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 09:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99E63ADFC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 08:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420C61E1DED;
	Fri,  7 Mar 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rCsJxzWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9668F1E1DE2
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337861; cv=none; b=Hw90pxMX3nFoZXQDqD5gVSa4/g9jukHN7Dhzzjkxu5Jq8KqfdD0BkNuoNyST3tuUQnh/2KZeHv07y3R6d7ax20OyhIaiUVtVBIQ9V3+/Tp0FkxaiXT4h1laU7DSWRyIUT374l3CHhPXywKqfaCtPX3hZTxDENNlLp3jswu8yDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337861; c=relaxed/simple;
	bh=vGG9NEnOun53/QXEi+g4WfOf7xFQ/aekd5NU3bx/M10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYxYkOxedSNfbMgjuWbvToW2HixY+zwA6tTY/b+4FCqzuhI7TG2b+qWxAHA4N8jms1dTlUq38T0EysZ73wY0geeKYWGfHWaSt/AXFZSiJM2Ld/dXZzyQ7PGKz1gmrbx0ZMzpCjMdWtaH1/KXBIii3v428GaCWDL/Lk2yshnUQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rCsJxzWN; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-474fdb3212aso246741cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 00:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741337858; x=1741942658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/bwAjReW7ie98bg7DwXms4xhFjHn4AdXPUuqjhFQI0=;
        b=rCsJxzWNb4eaOn5v41nu5hdDMVp5eKu4H9yCc5CWksi0yFXRvBgLSDqLBCUcTmTCi3
         aqgFdiTLGXL6YOuv4AVhwwms8dTD0mlMB1yNOy9ZXYIIWiZj1ZvjGlJJOOndCM1gKGMh
         HSIGjwTcmjLGmTjfeF8OK4z7nNweI844fMjxPcMwZsJeem7sXs0XzE4QJWeF59qIsktJ
         aOamuPY5OGLK9xdj458+St44jpVJ1a+tgPAHSX0gRMjIt1bzU62ED7LunLFYD/vrmyo3
         FQBvHrG38qVH4A8F+y1nNbVLCTO8RfEZdwsjt6nHpxuY1DginkK6kldQrCBhQ7efOFw+
         J7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741337858; x=1741942658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/bwAjReW7ie98bg7DwXms4xhFjHn4AdXPUuqjhFQI0=;
        b=ozMelQqCtVe1kzG3AUaoeeWUO6wU2zc66EbUP3CjfVXiEs8N6LjaBrEy/EmdthqI1q
         Gz6sXYjXXZUJXuLmcUfL6fujSbxnyMTEPmdUIiotmIDVheK+WNNRw50RtziAWtFyzivf
         gdt9CRcis+U24Z7YepTfRiCcM3iuGf8F4PaPHbs2ChGMflW8HoRg3Mzw6OmEvkSd8s2N
         +lZIMa4uykES1jvevN72q9s5A7LCKy4646IPKUGeyjNci7jl4sIeQAIzdrV+A9HaOQY3
         WwyOUZ2QRsg1K3Hr+t9tw8NtbESgSSgGXWJof2RC/0IFXUIXD0iEhPMjZfGW0ckDIorv
         YGXA==
X-Forwarded-Encrypted: i=1; AJvYcCXSMWl/A59b4fCqmcuSx9k2Wjl0ViMh1f5b5w8LKEqQtfM9zMjSIu/4fcL3QIPBEcEQoSNfA2c30X4L86Ve@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cSVERjBKHC9i/IVmOKKYZYHFAyAZQwBj4xGlzU65VymWBA9W
	/agds0VYDieIakO6gkm5or++hLv09UEuCPnS2YK9LYAoRH4o5kJkHLvmYUBL+Uzx5I2peYuNaK2
	HR0Fn+njQdie9Lh8vXjT2jG3CZVD6Q1Yf3p1i
X-Gm-Gg: ASbGnctAUJo9WqSBoUvqhN/oq2Xf2V7L7ILruLKvxXZL/r15ND36p/+QZL+dGuPfdVV
	CbRo4BVMVOCwU9vlufxCDjbK972WqGN75tDnyrygeCa5tYDexJITU/ZFtouYnYBQkWmuLgcaROx
	DJbFXb7poFjYaWoAUVMYNt5Et/
X-Google-Smtp-Source: AGHT+IEJfnwrntQWEbO59kgrl0DHAqzKu3TmruS5tWQMX2gWkrRQKc/y6j5gschySkCsMnfblI87FsWqsfAoI+IMKRo=
X-Received: by 2002:ac8:58d5:0:b0:474:fe2d:d201 with SMTP id
 d75a77b69052e-476521fd83bmr2036211cf.9.1741337858125; Fri, 07 Mar 2025
 00:57:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303171013.3548775-4-tabba@google.com> <diqzfrjpu6a8.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzfrjpu6a8.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 7 Mar 2025 08:57:00 +0000
X-Gm-Features: AQ5f1JpvWVX4p-I-6NV1AGFD4gCusH1RF5PO6B8I5VhGtEmyhDA3YIF8HF36ulc
Message-ID: <CA+EHjTwOMH97apzhVjxW_+pN6iXMRbkA7QQtdZfuUKUJm27-BA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Thu, 6 Mar 2025 at 22:46, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > Add support for mmap() and fault() for guest_memfd backed memory
> > in the host for VMs that support in-place conversion between
> > shared and private. To that end, this patch adds the ability to
> > check whether the VM type supports in-place conversion, and only
> > allows mapping its memory if that's the case.
> >
> > Also add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> > indicates that the VM supports shared memory in guest_memfd, or
> > that the host can create VMs that support shared memory.
> > Supporting shared memory implies that memory can be mapped when
> > shared with the host.
> >
> > This is controlled by the KVM_GMEM_SHARED_MEM configuration
> > option.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  include/linux/kvm_host.h |  11 ++++
> >  include/uapi/linux/kvm.h |   1 +
> >  virt/kvm/guest_memfd.c   | 105 +++++++++++++++++++++++++++++++++++++++
> >  virt/kvm/kvm_main.c      |   4 ++
> >  4 files changed, 121 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 7788e3625f6d..2d025b8ee20e 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -728,6 +728,17 @@ static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> >  }
> >  #endif
> >
> > +/*
> > + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
> > + * private memory is enabled and it supports in-place shared/private conversion.
> > + */
> > +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
>
> Is this a copypasta error? I'm wondering if this should be
> !IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM).

Yes. Kirill had pointed that out as well. I will fix it.

> Also, would you consider defining a __weak function to be overridden by
> different architectures, or would weak symbols not be inline-able?

I have no strong opinion, but I think that it should follow the same
pattern as kvm_arch_has_private_mem().

Cheers,
/fuad

> > +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> >
> > <snip>

