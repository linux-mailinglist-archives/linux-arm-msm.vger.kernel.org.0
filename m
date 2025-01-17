Return-Path: <linux-arm-msm+bounces-45443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7391A15452
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1C83A0488
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5219019F464;
	Fri, 17 Jan 2025 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aXFUSC6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF619DF81
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131426; cv=none; b=aWS6crabo6f8WTTMJLFQcnXJ7XdnfyXAQ26HBDkT3u+oSPi43BIYl6UZQ53SPyH8szMr3z4zsfaWyISGds/buE9UbhEN80kC8LAwqYAmDLLsftjvNtbWAkC2GBST+us1W4+qI/Q/J/mB8QndD3ndG1hHdR5tQ7Pp5zkLDqzrv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131426; c=relaxed/simple;
	bh=dmXPIJ/Kr4m9w0bEj98hhqqVNKh+sNoJN4Rb38yyMb8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TRcD1tSCaw2oyVhYzGj683uQxeH/YK7S8Mwo23BFsCXYPO/wxvs8IWJHEmdcss11d7lTcvk3vN030z2O1Q6NvZ35G0Si7vOs6nM4Z/sDmiMnD8Ngr9JSKbmkSNqy0qEpnUMXundRkKUQ/48sFpD9DrbhENiqLU19mBn0Za3xnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aXFUSC6z; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so11458175e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131423; x=1737736223; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BW49JWG2Px+0iema5hxnfEbJmT8jYzYvP3ZBCGvznBQ=;
        b=aXFUSC6zaeU+G159R/ygUuyTKPoZcw3r2r1IjS+f/Qeonw/JT4seEGEDiFQHbx1KpU
         RnRAd395zs0Hd40Osd2uSTScBbgBPwTX96RxzARfkNyBeZ2+bR76+tDO5Zr221qa8IGT
         S9EUteR/b/omtiGAFgqp3ge362kHbTzFrjnv2aMs7CpeQoRt7pfyws4rLZxE8TyXXrpe
         0wakxNkkV9rgZUQdquEnvIIcbRNDnBlYSQYl8yABIM61HJ8aM9ehWpZWBwY45VxjUXYz
         qS3tc3VhQnoiC9EDEbcDh4DSFpCVovozQopNS7UF8/A6XjJRFr4nRZQSFYfebx8phzYY
         lCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131423; x=1737736223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BW49JWG2Px+0iema5hxnfEbJmT8jYzYvP3ZBCGvznBQ=;
        b=mTNRkTWr+7EPlFxuid6bSLJPojj6ff+AYkt00p72QhE9XFV5ddxXEZQOw4JlkZ7JmN
         r7N7kCCnr2cn1HxDjeVKZ/wsB2YsIXU3OnjAeDT5MC//tz2+cuXYaFcpS1q4fzTa+jzB
         ZvSsjI+WAXMcpuyMKGEtyd8O59Bmh2njME7XmAY4oj30T7bGZjZelAfES/DoDgjAgtWz
         jG+4BJJzua5sZaGhEbPf9MS9iiQGluRsoafasUaDsgO7i2AYT1G3j20LbzjGeMYMlc6r
         X6Mwqtohl35eq4jBOq6B5EPEUeoTO4QJ76AqA01/SWZIWmAWlxLp6EkBr2WSjsHwaKhK
         U1vw==
X-Forwarded-Encrypted: i=1; AJvYcCUL6M8WPaQV6O13kKx/IpXApDRX3Y9rV0Vazz4uoIc7EOztR6676LVnob7IPw/9dROdhewNqHVY3N5d6gii@vger.kernel.org
X-Gm-Message-State: AOJu0YxkQAHhnmGsjuIPlwkv4wANigFNe/khm+o1IZICPBUX4znSTvR6
	dPXa+1CCwel/Xy4zXeHGIs2jffYNQxDA5sJOSYas9KLAIXbhtd5+6HBhpBTEcv7ASbPCBKovPw=
	=
X-Google-Smtp-Source: AGHT+IFy1wFm+ziznvd4kirGkUVDSDuqUcY6omN8qTjIUTRguG98z5VICWvWS3y2Y1jXpECmR3gNFjH8Yg==
X-Received: from wmqe10.prod.google.com ([2002:a05:600c:4e4a:b0:434:a4bc:534f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1da8:b0:434:a711:ace4
 with SMTP id 5b1f17b1804b1-4389eca3ca1mr12533835e9.17.1737131422953; Fri, 17
 Jan 2025 08:30:22 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:55 +0000
In-Reply-To: <20250117163001.2326672-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-10-tabba@google.com>
Subject: [RFC PATCH v5 09/15] KVM: guest_memfd: Add KVM capability to check if
 guest_memfd is host mappable
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

Add the KVM capability KVM_CAP_GUEST_MEMFD_MAPPABLE, which is
true if mapping guest memory is supported by the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 502ea63b5d2e..021f8ef9979b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -933,6 +933,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_GUEST_MEMFD_MAPPABLE 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 53692feb6213..0d1c2e95e771 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4979,6 +4979,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+	case KVM_CAP_GUEST_MEMFD_MAPPABLE:
+		return !kvm || kvm_arch_has_private_mem(kvm);
 #endif
 	default:
 		break;
-- 
2.48.0.rc2.279.g1de40edade-goog


