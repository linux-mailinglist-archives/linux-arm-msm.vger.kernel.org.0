Return-Path: <linux-arm-msm+bounces-58838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D20CABEC86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A952A1724E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 06:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D35B23370F;
	Wed, 21 May 2025 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KUP0mGI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E822D7A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810435; cv=none; b=lys/8okWYG798iG0m6PHalMgl+qhtviaVktL2NlLvjWMrAy/c1nm3sTotuVmQ4VuoP3mkt8zfgX/kfV5MG0hxZPu9iN9pQKdPxi8bla/+cWz7U66xZvXbArhM8bEneKgfG6fAEUrRQu02LttwyrJIEF7m+KjH5YqqYcWvJ1KFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810435; c=relaxed/simple;
	bh=n7Ovsp2NLMYxswbpIYnDybpONQE6mgb5rHa2ZAGOppA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXQDDDGbny1gOiaOGW4koop1RBFLCu13w/Syla21NZtV8En+etCWkG2iMiYhPWMYA7j5F3HG6H+n3hb7w3lKa9il3dpT5X0sBACDrFgst3Z59YKD+RoktfgWKDwzhSTMnF+kEHs6xNhKhLfbmeD87GhrqSgHTW6gmxxEIDIpXsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KUP0mGI3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747810431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbErVy9IEKX7lpyD0YcZLOsPdHblgXbS97dB37YVVZM=;
	b=KUP0mGI3H6NnYgMYwObW8pT1JPcVkHkhbbXc8APXvLE/ynt0m90RnPU7lqrPOzfaWfbEvZ
	8+qy4vyGb4U1lDvVc2Ztp0pkYDRGNi7n8MsXmWOHXzh2/KDR76tb++P3EHYsy5k29lUzSR
	0yolOKBfnLPGyH64jf4NQrxk46e8LaE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-TRvw9C2lMnm3Zyg-uJdR4g-1; Wed, 21 May 2025 02:53:50 -0400
X-MC-Unique: TRvw9C2lMnm3Zyg-uJdR4g-1
X-Mimecast-MFC-AGG-ID: TRvw9C2lMnm3Zyg-uJdR4g_1747810429
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e3cfc144so44332135ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 23:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747810429; x=1748415229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbErVy9IEKX7lpyD0YcZLOsPdHblgXbS97dB37YVVZM=;
        b=d7PjSdS/FedHtvc2EU8fLDiuX2UOxc2NIj9thzpD8O37mKKvIUw9HBv9OYe0ZJLeyB
         QOf0+mqMukNzvA+lch5hIrw4p1AoPo9d1G6K8uKk59+CEo/DCNACiNiLB6q0qBLPtlQw
         HqC8Ssm0qzv4/Lwzg08M2OjlvXTowHruSFlUzDNGEMXz1jQrKnOwfjbXBiAFUnvyCFHL
         DvQw7JfWidLl1Y8Q9NmrHc5lhrQpkXEDcVJLS+fhxwpSf/uJYHr594ldgjFe+o77ahAr
         t0RQv3mnnLTaNOwb5LA9uDO5M9C83nxanqsfMoJfnszeTXWbM2W8a75Fh87YexVFLSQS
         keOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4NSfF+4X+n94dcLcv56GFJ9/tv/NI5NdpPYif1Lr4uGgYpTFXqheghuPU4pTFwKAia6vmGWnTz7jZ3/P4@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkWz9cLGgzXVnNl+mqp52f28MrSDGUwAfGW1e8h29TYc3T+Uf
	336NAdiXlZ7u1tcnZAQibbFRaq8X0NwpidOk1ZFtgI6MZO9P0d21l3SX+QhKyvD7zNrkTFznts9
	kHQu3NSsreUf2Sp7llVYVuAL3uW3qafTt9BOseqNoZuFKaycwn9ckB2YZEAYy0qgbNQo=
X-Gm-Gg: ASbGnctbVhzYJNe3xzzVnkqa/QR1O/Aomrgt4tpbV1+eL9wuQbcKNJPI5R8mlcJcYev
	rznRqiFZuiDGCwX0nR2qodMX4lArAxX5TkrWiFSI1v3A8Bbhx2KyoVZgNdkmCgvzKmafzxPbWV6
	JurQGJxscyj7Ii7YGoGPzcZMxtldOjp28w3CFZtc8CpXpUziLSURkcJLaibZSYV5CtRcJFC5hlt
	F+M1IS/r2R5xGgDUCdnp280kAioEfRtTDZBi6DNBrK2o8LClcuxyek/In6+vPBQoQuOJsf7ztx6
	9YxvudNM3V82
