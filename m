Return-Path: <linux-arm-msm+bounces-48020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82818A35C9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 12:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37AF7162983
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52467262D11;
	Fri, 14 Feb 2025 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4hKNkw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56A2627ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532860; cv=none; b=hw7vyGW84SfxT7Cat4BuurP8HoAVMkdlfwhMDcYWGwn1g3F1e5oHQ6kzKcSB2PZ2RX2aRlsKl/G/Wylv8o0VH0wVL4AdFdGQ2MZcqht2c0Ru19LcUYYT4D3a/1FEttA1vWc9/FPDBB//y8reM/R5hNQMv5FfCV00rVBWov74DV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532860; c=relaxed/simple;
	bh=oIIxZXp55qHUezW1KXD6M19h0CDt+B15X3kzsrT1cbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdhFnxEtJ6LryS5D1kQHcED4lcwFbw8XrfsUk7IrR8KY/uaL3blIhbOOxQ0jBzBLEretWMArvsMaSrlpR1ncXIpQl/RwD+S3u5hMSvSzGv40VxRbTeLPKROzrfOzAwi+uDGJCoX6on+WOG/S5mD0wC5EONi6fqwtUxvISE5X3qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4hKNkw6; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-471c9947bb5so192431cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739532857; x=1740137657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oIIxZXp55qHUezW1KXD6M19h0CDt+B15X3kzsrT1cbg=;
        b=y4hKNkw6c2iAGVkR8HIhYcttA6Od+6RqkuCPtgBJu9Ar7apnIdqM7ULZhjV5VkpfEZ
         UhEsvJ6o9pEBIY+SfmIngx6araktNFAolgg+rG8u84w+hzWgJ99cxo4fuCuT8zqYTB3T
         jUDVT1+nuFLsYjf5LzfAmdGIFDW1mjFUVV9feY9T9l3X09dQ5YJ05ywC6Lw3/tKYd1lF
         z9r3l2tkR0YMioZBaGD0Sh0sofS4z7rntgL+pEUN1AbS7rmQLuQnXT8evRBSyjwTJ5uc
         epHGAF64DJaYD9sc2/WjxygZfEXPEoN/MaGDhEZu0KDkhpv4OCoRTAlCCtLVLlEHALDu
         NVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532857; x=1740137657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIIxZXp55qHUezW1KXD6M19h0CDt+B15X3kzsrT1cbg=;
        b=UZBgAhy0+LMhBQlIK0ot52lgm/T7PM+ZtMgZSoxhKGjJtsve7UNpfuaV/PJKKJSSkq
         Kld9dpm8DZKGSQ8UYq+xue8Y8yF0MBKs9ptS0qo6vif1iWFISLjixZr3WkFiUaR6yW6+
         gpHy7wudNeJN0WcqRZT3r5MaaSl9yxnYXBtEARDvX9JZ4ULLlYGSKcB2mSJ1FEo6Lqqt
         7oHY5j6F4hmVmPFTuHgBZu9x2PSpYnW+6jULzjFpmeztJXFGj56dHyGgnzDiwYMLDTOB
         tBBjX81q2PQcwh2PY1Q545BePLHErwbb6FQtjAdcljfcIWr4DX7xKThSrWNNBbMCm7V+
         Jo1w==
X-Forwarded-Encrypted: i=1; AJvYcCWayDXllRwgqmKwHTCIaOaWVaXsgARETcGPMj3+52mxpnkyKHhSB6DU2GOJ+hDmbcBkwjw/k8fpE12M59B2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9yM2j1n0gQDp24SKWn024v4HfTyljxpcDxjSDqGvkw0cv8v12
	M7xg7CHlD8YuYMWSbVa2oHdOqqR1q9v93xgfdgicGPvH7iuGRwiY5wpB/+ct75J65jouaCzKNVo
	IfgtBBRYFHKZ32l6wDSAlLHztrl3eByPb4rr1
