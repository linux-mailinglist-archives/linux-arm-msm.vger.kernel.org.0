Return-Path: <linux-arm-msm+bounces-56359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD83AA5BEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 10:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D509F1891061
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 08:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F351E883A;
	Thu,  1 May 2025 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3X29Hz+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2052F99
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086871; cv=none; b=I9mumr1KQsEPmxxj2TqxKMjeh0Z3a6GTuTwrVjsQxVZv6k6eGBxfyMu7CVzfvLuTj6TqZVgR+psATOE6l2ia0WiYN+cg86oGnXP+ut8G1bzmTZcXJWou5CAYC5/18yF42GXoIcIQL9hdWGZ0XGJ+BkliCAK/KIlrUKVqSB9WRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086871; c=relaxed/simple;
	bh=vREGJGFXVuSGRww/ba3HQasR34sYytL5jH4hZO8ytUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJ1C+ZkjzANmlHpK27jC0mPXwZGGqbm0MVrQtkBrjgJ5hOzoTnEGBCHPiRDXc6yuf1AE1E4xYqBA1qc2V23kfhYujOfMICDsZJXlUc9JgUQsOobWbndzCd9Cyx2zFCAKAPhlUtDKzYmLIQNZTOoyqgUpP3FChBh80mFPGsKenJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3X29Hz+I; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4774611d40bso146971cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746086868; x=1746691668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vREGJGFXVuSGRww/ba3HQasR34sYytL5jH4hZO8ytUA=;
        b=3X29Hz+IRNkUN+JxN7pAbUmQgq72Fxmz1BZN/6WScz4xzwF8R9sBMmA67MlSaHttpR
         RLaCtb7sKZ9t40nA3TAU16DiFAEw74hCR5voVMLzDScUs72ucCSi2/4XYXMhwohhTlnb
         byhs25oZ6vMhPbt1xUEmrKhs16aF2j1q5V8FLbKONQayYsG5VJdz4WXA6FNQCw+FfyaO
         03Z1JLro0mSL/3EAIaKmNgpG+375BDnxKD1fqM3YBGpjoGVUfhdjVtPcmSoXR6wUTWP3
         5V+9H8xbRj6EIgQwmxlOj0SH0C3pSpnbzA9WA4wOsz/vjC22+weWiHAezONY7pZKh25P
         TNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746086868; x=1746691668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vREGJGFXVuSGRww/ba3HQasR34sYytL5jH4hZO8ytUA=;
        b=UI/ZDr3kHAH8P6ObIfoo634JGqwWi8j7on5+iBhA3Wlwskdz+9psSejurGZhaBnvsz
         Y51++V3A8GJRfK3rHU8bNDssm0zTyES0C/boiagRAvCqu730y0v1rDRxXfl/kqNUCH/O
         y3bBh/YEfBwoAwJZISDIM2369WyxGWscVC8WOUNE+SlKkdPkgV3CZ56VRbmiuNh4PTi4
         ha3RjHtlysbWUZiowefM2kRZWXnslAzbDxdwzFD/75ApvFRrvnFZF/9iVAMKJ9SbEH/5
         mpTpL6XjmEDI9ZtwxauUvgcN2Ydb1nOU3VIw1QqECgpX7LqNRyE6wWawJjYB29pdz1S4
         tzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCURyR/I44u0OgMXQkPyFzbkVGr4p1R2SjOPlljoYAmZER6OFz5yju/xZllBOwZ7SZPSKr7evHAVThVqzZkD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7GOw6nwDvauS/DJycR7Tu5aR2Gy00ZGBcEcqjCsaZFZyqhpF
	K6tZFLDGZ1UFlCH+zm4zoiwlEyvStZ0O0vrJrStpuV7odN7PHEGBmXp0kcCIWTiUUsEWCyLMnGK
	PvC4Z0+Rb7JX3lgIeSRfwIcNhbYSGW3Kf9UDa
X-Gm-Gg: ASbGnct4nNVuQWSD/PrB0al0MKb2bQ1N7lRhSNSw7mMUN8ul4zWf56T2nybqlGDQB4H
	MnpLTghq/YKZOY9qkX7KAIWsSuuRmayHE3kWNcPRG8kr6G51o2bgWOH2NASfj9wwk448oQDQEdD
	mTd8Y9SvF7o4oXVDhKB2f8/Qc=
X-Google-Smtp-Source: AGHT+IHQC8o0TPGWFiSlPjgZkK3iMg9wSyQqLwuv70JGSX9kuQCkQXw8IAZ3tYTW5FsT0ee0ahy75qXucdeg1pEym08=
X-Received: by 2002:ac8:5f50:0:b0:47d:c9f0:da47 with SMTP id
 d75a77b69052e-48b0dfd9ab8mr2036221cf.19.1746086868392; Thu, 01 May 2025
 01:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-9-tabba@google.com>
 <2b1bf120-99b3-46cd-83bd-b021743540d0@redhat.com>
In-Reply-To: <2b1bf120-99b3-46cd-83bd-b021743540d0@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 1 May 2025 09:07:11 +0100
X-Gm-Features: ATxdqUFLmJfHkI366mwtWMl0YiqPlB-kJX_OyskRiHGx2Beoxdp5LbxHctZZjVM
Message-ID: <CA+EHjTy-csS3tNcgE81=QSeETZQxEVTENCYK71zbCQBZ313WxA@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 22:33, David Hildenbrand <david@redhat.com> wrote:
>
> On 30.04.25 18:56, Fuad Tabba wrote:
> > Add support for mmap() and fault() for guest_memfd backed memory
> > in the host for VMs that support in-place conversion between
> > shared and private. To that end, this patch adds the ability to
> > check whether the VM type supports in-place conversion, and only
> > allows mapping its memory if that's the case.
> >
> > This patch introduces the configuration option KVM_GMEM_SHARED_MEM,
> > which enables support for in-place shared memory.
> >
> > It also introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> > indicates that the host can create VMs that support shared memory.
> > Supporting shared memory implies that memory can be mapped when shared
> > with the host.
>
> I think you should clarify here that it's not about "supports in-place
> conversion" in the context of this series.
>
> It's about mapping shared pages only; initially, we'll introduce the
> option to only have shared memory in guest memfd, and later we'll
> introduce the option for in-place conversion.

That's right. I'll fix this.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

