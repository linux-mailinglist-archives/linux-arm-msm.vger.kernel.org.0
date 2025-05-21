Return-Path: <linux-arm-msm+bounces-58886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3057ABF498
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1B991BA5946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0A02673A9;
	Wed, 21 May 2025 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XbcSiM99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1580A221D9F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831476; cv=none; b=Tp7UnGi+qoj08XLrTOXc//X3p/uWjb2CIJD7tFSkatEHZVMYTaV/YBzdngscWesKaS2gIMHz4Bbp2dET1FxFGDqQqIEGGLj/SHN0CBftJwjUPp8bFSWV99WhIKaI/9MjLPgEmsYdIxl56T3Dqq8vg3qJGrmk0fv/nIoZtHN4XSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831476; c=relaxed/simple;
	bh=nZQEo25wsge/rVLKg6UdaB+Zx36Bg8YTJJe/s56dghs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfiO9TkdWLKX6XmCd3HiY6c39odfDuJKQ/ioPOuzblecBlcZZ86ASchSJBWk4NLryf0y2hIDVCmKbKLBEGuSnkBWrUAJTeYGTo5VrGGAkgvZDDs+J0Dkw4mU0J+zOOuVHB/b8XHiVZ1PuSdPNKtboZ46sW9uo6QBasN3mepfLiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XbcSiM99; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747831473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dfMtP0fNrxnFvwlqSIfNPzwYZOz1mEiM52H6ym5fSmQ=;
	b=XbcSiM99iX6g35N5ZpvT2rVzm8eQtwpJj7zpjBFHpdNSZMakf4G+bcb9XxH7EWi6Z2+nny
	SOVuTh7vF5odWZDLZDa2TBHab5MH1Xn473fXyS456Xa2TO9Li0BAXEKZklzrVW2rR+I4aA
	lYdUsbkXUBLd25MqizJRgJo9viQBkbI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-tXDOf_20M3-E-RJM-HMc-A-1; Wed, 21 May 2025 08:44:31 -0400
X-MC-Unique: tXDOf_20M3-E-RJM-HMc-A-1
X-Mimecast-MFC-AGG-ID: tXDOf_20M3-E-RJM-HMc-A_1747831470
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a370309e5cso2295484f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831470; x=1748436270;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dfMtP0fNrxnFvwlqSIfNPzwYZOz1mEiM52H6ym5fSmQ=;
        b=O61yUh8074ckQbT7nEpYapcAH4XatYON2Pwk/BEgYAxLFkVwwVpZNcYCYSksSnnMoN
         cifF5egLh0+2ypEBl//rHYRWdB053qD2f8AllbwcUNEitjxLXmxRJLHS20L68a66JQmj
         Ohb/O7q+kFylS7Kz53j7w0k8MXS8eirunaK5QHap1+pUvuS0TOGbcPc846vMHn89mfmg
         cYhmXV/Sgq2urO7Cr9CBtvVjf/L6z6ngdv3mVZBpxFunY4g5mDy2p/MOUwc1GSaxGnPi
         O+4XMOd3IjF7Tf0RhN9D13sRONWiuWb1MGhl1YmxcXa8EDD1Q307J5aY30YVKi3OBXCX
         b19Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNdctx90fHyu1HuUNmB06IUMGPot2raTKMrXGU7sDtL+hrnSw662UvfChp+7RKiwQMT+52cy5H3yv14wUT@vger.kernel.org
X-Gm-Message-State: AOJu0YwKEPDsuAb9RX7F5I2ALnq7SbqwkevKut7ypBSHCjcy/7H32KqT
	L5/7hsYkcj6hxGU1nTNhY7RWZX/v2RlguuRdu3W6YTqfnq5Epv1yq676WEdItNyo+pMh1KMAjvU
	54x0mmQ0KNZDjNwtfZU5be6BKJ2hWePRmV3vcq8C2nkOz+tTZoE0o3+fJo7+ioQuNhYM=
X-Gm-Gg: ASbGnct2OJwUrLHF7wIH8Yvp/Tc5gaWpXG+CknHhgRKv+VEsyvm0bGaeo01JiscX1oJ
	roduZcXDcq6lfr1LiOQzNe6PeNgeca4vEu7i597O/9klMPYWHZJFo8EZeeDYetUXGwmnfmQFWCU
	wblp7YHCZ0usUQgaVhosDE2BhPsGmxUyV3J/+WEwJncPjRHGsvirsPCFD/eH3ii2XzIxPu/42vN
	DZERzA7Z9a67O1PE+rliS8dWdkXmAHkRKb+x3xCT0ok9IcjjlvIdJNE2VfnpY18WquWpSoImeXZ
	/mSOL+FGukAbxMeqd58d9Za5Y43WYdaG2Wouf9+yA3tB6yQD25K8pV/8AqoRLWBogwu9CqnJVtV
	16XAdYpWjcIt3Vgvd15No0m03nzrz68kya5liyyo=
