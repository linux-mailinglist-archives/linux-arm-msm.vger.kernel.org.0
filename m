Return-Path: <linux-arm-msm+bounces-27946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857094802E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 19:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 584462874B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 17:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EC115D5BE;
	Mon,  5 Aug 2024 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vLPgvzmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64F15C15E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722878353; cv=none; b=szo0PKzcWZh5LGnmcW7cewqCmez7Ce6cuWUrOmBDzMQ0LJqDU1ZdwwU5h5kmeaR0Ot6wYDJGeQ809VC0Mx+8A/BYhRqxVKIMMQh6jZbWfbNnR6fxMr0d6h4nk5O3M6Vwlf9QweYSRgNZNTnih4/uvqspbsvmlOTLgDHqei3pu0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722878353; c=relaxed/simple;
	bh=ES2jTZ6KENmqgX9MrpJ4XHBRV9If+8kHjoEZgBp/ydA=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=tDz8YeSwVvw2BcrYiFKP09VNI4Jf88wDZQbMsPgm1PMywGjKq3HhQHtJ0mbJcrz/9ge51jlJFur33qUizBNjP/NlPSzJGsP9a2E4mt7NDka9zgVX/+FQ9x9cMttWVHEgdfiAtFqyFJFSUhXmOYo5wULoCF2oybVB6kOtUbjBx7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vLPgvzmO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-70d14fc3317so9395790b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722878351; x=1723483151; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=87wYYlCyac0o9laXkTcZTzn1Jp4rf7gDwVC55K5UvRQ=;
        b=vLPgvzmOlOMz9Nft9x0ZdrxMno2qOe1alAfRUJIYklap2bR+Al3IdCaIhn7QwdMcBl
         aRcjvqh2RoZLv3ffWSTRdNuUo4FQyCcN6lF0cDuFHH2de2XGKbL/6wilE32oJ5N1AZrO
         3LdGUGDXTmEIQm75YGOoFnZ0IJNdBEy6d9Bl+xwaoCUTX9gPLyJaL72YVoVyr3RECmyq
         pZat6KnJOI6gpYdlw0BwhXy7aDM4MH7HWiTHbAzh1XIeUBzAkJrFu45PdYupw+TO+Irp
         Nr5Ch4az0HvRImIErfktHcOEx/iqmIQTAGGlaPZ6cTnzjfkIx8qBQpSFAjX2wsplSTeh
         zPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722878351; x=1723483151;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87wYYlCyac0o9laXkTcZTzn1Jp4rf7gDwVC55K5UvRQ=;
        b=caOgcXdWdZw7zQENuBEG3EvYT5lCT372QF8rKEO/QBQxxSnYfFDplzdR+q1QuSt580
         BicCJRNRF9YCkfk1TV4I5bZcDYy5mc7DD3AGYx2/wOv8nfc5okN2Do1NrHE5urOboSkz
         Qfu5fbbbis+XOTP0aIvLCgy+rhWCMkZgzKiDARnm4K9Zosw9JD9kQy+RaObtjuEoSjWj
         /S8einYaZcAtnm4eGqESq+0wkKdFhgsimydMleVzm4ZGXpXyk7VDqRkjoXuCoeGeqdEp
         8dXZsTi3S0SDcwBsmxiHyzPnn4RFZ3oKmSGFlXjMRwTVmhealoQdneBXzg1znUWK5H4Q
         EAvw==
X-Forwarded-Encrypted: i=1; AJvYcCWqvWA5vPFXESglwmbCW1FpGzK7SKWzAwQLWjpXlWT6UjdfcKl5NBKU06eUYajGP96Uze4+YQk/Y/b1hgS3WCqdN8ulCjCgNt8NMA+l1g==
X-Gm-Message-State: AOJu0YzdPMN6i5Hz1C+hC/AG9r2USToIyGOd3KeIhYIHPwm04Mq21Qq3
	Tepup7ebXkjtxbGwSFwX/fy5X01VRDnBW07ZPv1f6eD+st2hbUAjvw+Tztz7+nLk+OOBZ2VHQm+
	7PQILYdDjJQXcs+YmrDyFcQ==
X-Google-Smtp-Source: AGHT+IEwc9XJlOMV7V25PTTSGoXOPbzFTCOo3wZFyrYqy6c/pJtVLczNwFnx8PjBfnZHFHlvbgx6nTmhxBNyQJb1uw==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a05:6a00:91c8:b0:710:9d5d:f2ad with
 SMTP id d2e1a72fcca58-7109d5df3bcmr33362b3a.2.1722878350954; Mon, 05 Aug 2024
 10:19:10 -0700 (PDT)
Date: Mon, 05 Aug 2024 17:19:09 +0000
In-Reply-To: <20240801090117.3841080-5-tabba@google.com> (message from Fuad
 Tabba on Thu,  1 Aug 2024 10:01:11 +0100)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqza5hqevle.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v2 04/10] KVM: Add KVM capability to check if
 guest_memfd can be mapped by the host
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Add the KVM capability KVM_CAP_GUEST_MEMFD_MAPPABLE, which is
> true if mapping guest memory is supported by the host.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  include/uapi/linux/kvm.h | 3 ++-
>  virt/kvm/kvm_main.c      | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> <snip>

Why do we need a cap for `KVM_CAP_GUEST_MEMFD_MAPPABLE` instead of just
making guest_memfd mmap-able?

Is this to prevent breaking userspace, because a user might be relying
on guest_memfd being not mmap-able?

