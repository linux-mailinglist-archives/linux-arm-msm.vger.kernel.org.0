Return-Path: <linux-arm-msm+bounces-57746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C69AB5A2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24EC18908B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2062C086C;
	Tue, 13 May 2025 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rj09FDo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104BA2C0862
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154118; cv=none; b=bAYhctpCdcJcwR7Yn4G7KA7vba+K2Fhy0k86HLdeyTMDZ7SQE6qFEqdnolzNKh42rMnz+uVXwFfM0J1c4KjeSCXGK1kUZjqAsOwvuIZIOJyL2F5EH0BxuzYm0yeO0Q3fN9crjWr6fOuG/jSjIVNDrRk5Lse42BlKYkGM6DvNm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154118; c=relaxed/simple;
	bh=CC8kgOADI8RYHbWzLpyG2qMY6iKytGYMhxvjjgFTexU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TBRSHVLqUeIc1K9zZOKrJ/NTlzKS3Ce/5I3A8bocPIeI5hHJ/H01a2QiFq4Tq2tzF8NqnPv6pvTA3u31d61oNnBcsXdUwVjL1snrRMWWQQmLSGfsYN7OrUyXeM3SwRTW0N54zB3c8VASb0pwombRrNK7C/T3/2I3UF6pOjBPbm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rj09FDo2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso31498485e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154115; x=1747758915; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTV9f3tL7yhwej+ROnqRZnQFKCSKbjeemsj3pSC/+aM=;
        b=Rj09FDo2vSNH8ll9nrJMYzDiRgkKkvNGC2Ybu2s05/qNAgEPjoGgr1n86XTYlBG5BK
         yqxQryvr9PAD3zwr1uhbg9g9IW65q1gkUWFqV0tur4v7x9LJYdtzyR55db6/32+Ap/jq
         +WBeiWqV+Q2j4r97ZCjOmV4Cua3ysi/Qz+nqMEBM16wA0QpFtNCO0KoW4MLjdE8qByQ3
         QS4SyPp03x7CKYwTRgcFrDDhaswcvzQjd5Gb2gqHnTXkEuISsK2XUkk+O2vfFVokLkE1
         G2Z8jIaxGikN66T/nxe6kUNwA21tFIDtThnD40nFjcrZCckwKIsb4lew+Q1fkAASiWsB
         j4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154115; x=1747758915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTV9f3tL7yhwej+ROnqRZnQFKCSKbjeemsj3pSC/+aM=;
        b=Cpslg0AVXDUdi8k6lcZ+Qg7YpAGyKkfzB7WWz1UkPnLDiwsRXjsM4X5vbDgnfv+k7N
         9/RaSuAxgSn3GMflxWfpjgt4YQQHvzX0Rn7KpJMDryDHnzgvNZJdCFij42CeTsHJ0JiZ
         eAQU2VAU/rWK8kn9DcCg0PrCUCxzpJYu6rFMVpke5KT9YlUONxoqhytXm86Ps6FrtxVB
         oC4ienbCKnRwckjk0X+/ITvoz2YVDmoi4AvZR0Utm/UD935yOY1zghJCP2xx7LnRxKE0
         gxP14mXVfqixJJo/SNtOXIPNX2a6KDfPjhMzKXb4fbMJQlU3uAyqeLIDW5DvX1IF/80S
         OKAg==
X-Forwarded-Encrypted: i=1; AJvYcCVkauaA2PwPx65CQqvpHzooe94B5zbzjz4W7rRTnaO0YeiVUQ+fBPUr+40lXIYtMLw0CcMsAO96zX2O7+Wl@vger.kernel.org
X-Gm-Message-State: AOJu0YyycbrOaAgYljV54BTz2PZc1wiUf1m0ukGyh0eNb0kPcKm7n53+
	v/IxDZfIFU3eWIEpxhS07+t4ynY2aHUFcaES25SiEOd9DXBgtUzYB/K70XBsoEpI0Uwvk50PhA=
	=
X-Google-Smtp-Source: AGHT+IF3CKWr5dNaEltZziFd3JjzPKtbdKkHc+WfmpUsuWTg9V5wBHK5NPq3RbL6OwinlprEvGRdG11d/w==
X-Received: from wmbbd22.prod.google.com ([2002:a05:600c:1f16:b0:43b:b74b:9350])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3511:b0:43d:ed:acd5
 with SMTP id 5b1f17b1804b1-442f20d5d72mr168515e9.10.1747154115630; Tue, 13
 May 2025 09:35:15 -0700 (PDT)
Date: Tue, 13 May 2025 17:34:38 +0100
In-Reply-To: <20250513163438.3942405-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513163438.3942405-18-tabba@google.com>
Subject: [PATCH v9 17/17] KVM: selftests: Test guest_memfd same-range validation
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
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
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

Add some selftests for guest_memfd same-range validation, which check
that the slot userspace_addr covers the same range as the memory in
guest_memfd:

+ When slot->userspace_addr is set to 0, there should be no range
  match validation on guest_memfd binding.
+ guest_memfd binding should fail if
    + slot->userspace_addr is not from guest_memfd
    + slot->userspace_addr is mmap()ed from some other file
    + slot->userspace_addr is mmap()ed from some other guest_memfd
    + slot->userspace_addr is mmap()ed from a different range in the
      same guest_memfd
+ guest_memfd binding should succeed if slot->userspace_addr is
  mmap()ed from the same range in the same guest_memfd provided in
  slot->guest_memfd

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 443c49185543..60aaba5808a5 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -197,6 +197,173 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 	close(fd1);
 }
 
