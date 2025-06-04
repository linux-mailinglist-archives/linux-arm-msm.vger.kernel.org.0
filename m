Return-Path: <linux-arm-msm+bounces-60220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86476ACDDD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C5D916D0F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1A128ECCA;
	Wed,  4 Jun 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UkIULIAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFF28D8ED
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039936; cv=none; b=FGAOrrW06baNsSVBWUhQaPnjKjBOzrAYm5eySdLgS6HoMtO1jmWa9QhcSnQKp//9rxzf7wZtkwbo4bU2ToAVMFsbrEkTkTYvYJt7lrp0vzasNCO+8jbHB8XTq7RNfjmNlTkEECLSiySFfGoj9u1OObki+FmHcPm78X85ITtIeFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039936; c=relaxed/simple;
	bh=wb2Fa6a3pmtB9gswq7/W9grAgUtMIJXryMzyFGvvARQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIufA1srMGp1gLRAZt/82QsV9vPS9DqDJTQzYOKd8uFmGWiP2fYLJO2G2JW/Y45WnXxvjyuQl9vYgkIBHWLiByv8oNM8DcZ7Co8/cp6wTYsAowO7QF3+OQyasrD80r0E+t6EOcArnl6LHHQrPUPJSJOIz1EtauLsUCJZfWKVv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UkIULIAC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749039933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1B1QvOu9wVsHhSfQI2v1FVUutA6lUcLtahdo7216SXA=;
	b=UkIULIAC/11L0mKmfhH5D5tdYfclXv4veEw9rHqaISQOYqv7BNESwzKd7i7deDxYPyHKB/
	POd8JIocxpwUh5qGARruhsL4P0AJ5pbFFoaQ4yADKKKxCQj2Lvd6C6RMtsT0Ey6Y8pF3+Z
	0kh6IMMn0Kqb/OVV2Se6UrFwZpVHBUs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-BzyNsIJwN92iRMG3xINiiA-1; Wed, 04 Jun 2025 08:25:32 -0400
X-MC-Unique: BzyNsIJwN92iRMG3xINiiA-1
X-Mimecast-MFC-AGG-ID: BzyNsIJwN92iRMG3xINiiA_1749039931
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d9f96f61so41483855e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039931; x=1749644731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1B1QvOu9wVsHhSfQI2v1FVUutA6lUcLtahdo7216SXA=;
        b=k1vAaRREOLjR3PazUaGK6e4NRCPzDDzMJ80MGF+tlUDR7TX+AtDjmX/z5l9Ph7T2/g
         2yFTLX80BWJ090J43DSkV2FfPBaGjIYQ47LbKg+sl4Y+W6yk24O5ElFsly3kd87eZ+N6
         95KP6Z9rOdZ1EdpsRQeAvclqJYoyME9QvJGlvHkHMtrfPlINq2SDDpKKOhylYBlvKaPw
         jQHyS/r10EolkSyL/cIzfZJyMEkF5JE+h4qaQ9aNandZxF1MRa+/Dr+ennFfmEioQFD6
         nc0f12bhEa7rwnrp9lmoLeUcqwmHrFzyfuqoCugoVojqymWUWtQX/R7d6CKcwV9Oxc+U
         wZYA==
X-Forwarded-Encrypted: i=1; AJvYcCW7do3ALJ+0/8moYYL99JLwgpevpSljw6BmhE5jf9PTNLFkkJe93PVC5KS2b7KEQ6UJSt5JjMtKm2x1I7YZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDHgeWTrlAQczBThSc68s8S/Z3w8VdgG3VUyUrYvtjl68tflv
	rdeqbW6ad+xVtsPnmzDd/wXrNdgl32druUiESvQwU+PdfmBZei4y/cOTIQWhsebX6yTxJXUNIyc
	3jupolzcWukhZJH0HtJ7OkfUCGUFuyOysux5pDOjHXffa1i9XMkZHu178fdAwMpMJ8no=
X-Gm-Gg: ASbGncuI/SCKaqhaLiNHY/pmbX0B9CulNBSwJ4EFBpwA+NrZBPuuyDWZZlD3OJSCa5f
	vC+TDQj6xvESc0FEtk7eyDUI0kbM1e1KLe+WHw6Sg0eWxrYmT/djYiD0vIYFODseg5UpTkBKl1o
	JzOeJdC2yhHURkvG6nCquAbAk55nlhM29i3tAwYP0NLNl+NU2cqccuBwhx4aA4QMoL/LHKUaeSl
	y4PTQVHasJMSHE9gYHc4N0kyznqWwscEidbiwlKHjgijLB79hDI9MHC4KdrvF7tEJQqjlaUolqT
	L226WKDgIDsRqpoh0lQAV1wTHf4eObd02dGvpOYJUkEfmdZ9AbMCE4Xv+JGacDPpkB5v1825jte
	OCXHqxo5sBr/LYTpaCUaqHNlUHHX3KqdLZamlffqUR2scaRkl4w==
X-Received: by 2002:a05:6000:288c:b0:3a4:d0fe:428a with SMTP id ffacd0b85a97d-3a51d9691f8mr2254105f8f.28.1749039931132;
        Wed, 04 Jun 2025 05:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy6W0M+7y59cFHC0OKf5kJ87HWt9ynFPyCr8uIeDpo3qUt413fqvcmv4quVNCgyuVdeAEa9w==
X-Received: by 2002:a05:6000:288c:b0:3a4:d0fe:428a with SMTP id ffacd0b85a97d-3a51d9691f8mr2254067f8f.28.1749039930600;
        Wed, 04 Jun 2025 05:25:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b7b0sm21754128f8f.10.2025.06.04.05.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 05:25:30 -0700 (PDT)
Message-ID: <d6a86151-ab7d-4da7-8dde-a9ff84c80945@redhat.com>
Date: Wed, 4 Jun 2025 14:25:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/16] KVM: guest_memfd: Track shared memory support
 in memslot
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
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
 quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
 quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com,
 james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
 maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com,
 roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
 rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250527180245.1413463-1-tabba@google.com>
 <20250527180245.1413463-10-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250527180245.1413463-10-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.05.25 20:02, Fuad Tabba wrote:
> Track whether a guest_memfd-backed memslot supports shared memory within
> the memslot itself, using the flags field. The top half of memslot flags
> is reserved for internal use in KVM. Add a flag there to track shared
> memory support.
> 
> This saves the caller from having to check the guest_memfd-backed file
> for this support, a potentially more expensive operation due to the need
> to get/put the file.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h | 11 ++++++++++-
>   virt/kvm/guest_memfd.c   |  8 ++++++--
>   2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index ba83547e62b0..edb3795a64b9 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -54,7 +54,8 @@
>    * used in kvm, other bits are visible for userspace which are defined in
>    * include/uapi/linux/kvm.h.
>    */
> -#define KVM_MEMSLOT_INVALID	(1UL << 16)
> +#define KVM_MEMSLOT_INVALID		(1UL << 16)
> +#define KVM_MEMSLOT_SUPPORTS_SHARED	(1UL << 17)

Should there be a "GMEM" in there?

-- 
Cheers,

David / dhildenb


