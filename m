Return-Path: <linux-arm-msm+bounces-66330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6BAB0F5A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4942016B652
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D333D2DA74A;
	Wed, 23 Jul 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kv3q+2lS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F62F432F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281833; cv=none; b=VS1WYeKJqBs+GgtRTUtlyirpl99OGYC9UHv84Znrl1gM9wuZSnUes9VW1zwcH1pglPGS+X+JK+g/MpHaAhkWIlQWuIA8FNNTCA4U8MAtJ5wTKIjFTCXfx2fbBO/QRB+2D6mVIwU3dxF1rV/SMwMKc5b/C7MKDlf/M1K3OndM0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281833; c=relaxed/simple;
	bh=kYA2UzaJYH+3hGfThkOhnRfE3+sQ12vjUQCuIWpjA0w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tDdkaE4qEBMCv79xcM08K/9vC/or+Z2OISwds7LRV2DQCAsYjp4LKoPG66fxXT/qCKSEVxHUHz2UKiH5u+Wk7qUsgM/kYvGinlHL/hV3x5QM7E8XjqPDoCa1XjuHFvU52vsbS70wpS3nKQT+xIw0xVHngVNVhm8/rRPcKd2dkec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kv3q+2lS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-315af0857f2so6392195a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753281831; x=1753886631; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYA2UzaJYH+3hGfThkOhnRfE3+sQ12vjUQCuIWpjA0w=;
        b=Kv3q+2lSxqe0KZZnMSmNJmIAHs+L9e8k+fGRkubySnqoJetobKtJJJiZaCrQHp1Ovp
         zwgu3W999FFpDUFvynkh4M6O148FCETTW8mFEM2FTueVFwUf6sJkV7/wW/AEDNLRVvmU
         agQVk3ch/HqrAPxgBSTaa7nW5/4VA0Sx4JhzSfF10XEq7CgcNs6nNin+V3tvKvLGe/q2
         HiJgpnd7nSKg4FY9u606ORH+glGVpcTKOGCCwskDSP48/FmIM+tp3+Q37rnQAV7vubij
         6lP7OBxi6hilKS10zKadYL1LhfzyL4BFpliPMH+yvoL1nAQ8ic0YuHisohVbG9A+9CYD
         jeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281831; x=1753886631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYA2UzaJYH+3hGfThkOhnRfE3+sQ12vjUQCuIWpjA0w=;
        b=a3pLuFpZ5N8KlzYeLgPz+WjsRIWgobQaeoMH1ovnif7Ht7aTpkFNY6CIEyZJlKPGNU
         Z9pzHm6op/iVxAU8M3oi7d1083yzVAq0R4bGZhcK7WiUmBOzzCHmPB8ltquK2QW9P7pD
         pkwe4GIq0C/m6+OL2LXucuvKnEak4ErdA/H8gbhTu4YXzcG577uPvC2RGCPJcnRiDefr
         bVfOJSUTsmIWbZLNowxyHZbXi+cNX0hTF7MUyjsbXG7nXpml04Z/GHsnYXw3PvNO4o+A
         lTxfXYi70G/MnlXsp3Sk0DnKMmsysgCuSK9zDuXzQg66G1X1uyx5dDTR5SvtdgyCGHVp
         M/xw==
X-Forwarded-Encrypted: i=1; AJvYcCUMlQumGzVS7AIBpsp5pj9Hn9sxNQAGiECZcg83Z4G0Fi1toVdN5Zl1DxONADCMqbqUynEaQJluccPhztId@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJbjUCII23tKgXl1xLFHfCa2BaXjSrbV78LeDp6b1DOiTwej1
	J8qxm+b5NiH1lbkklEKE4TuXnJ/PAnKzT5kClt6qBi1q0OjvX0FPgjeQ6fmhnS8NbOh3e6N6qCw
	yCM1Dkg==
X-Google-Smtp-Source: AGHT+IGkVA9V8/ZO7g4shvg2UQ6jCg/0h7Ce9RZescp986cCMnBbbliYZnYSjUAkEJw0pSkUoLPPHW3zZ24=
X-Received: from pjtu6.prod.google.com ([2002:a17:90a:c886:b0:311:d79d:e432])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5242:b0:311:df4b:4b82
 with SMTP id 98e67ed59e1d1-31e5078f52bmr4726762a91.4.1753281831499; Wed, 23
 Jul 2025 07:43:51 -0700 (PDT)
Date: Wed, 23 Jul 2025 07:43:50 -0700
In-Reply-To: <CAGtprH8QfPU8tByPLHL69MOhG5hNspS6zCjxzB8xM_Tbjgcs1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <505a30a3-4c55-434c-86a5-f86d2e9dc78a@intel.com>
 <CAGtprH8swz6GjM57DBryDRD2c6VP=Ayg+dUh5MBK9cg1-YKCDg@mail.gmail.com>
 <aH5RxqcTXRnQbP5R@google.com> <1fe0f46a-152a-4b5b-99e2-2a74873dafdc@intel.com>
 <aH55BLkx7UkdeBfT@google.com> <CAGtprH8H2c=bK-7rA1wC1-9f=g8mK3PNXja54bucZ8DnWF7z3g@mail.gmail.com>
 <aH69a_CVJU0-P9wY@google.com> <CAGtprH_r+eQjdi8q5LABz7LHEhK-xAMi4ciz83j3GnMm5EZRqQ@mail.gmail.com>
 <aH-hxiD2DwovFpqg@google.com> <CAGtprH8QfPU8tByPLHL69MOhG5hNspS6zCjxzB8xM_Tbjgcs1w@mail.gmail.com>
Message-ID: <aID1JoOGRZ8HIkc9@google.com>
Subject: Re: [PATCH v15 14/21] KVM: x86: Enable guest_memfd mmap for default
 VM type
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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

On Wed, Jul 23, 2025, Vishal Annapurve wrote:
> 2) Userspace brings a mappable guest_memfd to back guest private
> memory (passed as guest_memfd field in the
> KVM_USERSPACE_MEMORY_REGION2): KVM will always fault in all guest
> faults via guest_memfd so if userspace brings in VMAs that point to
> different physical memory then there would be a discrepancy between
> what guest and userspace/KVM (going through HVAs) sees for shared
> memory ranges. I am not sure if KVM needs to enforce anything here,

We agreed (I think in a guest_memfd call?) that KVM won't enforce anything,
because trying to do so for uaccesses, e.g. via __kvm_read_guest_page(), would
require grabbing mmap_lock in hot paths, i.e. would be a complete non-starter.

So yeah, it's the VMM's responsibility to not be stupid.

