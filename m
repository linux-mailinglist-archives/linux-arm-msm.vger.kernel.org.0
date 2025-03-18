Return-Path: <linux-arm-msm+bounces-51782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C147A67904
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6EDE7ACCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A02211297;
	Tue, 18 Mar 2025 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zKmkfUED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D934211A15
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314724; cv=none; b=YUHICAaLIzC3XToN2ngc8caEfUjBGHCTVW4aVMrEdYSS3THwmjq5ECfz9vwHe37XDhc60j09ePL7+CvYI9pZxCJ1sZUTwueiEt+ITFRQOJ4WlbMyi9za+pIgPwtwrrZXObPwEShYfkhKyGMHJHBBXWvBXXxp4ypy8Hjnn1fa7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314724; c=relaxed/simple;
	bh=e/hFSvnnEwwRtWQXyhisvgF+/9sPbRgWQ8oxDFZaz28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N7YodiZMqz9Jq1W96bj4Y2wSBMqAzXEKf5Ts5PcVfoF+6pIo7lyHjqxEZFK0/I3dyFqveeafn2rlRqK6suKNffW8BvA+ViZDemBJxNsijNQwm3kORxpCUA7A/iqNfFHiBhDhq1EeJSDKSJPmWl665ghvqj8eqQIRtvaWKAj5gCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zKmkfUED; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so19547565e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314721; x=1742919521; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnXOtT0FQ4/1eHnhIJ4TPfV0aGXMBiS31afCbN7dx5I=;
        b=zKmkfUEDPUs1CBSMwSwTNICWLQyiIg/BkYTT+SwTd0ymwwiVsYL7Ey1zmLHahtOrv4
         0FgVPBOMMb4n4vs9nqbGeLVzoquCdEMs1VQPNJUpI0LAcXvmtVHIK/Rnaqv5nXcMTCXt
         ehQ5+Cbnwm7H5rZ2QVQjvlLFDvYBRnnxo43q7U00FBNWbWqbeS2PW8ylhSu0+4/zpvZo
         vt1qTZ6BNQqXhga57pNwA0DUt7GNTPDkq/DgT/hkw84TYBAxNxaCT9K3BlzMlmuCmxrt
         vg0M889gn/FZrJ6vj+M6CqzZM0La+SrDxd4F5KIsnZp2GVfEoT8RIVmI6jP8cAJ6j9+G
         6CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314721; x=1742919521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnXOtT0FQ4/1eHnhIJ4TPfV0aGXMBiS31afCbN7dx5I=;
        b=awayr2RP2484Kzg3nfjZVcez8xOuL53AElOwYHk7A7djrr54bMtf6jRFO+A3KwxwCS
         tzUP9TMgCYV1dOky4400WDfXdGylhPXLxhHgxiVZk9rVOqg3ZKrZiquqYrNC3I8lEs0W
         VEapHUtr/ZKvv5lAbces01XaDb4d2mrXUpeOaAZxqCGfZjNSzxaMYgE+v1CWl0U9oVGa
         DpsgxpnBmz4EUHgRoOgvErjGIak80FHueI24nKaNsgqfODbC7QQUeZpolpsPuZP3iBlC
         vsfhyqsuAZ8TnWUoB7SG0XK1rnmE3HaG8UFxA3PoOWm2UDhNy/rMMjYHJsOaDZD+rDvh
         hh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMYR15VxxfbmVw3TQ4UzklM7k/sGLgLsPPsbypEmTojYiYpeLeDI1sts5JnHbkmG/UY5KsZfyCMwDmsmDH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfwp7u8cUnFZ5tm/Efa+14287GzgE4ZCdWHzHRRA5Y5+IaNvi5
	jvsOo8Bqc7AmgqKpxvGEaG70Us29KhWjAzwq4DDuJwITVnfAshAopwr6KZH0aqKjAyaDAYJTBQ=
	=
X-Google-Smtp-Source: AGHT+IF9uTFjzpmaEzCIpQhbB++4V0kLzKxiQ3A1PdNJXhx/vKrnJQ5sz5qzaE8mmmXqSH2KhxB8aRlH6w==
X-Received: from wmsp26.prod.google.com ([2002:a05:600c:1d9a:b0:43c:fcfd:1ce5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:310e:b0:43c:e478:889
 with SMTP id 5b1f17b1804b1-43d3b7c9e1bmr28564975e9.0.1742314721054; Tue, 18
 Mar 2025 09:18:41 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:18:22 +0000
In-Reply-To: <20250318161823.4005529-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318161823.4005529-9-tabba@google.com>
Subject: [PATCH v7 8/9] KVM: arm64: Enable mapping guest_memfd in arm64
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Enable mapping guest_memfd in arm64. For now, it applies to all
VMs in arm64 that use guest_memfd. In the future, new VM types
can restrict this via kvm_arch_gmem_supports_shared_mem().

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 12 ++++++++++++
 arch/arm64/kvm/Kconfig            |  1 +
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d919557af5e5..4440b2334a05 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1543,4 +1543,16 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM);
+}
+
+static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
+}
+#endif /* CONFIG_KVM_PRIVATE_MEM */
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
2.49.0.rc1.451.g8f38331e32-goog


