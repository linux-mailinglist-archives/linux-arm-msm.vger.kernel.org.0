Return-Path: <linux-arm-msm+bounces-62198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 469EEAE625B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF673A9FBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4195248F6F;
	Tue, 24 Jun 2025 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxr/CiJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0E17A2E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760783; cv=none; b=SnlekBUjW1SUiX6HLcfA6YKyRdzOW8pWySxwnteo+dfvcbW8CK2/7yaEtzXpuxKoQeNUaQV3pvQgFqQd6KrmBjBwICJRzKh7QEqNL4KswJ0HFL5hiQj2hPZMdkpHKjZCj84DbHAAlNX703J7dvQxIRV1hi5zzed9eoVRshplTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760783; c=relaxed/simple;
	bh=nn4SuqpphmFRlZUcHn3smREQdX+2aWW06JOZrPoskiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9kJRORZCfHdYrizqlnuJunfh/JfnemSOn4E/5wC/hxgjLnZxsHSBLNit2YAeaJJ5Gdzww0dKwNLlPJ0X+95bZwKnRymzTYtTL0QEmmEdQjLvbmCjoNAHvrqM3PSspds/BXVONfh+fShJoaApuBmUDVGlG1OZCu5OcjvF7jBYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxr/CiJ1; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5ac8fae12so374021cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750760781; x=1751365581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uaKxjTr2Dy9UkQ7LbzgGPeXHUMCK6nT4emjWQgyE2Gc=;
        b=fxr/CiJ1UY8W+xXx21zxvYzxOyD3lqxHtnUGdNXN1X340n0Sj2ifmmceTIhFy1FDvd
         OxTL9xQNBOItwsvdsdmqSqRyLp9EIyZH7QnUbYxanoCHLGiHwGyRRDlbaP8LCPey+8mO
         VWgI6MPbt0PZOla3OOZTFI3hd0Gd4vCGbe3vsZmDZTIDP/79yjBaVcwSuExhHtfFBz+L
         4POyEBzswOJLDootpZ0pi+Nve5SVUjS1JlAPtjl8XJqsZ0Pt3RqwlQp9FULxFZJ/L/CX
         KRcnGmaCdwLTZ/PbRECRtYKcSdNdfKToYChsqDa1OO/CWttW0No8zGNElDF2DUSalE3q
         k0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750760781; x=1751365581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaKxjTr2Dy9UkQ7LbzgGPeXHUMCK6nT4emjWQgyE2Gc=;
        b=hZUk93SQCqiHzXOl+agbl+PDyod6cMZR05lWO9FlbY+D2tV4CBLQkm8YLvafdW5X3q
         fn4eX5vjjFQyjGeq251sVZ6BN1esxk6nvk/gjOslt5bPE1SDVP+0FRiMGMAFgh7sHX+o
         pC+jYHhhGGEXB/DZV4pT7+E1NXQ4ryP16fw2JO+SvQkegyWJ9KqxhqjdfngJkIYrdAdn
         yPM8DIk/FMySxuT2GixHRaVqK/lMQ32ZYa0j+Tho46jzCtDUKHsHv0Xg4UnlmDILTLtn
         wad0iH49oC6hpFafkdyo4lEHZOUnCXK3O+enFsqOLReiyJ4uAODxVsrZRdwsEXO/MHdX
         0gJg==
X-Forwarded-Encrypted: i=1; AJvYcCXgrxBLAWBdms33raAqd47ESJs459k8Mow5BSNiZLCvBJLJx3LsP15M2HJec/e7WuxC+9qh9fFc0r7mhi28@vger.kernel.org
X-Gm-Message-State: AOJu0YzRX77RNyxaNIzW0ocrb6Su5R2NgGQPfJ6QQgTrlsn5Bk+YnsP0
	EfperRJr7FRdUEyHUdkv1xB9f9E1PIV3Rzx2lB7Wrx3zAoHbxf7HnJRsNpGmjM/aevkohA87txx
	HA8O5o2xTBtdSzRhsLoNpT7hgu9kZ1mw24HOMoye0
X-Gm-Gg: ASbGncs5pVATLx8UFFs8SRn+Um+zQK6aqC5ZoFfIF45a0KonHGTHX+XvKRRSRBRcdSj
	Yw5ORSR9eu9h+vo8QNq4J246oQF3AJlzp7EKeQqPX19S6KQLRt5Q8++LzO/3+Aya7IS+0BX7vi2
	eQSsaCdjTWEqZAGSb8dQIkPie3QRfLo6njWaSqOtfoEKK3nZCu4apgxxkEmulODiINvaFJK8oZ
