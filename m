Return-Path: <linux-arm-msm+bounces-46582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6139A232AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 18:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3899F3A59D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 17:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243F613B2A4;
	Thu, 30 Jan 2025 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kb48Vhuq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71319136337
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 17:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257416; cv=none; b=XwWs+ZZ3sE+3wmDFZGstelLOaHuVjUiGGF/nVPAjQxq6El6+OI99RqxfR80udEWZXqwNZgJEz+RuPuZRkxDD4nRTY596Wvw1jfF8usjEc5esBNLsvQOS17B38+1eJxF8k+7xZI8oDdcD2ZP/cwL/vqyNgVmSXxARPDXFqKa1rRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257416; c=relaxed/simple;
	bh=64ngRZMEzEqs4DnZIGCsEg5Q+urqKArfe+6jzm4viwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiQC0jn4wHs/52rmiIGb6QG9V1s6dEdMN8m8gx5cmJ3VDK4JpKGbg5XOvl6B/5Bg6a44+Adhw27hJTUaVcKvpCALCMVqq0bBwTFZGnoerfaHizilIFJunRn+sDl6Jz/6x8EVs9aMXdGBvfZfF5NqI86KfU5IjotNtRra+mycB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kb48Vhuq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738257412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7I17JIDXaCz2JzuRPmuH7UMSeK2Y9qHccuoT9T2xKBc=;
	b=Kb48VhuqSG7pLN+Mabp7xcL9IP8hymahz3b8cfyJt6gJdgNQvKLPlNzBIWPBtCYr/VKV1s
	ua+iSBanOijw437Xt8uo3Gh/4bY5tJ0lyJXUWD0DSYaA5y+wE0/80BRAsKivF7covXRFQy
	Ny0sHhamgGwWEBW60GA676M7yHsKPZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-v4njID6dNzqCEelJrStkew-1; Thu, 30 Jan 2025 12:16:49 -0500
X-MC-Unique: v4njID6dNzqCEelJrStkew-1
X-Mimecast-MFC-AGG-ID: v4njID6dNzqCEelJrStkew
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3862a49fbdaso426666f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 09:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257408; x=1738862208;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7I17JIDXaCz2JzuRPmuH7UMSeK2Y9qHccuoT9T2xKBc=;
        b=PzZGn7DRONMuDHnqJdy0FefhesSgmYcp9Fc7D5/6dF80gIo3Z8D/mPVzw7NmfDlVeM
         lH2bGU9atteHCrMcYTIsjYbhSxppBB1DMVhGypdkbd25aZGvkt5iV3TTyXZSWVbM5L0e
         mVZD/1/2sUV3FbIgXHDM0eSUSH9omxqrgLRcZoG+iB9D7FqeImntGggloiWSKkGaKTPw
         nUEQr3Whu0kMU8tqXu+1mTLsuLRoHlw6r58fago1Lj2cQApVqqJx9u0IiY/XfUx5hi+Y
         A1+uoUBuRv/DGFFes+eK8IfEKwJQNBJeCMLiWYmcQTvH/kzRGirMMi/9SDdMLxcSnSUF
         Z6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGjenjmIqpqlMy/HN83CxrznCn5sbSX8o/RSuuhwtK3TVHNenwn54X5dPsuKkoiNhEkFcmf9oXS/0/mGNu@vger.kernel.org
X-Gm-Message-State: AOJu0YyghJPnTDSovbttMnbrh57BN2rv6r7YlKrhUUk+eoThuQWyoZck
	tfhq9oL7oZz+z4oQGj0TB2GkTAI7hEW38tDk/NWyilUSEdDuOshPlZ4lkw53QVHlSV630ElSILn
	3jLFYx4SQJD7Opodld4qHkXyfwSJiWZ7Cuw7rCk4a3MTRdb7kb2uaAipauSLyI1M=
X-Gm-Gg: ASbGncsmn0RcqB7aOV+443d0D2AapZzicg+87yD5tIP/8KXbrCWApx2j7vytTYMbrHm
	KokPz3APDDNyTYWbNRAfy5AEUY9pBysX+EQ66PlpnGYgBb9seyESpq63NxowKn+kkjieorUVFPE
	W/48z68Orh3MFimcr5EEGHgCKjJ9qBMOznMLDe9icyhGn0B+hl76Yl06Y7DmbOgQqVzxqhNub8e
	5yx44LyqXeIfZs6GWkSlDozabaG2LTjdA0tsW7tnrCTydkyc7e6ehkyAu1nH1EcU8Tb6o5/5WkJ
	NNNLPOvCdHPzOt3ji1kq0Y1yr7m46WcC96GqvfT3cmdOqEMvWiozBICMmT8Lo7PAskHGRPMmY40
	P8K7K0uIQ2nYrYPypmdYXMw/QXOtLKVoj
