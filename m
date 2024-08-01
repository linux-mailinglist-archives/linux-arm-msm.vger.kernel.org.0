Return-Path: <linux-arm-msm+bounces-27694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA80944752
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA9B281284
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA29A170A13;
	Thu,  1 Aug 2024 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0S+nV2l3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71E16DC35
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502893; cv=none; b=YtKTXhpUM9b7Oj5j+aLWSWpoVhpsBUa/uPUvuBtl7sTCh7zFlPwQTdpZY22nx3naLxVpmHjy8xk9tq37H3uGzQ9PndJ0DpsPEFiXfM8dWBdIIWgq9M4y39dRs6EmFcbs84+OIA21BhWJRaRv+GXRUtM0jrlEutw7RBh+1EOlYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502893; c=relaxed/simple;
	bh=C7bksynIBlDmKWzYneQQmkbLTeJZkrmT11xDMld4peA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s7ow0YiozCR/FQUnFWPsLjy5oftKDyPj813dZJEXq2YezIgAsKYg7dm60Cz6J5Aav2zhNeAgGO/2VBbvvBcq+/IiGHU9p3YwcARQbi0tnVIIecwX7LOdqTC8RTCVu0uqFE/onM0jv0V9DvnFDnQhAs6/c+LseKYF7FYNlJcgNq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0S+nV2l3; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-672bea19dd3so140830887b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502890; x=1723107690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPYjxi2NpHlLCCCycghuduPbRm3K8NiftdQ2Nx+A00o=;
        b=0S+nV2l3KdXtNu6yLURPlbFskle7e+h8Mt1Wd2CbWLEsIIPRfrH9nVyMGYmqiVmdCL
         R8pNhcB37YFYWzDA+QMYFDFRHSk72VgLTg5malYbMqiuOWsPiAq2nhhID4zJBM4EpqvY
         qgq0A+c7wHcmT5q36PkG1T95Km4EpZwRRwbsllsccZigeIeUnfbctHzlPcghKX8rQY/1
         PdLW5TuzxUFnam6Nu9KB6qTvKQgMx1Cyv4u4AzkBzE3AADO2jOh7dy5Eo9Ho8zJcXyZc
         og3IuxcDi1haYsz+VlLuF/du9Z0ngih15K9sd77ZkBAm5/ZmDsZxgq+0UpFP/cfZlCN8
         os4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502890; x=1723107690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPYjxi2NpHlLCCCycghuduPbRm3K8NiftdQ2Nx+A00o=;
        b=KvrajqtQiTIlAScxmW1BpsMPA3R+XtM7AOZJEhOXHYuSg+J19dRwNP5YNUPtr/JOD3
         +XoYvHbLzqc/NmdIjX5qgp1Bx4QAX8doBNd+hxlAYgs6B3rNTEKmKOYJCuPrXFElD/hK
         BsPi88wkeryeP8J5m3Jr9mxZkS+Yu7h84mnns77o2Rm4KGu6dUFYpaaMEdRWcvTfpZcU
         kN/cFPJJT7MuHuvK2mHZIitSzfYeKVnXpBGtFwlhR7rAlCBmOrMnHaXa0kHcB1DDnBSI
         kpqxuDJbXeWdnW0pETI3vsVQO0R/d0QcxQg2jDmB/LbMQQ1HdGQwhbfQYv5/D+mMf4xH
         5NmA==
X-Forwarded-Encrypted: i=1; AJvYcCUFB185plnIRZEBoYOCzZEiXj9dGhjjl0RN+7oIhM3ffBPEospBpa1NTJLgd1fFnK5DQnoFDvCJlVGOyRSw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7h+aYtGHV5SeeOduUrinjRBwfOlvPBZgRxXNggLfKPTCQ28S
	X738QhEHyoNSzdYVIVxFQQi+zCXmiyotnYE4oGe7Sm7SY2Xtfe2buF5O3/zTo+WeHDng784IGQ=
	=
X-Google-Smtp-Source: AGHT+IEWXtT3G1kPV2U5ozw0QmNThPZWLC3X0cJFXxT6qwOkPcf9RWWDopByOJxRGSqLytT/Up6QyZXMSQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:690c:9e:b0:673:b39a:92ce with SMTP id
 00721157ae682-6874be4e4b8mr30247b3.3.1722502889731; Thu, 01 Aug 2024 02:01:29
 -0700 (PDT)
Date: Thu,  1 Aug 2024 10:01:11 +0100
In-Reply-To: <20240801090117.3841080-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801090117.3841080-1-tabba@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240801090117.3841080-5-tabba@google.com>
Subject: [RFC PATCH v2 04/10] KVM: Add KVM capability to check if guest_memfd
 can be mapped by the host
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
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Add the KVM capability KVM_CAP_GUEST_MEMFD_MAPPABLE, which is
true if mapping guest memory is supported by the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/uapi/linux/kvm.h | 3 ++-
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index d03842abae57..783d0c3f4cb1 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -916,7 +916,8 @@ struct kvm_enable_cap {
 #define KVM_CAP_MEMORY_FAULT_INFO 232
 #define KVM_CAP_MEMORY_ATTRIBUTES 233
 #define KVM_CAP_GUEST_MEMFD 234
-#define KVM_CAP_VM_TYPES 235
+#define KVM_CAP_GUEST_MEMFD_MAPPABLE 235
+#define KVM_CAP_VM_TYPES 236
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ec6255c7325e..485c39fc373c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5077,6 +5077,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_KVM_PRIVATE_MEM_MAPPABLE
+	case KVM_CAP_GUEST_MEMFD_MAPPABLE:
+		return !kvm || kvm_arch_has_private_mem(kvm);
 #endif
 	default:
 		break;
-- 
2.46.0.rc1.232.g9752f9e123-goog


