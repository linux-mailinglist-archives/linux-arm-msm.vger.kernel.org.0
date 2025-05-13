Return-Path: <linux-arm-msm+bounces-57745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA76AB5A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ABFD4A79AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7B02BF3F9;
	Tue, 13 May 2025 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hEHj5P8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610A2BF961
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154116; cv=none; b=PRnNiTML8Hi606NoAsNNqm6pdlFj916s2UbWEwbPfbqNbA9aY48Yva2jdT8z6hXw/52hDoTdPRdU/QJlk5iz+eosQZBaf3QXTb1OmN1jd9osOV85l1HfA793EyI7lF0Uh8eT2McWVNz/7Aj7X78FIOJt5PvxndPjkSO4V4IBLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154116; c=relaxed/simple;
	bh=mKUcMM6xySgMhrCMICHBVOWIY72xumqrKrfQhfRhHEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G/6evRbf8vIvcBjfYGBf2MaJOP9bBbAD+4/dfACLuTndevksgtg9KG1X9CBH33vWGchIEBcSkK36sKB97ttfqtc9jUPWlBYVbEZOrGmaRxHjdb2SORj2AUrHnZCQCZ36HCQQJAb1ZHzLZviqcPI4s3cgH5FMRJ+4cNFAJe2eQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hEHj5P8f; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so28827105e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747154113; x=1747758913; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HplCz6Ki91pQtkmMnDfyPLORTUTrCJV6qBuSdHR42kE=;
        b=hEHj5P8f5Nzvk88UrJ1Hv6EOB/L0ePuyxAWjjJfVgL9bCDBFcCJ5+UF2AIs6ebx8WN
         liLXMFKt7dLSaPsigYlo768FjhqzrkW32cXsuidzDtKFNLuhFsD2uY045l3HvUdG9Y9o
         bWnMGJRnfGkEzs1Ct9F/6qzki7qVDHW4+bU4BQHqUZi1Ubbu92/1+o9hmrx14cOY8dcE
         6APn+f9dLOPuXQUFYYJGZX9P6RT5+688uHDzSHnHajRuOwo0IL5+UaEfyWCVG36v3aRk
         o8bd+dKzC8plI3nQYywh9Jr9Cois2dfVQvnANEjnZCl0RM+Cdmb4uWMVZ8X1arGXK/AY
         /4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747154113; x=1747758913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HplCz6Ki91pQtkmMnDfyPLORTUTrCJV6qBuSdHR42kE=;
        b=dXumXmBJYPoQLJ50eoZr0slvrLO1KfHQ6z77QQ4Fc10uepSWbrb4/YLzK65rfeKKV8
         iv2TmVKpS530x2+xvjTEOHx3E/UjZP9xWmK03ouxV70A4Mxc8QMc/s4ryRKN7Iw3e3v6
         YemdBjATdlyfSqhldIVx8TxMqPUPsFGBafN0IJqXgTCAjbLizTD30CHU8C9z6SSkmOMi
         fZDwkjExkrBhJehKwEqsG3iwTQRjkEKYSwmkCsPsZQBoqUT5x4jGgvlJI+hmHLEsgSPb
         87NSXFZDcovlK5tx2GqpkQxAgcSqs7ob7xW+qHUE8RNLRQtZUnFP+oTtDLT1BGuYiFlV
         BS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7RSGm1ryjEg2HECNZLMc422sSam3UHCKIvBnxzeFVcYzHYHbwbbMyblc03LlC4ZxMTHWE9gg6bdRYlAvG@vger.kernel.org
X-Gm-Message-State: AOJu0YxJN1F8nph1NGA7xDnPor0WIREmbEMkJcqBkzhWnuE4T2NP9DCP
	8exA5TXgBDZVwRiCEs7dHzK7bVlM5Fa7jXZBZTliG/Ep9+Hn3CMIpu50TyxE/MMzzqmNJV4fsA=
	=
X-Google-Smtp-Source: AGHT+IGyG9X0C8EATAee6mw1Vu0OjWxo4VAOW8iVeiL+MppPyCAt6e4o5dM2NyqZvZWkg4NG1ybE313Wog==
X-Received: from wmbdo24.prod.google.com ([2002:a05:600c:6818:b0:43d:56fa:9b95])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4451:b0:43d:526:e0ce
 with SMTP id 5b1f17b1804b1-442d6dc51e8mr133770725e9.21.1747154113359; Tue, 13
 May 2025 09:35:13 -0700 (PDT)
Date: Tue, 13 May 2025 17:34:37 +0100
In-Reply-To: <20250513163438.3942405-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513163438.3942405-17-tabba@google.com>
Subject: [PATCH v9 16/17] KVM: selftests: guest_memfd mmap() test when mapping
 is allowed
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

Expand the guest_memfd selftests to include testing mapping guest
memory for VM types that support it.

Also, build the guest_memfd selftest for arm64.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 145 +++++++++++++++---
 2 files changed, 126 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35..ccf95ed037c3 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -163,6 +163,7 @@ TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
+TEST_GEN_PROGS_arm64 += guest_memfd_test
 TEST_GEN_PROGS_arm64 += get-reg-list
 TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
 TEST_GEN_PROGS_arm64 += memslot_perf_test
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ce687f8d248f..443c49185543 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -34,12 +34,46 @@ static void test_file_read_write(int fd)
 		    "pwrite on a guest_mem fd should fail");
 }
 
