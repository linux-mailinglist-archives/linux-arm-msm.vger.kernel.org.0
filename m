Return-Path: <linux-arm-msm+bounces-61784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 723EEADFB06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 03:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 096C317D3A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 01:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44D821D3E8;
	Thu, 19 Jun 2025 01:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dQYuY/FN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528721D3C5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 01:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297841; cv=none; b=Oj3TpKnP2aWH+tB81e5xXHfxuJzJHvI032s6sjA6Ru1jbIgMLj6Ak0gd3XhQyQ5Ys9knG/UaOQ3qWfWphANx80f6L78irs4IJe6z5JLPhyvmISmxnr+GjsnzV4KluygZmshuN17yTkB0ENXjpz5Fe8Hcrs7StTKneDnc1/tjxh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297841; c=relaxed/simple;
	bh=byNHkanhQbJdZ5XbDcaqI9g6pjljdL2hBTwL7tVfO/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KzuB0bCGHqZ7uE6ewbYHi9ii/a+chI6ogDSDsL4uuLhg2vOZC+dbfQ/c6EtmbS3huGOrWDvZ/ivogbokdQ3gsYItvqkrC4aBb2PVFelJRuS35yTepvGZxMlYhewTqB3eGtlA1I4FpgLReeJCPB/PdY44yvuQfOymtwoeJopFMDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dQYuY/FN; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so184232a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 18:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750297839; x=1750902639; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMyWfQw26TyUS5xbeLell4c85EVnEgCQej52N6NWW2o=;
        b=dQYuY/FNMDLkF35GnfLCGTP6Zi9HFZxCNvWpX6i91lXnNTAAfqkzYdmtBmW/h/LUeP
         xR4i/QyODEfcSlx/naROtripsyG3qazjce+jYqW2kt8H4jPJOH+Yn49wuq5UmB7bKzMI
         8dUUh9OTdfrRT+7O1w9lZytCJiOX1P4tK/uIEua2/SgAeiVOlPi96uKpgKUqZITeYK4i
         uZPDLoo/kDgM5MNpkSNRfIq88pbP0XyYZ8xRFTIy2iv+apBvWzFaVbnglgNXgJ0XzjJu
         f4m6REQK+D4ywWQHJAjyVa+icV+/bEfo8hs2udX5wBgEcEteWlB8xKuAvlFEj3ZoI7MQ
         +uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750297839; x=1750902639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMyWfQw26TyUS5xbeLell4c85EVnEgCQej52N6NWW2o=;
        b=f1jALG3+odu8w338SB4j5h93V8vJYcAFeyjJYJK9GlxDGvQB7ZfpraAQCtXpbbvPCG
         jwkn5SJbo7irzMORF+qZhGkT6DctxhmYpITIBfHktS27SMNmWnJSkIFhCVrBinLSgFGt
         s4odBEw1Owffh/OitHUmuQihZQFiGQqOtqUq8XzDPgNOoQJcth/UhcoprLVLD2cBOBSJ
         tITavL8SYUCY4b8gyUq0rcWPhuT+iM/XD3k5430Hn34g2sTXYrXf0pCV9wNI9NSyW+N5
         2g1bYs3Kr9PYApjweT2kIVGDslvu9xzYTjrC/RjdsgxvP5cxaQtlnB8DOnmDg/+wBZ4D
         5OLw==
X-Forwarded-Encrypted: i=1; AJvYcCU83j07l78Z7xVl9/dtirO2AzIF39207yfMkJ3Tm67Th9erEg+XwIG7Zx+p1/cPw7xDG1lQo0YtRoNnmL/c@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LdsRpyqeHkxTIdT65XyF8ibB6M5eLXXC0vRhE/1w2b9/y92/
	kCyxWouWXW50YLGVqoBNGLfCzp4vJPZnPLOLoL3SP9hodUAD5yfismgCjXV9ylVNhY/f/B6SK/R
	UIH8qMw==
X-Google-Smtp-Source: AGHT+IFYrz5Id5uH6iXof80e1fCW/jK+FUGGZzqnfiU3o4Gv59B5LgfHnd+rsdx73+Z8UQC28CXkLiecz6U=
X-Received: from pjyd13.prod.google.com ([2002:a17:90a:dfcd:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d60b:b0:313:283e:e87c
 with SMTP id 98e67ed59e1d1-313f1c77731mr27133495a91.3.1750297839512; Wed, 18
 Jun 2025 18:50:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:50:37 -0700
In-Reply-To: <aFNsVreb41robgbv@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <20250611133330.1514028-9-tabba@google.com>
 <aEySD5XoxKbkcuEZ@google.com> <68501fa5dce32_2376af294d1@iweiny-mobl.notmuch>
 <bbc213c3-bc3d-4f57-b357-a79a9e9290c5@redhat.com> <CA+EHjTxvqDr1tavpx7d9OyC2VfUqAko864zH9Qn5+B0UQiM93g@mail.gmail.com>
 <701c8716-dd69-4bf6-9d36-4f8847f96e18@redhat.com> <aFIK9l6H7qOG0HYB@google.com>
 <3fb0e82b-f4ef-402d-a33c-0b12e8aa990c@redhat.com> <aFNsVreb41robgbv@google.com>
Message-ID: <aFNs7fyWn8xWnTDO@google.com>
Subject: Re: [PATCH v12 08/18] KVM: guest_memfd: Allow host to map guest_memfd pages
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Fuad Tabba <tabba@google.com>, Ira Weiny <ira.weiny@intel.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 18, 2025, Sean Christopherson wrote:
> On Wed, Jun 18, 2025, David Hildenbrand wrote:
> > > Ya, but that's more because guest_memfd only supports MAP_SHARED, versus KVM
> > > really wanting to truly share the memory with the entire system.
> > > Of course, that's also an argument to some extent against USER_MAPPABLE, because
> > > that name assumes we'll never want to support MAP_PRIVATE.  But letting userspace
> > > MAP_PRIVATE guest_memfd would completely defeat the purpose of guest_memfd, so
> > > unless I'm forgetting a wrinkle with MAP_PRIVATE vs. MAP_SHARED, that's an
> > > assumption I'm a-ok making.
> > 
> > So, first important question, are we okay with adding:
> > 
> > "GUEST_MEMFD_FLAG_MMAP": we support the mmap() operation
> 
> Probably stating the obvious, but yes, I am.

Heh, my brain is a bit fried.  I didn't realize you were asking about
doing s/GUEST_MEMFD_FLAG_MMAPPABLE/GUEST_MEMFD_FLAG_MMAP until I read your other
mail.

Luckily, I 100% agree that GUEST_MEMFD_FLAG_MMAP is way better.

