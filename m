Return-Path: <linux-arm-msm+bounces-33824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E187D998170
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A2A0B255D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDC11C7B82;
	Thu, 10 Oct 2024 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfJkRUq5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96911BC9E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550803; cv=none; b=fk5GwI6WDg+TF8rq468mnrUDWrC2WKaYaUbI6bF5e1n6QmRH02zMeqwLoerlxRNoJOaJvlTIbegr49NtC+imAIUnvGBOp0eBt0BC6U+/CKvuIixMW24z7Cxgyhr63Zj0K7st1YoVd3ijbHR8yePLPUUMlEWvYKGeCHdXYvLqyyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550803; c=relaxed/simple;
	bh=rWEgzpXZhYi9ydWJUmAbpEPiQxbIlQmYae02y98HGc0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SCYPfNGpzvubjgx6Tbsl1nS6aklTDFQunlS/OZw0kKI5de2JZiIhOLP04bG9gvU0CMNpOr+bQBewB7+S9egJqbh/GB7IO9K2Sb/X/STdDQd0U3Bm23WZMFxTRI7lFQsGY8ga8ltg7jpFYruOoK9zm+AE1Ucy/XQ6Ej0ppgwZ1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfJkRUq5; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so955156276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550801; x=1729155601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vRqRt9/OdUuC94QGlx1b3LLfUnzhlvtZvk9uJQuMY0s=;
        b=IfJkRUq5UegELD4QSn+0laPFPlceyHVYKugtHvM5KyebukizCnIGW7Keh+kkRNgoW9
         wBfZDMhDGlf+qHBVMYEXpdhNePcloHRu7GuH7RtYS7jdalEt4CbBfrNcOse5arrn26kv
         FLy6cenSeas95fO6QeixEflc8aA4gC/cUWH+//TvmrAtjC8AG/A8/Tm/1lBMgpR/0KAI
         abjszzaHaKQVVplOtMSB5yuuK+MGHw4zxb4c7js0KRBEoJzvw+Vc7sYc00JTgf3xcGG8
         ICAI4UDnKk9eGLJrFGqbTm5GDCPH71yxEivMZbD3FzdYouBkhgYrPG923wWf/la/7wEF
         hlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550801; x=1729155601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRqRt9/OdUuC94QGlx1b3LLfUnzhlvtZvk9uJQuMY0s=;
        b=kL2woDkEukWp8ZaxOu7oC4iandU4Fp/xGfisH/9n7iPJDwVk20B2f+25uUtT6cTfps
         +pUAdtOZlgn3auarmvqxwgD+Yqy1sPX/mDgYNZJhxf9f0xqw8CFZzOZijRfvYL/umgq1
         jMqzLC5hzmwRimbNlwCTCYW0XcbVa7akqukGWBh4c2sjOom597yumyc8pwbiaP8XJus8
         v3yFpQHV26e69DuAYv164jJjoVvhYLKdVphqVBG+mEk6hnXzNbzeyXqpDVCXSGvtWvPJ
         Ib13mMLNMXPoVXKKG8a73lrimVbm083sIndgOpxMF7qfHeFDERD9SMrXUOFcNLo+dS6y
         h+wg==
X-Forwarded-Encrypted: i=1; AJvYcCUdYE1CziRN9P6kTnCTbyZoKsjfAFIQspP/CzyxWEiSZNfAi7AT3bTwlJUMVu3J/wjxgVhYaSfXWmG/SPkb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzagqs1UMRC1AjLqBAhCP4f+7Amlu+SjDEwgNSS+0sCuRzg47V
	cZHHTQyhGQmYnbo2cX6KnoCvjHAPwxKzPnp8x5coofrOh1GV6NfA/5jBjiYg3+wBySaaRT14EA=
	=
X-Google-Smtp-Source: AGHT+IHKOC7WKTbH/ijVUTH38hxdU+Ou0RoKl5cARtWTF5vqoihO6BtV+q30wvio57rQ24Dl8KyceyokuA==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:6902:1812:b0:e24:9f58:dd17 with SMTP id
 3f1490d57ef6-e28fe32f042mr55663276.1.1728550800731; Thu, 10 Oct 2024 02:00:00
 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:30 +0100
In-Reply-To: <20241010085930.1546800-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-12-tabba@google.com>
Subject: [PATCH v3 11/11] KVM: arm64: Enable guest_memfd private memory when
 pKVM is enabled
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

Implement kvm_arch_has_private_mem() in arm64 when pKVM is
enabled, and make it dependent on the configuration option.

Also, now that the infrastructure is in place for arm64 to
support guest private memory, enable it in the arm64 kernel
configuration.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/Kconfig            | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 94cff508874b..eec32e537097 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1496,4 +1496,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 	(system_supports_fpmr() &&			\
 	 kvm_has_feat((k), ID_AA64PFR2_EL1, FPMR, IMP))
 
+#define kvm_arch_has_private_mem(kvm)					\
+	(IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) && is_protected_kvm_enabled())
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..fe3451f244b5 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_MAPPABLE
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


