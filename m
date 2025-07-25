Return-Path: <linux-arm-msm+bounces-66724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E14B1206A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 16:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A243E1C227CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 14:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B85022A1EF;
	Fri, 25 Jul 2025 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfG++rx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF3226863
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455399; cv=none; b=CcjqkVaRUJ3nYyLX3UuwG/Hc7h46JPg2EzdT1KeACydXubEYxVOHxMRi3J1z11A5lJw1M9Cs5mbC7p6o9h/wL9RSVGvNa2nLdk0zwbkg+WT2bneIQk2gW68MfT1KnavC4HqwXGzhQBgAZEUKP0r2U2RCrkLFsXDK8+VukK3Pq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455399; c=relaxed/simple;
	bh=K3fLhkRTCvPWFzXF+RTlvEpWsEqZfAX/VnDQbwLix5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DmHIbPOmTHyu07JPbFotcIob+MzQZ16OHw3bKFcuDaR63aLbWakfrP1jjPKdZkX9Kx1sFy81SCDGftQ/gG7BydDHUA8ALQSOvciD7qmErIjMnytY3VhLpS5x0rCwKXTqlFZtV3kGMpjmiwubZ+hWTBULC8EHwfA/YXPrlnBIdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfG++rx9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23692793178so25983765ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 07:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753455398; x=1754060198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M11ZItqJowsXWKLvHpygzI/Vvsnt9QVCd1UdBgcxgdM=;
        b=IfG++rx9mo0WTcUki63Z5od0ct/dQMREXtbeVJCoPlDezWNoidrHwxSXpS7irpH6n6
         r3WjyYSP48AkgqyQxoqhrBevHaobMsHd3UgtR/JVWuFBx7wxa6W1dj7Cz/6LjLFNXBq7
         XvrDAPC5YTQToE8L2nRUiCA+Q8L2dAH1AOPbLIiuNhyRbewkuFON0aGzxw0qbIIiy51e
         syyib0AcuwrEecEkratzEsfoSpm7q98c5iKwtZfoevv0hl0GnrrKMXmAQJvVCywIXE2O
         NoeXj6QvmTBAjQRDHUG8Mt8keDzDvLGSTjb5ZZ5uQFonAgI0JJzjFDWPMLK/RpkqVGMq
         Yhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455398; x=1754060198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M11ZItqJowsXWKLvHpygzI/Vvsnt9QVCd1UdBgcxgdM=;
        b=ZULqirYT5y3CYrdgleBu0A2MrCEogZyf0AVtinPGYlKfnh37/vTVDysTODrqA7saaY
         vU4VOa9ywMdrPrcJUCS8oSZ+BFyyadLm6s5olsJGZNbl+6H6No3/QSyya7EHB6Dq6b/C
         Q5btAzwmweSk/icw9vqiZYhz+8WkIuhw6pTjAb2oqlJUV/47/vjD4eTepMsBVdHdrG4b
         edthvEGlm32Zh1zTruxJScpZaP5qIOt4xfyck60C3Uc/jVbEErCzkmMPvJg0mCCadoM5
         j1HB8dKi90Mx7MLqHz9ngAbYHaIeES9rgNpEI1aQPZB3oJzBSBdt77UzycFW3tIMGbSw
         Ly5A==
X-Forwarded-Encrypted: i=1; AJvYcCWnusot56lk+dBbZ3y1tTVgCPNBVOk419OxuhM2rsRksm7COj/7s8Cul/Ocw2B74BUfmV1Ykg/EMQDSip7H@vger.kernel.org
X-Gm-Message-State: AOJu0YyofdXyuMa4Mr36wHnOqxum9c9EWf2+pqwR59Wv/wFr8HLrSM8H
	xMW0u9618JGxb1NrM2vBQqpifXiz6gwejbqxIfgitFCw2q41FaAxBeA8eJ02zvWwPUtiRj27Ls5
	ahZpWEA==
X-Google-Smtp-Source: AGHT+IHSdqHbxeeeIonkSh5BY2m83Kk+wImCtE785oBEw0uVpGh4sf1S5Bqzy2yOyFZqFe/ReQAn+EAhx5g=
X-Received: from pjvf3.prod.google.com ([2002:a17:90a:da83:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ca8d:b0:23f:b954:eee
 with SMTP id d9443c01a7336-23fb9541174mr15170785ad.35.1753455397682; Fri, 25
 Jul 2025 07:56:37 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:56:36 -0700
In-Reply-To: <diqz4iv1dudx.fsf@ackerleytng-ctop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <diqz4iv1dudx.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <aIObJH439LQWjnqq@google.com>
Subject: Re: [PATCH v16 00/22] KVM: Enable host userspace mapping for
 guest_memfd-backed memory for non-CoCo VMs
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
	ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 24, 2025, Ackerley Tng wrote:
> Fuad Tabba <tabba@google.com> writes:
> 
> [snip]
> 
> Did the patch [1] for x86/mmu that actually allows faulting when
> kvm_memslot_is_gmem_only() get dropped by accident?

Ah shoot, it did get dropped.  I have a feeling Fuad read "drop the helper" as
"drop the patch" :-)

Faud, given the growing list of x86-specific goofs, any objection to me sending
v17?  I'd also like to tack on a selftest patch to verify that KVM can actually
fault-in non-private memory via a guest_memfd fd.

