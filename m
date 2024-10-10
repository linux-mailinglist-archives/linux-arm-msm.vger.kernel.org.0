Return-Path: <linux-arm-msm+bounces-33821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD27998165
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E501C2576F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066EA1BCA01;
	Thu, 10 Oct 2024 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4UVtuTQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331EB1C6F4F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550796; cv=none; b=V5e8b3gKMGye3DrrzfyHPwH5VDRjz8pzVd2eohKJ3A6EIgmLjJNCLGIcHl9c5B13PQFIO/ql26tRftcOGMgHGyOdm3SWinRyBALSqI+F77qMF2/952jLbL2xaK6nQxDUngQIbBHPkx2CChK+0naxLlMaQZjENDSSw7AjbTBOPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550796; c=relaxed/simple;
	bh=6O9oX/Eb/qfSLrwuOSLT7z4LMccm6m6RtLN57f3JkYg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DEwidOp7eo+xmYTqF1EKi8bVLVsQrq1vy692ykm1/FFF9B70FzpbS8NJ4DAsvZr+CvnOB5X7adSLwQ2vrLhgU/b/aoJzshPIMvaOIX4uNqq2dDGZ1b5nLUkXf9D3YVj3I0udt5CZWUTddwcORHNjStBi/wLkXq4SUqypQVPSu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4UVtuTQ9; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-37d5116f0a6so16063f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550793; x=1729155593; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzUThw8QDZNv9fDcMVRqMkWYYerRinZf/dn/Fj9e+Nk=;
        b=4UVtuTQ9dWKLsc1PmEjFOJhbTtlwY95wgrhIHEY3TKL9+dnqkY3BxXS01Ka+hjh5Vz
         h4pvjEJ5Boc05UuaFxy0E0/b8v3HobrAGqqPRjxZM2SxCDf2yjPmbU8FraWRMmFrt8hP
         bOibnzwpRWOoWT2bbVH6IEkVEkzdNHBwguvrR4o71Db+5ltqlVgyrbVayBss7IryCTc3
         vflbfjTVhJ8cfK4R4x/WPggPHGRZ1DDEuIBf6+SwD0gHsg87YjeosRezc58mRwl5J6Kr
         WqNPsLpp46YTMgKvVMBD/DT1vXb+O2WIZxDMvN4n08nAzT+iCSxwrLbmQUq8ZqP6OwtM
         U7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550793; x=1729155593;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzUThw8QDZNv9fDcMVRqMkWYYerRinZf/dn/Fj9e+Nk=;
        b=U/IdG8JYUqlmXXOt0LkMZZNN9Mbws+fUxzB8WUoCFzOyOtRhYBy148aVMW0e/3esVK
         +FHwz9dkEZ2hMQdUeJ6YvyjiFIrMhE7eehDyk6Szt0FvkoBYLJ2tk8OwIRcPba7MTEHe
         TK9344A+fZEZ0OjeG/eVPR1GpllI4BHcYC9BWMu68Jyf5OR3w9GWM2HNmP7nKMJs5clA
         9aqYALNJBuHRHgxnTwi024oVY/GFsEauck9uWgCsYVmMdKCVVz9Go+pQoSe6iMi93jQ+
         HoOfW0B1n8vCLkqh73kLpatkGsDhT7QqqDeWSWSN3gE/65Y4HUF0AtUwXFXx99bKfJLf
         t+ig==
X-Forwarded-Encrypted: i=1; AJvYcCU+dfQDvBLidVvazaHbDHpICj0NQvJ/yX7qBXDp5TQGvDXoylEPeasjA7nKybOXMeJHrWRIV+pRBIf58VwD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/g/DKtSSCJs6d1r0y4MUsXinz+QGv6YyUFjVA8BXFx4J0QR2
	oD+SjeWanka5qA/+nbxSrMwzM7ZZOxxzoMQ5GjvQE2W0kkpNS1YTNh71KmfsLN6VUd/gSAs9tw=
	=