X-Received: by 2002:a17:902:ce8f:b0:224:1001:6787 with SMTP id d9443c01a7336-231d43d56e3mr276720745ad.4.1747810428829;
        Tue, 20 May 2025 23:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYlr0v4xN3raRRN0GaiffcawT6n84gcgurQeIRHyvaB+F+BPtLUhdx8zfTLDycN97zE3b3mw==
X-Received: by 2002:a17:902:ce8f:b0:224:1001:6787 with SMTP id d9443c01a7336-231d43d56e3mr276720505ad.4.1747810428390;
        Tue, 20 May 2025 23:53:48 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e26d83basm83576515ad.6.2025.05.20.23.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:53:47 -0700 (PDT)
Message-ID: <7bbe7aea-3b17-444b-8cd3-c5941950307c@redhat.com>
Date: Wed, 21 May 2025 16:53:27 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/17] KVM: selftests: guest_memfd mmap() test when
 mapping is allowed
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250513163438.3942405-1-tabba@google.com>
 <20250513163438.3942405-17-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-17-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> Expand the guest_memfd selftests to include testing mapping guest
> memory for VM types that support it.
> 
> Also, build the guest_memfd selftest for arm64.
> 
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>   .../testing/selftests/kvm/guest_memfd_test.c  | 145 +++++++++++++++---
>   2 files changed, 126 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index f62b0a5aba35..ccf95ed037c3 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -163,6 +163,7 @@ TEST_GEN_PROGS_arm64 += access_tracking_perf_test
>   TEST_GEN_PROGS_arm64 += arch_timer
>   TEST_GEN_PROGS_arm64 += coalesced_io_test
>   TEST_GEN_PROGS_arm64 += dirty_log_perf_test
> +TEST_GEN_PROGS_arm64 += guest_memfd_test
>   TEST_GEN_PROGS_arm64 += get-reg-list
>   TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
>   TEST_GEN_PROGS_arm64 += memslot_perf_test
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index ce687f8d248f..443c49185543 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -34,12 +34,46 @@ static void test_file_read_write(int fd)
>   		    "pwrite on a guest_mem fd should fail");
>   }
>   
> -static void test_mmap(int fd, size_t page_size)
> +static void test_mmap_allowed(int fd, size_t page_size, size_t total_size)
> +{
> +	const char val = 0xaa;
> +	char *mem;
> +	size_t i;
> +	int ret;
> +
> +	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +	TEST_ASSERT(mem != MAP_FAILED, "mmaping() guest memory should pass.");
> +
> +	memset(mem, val, total_size);
> +	for (i = 0; i < total_size; i++)
> +		TEST_ASSERT_EQ(mem[i], val);
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
> +			page_size);
> +	TEST_ASSERT(!ret, "fallocate the first page should succeed");
> +
> +	for (i = 0; i < page_size; i++)
> +		TEST_ASSERT_EQ(mem[i], 0x00);
> +	for (; i < total_size; i++)
> +		TEST_ASSERT_EQ(mem[i], val);
> +
> +	memset(mem, val, total_size);
> +	for (i = 0; i < total_size; i++)
> +		TEST_ASSERT_EQ(mem[i], val);
> +

The last memset() and check the resident values look redudant because same
test has been covered by the first memset(). If we really want to double
confirm that the page-cache is writabble, it would be enough to cover the
first page. Otherwise, I guess this hunk of code can be removed :)

	memset(mem, val, page_size);
	for (i = 0; i < page_size; i++)
		TEST_ASSERT_EQ(mem[i], val);

