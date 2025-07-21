Return-Path: <linux-arm-msm+bounces-65943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D81F8B0C9BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104C31647DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096C02BF015;
	Mon, 21 Jul 2025 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3d8lKUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC422DBF76
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119198; cv=none; b=j1kdyojmSJLK09KlfL6ukN6RanWUHI0ElAI6NgI0w+fELM5DusZ9w8EBkyb6uzYlgKyyK1CFseKYmyBDNcjHkH/LZRvgipI/5UXvxn25A5ACgfdmhQuMbzIEjXWPzaU+WiomCodq4ybwdf2vVLB3Oysc2Jyc2LUKuzcOeBgd7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119198; c=relaxed/simple;
	bh=mNDNOCM/MmTeG8bWN8KzikOsujHMksewTXy/RHZM/qE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PHqbZPJOYj6YxacpfDuZ0T0GfRHxhj2tBDDjNYPa1h7u51J4AUxLdChNhQC7ZCsb9lmoDvaqOSQr3iiYQwX+N/HDj7PP0S5a5/bcFrvrd7wn1tb2HsSkWqqZNF2Z0sGrQojMx3VJ7vU0X1AJ8tfc7VShB9XGbMOxlwNqoTsKs7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N3d8lKUG; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so6182574a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753119197; x=1753723997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ4+t7dcQ2ZTieyIQcNf54MPM3Tf5VMEW4AFMPESUF4=;
        b=N3d8lKUGk/bQ1FKto9x5kAHNe3GopGBm/ofUbbwxiQhDShB+njzBbi25olBju9tzdV
         KYNF1hKyd+Iz6QypE3k/c+b577PzXh8adOaFpZ0XyR3sSkj0aGPIy3Pdb9HcmH0OGsgk
         V/3dbLBmcH1zd00Cd8MrO3qEbXGd8kVRCKM48JssUtebcwlgUBBe4qCgmZPruaMooKzr
         +L22k/yeN1eaOV4SOeXQjJle+Gs3gtXVqGVchBXTxRR1g9ffB5ExoTKBn42Q5bAPkIdW
         g2mcqgf9zthZhR8mcyB4PACNzj3kEtiRwZ82/qnBucut+xUM6R6+Q1MUzGXWBTdV0hWw
         6Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753119197; x=1753723997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ4+t7dcQ2ZTieyIQcNf54MPM3Tf5VMEW4AFMPESUF4=;
        b=xRMJGm9YbsVyFRaxf8frX/0f/X7Vr3PB+QNSXUz/sN5YfyJIw2hNVbtp3QX3cwpOyF
         ciGCg4gm4MwAUsfnr5HEQQct5Sx+LTWLiLZBmIhJNBsxSAR9QW6i/aKyWDEOMaZhgY82
         YyHPQUHFwr8+Rg9yokbIw7ZFKymhjMNsnszlFr3RZYU1ygddl69crATg1/adxICXA3JJ
         VWo1Mg3tAk8eDIMRZ+CcuK7XjSHCI9VY9UyFdKBxYnPyouhGb6SLA3u9roIP7mF3T/+d
         oBsh87+J/4N8bFdcR1sS9ZnZr/6VcaRbAigIfPHBV7DSBgPX4aPkgVTvB920hkzwusfH
         xyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnY9R/eDvto+o5uGVMI5EG+Lqjm54/F6gugvke1cxXA6Cs19HE6i/uhcsgioTwlYnyqOemodVENXqzzyKM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxml3D3lU29djadu8EoQfifeyLp7KaDpDaJw8e9qYg6IeMIu825
	ROGNhXM+aVRrB7kDxnFfbtdfMdps4jRCW+OooY49J3RbEujqQcKqSA38ZONVDNZJ7x3G+VfTc5I
	a13638A==
X-Google-Smtp-Source: AGHT+IFwe3ukJO/AwYaZYv00wIRNUUpc+AWlcSl6+/xV7rqHjeFmT15UCVZr+TsQ5cn11BlfaXrHgArz1CM=
X-Received: from pjbrs12.prod.google.com ([2002:a17:90b:2b8c:b0:312:187d:382d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b06:b0:311:f2f6:44ff
 with SMTP id 98e67ed59e1d1-31c9f42400cmr34113055a91.17.1753119196635; Mon, 21
 Jul 2025 10:33:16 -0700 (PDT)
Date: Mon, 21 Jul 2025 10:33:15 -0700
In-Reply-To: <CA+EHjTxcgCLzwK5k+rTf2v_ufgsX0AcEzhy0EQL-pvmsg9QQeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-3-tabba@google.com>
 <aH5uY74Uev9hEWbM@google.com> <CA+EHjTxcgCLzwK5k+rTf2v_ufgsX0AcEzhy0EQL-pvmsg9QQeg@mail.gmail.com>
Message-ID: <aH552woocYo1ueiU@google.com>
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

On Mon, Jul 21, 2025, Fuad Tabba wrote:
> > The below diff applies on top.  I'm guessing there may be some intermediate
> > ugliness (I haven't mapped out exactly where/how to squash this throughout the
> > series, and there is feedback relevant to future patches), but IMO this is a much
> > cleaner resting state (see the diff stats).
> 
> So just so that I am clear, applying the diff below to the appropriate
> patches would address all the concerns that you have mentioned in this
> email?

Yes?  It should, I just don't want to pinky swear in case I botched something.

But goofs aside, yes, if the end result looks like what was the below, I'm happy.
Again, things might get ugly in the process, i.e. might be temporariliy gross,
but that's ok (within reason).

