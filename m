Return-Path: <linux-arm-msm+bounces-48667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A866CA3D86E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621233AA530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33FD1CAA7D;
	Thu, 20 Feb 2025 11:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJ+z0Yf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28E1F4E54
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050359; cv=none; b=Fbw0zQFlG0HBQdooo0gxkdffyYL4LqmgkTV8uY21n9RfXtEE35IzdIfXaiKuaDk9fSq00jGEO2vZUUooOQe8REIPA0R9UIwbX/l1GfCmEaUXhCEDAneKRjn13oQ/c5qGfLYDcwIvVYNY/aHcQ+c0UsOvNWExwdk1oRpcyvVXRqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050359; c=relaxed/simple;
	bh=WFE3m7bVjEMZO+592w9QN14Kw5JncGxe8bZVw9LpplE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5Lchso5Mpn4dgL01EGmX1qoHMW9vl+Rw55Zfh51+7HE6NCGpubfo/hV/UZCoX/s3bkhOJdBW+FU0zjHv9mDgBStL3ermYiSD1HqGU5vIZI8cnujLk/5tIdRdg8VaF60hhrU5c8EPRvKGg1g3VPMafEhcG8KP9PFtl1bmKl0oKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJ+z0Yf9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740050357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2aor0EBnqluVKppAqBtcRL5uzbizgHelZlzJfAf2Adg=;
	b=bJ+z0Yf9vzMypBdQ1Q99NNhPUd/uNOvtOsuDJVJARpooleTtf0O6Rp8q17RS+NtyTBEyNP
	kn6Yb0S/Nq//VEB99bJ525JnHbIc8J+io+l9uH3sNVVxuIGxuE3G9+QQkAUbfHEWw6l+IM
	HV6CnsAuxWeYibs7KsxWa6qYbum4bA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-5RWutgMeNtmaXTOxNQqScQ-1; Thu, 20 Feb 2025 06:19:13 -0500
X-MC-Unique: 5RWutgMeNtmaXTOxNQqScQ-1
X-Mimecast-MFC-AGG-ID: 5RWutgMeNtmaXTOxNQqScQ_1740050353
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43988b9ecfbso4082525e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740050353; x=1740655153;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2aor0EBnqluVKppAqBtcRL5uzbizgHelZlzJfAf2Adg=;
        b=hygCKiXS/TJqf0DKcZDM1npCuZt+Sx4S1xVy8rLLxApQm+DCzMmKx2pxDKzLYR87Vp
         GYk/Tr3/F+80LUyNPB4hLYU6VGUfI6L44aVmN2caWMfLb5fZ/jk+VnadL9DJ0zi0buQg
         /c0vFzpVxZ0aTQrhW7DSrUbjjnXnj/5LJvAutWq6xDo67O73LVEFJPG6vXXv3xaJwqAV
         i7btX7tVxh/JrP48VWLy2wwUcJYfW+qxt8ysDQRPnh1u0i1DQBnxX+/X/v9F2xNYUIJA
         VUz+kDMU1IUsEVeNUdonuFs5kZvhyteuFw/bhvrrPEVYdRTshSTFcfLcZrCv/jqjZ3jb
         CHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+qDgg0p806dhAhKCHtXfqrEpeTaYkW5jnMebPxalt8zRC0l05WPceCFyZAK52lwxNBVncksY+k5A689Yt@vger.kernel.org
X-Gm-Message-State: AOJu0YzM9wJnBq0s/wwIpgGage5Ejyo03xcPU8FzXF4OwcrQ3Ea9DJ9d
	bDXhoCUX93QkgpKqNbufjHpYfM4AQgfjWAmuQJj7kS1JA0/wWqJKMTxJQWwtZ3XX7sWKlaaADNe
	iU4JiRyaU/8PsaKavG3JYnI3GtRb2XVYpucXE8O5gl9DUaM/tUjom6gArid+As0I=
