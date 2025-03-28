Return-Path: <linux-arm-msm+bounces-52787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F75A74DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6031418910CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E871CAA8E;
	Fri, 28 Mar 2025 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qzDocxv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F1146A66
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175911; cv=none; b=MB3HDSXrWfLirY1jK/Om6rGL9AuQQWU2WU/a93ftivaxn2CWFDz3pT6D5SiKzrFyzR5wQGEz2EzgvnUsXslEFnbCgiQa6HNP0ukKL+ZflHLfPDZeGFYxTBJtx5ZHjbhj9mrb74TYnqMbcA+3HqS7qqQIb8tE6Ffi3PP3jvSh7fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175911; c=relaxed/simple;
	bh=Sv6NOiNAFHxHxhBPG6LmgRVSoo0Z12cLiekiQ8g6R/c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JOGcInvXWqUOOmgaNaelWhtl/xOIrShgDXcXfUGMiW4yznheOflrQlKs4OCzpp8V+ThHbJshZ7pzhNN25bTTkgthL4hncliPhxX5dC04XZse2O5KsWpgFCQCfczV2F72CeW4qMtrzdIxZzZGv3v4kTyhP4ZFwtooZOsElNzez50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qzDocxv/; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3912539665cso1642043f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743175908; x=1743780708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv/1E0AU+NyqHw7xnz4KzldcKMV/7tB5wdC54OSV0gs=;
        b=qzDocxv/L4MAcrrIXAid9GSxGes7kty3sNlgv8JZuRmJl50/lyosZLwwWdCC4q9rzK
         gZyIcQgNglUJMDbLuUFOQBPn+8qq4KJuVsg6xJvQT9yELUSTiDcddXa30hO8aVdI24IL
         P+n7NVpBQVJu5YONUzXxWAXuuAOPTwzPdadx4QfhWFDPUy3wnRO1vzg8giN2hpilIG+N
         fjmtCki6/Vr94Rpk+TxfWAU6RO5yXFuwMvrjZ1Gj0Q1JGVKM7uRLvnMcZWUpWnE4K/fS
         MQB5E7vniqTpNsfSlNvFCmGhQRG2R7WhfmBBYkPthWCBgC5N4i+t1f5H4BwdsCsjO4tJ
         3jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175908; x=1743780708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv/1E0AU+NyqHw7xnz4KzldcKMV/7tB5wdC54OSV0gs=;
        b=RkHUfkBc7egqbSMdvjMbVv8WYCGlZVjO0MSGPD1Dcp4hX9zLiiq78a+kucwIXeQ/Tv
         l0ukWUrB0H/WQ/FuNOf4Z009SKwiALf/wujrgXs8lnyufl4ieDd3+Dtok193Sqngqz5K
         9PAlMYIvVoIxH1ZjvOklTufgYButApJp13xbTX1qxlZopIz7VRd9PYir6l6/QT5OGvkt
         1RR7PUz2w/Nx7s0spKHMNyElrrAbnPhFqavsE0UWehwytISorUVBJpW5kM12yhqVvMnE
         9U6pLeK7b1A09OXHqa3v7IFvh9q+pggmoGU09jyZR8DjjNztkg8JwMblLk3IsQLuPYw0
         KPiw==
X-Forwarded-Encrypted: i=1; AJvYcCVARdVNkkXz5vuXy0QtloZkjbEBzp6lgdG5p7tYPpFBJ0voDXKml1ct3CJXjYLgL3Pa7D4Pri3EKr1aAFnQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGI14GvkTe99XxHmBaku1kHV1e1ziXPR51uMCmp59aJVjVrx7
	82sPUJx+Ttex29DFPDhsaim0+baOi0VFXcY44XO3XiVphfryGocsEKEt0+XQz3S1nsYF+cQ4TQ=
	=
X-Google-Smtp-Source: AGHT+IFlQ1UrYxh5xtzAR3ixBktqgMp71GraHERqKS0AjfxoTOcZj42vAVyGIN1u0tDDWZHdqWBm4jW8+Q==
X-Received: from wmbje14.prod.google.com ([2002:a05:600c:1f8e:b0:43d:4038:9229])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6d02:0:b0:391:a74:d7e2
 with SMTP id ffacd0b85a97d-39c0c13b8bamr3105305f8f.26.1743175908326; Fri, 28
 Mar 2025 08:31:48 -0700 (PDT)
Date: Fri, 28 Mar 2025 15:31:33 +0000
In-Reply-To: <20250328153133.3504118-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328153133.3504118-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328153133.3504118-8-tabba@google.com>
Subject: [PATCH v7 7/7] KVM: guest_memfd: Add a guest_memfd() flag to
 initialize it as shared
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
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Not all use cases require guest_memfd() to be shared with the host when
first created. Add a new flag, GUEST_MEMFD_FLAG_INIT_SHARED, which when
set on KVM_CREATE_GUEST_MEMFD initializes the memory as shared with the
host, and therefore mappable by it. Otherwise, memory is private until
explicitly shared by the guest with the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 Documentation/virt/kvm/api.rst                 |  4 ++++
 include/uapi/linux/kvm.h                       |  1 +
 tools/testing/selftests/kvm/guest_memfd_test.c |  7 +++++--
 virt/kvm/guest_memfd.c                         | 12 ++++++++++++
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2b52eb77e29c..a5496d7d323b 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6386,6 +6386,10 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+If the capability KVM_CAP_GMEM_SHARED_MEM is supported, then the flags field
+supports GUEST_MEMFD_FLAG_INIT_SHARED, which initializes the memory as shared
+with the host, and thereby, mappable by it.
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 117937a895da..22d7e33bf09c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1566,6 +1566,7 @@ struct kvm_memory_attributes {
 #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
+#define GUEST_MEMFD_FLAG_INIT_SHARED		(1UL << 0)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 38c501e49e0e..4a7fcd6aa372 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -159,7 +159,7 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
 static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 {
 	size_t page_size = getpagesize();
-	uint64_t flag;
+	uint64_t flag = BIT(0);
 	size_t size;
 	int fd;
 
@@ -170,7 +170,10 @@ static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
 			    size);
 	}
 
-	for (flag = BIT(0); flag; flag <<= 1) {
+	if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
+		flag = GUEST_MEMFD_FLAG_INIT_SHARED << 1;
+
+	for (; flag; flag <<= 1) {
 		fd = __vm_create_guest_memfd(vm, page_size, flag);
 		TEST_ASSERT(fd == -1 && errno == EINVAL,
 			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index eec9d5e09f09..32e149478b04 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1069,6 +1069,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 		goto err_gmem;
 	}
 
+	if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&
+	    (flags & GUEST_MEMFD_FLAG_INIT_SHARED)) {
+		err = kvm_gmem_offset_range_set_shared(file_inode(file), 0, size >> PAGE_SHIFT);
+		if (err) {
+			fput(file);
+			goto err_gmem;
+		}
+	}
+
 	kvm_get_kvm(kvm);
 	gmem->kvm = kvm;
 	xa_init(&gmem->bindings);
@@ -1090,6 +1099,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
+		valid_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-- 
2.49.0.472.ge94155a9ec-goog


