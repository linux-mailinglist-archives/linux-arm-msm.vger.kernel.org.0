Return-Path: <linux-arm-msm+bounces-33861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC8998717
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 351FB282F09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965AB1C9EBA;
	Thu, 10 Oct 2024 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkLtGfLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78391C9EA6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565477; cv=none; b=Eg5XHeHotP2JEvsqv4Pd0EzexTJg2qLufWOQJWYmIvCWHUwOjyPbiLDSKioQp+l6BC6ryINuxNzOXaLVRgUw4m+9nMxxL6YWeJAw/Q2NGHvRgtJNPrgxqZIRfc9n1Pp20bW2TmLAEwWQon3tJQ9TL7zSEsLYwdhnHlEd3shhw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565477; c=relaxed/simple;
	bh=pf/Zzn68NMI/2QRu4HEmgc/wf5KLDfWtBLBltAF0X5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFlkcgsP9ISyTdqigdy4XKqbAH1hmgtf8rGhDkdFAKtcGogaZNax59Snn6TwHJFNCLa2ID96TxBfZ0DYldZ64w9BnjTKlw6v8Ro0mSmxs36l0ghPQWyNnXgV+hFdupM6fpvCUE6NI4t7nLl6g8h8RH/jsukcgnD4gTd9quYJT0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkLtGfLV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728565474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YgNKqmVF4jcBWTvWxpQl8M7npUyGix1i4lIqegvFbp8=;
	b=fkLtGfLV18pWHY1YeCcgpX9cKdbJV4pU5QnPJryPjfbVHRHc6VPO/oYvOK2IHcy9PkOu5S
	jgMO3GopcSTza7p7SxzRpE23PSeYz8+oVMkwbpJJMkHaTtyHF5gh3+kpWUt1edkvu+4RSA
	GXBV/Kr+gA1BUNHbmM7J2zFCv/gHiJY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-taFhYh9UM6SqvOVkk9wj_g-1; Thu, 10 Oct 2024 09:04:24 -0400
X-MC-Unique: taFhYh9UM6SqvOVkk9wj_g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a996c29edaaso66012766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565463; x=1729170263;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgNKqmVF4jcBWTvWxpQl8M7npUyGix1i4lIqegvFbp8=;
        b=na0vPaTbxrVA4iQYyQ6WHLFtaD+Ei+xQPtgZ35pcXflnjMGCoUwtUayIS8c12GcxFv
         23u8vomTPWf296egFsWHaBcN91kE0gIQwy0r2OBe4fmi5jq5+1pSD0J84fdgbGh8iH4m
         h3Nr0ZFw66qRjMP90AulOBxwVd0vF7fd18Ik2AQrfTaAaxHCFeENRmVWeJ1+ZLY79zIj
         ZaI5g2IK8PsZa4fT/amv+i6whm4sS8sF3iF35zpKtZyXaM4C37g/klsKshMN4jo7zZXW
         UGcRDqhigMQMKaAXazhJIwQFnDntuJ3Jm+o4ACxBgKkpm+Nmid7ky1PdVHnxlUDXsmKP
         v8tg==
X-Forwarded-Encrypted: i=1; AJvYcCWAOL0dg5LFtEMIjsFCe87mAcOBpTb0k3nED7/Nmc7ON/XnVacQzkKqWJJH1JMBxFA2V0ukPgimIrAWiRQH@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbaNgv/wpTVBQ6Z61vUkIalonCRG9s/g0lmq9PkKRTSX/ob/m
	f7Uy2Nu27karPeULXgMiLPIdoFV9IrfdbDwc6knpN+TGk+tw+UWIAkQcHnFSS+/Piz6Zx3Z4mIJ
	kYtDjNT/cf/4ezN3MMcGO8PloaLF5tOfHwRpfZcNKdWqGvMvnzeQBq8YCUvCVFOw=
X-Received: by 2002:a17:907:e89:b0:a99:3f4e:6de8 with SMTP id a640c23a62f3a-a998d3832e7mr553907366b.64.1728565462580;
        Thu, 10 Oct 2024 06:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMD1tBOQvmwj6n6vN+SMosHlfw+ZrWKqK36twaCfYHtFB9zxuN7j1h3AJS92NyQRDi8e/Ghw==
