Return-Path: <linux-arm-msm+bounces-53064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44DA79880
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 01:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9E718951A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 23:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5541F8670;
	Wed,  2 Apr 2025 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLL4VlnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488331F7575
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635037; cv=none; b=TNjLOEI5XwZx3eXB9kjYF5+pUMueEx++CBg1LKk8qYxRLmqHDYIEyQOLSY2jRTZBiiCd40FuuX0s67rsJSfPjsZOEqLr5onQMxIoHpIRwgAEnVE4N1fmRSZRAS1XJBG1U/wwLNSJneCU+FPt/yCnESoai+JmXYa2LyJdLwPn+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635037; c=relaxed/simple;
	bh=amNEdQMYx+Nqz9R2FL1KWyBPcJuIC9mwuCMFclyLmI8=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=g1dFcYTQjyX1D4GeC4DVh2oWHIOdpxSdtIU3YKCDLtG8Fi4/TbhWaZhQteJiLNq2eOfohYxjS0YbrOapqtmM5YPZ1nmXOj2HQlKiNo37yRQhmuIM7s0R/AU6cf8a9NjS2mfRe6oEu77mV4G3zyXTnL9clij3UODxqiwK46jeQXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLL4VlnC; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736c89461d1so417465b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 16:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743635035; x=1744239835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTGKhz8rmvop5XRTyKxJ8rGEiFfLArEoBlrrxr2E1xQ=;
        b=SLL4VlnCd9Ggcsg+ELxqJDqiKN2j5Dbu78IP0NuUCZX202kZGuMq78c8UZJf6q+7lE
         s0CYhaWQpdjl0+t04x6rYXC5L+KSmyPhXGi9+AB1Tm2ePLSvjDQJUfuEORN+aWZyFH87
         S7fTHojJXaOYOoNCt0Om2wQIH3+ffw+820rPH/5EIAS2oJ5/OBmMSNO2i+GKKfh7/lbz
         caTK30rvQoV3yxM3pDY9lNxXeQvjMJt8aDzu6XRT6haMocgxT41Apg9Owaaxu+wThLab
         flVgz+DKoBsmQvGCngLo38vVSPDsfjdyJUaR+PhzXPFnfqAUqCcoIU4atbASIFpku1hH
         lDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743635035; x=1744239835;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTGKhz8rmvop5XRTyKxJ8rGEiFfLArEoBlrrxr2E1xQ=;
        b=OKnrsdcYaTVmi2gbPjGHRkZN72z0Tr4ATvcB5hpTL3Kdc4o8GhPesJ9c2ImVRhRZT2
         u1fmeY1A+o/zJ/2b1uYfIu0Q+CaAPtHGc4rd4lkinBXu1pjBud4dmg6ojy+952zrj7up
         +/ECInNMHIW7oUnfpnsbNxrfuG026OJ5fZmAZSO5aU58XxgepJEXUZKEWYmfjvyDKSHI
         enZy8NZZ20ke3nJaKRE8NlKFffAcBsxhRmFN3zaJ13himYS8oe7SRRXPInxgI5Soy81+
         OdXOCIs7cYAVJ/7D/NCBQwMSzgZ04/uMIXKLYg91QVhTQ7Us2RS095F2BBTWD10fcP7i
         zLmA==
X-Forwarded-Encrypted: i=1; AJvYcCX5A1FEozdrSsN2jfSxioIv3a08yA92lqhZgcUAoby+1pvPIHEdfZVi2MyAdgoAaBkifwiKXYDZQS+7tbz1@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKrUVr3n5vgk71P+KLMM9Y8yAZYfxR1Ehqi7DExKJHR0lgY4u
	pj5l7Oak8JWNEDKJKvRE6khPKhzedU1oI6uzkdlUc6R3C6K85GT5l4RI7KVA3Le5Hh4OE6vpJg/
	qBWugtRaNogEpDQRzZVZjKg==
X-Google-Smtp-Source: AGHT+IE1r4rRbCGThMYXNJtfRCWTqW4iO0Aq7HgjWX2EnvsJvHx+lTepMEw90l9uu9sJTWAqTJV2AhsdFxGMQQEIAw==
X-Received: from pfnx2.prod.google.com ([2002:aa7:84c2:0:b0:736:451f:b9f4])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1397:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-73980387936mr27344709b3a.6.1743635035386;
 Wed, 02 Apr 2025 16:03:55 -0700 (PDT)
Date: Wed, 02 Apr 2025 16:03:53 -0700
In-Reply-To: <20250328153133.3504118-8-tabba@google.com> (message from Fuad
 Tabba on Fri, 28 Mar 2025 15:31:33 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzv7rmmahy.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v7 7/7] KVM: guest_memfd: Add a guest_memfd() flag to
 initialize it as shared
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
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
	pankaj.gupta@amd.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Not all use cases require guest_memfd() to be shared with the host when
> first created. Add a new flag, GUEST_MEMFD_FLAG_INIT_SHARED, which when
> set on KVM_CREATE_GUEST_MEMFD initializes the memory as shared with the
> host, and therefore mappable by it. Otherwise, memory is private until
> explicitly shared by the guest with the host.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  Documentation/virt/kvm/api.rst                 |  4 ++++
>  include/uapi/linux/kvm.h                       |  1 +
>  tools/testing/selftests/kvm/guest_memfd_test.c |  7 +++++--
>  virt/kvm/guest_memfd.c                         | 12 ++++++++++++
>  4 files changed, 22 insertions(+), 2 deletions(-)
>
> <snip>
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index eec9d5e09f09..32e149478b04 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1069,6 +1069,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  		goto err_gmem;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&
> +	    (flags & GUEST_MEMFD_FLAG_INIT_SHARED)) {
> +		err = kvm_gmem_offset_range_set_shared(file_inode(file), 0, size >> PAGE_SHIFT);

I think if GUEST_MEMFD_FLAG_INIT_SHARED is not set, we should call
kvm_gmem_offset_range_clear_shared(); so that there is always some
shareability defined for all offsets in a file. Otherwise, when reading
shareability, we'd have to check against GUEST_MEMFD_FLAG_INIT_SHARED
to find out what to initialize it to.

> +		if (err) {
> +			fput(file);
> +			goto err_gmem;
> +		}
> +	}
> +
>  	kvm_get_kvm(kvm);
>  	gmem->kvm = kvm;
>  	xa_init(&gmem->bindings);
> @@ -1090,6 +1099,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	u64 flags = args->flags;
>  	u64 valid_flags = 0;
>  
> +	if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
> +		valid_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +
>  	if (flags & ~valid_flags)
>  		return -EINVAL;