> +	ret = munmap(mem, total_size);
> +	TEST_ASSERT(!ret, "munmap should succeed");
> +}
> +
> +static void test_mmap_denied(int fd, size_t page_size, size_t total_size)
>   {
>   	char *mem;
>   
>   	mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>   	TEST_ASSERT_EQ(mem, MAP_FAILED);
> +
> +	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +	TEST_ASSERT_EQ(mem, MAP_FAILED);
>   }
>   
>   static void test_file_size(int fd, size_t page_size, size_t total_size)
> @@ -120,26 +154,19 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
>   	}
>   }
>   
> -static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> +static void test_create_guest_memfd_invalid_sizes(struct kvm_vm *vm,
> +						  uint64_t guest_memfd_flags,
> +						  size_t page_size)
>   {
> -	size_t page_size = getpagesize();
> -	uint64_t flag;
>   	size_t size;
>   	int fd;
>   
>   	for (size = 1; size < page_size; size++) {
> -		fd = __vm_create_guest_memfd(vm, size, 0);
> +		fd = __vm_create_guest_memfd(vm, size, guest_memfd_flags);
>   		TEST_ASSERT(fd == -1 && errno == EINVAL,
>   			    "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
>   			    size);
>   	}
> -
> -	for (flag = BIT(0); flag; flag <<= 1) {
> -		fd = __vm_create_guest_memfd(vm, page_size, flag);
> -		TEST_ASSERT(fd == -1 && errno == EINVAL,
> -			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> -			    flag);
> -	}
>   }
>   
>   static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
> @@ -170,30 +197,108 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
>   	close(fd1);
>   }
>   
> -int main(int argc, char *argv[])
> +static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
> +			   bool expect_mmap_allowed)
>   {
> -	size_t page_size;
> +	struct kvm_vm *vm;
>   	size_t total_size;
> +	size_t page_size;
>   	int fd;
> -	struct kvm_vm *vm;
>   
> -	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> +	if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
> +		return;
>   

The check seems incorrect for aarch64 since 0 is always returned from
kvm_check_cap() there. The test is skipped for VM_TYPE_DEFAULT on aarch64.
So it would be something like below:

	#define VM_TYPE_DEFAULT		0

	if (vm_type != VM_TYPE_DEFAULT &&
	    !(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
		return;

>   	page_size = getpagesize();
>   	total_size = page_size * 4;
>   
> -	vm = vm_create_barebones();
> +	vm = vm_create_barebones_type(vm_type);
>   
> -	test_create_guest_memfd_invalid(vm);
>   	test_create_guest_memfd_multiple(vm);
> +	test_create_guest_memfd_invalid_sizes(vm, guest_memfd_flags, page_size);
>   
> -	fd = vm_create_guest_memfd(vm, total_size, 0);
> +	fd = vm_create_guest_memfd(vm, total_size, guest_memfd_flags);
>   
>   	test_file_read_write(fd);
> -	test_mmap(fd, page_size);
> +
> +	if (expect_mmap_allowed)
> +		test_mmap_allowed(fd, page_size, total_size);
> +	else
> +		test_mmap_denied(fd, page_size, total_size);
> +
>   	test_file_size(fd, page_size, total_size);
>   	test_fallocate(fd, page_size, total_size);
>   	test_invalid_punch_hole(fd, page_size, total_size);
>   
>   	close(fd);
> +	kvm_vm_release(vm);
> +}
> +
> +static void test_vm_type_gmem_flag_validity(unsigned long vm_type,
> +					    uint64_t expected_valid_flags)
> +{
> +	size_t page_size = getpagesize();
> +	struct kvm_vm *vm;
> +	uint64_t flag = 0;
> +	int fd;
> +
> +	if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
> +		return;

Same as above

> +
> +	vm = vm_create_barebones_type(vm_type);
> +
> +	for (flag = BIT(0); flag; flag <<= 1) {
> +		fd = __vm_create_guest_memfd(vm, page_size, flag);
> +
> +		if (flag & expected_valid_flags) {
> +			TEST_ASSERT(fd > 0,
> +				    "guest_memfd() with flag '0x%lx' should be valid",
> +				    flag);
> +			close(fd);
> +		} else {
> +			TEST_ASSERT(fd == -1 && errno == EINVAL,
> +				    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> +				    flag);

It's more robust to have:

			TEST_ASSERT(fd < 0 && errno == EINVAL, ...);

> +		}
> +	}
> +
> +	kvm_vm_release(vm);
> +}
> +
> +static void test_gmem_flag_validity(void)
> +{
> +	uint64_t non_coco_vm_valid_flags = 0;
> +
> +	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
> +		non_coco_vm_valid_flags = GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> +
> +	test_vm_type_gmem_flag_validity(VM_TYPE_DEFAULT, non_coco_vm_valid_flags);
> +
> +#ifdef __x86_64__
> +	test_vm_type_gmem_flag_validity(KVM_X86_SW_PROTECTED_VM, non_coco_vm_valid_flags);
> +	test_vm_type_gmem_flag_validity(KVM_X86_SEV_VM, 0);
> +	test_vm_type_gmem_flag_validity(KVM_X86_SEV_ES_VM, 0);
> +	test_vm_type_gmem_flag_validity(KVM_X86_SNP_VM, 0);
> +	test_vm_type_gmem_flag_validity(KVM_X86_TDX_VM, 0);
> +#endif
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> +
> +	test_gmem_flag_validity();
> +
> +	test_with_type(VM_TYPE_DEFAULT, 0, false);
> +	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM)) {
> +		test_with_type(VM_TYPE_DEFAULT, GUEST_MEMFD_FLAG_SUPPORT_SHARED,
> +			       true);
> +	}
> +
> +#ifdef __x86_64__
> +	test_with_type(KVM_X86_SW_PROTECTED_VM, 0, false);
> +	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM)) {
> +		test_with_type(KVM_X86_SW_PROTECTED_VM,
> +			       GUEST_MEMFD_FLAG_SUPPORT_SHARED, true);
> +	}
> +#endif
>   }

Thanks,
Gavin