X-Received: by 2002:a17:907:e89:b0:a99:3f4e:6de8 with SMTP id a640c23a62f3a-a998d3832e7mr553903666b.64.1728565462083;
        Thu, 10 Oct 2024 06:04:22 -0700 (PDT)
Received: from [192.168.10.81] ([151.81.124.37])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a80f29e5sm85470866b.204.2024.10.10.06.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 06:04:21 -0700 (PDT)
Message-ID: <9fd97046-b7b1-49d6-8fc5-2104814152d6@redhat.com>
Date: Thu, 10 Oct 2024 15:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/5] mm: Introduce guest_memfd library
To: Elliot Berman <quic_eberman@quicinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, David Hildenbrand <david@redhat.com>,
 Patrick Roy <roypat@amazon.co.uk>, qperret@google.com,
 Ackerley Tng <ackerleytng@google.com>, Mike Rapoport <rppt@kernel.org>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20240829-guest-memfd-lib-v2-0-b9afc1ff3656@quicinc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240829-guest-memfd-lib-v2-0-b9afc1ff3656@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 00:24, Elliot Berman wrote:
> In preparation for adding more features to KVM's guest_memfd, refactor
> and introduce a library which abstracts some of the core-mm decisions
> about managing folios associated with the file. The goal of the refactor
> serves two purposes:
> 
> 1. Provide an easier way to reason about memory in guest_memfd. With KVM
> supporting multiple confidentiality models (TDX, SEV-SNP, pKVM, ARM
> CCA), and coming support for allowing kernel and userspace to access
> this memory, it seems necessary to create a stronger abstraction between
> core-mm concerns and hypervisor concerns.
> 
> 2. Provide a common implementation for other hypervisors (Gunyah) to use.
> 
> To create a guest_memfd, the owner provides operations to attempt to
> unmap the folio and check whether a folio is accessible to the host. The
> owner can call guest_memfd_make_inaccessible() to ensure Linux doesn't
> have the folio mapped.
> 
> The series first introduces a guest_memfd library based on the current
> KVM (next) implementation, then adds few features needed for Gunyah and
> arm64 pKVM. The Gunyah usage of the series will be posted separately
> shortly after sending this series. I'll work with Fuad on using the
> guest_memfd library for arm64 pKVM based on the feedback received.
> 
> There are a few TODOs still pending.
> - The KVM patch isn't tested. I don't have access a SEV-SNP setup to be
>    able to test.
> - I've not yet investigated deeply whether having the guest_memfd
>    library helps live migration. I'd appreciate any input on that part.
> - We should consider consolidating the adjust_direct_map() in
>    arch/x86/virt/svm/sev.c so guest_memfd can take care of it.
> - There's a race possibility where the folio ref count is incremented
>    and about to also increment the safe counter, but waiting for the
>    folio lock to be released. The owner of folio_lock will see mismatched
>    counter values and not be able to convert to (in)accessible, even
>    though it should be okay to do so.
>   
> I'd appreciate any feedback, especially on the direction I'm taking for
> tracking the (in)accessible state.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> 
> Changes in v2:
> - Significantly reworked to introduce "accessible" and "safe" reference
>    counters

Was there any discussion on this change?  If not, can you explain it a 
bit more since it's the biggest change compared to the KVM design?  I 
suppose the reference counting is used in relation to mmap, but it would 
be nice to have a few more words on how the counts are used and an 
explanation of when (especially) the accessible atomic_t can take any 
value other than 0/1.

As an aside, allocating 8 bytes of per-folio private memory (and 
dereferencing the pointer, too) is a bit of a waste considering that the 
private pointer itself is 64 bits on all platforms of interest.

Paolo

> - Link to v1:
>    https://lore.kernel.org/r/20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com
> 
> ---
> Elliot Berman (5):
>        mm: Introduce guest_memfd
>        mm: guest_memfd: Allow folios to be accessible to host
>        kvm: Convert to use guest_memfd library
>        mm: guest_memfd: Add ability for userspace to mmap pages
>        mm: guest_memfd: Add option to remove inaccessible memory from direct map
> 
>   arch/x86/kvm/svm/sev.c      |   3 +-
>   include/linux/guest_memfd.h |  49 ++++
>   mm/Kconfig                  |   3 +
>   mm/Makefile                 |   1 +
>   mm/guest_memfd.c            | 667 ++++++++++++++++++++++++++++++++++++++++++++

I think I'd rather have this in virt/lib.

Paolo


