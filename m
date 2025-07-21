Return-Path: <linux-arm-msm+bounces-65896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6AB0C44B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B67B1AA2223
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 12:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E7E2D46B0;
	Mon, 21 Jul 2025 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z+hcYGAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032AB2D5C69
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101723; cv=none; b=cckxXGmn5VWToTVpAGjf2YDT7F6J6MAt9Xk623PQunoeL/0xlRyRQUkgXeExhOqVQjjkJi5WsMSunCDxBlhxJNGvDRHJHx957FMEPlSgw2Y3xJ6JMBfB/qVqgyUIlM0pDtkQXJCoxbQhHSU8hUauGqoMoeJXEgJmBzoP5x2QJOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101723; c=relaxed/simple;
	bh=FH6NOtN844idHZdK0Ri+r5hjSZq61hkeGP1rVZSSTzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpAoQ1R7934BWcGSU6EwzDgirTiPlXEfX183/0TaPvkBWVpwF8QxDwFkkveAL6daAAPDgpGylukd67RsLOZSbEMhXS4wb8NPvfMDtFmAcL/2HepWOAwGmGAB+MJP3cobDBcHqM8PotekPnCf7SaWFhAUOdNY54Dvo8ttnhfjaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z+hcYGAA; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso713391cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753101721; x=1753706521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rIS8RtGx3BM3yP3QF7bgfk7fFz/ztOEu+IhwOpSASZw=;
        b=z+hcYGAApOn4Atj21ZoBMeJvBJ6Rh+Z18KWnig1K+Nm8KAz+ZTLBaeszaSu/mwnSMl
         QvB5AwZA65YtUnD4YjDJ2oqhS/Mr21jPIs5aj1+/44qZVXkACNm9Ivv81cdXcacIgh10
         arZat+Ou17+LMuQtpyhoTyqcoezrEd5R3Bgv5NIcbJg/bTQtrwgF47s3XPOzS/PITixh
         Zzube8MIyFtzzTqPw6pFc5BWJ4fMLNU2RYLvYsNS0iRw+FKZi8D9DsBTmihA6Zujm0cO
         APqRpafLgPqJu/r9BdfUj26xsU5FtjUGiKbuwTykaWqEhvWQX3LzeVcRNj+A5VePS0z+
         MPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753101721; x=1753706521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIS8RtGx3BM3yP3QF7bgfk7fFz/ztOEu+IhwOpSASZw=;
        b=IbnL8TJu4oB8obTVjaO2mNZI9KNohZzYExnk3QWwsRhIhmzjb47fYgtpkqmQWXi7xs
         8y1ErRl61pHrKB+VWIhwOjzeWf/N16S8TcAA/R8aVzMui04TD8pxwEz50ij8JzaFqqO9
         XMFYn0tqacLOIga0c4+kcNNlqWOI3cHke5xQaTmpoIno+H9GYTmWgsKZtzut/STu01eo
         7aqkUPtgPCJszlh9p0n0+vPLuRZJPWibJM4FAVn25j4A3GZuSoZtzYz+XSBnOw3k+w0A
         j4KDwKXXFjq6JenTaCifKMNMSJM8uDDJpo/vklZ7IQa/G1MxNVaoyzRkPa+1hMSEMYRZ
         lShQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVxptjoHkPGFmiQzcF7e1sxRIz+LwUjqlFuWaQ9QaMocaXwiZZAG8ZoDQG7K2uJhFfibqpLGHI+krAvav+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/TaZOhqLr8kXdaSECO4QNtLR2Nre2UhHM+n3p5oOWimLpB9x
	grkwyJqdoSwh/kH4tqW97YNiZTXV2ezltljOuBO38EW3Sb+0qNAkidf8sl/bcKzvZwDWQRFX9mo
	yOSMsPNwNOLQRMkoSrETxd4CgMVMK1VgyBR65ui+2
X-Gm-Gg: ASbGnct91Iew2nQftBubDrLpEpZtZZ5KGIb69hOSnc3cVYMUm/9PLgKLkq7Fl90zrmw
	3gcrc/12KI8vTGyIOhp1Koa3jcM5bmOrkuuBNNvyw7H8X9lLBuHJM+fVCSaBFayjcrIqgXx1wer
	HSX0KFdGj29ywa8COqmS4W6C6uCsfhcWQcHwNBOOFsXCx40K2tm5CyIiXqTx5WCD/BsHuHulolR
	t5qPM4=
X-Google-Smtp-Source: AGHT+IHICvOHUdMlgc+MwG4TRplOdK0+NsvYnQSN7a8Q94vN9K19Iv4njTMi3Vqu6DpIpL1LZ7OPxQ3JKDjs7jxoPb4=
X-Received: by 2002:a05:622a:8c19:b0:4ab:54d2:3666 with SMTP id
 d75a77b69052e-4abc2b37a63mr6227901cf.25.1753101720495; Mon, 21 Jul 2025
 05:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-15-tabba@google.com>
 <505a30a3-4c55-434c-86a5-f86d2e9dc78a@intel.com>
In-Reply-To: <505a30a3-4c55-434c-86a5-f86d2e9dc78a@intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 21 Jul 2025 13:41:23 +0100
X-Gm-Features: Ac12FXwLO_dne2w1dGUUYLFktGe9s64wr0cEuXbxIsFFA8S3s8yrvlEfzoVjAQI
Message-ID: <CA+EHjTxUpLU3-3dQY8O_SoQCmA8LR1y6w759xfYwisfxHec4aQ@mail.gmail.com>
Subject: Re: [PATCH v15 14/21] KVM: x86: Enable guest_memfd mmap for default
 VM type
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Xiaoyao,

On Mon, 21 Jul 2025 at 13:22, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>
> On 7/18/2025 12:27 AM, Fuad Tabba wrote:
> > +/*
> > + * CoCo VMs with hardware support that use guest_memfd only for backing private
> > + * memory, e.g., TDX, cannot use guest_memfd with userspace mapping enabled.
> > + */
> > +#define kvm_arch_supports_gmem_mmap(kvm)             \
> > +     (IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP) &&   \
> > +      (kvm)->arch.vm_type == KVM_X86_DEFAULT_VM)
>
> I want to share the findings when I do the POC to enable gmem mmap in QEMU.
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
>
> SO my question is do we want to support such case?

Thanks for sharing this. To answer your question, no, we explicitly do
not want to support this feature for TDX, since TDX uses a completely
different paradigm.

Cheers,
/fuad

