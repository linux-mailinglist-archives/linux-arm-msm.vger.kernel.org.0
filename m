Return-Path: <linux-arm-msm+bounces-60326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2CBACF330
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 517777AB18D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA7E1F099C;
	Thu,  5 Jun 2025 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bIODptXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B605B1F2C45
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137894; cv=none; b=TuxbcmkKkDx1uampCYBkwb7Rj5XZqPa9KmtooCAsQA/4XEfZqpC6JUIyFzWpgfWfSO9EiAcFtqclEQO5R/3bYsnXxjEWixJyXpZtqgZXz579HZ2TNfebX6rQtX96rrfaEbGXCkCdtPRNMoaGAM1H+aojvGnGTUeizFV8n00Thk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137894; c=relaxed/simple;
	bh=QJgSugRidDozCXPuIRXLTwtSBbKcxzGSNYJamSUOK7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z2JTFrjzWInwchuMWMxIidiY884XnA+45UQeOPCRtJpAbW9L92yQEa2Pu9AiYq4XAOYugVZtifXoQzNG1+nKsxWrv5BPYmbIdHd2acbx+GWXbb8VaISxWa17JdJmYEs9d0cKavNdar91PzaSOGyPAhlWPr+Hfe+NldlAPlw/bso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bIODptXK; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so609142f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137891; x=1749742691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cw6+Mpe4Y9YYGqB7SSsL2ZJhDik53zQn0HS8MVl9BPk=;
        b=bIODptXKyaf5hJFewxCOizmbeUwYTXyAeZ4R9viOGJmxv1746ksKRwttIFXyx2q2aY
         ov3X03++ieRhsrmZdWymVh+QYy94g4NF9E496WYPNicOqx05flE0IjJ1A5nyE4aBeCAi
         l03i4KUsoxDX5RUmYb8mIM8Qpz0/7vPCRArehT45B5PgICyB7p1HspQULUGdFoTUhXw2
         6ba8yMCanjsrs0Bca7FCavU9FkoqHlfBdXc24JQ1BzwQB5OVMsE9vezu7X2OWPCUsx0t
         QoXnZ+CGHfV8DnmmNkl0nQKs4ToQbddFZqJE4JCrq2caJv6VmvXnTZCq8bUZj1isGwVq
         uUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137891; x=1749742691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cw6+Mpe4Y9YYGqB7SSsL2ZJhDik53zQn0HS8MVl9BPk=;
        b=X/Vd6/J/vsp8f6FYGEAcO5NoBA0wTbZsCDF8pz+fZDTY8GN8bkUiuFUXRlGelBNBvM
         cyPAJtjF0wdD2wzfAT0O1CLMVN+ZgweSRI8YXPXpalbrp7DkZ3DkSELBRjAllfHidCTp
         bPLOAJqzKrZ8gHPaagKlv/rClsS1QUCDAbdLvf84hrb5/if1xlvg7WoIPpUIjWYCxa8Q
         9sTNyXLdansGKeaGvmNuWrE3F92XDtpr6T11Wp19M0bcuIBBsJwGIi4CD9Tdp26Rqzlw
         4fTrQzxVoql2S34NveEyR1TrYmwLTDsiuCEwDyIFjlaRGpXBzNyxHtZwpKPvYyDNciNI
         mFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/4YtYdIlLAvtIJ/eRr2WxIDIeLRNM0Uh3ZlOJ6T4cp0LIo3mbR13SwG1y2iBc9zOfTo9pkrDeQZeYigf@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtYK7A6x7Ox2mGVwHTbcFHLPz/oWJghfk9Hie7HgCnnfMlDcW
	DrJ5eroHcpf4OO2napgz58EGeGIaMJ5bdJ1S+hQYpHsLOeHxTO3U/ZqWlnazs+658JY2AcS7yPz
	a1g==
X-Google-Smtp-Source: AGHT+IFYsQ27vypuy4NYsL5G2D3PkTdK4tJz+eGgF3cJ530C6liNPHZmvXo6DXqMwIsM1QvbwO6I/y4yDw==
X-Received: from wrpk13.prod.google.com ([2002:adf:f5cd:0:b0:3a5:2a0b:d7a3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:250a:b0:3a4:f892:de7f
 with SMTP id ffacd0b85a97d-3a51d95dbbcmr6703161f8f.36.1749137891053; Thu, 05
 Jun 2025 08:38:11 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:46 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-5-tabba@google.com>
Subject: [PATCH v11 04/18] KVM: x86: Rename kvm->arch.has_private_mem to kvm->arch.supports_gmem
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

The bool has_private_mem is used to indicate whether guest_memfd is
supported. Rename it to supports_gmem to make its meaning clearer and to
decouple memory being private from guest_memfd.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/include/asm/kvm_host.h | 4 ++--
 arch/x86/kvm/mmu/mmu.c          | 2 +-
 arch/x86/kvm/svm/svm.c          | 4 ++--
 arch/x86/kvm/x86.c              | 3 +--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4a83fbae7056..709cc2a7ba66 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1331,7 +1331,7 @@ struct kvm_arch {
 	unsigned int indirect_shadow_pages;
 	u8 mmu_valid_gen;
 	u8 vm_type;
-	bool has_private_mem;
+	bool supports_gmem;
 	bool has_protected_state;
 	bool pre_fault_allowed;
 	struct hlist_head mmu_page_hash[KVM_NUM_MMU_PAGES];
@@ -2254,7 +2254,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 
 
 #ifdef CONFIG_KVM_GMEM
-#define kvm_arch_supports_gmem(kvm) ((kvm)->arch.has_private_mem)
+#define kvm_arch_supports_gmem(kvm) ((kvm)->arch.supports_gmem)
 #else
 #define kvm_arch_supports_gmem(kvm) false
 #endif
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b66f1bf24e06..69bf2ef22ed0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3486,7 +3486,7 @@ static bool page_fault_can_be_fast(struct kvm *kvm, struct kvm_page_fault *fault
 	 * on RET_PF_SPURIOUS until the update completes, or an actual spurious
 	 * case might go down the slow path. Either case will resolve itself.
 	 */
-	if (kvm->arch.has_private_mem &&
+	if (kvm->arch.supports_gmem &&
 	    fault->is_private != kvm_mem_is_private(kvm, fault->gfn))
 		return false;
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a89c271a1951..a05b7dc7b717 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5110,8 +5110,8 @@ static int svm_vm_init(struct kvm *kvm)
 			(type == KVM_X86_SEV_ES_VM || type == KVM_X86_SNP_VM);
 		to_kvm_sev_info(kvm)->need_init = true;
 
-		kvm->arch.has_private_mem = (type == KVM_X86_SNP_VM);
-		kvm->arch.pre_fault_allowed = !kvm->arch.has_private_mem;
+		kvm->arch.supports_gmem = (type == KVM_X86_SNP_VM);
+		kvm->arch.pre_fault_allowed = !kvm->arch.supports_gmem;
 	}
 
 	if (!pause_filter_count || !pause_filter_thresh)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index be7bb6d20129..035ced06b2dd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12718,8 +12718,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return -EINVAL;
 
 	kvm->arch.vm_type = type;
-	kvm->arch.has_private_mem =
-		(type == KVM_X86_SW_PROTECTED_VM);
+	kvm->arch.supports_gmem = (type == KVM_X86_SW_PROTECTED_VM);
 	/* Decided by the vendor code for other VM types.  */
 	kvm->arch.pre_fault_allowed =
 		type == KVM_X86_DEFAULT_VM || type == KVM_X86_SW_PROTECTED_VM;
-- 
2.49.0.1266.g31b7d2e469-goog


