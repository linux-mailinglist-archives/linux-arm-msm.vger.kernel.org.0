Return-Path: <linux-arm-msm+bounces-53063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366EA79869
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 00:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32FE18908FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 22:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20281F419A;
	Wed,  2 Apr 2025 22:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQSsI7dU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579891F3B82
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743634050; cv=none; b=Pihi7Xm/2Sl90W+dXm7DtpEP0PANp/CxMXoU06/i1Pq53qdpRxtu9fOjf5vZs+zrnv9PdxX94AljVe5zYVziLLH0tPcxezg+XDEn5jA5HTTOxqrtmWAVfhHHbuwPLX7eQdhfRxrWnB6gWT73nO9LfHua1WQhYbK1iIQ+5KnLhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743634050; c=relaxed/simple;
	bh=Y5YXQDmsQFY5dDhG2/pon3c/QV6jy1DhcmdcDYnTBNQ=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=HEg1ml9ir35UFxflCGcPw4UoHnNmzYGs8oFzyrgha/tRsPyxeHBlwbN/O7F5MV7NKBZ5w27a1evPuABjfSuX8qEy6svvn+vVKLFgWYT6A4VZtszfi2wStKk+LQNFpXuW7gHHqvLb90siz6qqqoJyWuMmMZlCjqHNatFbUi1QNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQSsI7dU; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af248209ba4so207873a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743634048; x=1744238848; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObAJzB7g55gBf+CLcD7oa8KI2t1g7ZS4FYBSRbK85tw=;
        b=SQSsI7dUldTs88Lk4yCnpxfvMxXdxBNw6lkrQiQx8GP/4F7oWZ7TIUCgaak2gCGfzz
         kzZbAu/sy7coRMOpLleM6+fGLcjkiKoQdTGX5KEMwVgK5Q0fmjxBsCXR6/jzb7bKNdCO
         pyLxgLrxnSPV+3BD3VrQUZ4iYlLlhGmeLMP6Ps0vXLLAtut/NQdBYnp5CaHm1m4UkhIc
         E+NQqzVHp0YA1XoS39dnIMteP7837X2bFhRAm/xZEV8eD7WV3M9uvyqatVUYd5VZRHnE
         gCYtQhgq8PRPGxFd6Ys2Nd9P7HtyaUoIufXhfHKMcL1QeOsGEcADl9kUkmN23yHa44ll
         +JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743634048; x=1744238848;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObAJzB7g55gBf+CLcD7oa8KI2t1g7ZS4FYBSRbK85tw=;
        b=EomHJ54dEGvqsWlwh00bmHIjk25rFMQPK6/mdQXu0ALSo5hLeKYpGJBDbhQY6PG2/6
         VBTkDXNV0lWNoM5SJMCSx4AKAQRFr8aJoIqJW+4oxUeocsXQ8ivT6ej5sN5xaRfkbk9e
         SYc+ScxQVI0PYSAW/mA24YmYcAsVgJoPhVidOF6sMDWDGrO6wuqYHhDsUriNCkuQHgIz
         hUNYWnpXyVuvQ40fiQFG1bUUI4xN1ecij7DHHcnT9kUQvA97YXClG6ms8lXc6u1Bk6ZA
         WVe5KQDogSiw3MYgSrg/aLdLu4ws3IY8f8eJqa1aqMFyUxAxSTMcEYSFPio3tvUk+PH8
         uiNg==
X-Forwarded-Encrypted: i=1; AJvYcCUHxOxqLsfkzQr3FY/8o45e2wZ+mUwaeLyS+AglMeHdRRyeqsE9USAuYpY5zdmB8d3gmmo+Owx5wucs0tHn@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOsBkFJkqtxkRDLLFD6GtH6CluRxH4cxW+8QGwRNP8hqwOmzE
	OxC7ETzdwSLVleQdNw2OOGhfZFhqxZr7oNwDn9Qm5TqcmY53b+o7WzQGXZ/iGo1O6SI9sh9MI8A
	ev2laFlyWUHcdXCnHSC8DHA==
