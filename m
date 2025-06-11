Return-Path: <linux-arm-msm+bounces-60977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDA8AD572B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD9157AD1D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D6F2857CF;
	Wed, 11 Jun 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OlZDoll+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35F29AAE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648829; cv=none; b=qYjdfoCqH3BQnK1eaAnJFDapycnFmBL9Lhf5ImFAKc3Z9bWPCZF2QOWlwGOhNN4k1icpbI/uLBL7t9RpK5CSd9z5WInDbdWuqjptHF67vLq6nTIeJK6Hi3O7RBdXOq3J/X/kSZHdruO3yVQ3E9wjZ+s8beW6chEHH8l0pqfg0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648829; c=relaxed/simple;
	bh=uVZJEiHocoaakWHyA3fg/NdyzZ7cVeeLc6jmjENhZ/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aV/m8n1yyXZHphl4Xbl3kwlxbEdlBqudgbTg44X9AVWirrFgjIusoWoqLGcZi78TWxx/6YW9LhwXovZF+iPYJMO0dt1AdrMDlk4RXGXgdBD00rTEvKDiBZ0Fc4Zb3aD1o/Zqhv8WPNH1LW/ga/DTaMRwm/hNSrAgJ4QGAsOP/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OlZDoll+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4532514dee8so7445725e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749648826; x=1750253626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipoP8xNDjEIconCL8zxlaSKecDJQOQHycTLmRsr3jsI=;
        b=OlZDoll+8PkEePr4Nh1eZ3T1F+1m5ur6UB6mMvBvz842/F8R9oGzRVzKEXIpgNqhb+
         xI9FnhYFlryEQu+4n4Qr+tPsQYS1U0rD5nd62lfu01nF01C1vdamyh2bVOwtEC27PE9Q
         vhL8QbJwEOrOxgJyB02+MLtFsc1dSMSxbG8ta7WKFU1Y0rqt6IWEqFSupGHzcKFv9QFp
         m18Zb9htPi2t6O0lMqGF7z8PRfPbOmKF9izFrKbE93Ruc4RyMoPA6SXJPMrd2cRSeQqU
         3fFWe0XGXn46wFzTS7ETtRtfcCWOcyjKJEvD31K5CbVfwq/loSEauZvPgB7XegrpjVBp
         03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648826; x=1750253626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipoP8xNDjEIconCL8zxlaSKecDJQOQHycTLmRsr3jsI=;
        b=cF45uyzkto9wEpZfLw6eOs+a8wTSWfoshL1G5luXsxtpX/X/EieM7nPfZI3WE+4A5J
         rB8yoZkjULpCbM6wgYN0kIJb5GB8X99usBU2WMUwxAopKay83pAnLrD4JS+ZQNpY6M6S
         ItxPmf3rhOqGWgoEXIuSuFpsOsbEJ0VxL8LBchDNN6ywy3pSBKWB4M+iTLgKwMEB79A6
         LJRRuw5DgVlzHrkE63ao2flOkgTxZsnOEVdBc9+0Udelcu1KKsO9p4m9tk2zWRncfxem
         7fR92dK6yw8wFHJ8jgDSQvL6EeknocQV3lPVp/5m6RLDcvy4DYuFdZ9y7DELFtbE2pQ+
         M91w==
X-Forwarded-Encrypted: i=1; AJvYcCX75Hbxd5qlAmIRYXzcZaBgel87y8ndEfdfZqpNEpKw9zcLGc9Nibr9juEkt5HK3VK3D4Jq1pqPN3Pi7VuV@vger.kernel.org
X-Gm-Message-State: AOJu0YwEncG6b35pfSnL2NHolDAtf3fGMiznMa0Ivf8eFwcBMAs6Ju4t
	T2ieXFeRSVujcCZJT8PwkP3pSR/pZq/pAttlhNybsjDBCyfTKPpRaYesdylsaVKiTq8DQ2Pt2G6
	uhA==
X-Google-Smtp-Source: AGHT+IF8m/89MTXda+VzDrvu0RJ/n7UpnITSLdxSxLWKnF222wfDhxftmaJ4GgCm4ymT4m2HSbwt1QBpUQ==
X-Received: from wmbez9.prod.google.com ([2002:a05:600c:83c9:b0:440:5d62:5112])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1448:b0:3a4:e56a:48c1
 with SMTP id ffacd0b85a97d-3a558a43563mr2743213f8f.55.1749648826221; Wed, 11
 Jun 2025 06:33:46 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:33:19 +0100
In-Reply-To: <20250611133330.1514028-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611133330.1514028-8-tabba@google.com>
Subject: [PATCH v12 07/18] KVM: Fix comment that refers to kvm uapi header path
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
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index aec8e4182a65..9a6712151a74 100644
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
2.50.0.rc0.642.g800a2b2222-goog


