Return-Path: <linux-arm-msm+bounces-33819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD7998161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98FEC1F218C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5602F1C6896;
	Thu, 10 Oct 2024 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hb69+X9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030B1C4604
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550790; cv=none; b=leplvKiHkntoQmwOLvfSIopsXiZCmpjAWUNYo18wA0CN6uqCuudTMimBb4QHVk4H/qU/K8nrlw8GgU4aHHFQw4fwJPrwjspn1OSiWvh/ZEVm+K5amYllp/0kVXfz6rInCjwOT5F+xhtgbufhioqsMJ0WsPHpcATJ2Ri9vf/d9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550790; c=relaxed/simple;
	bh=AjE2RSAyv4Xb57vcuvQo1hOwImHvsIkCCGQdz654rUA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s/zflGhKiSoh60DTbMAutc5Aw386Ke5e2KcDGtS3gUBOI85QpeCq5HF4NQbzi4FXD4om66Zha7/k/sw1OLtbWDd0V7tg2gnAUW76C0mxlY4YGHd5kUBquZYbMho5WL2fXMYR5nD0nRl+Do6BpcA2bcvOvG546QQW0TfxYs00qMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hb69+X9G; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3231725c9so14057977b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550788; x=1729155588; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=McR6hFD8xu5MydKKfp3q4/vtlv2OyOY0xakrmAL+qLs=;
        b=hb69+X9G0qjIS5au7DBpFDfQhOl5J3v1gEEre9159cJyE1ma08xDVygYLgdqlOgOXo
         2qVMZmiQDOrrexw6KE7vXe4yb5hRzMP/Uq9dYCY/LAOcNZroV7Mq6cwtJiYfSTw1bgJo
         +ncUbL2Sdbmt8lT/f/Mx0G8kwPzbzuMgEZct6hHc+BY+lPvPePTxLLz+BL24FSvkRxZ7
         TmmO32OkIsdCV6eqZ72Vx86qWYJTKNaRuO2V7Ytpro37fSU1nXc+lyBqnUjJqNj+2mP6
         zpelmGU9sxlc0OUejkjTKqCiVZmA6aFlqkvA3h9IfgvJf+rcbm0mPWsce2uOqN4PhWoA
         KGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550788; x=1729155588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=McR6hFD8xu5MydKKfp3q4/vtlv2OyOY0xakrmAL+qLs=;
        b=L0UR0IrcxWQXfPp0WIxevnZ0mvzsdRKoVlyUXLQX++bpXKIPlFTtP+5E08pNRYWHYE
         0i0xtuLj+HRhdiZKPFfNFUIGsoSvg2SPnk9q4zJMu5QxmWA5SfnWhGKhEHPlRRkpZarQ
         hkdbYSr+bwo946wJneP7U4iJzvd7KAClCjGgcrYeFYiFmTaXakj5eu7ftu+my1I0PjpJ
         N035AMGJA6q76zF7LiVc/RST8h7y7qAMfoKWzMg4dbx3/l5lFB/R0aGpcvZ9U2PJXrR3
         Q3/6ksY9Tii63EQEFfRLI5pZnF5k66Zp8b+tQWUYdy3Bl9Ue6G4IzAuxtLXdvMCfRzCX
         HrGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrUq6alK8BsV5zPUVWTJ4zd7uAJtha548hxuPI7h0sJIRbM4ev4QiNUntAainxVlsU5tXowa/yt1VYK9l3@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNM/5chvVgyX3a+ICS+ZMJtT7/UJaOfhrw/RQzjzmHqerXeIO
	MMRwH2v/n8XHMx+rOAKCdCHDYukxSlElU56adUNKVd14wYCPVv4axXpyYKDILR4+c6ailSefSA=
	=
X-Google-Smtp-Source: AGHT+IFvDP0XuuJHxV5RnbWlC7X4GO/XpvIVrGemFE3icy6MnaUivOOGAIqQ7A9+OzK7/cvpWXHNkIHIjw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5b:e8e:0:b0:e25:e5b9:8114 with SMTP id
 3f1490d57ef6-e28fe362769mr134823276.4.1728550787926; Thu, 10 Oct 2024
 01:59:47 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:25 +0100
In-Reply-To: <20241010085930.1546800-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010085930.1546800-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-7-tabba@google.com>
Subject: [PATCH v3 06/11] KVM: guest_memfd: Add KVM capability to check if
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
index 637efc055145..2c6057bab71c 100644
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
index 77e6412034b9..c2ff09197795 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5176,6 +5176,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
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
2.47.0.rc0.187.ge670bccf7e-goog


