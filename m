Return-Path: <linux-arm-msm+bounces-45916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8478A1A0AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D4DE3AA75D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD7320D4F6;
	Thu, 23 Jan 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BpmwgGb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C820DD68
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623664; cv=none; b=nu6P3f0FWRSbqdscIIKPY9GGjR2g3R5lmJ3aaDPEarPvVfddHbTKNK8Y01EisP0N0Sc/LSiDNW1Pjzjhj5/a/DUWAWmEGR8IGY5LWkADyVUl8I4Bacbqb6Lri12yMCuOP2QdoDzB+OJpeMeCwNzS8TYMiMl/EAZ/7yDqKQy7j3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623664; c=relaxed/simple;
	bh=OjxopuLBC1JhlJ2TBUKSIVrw49Eduovl2/1haniNY1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NW3KFxPXHZ/xj5fV7+0Ue79YLcvX+MBUdi6sIUmVkTN+9LBfbFV1TL1G3pzH3X8AC7ED2my4woERvdkXGxJ4h9WtNjwBqESGJQtX4bkZ+/hGZquIKr69sGuvzesCnaIyk8G5NRsFKsZLhz7EyDk5OofW8kpXBgfCx3+4v+IN1vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BpmwgGb0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737623661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jp3Ga9waMKYoRgGi+7f0TcHzIDl8ebDU5AjXutL7XG4=;
	b=BpmwgGb075mMy6PnSqi7NDalv6BLBD/EYerArOfYqh2HcxNSuPhE8xudLFPlSsa/rnipyG
	ylDER8m+Afo99L5d/sfGA1rXxyZ3c1FMNPIzuUK1LUUhC4nivewo67k5WWuRmNiA/YwB7l
	TUTs+NPubP8ynevs85VHH+/bG6qiHVA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-aQ3XHnwMPyymlG478w5-rg-1; Thu, 23 Jan 2025 04:14:19 -0500
X-MC-Unique: aQ3XHnwMPyymlG478w5-rg-1
X-Mimecast-MFC-AGG-ID: aQ3XHnwMPyymlG478w5-rg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38bf4913669so292119f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 01:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623658; x=1738228458;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jp3Ga9waMKYoRgGi+7f0TcHzIDl8ebDU5AjXutL7XG4=;
        b=l95ws5oTX9iASrz58/qthjNAM8SXPrOUsYz5zB/KsnSuFV07OPQq80DxahBtVuoNH0
         Jaf4aJh8I5Bkj399nKaI/ryWGyalsWAZf3tr1kyK+QNOCrgi+d25dfiq/MY1ahdMdV0j
         e6moRTRB4HaD8vUHs7wfeS913yCBfYh6cwNXczayrZTy5xlFUZzq5AFUS9mbhRv7fpkq
         kj29M9AE/u7FEYIgrQ8idcWaag4Aossy4t9nhDtoBTJxIl2WJix1G8qaZw9UsXMdAu7t
         NkX8G99TLP11wEH4hZJZAhmU03nT1iinv9edsJXYOGDrp5TGLYq1JAM0kGCizM6EtyFU
         B1QA==
X-Forwarded-Encrypted: i=1; AJvYcCXZzjlHGzQwsfjqJ+2UqrK9RD5PGXAAwut/p5/znt4DQA4dOIwyjvbESLeYuyU/5us+PyFqdYAcGvZlqHm0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47W3rjTG4jBI0slPkL4gD7fTY9IrYKRpn4qWvX9aZhO51645N
	hWj6RyNfgCoPOGrCFDM4nCZVhhN6O3ua5dkJOiGqlWNUYFxp/2+3D5UenHGQs0E/I73EzhgotZV
	IM7mQg4oA7azsF1jAz/+9FcLeP4kE0Pht4VrrkyhQtiHWuyyMvEg4cBt9SqpY4q4=
X-Gm-Gg: ASbGncuhpaSZLwiXUei0+5dF/N+8uBpyhBeeJ+ULyrfyFsdsd58ajx5T2QPwvNZdceB
	jRR9S0zijuUUI1ybBJU6YhQa9/qMssEzSnLKhnp7NxWR8Z4sJn+G1OEghwMYlNP43Md5pdqG3MD
	M1E52OtV/Lhejxnt2d5EW3KGNfxlRafj8ubGlyH5lnv3sxngb/0rqNeIDNIXb/BBOnh20mEdVE3
	Kcrcf/TI1yXp92+NYmDcV5TReRrHXgg1SkoQmEsWD1VHaWQ0UGdbRz7n/Wq/C0Caqb1pJn+Aekh
	8xf38IqQpD162g6iOGi4nZqyovVJAcUDyTjGooTqMK+bxIwNI8ma3NklhqDiZ99UG+LeRywsW8b
	Q68eLBuop2PUlIKLCbgh23w==
