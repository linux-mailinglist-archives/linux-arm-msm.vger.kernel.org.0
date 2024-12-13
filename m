Return-Path: <linux-arm-msm+bounces-42100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EC9F12D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A363E281DE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D534D1F37D2;
	Fri, 13 Dec 2024 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4XViSSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3F1F37C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108515; cv=none; b=A9M9nKUHaH3lyr6twkhQ7Ut98Ig5MQmvM2aBkgHPX2npXXSaXQu3OpY4gCyVUDwCgu2e/FUErVetlcCTw2qe2Ljh9KYYUZdPrsyS1StbP1+gaF1EN7EVZEdvGrikUcAON+de3kf1WGps2/OVBawc7Vpoqtskx3nMy48Of5Z5SO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108515; c=relaxed/simple;
	bh=M7+MFZiu3/ijUuLXmaqnRaTq0ZymjLSw2DyjVM//qRY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SIeDAEYW2hUtLkqb1P/tPN3opXCH+Fm3xZs18rR9bSOSgV3Jd5nfDkoRWTNrvCqPWL3FEhTjY9GX9xn0qXRACPsYKBWtlk7pRQFKLVtkmhwTHSo6+cZq+Snq0Va1AFcrSutiupGKDhP692karDP6F5HdX3u23o0lus6I8zPQIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4XViSSs; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so18659425e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108512; x=1734713312; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksEVsaSQioDaJqKOOzrRTGd2BPTgCKjKlBLY+w56wZo=;
        b=t4XViSSs+C2EkTS1htUgQwfH3VoPbpCYP73PF2tFIoR7eAlk5hYRmeHLEZt6Phmj6B
         omFOrsaLOzN/wRDhvpi9DX+7vIftqUdFk2i+C8CjCYHDMOXaY53cbhEQaH5yFSqgVlws
         xGHMbGOJgiGofKGCSCAoOeGcrZ4OEz9S4I7Tv2EC4+QWYWfPn8UlIPiJl8qOTWu3vp+A
         0LixCqGUVAxf3cQ0n1kFjF8HUOmmcSluB/TR4iNEx+2rZuu+cOf2AxQ7rfLkfr09pSwb
         bbu4RVGWv3C0AYNi88bi7/sAzKzURHHAUz4XZV8wUlW57227wa3j+iEBFy7oDwZniEJb
         K5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108512; x=1734713312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksEVsaSQioDaJqKOOzrRTGd2BPTgCKjKlBLY+w56wZo=;
        b=YbOrWAjLLxQEvVdbFoN0dmgzugyLcXR/rN4blDImqiyiGh3xteOUH8Br3GF+CjIyqJ
         cXpAiizlbd/vhdt2tJEInZKp5hMbayBjlfG6A6DwBfvJ8ZfIS4IUD8vVk0H48Tti/s9z
         nsoTG/YBc0VYKO323pghlzWYytptva40XSpyLazRa1L7bmjkWi6DhYjyaOG/uBrvAs2D
         7yXimF13jWfodiTF1tqMYMQSQ3LvXpMGyZbBP7eg4M2IfZLz/GivziM3pgeJ+S60BIqU
         yalGXO/LKQl1OpmPZi7hM3oqyT1x5wwjU++sZT3kzJ0tq7U18f5O30wxQK+qnE5BRuTW
         5fUw==
X-Forwarded-Encrypted: i=1; AJvYcCWlji+jRBAEOwMcGwEHMuTDRmrPidQWVCsmcBAtOhUAfxOVsS5L1xDMEUYXO1YAWBqlA71oKfdycV7mZxPX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsn+SwDM//BnXwmiBMq4TOSDWhknd6w5Epp5noMudOkHAyH60W
	PfDlR/iKNcR8qcPjQ6Y9K9dAZnabcn2tjwRaUX1RopdH5o3eW9x47vI3AXuagOX2rzU0DD/sLA=
	=
X-Google-Smtp-Source: AGHT+IEt4pXQrhABH8gera5DOjDskLThzt7L9I5lJj6Vxwq11yPrteBm6Llct58hlLMQdsD4E964MjHJuQ==
X-Received: from wmbg15.prod.google.com ([2002:a05:600c:a40f:b0:436:1534:b059])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6549:b0:434:f0df:9fd
 with SMTP id 5b1f17b1804b1-4362aa1b061mr38281225e9.2.1734108512506; Fri, 13
 Dec 2024 08:48:32 -0800 (PST)
Date: Fri, 13 Dec 2024 16:48:05 +0000
In-Reply-To: <20241213164811.2006197-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213164811.2006197-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-10-tabba@google.com>
Subject: [RFC PATCH v4 09/14] KVM: guest_memfd: Add KVM capability to check if
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
2.47.1.613.gc27f4b7a9f-goog


