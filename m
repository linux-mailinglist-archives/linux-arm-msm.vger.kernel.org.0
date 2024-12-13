Return-Path: <linux-arm-msm+bounces-42102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4B9F12DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E97A1631B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595AD1F426A;
	Fri, 13 Dec 2024 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ukrJBYfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812571F3D54
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108521; cv=none; b=TecGqVT5O6Q10B0rjn1PgTmOoaznknGXGIXZ6haeXEBwgutyegkn5JxciXZUIAlvsQeiDXoJeF+1y0nqn1GfKEuwgkS8KO2YgN/3Y4lTMUn1aokpefHUZ8iSS/3I/jPFtcvJQbbphF4J1VCemJjGhQn5SGxSnT+qvS+zlWDuy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108521; c=relaxed/simple;
	bh=1UcBMsBaNJ9H03ScD6XckdVfKjpH/qoRGNKoYNELwMQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zrs8uhQNpNpcXbvchGAqRwP5fGbNXtNoAt1M0ARcssJzCmsqlOIBonq/94h4Y7hC0T3GjOXvrUodhJ2ER007uhv5usrgeY8Di6SKSREnfth46HENlh2bMHE6psMDwm4A1gfM7kfsvNEWGptn63akEV6oqcaKgi8uXh9pfmntI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ukrJBYfb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-436228ebc5eso11689805e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108517; x=1734713317; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhFiA/KCvNxVvN2dxXqgdhmMKMTNkZQ9H4IjGYFoLJU=;
        b=ukrJBYfbFTRjkJoGTVzOq2Thu9roiPplSWxpeRhGClZRRrCj+NTmaxT0kXNSCA7jEa
         qyg55VRv3JRItwxdPkL2bHOK4oOJ8ZgXj/nZqyl6PKtXKIH8YNa2VzkdzL0+UC0c5rvg
         qtRxo+qed3p5NQ5/kwFWJXRnPNrUYjIO1psO+HR4HGhaCNGaGfbJ3s6P5147h3i7AX0H
         7FFth12ypvakDUXagJAbF5OO949kv4LIAMp7vvC1hHIV/dyaS4+JxG3+vdCkNYVzpnjx
         UKiQ/aLsNeGwVECPUF+pKslBmOwkm05jTKvSh4R+swSwD6y4S4PVl6CaZdCRZKwJXfki
         Vzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108517; x=1734713317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DhFiA/KCvNxVvN2dxXqgdhmMKMTNkZQ9H4IjGYFoLJU=;
        b=B6xHvkkiUYAyBbpv2SBBoBjihiQqGWA6qQphaJ7YUj3eEbkZx/PisXJ6uDJ1n7aykm
         nb8Q80og8xpvSb9L+WuBUubLPHgJ2L6yds6aQeJLqSXd7A274JXJiZUt5/jqRG1xcgWI
         RDquCeBNigxQGz5dE+8Q6mrMw2/dmH5qBGnVgL7x972aUeyoIH3jy8a91IY6AtJxfttB
         X/x99UfBReWN/sqC74n5D6x+qhMInweXk1tH8pxBYHwkn2KJQWz1Fs2O15wL8xYjlA9M
         yHOahoW0eJKSq0qMH8R71eNaLIF1dcN5Hk4xtTuNoJqHbhMqxbJQefOnrr89zjPS2MFt
         lvtA==
X-Forwarded-Encrypted: i=1; AJvYcCWBYowqFA9nnslFBnlkF2BYktLtaDh18teE9MXHJXubxtDpsV2abUlYZMhDtT8Yjsn5X+OMNl330QCIPV3W@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzdgDnJxliORVfa3IZfugJNSHu66V3KqAQJpOcUyIHE1mzFoc
	vZrbY5FgCcK74OnIX0ql392SyWJ7ZA8uLC+A36O52CbcbIFI1RmgoaVJT4XztZfJPriu8sdT7A=
	=
X-Google-Smtp-Source: AGHT+IFC3wQu843hFQBCJ/CWlcnzA5CxWqK8aB90iNtnojUxP19hTT+b2JGWT0UhJ1/fNK7qaPLpg8+Hqw==
X-Received: from wmmu14.prod.google.com ([2002:a05:600c:ce:b0:434:f0a3:7876])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:cb89:0:b0:436:1af4:5e07
 with SMTP id 5b1f17b1804b1-4362aa1561emr25562455e9.1.1734108516946; Fri, 13
 Dec 2024 08:48:36 -0800 (PST)
Date: Fri, 13 Dec 2024 16:48:07 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-12-tabba@google.com>
Subject: [RFC PATCH v4 11/14] KVM: guest_memfd: selftests: guest_memfd mmap()
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
memory if the capability is supported, and that still checks that
memory is not mappable if the capability isn't supported.

Also, build the guest_memfd selftest for aarch64.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 57 +++++++++++++++++--
 2 files changed, 53 insertions(+), 5 deletions(-)

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
index 04b4111b7190..12b5777c2eb5 100644
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
@@ -175,13 +218,17 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 
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
 
@@ -190,10 +237,10 @@ int main(int argc, char *argv[])
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
2.47.1.613.gc27f4b7a9f-goog


