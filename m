Return-Path: <linux-arm-msm+bounces-46581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7BA2325C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 17:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5A837A14E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 16:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F51EE7D2;
	Thu, 30 Jan 2025 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ER7h2Rg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81EF1EE024
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738256318; cv=none; b=lo0fVlO3CWPZpIaNewDDwMpHSjMdeuM4qI7XNvFj0fE3xXncbfDRZvyO1FYLiFYB3QM/+SHOfevBgOqzUbhY8oRxuZ7+od94fV1uv6h7ssrZ21Vr32D40F/zrNhUs3j4XVsm+yc+Ejfw2/Jr1fC9tLK+CLGKFMB+kgiXMXzhyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738256318; c=relaxed/simple;
	bh=d+XERwEorFMtt/canygb3yzxG8nO4ybue2mgukhF8iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5CuqDLW80GFgxFLIwqU0mNpxD1iybly/4C0fF7hsxPf2smibcFTMBjzbolJh2X2feXDXCDzppMCwBQZ+SNgV9fykiUtggQDLq+GAr6R9sAMK+yUgScy6fxNVYpKzlb0zdPGf6WZHXO5F8j5gwZQXtpD8NFCMjDs5RTiVB6ddVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ER7h2Rg; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so279111cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 08:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738256316; x=1738861116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OjVSJeaXnqEO6kzNOY1Q8YRm02MOKH0yqrkAcstxsgU=;
        b=3ER7h2RgmEGDgX70pYFVBWSFTW8aJ/segOd49o/TrhK/Isx8hFne3nwqAaT5RpBp5i
         esTPw38VjZbWHu0W2Q424ASsr2ImHAtf96pmPHZz5O903fD7tFebcIAGYzglTaLLMc8F
         gZyDNDbAK5YD0QZxnhToeg8erNJ7hJzQt/Onv9AJEeEdUTdAeMgBQ+cOmrmnT4/b4QUx
         BIR6OGPq1kU/FG8YHkegL/Z953mi1ouOOKSicSxAC1u+CZEtEmLd3HxOosKNWPUutxUd
         vGeA0AjnmDQylPJu5T4F3y0ZHOJgRfMtBT94hUPmTNMaJ3QrwOvgYxMh5LkRUcY+VUhN
         Oe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738256316; x=1738861116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjVSJeaXnqEO6kzNOY1Q8YRm02MOKH0yqrkAcstxsgU=;
        b=PFEdjgQc6XrW700relqkb/PUkwwUkAg5EcqC1sw49OuzNAuC1LlnQN5ULwbdB5XPS1
         yNci/JoGrDaBrfle4fPKptTXSOuIcS5LnaAzS6ob9tSX3OoluEfZ2Mf4+W/OwBMtSjnu
         LhUIXYjwp+JilRW+dhNNUbN90iHKQiqcJqKxE10RXw7zAzAaj+JSA7bYU5hSHBcGpeCs
         bSI5gC1P8L+0Lj4aFJSkRTBW2IQE1R/8dSy+sUCI5onSmzOSE2sEYbqaGcB5UauHBWua
         YyKxPMk4L52haB9/Rm9XE8DRRfYPteqUZ+m0/g06M8Gigl8YzNkCTACYtBpyTQz9115J
         nnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm2iBk1gIIWPzXkG3Ebgw2oaQeqGueIADlLYwD1En+3IVR49lshtJk6yEB3lwy5Kvw9Tzu4vNM8sUCpqpS@vger.kernel.org
X-Gm-Message-State: AOJu0YzYo1M6cOGEn3CGWLcEG5odz5TPNbzqC5gRr7igcMahlnTueB2W
	w8M36V2BfDtguOeV4q/EOgtrXx98vzDpS0Ppr1R5zkqiIF0PlL1z2Gfk0mL6m/e9kJkKD8kfHgm
	7GfkMjkxIIxJ6ei7+4+KDluj30oGeBFNb31ak
X-Gm-Gg: ASbGncsNYukSDEp6wml0hg9nF8MpPI3EvHLsK9kAcXsx4UsPRH219YMMzolf4Pudi5U
	PdXasqe7dT9vULldvpEn2Z7MuPiLEjTr1xDZuk/trr91zIHlUhIfu798ozbLyLNbJjblu6zQ=
X-Google-Smtp-Source: AGHT+IHCwX9tBUNJ4vUL+HRtX/pNUZGqGIBRJgFIeh7dwGLzBMH2QbmaQNU6B5i4kDVwxKn3b3C2BGkQe7GPOVyR6ew=
X-Received: by 2002:a05:622a:1a9a:b0:466:97d6:b245 with SMTP id
 d75a77b69052e-46fde4b14e3mr4241201cf.22.1738256315469; Thu, 30 Jan 2025
 08:58:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com> <6810dbdb-1b44-4656-9f65-abca471523f9@redhat.com>
In-Reply-To: <6810dbdb-1b44-4656-9f65-abca471523f9@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 30 Jan 2025 16:57:58 +0000
X-Gm-Features: AWEUYZkqjd_c8s8_NqAiNB2ua1_PSsCvwT_KNHeeEKbL3m2RKXKoGVCEenSF2OE
Message-ID: <CA+EHjTwE3mn+eJgmcFk1GqFdtyBHgM4SpgHNJ-0omNKLSzP8pA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] KVM: Mapping guest_memfd backed memory at
 the host for software protected VMs
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, 30 Jan 2025 at 16:50, David Hildenbrand <david@redhat.com> wrote:
>
> On 29.01.25 18:23, Fuad Tabba wrote:
>
> Thanks for the new version
>
> > Main changes since v1 [1]:
> > - Added x86 support for mapping guest_memfd at the host, enabled
> >   only for the KVM_X86_SW_PROTECTED_VM type.
>
> Nice!
>
> > - Require setting memslot userspace_addr for guest_memfd slots
> >   even if shared, and remove patches that worked around that.
> > - Brought in more of the infrastructure from the patch series
> >   that allows restricted mapping of guest_memfd backed memory.
>
> Ah, that explains why we see the page_type stuff in here now :)
>
> > - Renamed references to "mappable" -> "shared".
> > - Expanded the selftests.
> > - Added instructions to test on x86 and arm64 (below).
>
> Very nice!
>
>
> I assume there is still no page conversion happening -- or is there now
> that the page_stuff thing is in here?
>
> Would be good to spell out what's supported and what's still TBD
> regarding mmap support.

Thanks! No page conversion happening yet. I'm rebasing the other
series, the one with the conversions, on top of this one, as well as
fixing it based on the feedback that I got.

What this is missing is the infrastructure that tracks the
mappability/shareability at the host and the guest, as well as the
implementation of the callbacks themselves. I thought I'd send this
one out now, while I work on the larger one, since this one is easier
to test, and serves as a base for the coming part.

Cheers,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