X-Google-Smtp-Source: AGHT+IG7dvHk9kjVfPdNY3CE09+ALlTOMcwHOWFBP9WRHrrMEvmf41kIS7uFXbaypXOKaIBbz/ZGTrFP7IhVhX4+5X4=
X-Received: by 2002:ac8:5ac2:0:b0:4a6:f9d2:b538 with SMTP id
 d75a77b69052e-4a7af677e68mr3881551cf.28.1750760780317; Tue, 24 Jun 2025
 03:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <80e062dd-2445-45a6-ba4a-8f5fe3286909@redhat.com>
 <CA+EHjTx2MUq98=j=5J+GwSJ1gd7ax-RrpS8WhEJg4Lk9_USUmA@mail.gmail.com> <372bbfa5-1869-4bf2-9c16-0b828cdb86f5@redhat.com>
In-Reply-To: <372bbfa5-1869-4bf2-9c16-0b828cdb86f5@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 24 Jun 2025 11:25:43 +0100
X-Gm-Features: Ac12FXzp2QR2bGdUaTCduQbIoXQgEK3ZRaRgh2VOnlt_lf7nCklaqTOJp7VscJk
Message-ID: <CA+EHjTyxwdu5YhtZRcwb-iR7aaEq1beV+4VWSsv7-X2tDVBkrA@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] KVM: Mapping guest_memfd backed memory at the
 host for software protected VMs
To: David Hildenbrand <david@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
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

Hi David,

On Tue, 24 Jun 2025 at 11:16, David Hildenbrand <david@redhat.com> wrote:
>
> On 24.06.25 12:02, Fuad Tabba wrote:
> > Hi,
> >
> > Before I respin this, I thought I'd outline the planned changes for
> > V13, especially since it involves a lot of repainting. I hope that
> > by presenting this first, we could reduce the number of times I'll
> > need to respin it.
> >
> > In struct kvm_arch: add bool supports_gmem instead of renaming
> > has_private_mem
> >
> > The guest_memfd flag GUEST_MEMFD_FLAG_SUPPORT_SHARED should be
> > called GUEST_MEMFD_FLAG_MMAP
> >
> > The memslot internal flag KVM_MEMSLOT_SUPPORTS_GMEM_SHARED should be
> > called KVM_MEMSLOT_SUPPORTS_GMEM_MMAP
> >
> > kvm_arch_supports_gmem_shared_mem() should be called
> > kvm_arch_supports_gmem_mmap()
> >
> > kvm_gmem_memslot_supports_shared() should be called
> > kvm_gmem_memslot_supports_mmap()
> >
> > kvm_gmem_fault_shared(struct vm_fault *vmf) should be called
> > kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
> >
> > The capability KVM_CAP_GMEM_SHARED_MEM should be called
> > KVM_CAP_GMEM_MMAP
> >
> > The Kconfig CONFIG_KVM_GMEM_SHARED_MEM should be called
> > CONFIG_KVM_GMEM_SUPPORTS_MMAP
>
> Works for me.
>
> >
> > Also, what (unless you disagree) will stay the same as V12:
> >
> > Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GMEM: Since private
> > implies gmem, and we will have additional flags for MMAP support
>
> Agreed.
>
> >
> > Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
> > CONFIG_KVM_GENERIC_GMEM_POPULATE
>
> Agreed.
>
> >
> > Rename  kvm_slot_can_be_private() to kvm_slot_has_gmem(): since
> > private does imply that it has gmem
>
> Right. It's a little more tricky in reality at least with this series:
> without in-place conversion, not all gmem can have private memory. But
> the places that check kvm_slot_can_be_private() likely only care about
> if this memslot is backed by gmem.

Exactly. Reading the code, all the places that check
kvm_slot_can_be_private() are really checking whether the slot has
gmem. After this series, if a caller is interested in finding out
whether a slot can be private could achieve the same effect by
checking that a gmem slot doesn't support mmap (i.e.,
kvm_slot_has_gmem() && kvm_arch_supports_gmem_mmap() ). If that
happens, we can reintroduce kvm_slot_can_be_private() as such.

Otherwise, I could keep it and already define it as so. What do you think?

> Sean also raised a "kvm_is_memslot_gmem_only()", how did you end up
> calling that?

Good point, I'd missed that. Isn't it true that
kvm_is_memslot_gmem_only() is synonymous (at least for now) with
kvm_gmem_memslot_supports_mmap()?
Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

