Return-Path: <linux-arm-msm+bounces-60331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A738DACF338
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921F31753CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD762741D4;
	Thu,  5 Jun 2025 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bxP8yivv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524219D092
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137904; cv=none; b=Rh9i3JygqMAqVopVJG2x9UWEyR9BWK2UDnrCOpe2409S4RuJzNyyzoSAuG3eUs7KwP3ibUBD/aSg9v/IU0X8FtMSCEXJNljTSmfl0BHqzi1TsvVh+lPcNMT1KymZcAIHGG9KOTvXr5039q3dYG8oeyio8kbh5s9CZcm2PWlYCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137904; c=relaxed/simple;
	bh=/gDlC+c+mYbhEIjFER9Aypoi49xuhmQpWh2Jln/swxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IibwCaRc4ogmlu/TkMwYrJ6Ce/SylsuIE7q60NXG3V+YkzcY1uf5aiHu5cZh42L/KY+86yR2MvbZMmqfnSDpYV09Hec3DtNb3y/AAULeHv6HXSq5fVPvVZZ+6MCKU6GXHW1nL35Zhn8jD90EuNKTaa/BQ1dstu+ka/F9lQYkbwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bxP8yivv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450cf229025so3238425e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137901; x=1749742701; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMdvYQ/d0VW8VpJk25WKourz4e44AIQm8pQAcHG28VM=;
        b=bxP8yivvo5aAQF7BLgoYQoFDCm8IrD4EA3rkr7T6QLnUOQxeeqRlhANIb5dz/W/OAH
         SyVNZSpFhMLMBR1rFsxeBC3amA1WQNgd9SGezy/754EgAP1X+xs44WgUrlL8xk40sg72
         shEmOW+XVPZ97s4VSskX3vi3goKKBo9cPHhhJexahlp2RZtIWqZDJl0URjI896MMIUD8
         kEKNxvugxgUH1e+MlT6fdMfGpJiDgOrdA8khmIX7XglRRO/0nneENXRYnyvZc3eTGipe
         m3ioABh/sYOD5Dn3W1oZWXmwy5hkqGAjRXWiwPB9CQa4yYYBCvHU+6YeRtoZztK8gY9x
         MsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137901; x=1749742701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMdvYQ/d0VW8VpJk25WKourz4e44AIQm8pQAcHG28VM=;
        b=t6Pck8BBaQ8Vrxq/mA3Ne1HJI9oOGDh10ZUMp3efAm+k42TTG06udH6ytVASOWJDRA
         12hgjeCwm5RWttF4hv7YR2ZFzedLq4D4js60KV5JdRdcFsq1yyyaXOifgvDQ72BBC9Wb
         ActFkRiyMNGnn5X96OO39Z4984lpOh9/D1gU8LGiAuduyJiIVkO5i/LpbtRnoZPqDfCe
         WZZNl03XH610HAQEzOyEoqVQP8/Xxr4DPi1MhTnuxbSPv0kouegNDtZ34d+VcP4es64g
         fAAt6/Isjk9vRMGNCB12T2NtopZ7y8Wku6wZxiHnfOVIYaFfXAGNM3fq3qldcdABfm/R
         GZCg==
X-Forwarded-Encrypted: i=1; AJvYcCWZM0a+W7vrNQ3aSWDTxthCneyJE2RUSgSBrISjKfo/1Ap4Xtljq+es4sCBv4CuCaKbYDyjVmwwK7IqqKsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7H5rnI/hIVltDqbdh4a2t/O8bQR+OzuCdhDX6xZ9h2WpZnSXO
	IiaJd3SDW9gWawXFPAVyc8iNHa2eE+dMgldFGlVjcn0enQw0ujNp+/V17P+SZovXIkK9dfHRx8a
	+rA==
X-Google-Smtp-Source: AGHT+IF6u3Z6Htlnfn5ZxQZU8datzZcfLbCYrTGAifog68TQ1MWi4ePY32WlwAmGrzeUYho49K/iYdDukw==
X-Received: from wmbjh14.prod.google.com ([2002:a05:600c:a08e:b0:442:f9ef:e460])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:870c:b0:43c:ee3f:2c3
 with SMTP id 5b1f17b1804b1-451f0a636ebmr71631385e9.7.1749137901405; Thu, 05
 Jun 2025 08:38:21 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:51 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-10-tabba@google.com>
Subject: [PATCH v11 09/18] KVM: guest_memfd: Track shared memory support in memslot
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

Add a new internal flag in the top half of memslot->flags to track when
a guest_memfd-backed slot supports shared memory, which is reserved for
internal use in KVM.

This avoids repeatedly checking the underlying guest_memfd file for
shared memory support, which requires taking a reference on the file.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 11 ++++++++++-
 virt/kvm/guest_memfd.c   |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 640ce714cfb2..6326d1ad8225 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -54,7 +54,8 @@
  * used in kvm, other bits are visible for userspace which are defined in
  * include/uapi/linux/kvm.h.
  */
-#define KVM_MEMSLOT_INVALID	(1UL << 16)
+#define KVM_MEMSLOT_INVALID			(1UL << 16)
+#define KVM_MEMSLOT_SUPPORTS_GMEM_SHARED	(1UL << 17)
 
 /*
  * Bit 63 of the memslot generation number is an "update in-progress flag",
@@ -2502,6 +2503,14 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
 
+static inline bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
+{
+	if (!IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
+		return false;
+
+	return slot->flags & KVM_MEMSLOT_SUPPORTS_GMEM_SHARED;
+}
+
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
 {
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 7a158789d1df..e0fa49699e05 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -595,6 +595,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 */
 	WRITE_ONCE(slot->gmem.file, file);
 	slot->gmem.pgoff = start;
+	if (kvm_gmem_supports_shared(inode))
+		slot->flags |= KVM_MEMSLOT_SUPPORTS_GMEM_SHARED;
 
 	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
-- 
2.49.0.1266.g31b7d2e469-goog