X-Google-Smtp-Source: AGHT+IGnEPVNJA5hNA6zgaReNf096hRtQziouC1E1cxYtRNCKe4dTpHEgBlCo1zAywzne6jSW5D++vxtyg==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:420f:0:b0:37d:31a7:6610 with SMTP id
 ffacd0b85a97d-37d3a8ef27amr2808f8f.0.1728550793139; Thu, 10 Oct 2024 01:59:53
 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:27 +0100
In-Reply-To: <20241010085930.1546800-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-9-tabba@google.com>
Subject: [PATCH v3 08/11] KVM: guest_memfd: selftests: guest_memfd mmap() test
 when mapping is allowed
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
memory if the capability is supported, and that still checks that
memory is not mappable if the capability isn't supported.

Also, build the guest_memfd selftest for aarch64.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 57 +++++++++++++++++--
 2 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 960cf6a77198..c4937b6c2a97 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -172,6 +172,7 @@ TEST_GEN_PROGS_aarch64 += coalesced_io_test
 TEST_GEN_PROGS_aarch64 += demand_paging_test
 TEST_GEN_PROGS_aarch64 += dirty_log_test
 TEST_GEN_PROGS_aarch64 += dirty_log_perf_test
+TEST_GEN_PROGS_aarch64 += guest_memfd_test
 TEST_GEN_PROGS_aarch64 += guest_print_test
 TEST_GEN_PROGS_aarch64 += get-reg-list
 TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ba0c8e996035..ae64027d5bd8 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -34,12 +34,55 @@ static void test_file_read_write(int fd)
 		    "pwrite on a guest_mem fd should fail");
 }
 
-static void test_mmap(int fd, size_t page_size)
+static void test_mmap_allowed(int fd, size_t total_size)
 {
+	size_t page_size = getpagesize();
+	char *mem;
+	int ret;
+	int i;
+
+	mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	TEST_ASSERT(mem != MAP_FAILED, "mmaping() guest memory should pass.");
+
+	memset(mem, 0xaa, total_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], 0xaa);
+
+	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
+			page_size);
+	TEST_ASSERT(!ret, "fallocate the first page should succeed");
+
+	for (i = 0; i < page_size; i++)
+		TEST_ASSERT_EQ(mem[i], 0x00);
+	for (; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], 0xaa);
+
+	memset(mem, 0xaa, total_size);
+	for (i = 0; i < total_size; i++)
+		TEST_ASSERT_EQ(mem[i], 0xaa);
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
+}
+
+static void test_mmap(int fd, size_t total_size)
+{
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_MAPPABLE))
+		test_mmap_allowed(fd, total_size);
+	else
+		test_mmap_denied(fd, total_size);
 }
 
 static void test_file_size(int fd, size_t page_size, size_t total_size)
@@ -172,13 +215,17 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 
 int main(int argc, char *argv[])
 {
-	size_t page_size;
+	uint64_t flags = 0;
+	struct kvm_vm *vm;
 	size_t total_size;
+	size_t page_size;
 	int fd;
-	struct kvm_vm *vm;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
 
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_MAPPABLE))
+		flags |= GUEST_MEMFD_FLAG_INIT_MAPPABLE;
+
 	page_size = getpagesize();
 	total_size = page_size * 4;
 
@@ -187,10 +234,10 @@ int main(int argc, char *argv[])
 	test_create_guest_memfd_invalid(vm);
 	test_create_guest_memfd_multiple(vm);
 
-	fd = vm_create_guest_memfd(vm, total_size, 0);
+	fd = vm_create_guest_memfd(vm, total_size, flags);
 
 	test_file_read_write(fd);
-	test_mmap(fd, page_size);
+	test_mmap(fd, total_size);
 	test_file_size(fd, page_size, total_size);
 	test_fallocate(fd, page_size, total_size);
 	test_invalid_punch_hole(fd, page_size, total_size);
-- 
2.47.0.rc0.187.ge670bccf7e-goog


