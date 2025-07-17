Return-Path: <linux-arm-msm+bounces-65516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411DB091BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD451C4438A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D1E2FE304;
	Thu, 17 Jul 2025 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JwopKMXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7422FD86F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769662; cv=none; b=eUZrRbF4nibAJ1+f4uRpL4EN4hZRZYxBktoRIrJzCN8dnNQel/20r4K6sEl6h17G8+uZut5kIUeVQlXcmgI3SFMbaPv2q/HY6JXF2jo08Qbs7eFxipJlH1UHKUO3+rRLJc4mLqhrDsWKrp1p3uJn79UJ7pCuS6jgxgunnfO9g7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769662; c=relaxed/simple;
	bh=DGSXIBpaZ+VliuyanNwueZCPMfss1HfDwsSY4rS1zkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hRRTbJnjBWazncwPiwrGO/MuZzxwXhTH1hyh2MGNIJ8s5hDxhjOW3w9aLVEEE+oKM3c7jw+mU5YD2ANR69qLSQZbeUyMKsECGy+hBUS2Nw6Y9NS3bIk9PIdRuHhS8S0CB82G66M07vH66ocFd91d8jaiX+tz+1ftJx7xqBfoM90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JwopKMXj; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f3796779so626065f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752769659; x=1753374459; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=81cYjGlMvTtj0w3SoYGXht/cTScIXHWu3YXSJD4H52Y=;
        b=JwopKMXjb9SAiIugHIUsiI4bDjWJ1umJnNzhCzDzK703LRAws+JwWKOqNpJGFxpeVA
         uZ7zs1pp8qnelZAeE00NxXzWF2lfofQqdomAfFj7eeopyQPd5RYJWDeNZKYnjL1EYSY3
         qJzKWLGXFFyV9OHu50BrJF43A0y7bjLjx2fjmnySkfgVGgqKorbU1RwlQ8ipxfMAo2zE
         /shpE7hW42x2R39qs+sDxLGQz4IuSYzK6yy/j+xUK+PqIXFEiIsYO3m42M/fDMzkc8YS
         3cvlGT8ZQT2l7UIpwpN5lC4bEcrbtqmqO5Ul9VWfurRu2SPHdqzKGxHGqrciITZfqPdr
         G/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769659; x=1753374459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81cYjGlMvTtj0w3SoYGXht/cTScIXHWu3YXSJD4H52Y=;
        b=sBWi+WV7j7PVlZobRKHnHhd4R/IKWXC98LF9oI/HuPWK6QYFFUQWIhmpEVjZZcI4fH
         2tJ0CEj9zEtY7XzO1fxxPQSZOB+J/3zTEQKyiAf5w9YaPdgBiXEt85KdLHf9rm1We7m0
         +TeUuEmjJnIxUE18Yu0aAnIpt9w8UvoUrXAi4LOSX2lLcHKU4W7W0qJRMrMRCAfzjCey
         vUYNp12vQ04/7jUC5S3QS3pKh5b77vu1dHV8ssFTg9tF0HyqPMRbRHKgtyEZGTDFM+Iv
         1K6qwrfbWFntAZGXhTnbjzVSSkSOquAjZ2HZrcI50aachCBnlGC2a7uwES1lzeQPb0bL
         DJCw==
X-Forwarded-Encrypted: i=1; AJvYcCW8hNbQ4F7r7EDHfAUOylKuHcoUgQAlMhWWMQwUmHKJHukX9GLbHhw3gxdr1E6kUYDx8eOnRXxu5K48kRTt@vger.kernel.org
X-Gm-Message-State: AOJu0YwWNnGJCEt/UAu+KurpbDQqf8lLRmhuzeCPp+jwMwv9l0w3oTAV
	dv5z/Tl2guIaK0AwerZcpiXyqgkJvfgyJ7+AQ5108JeY4rdsx6pYYn4VBGU4toYwluOGyeqcgzu
	PfQ==
X-Google-Smtp-Source: AGHT+IH5bmHMDd4zJafAHZwYYPcavwxGE7apj2R2grFKsJXx46AWhyZfurpkrtNa5YD+GGFrD9t1NSVLmQ==
X-Received: from wrvs4.prod.google.com ([2002:a5d:4ec4:0:b0:3b3:a665:e00e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:9d83:0:b0:3a4:f7af:db9c
 with SMTP id ffacd0b85a97d-3b60dd8d273mr5658619f8f.59.1752769659430; Thu, 17
 Jul 2025 09:27:39 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:27:17 +0100
In-Reply-To: <20250717162731.446579-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717162731.446579-8-tabba@google.com>
Subject: [PATCH v15 07/21] KVM: Fix comment that refers to kvm uapi header path
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
index 9c654dfb6dce..1ec71648824c 100644
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
2.50.0.727.gbf7dc18ff4-goog


