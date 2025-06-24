Return-Path: <linux-arm-msm+bounces-62195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC9AE61BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40CF84A75CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 10:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E795727C17E;
	Tue, 24 Jun 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkLJ6WiU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360A224882
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759415; cv=none; b=IE2uCW9ViWMbFvVUFo0URwWtdiNmGHodTmHtDg+aqPBUowHHBSDWB2rRn6w1rnx+Le09PvDGpuWyK2kKf5QS2YHYMdzdXcyw/RbMXG34rZ2KVpz+Iz9+4emVtOW3aplfyEdpvu3S8+oIFNF0APjTyr17DxcdmSA1yhFeTBlJbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759415; c=relaxed/simple;
	bh=KsoThbVuC03tvHvNTihda3ndo5AaudSgCC/2MFyVqhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdQMpLILkuO1y5cMfPbb/4uV1ZBxdhN2aA6jIZqQW/vf/a3rKy+E4jpWotXOUcC0K7nDS2e29goo+xJiAnEZ5E4S5wquHq1AmLhfCPq1EPKE6LxsJ6iQQYoQRKGOE6tatcWDdId0/uhs1FXQKsxtmtWUoI8reF3mu/+rBQ+Rcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkLJ6WiU; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo285411cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 03:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750759413; x=1751364213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gMW0MMECznJialVQa7oe4n9ne+tvTZu0qfqDN/JkXfs=;
        b=nkLJ6WiUp1JJOFeeGno11Z4oLtN/3YMdbKHteeeYDQfEXKt2LAgirE9KrksBjjPfU3
         mJk4pDwKUAAIVGoUC9UYBqw+4uaa3cAahXD/aPPa8JJm0hDHtGrDEZJf1ZuU3gBtfJ9e
         ujvtn1g+FCtqpu+/7TNxAPrUzNT9NY36vtP5epJicXLFAjYXXwbPc42k65v/tI+BeS2E
         Q9H3KNQKKpqJkF5dlJYWTRCEvf+3LD1nf9n108TaVc4Loh1ko6vhY+Vj+9in13qWIowY
         M8tVqfpxPQnXx1BmAjcpFvgcAOqh1tzTmmC0gr0mcQyGStSO099wW5X7cM6PYxochunI
         4qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759413; x=1751364213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMW0MMECznJialVQa7oe4n9ne+tvTZu0qfqDN/JkXfs=;
        b=Fa085eliprzFgaSnEicvcokIyoWO/a1tXIhXuKaTR6uxaxMF9qEwqcJpztljX3ecAT
         7ht1FQPnVmqIstvM/tIk5dQuASOiOilNEnYZ+tQ23oKDF48iJr6J5yT6Yz3VOWQovaVR
         T4/uQJTzF8FY3IjFZi2MvFtRdD7Vet4RNfZ7SUX3JkpIf8xT4V5uqFnY1znSccyr3AAK
         MT1oS5frAH/p5T2auAutnWUrKn17rTHbbOK4/gfttK9dLF8CUW29ygbGDsxn2j2H8BU/
         sEhHhyrmGuKSVu5b7bUtoIrdIbYbw8ylCen70rDYyNpCRVD8oHayBt5N1xlmsikmz/YA
         uDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkpc8A8VBVDazEY+ZtMkVnpuMGiJibgFK1Ph7NeQNYgZuvI0EAk3xhmrEXbjIs5PuQWdyLGkrcJVJLSVPm@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMDeVTu+Ccma4DMQdZl28Z6JO3NnFOsyaJvXtUM5AH6jJ8iUH
	06DqX1bc5jAcUWvkquCbBoBrbwx1JxKmmn1AAUo4rTlcFPtKlPGQVb8Z4qJ2aedUJFQuzX2iK7z
	TskUp4DUvhXnxURATPveaODf36fxOqw6i/loNBX9m
X-Gm-Gg: ASbGncs8CfbVKv7a0z29gmSrxEZ3jM3lC0wE3qsViGXFK9CZ0KMS0GbucPtT5Cdc5cP
	5oV1f99Gk4MBk9EA+01nCkKCj5h4HG3PltUEO7uhhMTzXqtpZZ6KZtrKv1tCAsUP4J+7UxHOo7H
	FfXXUOdqK282xXsC9nXzyO4+XxmpeTy/L2KEKnxG462/BFAKM0kQ2lvWSI1t590v4DQsYlffwn
X-Google-Smtp-Source: AGHT+IHT3LkZ35Y5UJEPwLhq2j0BxxOtoLWYptCtFgQuare8SnS0uBLCBrYuYOhTXMb3sDYFZdMfbm/xeJe2fFK+8kI=
X-Received: by 2002:a05:622a:c3:b0:494:763e:d971 with SMTP id
 d75a77b69052e-4a7b171e2aemr2408971cf.23.1750759412503; Tue, 24 Jun 2025
 03:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <80e062dd-2445-45a6-ba4a-8f5fe3286909@redhat.com>
In-Reply-To: <80e062dd-2445-45a6-ba4a-8f5fe3286909@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 24 Jun 2025 11:02:56 +0100
X-Gm-Features: Ac12FXyaJ6fQiRli6N-G9Ic58vssGb1-G3P5sN6L-3mpP1G-97NTKumDYqIFAvc
Message-ID: <CA+EHjTx2MUq98=j=5J+GwSJ1gd7ax-RrpS8WhEJg4Lk9_USUmA@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] KVM: Mapping guest_memfd backed memory at the
 host for software protected VMs
To: David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
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

Hi,

Before I respin this, I thought I'd outline the planned changes for
V13, especially since it involves a lot of repainting. I hope that by
presenting this first, we could reduce the number of times I'll need
to respin it.

    In struct kvm_arch: add bool supports_gmem instead of renaming
has_private_mem

    The guest_memfd flag GUEST_MEMFD_FLAG_SUPPORT_SHARED should be
called GUEST_MEMFD_FLAG_MMAP

    The memslot internal flag KVM_MEMSLOT_SUPPORTS_GMEM_SHARED should
be called KVM_MEMSLOT_SUPPORTS_GMEM_MMAP

    kvm_arch_supports_gmem_shared_mem() should be called
kvm_arch_supports_gmem_mmap()

    kvm_gmem_memslot_supports_shared() should be called
kvm_gmem_memslot_supports_mmap()

    kvm_gmem_fault_shared(struct vm_fault *vmf) should be called
kvm_gmem_fault_user_mapping(struct vm_fault *vmf)

    The capability KVM_CAP_GMEM_SHARED_MEM should be called KVM_CAP_GMEM_MMAP

    The Kconfig CONFIG_KVM_GMEM_SHARED_MEM should be called
CONFIG_KVM_GMEM_SUPPORTS_MMAP

Also, what (unless you disagree) will stay the same as V12:

    Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GMEM: Since private
implies gmem, and we will have additional flags for MMAP support

    Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE

    Rename  kvm_slot_can_be_private() to kvm_slot_has_gmem(): since
private does imply that it has gmem

Thanks,
/fuad



On Thu, 12 Jun 2025 at 18:39, David Hildenbrand <david@redhat.com> wrote:
>
> On 11.06.25 15:33, Fuad Tabba wrote:
> > Main changes since v11 [1]:
> > - Addressed various points of feedback from the last revision.
> > - Rebased on Linux 6.16-rc1.
>
> Nit: In case you have to resend, it might be worth changing the subject
> s/software protected/non-CoCo/ like you did in patch #12.
>
> --
> Cheers,
>
> David / dhildenb
>