X-Received: by 2002:a5d:44c6:0:b0:38a:615b:9ec0 with SMTP id ffacd0b85a97d-38c520ba752mr5537344f8f.54.1738257407972;
        Thu, 30 Jan 2025 09:16:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYw5/qlXKHyO1lZnIDDimnBb1xIpO0uKlfI98ghzRA32zLq8WeDKR9kGlGsWPK50fTQgP0Rg==
X-Received: by 2002:a5d:44c6:0:b0:38a:615b:9ec0 with SMTP id ffacd0b85a97d-38c520ba752mr5537286f8f.54.1738257407543;
        Thu, 30 Jan 2025 09:16:47 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf896sm2623894f8f.94.2025.01.30.09.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:16:46 -0800 (PST)
Message-ID: <0ca9f444-b63f-4259-9462-014e0d0f1a74@redhat.com>
Date: Thu, 30 Jan 2025 18:16:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/11] KVM: guest_memfd: Handle final folio_put()
 of guest_memfd pages
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
References: <20250129172320.950523-1-tabba@google.com>
 <20250129172320.950523-3-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250129172320.950523-3-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.01.25 18:23, Fuad Tabba wrote:
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
>   include/linux/page-flags.h | 7 +++++++
>   mm/debug.c                 | 1 +
>   mm/swap.c                  | 5 +++++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 6615f2f59144..bab3cac1f93b 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -942,6 +942,7 @@ enum pagetype {
>   	PGTY_slab	= 0xf5,
>   	PGTY_zsmalloc	= 0xf6,
>   	PGTY_unaccepted	= 0xf7,
> +	PGTY_guestmem	= 0xf8,
>   
>   	PGTY_mapcount_underflow = 0xff
>   };
> @@ -1091,6 +1092,12 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
>   FOLIO_TEST_FLAG_FALSE(hugetlb)
>   #endif
>   

Some short doc would be nice, to at least hint that this is related to 
guest_memfd, and that these are otherwise folios.


/*
  * guestmem folios are folios that are used to back VM memory as managed
  * guest_memfd. Once the last reference is put, instead of freeing these
  * folios back to the page allocator, they are returned to guest_memfd.
  *
  * For now, guestmem will only be set on these folios as long as they
  * cannot be mapped to user space ("private state"), with the plan of
  * always setting that type once typed folios can be mapped to user
  * space cleanly.
  */

> +#ifdef CONFIG_KVM_GMEM_MAPPABLE
> +FOLIO_TYPE_OPS(guestmem, guestmem)
> +#else
> +FOLIO_TEST_FLAG_FALSE(guestmem)
> +#endif
> +
>   PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
>   
>   /*
> diff --git a/mm/debug.c b/mm/debug.c
> index 95b6ab809c0e..db93be385ed9 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -56,6 +56,7 @@ static const char *page_type_names[] = {
>   	DEF_PAGETYPE_NAME(table),
>   	DEF_PAGETYPE_NAME(buddy),
>   	DEF_PAGETYPE_NAME(unaccepted),
> +	DEF_PAGETYPE_NAME(guestmem),
 >   };>
>   static const char *page_type_name(unsigned int page_type)
> diff --git a/mm/swap.c b/mm/swap.c
> index 8a66cd9cb9da..73d61c7f8edd 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -37,6 +37,7 @@
>   #include <linux/page_idle.h>
>   #include <linux/local_lock.h>
>   #include <linux/buffer_head.h>
> +#include <linux/kvm_host.h>
>   
>   #include "internal.h"
>   
> @@ -101,6 +102,10 @@ static void free_typed_folio(struct folio *folio)
>   		if (IS_ENABLED(CONFIG_HUGETLBFS))
>   			free_huge_folio(folio);
>   		return;
> +	case PGTY_guestmem:
> +		if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
> +			WARN_ONCE(1, "A placeholder that shouldn't trigger.");


Does it make sense to directly introduce the callback into guest_memfd 
and handle the WARN_ONCE() in there? Then, we don't have tot ouch this 
core code later again.

-- 
Cheers,

David / dhildenb


