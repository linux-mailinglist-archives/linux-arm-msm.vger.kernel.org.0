Return-Path: <linux-arm-msm+bounces-56880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9865AAB565
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5069A1BA196C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 05:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B12749C668;
	Tue,  6 May 2025 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nSbfkM6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9F2F663F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487082; cv=none; b=tpXbkCLFtubaHGqvQSG7CXx6/wI4FKw9QmOaI71VUsd9rwH47CL9hpjwwoJOH9491h7ry9l++YklcYsTdRG2aVT2wB5dXQW2WnMczTrrB3xdGB8K/Dt6EV4sztc46xxoFsh4bb4gVSDGxmMJGcI0mUnUEOqX8rT+5lziCgTFTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487082; c=relaxed/simple;
	bh=8ZrLOI3/k1STjvSE8FjnfiooIAW0suwqXfzGYLc3uAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jK5eiD8LPdDPGefAxtucieJqaQN4POd2WMCH7NZ8qPEmsvL6x/1bGDVA51WNf2MYO6jveX6thKcM20RwhyyG7ciNEBpS23r4wnp6It7g8YD9FPvip8d0eQNmTbWYzYQr58x7X5x4SwXRr2dnHu2VzRXviyUs5TWmcoHgQQdteTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nSbfkM6J; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241e7e3addso45206745ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 16:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746487079; x=1747091879; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp3hEaccs5KLjus+u7lZyGvplQzD1hJyVDYNNOcIobc=;
        b=nSbfkM6JLSISQKjDshCg9pN8pIzihq0mRaYyGffl36JcLy8OXR/MdPoCxr9yUQUVFG
         wppT7mBxe5o6cetBcYxvQ8S7XkXQ1qsHNwbWAi0M5WZK210SVqMdpa75IK58bbCMDJ9B
         50UkSHCmt1k3HrGxWzgdozyMwZGxDwnbfhwihvpE5ylzicGebvK0PBmrFit+HUzTLU/8
         UwwGhIqtNTDXaxkpVbKQTImpRO1B0CdwA0fYB1hTRLkGXgUFSsKzMdLVL3dXAVibp4qH
         rtGZmJ5s1qBk2ryGo6/K58np5H+gQD7rUvVq4YD76gPru4FZvfpnq63gvn0P+iaKOmkw
         xUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487079; x=1747091879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp3hEaccs5KLjus+u7lZyGvplQzD1hJyVDYNNOcIobc=;
        b=tPYXsXShzLdt2AtOqd/zHrnu1SkmnVpPsEWx948bL8BopYnG4/8klHAoGx5OI+97aX
         lsMgjxd1FaOsToaeuuCD/ArSUM9f25P0uR59f6penFhPSI3McLWZEQytouLP8yYrttsf
         r98p08z6OG1NtHlKdh7AbSZ39RgQ947j5NJE8edf90BSgxqzvNXKr7AbE89MKk0u+siA
         9jxbHeGQfgWjObLFUzs+FrxtEAFRN84Vbu/dKzVeiOOSXqnqfommCiEi48GqNAmfePx5
         uqvsywjLAxdxWjWs45R2Zc1+qrIOq3Zx0uDNW/OwsAYzUQ1d2nNMX6vnnExoK7H9oeo7
         1SmA==
X-Forwarded-Encrypted: i=1; AJvYcCUVMXoyF781ehbunATRQOgyjKF6TmjW1tshvaJBz0ObaTPX0WUvuw50LPXMY+TXe4HyUwrUT6ZYRIHq4vYC@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6t2r+jA1VHgxs1671bZVGHsgnL5GNsvHF2TU5w/TW6TyW3ZS
	j/LRSdGvlCTAUwJ5Kpr2Wh41TcNNSQ4Mn2SuyzhTEgIDjRGkdICxkkUvy9Xon3YNIuVyclzjzkf
	/lQ==
X-Google-Smtp-Source: AGHT+IGhrX1MtCaIusgQgNQRAcx+0E6rNYmRwUcmQ9PrQBY1+RE7Ktib/G6MWTeo5oHjCygbMWb2/Z516S8=
X-Received: from plv19.prod.google.com ([2002:a17:903:bd3:b0:220:cd24:457])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e18b:b0:22e:39f8:61fa
 with SMTP id d9443c01a7336-22e39f864c8mr6120915ad.34.1746487079377; Mon, 05
 May 2025 16:17:59 -0700 (PDT)
Date: Mon, 5 May 2025 16:17:58 -0700
In-Reply-To: <diqzfrhik62h.fsf@ackerleytng-ctop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com> <aBTxJvew1GvSczKY@google.com>
 <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com> <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
 <diqzfrhik62h.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <aBlHJvfnV1VPKQzW@google.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
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

On Mon, May 05, 2025, Ackerley Tng wrote:
> > On 03.05.25 00:00, Ackerley Tng wrote:
> > We want to disable large pages if (using 2M region as example)
> >
> > (a) Mixed memory attributes. If a PFN falls into a 2M region, and parts
> >      of that region are shared vs. private (mixed memory attributes ->
> >      KVM_LPAGE_MIXED_FLAG)
> >
> >   -> With gmem-shared we could have mixed memory attributes, not a PFN
> >      fracturing. (PFNs don't depend on memory attributes)
> >
> > (b) page track: intercepting (mostly write) access to GFNs
> >
> 
> Could you explain more about page track case? 

KVM disallows hugepages when shadowing a gfn, because write-protecting a 2MiB
(let alone a 1GiB) page would be insanely expensive, as KVM would need to intercept
and emulate an absurd number of instructions that have nothing to do with the
guest's page tables.

