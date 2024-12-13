Return-Path: <linux-arm-msm+bounces-42101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8E9F12D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15AD8163803
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB2E1F12E8;
	Fri, 13 Dec 2024 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07b0Ny0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0401F3D33
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108519; cv=none; b=XVL5HsFYvR/joE06uttnSyc3SiHGI8ALCOwVhDr47W7yVbNuPZiPVx1d7WWqq3GzWfLekGeov1Jh11PLa4UxdwEjG0RLF3tCh0ReYo05MjSt6SLGQ2w2RAdPaarnswwwHAQRIwEPI2vY21KSbKadYd4kyTsa1cavIhXjUPOCZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108519; c=relaxed/simple;
	bh=nTUBEGVYkg9r5vYRMcM+vZaIEl5r6n5mctx7ZVr18aY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qyPksYNq3lhlfS6uhDmyGc1gdN+oe5NLKdvrQQpEXchS9blhgxf4b+nysYvpb0aHKWeA6OmLmZcoQ15fEbIkel6UW7GF1e+NSTBFaYta39PeYcVs7UuBg1SVd8iLFVcsKsHhOqAwBs1E1ceWEYhOCBu1doKnCn4YHYA5qETt1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07b0Ny0F; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so11561505e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108515; x=1734713315; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WsEDyhBns9NxCkCIdpMm4WAodyMfjoY3V2TpfAI1mN0=;
        b=07b0Ny0FBWrMRLUo1E3nN+OZc0bp3yqnm5vz3ssSUF83tn9fCwrfy+nMTJuHh6Gd1P
         VWrNEiNsy0bAfcdfo5Gvnkar6pBD5zjEr9b7AZ81XYf/qDpmOVtv1veKmVO3JYQpQdy4
         bhBOqR7rNMWPRqKWQ6oKgjJWhkXyqVlF7MfdMQQ0zQkqFeo4czJRC9gcsOd4lDp2Klwa
         JrglEiuF8Q5P1apAA7IwtuP/+32z4/aZ2kLHStlIV9d3uU1OhV/+yJ9nyretsphtln1o
         SpaRTs8D8kYdCgF/sTYXtHxKfwNuMwtGHgGWieF5T2UZf5WuNigoDuwnBgbP9rk/9Egj
         JFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108515; x=1734713315;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsEDyhBns9NxCkCIdpMm4WAodyMfjoY3V2TpfAI1mN0=;
        b=tsw3GQE7qAjCL7oTP0MnmJfy0FtAFeZbdnAF+9iYCvFm4Y8wi3tx7z6Kt/M+qcWwWX
         s+KCxi+IXCeNTsqOFF8RXzNL1DgV/iog3XPXCKNv4vXYYa8q5/25yjRVXAviTtkkN1+C
         MGc7qMO2H9Gz6B/uR7TnST1kC66dyxO8CWm3u1NA/1/W69V0T3FRyjkJ8rqPBIxtdYhw
         /byip+PmUfiW9zy8BWEFGBn6PS7EW2IESRJeNvtPIS3ogNUpAaVklMo36b8XswYeCoC3
         dgWBIXWzqX3A6z7H96NLYaM+wO2QKs5hXhDqvA1KCYwiYTTHK/UXUPN2z9I13eHuuLJ1
         fRMg==
X-Forwarded-Encrypted: i=1; AJvYcCWow4avfYkoMmhNakc5Y2IqzfrMKYEN4bwy5GAi+S4AjJnr4sjKyQInCZRZoDGEDOk5pLWEeb3lgWtJMu57@vger.kernel.org
X-Gm-Message-State: AOJu0YxNi4dkNM+rUGBBpxapw+yEJWG69S5JqcdSwXgzs78+lCpGhYdv
	WS1JFahK1iSy+Q9pO+tnUXCEcEQxOOsuNBtjRo7izYHlQv+6JCWhKnZCtGt/IGMRVj9eYhks+A=
	=
X-Google-Smtp-Source: AGHT+IGBPIX0XH2E/QAG4VVkoTgxq7y6qEK9iHPxA7arOJ8hwxyGtcqtTyclPQC42evEdmBRc/aMqmUXOw==
X-Received: from wmox24.prod.google.com ([2002:a05:600c:1798:b0:434:f7cf:3389])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1da4:b0:434:faa9:5266
 with SMTP id 5b1f17b1804b1-4362aa43222mr32447565e9.13.1734108514902; Fri, 13
 Dec 2024 08:48:34 -0800 (PST)
Date: Fri, 13 Dec 2024 16:48:06 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-11-tabba@google.com>
Subject: [RFC PATCH v4 10/14] KVM: guest_memfd: Add a guest_memfd() flag to
 initialize it as mappable
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

Not all use cases require guest_memfd() to be mappable by the
host when first created. Add a new flag,
GUEST_MEMFD_FLAG_INIT_MAPPABLE, which when set on
KVM_CREATE_GUEST_MEMFD initializes the memory as mappable by the
host. Otherwise, memory is private until shared by the guest with
the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst                 | 4 ++++
 include/uapi/linux/kvm.h                       | 1 +
 tools/testing/selftests/kvm/guest_memfd_test.c | 7 +++++--
 virt/kvm/guest_memfd.c                         | 6 +++++-
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 454c2aaa155e..60b65d9b8077 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6380,6 +6380,10 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+If the capability KVM_CAP_GUEST_MEMFD_MAPPABLE is supported, then the flags
+field supports GUEST_MEMFD_FLAG_INIT_MAPPABLE, which initializes the memory
+as mappable by the host.
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 021f8ef9979b..b34aed04ffa5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1566,6 +1566,7 @@ struct kvm_memory_attributes {
 #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
+#define GUEST_MEMFD_FLAG_INIT_MAPPABLE		(1UL << 0)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ce687f8d248f..04b4111b7190 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -123,7 +123,7 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
 static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 {
 	size_t page_size = getpagesize();
-	uint64_t flag;
+	uint64_t flag = BIT(0);
 	size_t size;
 	int fd;
 
@@ -134,7 +134,10 @@ static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 			    size);
 	}
 
-	for (flag = BIT(0); flag; flag <<= 1) {
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD_MAPPABLE))
+		flag = GUEST_MEMFD_FLAG_INIT_MAPPABLE << 1;
+
+	for (; flag; flag <<= 1) {
 		fd = __vm_create_guest_memfd(vm, page_size, flag);
 		TEST_ASSERT(fd == -1 && errno == EINVAL,
 			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 3d3645924db9..f33a577295b3 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -939,7 +939,8 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_gmem;
 	}
 
-	if (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE)) {
+	if (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&
+	    (flags & GUEST_MEMFD_FLAG_INIT_MAPPABLE)) {
 		err = gmem_set_mappable(file_inode(file), 0, size >> PAGE_SHIFT);
 		if (err) {
 			fput(file);
@@ -968,6 +969,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE))
+		valid_flags |= GUEST_MEMFD_FLAG_INIT_MAPPABLE;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-- 
2.47.1.613.gc27f4b7a9f-goog


