Return-Path: <linux-arm-msm+bounces-45445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5253A15459
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC0A3A6564
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA80719F487;
	Fri, 17 Jan 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x9nYrvP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8D19F419
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131430; cv=none; b=FCDIMhvSXMvIe5FRjL2IzXItsKKa5h7bnZZI79oqapskmHFa3SbkLXlQwQlVlMbgZ9uOvIQ6ibNGsbfHMxIvg22ggK901QnDx6Gfn13n+oswY/J4DOHmh1MxKuCpw1r7yDMc73c1J6pS6KgWtTKpCitfvsMcj+JMkbPfdw/lzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131430; c=relaxed/simple;
	bh=6R3v8tgeSWV1Q1+aFvuFNhTEuic+hcTU1l/2e2lBs/0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PCKAxyWWB7qz7spQ14V0cgGI7LbR6FIeis8HMvYR1lrvz4wSRyinGfFa0c2sSwggGfED0AViLnDkvOKZBYXsi+YKXCenpolWMTEwpFH+JoRTI6+mkZebIFPruSux6wIK7BzwDjkdbXiB3Z687tT1vkLieVwL4pNL7KbCtdU6SDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x9nYrvP2; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3862be3bfc9so1438514f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131427; x=1737736227; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3JE5H2O+HhGpe+U3oFgZgOkWGJvxazt/6lMsPLsK3g=;
        b=x9nYrvP2NqoPtd7SzSVkTGl/U/Vz3uPbvkKQC2QMvGzPzYueIuVwpHvJFfeJqXnXcq
         cBJKbBIazkr3Nk7QpVNHDN4Uh+ilDzyzZzoKq26bej8VhH5euu8GvjICJzc3H7gWp0CL
         KDAxKNv6nhhfe1QyG8Q+hmyMmYo1KPRGQdAZXGqt/BaVOlsNe9OB2WDZ/KMFi3VVLkqj
         2EiXViTW8AE20grLlD2x1OxEeg3ds8pz1LSSMu/WE7+AlSocQVpQ8/WPUeUWazvnkHO3
         ipXBRJS6WfNGQnCtYp+gBgK5pgVl9ICAplVACF5haHfVLTmiz98fsGBYETZ0toMpwnj+
         /Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131427; x=1737736227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3JE5H2O+HhGpe+U3oFgZgOkWGJvxazt/6lMsPLsK3g=;
        b=OR0b3C1uMZCtA6N3cv6kgALFyG8LoWvvsUUmzvaxf3xXsm89/SjHcLtRkAmojecGXH
         OiTEhyFFek0LQ75Zqq2J6x9EMiLOKRNomwWaMMm1qBMRzlosEYCZ2uSFnsovS0FKGj/r
         +2Ayg5pCeNAkZ3rIsD+v15srZqjT0NP0E+WePUli1po54j+tlEkqpfzRvcOb7S0p+rRF
         J6AdWUSwH36WucAEqykcKAtgfPYBzPTL95ltmoC+QMXjcxy0UMP6RvuRB3mLMudf3Fvl
         zeYifvSkHFnY9gsaT1688altJosxssCTECUR3NZEHXtE+pkYM6mU+oN91OJBYgRdybho
         C01A==
X-Forwarded-Encrypted: i=1; AJvYcCVKAy8MrHGZLt+MdGh1zuuRBJHGU0j8FZZN8EX7yYy2qrZuHZfvXTlUu1gHuIVn1yqq5lN0p63HOTNwVONp@vger.kernel.org
X-Gm-Message-State: AOJu0YzWruK0mTOzaYi5ZRbabdrTvKd6tekD3mz6x6vlDwpkgapmQmgf
	1g5YmWzxdm0kC4r8WXGIVTQwzoc4dO8DDYWKYrYwEXpywpLnSBf6GWEtpsSeDu6BKTsAvu47LQ=
	=
X-Google-Smtp-Source: AGHT+IGRpQ4nyI6BTUrkjbZ8ozpuqJEpQ2vY5BcNInNhu8r9xyJzkDeNESuZ6QV5cyzLhvncD1YckbOmdA==
X-Received: from wmsn40.prod.google.com ([2002:a05:600c:3ba8:b0:434:a1af:5d39])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:402a:b0:38a:a047:6c0b
 with SMTP id ffacd0b85a97d-38bf57a97e0mr4283682f8f.35.1737131427228; Fri, 17
 Jan 2025 08:30:27 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:57 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-12-tabba@google.com>
Subject: [RFC PATCH v5 11/15] KVM: guest_memfd: selftests: guest_memfd mmap()
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
2.48.0.rc2.279.g1de40edade-goog


