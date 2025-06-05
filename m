Return-Path: <linux-arm-msm+bounces-60340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C107EACF349
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CC2E1769E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C4727585E;
	Thu,  5 Jun 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y07BG/x6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21A1F4CBB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137923; cv=none; b=VhPSAfBZzo5aF9cr0BVzvY20nhs6Ksw2FvXgpOFs+eqnfC6TJA57a/09VJ/A0VCheP/vLZO0mqmnG2aCveZH8fQ1SM96lVTL932j1RDkFdxalc+5hoZflZXE1dDVyG+ewZ8mM/G6elyqZSVxPHqnDBgO2CL1SB0fCJcN2h7RqiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137923; c=relaxed/simple;
	bh=5Uk6frMZlFNE7OyXazOxR4rvlk6GhJYW9brmvCHnlTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UuDWjhiceZXtVu3XSVM2Hl9nCTJsrE64z56xPEq3Gbr9j/raob43ptFJU4uUnsA8x24w5IzeLcK/WinPLlSbV3++HZWiEBbml3/zGp0wK/imQr2WyI2YjSyKNrNPjJNG0wW2GY95Xi+K2y5Uwp1INlaynAtgrxWXHK3u6Se+uQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y07BG/x6; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso539109f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137920; x=1749742720; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQAb+OhtwbC9L7HmigdO6nKvxjGiiyUfyog+Pwa37w=;
        b=Y07BG/x6BWqDFk5c5uO9Kyp5wbM7y+6dAka+7rhX7Fj3X/b+Yx4zq5PSSew/uLEy5c
         RhzV9e1ySli9S7oFywkFb8C9iHupOXhg+ojWhLo5x8JcR7a1zRq9IP23hs9FQkw3Jxqx
         ZjaZhqx6aXwfBfR+8jUiCbx8WRE5GLEhsUutofXIqEhItROhAy/HRjQkkMxMCJnsXvoi
         46ecSIdClhnUUldQqlnQ9Otvz6rGgW5LoaE/2b7ks9Hib49hNGA/l1G5dZTpjYTvKuZF
         jCERBHKKOQWFRAhxGwCG314CqZhYzXQbXEc1SeqMv7t4ok2TDGhcku7Xlr6I2vAnnKdM
         D7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137920; x=1749742720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQAb+OhtwbC9L7HmigdO6nKvxjGiiyUfyog+Pwa37w=;
        b=kBDrqEwy+FLTzqvKV0XqtKNPxQVt1JrXs8n6v3kLK4Ja1huwWrAdcf0yNDuHzW819V
         y/cROcY8rk/LAR2lO5usA9VkRKa52wAR0KAUrdFma20LjEXC4TuXBQTd3Ft/tLYi0RXJ
         mqYIrpLfbZfQEhUXf4JSNWzl0Tnby1olVlZtrvHEYNrZE8z40enUga/tEWs1vXcGlM2R
         at4pW/iIVQrMe/W69MjLo45IsrWl1UYc19QxhCZ5rbFgf98G2rz0IPbWJQue5L7ZXybC
         GLIGqRDV7OfEPhKeTnY3RggVinLL29sHMUpODDlOpXpsPm8woiv9CzItSm88vzZCRTB+
         pnVw==
X-Forwarded-Encrypted: i=1; AJvYcCUjBbZIGHOyjGDqbtxXv0totQ+nxzTFvTEeJVMm12x//EtNoJXPkyg1gmy2AhNFN/c35DhdlAymmKeryK0T@vger.kernel.org
X-Gm-Message-State: AOJu0YzStggjsZE2AzfAkgjfCPFCTkE7cvEoV7fyeKaLMebLOhDSBSDA
	AP4Pyj0vETBeQD5YW/fcFvraGzCd/Oennx6KQTtiH3rshOosjIqVi3+AytZWv4AuuilSIh91LU2
	oaw==
X-Google-Smtp-Source: AGHT+IFuj5CmSrtXXuibWgxj8Zl72fdGCc2PqOrRdrgbjdA20Vn6Biy8RRbmfj7vgficiAKB3ZQs9JV+QQ==
X-Received: from wmbay34.prod.google.com ([2002:a05:600c:1e22:b0:450:d398:f3ff])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f46:0:b0:3a4:eef9:818a
 with SMTP id ffacd0b85a97d-3a51d966588mr6513471f8f.27.1749137919767; Thu, 05
 Jun 2025 08:38:39 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:38:00 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-19-tabba@google.com>