+#define GUEST_MEMFD_TEST_SLOT 10
+#define GUEST_MEMFD_TEST_GPA 0x100000000
+
+static void
+test_bind_guest_memfd_disabling_range_match_validation(struct kvm_vm *vm,
+						       int fd)
+{
+	size_t page_size = getpagesize();
+	int ret;
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, page_size, 0,
+					   fd, 0);
+	TEST_ASSERT(!ret,
+		    "setting slot->userspace_addr to 0 should disable validation");
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, 0, 0,
+					   fd, 0);
+	TEST_ASSERT(!ret, "Deleting memslot should work");
+}
+
+static void
+test_bind_guest_memfd_anon_memory_in_userspace_addr(struct kvm_vm *vm, int fd)
+{
+	size_t page_size = getpagesize();
+	void *userspace_addr;
+	int ret;
+
+	userspace_addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, page_size,
+					   userspace_addr, fd, 0);
+	TEST_ASSERT(ret == -1,
+		    "slot->userspace_addr is not from the guest_memfd and should fail");
+}
+
+static void test_bind_guest_memfd_shared_memory_other_file_in_userspace_addr(
+	struct kvm_vm *vm, int fd)
+{
+	size_t page_size = getpagesize();
+	void *userspace_addr;
+	int other_fd;
+	int ret;
+
+	other_fd = memfd_create("shared_memory_other_file", 0);
+	TEST_ASSERT(other_fd > 0, "Creating other file should succeed");
+
+	userspace_addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			      MAP_SHARED, other_fd, 0);
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, page_size,
+					   userspace_addr, fd, 0);
+	TEST_ASSERT(ret == -1,
+		    "slot->userspace_addr is not from the guest_memfd and should fail");
+
+	TEST_ASSERT(!munmap(userspace_addr, page_size),
+		    "munmap() to cleanup should succeed");
+
+	close(other_fd);
+}
+
+static void
+test_bind_guest_memfd_other_guest_memfd_in_userspace_addr(struct kvm_vm *vm,
+							  int fd)
+{
+	size_t page_size = getpagesize();
+	void *userspace_addr;
+	int other_fd;
+	int ret;
+
+	other_fd = vm_create_guest_memfd(vm, page_size * 2,
+					 GUEST_MEMFD_FLAG_SUPPORT_SHARED);
+	TEST_ASSERT(other_fd > 0, "Creating other file should succeed");
+
+	userspace_addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			      MAP_SHARED, other_fd, 0);
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, page_size,
+					   userspace_addr, fd, 0);
+	TEST_ASSERT(ret == -1,
+		    "slot->userspace_addr is not from the guest_memfd and should fail");
+
+	TEST_ASSERT(!munmap(userspace_addr, page_size),
+		    "munmap() to cleanup should succeed");
+
+	close(other_fd);
+}
+
+static void
+test_bind_guest_memfd_other_range_in_userspace_addr(struct kvm_vm *vm, int fd)
+{
+	size_t page_size = getpagesize();
+	void *userspace_addr;
+	int ret;
+
+	userspace_addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			      MAP_SHARED, fd, page_size);
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, page_size,
+					   userspace_addr, fd, 0);
+	TEST_ASSERT(ret == -1,
+		    "slot->userspace_addr is not from the same range and should fail");
+
+	TEST_ASSERT(!munmap(userspace_addr, page_size),
+		    "munmap() to cleanup should succeed");
+}
+
+static void
+test_bind_guest_memfd_same_range_in_userspace_addr(struct kvm_vm *vm, int fd)
+{
+	size_t page_size = getpagesize();
+	void *userspace_addr;
+	int ret;
+
+	userspace_addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+			      MAP_SHARED, fd, page_size);
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, page_size,
+					   userspace_addr, fd, page_size);
+	TEST_ASSERT(!ret,
+		    "slot->userspace_addr is the same range and should succeed");
+
+	TEST_ASSERT(!munmap(userspace_addr, page_size),
+		    "munmap() to cleanup should succeed");
+
+	ret = __vm_set_user_memory_region2(vm, GUEST_MEMFD_TEST_SLOT,
+					   KVM_MEM_GUEST_MEMFD,
+					   GUEST_MEMFD_TEST_GPA, 0, 0,
+					   fd, 0);
+	TEST_ASSERT(!ret, "Deleting memslot should work");
+}
+
+static void test_bind_guest_memfd_wrt_userspace_addr(struct kvm_vm *vm)
+{
+	size_t page_size = getpagesize();
+	int fd;
+
+	if (!vm_check_cap(vm, KVM_CAP_GUEST_MEMFD) ||
+	    !vm_check_cap(vm, KVM_CAP_GMEM_SHARED_MEM))
+		return;
+
+	fd = vm_create_guest_memfd(vm, page_size * 2,
+				   GUEST_MEMFD_FLAG_SUPPORT_SHARED);
+
+	test_bind_guest_memfd_disabling_range_match_validation(vm, fd);
+	test_bind_guest_memfd_anon_memory_in_userspace_addr(vm, fd);
+	test_bind_guest_memfd_shared_memory_other_file_in_userspace_addr(vm, fd);
+	test_bind_guest_memfd_other_guest_memfd_in_userspace_addr(vm, fd);
+	test_bind_guest_memfd_other_range_in_userspace_addr(vm, fd);
+	test_bind_guest_memfd_same_range_in_userspace_addr(vm, fd);
+
+	close(fd);
+}
+
 static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
 			   bool expect_mmap_allowed)
 {
@@ -214,6 +381,7 @@ static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
 	vm = vm_create_barebones_type(vm_type);
 
 	test_create_guest_memfd_multiple(vm);
+	test_bind_guest_memfd_wrt_userspace_addr(vm);
 	test_create_guest_memfd_invalid_sizes(vm, guest_memfd_flags, page_size);
 
 	fd = vm_create_guest_memfd(vm, total_size, guest_memfd_flags);
-- 
2.49.0.1045.g170613ef41-goog


