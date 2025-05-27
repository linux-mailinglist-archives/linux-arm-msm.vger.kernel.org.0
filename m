Return-Path: <linux-arm-msm+bounces-59589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C90AC59C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7C91BA80B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 18:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFC128136E;
	Tue, 27 May 2025 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dV/yrL2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C62820AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368984; cv=none; b=bcKMUVQrd4e58aEh3b0tZmtC+AcBrHhbrEKND/N8zQsJBhs8X6I7fP2tu10RSBZUMkmhcf/86H//wnOwIBAhac09TwYIFfoMuCSOiCKVAvrYPjbNodzwk7BKu5sUs5OcJfun/JMNCpCDjmxGJI0mCNk4h00TZhKptbwi8Rc+LsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368984; c=relaxed/simple;
	bh=3T8lFtRXSgIUGD6Qf7ZyhQa42WeiO73opCenbKlbhTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cSFp/rC6+MSfdMoWxjJ5MEVDdfsx60UzSdPxwkK5qRaVByByiomg68DD+Pu3m9jY5uzfwcOAK6jB4wFcx8lrBwG+pGjpkAJe+I+PoJxLq9ooR4r5p4DViIeVCQbgE63paEAEEatjNop77jeHD/XU9aP9ow64eCxIxHV5PfpZETE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dV/yrL2Q; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so18814075e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748368981; x=1748973781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4u+mnyvzOg5GK38vm0Ijv+UY5LkqIzlts25Ri0gFsg=;
        b=dV/yrL2QOF+7u6Eyg2ZIrNL4ugCsky9FPpme3h1kcfalFH03eW0YeJDZNE/qNJKyVI
         /m892gAr8zvTN8LvF1bzj7mfKLzAmbSvLCe5Chol6wb3JqCzenb5vrhcaz16NXyIDa47
         3jWgSKSjQtSxC8UYdNda9xSCFGmfx620vdHhmJkyVQPxyVMdqS/eXLrHltka4ywjbCgy
         TMpYdhxCeRKqeRAPhnIa9YCKCUgimzNCL4aiFLUQJXD5AMlfhcx0ihq4u+qlJpYB9iuD
         gJ+KamhH+K85aWNPbLx8dgxaFMySsABU/k8bIJLKCdOcUkd+oGMwWJyljooV0sYAG07Q
         GLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368981; x=1748973781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4u+mnyvzOg5GK38vm0Ijv+UY5LkqIzlts25Ri0gFsg=;
        b=Z6u6pRSk72RE3/zFNOChU8aBeq6LFwEKP3phdR9DGjl+rJIEZ1xiB/AvjQ1ZwKB3Pg
         JdDbw0wvVSRjmnB7iFo1FAdnQ+EWIJhWnXbb8qjsnIIcy8urGRb/oVciy3cjgHvaB7zw
         JzG2KmfUB25VVjyLCluauPTd804JN33Q5E+ndPlmDqrpK4f7gg5fZfVyfyJyZB3dInwd
         rwOC8TMLN0R89lT6NK3x9hHc4drD77bO2d3U9YcN5ykyyc/RfA3GCb7uADw3WthHOd6Z
         K2CNKcoO70VqNce8CJ01a7dVGYKHlX/V4gwuAO29IEOQW/vqzRN4p4hxvxu725azX8MB
         yKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEi723FNYzy0eKYI8OKR8fcSOjkq+avpo585/jaMUgIus5VkR7DEkfUqO0dd3kDNXPEyKNLRVqYqpIQ4QY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NYmOeB9/mLnOPxszZPSfnEJz0Tl6/z7LGU3zfh6D79yg4h27
	mhjaGAYo+Moyf8FLst0zOK/kKgsNS8nlRYA2abnQEcnVNeJ4kJwafTiGgWAnfKkAdrix4h/Jf3K
	JAQ==
X-Google-Smtp-Source: AGHT+IFnXBOGCz4JW53CjhJr79zbRrXC73Tg7DLSny6JCyrlvi53lYGVsGL6sxvC2l8qjcxZrWCgXeeZtw==
X-Received: from wmbes14.prod.google.com ([2002:a05:600c:810e:b0:44a:b468:85f0])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:512a:b0:44b:2f53:351c
 with SMTP id 5b1f17b1804b1-44c91dcb6e7mr133569705e9.18.1748368980415; Tue, 27
 May 2025 11:03:00 -0700 (PDT)
Date: Tue, 27 May 2025 19:02:36 +0100
In-Reply-To: <20250527180245.1413463-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250527180245.1413463-8-tabba@google.com>
Subject: [PATCH v10 07/16] KVM: Fix comment that refers to kvm uapi header path
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
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

The comment that refers to the path where the user-visible memslot flags
are refers to an outdated path and has a typo. Make it refer to the
correct path.

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
2.49.0.1164.gab81da1b16-goog


