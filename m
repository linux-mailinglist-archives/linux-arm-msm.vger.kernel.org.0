Return-Path: <linux-arm-msm+bounces-45833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186EA19534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 563271610ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9202147E7;
	Wed, 22 Jan 2025 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZooG2xU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA724215043
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559683; cv=none; b=PP+hCPfGiMys+DR+bknTc5xUEnM2RCr1W6Y3p0rcDaKVNUhoLFC2/hed3pgkvR7hYVqgmnrufWdOMTBVu3fiVSqZ5bsZe6YWC8nRXJ560+lsaM29RKT9TXwmpRVXeaYE8wxuT/5cK/nNtVOwEU7L0oWa+9HB7KxcD+4T2vepJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559683; c=relaxed/simple;
	bh=05N3notxAKWirJyACGf6LREsAOUQTVq3cu2+BY4Gews=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AKsbJQJtMPK9R7AI/JmH1HDCy/8mV9nMlBqfQCujhfbwGTWhaGbrx0MzyP3Eo2uSQTVWw35Nf+PpvE3ETNko7/NPLnCXhTKwR8nZCug43fTTFafkCIMd2rnDCzKDFY7KXhWnVy2CRHFOkOKsd8TOsSljNCJvzxHliXMCORWel24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZooG2xU1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so38252695e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737559680; x=1738164480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IPKS54xTLh0G0JL9zAQyWtImcHIleOjiond1cpHBfM=;
        b=ZooG2xU17v3irOvlLX6O64dMbEkVotYCLHS7LTfRpmZMOghCVCldWNAitSunVJ97aZ
         ORW3jOtpTURwOdQ7ORCll+Umv85fbo9vO7hOxpkHftMgoTEU3DR/b6ynn1S2/yaW6m59
         8R7SQLMpEsRPuEDxpKObLi8jaxEEi73qEj/mKMzo7oo8L9LxL49v3OoZwUbS+tCz6T6x
         ByQBmeKjoqX6wxvw0080EskmGLikHcFyreFsKKRQJ/R/s8IqAyK/gdlTKSEkgLE5Zav2
         VMKzqwKnb59/kVXwM9nWFenCHowgk0UOH16hHGG69q1YmiWfMQlZEYkGB3eqTwqcB0zZ
         /rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737559680; x=1738164480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IPKS54xTLh0G0JL9zAQyWtImcHIleOjiond1cpHBfM=;
        b=Jkx6oZKKRvqjaChQao4LBr+KLgD3rhKxHse9kUVCOdwQ9UGmE2P1Y5+xXSrsAkQvzj
         SdOTMcvEH0kL0zp3FnM5Rhh2R6r9FJkTIVgALpLP2+sH1vffTcqldpqblGgi0FieF/KJ
         WdAnx7P6fCwm6B9aaEe8TYNIqh6jXtbbt0g2scVvAS4matNoOI7/2Wk5WsBZy0nHy6T9
         6gzYBpBDDt19FyeNawUS7NUU2/RiGb/wYRvt7oXoKql4SGXmmTU0iMbKKVnQN61bSZGF
         F3089HL+rb+5h0J29jM1zslrWAlxKLO3qV8bFrxbyjNkElnusjvLc2wKWMWa2KJEg+7z
         OfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjbj4qStISTA7uL1ZMgP1AAwu4QLFP4u0+NthkOWG5qLHWvfhEwK17I+Q5j+pPmel123E0x9eFfRIoe1Wv@vger.kernel.org
X-Gm-Message-State: AOJu0YyUR6fZjbPlEZzULD2sZd2UKWK4X3jS3ed0XZgQWocsQGa4SE12
	MpZblrD4CJLrdlfGfDeFytWQsYt+GgXUjbrhkSUG6oek8U9JBJP6AYYjK6C2Ol3BLGB9gpFjgg=
	=
X-Google-Smtp-Source: AGHT+IHKqC3XO4cCp4hQMJG/KxA/l5U2Z4NRyzkp8RVnNUMgP+pHap4S48R+U41XmL0XQuq/sUwK5vqtFQ==
X-Received: from wmjt19.prod.google.com ([2002:a7b:c3d3:0:b0:42c:bfc2:aa72])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4508:b0:431:547e:81d0
 with SMTP id 5b1f17b1804b1-438913e1c00mr237078585e9.11.1737559680156; Wed, 22
 Jan 2025 07:28:00 -0800 (PST)
Date: Wed, 22 Jan 2025 15:27:38 +0000
In-Reply-To: <20250122152738.1173160-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250122152738.1173160-10-tabba@google.com>
Subject: [RFC PATCH v1 9/9] KVM: arm64: Enable mapping guest_memfd in arm64
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

Enabled mapping guest_memfd in arm64, which would only apply to
VMs with the type KVM_VM_TYPE_ARM_SW_PROTECTED.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..fe3451f244b5 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GMEM_MAPPABLE
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.48.0.rc2.279.g1de40edade-goog