X-Received: by 2002:adf:f048:0:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-38bf5675819mr16594035f8f.30.1737623658299;
        Thu, 23 Jan 2025 01:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbyImGwkPlTqVoDEzKZOlXFsJ/Dj52e4FXhS+5qjKmrJSdnt6dhF5uFqF1+0+mZdRS1k5BlQ==
X-Received: by 2002:adf:f048:0:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-38bf5675819mr16593995f8f.30.1737623657871;
        Thu, 23 Jan 2025 01:14:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d? (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de. [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm18354607f8f.26.2025.01.23.01.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 01:14:16 -0800 (PST)
Message-ID: <1cd43e4c-e079-4b12-840a-f455f99f8b1b@redhat.com>
Date: Thu, 23 Jan 2025 10:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/9] KVM: Mapping of guest_memfd at the host and a
 software protected VM type
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
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
References: <20250122152738.1173160-1-tabba@google.com>
 <c15c84f2-bf19-4a62-91b8-03eefd0c1c89@redhat.com>
 <03bbcd00-bd5e-47de-8b20-31636e361f52@redhat.com>
 <CA+EHjTyGgs_Sp0b6OqeS7oVskhVG+S1cHhVRb5Z6mPAwGwmqFA@mail.gmail.com>
 <f801219f-96e1-4b52-85aa-f5a331e06183@redhat.com>
 <CA+EHjTwhKHcywxtg-ODioOcA79hBjwvx0fHKW2VMxXVpA1LnDw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTwhKHcywxtg-ODioOcA79hBjwvx0fHKW2VMxXVpA1LnDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.01.25 10:09, Fuad Tabba wrote:
> On Wed, 22 Jan 2025 at 21:42, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 22.01.25 18:16, Fuad Tabba wrote:
>>> Hi David,
>>>
>>> On Wed, 22 Jan 2025 at 15:41, David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 22.01.25 16:35, David Hildenbrand wrote:
>>>>> On 22.01.25 16:27, Fuad Tabba wrote:
>>>>>> The purpose of this series is to serve as a potential base for
>>>>>> restricted mmap() support for guest_memfd [1]. It would allow
>>>>>> experimentation with what that support would be like, in the safe
>>>>>> environment of a new VM type used for testing.
>>>>>>
>>>>>> This series adds a new VM type for arm64,
>>>>>> KVM_VM_TYPE_ARM_SW_PROTECTED, analogous to the x86
>>>>>> KVM_X86_SW_PROTECTED_VM. This type is to serve as a development
>>>>>> and testing vehicle for Confidential (CoCo) VMs.
>>>>>>
>>>>>> Similar to the x86 type, this is currently only for development
>>>>>> and testing. It's not meant to be used for "real" VMs, and
>>>>>> especially not in production. The behavior and effective ABI for
>>>>>> software-protected VMs is unstable.
>>>>>>
>>>>>> This series enables mmap() support for guest_memfd specifically
>>>>>> for the new software-protected VM type, only when explicitly
>>>>>> enabled in the config.
>>>>>
>>>>> Hi!
>>>>>
>>>>> IIUC, in this series, there is no "private" vs "shared" distinction,
>>>>> right? So all pages are mappable, and "conversion" does not exist?
>>>
>>> You're right. This is a simplified version of my series that allows
>>> mmaping of the new KVM_VM_TYPE_ARM_SW_PROTECTED vms to use for
>>> experimentation.
>>>
>>> Cheers,
>>> /fuad
>>>
>>>>
>>>> Ah, I spot:
>>>>
>>>> +#define kvm_arch_private_mem_inplace(kvm)              \
>>>> +       (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&        \
>>>> +        ((kvm)->arch.vm_type & KVM_VM_TYPE_ARM_SW_PROTECTED))
>>>>
>>>> Which makes me wonder, why don't we need the same way of making sure all
>>>> references/mappings are gone (+ new page type) when doing the shared ->
>>>> private conversion? Or is this somewhere in here where I didn't spot it yet?
>>>
>>> This is new to this series. The idea, based on a request from Patrick
>>> Roy, was to have a VM in arm64 we could use to experiment with. Since
>>> it allows the unconditional mmaping, it's only useful for experiments
>>> or for non-confidential VMs that want to use guest_memfd.
>>>
>>> This series isn't meant to replace the other one, more to supplement
>>> it and facilitate experimentation while that's going.
>>
>> Heh, so "kvm_arch_private_mem_inplace" in this series means "no
>> conversion at all" ? :)
> 
> Yes, just for experimenting with the protected software VM.

Got it, thanks!

-- 
Cheers,

David / dhildenb


