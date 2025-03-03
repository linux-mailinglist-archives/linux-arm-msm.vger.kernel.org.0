Return-Path: <linux-arm-msm+bounces-50042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E1A4C97F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 18:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0806166B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952E52505AC;
	Mon,  3 Mar 2025 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C213ZEtX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A072500C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021838; cv=none; b=JlgDo2LcUi0myPgusbOZQ9/qPP01bNF2Kq4qCjGklGhvRA2nFTMP/XqWEMvwm/YZD9mLt5R6U230+qfJE+/w55GQjfkv1TH66Yli/UfZOj8kagY0kLB9UoDdn9JPJw8HNSedMm+3y5U7nxHn+5vRCfwlGr8lRYj0SGmz9o7KyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021838; c=relaxed/simple;
	bh=hHukxtvv+DhlvOpnT6JJgLuCaUBAiA8jyPZaBpcbwYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RT2DJoeVhUSFhAMBPYjTJlnOpOPuJbJrsfB1dinWuqH/MQwUbOScvmLBxfbSxLD5Gole1tsW+yn//edLp5UCf4DW6c0qCvV364tEwH7DfiMDWbguewrlArn74i4iEroO/sSwi9p95sVp2GLeiTSPlKqVYkQkNyqQlBiWD9w4/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C213ZEtX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4399c32efb4so24411255e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741021835; x=1741626635; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=shxzjltmhVCSEs3XLEEf6Hj2khLkpxaqKL228sddyqU=;
        b=C213ZEtXEyvOT7om2kBYwZvTyG2f2rRjVduaq9UV7JfVr8UTn1RuuPQmfBdmdo8F6D
         6a4UD48fVYtI4+AFwK/jjTjWuqGeAuJUJCcmsNujeVl1dD0LwrdXQL/yokT99Sd145l5
         C7HRuhWPvAUp7o1Yuv7lF6QQsPJNJkYjPn4LQejBW7bd6U5REVJCrGsIoM6cSeFGNGcZ
         0VL/o8TVGXOvrnNe0jdbVElZyBdJw6rYVmKqs10O2tfnRbw4zJ//RWWgHIL1djEudJOh
         KZzBn0uda4dTrAIWj95uldgnzz2G28kWsSd0LbIahwpkjzrkm7hRVoqU7yUlZwMDh/ZI
         zQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021835; x=1741626635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shxzjltmhVCSEs3XLEEf6Hj2khLkpxaqKL228sddyqU=;
        b=OKeh/IMA6UqUvdo01BA7uZH4cuzqKze4MHGjxnkdVocWCe93w82tMqp1wlq8SdY2ca
         ZaAHy5QhG6yr3jkt+tuPE55DEodmErMUy5nH41BAiHplLmpVWbFTJXabP1x+r8Q/SxzO
         xxURzH+y475xTtaA0OSP000Maf2z82yi98YKTTr4H7/0mMc+yQIrpuZ+Xnfgf4sS8JFa
         n3VxBZrnHfLqW2OV2GGwSO7ha7a5R+Qn4OtjKuJAQOohXHgrcFHE+9bwy5emsJp0lmqs
         dGKKtHeVYV9vTKzX1NF8Yxtb5WBALIa1knTJ1cC2qTrwX3lP6xz1xhYJ10y8Ef4uCOSj
         ehug==
X-Forwarded-Encrypted: i=1; AJvYcCWcNI2oCBrv0R+JKhq4gc1XEXPoOGTEY+/Paz+JF7TUVINukCz0lK7hzlr7vZ2pOmSCOVZ2XFDP2O8Yweyq@vger.kernel.org
X-Gm-Message-State: AOJu0YwCSGdFEIX5Fea4SKwaOboM+ATwSLNp5NKWuAU9aStBya8SVuNr
	//xy7OkRgLRW6/VwBffk1ymu02HBBmmneRCzMoxYsZ2gwDbs/EKqICE4P7hHTnWAaiMbyNvNGw=
	=
X-Google-Smtp-Source: AGHT+IFRshHAVxkzqZnB+ggYu/XSK/78X/FWHRdv+7cCRWE1mXA23VnZ9DwQ8SGznRbx9niCQ37rSqzPuA==
X-Received: from wmsd10.prod.google.com ([2002:a05:600c:3aca:b0:439:7e67:ca7b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2c7:b0:390:f0ff:2c10
 with SMTP id ffacd0b85a97d-390f0ff30camr10550328f8f.19.1741021834976; Mon, 03
 Mar 2025 09:10:34 -0800 (PST)
Date: Mon,  3 Mar 2025 17:10:13 +0000
In-Reply-To: <20250303171013.3548775-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303171013.3548775-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250303171013.3548775-10-tabba@google.com>
Subject: [PATCH v5 9/9] KVM: guest_memfd: selftests: guest_memfd mmap() test
 when mapping is allowed
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Expand the guest_memfd selftests to include testing mapping guest
memory for VM types that support it.

Also, build the guest_memfd selftest for aarch64.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 75 +++++++++++++++++--
 2 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 4277b983cace..c9a3f30e28dd 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -160,6 +160,7 @@ TEST_GEN_PROGS_arm64 += coalesced_io_test
 TEST_GEN_PROGS_arm64 += demand_paging_test
 TEST_GEN_PROGS_arm64 += dirty_log_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
+TEST_GEN_PROGS_arm64 += guest_memfd_test
 TEST_GEN_PROGS_arm64 += guest_print_test
 TEST_GEN_PROGS_arm64 += get-reg-list
 TEST_GEN_PROGS_arm64 += kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ce687f8d248f..38c501e49e0e 100644
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
@@ -170,19 +206,27 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 	close(fd1);
 }
 
-int main(int argc, char *argv[])
+unsigned long get_shared_type(void)
 {
-	size_t page_size;
+#ifdef __x86_64__
+	return KVM_X86_SW_PROTECTED_VM;
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
@@ -190,10 +234,29 @@ int main(int argc, char *argv[])
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
+#ifndef __aarch64__
+	/* For now, arm64 only supports shared guest memory. */
+	test_vm_type(VM_TYPE_DEFAULT, false);
+#endif
+
+	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
+		test_vm_type(get_shared_type(), true);
+
+	return 0;
 }
-- 
2.48.1.711.g2feabab25a-goog


