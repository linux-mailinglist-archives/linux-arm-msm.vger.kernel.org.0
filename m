Return-Path: <linux-arm-msm+bounces-66631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0682B1142E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 00:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F09AF16B2CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 22:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFB323A99E;
	Thu, 24 Jul 2025 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sIiQ3nzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC0241122
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396516; cv=none; b=MWgHZmg/xZNLHkSlMYThz1U2v6R5D/oKIHtHn0T3VErU52ZWS0jpObdc72GHU+qzlz1TGD8mEGZDP3nrzDMNhDjuiB6x86FFIPBZKMjC0T6iw9F2IApacQst6eU2sMdkTkDtue50G6HdNb+Kp2zsg1RZhc9iq5BGWodPv/5ENLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396516; c=relaxed/simple;
	bh=r5SzxM2o3YDT3MM6mgAjKy7bmQnwJvTgu0zUuOAYsqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UFBLhf0dm5O89jRroQC7nuve749yPbuwbyTvB1npEAaMlVPJRsVofrN5dPHYcT3BPqQSxBOz6dBXv9nGOTxSHe/RVmWHqQjk7HCud8Wn6VdVyScgltxA3BXPJPUTUp2cEpaqnZbNGgLYjHEWDAaHgGeWPC7w+8erWMCz/NfakrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sIiQ3nzq; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313fab41f4bso2244979a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753396512; x=1754001312; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFqcIXETNfo8GzEn6hB6Ya7g4JGq3t1ggKMLi3jyaSw=;
        b=sIiQ3nzqahZJBdJcoBBuhDt5ZLMFJokPPT1WsQ7kl/6WE3atgZD9D2TspEBYmVtsCt
         +XuYU4ZvwJVaXCSFufs/fosO6Syv+fVqkepM2fuzQe/gF5DO51lChg9O9qBsxG6Wuw9f
         QARv9PnzKPpbErLpJLmcvfvkggnl0OtGvunnXM0OEgZwKtWIr7DSeJld/mk3mdsZc8nd
         FPXsceFEGoLNhNjd4lBJmTVnAY1z6NlZ+XfzGrqDKv3McNciYjHedouL3TB0ayn4tJGr
         esewq65DmPBQN2QtZ9RJjH80S1tCLyVpOmNyjif7QYLUQ+uvxskShOv0AU/yxpe78TuM
         SDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753396512; x=1754001312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFqcIXETNfo8GzEn6hB6Ya7g4JGq3t1ggKMLi3jyaSw=;
        b=OIC2dQEe4Kx8/BYWOjQlDzJiy3K+s4JITabMfbU2l9lD5Pb0zOBen/OSW4mjCrIF25
         s1w3Cb7jncDKJd2H0bq26yKc8fb+pUo60V6F4dbeWyxzVFbbrVY0wmLLE+9HlDnL5M8h
         SPC6sBG+4GVdcGJ0QiqIwMegPUuJRiOepIeSXbfWZ/LQyo7WhYbEp5zAeiHojYLHYPA4
         IbKlEzKYFQvhJIBXywQ4KIp7q7C+VHgYvc09S0iN5P5iFXz/n/vdrDmQxHPcYhdZ44TK
         wgO6mOaZIEFlhG0QroshdlPgYs8y0yI2TIXfOpC6/EOZcu6k3dXZZMMLNsZ3TOKlNcgO
         UaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuh5iL0RNvgTQ2Ionh2SSdCuIyPOERhArNpNM6aFUDoUvD2hXW+ilDL1+CRfs2+GqfzLgcrpZWoELsw9Np@vger.kernel.org
X-Gm-Message-State: AOJu0YyaiTP37N7u2oFU5TmA4WP33HjzWQNq5oQNXJj4HQ5qZOjQtgfs
	2BYVHcnmDydKVPxx023u/pHA244QpNgsFW/9WeqTvQg0PvRz4L1Ws8E77QAgJeDzV6RC7Zd5saQ
	04M6r2w==
X-Google-Smtp-Source: AGHT+IHuVeukYr6lWMjvsRkjvN6oFU8CQPzldpvdB/N9yisxOdKopu5kObxNBBArWTOrC8zyhULTFJAICEM=
X-Received: from pjbsu16.prod.google.com ([2002:a17:90b:5350:b0:301:1bf5:2f07])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3809:b0:308:7270:d6ea
 with SMTP id 98e67ed59e1d1-31e50855de1mr10081085a91.30.1753396511877; Thu, 24
 Jul 2025 15:35:11 -0700 (PDT)
Date: Thu, 24 Jul 2025 15:35:10 -0700
In-Reply-To: <3f337306-e79f-4ac7-bb86-60b88b262e88@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-5-tabba@google.com>
 <3f337306-e79f-4ac7-bb86-60b88b262e88@intel.com>
Message-ID: <aIK1Hp4jZRY4zVTW@google.com>
Subject: Re: [PATCH v16 04/22] KVM: x86: Select TDX's KVM_GENERIC_xxx
 dependencies iff CONFIG_KVM_INTEL_TDX=y
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
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
	ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 23, 2025, Xiaoyao Li wrote:
> On 7/23/2025 6:46 PM, Fuad Tabba wrote:
> > From: Sean Christopherson <seanjc@google.com>
> > 
> > Select KVM_GENERIC_PRIVATE_MEM and KVM_GENERIC_MEMORY_ATTRIBUTES directly
> > from KVM_INTEL_TDX, i.e. if and only if TDX support is fully enabled in
> > KVM.  There is no need to enable KVM's private memory support just because
> > the core kernel's INTEL_TDX_HOST is enabled.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> 
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> > ---
> >   arch/x86/kvm/Kconfig | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> > index 402ba00fdf45..13ab7265b505 100644
> > --- a/arch/x86/kvm/Kconfig
> > +++ b/arch/x86/kvm/Kconfig
> > @@ -95,8 +95,6 @@ config KVM_SW_PROTECTED_VM
> >   config KVM_INTEL
> >   	tristate "KVM for Intel (and compatible) processors support"
> >   	depends on KVM && IA32_FEAT_CTL
> > -	select KVM_GENERIC_PRIVATE_MEM if INTEL_TDX_HOST
> > -	select KVM_GENERIC_MEMORY_ATTRIBUTES if INTEL_TDX_HOST
> >   	help
> >   	  Provides support for KVM on processors equipped with Intel's VT
> >   	  extensions, a.k.a. Virtual Machine Extensions (VMX).
> > @@ -135,6 +133,8 @@ config KVM_INTEL_TDX
> >   	bool "Intel Trust Domain Extensions (TDX) support"
> >   	default y
> >   	depends on INTEL_TDX_HOST
> > +	select KVM_GENERIC_PRIVATE_MEM
> > +	select KVM_GENERIC_MEMORY_ATTRIBUTES
> 
> I had a similar patch internally, while my version doesn't select
> KVM_GENERIC_MEMORY_ATTRIBUTES here since it's selected by
> KVM_GENERIC_PRIVATE_MEM.
> 
> Anyway, next patch clean it up as well.

Yeah, I saw this oddity when writing this patch, and decided it'd be easier to
just deal with it in the next patch.

