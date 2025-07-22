Return-Path: <linux-arm-msm+bounces-66136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A11B0E111
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14AD01C83E75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6749C279DD8;
	Tue, 22 Jul 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iVMUyihF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1EB279DAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753199913; cv=none; b=CEP75XcueFdiejaVw0/leEBBW+ytP7Q698fqU+NDg+VsKd5ozuMXabGKxZ4F3ROUtHPooQUhRTSH5H/cZEc+EMqebo0GjtV8mNH6MiSH0hJNoulrk7ZCdkFgf2ep2dCGTLh1V6Ay7SZJnq0vp641S5rA/68IEcmDQnkqsrw0l1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753199913; c=relaxed/simple;
	bh=0Bj99f55qGTTIjBIklLfiRGtgRPwPDw3KJWhAAdmPNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P5VgA/1AKpW+VdFJoTKKlhD9ws8AwvAr84MOelts4HWEoqb9ojnFjCDrzdAuJBOMTLbs2pzDico5OWgWrAJa4luuQdEysj3JwZl9DxCJBO6UTAkEpbhCdzfIryJe8TYfgpxforaV5KX36nDN8/IKJbECjfhZn4BnWLY5QcTajSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iVMUyihF; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-312df02acf5so11185a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 08:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753199911; x=1753804711; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dntet92u2ZnbqIvi9ZAjtry5gw5mzuxy85aL6ZIpFs4=;
        b=iVMUyihFuXUU/qOFOLPAQ3xv9H7DMsGv3ywjx5mvv6hfs7m1XHWWclCpkLUcJ2/ZnF
         7sKgOhrRZlkK9S6CPMpzPebmurdbrgtd9a1w7BI1FY5i/QrkFJ8IDeVwPcCH4BRkteJo
         K5WEEr00AwpT/ZntPXVlIzaxz5tLebiXn++kqmFKfdO2CSaBI/wpR1qtZ8/tufGaB0/9
         g2O0ReL+1dO2JDonOuwIiEZueWBbHwqrbZtJrMOOdxAY01EtXbBwvn+39KtTuOTj8P7u
         KSOzMFfaXp5oEqvsSdwMdK2TPoNCGeQqRXypT1ijJtyOkGjX560dT+GC9OdoiWRW7uaS
         Bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753199911; x=1753804711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dntet92u2ZnbqIvi9ZAjtry5gw5mzuxy85aL6ZIpFs4=;
        b=ULQy9XEjaHFJlwrMev7VkVOYR5ImAvs4QNgWp9G07M4ugFBI+I2bClvj0bLWxFSxrS
         b9iyCgMQPFKyRK5d5R6MoWKCyTpMeocPkvAh9dSCV7sFCT/FHhaPfgMcY0Qn8N1b4BU7
         ueri/TRIwVTXAnFHKddWVdP/jL1Ob0+93JGR3w7iHDx85xVanjr6d84XaNdRYTedKSxX
         BKIYl3oQyJjYQebzyBoYmmo/Lm5UQZYBXBbcz471yZXEWrCTKskDnk3C2scM2p0QCEWV
         CW8CagMxRD9mJ9Rfop9xiQ5tpiD8bl47kEFae32eUoh8r5oJfkVz8eiFruGLfG2d19ss
         ZFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUazFnUDwHWyroMtK8T4ChihrBciGhxdeTzxnef4b4B/OSYK8FKaUHyKRzgUnkVyzLTvYYA4Z6pXB1OYv9b@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHprtbxdHkia9h4bHd+zxzL5y0tESyli/xHbo5iF8UYlMBNPE
	fZ1DHu4zJDJxRAtqxwBZCHanPVPOKDGIGg1EfbXaEn/qiZYOwWAG6ThiGYX3XvEYBoDTAGYOqKd
	P9K8Ckg==
X-Google-Smtp-Source: AGHT+IE/ERPxhDR98Vn1sldOeqYOq7x311jxRpTo9srVBTYAHk1WavBhVIfa86MxXTjpt/R+lS32JDT5tGA=
X-Received: from pjbkl7.prod.google.com ([2002:a17:90b:4987:b0:31c:38fb:2958])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3945:b0:311:482a:f956
 with SMTP id 98e67ed59e1d1-31e3e12e57fmr4933468a91.5.1753199911156; Tue, 22
 Jul 2025 08:58:31 -0700 (PDT)
Date: Tue, 22 Jul 2025 08:58:29 -0700
In-Reply-To: <CA+EHjTwPnFLZ1OxKkV5gqk_kU_UU_KdupAGDoLbRyK__0J+YeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-3-tabba@google.com>
 <aH5uY74Uev9hEWbM@google.com> <CA+EHjTxcgCLzwK5k+rTf2v_ufgsX0AcEzhy0EQL-pvmsg9QQeg@mail.gmail.com>
 <aH552woocYo1ueiU@google.com> <CA+EHjTwPnFLZ1OxKkV5gqk_kU_UU_KdupAGDoLbRyK__0J+YeQ@mail.gmail.com>
Message-ID: <aH-1JeJH2cEvyEei@google.com>
Subject: Re: [PATCH v15 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
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
	ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 22, 2025, Fuad Tabba wrote:
> On Mon, 21 Jul 2025 at 18:33, Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Jul 21, 2025, Fuad Tabba wrote:
> > > > The below diff applies on top.  I'm guessing there may be some intermediate
> > > > ugliness (I haven't mapped out exactly where/how to squash this throughout the
> > > > series, and there is feedback relevant to future patches), but IMO this is a much
> > > > cleaner resting state (see the diff stats).
> > >
> > > So just so that I am clear, applying the diff below to the appropriate
> > > patches would address all the concerns that you have mentioned in this
> > > email?
> >
> > Yes?  It should, I just don't want to pinky swear in case I botched something.
> 
> Other than this patch not applying, nah, I think it's all good ;P. I
> guess base-commit: 9eba3a9ac9cd5922da7f6e966c01190f909ed640 is
> somewhere in a local tree of yours. There are quite a few conflicts
> and I don't think it would build even if based on the right tree,
> e.g.,  KVM_CAP_GUEST_MEMFD_MMAP is a rename of KVM_CAP_GMEM_MMAP,
> rather an addition of an undeclared identifier.
> 
> That said, I think I understand what you mean, and I can apply the
> spirit of this patch.
> 
> Stay tuned for v16.

Want to point me at your branch?  I can run it through my battery of tests, and
maybe save you/us from having to spin a v17.

