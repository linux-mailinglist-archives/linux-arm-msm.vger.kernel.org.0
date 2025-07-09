Return-Path: <linux-arm-msm+bounces-64192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 757E9AFE6AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B78D1C46ECC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6582900AF;
	Wed,  9 Jul 2025 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gmQZaob7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206028FAB9
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058806; cv=none; b=mgY5QmUh37Ec6vGbARMJQvdVEFwxJgVew6cD1LuOL4ECVbVpHFMRcL13cHWNBd1/UsvdVBoh9CoxiPDgXg2LSrSvsmlyH/Y2lyqMAbTWbTdGgYjpvtO2H9VvsHAd1kdi+X4JBm6HMfFNSDm6u4tKi+GnBURH6XdZCGq0w25YwXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058806; c=relaxed/simple;
	bh=aLq6w6iMVx9A+GXdrTT+UqPhvEMW4mi+b5uKE2VvZds=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fRkKR1Bnh6tNOfTNn6FJhgmkEOHmqRD4LKl4Z6QVgIIpITnvpsDlIkKygPX7s6fs5Ya2Syo4KPiAxV1aumMrqenwqfSYEL1mL0xpLGheAQzqZOGq7suL0tqjbo4Q82Cd2Z7PPy2NhJ6E5N6jmf2Fk5wjloOxgrBD04Lp02jdZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gmQZaob7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450db029f2aso26416515e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752058803; x=1752663603; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TkuKuazKKizZ6ZlT9w9fSwNujhSChJOs2f7h5A8NbUM=;
        b=gmQZaob7G7Bw2eWMyiBo7u8Vai4cexXhJk5bnElc65mo2VE0KQYQHNoUu2lgCK7a5/
         hIh3f9o6utbmH/lish9aHllDDOXIALj81k24qj9+rLMy+Dtpjx4fB8e4adaKKeWuTRTX
         2l3PnGGUamd4TQnqpgNWlcc/otmv8U/hpwGkJ3CWYBlWZzSn9wlXVDEDFvzjvHuETMHp
         SEAGyLmBW4UHZ8S2fN2cxmk+ZxDu8L6V9VpYibeYYKUFE1lonWsSx1GDHGs6DdnmGa3c
         wowUkGV3ebr85r4gNCdTQRCOUw4t81eVrMjVQiKgwk3qqimUrHwuejqi5CxDNeaWerCv
         02hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058803; x=1752663603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkuKuazKKizZ6ZlT9w9fSwNujhSChJOs2f7h5A8NbUM=;
        b=qpYAUQ7H8w/KwAv2iu4X8bX/q9J8lxKxds4tK9JezUMCXwxzmr84q2TkcRvIEGZ9DF
         +CpQfqIMM8uE8YkvVHSMTfhVXuZCO5DB6PqA81/bJFBVAk4HeEiM3aG/w8cjENALmjB2
         OulW5SCPvykJtxwJRC42rpMPg7MMFHfRJRXrQ8IOAymvHTQeGJUF3fH58H/DetpjWY4e
         sR3/kTofF9dfgjkgZrDgXwx2TCjIEHrqs/DwgoosnVVNlSjZ+vVZPpGOECDpUl2mKlc1
         CR0mbLqzbQNlF4H5HP/3glsF3zFJ4EPAVhj6xs7GF3Cn7zbIpZaAaGedPiKPrA81SYJp
         bkmg==
X-Forwarded-Encrypted: i=1; AJvYcCW88qLK0jHYv8VejVCqv/odoWcyqgFlq3UTVp+cs//91/U185OubTCmjP/RrNNKaWZIM0R2P8gzMcG0aSVI@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVC1Dwz7MJVPzgnHEZnUcGeCUGiaAjb8XMt0RtBzbEqyp6/4N
	bR7c++4jAVaHcI11s3XeGsNNb6zfMNWOsZT8Q9bS0Q+n4kEYMBjbEOitiqg8R+NRMYVOtxW9V18
	pAg==
X-Google-Smtp-Source: AGHT+IEHcK0/eYhpImfsFIrZ9G5hwIe5rWA1tVA/tSDhd6ENx7b4ZDeNGv0Vm2z//tBc+ZaDxo8/tozz+w==
X-Received: from wmsp42.prod.google.com ([2002:a05:600c:1daa:b0:453:65ee:17c9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4746:b0:450:b9c0:c7d2
 with SMTP id 5b1f17b1804b1-454d531e5b2mr20392145e9.11.1752058803467; Wed, 09
 Jul 2025 04:00:03 -0700 (PDT)
Date: Wed,  9 Jul 2025 11:59:33 +0100
In-Reply-To: <20250709105946.4009897-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250709105946.4009897-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250709105946.4009897-8-tabba@google.com>
Subject: [PATCH v13 07/20] KVM: Fix comment that refers to kvm uapi header path
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


