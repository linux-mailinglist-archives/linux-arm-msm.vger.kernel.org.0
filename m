Return-Path: <linux-arm-msm+bounces-65526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A45B091D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 072B51C44E77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3542FF47A;
	Thu, 17 Jul 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CC/GuS0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F672FF462
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769673; cv=none; b=Z1NHYIy2KdUmDGrHCc34mixOvTEl2/9mkH5YfbGjIAEqaRAvFWKS8wkaZo3h/+arhuvXddcj2C1ovNSaGlLIhDusEmM9gWehCuzc77UIWifOnGU+GWPQeTQEYG4nlyUmnqz/ACBAfSFYMgej4DFN3esoU1i73qknMnEaHIB3ct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769673; c=relaxed/simple;
	bh=1w8Rf4FIk8UShH9xK6GMjNGhBeuY0pcttrOoAcb/Rxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vE9bwpfjJilqQ7HX4FpbaqFER3vLKobzwO0wg6RmXL0tSYDD4BX2W30SwQEuJhWcPSpLUpoHrc5Q7JXpsQ6x46KMuRRqDCJKn4qIXrwc4BA7pW5FVDnGbviWgvocS9hGROEG8wxr5V/lwVL/L/0ShMwraXfJPNl8stH/bVUYaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CC/GuS0X; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so515495f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769670; x=1753374470; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ed5EKdzH3JskFWB3i3+fISnWrXK1xmjcG1/JKwjT7fs=;
        b=CC/GuS0XJHYakQWggwFikhqw+1eueHYqfYIIfWMC4Hyp8DSEybYoh735extcv32V68
         kq05v6nDx7saMHUP8bZzeB0YaES78Hm63PvS5Jt6dDarIsEIfIMmT1VHdDmCLVYavEwU
         zYN+IfGoofq2DXeTg9L2BM6yHKhhbaggUVT40F2ewfOYPRl5RLpw8FshXeSrotG10ef9
         4NJi1lxkeZuFWvMQwWawlJYOdrYxGYgV5KsmZ7pDIk8GvISwf/12x14deDi3CwYqnyb8
         9ACwqFm0+BBRg2g+jGGtJqly/mDQAf4dduZmfNJgx5WQjNSjP1JQ33xUsjLS9nmUAGM2
         OWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769670; x=1753374470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ed5EKdzH3JskFWB3i3+fISnWrXK1xmjcG1/JKwjT7fs=;
        b=lO9DC8TTCA3pda/95KJ5TFNkr24eAnTR+z3gj18YEg8YTGO4VF35+ipaUJ1GVI0rMz
         DLy58W0LYELqXtsEr2txqmFTBG+MxjAeTlhaXlcXydOWk8ObWroNd4J6FNKL4K1tF4IZ
         5uB+e2o+VyxQ9ouH89Pc9TxBEozN8QZjYIXOD8z47m8c9Fs9N2qUFsC4gc2Aqavp05Go
         tQj2CQ0ygk4cVcCmMy9+nioDSDo+AO6fiOGNJvpcqMD/d6bqaNdIl1q3bDgkTQBTmShg
         Po1IZ1af4UjNhih1qoWmsw7xBWmJq6nriLi7Pht53suecrE2Pmz+r3VEuULj2epGNyHv
         mTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsMTYHmMiWGyCFSf4cfNBMgMZDfK7E5ZqsUGaNCF6zvf5HcougL/mHTcrQ5cfvQARSfmCgQCVLcLBhJvPy@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJXt3pwYjS3ltxfVL7wnzbYUMK6N6+Yg0uGS+efaJKn+rA6Ta
	oySHGTCkGMD5kRxfJkD1OG4CJnOPtwSSP78A/Ga2BWqTTlmQuBVLGl73kXeWTImfTKUET9KVEYM
	khQ==
X-Google-Smtp-Source: AGHT+IGrLJKVjEgj1SDZnlDcjyoevRtzuYkOn+gCuJEKU5WteK+MJa4KEFRnnHxiW/w0ZR9dr94c/ATmfw==
X-Received: from wrus4.prod.google.com ([2002:a5d:6a84:0:b0:3a4:eeba:2067])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4305:b0:3a4:d0dc:184d
 with SMTP id ffacd0b85a97d-3b60dd95c4dmr6783204f8f.27.1752769670073; Thu, 17
 Jul 2025 09:27:50 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:27 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-18-tabba@google.com>
Subject: [PATCH v15 17/21] KVM: arm64: nv: Handle VNCR_EL2-triggered faults
 backed by guest_memfd
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

Handle faults for memslots backed by guest_memfd in arm64 nested
virtualization triggerred by VNCR_EL2.

* Introduce is_gmem output parameter to kvm_translate_vncr(), indicating
  whether the faulted memory slot is backed by guest_memfd.

* Dispatch faults backed by guest_memfd to kvm_gmem_get_pfn().

* Update kvm_handle_vncr_abort() to handle potential guest_memfd errors.
  Some of the guest_memfd errors need to be handled by userspace,
  instead of attempting to (implicitly) retry by returning to the guest.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/nested.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dc1d26559bfa..b3edd7f7c8cd 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1172,8 +1172,9 @@ static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
 	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
 }
 
-static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
+static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 {
+	struct kvm_memory_slot *memslot;
 	bool write_fault, writable;
 	unsigned long mmu_seq;
 	struct vncr_tlb *vt;
@@ -1216,10 +1217,25 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
 	smp_rmb();
 
 	gfn = vt->wr.pa >> PAGE_SHIFT;
-	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writable, &page);
-	if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
+	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+	if (!memslot)
 		return -EFAULT;
 
+	*is_gmem = kvm_slot_has_gmem(memslot);
+	if (!*is_gmem) {
+		pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
+					&writable, &page);
+		if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
+			return -EFAULT;
+	} else {
+		ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL);
+		if (ret) {
+			kvm_prepare_memory_fault_exit(vcpu, vt->wr.pa, PAGE_SIZE,
+					      write_fault, false, false);
+			return ret;
+		}
+	}
+
 	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
 		if (mmu_invalidate_retry(vcpu->kvm, mmu_seq))
 			return -EAGAIN;
@@ -1292,23 +1308,36 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 	if (esr_fsc_is_permission_fault(esr)) {
 		inject_vncr_perm(vcpu);
 	} else if (esr_fsc_is_translation_fault(esr)) {
-		bool valid;
+		bool valid, is_gmem = false;
 		int ret;
 
 		scoped_guard(read_lock, &vcpu->kvm->mmu_lock)
 			valid = kvm_vncr_tlb_lookup(vcpu);
 
 		if (!valid)
-			ret = kvm_translate_vncr(vcpu);
+			ret = kvm_translate_vncr(vcpu, &is_gmem);
 		else
 			ret = -EPERM;
 
 		switch (ret) {
 		case -EAGAIN:
-		case -ENOMEM:
 			/* Let's try again... */
 			break;
+		case -ENOMEM:
+			/*
+			 * For guest_memfd, this indicates that it failed to
+			 * create a folio to back the memory. Inform userspace.
+			 */
+			if (is_gmem)
+				return 0;
+			/* Otherwise, let's try again... */
+			break;
 		case -EFAULT:
+		case -EIO:
+		case -EHWPOISON:
+			if (is_gmem)
+				return 0;
+			fallthrough;
 		case -EINVAL:
 		case -ENOENT:
 		case -EACCES:
-- 
2.50.0.727.gbf7dc18ff4-goog