X-Received: by 2002:a05:6000:2210:b0:3a3:7ba5:a22e with SMTP id ffacd0b85a97d-3a37ba5a4fdmr5963436f8f.24.1747831470287;
        Wed, 21 May 2025 05:44:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH+J8TGtPNcZ4xBkyUwd91Cg2aqf9qA31MTdzbJPaUGEZx41mKY7JELEjXf41mYWwZMTeCYQ==
X-Received: by 2002:a05:6000:2210:b0:3a3:7ba5:a22e with SMTP id ffacd0b85a97d-3a37ba5a4fdmr5963370f8f.24.1747831469726;
        Wed, 21 May 2025 05:44:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a84csm19693528f8f.31.2025.05.21.05.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:44:29 -0700 (PDT)
Message-ID: <f6005b96-d408-450c-ad80-6241e35c6d26@redhat.com>
Date: Wed, 21 May 2025 14:44:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/17] KVM: arm64: Enable mapping guest_memfd in arm64
To: Fuad Tabba <tabba@google.com>
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
 quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
 quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com,
 james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
 maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com,
 roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
 rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250513163438.3942405-1-tabba@google.com>
 <20250513163438.3942405-15-tabba@google.com>
 <2084504e-2a11-404a-bbe8-930384106f53@redhat.com>
 <CA+EHjTyz4M4wGCTBzFwHLB_0LUJHq6J135f=DVOhGKQE4thrtQ@mail.gmail.com>
 <d5983511-6de3-42cb-9c2f-4a0377ea5e2d@redhat.com>
 <CA+EHjTxhirJDCR4hdTt4-FJ+vo9986PE-CGwikN8zN_1H1q5jQ@mail.gmail.com>
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
In-Reply-To: <CA+EHjTxhirJDCR4hdTt4-FJ+vo9986PE-CGwikN8zN_1H1q5jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 12:29, Fuad Tabba wrote:
> On Wed, 21 May 2025 at 11:26, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 21.05.25 12:12, Fuad Tabba wrote:
>>> Hi David,
>>>
>>> On Wed, 21 May 2025 at 09:05, David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 13.05.25 18:34, Fuad Tabba wrote:
>>>>> Enable mapping guest_memfd in arm64. For now, it applies to all
>>>>> VMs in arm64 that use guest_memfd. In the future, new VM types
>>>>> can restrict this via kvm_arch_gmem_supports_shared_mem().
>>>>>
>>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>>> ---
>>>>>     arch/arm64/include/asm/kvm_host.h | 10 ++++++++++
>>>>>     arch/arm64/kvm/Kconfig            |  1 +
>>>>>     2 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>>>> index 08ba91e6fb03..2514779f5131 100644
>>>>> --- a/arch/arm64/include/asm/kvm_host.h
>>>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>>>> @@ -1593,4 +1593,14 @@ static inline bool kvm_arch_has_irq_bypass(void)
>>>>>         return true;
>>>>>     }
>>>>>
>>>>> +static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
>>>>> +{
>>>>> +     return IS_ENABLED(CONFIG_KVM_GMEM);
>>>>> +}
>>>>> +
>>>>> +static inline bool kvm_arch_vm_supports_gmem_shared_mem(struct kvm *kvm)
>>>>> +{
>>>>> +     return IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM);
>>>>> +}
>>>>> +
>>>>>     #endif /* __ARM64_KVM_HOST_H__ */
>>>>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>>>>> index 096e45acadb2..8c1e1964b46a 100644
>>>>> --- a/arch/arm64/kvm/Kconfig
>>>>> +++ b/arch/arm64/kvm/Kconfig
>>>>> @@ -38,6 +38,7 @@ menuconfig KVM
>>>>>         select HAVE_KVM_VCPU_RUN_PID_CHANGE
>>>>>         select SCHED_INFO
>>>>>         select GUEST_PERF_EVENTS if PERF_EVENTS
>>>>> +     select KVM_GMEM_SHARED_MEM
>>>>>         help
>>>>>           Support hosting virtualized guest machines.
>>>>>
>>>>
>>>> Do we have to reject somewhere if we are given a guest_memfd that was
>>>> *not* created using the SHARED flag? Or will existing checks already
>>>> reject that?
>>>
>>> We don't reject, but I don't think we need to. A user can create a
>>> guest_memfd that's private in arm64, it would just be useless.
>>
>> But the arm64 fault routine would not be able to handle that properly, no?
> 
> Actually it would. The function user_mem_abort() doesn't care whether
> it's private or shared. It would fault it into the guest correctly
> regardless.


I think what I meant is that: if it's !shared (private only), shared 
accesses (IOW all access without CoCo) should be taken from the user 
space mapping.

But user_mem_abort() would blindly go to kvm_gmem_get_pfn() because 
"is_gmem = kvm_slot_has_gmem(memslot) = true".

In other words, arm64 would have to *ignore* guest_memfd that does not 
support shared?

That's why I was wondering whether we should just immediately refuse 
such guest_memfds.


-- 
Cheers,

David / dhildenb