Subject: [PATCH v11 18/18] KVM: selftests: guest_memfd mmap() test when
 mapping is allowed
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev
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

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 201 ++++++++++++++++--
 1 file changed, 180 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 341ba616cf55..1612d3adcd0d 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -13,6 +13,8 @@
 
 #include <linux/bitmap.h>
 #include <linux/falloc.h>
+#include <setjmp.h>
+#include <signal.h>
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -34,12 +36,83 @@ static void test_file_read_write(int fd)
 		    "pwrite on a guest_mem fd should fail");
 }
 
-static void test_mmap(int fd, size_t page_size)
+static void test_mmap_supported(int fd, size_t page_size, size_t total_size)
+{
+	const char val = 0xaa;
+	char *mem;
+	size_t i;
+	int ret;
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	TEST_ASSERT(mem == MAP_FAILED, "Copy-on-write not allowed by guest_memfd.");
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() for shared guest memory should succeed.");
+
+	memset(mem, val, total_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			page_size);
+	TEST_ASSERT(!ret, "fallocate the first page should succeed.");
+
+	for (i = 0; i < page_size; i++)
+		TEST_ASSERT_EQ(mem[i], 0x00);
+	for (; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	memset(mem, val, page_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	ret = munmap(mem, total_size);
+	TEST_ASSERT(!ret, "munmap() should succeed.");
+}
+
+static sigjmp_buf jmpbuf;
+void fault_sigbus_handler(int signum)
+{
+	siglongjmp(jmpbuf, 1);
+}
+
+static void test_fault_overflow(int fd, size_t page_size, size_t total_size)
+{
+	struct sigaction sa_old, sa_new = {
+		.sa_handler = fault_sigbus_handler,
+	};
+	size_t map_size = total_size * 4;
+	const char val = 0xaa;
+	char *mem;
+	size_t i;
+	int ret;
+
+	mem = mmap(NULL, map_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmap() for shared guest memory should succeed.");
+
+	sigaction(SIGBUS, &sa_new, &sa_old);
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		memset(mem, 0xaa, map_size);
+		TEST_ASSERT(false, "memset() should have triggered SIGBUS.");
+	}
+	sigaction(SIGBUS, &sa_old, NULL);
+
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], val);
+
+	ret = munmap(mem, map_size);
+	TEST_ASSERT(!ret, "munmap() should succeed.");
+}
+
+static void test_mmap_not_supported(int fd, size_t page_size, size_t total_size)
 {
 	char *mem;
 
 	mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
 	TEST_ASSERT_EQ(mem, MAP_FAILED);
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT_EQ(mem, MAP_FAILED);
 }
 
 static void test_file_size(int fd, size_t page_size, size_t total_size)
@@ -120,26 +193,19 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
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
-		TEST_ASSERT(fd == -1 && errno == EINVAL,
+		fd = __vm_create_guest_memfd(vm, size, guest_memfd_flags);
+		TEST_ASSERT(fd < 0 && errno == EINVAL,
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
@@ -171,30 +237,123 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 	close(fd1);
 }
 
-int main(int argc, char *argv[])
+static bool check_vm_type(unsigned long vm_type)
 {
-	size_t page_size;
+	/*
+	 * Not all architectures support KVM_CAP_VM_TYPES. However, those that
+	 * support guest_memfd have that support for the default VM type.
+	 */
+	if (vm_type == VM_TYPE_DEFAULT)
+		return true;
+
+	return kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type);
+}
+
+static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
+			   bool expect_mmap_allowed)
+{
+	struct kvm_vm *vm;
 	size_t total_size;
+	size_t page_size;
 	int fd;
-	struct kvm_vm *vm;
 
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+	if (!check_vm_type(vm_type))
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
+	if (expect_mmap_allowed) {
+		test_mmap_supported(fd, page_size, total_size);
+		test_fault_overflow(fd, page_size, total_size);
+
+	} else {
+		test_mmap_not_supported(fd, page_size, total_size);
+	}
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
+	if (!check_vm_type(vm_type))
+		return;
+
+	vm = vm_create_barebones_type(vm_type);
+
+	for (flag = BIT(0); flag; flag <<= 1) {
+		fd = __vm_create_guest_memfd(vm, page_size, flag);
+
+		if (flag & expected_valid_flags) {
+			TEST_ASSERT(fd >= 0,
+				    "guest_memfd() with flag '0x%lx' should be valid",
+				    flag);
+			close(fd);
+		} else {
+			TEST_ASSERT(fd < 0 && errno == EINVAL,
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
2.49.0.1266.g31b7d2e469-goog