X-Gm-Gg: ASbGncv11SSRjMjIypBij+IIrC9dsHJQNkcw0TGoA99GkwJr93l1XZaoMXQe3fPcXn+
	jToIbEh9mqgILhICClzuAv0b3hSY4MECN7WWP1ANlVrWVYLOzhEqMyZrsOADHZGnJULERtxxmHr
	UwHf+DrgKsxvuhG31726TgsoCIEYD8bZ5vghaCRR+sMP503/V75Tkco4OjrWmY2r9LQbFTcwppP
	v60oAVPuM622Hbkxvs6cGlpx4Q9w4KW7/991ZguN2o/LixDa4JkjZDDVbhaO+ixqKh3vy6rbF0Y
	Gt9YXFWD+63o4ddjLZujPVAwBRcL/j8Kj366Md9olSslwRq2VbJvAFMaaVMQf1ZEHMI4zSxVHPI
	dksBOy23C2Rh9R3r46djhMiySQfXo3A==
X-Received: by 2002:a05:600c:1c18:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43999d923a9mr74045505e9.7.1740050352741;
        Thu, 20 Feb 2025 03:19:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZH7jy5ED4fGC7r1rbOUN68//pY8c0RBtuzv2ZXE6ET8pbTTA/RFZdGlRz5j3y7XVGzWYrVg==
X-Received: by 2002:a05:600c:1c18:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43999d923a9mr74045075e9.7.1740050352355;
        Thu, 20 Feb 2025 03:19:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:2000:e44c:bc46:d8d3:be5? (p200300cbc7062000e44cbc46d8d30be5.dip0.t-ipconnect.de. [2003:cb:c706:2000:e44c:bc46:d8d3:be5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b44b2sm20103448f8f.20.2025.02.20.03.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 03:19:11 -0800 (PST)
Message-ID: <54d1c436-0041-4e7b-a106-ab24a6643a56@redhat.com>
Date: Thu, 20 Feb 2025 12:19:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
 vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
 mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-3-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250211121128.703390-3-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.02.25 13:11, Fuad Tabba wrote:
> Before transitioning a guest_memfd folio to unshared, thereby
> disallowing access by the host and allowing the hypervisor to
> transition its view of the guest page as private, we need to be
> sure that the host doesn't have any references to the folio.
> 
> This patch introduces a new type for guest_memfd folios, which
> isn't activated in this series but is here as a placeholder and
> to facilitate the code in the next patch. This will be used in
> the future to register a callback that informs the guest_memfd
> subsystem when the last reference is dropped, therefore knowing
> that the host doesn't have any remaining references.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h   |  9 +++++++++
>   include/linux/page-flags.h | 17 +++++++++++++++++
>   mm/debug.c                 |  1 +
>   mm/swap.c                  |  9 +++++++++
>   virt/kvm/guest_memfd.c     |  7 +++++++
>   5 files changed, 43 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f34f4cfaa513..8b5f28f6efff 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2571,4 +2571,13 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>   				    struct kvm_pre_fault_memory *range);
>   #endif
>   
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +void kvm_gmem_handle_folio_put(struct folio *folio);
> +#else
> +static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> +{
> +	WARN_ON_ONCE(1);
> +}
> +#endif
> +
>   #endif
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 6dc2494bd002..734afda268ab 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -933,6 +933,17 @@ enum pagetype {
>   	PGTY_slab	= 0xf5,
>   	PGTY_zsmalloc	= 0xf6,
>   	PGTY_unaccepted	= 0xf7,
> +	/*
> +	 * guestmem folios are used to back VM memory as managed by guest_memfd.
> +	 * Once the last reference is put, instead of freeing these folios back
> +	 * to the page allocator, they are returned to guest_memfd.
> +	 *
> +	 * For now, guestmem will only be set on these folios as long as they
> +	 * cannot be mapped to user space ("private state"), with the plan of
> +	 * always setting that type once typed folios can be mapped to user
> +	 * space cleanly.
> +	 */

I would move that comment above the CONFIG_KVM_GMEM_SHARED_MEM below. 
Similar to how we do it for (some of) the others.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


