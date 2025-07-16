Return-Path: <linux-arm-msm+bounces-65229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD6B0755C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E63189732C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8314D1FECB0;
	Wed, 16 Jul 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lq65ZRuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31632D661A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752668066; cv=none; b=lBb8WPZgp4QqV8JWGTwsPLRaU0Ayu7XBSrsQxWOJRfF7Usn70r9rNMDlkcW0cdpWnp58KhylXnKzjpaugYIbJxqHeEO43g9e3BICEVbKMx5qBT1FVikHL+M1DjwQnkouNlCg5U+g0KSR838RaPTxlezip8qwIZ/iODR4KRHfQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752668066; c=relaxed/simple;
	bh=qGPmtd1Qoy4pQ6Kdez/g9w5V+5/wTUIKQ7POwBpGGns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukz5ktwvqpfe2mrF1Z5BirinrKnrX6hsQYQhmo5d7Yi8dEmFRET5LeFF11iiamW6oRa1+lkkW29+FMQtIXTLNL8br8ha+QeZPyxLqEX5yKroGuLor515wUrrUD8rsYMVb3Y4IqP4DNYzzWohOmSjdIKOxBweSHQ5a2if+XsPCNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lq65ZRuG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752668063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yd4yTq8R/nGJ65QibdqSFZbJIZ9dGmy3D8HOV0dE2II=;
	b=Lq65ZRuGujfBdokjryfhiANznulcKavzeikfuB1X11nXpY+vOtnzJ5/mJ2vvBMfNmJQm5d
	jB7BNtB8DWT7syl52pq8vujmwaMcyzzPSih/6m1OSzKhH459nB0EJvNByHdSb/nh5ZyohN
	9w/c4Fmh4h2eBMnMZUdBb4JcSZ068wc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-PadLibmDNIWWGOi-wOLucg-1; Wed, 16 Jul 2025 08:14:22 -0400
X-MC-Unique: PadLibmDNIWWGOi-wOLucg-1
X-Mimecast-MFC-AGG-ID: PadLibmDNIWWGOi-wOLucg_1752668061
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4561bc2f477so20390885e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752668061; x=1753272861;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yd4yTq8R/nGJ65QibdqSFZbJIZ9dGmy3D8HOV0dE2II=;
        b=FLk4YJ/p1i+wqCbVu8/5QPAEuzRsvY+cDCHDxKhpOQqIxe0oOKGyMgR0qp0ongX79d
         VW0VAHO+6t4R3fGzBznjKcDZso0CM2dsEx2hHIxcZ4GtIFFZh3+SVzWV5cAS0YrY2trW
         FJr32ugzw/0qpYPJKhQzIBHVt3EQ0g3On3RwVidvd4EtLvxXjpeJDsCeM5xQA10vruny
         zD62+mC2kgVxUMXBKK6y7KjrxGKxA92qDmySLWscCUG9MRWiviz3MQ8GnTAHoNDZyGVG
         pbwP6JWACF6XcU3mZaywtjbSgcndKOGOJvaSh60bS7mok3I9oOwU3Spn94JfPx8pBM/j
         UaMg==
X-Forwarded-Encrypted: i=1; AJvYcCUMH5rXF1Q0ZFVfBWGozE4CepUlBF4uCxHgB3m1F5xbzJzBuYYuZv8pfG+y/pZT2FnDFdKKMr3WHMmm4DSK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcbe56WqUShPZQZIgqpzrOnFsgmTYTT7sXlzf4jfhwn7SR3Wsq
	T6x53TqYA23hPlCUlUYn+p8k8fpVko22EVnaRW1w3YaNJYjn/QFSqTyAsL1O3FyD9GlsbR4QINo
	69JyfBJ7IcECfgld5xxz3W7vzPRGdAo8oPrAUrsrNHF9ag7xojSAS280eGM/FZ0UkJWA1+cwyCg
	tdEg==
X-Gm-Gg: ASbGncuV7ZiUfCvEVukmIND2TyTMGjEWWLFKGxPKtmTVezeZcGZW41Vdq3P7aYa4Jiz
	gpsKfNn7x03SQWIDzLzumW1Vv3j9EdTnEQspLLUocMwPY1qzosGynQZN1r+GUsra5QlGDZaDR6F
	yJFOAAv7vI66xFKKLrZRx8fXKS4RBMSn0BPEWVms7hYPt/VcfxyB1HXTUwPjY24OWVKCNvN8Sj+
	qPZXoYVF3xGCxBSnN5vp/TDbVZCfBAewwcXls/btGSrWSI7jcV5LSewwPKyJkRW165pxSpvL4TO
	v7Fo2441DUHRe7B0d4YHIiiq5dZwN4WQ9rzgeeEiJxD5WY8ad4kpHVo2+BQ6t1Y9r0fud7F4IG2
	jGwokzQrA6rCVUZeoD/CEV0Tz2ff+IVRsJCfvQe3aWvGwFhZh+lPiqWDfjX+aUj6sNeU=
