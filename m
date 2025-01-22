Return-Path: <linux-arm-msm+bounces-45827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B51A1952A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EC9E3ACC34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84385214227;
	Wed, 22 Jan 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQ+dmfcs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57132147EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559670; cv=none; b=L+qvvsQYAhIQqoUiQvHgvHnGE+vq0vjxpoqFge3x4q58JGX9MDht/IqaVZWK31khjZh5RY+Uu7l3On5YM/642hpgZi1/+eSP5SqAMWmQaq9iulRRYB2fXAYcn0Y+aWshmcCxaD1F5FlRLuW0wnu+LsyOwnjUosTQoWFzWSAbsmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559670; c=relaxed/simple;
	bh=D84Qgq7kdw2clG1hEN75SuoD1X4BbCJGyi5cAztxsnw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AO/Ru3ml5qAAHC2wqObsvkOG7AMLha2/+qdAPvmp+hdu+RxEJemgGOAdKgJ5ZVjJeNwW4YBMCT1AVTEVVqRWZUzeuPnNYgNS7yaulRzuMXet5FgzrOhwIVcgoQTHF8jZp9gv6J2BOED7F3c8pWoQ7t0od1MDMf2fbcnQuJ7d/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQ+dmfcs; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361d4e8359so53591675e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737559667; x=1738164467; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPlZyanj/PcXychEccc3pvyCzWy399cCYc+EAQwmx4Q=;
        b=kQ+dmfcswLXTWMsXhrYyZGAM3gLj9jtJd1tyvomkAT990ixCcIvjzSpUcupMifVIH7
         14ipwuaP5fahd5IR4HRvOjqBGdfi6SUVavx+QBnGVixEugaZ2R36mXzTpJWjs0w/9Q1H
         tGLIVfNwBAMfdVkk7LAnAUk62WNU0SsnyGpXntjv7gyLHejj9OtJnUkz6fIDyYaOYJbr
         yAeWAKhYo4Dr4TrwxqYTqtfw+hbigiPWuMM1+yXySzUrqwDf0AweZCnxlPOF9tDGWg2s
         9AJxeeuXSNB4TJ2H2WeYcewdMczBbBm/wgMwDcLJmi8joptnx6W2DQjKjwo9D1usd2w0
         0dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737559667; x=1738164467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPlZyanj/PcXychEccc3pvyCzWy399cCYc+EAQwmx4Q=;
        b=ww61IgNWAaKDrw+Q8f8LhcNGez91c0Wah5CKGbRrEaBaGXld29lX5q8cGZ5nIR25Vj
         sR+gPo8fkdMVZY1iEtK72SUQqefim1k3622PhdmQfidTnrXf7k9tVcB8lDTq56arWRBU
         QWICoe+XlAhVFY55zpmlZnucddYdQRVOZ22Us/odq6sMSLuMWWLQ0ANPzYCg8I1S7bZ0
         6ely9FLtUCYHKaetbDTsoHgMCSyk0fI1iLmK7fPp/57wA9P0jL0fuFuhSr8s8FM3fjdg
         3IAAAp8qFykLVx5mqaAeWhALNRp04AVM+D0AV2mUY0EmTHVAHkTjno3YHlTdQLN4379B
         5eqA==
X-Forwarded-Encrypted: i=1; AJvYcCV2uOEgGauHlnfXQKWLR59lc3W1QNCEaN89BAFIkDnbhCjPyVkEtYIFauETEtf0pfDwuorkFumUqArFn2iv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6v1TTlMDa0unIt3GRxgyrrb/+DTAUhUuGvumCH6uWJFRutiu
	Bahj72OZBkBK+D8EwVIUdgw9RXnRYo7h0/q18vDqjY2HOuU3GKEgOPqo5gomIORhpQTJnuTTLg=
	=
X-Google-Smtp-Source: AGHT+IErLAZbRWKwqQFdhagPuo0iBKk0JPSfX6aLNC1OqdIBiMLMztGVedsgoVH8z63knrYGAMOhcPpfwA==
X-Received: from wmbbi26.prod.google.com ([2002:a05:600c:3d9a:b0:438:ad3b:591a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b0a:b0:434:9c60:95a3
 with SMTP id 5b1f17b1804b1-438913ca93cmr223239065e9.11.1737559667157; Wed, 22
 Jan 2025 07:27:47 -0800 (PST)
Date: Wed, 22 Jan 2025 15:27:32 +0000
In-Reply-To: <20250122152738.1173160-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250122152738.1173160-4-tabba@google.com>
Subject: [RFC PATCH v1 3/9] KVM: guest_memfd: Add KVM capability to check if
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
index ad9802012a3f..9cd6690b7955 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4872,6 +4872,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_PRIVATE_MEM
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
+#endif
+#ifdef CONFIG_KVM_GMEM_MAPPABLE
+	case KVM_CAP_GUEST_MEMFD_MAPPABLE:
+		return !kvm || kvm_arch_private_mem_inplace(kvm);
 #endif
 	default:
 		break;
-- 
2.48.0.rc2.279.g1de40edade-goog


