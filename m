Return-Path: <linux-arm-msm+bounces-64194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06DAFE6D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5343C7A807C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46586291C0E;
	Wed,  9 Jul 2025 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wxE1iSku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2152900A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058811; cv=none; b=VabujUNSwjKrsgAcEeKBqyUicdL2vAUA7JI4LEw7IPpfnvXe+zGiQjm2auGJeKs2QmDPwI2UIVu271KZcLA52Yk0nyiCTAZWwOOVgatlxZ6K7HUzamKONVFGEl4VYiIGVgSCFd20bCG+PMvANV0z9nHxmmCx0aTTjdEgV+b5V+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058811; c=relaxed/simple;
	bh=UpkeXIr5tQW6WZUIX1SkZk2bJqJ9LIMknrPnyTPX/hM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UwwRuT0+4OhSExsSs0HGIsCRMCLqFWf8BjHndYspHm99RqZzlcZqzcSEBUZ3/9UWBVIN3Ltq9mqu0CHoI/bqpgQHM2w+tP7F9wctR3WG0GfzXQkr2CK4zTUNENhm3SEGpJv2M3Ndk+Y5lCxfQaMGoqL5hUpqRRPGwkqM+yuKCh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wxE1iSku; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-453a5d50b81so40629115e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058808; x=1752663608; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUcEiOcnnzGKcpkNw8uc0ad9PF+XFRDotUiBVoaU7aU=;
        b=wxE1iSku86onn/Q/3pIZfKNmuIomHvhMv8N7vd2NC79uGOYbjHw0dxGKI+ggttc7oe
         mDPihb9FLXuS8WlDTAzKETntS/2OewVhmXtWTYo2baKcGgfRYq7FJX7J++2TXlfF5yGf
         OBOHVH0WOqnln9WbkvfVJgU7vQzshEFbg4Z2iu8Y/FP/NADd9ZQIbU6qNgEzuuSLkVfm
         98huerWqiXH3ygQEbVUQy6UdwCnj7pRc3a168y+GWLWjf/cD2wjnzP711YUZNBBF1SnI
         4knaKOZMrfZwDreQrtF5eiGqpRmP2AYI8heVIieeou+uAHPhuepijI+A9cx08zTdzdNe
         AtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058808; x=1752663608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUcEiOcnnzGKcpkNw8uc0ad9PF+XFRDotUiBVoaU7aU=;
        b=tWjpDhhKLjoRTwMfh1Af0hKGzkhdUmhG+AHBOpryZN4bPkyre43UlTzvk6+cOiKdez
         2jhYvkb691Pnp2Hrkdd9mfKw8+y5ZokwJq+rlfn0ZZhn6aGct8l+pVql3frlliXBb9rn
         gkrkPlbkXOyZoJP4B6XwTQcoHbXbetw8DTDvgp6Wr4eitmznX1yMyO7HPgVu8GjelP0B
         SCp6vqy3ZJWwNxJNFuS4t0ZCFabsHKpFfRctTXKD9BAFHAexM8USbslPeYchL2uzHQ02
         07OWlrHs/h6/PA6rlup1AD3zLaSoNh/OyHQ7FEsScT06zy7aGvU5ydUQXo8yLrrjTxHi
         2P5w==
X-Forwarded-Encrypted: i=1; AJvYcCVCv/VVYtGAcMJjRT5iPty0ENZDQBtwplPgs/GofD95zJby7O7dFgHh7sM6gWe+Yvv4iG4SQd2RMfQjpjy7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+yayX6hJVDTKgvTsy8lzZ1M7rejiXI9DuMjAFvSl01yVvYka
	OCxPCopFrzqqSjUVruC5kRbinWE6jNofdZCLFD9NC3eO5tcwSjeiPcgnKzVzhKherGqxcvMZ9fI
	GQA==
X-Google-Smtp-Source: AGHT+IFL75zyGMq5td+nbGAgOpuMz9UV8SdfC+YGNoaNssj8m4kdXpNab0sj5J+3kBesWtcsJWy4R8XuHg==
X-Received: from wmbep17.prod.google.com ([2002:a05:600c:8411:b0:442:f451:ae05])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6f1a:0:b0:3a6:d7e9:4309
 with SMTP id ffacd0b85a97d-3b5e45380f3mr1576649f8f.29.1752058807622; Wed, 09
 Jul 2025 04:00:07 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:35 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-10-tabba@google.com>
Subject: [PATCH v13 09/20] KVM: guest_memfd: Track guest_memfd mmap support in memslot
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

Add a new internal flag, KVM_MEMSLOT_GMEM_ONLY, to the top half of
memslot->flags. This flag tracks when a guest_memfd-backed memory slot
supports host userspace mmap operations. It's strictly for KVM's
internal use.

This optimization avoids repeatedly checking the underlying guest_memfd
file for mmap support, which would otherwise require taking and
releasing a reference on the file for each check. By caching this
information directly in the memslot, we reduce overhead and simplify the
logic involved in handling guest_memfd-backed pages for host mappings.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 ++++++++++-
 virt/kvm/guest_memfd.c   |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9ac21985f3b5..d2218ec57ceb 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -54,7 +54,8 @@
  * used in kvm, other bits are visible for userspace which are defined in
  * include/uapi/linux/kvm.h.
  */
-#define KVM_MEMSLOT_INVALID	(1UL << 16)
+#define KVM_MEMSLOT_INVALID			(1UL << 16)
+#define KVM_MEMSLOT_GMEM_ONLY			(1UL << 17)
 
 /*
  * Bit 63 of the memslot generation number is an "update in-progress flag",
@@ -2536,6 +2537,14 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
 
+static inline bool kvm_memslot_is_gmem_only(const struct kvm_memory_slot *slot)
+{
+	if (!IS_ENABLED(CONFIG_KVM_GMEM_SUPPORTS_MMAP))
+		return false;
+
+	return slot->flags & KVM_MEMSLOT_GMEM_ONLY;
+}
+
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
 {
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 07a4b165471d..2b00f8796a15 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -592,6 +592,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 */
 	WRITE_ONCE(slot->gmem.file, file);
 	slot->gmem.pgoff = start;
+	if (kvm_gmem_supports_mmap(inode))
+		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
 	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
-- 
2.50.0.727.gbf7dc18ff4-goog


