Return-Path: <linux-arm-msm+bounces-56537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1AAA771D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97376189AC22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CE525D20C;
	Fri,  2 May 2025 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qFUGD12+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9A2550CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202922; cv=none; b=GuvJ+T+w9UHTYmpG6/0o00gpdFgr3QEHv7FGN0yUEsRXHmoYWFiQcDhV+UnIoNh6kQJrjmTojfoFdO+1kOdcDOO2e9U/I3sxR422vwnBV80+FjpTP9g03RpDX8WPPUJrR2JeZD1f7JXRJMwfrUYHfKjH/AuyGO7DLE6eVAbPPTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202922; c=relaxed/simple;
	bh=F8Ecks0cr0UJewJY6JoGUijJEu0wkhpC//2H67gJrLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vD4yX5ji6swRgVc0dNQqg5Mw7jhFsGFCycCKx4RWQkbHLhOCsH4L5PSoNPy9jSwwtZ4HbYCELJrTW6q5iOlzlQP3LrvHntCPpNg52rZMfJ+lrANmY/ITKV4QE2F7iOFdyfP9agAlQcWSzRIdU+W8T37xrZ3Epj/5dJXR25J/+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qFUGD12+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-309c6e43a9aso3120899a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746202920; x=1746807720; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWAhWnLxEEQgWspLCf20dJl/WL+Kwu9vR4rr/+HkGs4=;
        b=qFUGD12+MoULj+yK6PvAeFprSAIJgorHjVhfL4EnX7D1bHq/dNnU5RjMzvLlwDOpZg
         XhQPDOJGHgNyKkYPeglFgNDpMaikq8VGbuqAuAGibitnNPknoqhvG/9FQD7RUvwJt5LK
         NfH9dB7KKfLWk0dkoDPHCknTc+75uBMet5YAilpFEsoS3TbfLUtx3j+Nd5llkikXAHCi
         1xlELIBSPg8aaRbBqO1+8oYUBnxRQ9ApBDrHuRfXpbzbkyThptoUCPsbYucRn1xGjWmK
         nZ/+CgOruGM1G/XePeR8YfQtBjqOacP40WRoKiBVAJdTksYwFZTfxBfnsgwpdeSmt+cw
         mLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202920; x=1746807720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWAhWnLxEEQgWspLCf20dJl/WL+Kwu9vR4rr/+HkGs4=;
        b=QjHbadmWDtY5QL/mvc1cVbfk+TX48AvQReoIjFRl2pd4E4kkRNFVaqbsnE+6dqkKU1
         pDwuUAQDG673fxMGundc9IPCX3gtfFxAwbRbbUyo5skpTqZVY1USYRUwSfQhnq+dfHN8
         0sI266bwfj5Rqci8Ops+MEIwl9qyEggjaxLzgfSpVX5LDrtMEBqNptygRRvz6J9+sxqL
         t8Rvr4h6WN6cYqjx2SH7ksw9qIol58cQuPg0kdOspbF3E7NRV6YU8TcvcTs1MUS7ErF+
         r7cE8sjD/xt59Y0YHKdkVuuZ/mj1khcnJOugsyAzwfmAY/ku5pdMWtiv1DiWF1ajU25G
         muJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2jry20Rfm9nDwmQNvXjPOQFJ13T/kOFdz7d5dtKITJh3uw4gI7FVEHBeCTixyGXppCc3C3xtbJ34REx7N@vger.kernel.org
X-Gm-Message-State: AOJu0YxBE1O8C8KrWndf8U4rLMKc5TnNi0udlpJwqbfIfrjlMarOlhuo
	P+XZQlqVVfGV6B47uIG+WykmYQ12dYti4d9DQUIAEm1mpDdjVqME0jHqZ+Hdhu+T9PbtWMIG6Z8
	yuw==
X-Google-Smtp-Source: AGHT+IHKJOwK2AYFShQ+asOEeUnEmwji9g2dnxKyKad6cMksYJ7+qH6/eE+gOCdEI6osazpQ8H6J0LE4s9o=
X-Received: from pjb6.prod.google.com ([2002:a17:90b:2f06:b0:2ff:5752:a78f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc5:b0:2f4:4003:f3ea
 with SMTP id 98e67ed59e1d1-30a4e6addf7mr6247048a91.33.1746202920304; Fri, 02
 May 2025 09:22:00 -0700 (PDT)
Date: Fri, 2 May 2025 09:21:58 -0700
In-Reply-To: <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com> <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com>
Message-ID: <aBTxJvew1GvSczKY@google.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com
Content-Type: text/plain; charset="us-ascii"

On Fri, May 02, 2025, David Hildenbrand wrote:
> On 30.04.25 20:58, Ackerley Tng wrote:
> > > -	if (is_private)
> > > +	if (is_gmem)
> > >   		return max_level;
> > 
> > I think this renaming isn't quite accurate.
> 
> After our discussion yesterday, does that still hold true?

No.

> > IIUC in __kvm_mmu_max_mapping_level(), we skip considering
> > host_pfn_mapping_level() if the gfn is private because private memory
> > will not be mapped to userspace, so there's no need to query userspace
> > page tables in host_pfn_mapping_level().
> 
> I think the reason was that: for private we won't be walking the user space
> pages tables.
> 
> Once guest_memfd is also responsible for the shared part, why should this
> here still be private-only, and why should we consider querying a user space
> mapping that might not even exist?

+1, one of the big selling points for guest_memfd beyond CoCo is that it provides
guest-first memory.  It is very explicitly an intended feature that the guest
mappings KVM creates can be a superset of the host userspace mappings.  E.g. the
guest can use larger page sizes, have RW while the host has RO, etc.

