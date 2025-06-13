Return-Path: <linux-arm-msm+bounces-61228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30900AD8EDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFC41C20A71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9381293C43;
	Fri, 13 Jun 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X8Z0v0mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C6293C58
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823043; cv=none; b=etBfnuwOo5+5nsUiPEkQwsaQ7ciL6uWc9uCi6KuRi05qR+dA6ntf9gF0W+Zcx0thoMviQkaVXiFarkgLb88PywIvIp+QgrW76zd2ecsSELTZim8LVLvT4ok1sxWNAfwWbvOQNaOzD7VkizWVTqOxL0z4fep98fsYVCp14w2iXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823043; c=relaxed/simple;
	bh=j/eRngj8H8ZbdpnO0fFDIsk8hiEYRjMNb+L170l84M4=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=puAj14ufZ9Fbdojk+GfIQgNCnAoQooWY+vRpI6Zq7tf7r8cPbR07LbSyRsd9YYtM99eLAvuk6i5z/8oWB8rXlIG7ZuP13cy593LzSBuuw7cLvplg7UjYZFIeyyK9TZPrB/ybSUb9KnQY92uYohYdm4yGNPUGZL/Jouh0BEVl0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8Z0v0mu; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23228c09e14so28234425ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749823041; x=1750427841; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkuRqqw31HUjS3f3ozaxg1qfTggthracEAgq5uGUxWg=;
        b=X8Z0v0muSm9FeaciRmmNfzkGS8MGD/ZGdfGo5SPwY+sTZvcOHtAAzWo7VNDIdWrccG
         XhsUOk+F2IzbD1pojA+1vfz7iDoh++r81B91RZJmnSLp9+J6Kdkgu1ug8G642qj9t2rV
         7HLE36fvR9GDMKmfc7OBl4ouvp/KpRmaQyIph4qWelCw4O5Zh9gdY4U12tkAy+yrmhUU
         aI/I2+9fYjvbi6sBw1oFbhKPLP02f4h4DT9i7ZRKs7tej6RAxaOcvf1QRtuXPoqDHUXf
         HnrvR6VCxTAck/rTZf08IEQ1nf+kOP9BgZjj56BO9F6x0Bin8XHThz6fm6Yz5b6SFV6g
         jiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823041; x=1750427841;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkuRqqw31HUjS3f3ozaxg1qfTggthracEAgq5uGUxWg=;
        b=v5DJvZL71Qtby5oMxXU0nlfpYsYyMzksU3oI44taXgEKvuSGrx4T0bE73Ygoau3c04
         +03V3sS9Vo+HdPm8RBW2hP56tCHbb7bHIAe5oME4+l4lhdr8V55otiIg2OclBVpXPzSR
         Me+KHzCEYpjG89g5Pak/9XQgDaTVLqsL9o0vmTeTuudBBZxn5jU+qbDH2Mp6Pyluw2fP
         958DpCZNPoKU+CAG6bjtLgrZ8cityVgAsj7d2xu/FIKjaRFG3JXwMRPN9zi7jxr0R+zH
         /z0jaU29TJVWxBqRlc9TpePCJrzyM5hBMmqkA+3FKfzQKV5rWhMElMC06vW0RJKuoJyk
         dO8g==
X-Forwarded-Encrypted: i=1; AJvYcCVPro75nkuS63oXAVWHRNLPuc4t/GRROObFNYEiA4EoU+3WDrBPXjN5ac3s9OZi9TpVg9kjZZ/VoNV+XWcj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SvSa9wmMvGFQxoB1CTeOMG8LBqImRByrDxZrbvVLwv/98J2H
	IcASH1Tnfc1L3E+x/j7QSgtI7+44slO/lz8uMemV3f9cRj5q/1d5NYZ2RexbinLdwzHH9iT7B9o
	tGMOiGixsdnfFqlrQFbv3Fi13YA==
X-Google-Smtp-Source: AGHT+IE4pdDA+YU0xuWw2bZwqNNa/bw6PDc1eh7mNKACvMbud4eEJ6Hw9B3p1LPkjrd3WQIzMQtFfcUKJ8Y+9UsC3w==
X-Received: from pgbfm22.prod.google.com ([2002:a05:6a02:4996:b0:b29:82be:c692])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:fc44:b0:234:c549:da14 with SMTP id d9443c01a7336-2365dc0d163mr46118995ad.29.1749823040963;
 Fri, 13 Jun 2025 06:57:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:57:19 -0700
In-Reply-To: <20250611133330.1514028-5-tabba@google.com> (message from Fuad
 Tabba on Wed, 11 Jun 2025 14:33:16 +0100)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzv7ozvj5s.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v12 04/18] KVM: x86: Rename kvm->arch.has_private_mem to kvm->arch.supports_gmem
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
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
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> The bool has_private_mem is used to indicate whether guest_memfd is
> supported. Rename it to supports_gmem to make its meaning clearer and to
> decouple memory being private from guest_memfd.
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shivank Garg <shivankg@amd.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 4 ++--
>  arch/x86/kvm/mmu/mmu.c          | 2 +-
>  arch/x86/kvm/svm/svm.c          | 4 ++--
>  arch/x86/kvm/x86.c              | 3 +--
>  4 files changed, 6 insertions(+), 7 deletions(-)
>

This [1] is one recently-merged usage of arch.has_private_mem which
needs to be renamed too.

[1] https://github.com/torvalds/linux/blob/27605c8c0f69e319df156b471974e4e223035378/arch/x86/kvm/vmx/tdx.c#L627

[...]