X-Gm-Gg: ASbGncvLpwVSEW53aIunBnP0RSCgFCSmQEDHBkAzruu2wRcHBPNeDEL1BaGMDnNweZl
	JBv0I7xgwNsBa8101rNcfZgzCBlg4tTZxLAGuvuMGJFu2//T71KkX20TeyQM6PVVMxkVYZ+0=
X-Google-Smtp-Source: AGHT+IHtlxcMR3vxqJWY40h6ajM6F3iajxeDdssyRx/Y0YsmLzdFANWrYFIiKj2QO/E2Jl5nbjtDGwGC4XIUy4DvM7w=
X-Received: by 2002:a05:622a:d0:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-471cf9817a6mr2328871cf.25.1739532857266; Fri, 14 Feb 2025
 03:34:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com> <20250211121128.703390-10-tabba@google.com>
 <Z6t227f31unTnQQt@google.com> <CA+EHjTweTLDzhcCoEZYP4iyuti+8TU3HbtLHh+u5ark6WDjbsA@mail.gmail.com>
 <Z6t6_M8un1Cf3nmk@google.com> <d9645330-3a0d-4950-a50b-ce82b428e08c@amazon.co.uk>
 <Z6uEQFDbMGboHYx7@google.com> <Z68lZUeGWwIe-tEK@google.com>
In-Reply-To: <Z68lZUeGWwIe-tEK@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 14 Feb 2025 11:33:40 +0000
X-Gm-Features: AWEUYZkg9ciLMmzUzGdibdWHAPxNuB7L-_G6HGADGpvsMSO9kriMESSOnmZ50-k
Message-ID: <CA+EHjTz=d99Mz9jXt5onmtkJgxDetZ32NYkFv98L50BJgSbgGg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] KVM: arm64: Introduce KVM_VM_TYPE_ARM_SW_PROTECTED
 machine type
To: Quentin Perret <qperret@google.com>
Cc: Patrick Roy <roypat@amazon.co.uk>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, keirf@google.com, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

On Fri, 14 Feb 2025 at 11:13, Quentin Perret <qperret@google.com> wrote:
>
> On Tuesday 11 Feb 2025 at 17:09:20 (+0000), Quentin Perret wrote:
> > Hi Patrick,
> >
> > On Tuesday 11 Feb 2025 at 16:32:31 (+0000), Patrick Roy wrote:
> > > I was hoping that SW_PROTECTED_VM will be the VM type that something
> > > like Firecracker could use, e.g. an interface to guest_memfd specifically
> > > _without_ pKVM, as Fuad was saying.
> >
> > I had, probably incorrectly, assumed that we'd eventually want to allow
> > gmem for all VMs, including traditional KVM VMs that don't have anything
> > special. Perhaps the gmem support could be exposed via a KVM_CAP in this
> > case?
> >
> > Anyway, no objection to the proposed approach in this patch assuming we
> > will eventually have HW_PROTECTED_VM for pKVM VMs, and that _that_ can be
> > bit 31 :).
>
> Thinking about this a bit deeper, I am still wondering what this new
> SW_PROTECTED VM type is buying us? Given that SW_PROTECTED VMs accept
> both guest-memfd backed memslots and traditional HVA-backed memslots, we
> could just make normal KVM guests accept guest-memfd memslots and get
> the same thing? Is there any reason not to do that instead? Even though
> SW_PROTECTED VMs are documented as 'unstable', the reality is this is
> UAPI and you can bet it will end up being relied upon, so I would prefer
> to have a solid reason for introducing this new VM type.

The more I think about it, I agree with you. I think that reasonable
behavior (for kvm/arm64) would be to allow using guest_memfd with all
VM types. If the VM type is a non-protected type, then its memory is
considered shared by default and is mappable --- as long as the
kconfig option is enabled. If VM is protected then the memory is not
shared by default.

What do you think Patrick? Do you need an explicit VM type?

Cheers,
/fuad

> Cheers,
> Quentin