-static void test_mmap(int fd, size_t page_size)
+static void test_mmap_allowed(int fd, size_t page_size, size_t total_size)
+{
+	const char val = 0xaa;
+	char *mem;
+	size_t i;
+	int ret;
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmaping() guest memory should pass.");
+
+	memset(mem, val, total_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			page_size);
+	TEST_ASSERT(!ret, "fallocate the first page should succeed");
+
+	for (i = 0; i < page_size; i++)
+		TEST_ASSERT_EQ(mem[i], 0x00);
+	for (; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	memset(mem, val, total_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	ret = munmap(mem, total_size);
+	TEST_ASSERT(!ret, "munmap should succeed");
+}
+
+static void test_mmap_denied(int fd, size_t page_size, size_t total_size)
 {
 	char *mem;
 
 	mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
 	TEST_ASSERT_EQ(mem, MAP_FAILED);
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT_EQ(mem, MAP_FAILED);
 }
 
 static void test_file_size(int fd, size_t page_size, size_t total_size)
@@ -120,26 +154,19 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
 	}
 }
 
-static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
+static void test_create_guest_memfd_invalid_sizes(struct kvm_vm *vm,
+						  uint64_t guest_memfd_flags,
+						  size_t page_size)
 {
-	size_t page_size = getpagesize();
-	uint64_t flag;
 	size_t size;
 	int fd;
 
 	for (size = 1; size < page_size; size++) {
-		fd = __vm_create_guest_memfd(vm, size, 0);
+		fd = __vm_create_guest_memfd(vm, size, guest_memfd_flags);
 		TEST_ASSERT(fd == -1 && errno == EINVAL,
 			    "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
 			    size);
 	}
-
-	for (flag = BIT(0); flag; flag <<= 1) {
-		fd = __vm_create_guest_memfd(vm, page_size, flag);
-		TEST_ASSERT(fd == -1 && errno == EINVAL,
-			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
-			    flag);
-	}
 }
 
 static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
@@ -170,30 +197,108 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 	close(fd1);
 }
 
-int main(int argc, char *argv[])
+static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
+			   bool expect_mmap_allowed)
 {
-	size_t page_size;
+	struct kvm_vm *vm;
 	size_t total_size;
+	size_t page_size;
 	int fd;
-	struct kvm_vm *vm;
 
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+	if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
+		return;
 
 	page_size = getpagesize();
 	total_size = page_size * 4;
 
-	vm = vm_create_barebones();
+	vm = vm_create_barebones_type(vm_type);
 
-	test_create_guest_memfd_invalid(vm);
 	test_create_guest_memfd_multiple(vm);
+	test_create_guest_memfd_invalid_sizes(vm, guest_memfd_flags, page_size);
 
-	fd = vm_create_guest_memfd(vm, total_size, 0);
+	fd = vm_create_guest_memfd(vm, total_size, guest_memfd_flags);
 
 	test_file_read_write(fd);
-	test_mmap(fd, page_size);
+
+	if (expect_mmap_allowed)
+		test_mmap_allowed(fd, page_size, total_size);
+	else
+		test_mmap_denied(fd, page_size, total_size);
+
 	test_file_size(fd, page_size, total_size);
 	test_fallocate(fd, page_size, total_size);
 	test_invalid_punch_hole(fd, page_size, total_size);
 
 	close(fd);
+	kvm_vm_release(vm);
+}
+
+static void test_vm_type_gmem_flag_validity(unsigned long vm_type,
+					    uint64_t expected_valid_flags)
+{
+	size_t page_size = getpagesize();
+	struct kvm_vm *vm;
+	uint64_t flag = 0;
+	int fd;
+
+	if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
+		return;
+
+	vm = vm_create_barebones_type(vm_type);
+
+	for (flag = BIT(0); flag; flag <<= 1) {
+		fd = __vm_create_guest_memfd(vm, page_size, flag);
+
+		if (flag & expected_valid_flags) {
+			TEST_ASSERT(fd > 0,
+				    "guest_memfd() with flag '0x%lx' should be valid",
+				    flag);
+			close(fd);
+		} else {
+			TEST_ASSERT(fd == -1 && errno == EINVAL,
+				    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
+				    flag);
+		}
+	}
+
+	kvm_vm_release(vm);
+}
+
+static void test_gmem_flag_validity(void)
+{
+	uint64_t non_coco_vm_valid_flags = 0;
+
+	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
+		non_coco_vm_valid_flags = GUEST_MEMFD_FLAG_SUPPORT_SHARED;
+
+	test_vm_type_gmem_flag_validity(VM_TYPE_DEFAULT, non_coco_vm_valid_flags);
+
+#ifdef __x86_64__
+	test_vm_type_gmem_flag_validity(KVM_X86_SW_PROTECTED_VM, non_coco_vm_valid_flags);
+	test_vm_type_gmem_flag_validity(KVM_X86_SEV_VM, 0);
+	test_vm_type_gmem_flag_validity(KVM_X86_SEV_ES_VM, 0);
+	test_vm_type_gmem_flag_validity(KVM_X86_SNP_VM, 0);
+	test_vm_type_gmem_flag_validity(KVM_X86_TDX_VM, 0);
+#endif
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+
+	test_gmem_flag_validity();
+
+	test_with_type(VM_TYPE_DEFAULT, 0, false);
+	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM)) {
+		test_with_type(VM_TYPE_DEFAULT, GUEST_MEMFD_FLAG_SUPPORT_SHARED,
+			       true);
+	}
+
+#ifdef __x86_64__
+	test_with_type(KVM_X86_SW_PROTECTED_VM, 0, false);
+	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM)) {
+		test_with_type(KVM_X86_SW_PROTECTED_VM,
+			       GUEST_MEMFD_FLAG_SUPPORT_SHARED, true);
+	}
+#endif
 }
-- 
2.49.0.1045.g170613ef41-goog


