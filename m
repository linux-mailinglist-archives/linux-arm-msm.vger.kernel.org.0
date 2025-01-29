Return-Path: <linux-arm-msm+bounces-46544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3BA222DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0388B3A5B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9431E0DE4;
	Wed, 29 Jan 2025 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zCkvwRCt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83041E3779
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171429; cv=none; b=nK24Qwk9yexKrnptlk58sxGEDTiWh2iAw7Bt4XW1mvj8yMwE8UTlvOJdTeKFAFNZTELn0JtVKRMGBWS6od00zFz20tzWXXCRugPPMsMxh9G8EGtZOOSqsHIOwg56nvJyoe5Gj3pj5HNU5YLec9l9nEowLvfu1CteoACEj3O6BYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171429; c=relaxed/simple;
	bh=ky2lH5N7Ay9DC3OktCv4VJspBE0k8W4DrnJYOr1cEgk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T2UY41N7UBxDE2V6XZ/nMoAUw6E45/HKYdYYX4UAS9Gx6mgm8MlcNKgfyArGfVsUMQhgbo9cJXXWXe/outLQkSC4GCGVot8sumWy8MaFkeu/ykOqPLny+vXQKB1QhLNphVvUxn+vIgD8ZzwXntxw0VHbKt9opnBSYJ+0pBriBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zCkvwRCt; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362153dcd6so36386745e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171426; x=1738776226; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zrvzGaN8zaP+D06MaP8yPSKdvx6oMhYyqVOrUtzvXY=;
        b=zCkvwRCtgpyqNfFZP/hlJWBFcgwfkMcbTFmS9L6FkzzUBGAgmg3SeGJgQmsZOzVEf+
         iECQmcMSfmwz5eNDTENUB+P9KNmXIWjI4Q1ahDbpqxRi6t9g//n4uxnGHcvc6dsYS2LK
         pUMGK07jeKMouY8e3G7hsYZG7yCGEHUpOafUbAIRaZWGwrD44kxTuKZs7wWp3GIZsAzC
         EuDsESkHflKM9eRFtiU3nqK/Jca9RZS1lL1aktABpEwnPK58KrOwR7MFd1d01r+V1Yvf
         f/w5GDi9J6YvNiezgKEBB49u9fSfpnxvV5mi0H+MUAJclBcYDAOPuEDrv30a5TGPi+zb
         ajbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171426; x=1738776226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zrvzGaN8zaP+D06MaP8yPSKdvx6oMhYyqVOrUtzvXY=;
        b=td+Ru4qP3Kf8ZCsXcvQw/mGAmoqTegieFwUS1G83TsjKsGH/2H7m4lAi2IoJKCpw2U
         W1s2HVqZIK+UM2wZ0wec5AATdoJFVkcVRLCapWLsYJCPqk8Mv/5unfXG2dfc8EsmKIlu
         EFZacldTpF5rsPPD342s6Y+luFwxqARb2u5LfBfGqUfsmx9/DWaHnO2zVojKaqHnOk3J
         HWIABApoVyVMlT+q6rtfL3qrGzkBfTKXvz3CU90oHVrJsigH5fPf7yaGjF2oX8QmROqj
         XtCq6NCUp0YJFBve3o0pysQg3HVyrPy03dHQ+ltypVoYem2+97CL1pJ2KgOs6rEmxVPg
         VPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8VU3P59Tjad+o1LvLhlkfF1ymLSAaqxVNmykksOPz8aK7D8BMKbxCnzAZZeSU4kHNaHLY1ewhCHwsvHj/@vger.kernel.org
X-Gm-Message-State: AOJu0YwCMGZHOINWvAp3ov4CN5zkYp+Bjj9LhR8EWbNDjVr6meXucEp2
	DqB8GtUYMmwFUUoPcOiaD/1FmbmjIqGiNzwlp32F86upRMwHXJ1J0wcoBrgxaSVGYbOOCocHZg=
	=
