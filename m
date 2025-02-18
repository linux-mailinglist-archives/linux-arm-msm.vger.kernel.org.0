Return-Path: <linux-arm-msm+bounces-48414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26176A3A444
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262F33B5078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217CD27128A;
	Tue, 18 Feb 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EfNAl6om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38027128F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899525; cv=none; b=skk1oI5bu1f0FMpUikIagLQOphZtZ8cipr4o3ABK9dK0z5B76BXQOEhPRdXOjS9qRkP6QlX08OPUn3fDLE0oo1Hnc8qRj0W8/L59oPR8IJXJYmCXzxbLqGiCGlC16an0tvyeXPJmm1Aa7AexJjJarbIMT8jyKg5F3/98CqCAxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899525; c=relaxed/simple;
	bh=viT/G3g01XzsliX7PUjK0In8rA61R/Ue6+JxkGk2b+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H/Jqmqb8CF0rdW6aGktOepvXm1+IXiZVihmMz1Xi6ZrlHJuQCdDQEp0geEueRMQDSziJKzH/aD7CCYnFx8ap0A5ypJQVA0pF8x90N58wJxDNqrdrX8NcNXhb5HA1At3M+0OKhOLHwysAJ42t+fyLurViIO9/CDxpjnR0QhsDCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EfNAl6om; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38f2f438fb6so4836667f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739899522; x=1740504322; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DDENpaoS5GaJB9ptDxeQYRENejUKqLMRn7e7USx5uGM=;
        b=EfNAl6omQTpnCjWBnz81+f5fuP5l5W3ofxat9ztOaa8kd1SsM0wJd7Rxct+dpgp7Ph
         BmQWR2qxxAlJPoISAM6I2bVh+L170pOhdeN35IWqvEkuC9qvYOG9t+yFRkFWnmWO3xw3
         +yPgcRv4T83f+02VL7hrT7admCbkUxHHOFXX46M8RInEC+Am4AniuVIoEraSFdFje/px
         PmdrHzQgQQS+/eT3BW0RWTQym3qPO5C2ClDXazDUmmsRJwljb4Lmo4s+c1vHZ23+oM+O
         2TMIMBw4RBSVGNLck1ST+IL1nTVjfNbQEaIVJZ7wgkZ0/iXBlBkg0SwrRVr0hdNHm1GC
         TU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899522; x=1740504322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDENpaoS5GaJB9ptDxeQYRENejUKqLMRn7e7USx5uGM=;
        b=m5V6E4s1P3iXWNf2jbo1tih5qWJXpEBGftzOQvVO2BAN23HODWMs6nUBYEqaulQEzi
         F6HEjFO30Rz6BqbNU6hLIzS08BaJHM58ZE5KCI0Cvn7dygWLuECWybSMXQKAUbEgQJjD
         XpCrPYYxfEUq/G/EA72gga+xGmVILVF6DSc8Ahh6zBfuz7xUkHoK3+JT3blUe0hFzLe5
         lTK+L+AkWJ9fXqZX4z55Ea71a/+HuuuGvuwSexWiGxA4ZAclVjSZZEbtjHQA1WzBmUf9
         HrvrRR3RZknpU7qVXTN1LNd5jpmWGDB1JpL2o2t6T3ilXZPZ4P0lUcccRkUpkwVnK4QL
         jG6A==
X-Forwarded-Encrypted: i=1; AJvYcCWZsB28Jcak/WCvh1ai/poK+dw3i1Jgh4Ugjuv4ZqCBuip3SlWh3jZzO+oGM6ORbtwORnBZK1XxgMNXKnNO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Jy58sAXWNYVvcj5SI3B2Y8QaS+geoLJseB49X/j1hJRCIgXu
	c8Fb/qBlgsutQ9oO6g2ifDjVpXeAR9mVUks5GUIrWfv3PGSuaPJgzUjW27GOOIsxZBdYQgOtOg=
	=
X-Google-Smtp-Source: AGHT+IELudRwURLH4qpHIjMR5d1+/EyuvFQNnfb9f8/dkmRcuMFNx9He10X0M9rgLys8f9ePWvRLzu+maQ==
X-Received: from wmbg18.prod.google.com ([2002:a05:600c:a412:b0:439:9438:468b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:584d:0:b0:38d:dfb8:3679
 with SMTP id ffacd0b85a97d-38f33f292e9mr12240320f8f.17.1739899521705; Tue, 18
 Feb 2025 09:25:21 -0800 (PST)
Date: Tue, 18 Feb 2025 17:24:59 +0000
In-Reply-To: <20250218172500.807733-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218172500.807733-10-tabba@google.com>
Subject: [PATCH v4 09/10] KVM: arm64: Enable mapping guest_memfd in arm64
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
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Enable mapping guest_memfd in arm64. For now, it applies to all
VMs in arm64 that use guest_memfd. In the future, new VM types
can restrict this via kvm_arch_gmem_supports_shared_mem().

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
 arch/arm64/kvm/Kconfig            |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3a7ec98ef123..e722a9982647 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1543,4 +1543,14 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM);
+}
+
+static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
+}
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..4830d8805bed 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_SHARED_MEM
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.48.1.601.g30ceb7b040-goog


