Return-Path: <linux-arm-msm+bounces-66245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABDB0F043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6888A175552
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084842DECA0;
	Wed, 23 Jul 2025 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o1qTjneG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB7279327
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267646; cv=none; b=gJLEVWJIIW4fO5QCvUJTkRXCVVhrvw4ovaDEGoSwKm1EwfT9J4FW2DEElWziTVbjNXU84IX7SGBfiwL/yXJKeWoqYdvt5uNSKCIj493lUR1HE0uDA1PHOc4vdOiBv7gqAo8z1S7BnDU6vH3fqsu4E+eaOkFnLXz9duRTvu2qDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267646; c=relaxed/simple;
	bh=X2UnKEstGo4dvjCoZ5gOAq//oBrh8730fp8cQehcNxQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PEjMpuRHmtgOtvlB8I2wEmWBwXHJ69+42rCgYEh0vuwLLHEsCrbkw0GGIeTfSY+fKvz99dBQlY4eNpICJyTmhctxE0zjVOkVTXe+wFY4ftzB/BP8RUUNIMCVreUfLdEmX9o0EoGFAxRtJYnf2UvLp2f0HzC4NbGv8RI8NRpMusQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o1qTjneG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so37245915e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267644; x=1753872444; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++/QPN6SuFMfkHRmjrhS6+IMVKdQVW60svD12JCzsMw=;
        b=o1qTjneGESIdVLPAI3L70PpwaanDP8frZemcYJh4dOkXTrdBODvHuI6OwpZGdBovVq
         R9CCmj4kGo6L9FjKT+cTa4QA3wtFOx+thVKCRfbTu9QTAW4BS1RmBNKoVbw1OZCsRHL1
         aupbGbLRUDuvpsG0Wk60MD9auEHaTC+ExsWcFXYcKmYt2+8DcYwTVu4SfSIyRGaKKyGn
         qUQBzapyOF9+0kuuczCt1L2cKvmCEbRc3LB6yYOOXhYARVE3HW5EeIYGuf2MgvvxaPQO
         giFTpbdRNH1j3Z5S94sNQdXl9rewWlaHi7WBLZA/p4KZPpQ/J8Vk8HF+MRESUoOlmMR7
         dajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267644; x=1753872444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++/QPN6SuFMfkHRmjrhS6+IMVKdQVW60svD12JCzsMw=;
        b=abK+5jDWfH8ctOMdbdHmMbzz9/pU24T9FRQy3WzqD+Df9JRaRj07/VJk3MA+Zoz9dx
         2f05RdWY+5qd/3vJDdDVwoDcIlZyz2YHEWFQn2BsLYLrveBSAJ7YY95vTJNDtS1Taqd1
         aI1qJZD9Bicg9LaUBFobHO4bRG71Uzz2JMIYNRZGAeUpczdxP4g+dVPL8wzrbaKpVU2E
         zj5f6Ep5CYCNgDFpjhiqmtHhiyQ4qiOf54FM2CFaPSMcgK/MpEVyNgt/37SK7VgDMZlw
         Dc2qBDlUwDWmyuDzaUOQTQqMTkQ4JEaPDrloRXNeFbCddohvR70I1YLN0rmd4BnwTXC0
         +O2w==
X-Forwarded-Encrypted: i=1; AJvYcCXLWtlSNvYJyuvtJGNc7R3ImvywF3CXhuODa4L7Sc4u9ifP4wM2ySsc2XlsrgB9oCekaLTZiQVQJWZu//vl@vger.kernel.org
X-Gm-Message-State: AOJu0YxnoezO+Z1/cONjzXtR42VBeGr2WV4cUr6QllrkN5TVAE479Oka
	ttdk7Lsk0S6l5TwhcR0hlSkomd5xi4KRq/+hHEEOSCzSljmPHylDpCHcRxvO3Bu1UDp3OHl9y4g
	s0A==
X-Google-Smtp-Source: AGHT+IGh1e+V8SmScKMa7B9rDGNrVFkyz19g/99WYS3fME9s9rYU5XZGuebCy3D5fzuVYuNyo6dDcGaEqw==
X-Received: from wrov11.prod.google.com ([2002:adf:edcb:0:b0:3a5:7883:6563])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1449:b0:3a5:1c71:432a
 with SMTP id ffacd0b85a97d-3b768ee0916mr2198617f8f.14.1753267643374; Wed, 23
 Jul 2025 03:47:23 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:47:00 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-9-tabba@google.com>
Subject: [PATCH v16 08/22] KVM: Fix comment that refers to kvm uapi header path
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

The comment that points to the path where the user-visible memslot flags
are refers to an outdated path and has a typo.

Update the comment to refer to the correct path.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5c25b03d3d50..56ea8c862cfd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -52,7 +52,7 @@
 /*
  * The bit 16 ~ bit 31 of kvm_userspace_memory_region::flags are internally
  * used in kvm, other bits are visible for userspace which are defined in
- * include/linux/kvm_h.
+ * include/uapi/linux/kvm.h.
  */
 #define KVM_MEMSLOT_INVALID	(1UL << 16)
 
-- 
2.50.1.470.g6ba607880d-goog


