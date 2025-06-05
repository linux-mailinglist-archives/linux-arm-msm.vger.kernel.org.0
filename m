Return-Path: <linux-arm-msm+bounces-60339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C9ACF34F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1E5218988C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C161DF267;
	Thu,  5 Jun 2025 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mVgcaAHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46825275103
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137921; cv=none; b=IVIqTAeEEYgXBarXTechqIbC6OO5CBy01sReMX2Oo7CD6343fWcJNHLY34lAMjGf1MMpM7fy9GO8HT0YXL7rH/Xdrng6wueD1Wnn2Ttgms02PX7hQsxl30PS6jx0espukYvGjmqjlWGiFnn6eL9z3p9Y5P8/nhj9UUCM4ZSVWwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137921; c=relaxed/simple;
	bh=np1bN13wn9C90KK+H+wwEHyvF3CFjYVZDRFxiem/Bw0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BKIOH6nnW2UZvyL0/ixL6VLrYaRCcyXzSfaSmBBbfBuL7MXy7IJLyhDByw6G2pewHEGB2gsOuLkneO8taJTve65QCfsDEx4/A1mJcny8O/eej1VD2hrHRxytOymmynPrGIakB0DLeR1vFTotNEiTnXYpa/wGehLNcfe/L2TFnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mVgcaAHr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d244bfabso9047935e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137918; x=1749742718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CTszacuPAxWQTwzIU0nGotfU9vxy8BL3CP9EQLh798=;
        b=mVgcaAHrJyO+Ys7yGlW8ZDDrwFDZIKMbnw+JgnIQjCgcZLFdqIkGLSSKiYUX/wGU7U
         +iuvoi7JAL58g6uPRFWSFpsLRFB51N6bgafdy5IFjkXQLlcwwm+YL+09dICguLXW557K
         LahU9R/1J+RmKEAq6xIKIQNKVsl4tY6DQTNeyBS7xIXzpg624RMrnEtgsZyTokX/H1zJ
         yP/pIPG22MBwx1zWVK8VaGQlMjVFxeyThrRjTFnjjcWUA94hYiCI2FiQrHORnHPDMnZv
         GV0AA3+DPSpVe6Qh/p/rFBvfMB7y1iSyboJjnKs+BLCwuMdiAjSVKakFAnQFCNhIHV9O
         5P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137918; x=1749742718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CTszacuPAxWQTwzIU0nGotfU9vxy8BL3CP9EQLh798=;
        b=uW+/rpNNHJfQEx5tJsYnbihwUID+3nqAQkIwNI8cUHNgeXh0+qa46UDvbi2cu65ArG
         aGEepd7OZQgR5RX+tS+Q7ecZksq6wimD+HOyv/jLiFkO/FGlhF89W6gKIg7JFMoWqhmI
         c3bqunIdjg7Yedp6wedJZfyf8bKzanSz6rYX90FWMeHoImg7luYYJJJnU52Y3LRMUPKa
         9zNGfxI/k+1FqKCHgltQNLc7zZ90VOXdjyw6G9/KICrihYFfioChD5+u4aD90p7P7ZEk
         Kw7PFXig/wujb8uu0DM/6BICGYTbO/aDkuGfTOIJqpMDJknOh4i4plpixP/E+bvXXvGw
         z8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE+HvUfgbdWpIT1Pe+ZkwP9ZBOqzEYFo3l+fuFgPkWVGpoa9ZFLrpvfuZZ5xbIqcl+QPS+1ipbbaoOUhXi@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+BnPeVBKUC1hUG6rLBFmBGNiItitGhTCiTotb5cv/l7pm/fA
	zNHq1vnxQogvk/6BFJO5D03PDoQLoNS+NtXjKK2ZJ/W6GlWYm1cwo6x05eY14tXde9T79KwCH2U
	TGQ==
X-Google-Smtp-Source: AGHT+IGIOvyaIq+arYR+kGxlz5MLXMzKAjfF3gerPhhAkuJUuarivw68VGg1S5URm28toMXSQIBmwPWvzg==
X-Received: from wmbhj26.prod.google.com ([2002:a05:600c:529a:b0:451:edc8:7816])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:828f:b0:43d:ac5:11e8
 with SMTP id 5b1f17b1804b1-451f0b26621mr61939045e9.21.1749137917744; Thu, 05
 Jun 2025 08:38:37 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:59 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-18-tabba@google.com>
Subject: [PATCH v11 17/18] KVM: selftests: Don't use hardcoded page sizes in
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

Using hardcoded page size values could cause the test to fail on systems
that have larger pages, e.g., arm64 with 64kB pages. Use getpagesize()
instead.

Also, build the guest_memfd selftest for arm64.

Suggested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm       |  1 +
 tools/testing/selftests/kvm/guest_memfd_test.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35..845fcaf8b6c9 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -164,6 +164,7 @@ TEST_GEN_PROGS_arm64 += arch_timer
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
2.49.0.1266.g31b7d2e469-goog


