Return-Path: <linux-arm-msm+bounces-66240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E8B0F044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16B317B7B82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9511B2C08D7;
	Wed, 23 Jul 2025 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uoq9HD78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78D3289837
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267641; cv=none; b=P36K67B0wZLGrIMYO+okijU9OvCc5Y2kzaAnOSTWip6HCAxSzwr9/X6k44IAmJgvWQ8UrBzchCh5bxm9Ycmayldxc5qIq3urEAGN/5NSs4V046tToSw5Bc4nIwDPqJ+GIOPKLsoW1h2fgnEe8EnrxvmlJAv1j0zryDFkKKvlff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267641; c=relaxed/simple;
	bh=EH1IJuXG8Ao7tj1busmw6p1cNiHU5gyF41SXMJEr5/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l8XYO20BzAROYLZoANyYzcq2vxGY+sEjkSKw6xLrAO2eJo6jz8rFxrvKW3eSFERGdZZ0f5j1yG4YNd6FqqT9tgVOqMmSA7EK//cMnhFBSOuvv4ASw0oRog2psRIP7NvZrn8JhxJCnkD+9H0PQaD1kFvEQW43kEPtkFaCTs2Vcx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uoq9HD78; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso3056075f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753267638; x=1753872438; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzfZi60oZ9UO8raD765xxT1ZFhO1WsdtivBMYCkRGQ0=;
        b=Uoq9HD78OmeqsTTJO+8CBMdpzziyftBq86BrI18slcN9pdMqrqv1muZgaF9jhHe8S+
         jSgqIrIbhJVxgOXgNjI4Rid28AMziDj5fHOyNBewU7nzFQJZaFSSypL4Js1nCokPwgob
         pYLkawYnb+RC3m+5PyIa6ssyr0vUIW07dzZvtY8oofzhyIsNZ5I0ZdGX2rerFs3dtRoO
         LLaUDeljfczXV2KPabRu7v2/Szi4WJH9S6HJUcin3tphT98IrGT8cyXb3dbyZRnX5FIz
         0Nlz8P3EoaPtTQ0MASl/20THIZ+5CGdBtvyCv7/SeKZDBdvzx5O7rLH6LPKfhoTOr4I9
         yJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267638; x=1753872438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzfZi60oZ9UO8raD765xxT1ZFhO1WsdtivBMYCkRGQ0=;
        b=Jv+o8gT2u+FdTIoIgGmqTZ7okrJl7yL7dMt7NAFKNyKjHg9lIM8JLZHWc9k1vNaXzu
         /0B16o7zWlUt7/LlvoL5ffGLRkVCeaS70mRDGz4qtmfmZL2xMiMaFvAFFlytxmrPIlNp
         ZrmQbbwsUBX9vUiJYvSPxDX2gOVLEsf0L6vNUWgRGoIvS7d44NrEcad7f1YcutRxICMe
         AQf0Izk7l7M5g0koXZTCnwcWHJmvKD8p2nOG0naAAKCP6+G+2YBRY1fbcyHqHKOqeam/
         loxM2B/TgMP6Jv5xB7lJo+1HBN4EcxKhZFyRjuhL7qvWSA5tegBPOFu0TTs9PmJsFqtU
         dHNA==
X-Forwarded-Encrypted: i=1; AJvYcCVWkgPEE0l/BnIjkX9PluR0VHnc2H55+L4/i4Ipy9EUP65WzPEdA6hpq2InjrWYhrUyebHrg/QxIrWTSsVW@vger.kernel.org
X-Gm-Message-State: AOJu0YyRgEEiqLOk62CYXLyXIRqGiFtNd/c8Rfql/5YGH649XTJ8SgKh
	5e+D+TEtVw+L2R6OTok9GE68DJ8nP4Q/92twUEMi15ospijXMJDLY6zI8lwGNY8eaAfSjM070un
	BNQ==
X-Google-Smtp-Source: AGHT+IEo+s/VxPokXQ2vXolGdtsGLlmgFDoyNvmXKyvht3UuZi1/vOjCI4q8w/CILxGvMZbP18VFTQSgFQ==
X-Received: from wmbhc10.prod.google.com ([2002:a05:600c:870a:b0:453:6ee6:e62a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:26c9:b0:3a4:e393:11e2
 with SMTP id ffacd0b85a97d-3b768ef9646mr2055449f8f.34.1753267637872; Wed, 23
 Jul 2025 03:47:17 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:46:55 +0100
In-Reply-To: <20250723104714.1674617-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250723104714.1674617-4-tabba@google.com>
Subject: [PATCH v16 03/22] KVM: x86: Select KVM_GENERIC_PRIVATE_MEM directly
 from KVM_SW_PROTECTED_VM
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

From: Sean Christopherson <seanjc@google.com>

Now that KVM_SW_PROTECTED_VM doesn't have a hidden dependency on KVM_X86,
select KVM_GENERIC_PRIVATE_MEM from within KVM_SW_PROTECTED_VM instead of
conditionally selecting it from KVM_X86.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/x86/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 9895fc3cd901..402ba00fdf45 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -46,7 +46,6 @@ config KVM_X86
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
-	select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
 	select KVM_WERROR if WERROR
 
 config KVM
@@ -84,6 +83,7 @@ config KVM_SW_PROTECTED_VM
 	bool "Enable support for KVM software-protected VMs"
 	depends on EXPERT
 	depends on KVM_X86 && X86_64
+	select KVM_GENERIC_PRIVATE_MEM
 	help
 	  Enable support for KVM software-protected VMs.  Currently, software-
 	  protected VMs are purely a development and testing vehicle for
-- 
2.50.1.470.g6ba607880d-goog