X-Google-Smtp-Source: AGHT+IECpxYjzNO2H7vuV41cvniiuOYlb3wjYhLlVNYIV5Lj37fPJupYViCXCDaAjwRJoswPZh+5gMJ/YtBuQaMoJA==
X-Received: from pjyr13.prod.google.com ([2002:a17:90a:e18d:b0:2fc:1158:9fe5])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b8b:b0:2fe:955d:cdb1 with SMTP id 98e67ed59e1d1-3057de29f2fmr48457a91.23.1743634048484;
 Wed, 02 Apr 2025 15:47:28 -0700 (PDT)
Date: Wed, 02 Apr 2025 15:47:27 -0700
In-Reply-To: <20250328153133.3504118-8-tabba@google.com> (message from Fuad
 Tabba on Fri, 28 Mar 2025 15:31:33 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzy0wimb9c.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v7 7/7] KVM: guest_memfd: Add a guest_memfd() flag to
 initialize it as shared
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Not all use cases require guest_memfd() to be shared with the host when
> first created. Add a new flag, GUEST_MEMFD_FLAG_INIT_SHARED, which when
> set on KVM_CREATE_GUEST_MEMFD initializes the memory as shared with the
> host, and therefore mappable by it. Otherwise, memory is private until
> explicitly shared by the guest with the host.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  Documentation/virt/kvm/api.rst                 |  4 ++++
>  include/uapi/linux/kvm.h                       |  1 +
>  tools/testing/selftests/kvm/guest_memfd_test.c |  7 +++++--
>  virt/kvm/guest_memfd.c                         | 12 ++++++++++++
>  4 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 2b52eb77e29c..a5496d7d323b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6386,6 +6386,10 @@ most one mapping per page, i.e. binding multiple memory regions to a single
>  guest_memfd range is not allowed (any number of memory regions can be bound to
>  a single guest_memfd file, but the bound ranges must not overlap).
>  
> +If the capability KVM_CAP_GMEM_SHARED_MEM is supported, then the flags field
> +supports GUEST_MEMFD_FLAG_INIT_SHARED, which initializes the memory as shared
> +with the host, and thereby, mappable by it.
> +
>  See KVM_SET_USER_MEMORY_REGION2 for additional details.
>  
>  4.143 KVM_PRE_FAULT_MEMORY
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 117937a895da..22d7e33bf09c 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1566,6 +1566,7 @@ struct kvm_memory_attributes {
>  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>  
>  #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
> +#define GUEST_MEMFD_FLAG_INIT_SHARED		(1UL << 0)
>  
>  struct kvm_create_guest_memfd {
>  	__u64 size;
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 38c501e49e0e..4a7fcd6aa372 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -159,7 +159,7 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
>  static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
>  {
>  	size_t page_size = getpagesize();
> -	uint64_t flag;
> +	uint64_t flag = BIT(0);
>  	size_t size;
>  	int fd;
>  
> @@ -170,7 +170,10 @@ static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
>  			    size);
>  	}
>  
> -	for (flag = BIT(0); flag; flag <<= 1) {
> +	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
> +		flag = GUEST_MEMFD_FLAG_INIT_SHARED << 1;
> +
> +	for (; flag; flag <<= 1) {

This would end up shifting the GUEST_MEMFD_FLAG_INIT_SHARED flag for
each loop.

>  		fd = __vm_create_guest_memfd(vm, page_size, flag);
>  		TEST_ASSERT(fd == -1 && errno == EINVAL,
>  			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index eec9d5e09f09..32e149478b04 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1069,6 +1069,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  		goto err_gmem;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&
> +	    (flags & GUEST_MEMFD_FLAG_INIT_SHARED)) {
> +		err = kvm_gmem_offset_range_set_shared(file_inode(file), 0, size >> PAGE_SHIFT);
> +		if (err) {
> +			fput(file);
> +			goto err_gmem;
> +		}
> +	}
> +
>  	kvm_get_kvm(kvm);
>  	gmem->kvm = kvm;
>  	xa_init(&gmem->bindings);
> @@ -1090,6 +1099,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	u64 flags = args->flags;
>  	u64 valid_flags = 0;
>  
> +	if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
> +		valid_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +
>  	if (flags & ~valid_flags)
>  		return -EINVAL;

