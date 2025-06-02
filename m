Return-Path: <linux-arm-msm+bounces-60054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D0ACAC65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 12:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E2167A7DFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2978319CCEC;
	Mon,  2 Jun 2025 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9T4rP+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873667E0FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859810; cv=none; b=nyCoPNjD+RpLrfAnaPYmKlmhkT4uQ3kwredw08sPDtVeVnRg2C6kZ5++r6CVd4Aft3427xuMQXUkqixq8vTp8aR4G0dmOnvs3K57BqkHMypE/l8lmLHCxKAgTwoDnxQ8A9F0D56H+8WpjzdYWc7vQb0rd0XJ29M2rgsKl+Ey1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859810; c=relaxed/simple;
	bh=cQftSo6JFO6+j8N8FdpxGndrGuCvRWuhdsjv0UXUufo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfmM2xB0nrYBHq/8aycF5ZxlNwpUxOe0t3xxcw3F9uhX13mQRp5lpR841acjU0csAGyPsWmr38V7BBrj6DK2nm68S+DjHaoJjHF6cz3am5EvsI54Man1v1Wa1ngDcsOa9zXMSPaneQhXJbtUr8pTDXKhhwvztL5PzAwiSpSNdfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9T4rP+g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748859807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TRnB0TFGGiSiHluZ1DCd0PCdt0mygo9yvv6XZmNPYM4=;
	b=R9T4rP+gVng1sgrXzRG5rvvD5CAsfpvVoOuT513AFAc4XYx0g+bkGwcddw5tlf8U4KmlID
	fpWHojrAXttgAgIXHy4HzqA9oosr6ORdwxJ+eAO/67yBSpT1tZEM9hzdtLhc2X6YQFs7Ib
	R2x/bpG1JOCVqFicwKtERhqLR6s6sXw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-5CUlPHJGMkyAE29RBTXJzA-1; Mon, 02 Jun 2025 06:23:26 -0400
X-MC-Unique: 5CUlPHJGMkyAE29RBTXJzA-1
X-Mimecast-MFC-AGG-ID: 5CUlPHJGMkyAE29RBTXJzA_1748859805
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4517abcba41so11470915e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 03:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859805; x=1749464605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TRnB0TFGGiSiHluZ1DCd0PCdt0mygo9yvv6XZmNPYM4=;
        b=AEKb8ljV2EUs/elYi64kAkX1E05aCuoIK4M3jvfk3RFuA8g2uXWqbHVq600nYSwuu3
         kRueFowWdSeXoxyduXosfj7hPqQobwsEtRJooKAD1LjRD7yvam6XZsHTiuL+RdruHk/m
         i2pOnQG3CXSuSrf00xSWpQVUg5Q20r+yg1pO7C5sKklJPoi3i2f+9F469Xt/Zq72EDKk
         drMTDeDBp6booDQ2JGkLKsKDL9J5qVBxfGFNYC1n6/CAhlyB30SM1h/r6He4Lg0CVKGn
         vIVFNnzL/sXL7OscYfHKuqpjix5EtyxlasiJ3/CI2JsopcY5AnINvbZQ2yzCZCzHHbrj
         Rt+g==
X-Forwarded-Encrypted: i=1; AJvYcCXMOyP3kbErHe8MP7sAn82oIfPcM+ulUdG+QjnPnjy124Nw/l4EyararkjkLsYxD+0bbjEgv5hoQ2ffoPlM@vger.kernel.org
X-Gm-Message-State: AOJu0Yznb0WKGsVBNyqVFggUok8tT4tlY9NpNwgsuvq0VEPyHWbtdTyg
	K1Wb6L8t+f/f64ASHeYF164YutkOGwKKnDPeHdpU+J/Amh5aY5nPpPX8/6eRh4FalZUhEn4+f0O
	onBsXlgNOdQ4wabbWr+av/CeG6R0Nm0DkM8PpAM9kA2CMsO6icCKVSHcmsmCW6bXRlnY=
X-Gm-Gg: ASbGnctyi8yCsTOFwx4hd+WschskMGd0aLeDh+ixzH8KFTcvWmFvG4+J/j+L4VPhpyq
	xcMniIMCE1kn/q0i3O/hztAkMvyiJ9E2vCQyhEP879t8AjqW/ACT/NKOwwy37acyyQ669f9Cs0S
	vV6tGd6OnGrhYm17QCVrwWTnPbCv0Mv++RWVyUeVQBc7BuSjyzhXByrl3SXEdGc5AoMijZ5FFXx
	If+1lAOGCsVmjZwfPF209IGyc5H/KJmjta2GPZXoYuZ01vmSZ7ob7RREUbh3voRQSTfj0jjWbX+
	PrPOVEuFm3g1LqDmncDJMPjysQq2BaTshIC/KMTQBYCoXC3J5ZwjA3JAfuhUCmh/Bcw/tSHof/J
	CpcusfDUuaXCyAFjWuvNblP/IUelqeB2hhxeMOvY=
X-Received: by 2002:a05:6000:40ce:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3a4f89c0035mr9125686f8f.26.1748859805098;
        Mon, 02 Jun 2025 03:23:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWqe9vZSOT94En+ZdiIz8qrnRpK8dQKbTBIJdHB9cG26KhHxaoo2xvk+o2yIrGNhMtbVWLOg==
X-Received: by 2002:a05:6000:40ce:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3a4f89c0035mr9125664f8f.26.1748859804623;
        Mon, 02 Jun 2025 03:23:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fdbasm14109024f8f.85.2025.06.02.03.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 03:23:24 -0700 (PDT)
Message-ID: <6d062b95-1bef-4933-9456-f610a74d6c19@redhat.com>
Date: Mon, 2 Jun 2025 12:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/16] KVM: Fix comment that refers to kvm uapi header
 path
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
 <20250527180245.1413463-8-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250527180245.1413463-8-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.05.25 20:02, Fuad Tabba wrote:
> The comment that refers to the path where the user-visible memslot flags
> are refers to an outdated path and has a typo. Make it refer to the
> correct path.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index ae70e4e19700..80371475818f 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -52,7 +52,7 @@
>   /*
>    * The bit 16 ~ bit 31 of kvm_userspace_memory_region::flags are internally
>    * used in kvm, other bits are visible for userspace which are defined in
> - * include/linux/kvm_h.
> + * include/uapi/linux/kvm.h.
>    */
>   #define KVM_MEMSLOT_INVALID	(1UL << 16)
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