X-Received: by 2002:a05:600c:4ecd:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-4562e373d83mr25111695e9.19.1752668061123;
        Wed, 16 Jul 2025 05:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/9v/1Z9o85qqtD5vBDhKUZbY4ItWYZoZp/IanQGcWm9alw0b+iBCYvggMXNMR7DKDBMdkEA==
X-Received: by 2002:a05:600c:4ecd:b0:456:fdd:6030 with SMTP id 5b1f17b1804b1-4562e373d83mr25111215e9.19.1752668060534;
        Wed, 16 Jul 2025 05:14:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:ed00:1769:dd7c:7208:eb33? (p200300d82f1ded001769dd7c7208eb33.dip0.t-ipconnect.de. [2003:d8:2f1d:ed00:1769:dd7c:7208:eb33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e8860cdsm19665765e9.20.2025.07.16.05.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 05:14:19 -0700 (PDT)
Message-ID: <f7a54cc4-1017-4e32-85b8-cf74237db935@redhat.com>
Date: Wed, 16 Jul 2025 14:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
 CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Xiaoyao Li <xiaoyao.li@intel.com>, Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
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
References: <20250715093350.2584932-1-tabba@google.com>
 <20250715093350.2584932-3-tabba@google.com>
 <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com>
 <CA+EHjTy5zUJt5n5N1tRyHUQN6-P6CPqyC7+6Zqhokx-3=mvx+A@mail.gmail.com>
 <418ddbbd-c25e-4047-9317-c05735e02807@intel.com>
 <778ca011-1b2f-4818-80c6-ac597809ec77@redhat.com>
 <6927a67b-cd2e-45f1-8e6b-019df7a7417e@intel.com>
 <CA+EHjTz7C4WgS2-Dw0gywHy+zguSNXKToukPiRfsdiY8+Eq6KA@mail.gmail.com>
 <47395660-79ad-4d22-87b0-c5bf891f708c@redhat.com>
 <fa1ccce7-40d3-45d2-9865-524f4b187963@intel.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <fa1ccce7-40d3-45d2-9865-524f4b187963@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.25 14:01, Xiaoyao Li wrote:
> On 7/16/2025 7:15 PM, David Hildenbrand wrote:
>> On 16.07.25 13:05, Fuad Tabba wrote:
>>> On Wed, 16 Jul 2025 at 12:02, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>>>>
>>>> On 7/16/2025 6:25 PM, David Hildenbrand wrote:
>>>>> On 16.07.25 10:31, Xiaoyao Li wrote:
>>>>>> On 7/16/2025 4:11 PM, Fuad Tabba wrote:
>>>>>>> On Wed, 16 Jul 2025 at 05:09, Xiaoyao Li<xiaoyao.li@intel.com> wrote:
>>>>>>>> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
>>>>>>>>> The original name was vague regarding its functionality. This
>>>>>>>>> Kconfig
>>>>>>>>> option specifically enables and gates the kvm_gmem_populate()
>>>>>>>>> function,
>>>>>>>>> which is responsible for populating a GPA range with guest data.
>>>>>>>> Well, I disagree.
>>>>>>>>
>>>>>>>> The config KVM_GENERIC_PRIVATE_MEM was introduced by commit
>>>>>>>> 89ea60c2c7b5
>>>>>>>> ("KVM: x86: Add support for "protected VMs" that can utilize private
>>>>>>>> memory"), which is a convenient config for vm types that requires
>>>>>>>> private memory support, e.g., SNP, TDX, and KVM_X86_SW_PROTECTED_VM.
>>>>>>>>
>>>>>>>> It was commit e4ee54479273 ("KVM: guest_memfd: let
>>>>>>>> kvm_gmem_populate()
>>>>>>>> operate only on private gfns") that started to use
>>>>>>>> CONFIG_KVM_GENERIC_PRIVATE_MEM gates kvm_gmem_populate()
>>>>>>>> function. But
>>>>>>>> CONFIG_KVM_GENERIC_PRIVATE_MEM is not for kvm_gmem_populate() only.
>>>>>>>>
>>>>>>>> If using CONFIG_KVM_GENERIC_PRIVATE_MEM to gate
>>>>>>>> kvm_gmem_populate() is
>>>>>>>> vague and confusing, we can introduce KVM_GENERIC_GMEM_POPULATE
>>>>>>>> to gate
>>>>>>>> kvm_gmem_populate() and select KVM_GENERIC_GMEM_POPULATE under
>>>>>>>> CONFIG_KVM_GENERIC_PRIVATE_MEM.
>>>>>>>>
>>>>>>>> Directly replace CONFIG_KVM_GENERIC_PRIVATE_MEM with
>>>>>>>> KVM_GENERIC_GMEM_POPULATE doesn't look correct to me.
>>>>>>> I'll quote David's reply to an earlier version of this patch [*]:
>>>>>>
>>>>>> It's not related to my concern.
>>>>>>
>>>>>> My point is that CONFIG_KVM_GENERIC_PRIVATE_MEM is used for selecting
>>>>>> the private memory support. Rename it to KVM_GENERIC_GMEM_POPULATE is
>>>>>> not correct.
>>>>>
>>>>> It protects a function that is called kvm_gmem_populate().
>>>>>
>>>>> Can we stop the nitpicking?
>>>>
>>>> I don't think it's nitpicking.
>>>>
>>>> Could you loot into why it was named as KVM_GENERIC_PRIVATE_MEM in the
>>>> first place, and why it was picked to protect kvm_gmem_populate()?
>>>
>>> That is, in part, the point of this patch. This flag protects
>>> kvm_gmem_populate(), and the name didn't reflect that. Now it does. It
>>> is the only thing it protects.
>>
>> I'll note that the kconfig makes it clear that it depends on
>> KVM_GENERIC_MEMORY_ATTRIBUTES -- having support for private memory.
>>
>> In any case, CONFIG_KVM_GENERIC_PRIVATE_MEM is a bad name: what on earth
>> is generic private memory.
> 
> "gmem" + "memory_attribute" is the generic private memory.
> 
> If KVM_GENERIC_PRIVATE_MEM is a bad name, we can drop it, but not rename
> it to CONFIG_KVM_GENERIC_GMEM_POPULATE.
> 
>> If CONFIG_KVM_GENERIC_GMEM_POPULATE is for some reason I don't
>> understand yet not the right name, can we have something that better
>> expresses that is is about KVM .. GMEM ... and POPULATE?
> 
> I'm not objecting the name of CONFIG_KVM_GENERIC_GMEM_POPULATE, but
> objecting the simple rename. Does something below look reasonable?
> > ---
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 2eeffcec5382..3f87dcaaae83 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -135,6 +135,7 @@ config KVM_INTEL_TDX
>           bool "Intel Trust Domain Extensions (TDX) support"
>           default y
>           depends on INTEL_TDX_HOST
> +       select KVM_GENERIC_GMEM_POPULATE
>           help
>             Provides support for launching Intel Trust Domain Extensions
> (TDX)
>             confidential VMs on Intel processors.
> @@ -158,6 +159,7 @@ config KVM_AMD_SEV
>           depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>           select ARCH_HAS_CC_PLATFORM
>           select KVM_GENERIC_PRIVATE_MEM
> +       select KVM_GENERIC_GMEM_POPULATE
>           select HAVE_KVM_ARCH_GMEM_PREPARE
>           select HAVE_KVM_ARCH_GMEM_INVALIDATE
>           help
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 755b09dcafce..359baaae5e9f 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2556,7 +2556,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
>    int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> int max_order);
>    #endif
> 
> -#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> +#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
>    /**
>     * kvm_gmem_populate() - Populate/prepare a GPA range with guest data
>     *
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 49df4e32bff7..9b37ca009a22 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -121,6 +121,10 @@ config KVM_GENERIC_PRIVATE_MEM
>           select KVM_GMEM
>           bool
> 
> +config KVM_GENERIC_GMEM_POPULATE
> +       bool
> +       depends on KVM_GMEM && KVM_GENERIC_MEMORY_ATTRIBUTES
> +
>    config HAVE_KVM_ARCH_GMEM_PREPARE
>           bool
>           depends on KVM_GMEM
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b2aa6bf24d3a..befea51bbc75 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -638,7 +638,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct
> kvm_memory_slot *slot,
>    }
>    EXPORT_SYMBOL_GPL(kvm_gmem_get_pfn);
> 
> -#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> +#ifdef CONFIG_KVM_GENERIC_GMEM_POPULATE
>    long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user
> *src, long npages,
>                          kvm_gmem_populate_cb post_populate, void *opaque)
>    {
> 
> 

$ git grep KVM_GENERIC_PRIVATE_MEM
arch/x86/kvm/Kconfig:   select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
arch/x86/kvm/Kconfig:   select KVM_GENERIC_PRIVATE_MEM if INTEL_TDX_HOST
arch/x86/kvm/Kconfig:   select KVM_GENERIC_PRIVATE_MEM
include/linux/kvm_host.h:#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
virt/kvm/Kconfig:config KVM_GENERIC_PRIVATE_MEM
virt/kvm/guest_memfd.c:#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM


Why should we leave KVM_GENERIC_PRIVATE_MEM around when there are no other users?

@fuad help me out, what am I missing?

-- 
Cheers,

David / dhildenb


