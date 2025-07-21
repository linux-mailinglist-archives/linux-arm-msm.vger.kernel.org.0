Return-Path: <linux-arm-msm+bounces-65904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3976B0C572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 15:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C6593A549E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 13:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D7D2D9797;
	Mon, 21 Jul 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vte6I+vD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6128726D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753105535; cv=none; b=ZySkI36UFrvPnoE2hDv0gAG1d51oA4vCpjHizhDayQQVrJ/88ce9kFEViecWruhW0VYJDwde8+Ca4dGhU4Oi+2s1Ncufc7hYFl7U0kIyZqoN4UgQ+36daY2OuIUL/fnR9hOqfIb7cpl6BfOdL4+cKv4u/Bho4YR31sBm3FsWKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753105535; c=relaxed/simple;
	bh=xS8FHRQqRz1nSiwIVN6mTqgxMWHxF+OgzCsTtwKG9q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B739w7NUTAzIG//AyjFoUThR9M4bnSqOHn6NAXIwEU3/okHykC0TnOSi3KpSgQK/RcXFEy8+9OGfEAbXkEN6IYX/XIs6/ZxMl2RSy6wM6iZhgeILeXFaRzCSXZzZpSZZGwko4q9bJ9HCdgZgbJkj0kLoHPUuOiXiJDTm2EAMm7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vte6I+vD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23dd9ae5aacso243945ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753105533; x=1753710333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQBY4/lqxzZEDnjripdA0AMheXR9IyeEye91HdZllXE=;
        b=Vte6I+vD9fYDazndsFJj/rDQDq+8es01LC3aDMSYeVS/I9s9Fc3Ll0i4h0q5u+yLrk
         8NLTKyR0+fojoiYkXClZycP53CnRT6PSHnHHqQ5U4ZQUbc64gb8Suz0wP5g54d64m5Ae
         Ws0+soheNjFo92xaGQVt/6FDYUd1K6EDXDT4TrdVO7bezLy+YW8ljlMKSNu81Y7uZ10c
         GFDI5ReMG7fdepXx1gh3aWKwp3q4NxBf47R+UsUv10FXrJswbYH+CM58C8VU5W5oUvsQ
         LlBzdTc4RYVeE3BpfSeKngjkIPwTzbe8jaawVzABQOSTmQJT39RNXJ66TkuYe11JOCtN
         P2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105533; x=1753710333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQBY4/lqxzZEDnjripdA0AMheXR9IyeEye91HdZllXE=;
        b=TTQCCpeKL9RdLFfI8IT4iyaQzmI4QeTUYQE1aBlheh5TGSZkFQRMBGTXedeVbMIZim
         b/V0+1Xj3JrHzR8MsWl7ih60hJVIiVwe+RGvqBCNCDKno9UPBnl9kJI45ij1WuFSUDOK
         ZzFzhdNUjvkFJtVidOWCbN8kWlDkR3YGhGvjxNxmEc1Rr4i4jLLH5GzsikxJH3q0Xl6A
         BmizsVxciHgY2ykwPZDuzsD+5n/EI4X4TaVMcrUcFnj6BuiVAAVf6RjjWkovxWLUlqfE
         F+gC3wi6bBSsHAhb0FdY1gi8UMRV5f7YomFxlEQOKQQGEK+0czMMg5eaZynn5Vrif3wK
         aZtg==
X-Forwarded-Encrypted: i=1; AJvYcCXKj5rmd+HPkGNAqcf3/X2D04Kb7ECOXLWaX3ukNkM43x1vtGsb/4zuz9bqnTM+tbNz++2FJmDEjBcXbKXm@vger.kernel.org
X-Gm-Message-State: AOJu0YxaeTzscWoRSdtzIH0l7y+k1+es9GKZhH6+oANEnMMJQJjYlUM4
	eGr1LpZnZE6zH3KP0ojQWqrymwXRbFcLITuWandxVUH864llq+ygJhuVU13f80Bwd8txfEXO+12
	Jeo//bv2y7EDUZS8DCz9UX1N5dLNC9ofYZwhvH3Hi
