Return-Path: <linux-arm-msm+bounces-65009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F04B056A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404A03AA0E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68B02DEA6D;
	Tue, 15 Jul 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="br2XgZ1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571F2D839D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572080; cv=none; b=S5WucrvwKu6TElQYXF1n960I/H976P1AUXA5kwLEg6bUtEyoBoMFgXYWMXAMnXqi2soD7ktgl1NIpdzk07XLPbx1IiIlqT8UOtLGo4ZXfMkNVA4y9nShmDi7G/THZYXatF7pPE/yuRPv3Dbks2jE3qEXv49GYHqKqJYxhjmiQJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572080; c=relaxed/simple;
	bh=sFAWxHye44w1R+mM5V+LDiCzTr6ROyPDzwVyA8ugqX0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LJXs9XNzfTZldgeOIpVSAPUQMYWbJQrCTNXSQmiLu3eK4AFSAuoUDG6sDlSCcGKcxp+MqKp8ER5GoX2n53W8K5Ns7jB+A4QjoCt0P4zLqfNvgzVKU3eBM6dA8gXrGe0wBved2i4sIUlrstZ2nHEvblgyjPKSK3RlEZrUfV6FgDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=br2XgZ1e; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6083f613f0eso5322293a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572077; x=1753176877; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOxTG6i7FEjwgO78cp+SZydc4yJ2EnAl5OEX1LUXtxU=;
        b=br2XgZ1eaMSnyv7O5mR5U86xHc6wf1PH6TFNYooZoxsw3gcI1JHu31iULWaajOeIft
         ai7ZtngzSJGps5DEtdt0p+caQJWYqMJchPGBCR4dF37cQIiUZtMq6uE4nPi8jRLPG6Hn
         BFbXne7p5QOvcX834ZnbJkcIEaYoJ+yH3oPdMkWqyeewaDvNjIX0wMR8K6baHUDBQk+7
         WWWmLj7snyBfVO/74FeMgOaG/LjoSctEJMSOe1inHSp0dxaqfPJSFuu0NyMGbilcnLHn
         12KDRzcQXEIJ3uSYshzOVi+mrO5jNQGPtI9JGfO45RrFg2ENznzsW825efmw/TtllkiE
         WQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572077; x=1753176877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOxTG6i7FEjwgO78cp+SZydc4yJ2EnAl5OEX1LUXtxU=;
        b=t49MbkGle+VBUL1vSW0P79TV7YiqHNghfcjM4Qbc2FI5p6T2Mg31Sx8HpDM8Xfyc/7
         JN8GsfBRZSX142/FdXV+/oTlSdcPXY003v1DtS5rWP/zrkVweMNy/MRDv3VJ1DjbGB8h
         rfVjlXTaqfG7p6mT8XHlsndHpbJIeZ78LPXMC7hoxinhvK/JUmOHWqfzMU6jY78034Wh
         fiTSKhE9VAFQdmPqZRI1JEjHlVSE2chxsTPUuwgHfCt3KI8dlN5cDlFXgCTsDnhCHGjw
         icUm9DnZf75C2Ek8pxvSl8iunUbTX1OF/Azb4HuShdUDuTNzTDks0iSXvklNDKhvJoZv
         e0iw==
X-Forwarded-Encrypted: i=1; AJvYcCVHSHw3SNqsBBKfcceRN/9rnPhjh0+ARch1BqXZ5z8OxXd2fWWKLAHV4eServv3uCeiJMeWWDHWHmjNB1mC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzv2At2TreGj6SRzY1wzSLJfvNeuJd4UyKogcFlPZKDpnrxylW
	iehljxD4nwF+yU8JtCcb7mQzaCZE7eEh9NkXBXmI56VxzHQzc9LYyZa3E1XRRuUhazOP+I7Q7yO
	aQA==
X-Google-Smtp-Source: AGHT+IGI610lCZHGfon3SNZZY/SVw9WaoOiFuKCCBX2T0KCJ+afRtNdmxFp5hhQEFR82WUfFrBduY0Ajzg==
X-Received: from edt19.prod.google.com ([2002:a05:6402:4553:b0:609:36ed:3901])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:378d:b0:5fb:c126:12c9
 with SMTP id 4fb4d7f45d1cf-611e84c2334mr13524470a12.25.1752572076080; Tue, 15
 Jul 2025 02:34:36 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:33:49 +0100
In-Reply-To: <20250715093350.2584932-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715093350.2584932-21-tabba@google.com>
Subject: [PATCH v14 20/21] KVM: selftests: Do not use hardcoded page sizes in
 guest_memfd test
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

Update the guest_memfd_test selftest to use getpagesize() instead of
hardcoded 4KB page size values.

Using hardcoded page sizes can cause test failures on architectures or
systems configured with larger page sizes, such as arm64 with 64KB
pages. By dynamically querying the system's page size, the test becomes
more portable and robust across different environments.

Additionally, build the guest_memfd_test selftest for arm64.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Suggested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm       |  1 +
 tools/testing/selftests/kvm/guest_memfd_test.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 38b95998e1e6..e11ed9e59ab5 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -172,6 +172,7 @@ TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
 TEST_GEN_PROGS_arm64 += get-reg-list
+TEST_GEN_PROGS_arm64 += guest_memfd_test
 TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
 TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ce687f8d248f..341ba616cf55 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -146,24 +146,25 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
 {
 	int fd1, fd2, ret;
 	struct stat st1, st2;
+	size_t page_size = getpagesize();
 
-	fd1 = __vm_create_guest_memfd(vm, 4096, 0);
+	fd1 = __vm_create_guest_memfd(vm, page_size, 0);
 	TEST_ASSERT(fd1 != -1, "memfd creation should succeed");
 
 	ret = fstat(fd1, &st1);
 	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
-	TEST_ASSERT(st1.st_size == 4096, "memfd st_size should match requested size");
+	TEST_ASSERT(st1.st_size == page_size, "memfd st_size should match requested size");
 
-	fd2 = __vm_create_guest_memfd(vm, 8192, 0);
+	fd2 = __vm_create_guest_memfd(vm, page_size * 2, 0);
 	TEST_ASSERT(fd2 != -1, "memfd creation should succeed");
 
 	ret = fstat(fd2, &st2);
 	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
-	TEST_ASSERT(st2.st_size == 8192, "second memfd st_size should match requested size");
+	TEST_ASSERT(st2.st_size == page_size * 2, "second memfd st_size should match requested size");
 
 	ret = fstat(fd1, &st1);
 	TEST_ASSERT(ret != -1, "memfd fstat should succeed");
-	TEST_ASSERT(st1.st_size == 4096, "first memfd st_size should still match requested size");
+	TEST_ASSERT(st1.st_size == page_size, "first memfd st_size should still match requested size");
 	TEST_ASSERT(st1.st_ino != st2.st_ino, "different memfd should have different inode numbers");
 
 	close(fd2);
-- 
2.50.0.727.gbf7dc18ff4-goog


