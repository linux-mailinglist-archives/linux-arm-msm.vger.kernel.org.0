Return-Path: <linux-arm-msm+bounces-60329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8DACF33B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC2C18839CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533161E1DEE;
	Thu,  5 Jun 2025 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ntP3O165"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BD13D8A4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137900; cv=none; b=CB/HohqAqF7NzmEN9PT/Efdxbr3iXN/6Tue7ayKCvaV/lailPeD0K4HGSInGJ3Ww4h2SU5Dm2chkHbKV40COVxO9O4eWO6sPkqAnWaUDGi8xKAvT+0+FCWltNWRLhOp7zsRXhrNiJ7nrrbO1l/0ZrF9DHVTFCQnXq8lGlPX/flA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137900; c=relaxed/simple;
	bh=h9y2PxHa3T/iR0irvc8EFzsEpKcI12tJbooS4AaFVxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lqNE6pfOlSmNJEaN8HLID3Woi455HMAoU2uZstp6MmZlHBemutNF6m/0NIgys7NTmy2CIKqsqVQk3MpDhBgF4Xh21l2YJ0J6nsB1WSFyAVffXfyVRwv38qJBTCfK8ZxhgC3yEa68kH3qPXatmg1C3g7npqEKBpFk0UxmGAN153M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ntP3O165; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso7160925e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749137897; x=1749742697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya9V8PlB1f9QKkO6N2m4/v94EO/9DMMarQp6ACk30eE=;
        b=ntP3O165ePxDnjzBGo2ZhWatOLdxvgxVibREXBJE2AVGE2eHXHaP9KywfFe50IlWcH
         gAiaUxpnppovltsscSKzdoEI9ZftyX3YBRYOQ+5ZRN/twZPMInSB2bTLgMukLlxqiZZF
         /ddBn+pjNIieZTizkQCcinymoqrTyvOX8ASBryiaCrGtuEquOITyniIK53uB40Gx2Zr1
         Nky+XC0kQhbnnlDBfI1K/exR2GCwrdaK0U502pqwnpz+VZk3KQB47ZGhBu2eLk5ULTXL
         F398KZQf+Sr8zmrws1mG1btn3uv7s0+fZEBWRqQfMvQf8jqXN32E0ufUIyQ4BqnVcipz
         sQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137897; x=1749742697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya9V8PlB1f9QKkO6N2m4/v94EO/9DMMarQp6ACk30eE=;
        b=Lk0y2G6xM+YYXTaw/emLO3lC+Qzsz2+8oeziVuJBSK0ylEX4UibgwZImuC4MiumCKG
         VAYWCaz7q/ArmK0/eSqd9X5tJVLa9ZHtIIu9iURmcIf9WmJWZxDVvmLKjPMQ7aIgn4O/
         5yhHEoAkAnYWyb3DBYPmMaI3HicB6WM+yRdFs6Ej8K0Ttsq/R0aI7urJmEqWQArmeFo1
         aUnBOYxojZ3mW2PfSDsl3Wz4WFg+E52RMPlwqjdKZQF9SG1E+8zy0E9+F7yeLOsmodeL
         FydfQxjMcISTgt9LUpDJwQIMHfcX41gGU7pXTBZfBpbdLibsmUvjW2drU/ZLr4MgP7AL
         l5MA==
X-Forwarded-Encrypted: i=1; AJvYcCU8fCLY7z86vcER+wabrAiY0LwsLifQPlgtgwwFfFY7i1g+as/2NF7okvxkMxrOooiJjlAryIkGV1BtNc5L@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJphN4mAlPv2a7OOl2CCCI08WP6OLNIl9BwEwe/Yz0No+twcF
	RUj6RhbX0jyZjRigRQ6IRJ7+jg8xzsXYe3K9RKNFGw5fKRCKEHpnYtEGNnNIvicVBrD1nFLCWMb
	Zaw==
X-Google-Smtp-Source: AGHT+IFhrDIh6gCXeF6nxFdv6Zput8Ia9sHzYK88p92EvJQS2AgWKQpdoJNqkVyvlyFiBZqhNRmwPvnK8A==
X-Received: from wmbhc7.prod.google.com ([2002:a05:600c:8707:b0:442:f482:bba5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3106:b0:441:b3eb:570a
 with SMTP id 5b1f17b1804b1-451f0a6a94bmr72946715e9.2.1749137897069; Thu, 05
 Jun 2025 08:38:17 -0700 (PDT)
Date: Thu,  5 Jun 2025 16:37:49 +0100
In-Reply-To: <20250605153800.557144-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250605153800.557144-8-tabba@google.com>
Subject: [PATCH v11 07/18] KVM: Fix comment that refers to kvm uapi header path
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
index ae70e4e19700..80371475818f 100644
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
2.49.0.1266.g31b7d2e469-goog