X-Gm-Gg: ASbGncuFo3+Iqr2M23i6yQq9ezcSpl0ASf3yRbBdANHifU8a8MW10RSWzgKX4yn+Mfn
	GyW6eNxMhmq0LRxnrgqJOsnJllLQT+JZq0cbYOfv3k/6NOXpD4JOrAw6P+KOyoydzlS/oRldP7i
	JiSDPD61KjdMFOcjcGBFsHoGOViI74PEXl65gGcYv4IJXhCeIG0/LoAcKx0jY/zhPbBcE42n935
	f9AAmtXOIDMCLAQrqDvCiXmKKxx+5jJ5IVwTpEm
X-Google-Smtp-Source: AGHT+IHgNq4HFEWMWRcmuIn4waZQ8L7YkPL51NiUKU8DKiTWVp4UcwGMr4KoSHwclm773Kr4g3s26lBtxz0ISLcojo0=
X-Received: by 2002:a17:903:3c30:b0:23c:7be2:59d0 with SMTP id
 d9443c01a7336-23f72bde123mr4371025ad.23.1753105532950; Mon, 21 Jul 2025
 06:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-15-tabba@google.com>
 <505a30a3-4c55-434c-86a5-f86d2e9dc78a@intel.com>
In-Reply-To: <505a30a3-4c55-434c-86a5-f86d2e9dc78a@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 21 Jul 2025 06:45:20 -0700
X-Gm-Features: Ac12FXxBtzFRH5FT7AkkjtuMY19h9DQ20jtILflp5xgXgKiIQbsSMqanr3p0fog
Message-ID: <CAGtprH8swz6GjM57DBryDRD2c6VP=Ayg+dUh5MBK9cg1-YKCDg@mail.gmail.com>
Subject: Re: [PATCH v15 14/21] KVM: x86: Enable guest_memfd mmap for default
 VM type
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 5:22=E2=80=AFAM Xiaoyao Li <xiaoyao.li@intel.com> w=
rote:
>
> On 7/18/2025 12:27 AM, Fuad Tabba wrote:
> > +/*
> > + * CoCo VMs with hardware support that use guest_memfd only for backin=
g private
> > + * memory, e.g., TDX, cannot use guest_memfd with userspace mapping en=
abled.
> > + */
> > +#define kvm_arch_supports_gmem_mmap(kvm)             \
> > +     (IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP) &&   \
> > +      (kvm)->arch.vm_type =3D=3D KVM_X86_DEFAULT_VM)
>
> I want to share the findings when I do the POC to enable gmem mmap in QEM=
U.
>
> Actually, QEMU can use gmem with mmap support as the normal memory even
> without passing the gmem fd to kvm_userspace_memory_region2.guest_memfd
> on KVM_SET_USER_MEMORY_REGION2.
>
> Since the gmem is mmapable, QEMU can pass the userspace addr got from
> mmap() on gmem fd to kvm_userspace_memory_region(2).userspace_addr. It
> works well for non-coco VMs on x86.
>
> Then it seems feasible to use gmem with mmap for the shared memory of
> TDX, and an additional gmem without mmap for the private memory. i.e.,
> For struct kvm_userspace_memory_region, the @userspace_addr is passed
> with the uaddr returned from gmem0 with mmap, while @guest_memfd is
> passed with another gmem1 fd without mmap.
>
> However, it fails actually, because the kvm_arch_suports_gmem_mmap()
> returns false for TDX VMs, which means userspace cannot allocate gmem
> with mmap just for shared memory for TDX.

Why do you want such a usecase to work?

If kvm allows mappable guest_memfd files for TDX VMs without
conversion support, userspace will be able to use those for backing
private memory unless:
1) KVM checks at binding time if the guest_memfd passed during memslot
creation is not a mappable one and doesn't enforce "not mappable"
requirement for TDX VMs at creation time.
2) KVM fetches shared faults through userspace page tables and not
guest_memfd directly.

I don't see value in trying to go out of way to support such a usecase.

>
> SO my question is do we want to support such case?

