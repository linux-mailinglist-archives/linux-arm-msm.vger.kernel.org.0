Return-Path: <linux-arm-msm+bounces-62479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC081AE859D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF9D16CC2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8837266B72;
	Wed, 25 Jun 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lf+U5dmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4553B266B40
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860426; cv=none; b=dkavZnhpfEAH1H4sxqZt0q7oYYgIW6UruHabq8jOqrZHfWoo42dXh5yZMYMW+uW3+p7V4nkFy9HI2MWPF1pd8x9zLa7yFAJmSU6B98KnvtprK1ADYtvTRqEZQcniH+OfOBRFl+VBL28tmc6gw3eIcrety9u0yQKuNNvXibzzw6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860426; c=relaxed/simple;
	bh=Sd9sNznzUEi5EJ+sne6IkjefYfHIjOxnBuf3fVCoFaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZgO+GsOE9CUtjus7qQOsU3VQ10TE8SDFl7H+leH8kkHEJPnSMXIWWxwPUvLtV6NMZ2JHxhDWUTasoQNLmt9cS1QcO6OSwHwLeEtFu0RfTPpBPuD7DUnRHQM2JaH12FfSzpUd5PcJjDGa5o1rxeDugcyrEI7nvkGXD9Pa5QEFkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lf+U5dmv; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31c38d4063so4371057a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750860425; x=1751465225; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8f5KlzP2CK1JfKkyCSpzd2kQ9IT6Pxr3cya4YkMOEY8=;
        b=lf+U5dmvH/Jhu6XXCWkikfqeIALb3+b1Gc1xu1/WB8TuburnvU08EIEC3x8L4iuVpg
         8kTXprmtYqKsa3VgGkK5VGmIhaovpX1/PdAvnHu8J6/jb6iPLyDlGo1Zr0DY2pTFQ40l
         n5vV0jw4KYOIBGXxk/aex3oFhHcqG/nkSdrX3FVmTwD+of5WIfjB2UKJ4/4KXhQ++f+x
         MzCF3HfA5Fx5OF+PZRNWjg/S7pmno4YZhSJMYIvRlwccEUQo1CqLpy/WNGQWRl0Lmis3
         kYCZqcESouvPM/DlBjJUawpO5DWsK8MKZAU0NjB3vGMn7MHK9OICA1YBgO7xGW11bhTE
         ym9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860425; x=1751465225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f5KlzP2CK1JfKkyCSpzd2kQ9IT6Pxr3cya4YkMOEY8=;
        b=NBJx1CjBVtTaM4KWSMIG0ka7CIPMAo1g9VZqmUH7wUrmewaV03GL4Bk6Bxb0XUF2EK
         7cotyd9JmHsYItveuTdllZ489e+colQ8u6vrsWmfl/9ulXf1GRs7FCx37fcNxA93lsUF
         wriMhnB51O9Fq8vcJuYIGHF/eZAhW2X3yIE3P2ypPi9ilr+DEMBg3fbJ2oBLh7Sfy7xR
         N8MIMOTRJF1qHmHpwYJRjk/tnUGhRZKD1Q9c8i8aUYLBCHOko75BZgLAiPcmEXMk2mIo
         LM/VxSruZvDxT6jMNqJxcT+2QsWbeWETL60+zmUoPCmBQVPdheQfUkBB4oQn/1ReXo4w
         ZhYw==
X-Forwarded-Encrypted: i=1; AJvYcCWFoSt4PkUGxrUSYtobR3Oht7TYukJKp2O8ZgHNO/Upf0sdoB5R0RLf+ij0iAXtV0deTeWAjHl9YsUppNyV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hknHoET9UcN+TMX3J/VDoPlSXdiDkmylsBco/qmpZfkCp5Tl
	ab38s6EKQHRC8VSPxGJRedCn1C39yTgUXL89aa4V9VoXsCWF8A3IYaUvbf0p54pSZeJD7j1s+p4
	BsHKp0A==
X-Google-Smtp-Source: AGHT+IEApMeiGDIZ/SFpUW2e3JmrB7W0fF4MD+T+mdNXkLycwiEroA69CQKBQvTSE7/cFMGNJoFgS1F9IcQ=
X-Received: from pjbof11.prod.google.com ([2002:a17:90b:39cb:b0:311:ef56:7694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19eb:b0:235:f3df:bc1f
 with SMTP id d9443c01a7336-2382406877amr54160135ad.36.1750860424524; Wed, 25
 Jun 2025 07:07:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 07:07:02 -0700
In-Reply-To: <CA+EHjTygKUN8xYM10sVHFDpV5GDZJLGK2JaFPbLhB1pHU7jAkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611133330.1514028-1-tabba@google.com> <80e062dd-2445-45a6-ba4a-8f5fe3286909@redhat.com>
 <CA+EHjTx2MUq98=j=5J+GwSJ1gd7ax-RrpS8WhEJg4Lk9_USUmA@mail.gmail.com>
 <372bbfa5-1869-4bf2-9c16-0b828cdb86f5@redhat.com> <CA+EHjTyxwdu5YhtZRcwb-iR7aaEq1beV+4VWSsv7-X2tDVBkrA@mail.gmail.com>
 <11b23ea3-cadd-442b-88d7-491bba99dabe@redhat.com> <CA+EHjTyginj74a+A58aAODZ72q9bye5Gm=pTxMmLHrqrRxaSww@mail.gmail.com>
 <aFrlcYYM5k5kstUO@google.com> <CA+EHjTygKUN8xYM10sVHFDpV5GDZJLGK2JaFPbLhB1pHU7jAkw@mail.gmail.com>
Message-ID: <aFwChljXL5QJYLM_@google.com>
Subject: Re: [PATCH v12 00/18] KVM: Mapping guest_memfd backed memory at the
 host for software protected VMs
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
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

On Wed, Jun 25, 2025, Fuad Tabba wrote:
> Got it. So, to summarize again:
> 
>     In struct kvm_arch: add `bool supports_gmem` instead of renaming
> `bool has_private_mem`
> 
>     The guest_memfd flag GUEST_MEMFD_FLAG_SUPPORT_SHARED becomes
> GUEST_MEMFD_FLAG_MMAP
> 
>     The memslot internal flag KVM_MEMSLOT_SUPPORTS_GMEM_SHARED becomes
> KVM_MEMSLOT_GMEM_ONLY
> 
>     kvm_gmem_memslot_supports_shared() becomes kvm_memslot_is_gmem_only()
> 
>     kvm_arch_supports_gmem_shared_mem() becomes kvm_arch_supports_gmem_mmap()
> 
>     kvm_gmem_fault_shared(struct vm_fault *vmf) becomes
> kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
> 
>     The capability KVM_CAP_GMEM_SHARED_MEM becomes KVM_CAP_GMEM_MMAP
> 
>     The Kconfig CONFIG_KVM_GMEM_SHARED_MEM becomes CONFIG_KVM_GMEM_SUPPORTS_MMAP
> 
> What will stay the same as V12:
> 
>     CONFIG_KVM_PRIVATE_MEM becomes CONFIG_KVM_GMEM
> 
>     CONFIG_KVM_GENERIC_PRIVATE_MEM becomes CONFIG_KVM_GENERIC_GMEM_POPULATE
> 
>     kvm_slot_can_be_private() becomes kvm_slot_has_gmem()

LGTM!

