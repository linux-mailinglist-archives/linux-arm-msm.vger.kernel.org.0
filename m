Return-Path: <linux-arm-msm+bounces-27697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F325944757
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C05081C248E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACD516C87B;
	Thu,  1 Aug 2024 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C0SttAXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A25170A27
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502900; cv=none; b=sJjuraDSj0F7QDdstCQ0rfJ7gGYQomqX8XqoHj/enAXbMSKK7vUrOcuQYSr8JJyocjF7RRVw3ELilHGOnwv7fHRnPT9Zab/ljZVDYbPlzBlvm23ibWWjNRlCRGGNsjU+ORfYLwXjR+PmKAFcGc6IxhB8/Ett1DFif4uJhCWnFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502900; c=relaxed/simple;
	bh=/xyaq17skgd/L7RMTEIyM7OuUD5Qi6/Az+T9v4EOwIo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=goWkXoabiKH6xE09JUrCBZ/k00JhX/cvUWWnG+arIhpcErb5AFBApWySS7CO3F4AZmBgTe917bZRggDRZlsRtGcMUmPSK4KpNHM010JnBd/V+QOwVyFCglot0UZlihvPCAEOo+uqBnewQj6I9oQStTCxOyzBg5PMrzKg7A4hiC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C0SttAXp; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6799b9a2161so150334797b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502898; x=1723107698; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYgP8TsqpjmhLiOepZBWnEDyKrGoYglq1ochGe+g9ag=;
        b=C0SttAXpfE4BrS5dhxgp4l+/SRfPRUSQiQ1iS78kTS83BiOgdaj6YTjuGsUh5wMHU0
         s6s40F8HJldmOrCytvR0hExcfpE09ou2ej23cMzGEGzSSr2pEDUUTGAjOu2v86rqvLPX
         d9mA5av/ySyYiudwsJMazyKyXmqe0fXqArm6KZp3mW3irMepANtVy7yura3eNvGXg7r5
         q8cYA11YJ1+TXIYrFzvwjO3b3Mhdq79q3gRzfA57Vs0wl4RfEvdGPDAEsmOCqygZcZlS
         P/JkeYphRZEmNXJTbmPLAFCZgdD0NV9XvphSETGmbaxT2xCnNUqOQUsr3Irm/ENScvfR
         546g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502898; x=1723107698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYgP8TsqpjmhLiOepZBWnEDyKrGoYglq1ochGe+g9ag=;
        b=Dkd9Qjlns0y2u9wRh2etejU31bz7tE9oEXXtEjmwp+Ow+V2vrOdVRJAsKHYZf+EHQB
         JepbeRKJKOHs4aDPnwsz9RQTxNQ2uc43UMqU/9z6Zi3Zwwnk+Ca097t/3H2o28iB2/LL
         Lw9ZuKiLQmYvt/KtfiV9Wi7s/Lz4ifcujroOu8g54J3bmmwH08TKWO7pDtCbO2YyC/aJ
         Ipuo/7OAJFvHnHHEt3C6RhmoIvpy/T9JWkqemC0yljnOgnG5KjXzobl4rWsF90+gzitz
         K7m/QU0DTJjqjS31HM1HTPLu3z2qNO/ge1FAUsdrqMbXCaC0ChXSD2vnrMQoyTWu+ZkZ
         dVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqrIScGpmetstw9ah8khSpsbRblgfQFfmXuIzn0x0pcyTcJyEwzuw1w1mEl/GNpk2WZWFv3XcqZeKiJjiFt966LGUbKkm755eJ63wlYQ==
X-Gm-Message-State: AOJu0YxtGYQJ4IiCVDCZ6BPODh6/gAlvADL75LEHqy0/1lRlXXjzuAV9
	lOuy7p90e87J5/N8BM8QSzo+MoeqO6YEQtZhTcCzQLZ5czIU/Bzq3ZeMCPD6EUCT+eIvLxLyHQ=
	=
X-Google-Smtp-Source: AGHT+IFYiAm/ZMOGWhUa/K3MvrLtTZnEUf3NdBQXNfdF1a3J1k2aDdCJIpsdZ+5mVOdSrR6hCD4FF6rWww==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:6902:1107:b0:e03:6556:9fb5 with SMTP id
 3f1490d57ef6-e0bcd3e5b26mr6126276.11.1722502897790; Thu, 01 Aug 2024 02:01:37
 -0700 (PDT)
Date: Thu,  1 Aug 2024 10:01:14 +0100
In-Reply-To: <20240801090117.3841080-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801090117.3841080-1-tabba@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240801090117.3841080-8-tabba@google.com>
Subject: [RFC PATCH v2 07/10] KVM: arm64: Do not allow changes to private
 memory slots
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

Handling changes to private memory slots can be difficult, since
it would probably require some cooperation from the hypervisor
and/or the guest. Do not allow such changes for now.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e632e10ea395..b1fc636fb670 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1970,6 +1970,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 			change != KVM_MR_FLAGS_ONLY)
 		return 0;
 
+	if ((change == KVM_MR_MOVE || change == KVM_MR_FLAGS_ONLY) &&
+	    ((kvm_slot_can_be_private(old)) || (kvm_slot_can_be_private(new))))
+		return -EPERM;
+
 	/*
 	 * Prevent userspace from creating a memory region outside of the IPA
 	 * space addressable by the KVM guest IPA space.
-- 
2.46.0.rc1.232.g9752f9e123-goog


