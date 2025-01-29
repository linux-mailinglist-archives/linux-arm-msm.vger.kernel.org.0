Return-Path: <linux-arm-msm+bounces-46543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76243A222D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EC03A57CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3971A1E3761;
	Wed, 29 Jan 2025 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NaDUN5HB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820671E2842
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171427; cv=none; b=NfQg1DCL+eHQkxvvQEJbUq0IGfqMtkAFCRxnrQVGWNU26nD//97z6NqXmTlrkDUNe5FZdOYMKlMvmr/nZoV8uFTerJgwkhK1Lh3LhbV4bf2Xh2203UE0OuBrk2zdWPME5Lohlyz6sC3MsqpSYUG7FF2Y07iThdxQKeCsB4h2LTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171427; c=relaxed/simple;
	bh=74nSgIXA5pHR25K4J06Pa+CtFxgX++f0E7ugAdxdjWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u7U6m/NM2NbWN2ir0fPVnfneloFRZvsvRseZ8TwyLfmY9GPbFcUa0m/kjuYaDxxj7m6UQXfXFumr1thuSUnp64Vf+6BajDvnnxf2EARpnEeJhjkA2zWf37GC5Lt3ve2kHwJO/bI1i96a3SddfgRNzhkfyRMSwB2WJgGy/2nnh3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NaDUN5HB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436248d1240so33771205e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738171424; x=1738776224; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OG1tDMqftBd8Me3OBv+qFo5btVz20E1wK5N2Nsjw9qk=;
        b=NaDUN5HBNsOpC/VBfafRReJEqBYtoy/lFEQmg5MNq8qBxcgQY0gT933Zjx6idlFXcb
         OQ/g7ks+pn6PRbrnxNSrWHGvqHOJ2A4j2iQ1DjsRQHdL/3YBJNWyyf5oRzk6RRDPoDjL
         wTJvsksXEayF3ZXBF3ChwhWYZ+EjirB77iw2trhgeqgwD9Ar0SPfrDAtNsQzGuUyrjKv
         vw/kulrbYbm7V8kEoGLD7Ak6RczMA6UAEJV9zajwQTlWpSaJZk/VQ2bRKR4A1uJWRvMM
         cFl2fxQl2d4qhroOpV6b74kgs0oJBmHdVhV9aC1H+H7QLJd3Z3b4daLWdywnHPezhBHl
         xJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171424; x=1738776224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OG1tDMqftBd8Me3OBv+qFo5btVz20E1wK5N2Nsjw9qk=;
        b=U/wYN0uvCwp8rwWkOnlo57GCmM8hnNRwBwynQu4fH2AI7luWtDy26/VFYORomoQWbZ
         9DlSE0KMYJrt+yxG7TvIgji/ELXW7dd4fLpGeGDeSY1MpRToKRzJC7vf4y2iloAGwqno
         YcqhS3+SxCRlgvVGTn6vp6LaKTz9A3wapNV61luAV/3Xlr9Se4a1LRDJduZLGstprHLk
         71WzVirsr0fLXIXITzyIR93ayK75C6L8zBUCpg2V0mXRlEuuURfIpPHz0aviqymJ9N94
         bwF6sIQ5CFcRFF7wVNDxEnUQBMoSxCFOH5M+dyFYACVJ2KFcDHFdI2wiv3rFWb/7IdQG
         PbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHpH5btq53WUrUY6SajLG3jMH6LBeNg3GrITwSmc2oN1LLnU3FFT6a5yc+madvBxzPAD7cQc92YPf2MJK7@vger.kernel.org
X-Gm-Message-State: AOJu0YwB3PCf6akPwGguInIfyyt8bCYCPPvO+OvHRomclQtHIVQDC9DL
	xwEJjqng9S1tJNpnAMUHPxq/JeIMmW/ILm3FdxdxB17bBxuv5CqHFnJgkuAqs5fTE9JrnfuA/w=
	=
X-Google-Smtp-Source: AGHT+IGvVHP8k2OISYlCvdzbSWOg8/1s8TB8QwJ8K/TIlHOXAaW3sCB6BDzqqteDbn13Mj2Ujoo4vShVnA==
X-Received: from wmqe15.prod.google.com ([2002:a05:600c:4e4f:b0:434:f996:b54])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c97:b0:434:9c1b:b36a
 with SMTP id 5b1f17b1804b1-438dc3caac1mr34886695e9.13.1738171424101; Wed, 29
 Jan 2025 09:23:44 -0800 (PST)
Date: Wed, 29 Jan 2025 17:23:19 +0000
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129172320.950523-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129172320.950523-11-tabba@google.com>
Subject: [RFC PATCH v2 10/11] KVM: arm64: Enable mapping guest_memfd in arm64
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

Enable mapping guest_memfd in arm64, which would only apply to
VMs with the type KVM_VM_TYPE_ARM_SW_PROTECTED.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

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
2.48.1.262.g85cc9f2d1e-goog