X-Google-Smtp-Source: AGHT+IFR5xFOkTLqeb6QODDX2zzdjcB9oqFqKPN0nLKNTAI4B+FSdQD2EzgL2GfPKUeAFSCR2jBuoM5BRA==
X-Received: from wmqe7.prod.google.com ([2002:a05:600c:4e47:b0:434:fbcf:594e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e45:b0:436:6160:5b81
 with SMTP id 5b1f17b1804b1-438dc3c7c5cmr38793015e9.14.1738171426208; Wed, 29
 Jan 2025 09:23:46 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:20 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-12-tabba@google.com>
Subject: [RFC PATCH v2 11/11] KVM: guest_memfd: selftests: guest_memfd mmap()
 test when mapping is allowed
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Expand the guest_memfd selftests to include testing mapping guest
memory for VM types that support it.

Also, build the guest_memfd selftest for aarch64.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 75 +++++++++++++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c    |  3 +-
 3 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 41593d2e7de9..c998eb3c3b77 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -174,6 +174,7 @@ TEST_GEN_PROGS_aarch64 += coalesced_io_test
 TEST_GEN_PROGS_aarch64 += demand_paging_test
 TEST_GEN_PROGS_aarch64 += dirty_log_test
 TEST_GEN_PROGS_aarch64 += dirty_log_perf_test
+TEST_GEN_PROGS_aarch64 += guest_memfd_test
 TEST_GEN_PROGS_aarch64 += guest_print_test
 TEST_GEN_PROGS_aarch64 += get-reg-list
 TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ce687f8d248f..f1e89f72b89f 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -34,12 +34,48 @@ static void test_file_read_write(int fd)
 		    "pwrite on a guest_mem fd should fail");
 }
 
-static void test_mmap(int fd, size_t page_size)
+static void test_mmap_allowed(int fd, size_t total_size)
 {
+	size_t page_size = getpagesize();
+	const char val = 0xaa;
+	char *mem;
+	int ret;
+	int i;
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
+static void test_mmap_denied(int fd, size_t total_size)
+{
+	size_t page_size = getpagesize();
 	char *mem;
 
 	mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
 	TEST_ASSERT_EQ(mem, MAP_FAILED);
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT_EQ(mem, MAP_FAILED);
 }
 
 static void test_file_size(int fd, size_t page_size, size_t total_size)
@@ -170,19 +206,30 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 	close(fd1);
 }
 
-int main(int argc, char *argv[])
+unsigned long get_shared_type(void)
 {
-	size_t page_size;
+#ifdef __x86_64__
+	return KVM_X86_SW_PROTECTED_VM;
+#endif
+#ifdef __aarch64__
+	return KVM_VM_TYPE_ARM_SW_PROTECTED;
+#endif
+	return 0;
+}
+
+void test_vm_type(unsigned long type, bool is_shared)
+{
+	struct kvm_vm *vm;
 	size_t total_size;
+	size_t page_size;
 	int fd;
-	struct kvm_vm *vm;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
 
 	page_size = getpagesize();
 	total_size = page_size * 4;
 
-	vm = vm_create_barebones();
+	vm = vm_create_barebones_type(type);
 
 	test_create_guest_memfd_invalid(vm);
 	test_create_guest_memfd_multiple(vm);
@@ -190,10 +237,26 @@ int main(int argc, char *argv[])
 	fd = vm_create_guest_memfd(vm, total_size, 0);
 
 	test_file_read_write(fd);
-	test_mmap(fd, page_size);
+
+	if (is_shared)
+		test_mmap_allowed(fd, total_size);
+	else
+		test_mmap_denied(fd, total_size);
+
 	test_file_size(fd, page_size, total_size);
 	test_fallocate(fd, page_size, total_size);
 	test_invalid_punch_hole(fd, page_size, total_size);
 
 	close(fd);
+	kvm_vm_release(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	test_vm_type(VM_TYPE_DEFAULT, false);
+
+	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
+		test_vm_type(get_shared_type(), true);
+
+	return 0;
 }
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 480e3a40d197..098ea04ec099 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -347,9 +347,8 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	}
 
 #ifdef __aarch64__
-	TEST_ASSERT(!vm->type, "ARM doesn't support test-provided types");
 	if (vm->pa_bits != 40)
-		vm->type = KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
+		vm->type |= KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
 #endif
 
 	vm_open(vm);
-- 
2.48.1.262.g85cc9f2d1e-goog


