Return-Path: <linux-arm-msm+bounces-56586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC3AA7BD7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5300D1C03698
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068821FC10E;
	Fri,  2 May 2025 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BcpLaWzJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D07019DF41
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223246; cv=none; b=PuI3abevIWTTMLs0JwXuIlOG8grAzj3BNkIYyEd/YMZQep1bsV/zUrDRVhf5FxGCSUEwmj59ZbB7cI3WkxU+vUVIivAEOHNsZTtNLxUBHeVoEuZ3zUNtjykSnt/C4fgwF+lmYnfdit0qdjdwnmRdOS6bgzE12xvnMMCHdKA0HJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223246; c=relaxed/simple;
	bh=IWO1AyUFB7iXmkHcJFsbUpJuUatNtsTj4+RNjraSFpQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ejqxT/oa1VHxjZLvasvuboNsdSGQWQPvpH6yoKnz3d3pYSc4R+zesO4xe98PxZa7otVBlbB22WXf7m4udPxWq8rPv2W7S3XcEazTJCdMOfcifPOyADBOQzPKNJxt6UZgOwm3t7s2TBayYbYQcFVuc6cs5GpHdtik+IRywfgNxmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BcpLaWzJ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so2582903a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746223244; x=1746828044; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HzIpA2PqUi+h9odYuZwRcfgQ93IrxS3bp714MmGR4QY=;
        b=BcpLaWzJhCpEES8X8s6NKHPZ9paMIE/TPjwx6CVUiWxOi6mN4/xTIA8I+viNfX1u7p
         M0fkeYAQICMwr0yInqJVhelIyJZ1GAp12N29SIpFa6rdBZBjEjUguz30TnaBHXkWwCGT
         A5ma0yjwctuM9GtJ65YBrbyMNDFh4MPzA8E/hVm/BcHCO/UH8tIhmteI5EWgVi94483f
         pVSVJ6N2J2DIlU48ZBoEOKO0D3SpfsLdj16mBctYRZpuoKMmvNAXTJ6VMdou+X/ay9f+
         gneQqGls+yf7hcEZ4tlf85gG6gVwx/5EuDMkC9e3TLLAm36913MqM0MKP/EOqYajyYiy
         LhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223244; x=1746828044;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzIpA2PqUi+h9odYuZwRcfgQ93IrxS3bp714MmGR4QY=;
        b=JaN1EMMRtCDqGzi2i0Sgek6F2cZ/fXD6xAa0WqnHqEuIdcgbhNB9TOyT9JHwQj97hD
         Tf5MqEw26h6S+nrYyMqCCGc/pnLpSDtfZHbiFoMlh8NEmgxBXuQfUWLA6flDjkPqAMmh
         E7lmwbT/h6FBMFc8J/cE4zfLd02JStSqdprKinR574EXzrY8HnB6uOuaZBn6RD0rZgwt
         krVW5PpJ7ERJzyMGqr+6LayIuyF2DXscxdY58sutk2lJNGARBU5yESU/T+VB8J/Q4quz
         PPG7DjsOad7xUbGbnetCaJ2ZBwW4bFe1Y+AOq3KXx3+uql4rpbbd7DTYfvi4j5Uqmv/h
         Tl/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfoKLa9MblLoqDiTeM/FfvuksxAD7ycL/CQBXlDRz+4Mf03rwgsf78ekxU6n0nOjMRM1RJ9lMM6LoFZ0se@vger.kernel.org
X-Gm-Message-State: AOJu0YwqRj18TNIZZgP++1sqnKfW3i1ue1VItozi2J8hxFN9EHx55NWz
	23h66qOmMRkTPpLWYeORsgLMLa0JE3fsv4kgM3Ax7AZzhTyB6cMH25zY9ThqyoGSSz7izhDIwdl
	lH0MMW1Rhh6ZPVILFTpk3Uw==
X-Google-Smtp-Source: AGHT+IFSm9UI8h4adWB/rZlWKofmvs0q5MWCFjV1/dpvUGE+PVue1wW4QNCfuK053lnPHObvkkKaN2wVI4yOL0c9QQ==
X-Received: from pfbfn24.prod.google.com ([2002:a05:6a00:2fd8:b0:736:6fb6:7fc])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d707:b0:1f5:8c86:5e2f with SMTP id adf61e73a8af0-20ce03edc68mr7472276637.37.1746223243683;
 Fri, 02 May 2025 15:00:43 -0700 (PDT)
Date: Fri, 02 May 2025 15:00:41 -0700
In-Reply-To: <aBTxJvew1GvSczKY@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com> <aBTxJvew1GvSczKY@google.com>
Message-ID: <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, David Hildenbrand <david@redhat.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
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
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, May 02, 2025, David Hildenbrand wrote:
>> On 30.04.25 20:58, Ackerley Tng wrote:
>> > > -	if (is_private)
>> > > +	if (is_gmem)
>> > >   		return max_level;
>> > 
>> > I think this renaming isn't quite accurate.
>> 
>> After our discussion yesterday, does that still hold true?
>
> No.
>
>> > IIUC in __kvm_mmu_max_mapping_level(), we skip considering
>> > host_pfn_mapping_level() if the gfn is private because private memory
>> > will not be mapped to userspace, so there's no need to query userspace
>> > page tables in host_pfn_mapping_level().
>> 
>> I think the reason was that: for private we won't be walking the user space
>> pages tables.
>> 
>> Once guest_memfd is also responsible for the shared part, why should this
>> here still be private-only, and why should we consider querying a user space
>> mapping that might not even exist?
>
> +1, one of the big selling points for guest_memfd beyond CoCo is that it provides
> guest-first memory.  It is very explicitly an intended feature that the guest
> mappings KVM creates can be a superset of the host userspace mappings.  E.g. the
> guest can use larger page sizes, have RW while the host has RO, etc.

Do you mean that __kvm_mmu_max_mapping_level() should, in addition to
the parameter renaming from is_private to is_gmem, do something like

if (is_gmem)
	return kvm_gmem_get_max_mapping_level(slot, gfn);

and basically defer to gmem as long as gmem should be used for this gfn?

There is another call to __kvm_mmu_max_mapping_level() via
kvm_mmu_max_mapping_level() beginning from recover_huge_pages_range(),
and IIUC that doesn't go through guest_memfd.

Hence, unlike the call to __kvm_mmu_max_mapping_level() from the KVM x86
MMU fault path, guest_memfd didn't get a chance to provide its input in
the form of returning max_order from kvm_gmem_get_pfn().

