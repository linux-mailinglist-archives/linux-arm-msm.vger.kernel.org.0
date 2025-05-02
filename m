Return-Path: <linux-arm-msm+bounces-56591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B6AA7C2C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA8E1C03FD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F7621A433;
	Fri,  2 May 2025 22:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xc8LghqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4AC218E96
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746224997; cv=none; b=WYSfPvNdi69sHGMg1rr9yflCOOf30QovV2221Rm0oDZZ6zjPU0njzfSNnR4JHWwdrpe3n5EUndSa/YAYHqutEmB1y7euk5prFkC0YD6T4d2s95ncMnYxXCJ9rgpdSLxj4XwjuUCxAmup8V7Xk0h3brgcAoB6AiMKjMrO48w36dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746224997; c=relaxed/simple;
	bh=WRprQuXwQYUdAX3VvHmPFZFxoQTSuamF1CjOBaRexEw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yq4zKCMyLM2ZMU8fT2wpa8bBZUNUGSIgykc1KVuJratedgoo6FFUElNBiXgPFpHN1wnuzrlt4A6SsMBpAywr3KDav8bh1qkVQhgTuOmx2QjkRSZxTr487dFaWxhIYgZWYpzbivqgCiEMzyHbECn2YXlOo7rmcerYhooo2fGNgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xc8LghqX; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0b2de67d6aso2611322a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746224995; x=1746829795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEuzKW2y7BbwGxZiqaIrnvqUkmvau3D7fQI+/6GPgqc=;
        b=Xc8LghqXUJI4C1318gfx1lGWLm9BpJXQJFKFnyHJ4QmsxnVmI3ap1lVJvrbL3/OwKB
         w71p1/CGizZy+NpStUh4wcRS8IoTarHnPXhHsz9SnVvmZjSi4BoF9/B6fSnJgIBxSQAf
         BW3w5S1ZXkql74cRGdgR6DcHVXbld4lTHhysmvgsfK2g/3NNkmAcPLmIywJCqMIa82l8
         /5MpSRRW1/5QmeMAfEy4tCxwJW4qhmywXj3aURj4u7fTSDZxk5N1ByNlTQdIDygg122l
         xjAdi/x+REzrPB0icU15Uy9O+kDnAumdTVbKJ6fRdzQsnKo2rM+ddlcv7SX4S/lzHpxb
         UoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746224995; x=1746829795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEuzKW2y7BbwGxZiqaIrnvqUkmvau3D7fQI+/6GPgqc=;
        b=OPetQ5xi65Dw7kjgsJ6qmcs+dmHdoKgDj+uDxuM/mp69Whi/UtEFF4Av1vvF6x/Cxb
         ZRPQ8rBQ7wRjBT1yMnvFMFwwkilwVyGzJxQeYtfxHxlW+D56gZW18RAmgc07+Gkwms2B
         sjOnFlo0GuOafIZnxTLR/5cxWwMQTEPbMbHxosCESV+K9YSeQYhomtBHzc0OEADVRH/K
         K9XWu0ZxhhUzQnr7oUs781wT+3/orFVuq0d4zq3P18PBTfzbf6H3W9fjQn6qiLqRoEys
         +tDgnEkrZBrw4AGq8kQfj4Ht7TQsEp5W1kHo3I+Pi7boFo2AdD7yj20MDwAW+gc8uZEC
         R4ng==
X-Forwarded-Encrypted: i=1; AJvYcCVUIcdW5yeFF7Rf5qJNKwuWp3VkTYbBdz0NOrGJgNjSc+82FbbPwTCfT6Q6Q7oQmE+xAS9iZGyuluxK3O71@vger.kernel.org
X-Gm-Message-State: AOJu0YzzH/qvPGiBwfNT/1xJeHNoqvCJSOmTsSJ4XHsr6kQYG3Ri9lNn
	/KhND9LhP2bmJaDx9l6s69Pr480X/fCdJFbRnGHKDrq/2xCc5N+bN+P73VaSTE4EOieK/0Li15Z
	hc1kUticJDsoZgwif9POE8Q==
X-Google-Smtp-Source: AGHT+IEe8vGqQMSVxj7BjlZnuHTpqW1DIVZRC/VuAU5zKlDI1sbph3EfDhEdBDxNlN3ephIXKE5DhPs2EIiGRazdeA==
X-Received: from pfbgp2.prod.google.com ([2002:a05:6a00:3b82:b0:73f:ff56:7ac2])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:ce4b:b0:1ee:c390:58ac with SMTP id adf61e73a8af0-20e075094e5mr1382934637.34.1746224995154;
 Fri, 02 May 2025 15:29:55 -0700 (PDT)
Date: Fri, 02 May 2025 15:29:53 -0700
In-Reply-To: <20250430165655.605595-9-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-9-tabba@google.com>
Message-ID: <diqzecx6prxa.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Add support for mmap() and fault() for guest_memfd backed memory
> in the host for VMs that support in-place conversion between
> shared and private. To that end, this patch adds the ability to
> check whether the VM type supports in-place conversion, and only
> allows mapping its memory if that's the case.
>
> This patch introduces the configuration option KVM_GMEM_SHARED_MEM,
> which enables support for in-place shared memory.
>
> It also introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> indicates that the host can create VMs that support shared memory.
> Supporting shared memory implies that memory can be mapped when shared
> with the host.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  include/linux/kvm_host.h | 15 ++++++-
>  include/uapi/linux/kvm.h |  1 +
>  virt/kvm/Kconfig         |  5 +++
>  virt/kvm/guest_memfd.c   | 92 ++++++++++++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c      |  4 ++
>  5 files changed, 116 insertions(+), 1 deletion(-)
>
> <snip>

At the guest_memfd call on 2025-05-01, we discussed that if guest_memfd
is created with GUEST_MEMFD_FLAG_SUPPORT_SHARED set, then if
slot->userspace_addr != 0, we would validate that the folio
slot->userspace_addr points to matches up with the folio guest_memfd
would return for the same offset.

I can think of one way to do this validation, which is to call KVM's
hva_to_pfn() function and then call kvm_gmem_get_folio() on the fd and
offset, and then check that the PFNs are equal.

However, that would cause the page to be allocated. Any ideas on how we
could do this validation without allocating the page?

