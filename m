Return-Path: <linux-arm-msm+bounces-57505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BEAB1FF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26082A20F77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58EE26280F;
	Fri,  9 May 2025 22:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DoXRfNTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C42747B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829768; cv=none; b=nvg8VNnQk+P1od5gWu9WISifZzAoxrnBx4Q4EsLvJgo5gYow6d38KqSPTcTtRmUXCfw95wRUjcR1q3bj/i2kpAheWqDeIsf/L6mWQUloRdbKnWocQxQszzgXlRTaHN3ZSkYdM+Uw1ZaOcW5a9XaoLDmeYFB07Hip7KhODzm1UlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829768; c=relaxed/simple;
	bh=rHdd90kYNgg5FMLwYars4YMGo9ZOr+VchpMEhZCLSVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7VQqzme2D3r7V8f26V86v41qmKAQmyBzAgjQVW6CL/zeFwc271z9dRxNIBp9hlFbuuaFXUESmVZDKKOsThEHx0TSqXPS17dtn3amqwRziG8WiQIFA0WuCqbtJP8OcTO3pQQH6kcBeVUd6sfzJ9xpdiT5qN+5xjbG4Wnof3nXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DoXRfNTe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746829765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7JvPUVbhSeTYR6yIGg0rWAId5cMhlSU17fh9yCKmxQ8=;
	b=DoXRfNTePQ0LRazhrd/S7XXc3KxuXSPuLN0yx69bGdcQclWlvsQsgbgwfQllVSFHes647a
	I0H8Un3NFeLh4dxHnWo9t8tGQvYvvQTAVE+IMBgF+zE5oGwmQLWFdZDa04QseuSNmPCIRE
	54l916M1goMLyo2Y5wlH3gmy1Q2APlg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-DUot1dLDMbOWv45fz6F9rA-1; Fri, 09 May 2025 18:29:24 -0400
X-MC-Unique: DUot1dLDMbOWv45fz6F9rA-1
X-Mimecast-MFC-AGG-ID: DUot1dLDMbOWv45fz6F9rA_1746829763
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so15283015e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 15:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829763; x=1747434563;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7JvPUVbhSeTYR6yIGg0rWAId5cMhlSU17fh9yCKmxQ8=;
        b=HzZilXtPJiatqYSwhT4WKgnKzlD7RmgPw4HvbsHWDgYaKqO+d1DBou8rbLmLKj/Oi+
         RiinVem9lFq15tVPZfpok/B2IaRlAf5ztNu08yiV/GKsoyP366Ne7lvVK0ZVHA/VDHEI
         GHpg2XcOQCh3clJgx8SEHfxQO0eRwph/craBoTGPU6I115lBZ3EsqKC38z6PsUwr8ywE
         935IIz1ye01FcBLD7h45wUs7Ia5J9kYRx5YNXfknQG9yx2GboTunS+sN0DALJSWsoJ2I
         4EE7YjU7OgiYCajTrB/1ZqlrBIYSafzLMce57zdmTjFIHSCtJv7Ogdpv8mFHtOWVWWwG
         re/w==
X-Forwarded-Encrypted: i=1; AJvYcCUJBCWa/cn/qw/fwjWrTZDXuUWvSO/VsaQeahzC5vcv0Zu39tK1bC3V7szuEhO4qFfxYBdXdpQx+2QXru5T@vger.kernel.org
X-Gm-Message-State: AOJu0YyslEoQc2p4r9K5ULeUtR/Vt/uvSzSdv3sfGML7TBWJJdJUfJQY
	hU4Go+PoUKf0vYViCwZo2yC5a9Yi6eIVNH0pl1JrShngoJGSHuMper9MrkmhnkbcLhVwwy4CqaM
	w+ikd22R7BK+ZQig9Yn5Po6uAI43qJZrS+RyyeeYdoaFn8MrRLElur5kNneOM1rM=
X-Gm-Gg: ASbGnct5moHpVsjJy3600y8a7B6bSMqyFhWXJjyJvVeF1BE1DKDD8QrBl8mCYAo724i
	HX/oPs6PFO/5iWPE6ylgUCwpr2lg8aF/Xj8SZcWj1V10+KI1va95l+UVegA2kIZ2rrJLW5TK3ts
	2tHojjHHGJgHrGKQhVnlqf0QsKLy37/pK0hCrpMBjoN3DOExaPKaHlVNsITcfpQcQcbu4jBIR19
	rsZpFOuHQgyZ8kQee6rliDBLeZ2pcqzzBzuCGQlwUvpB2typKCOnBWOj7EuNf7JfO16JYiMDm5+
	UfiNxZCRaMjXyw7RGSbMpepAq/5V3c55o4IqtpulXCikOMjcvJ3ZBGzX3BeqVFxYCoTw8ACbsyC
	Lva6M4kBWZSjQwTaVfNmk0Sfu9sZWRJAXXVi5oRk=
X-Received: by 2002:a05:600c:4691:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-442da58fb87mr22581835e9.0.1746829763493;
        Fri, 09 May 2025 15:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47wCfqQHHeot6ocT3o7Ln2dDv6PXByBTWjtFtiocRK05SQGbHZq6Op3pcC3LQscoiLWRE9w==
X-Received: by 2002:a05:600c:4691:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-442da58fb87mr22581215e9.0.1746829763066;
        Fri, 09 May 2025 15:29:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f24fsm83677725e9.16.2025.05.09.15.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:29:22 -0700 (PDT)
Message-ID: <e2f878c1-c2fb-4951-ac64-e1ee4a827e0b@redhat.com>
Date: Sat, 10 May 2025 00:29:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
To: James Houghton <jthoughton@google.com>,
 Ackerley Tng <ackerleytng@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Vishal Annapurve <vannapurve@google.com>, Fuad Tabba <tabba@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org,
 willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com,
 yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org,
 amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com,
 mic@digikod.net, vbabka@suse.cz, mail@maciej.szmigiero.name,
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
 peterx@redhat.com, pankaj.gupta@amd.com
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com>
 <aBTxJvew1GvSczKY@google.com>
 <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com>
 <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
 <aBlCSGB86cp3B3zn@google.com>
 <CAGtprH8DW-hqxbFdyo+Mg7MddsOAnN+rpLZUOHT-msD+OwCv=Q@mail.gmail.com>
 <CAGtprH9AVUiFsSELhmt4p24fssN2x7sXnUqn39r31GbA0h39Sw@mail.gmail.com>
 <aBoVbJZEcQ2OeXhG@google.com>
 <39ea3946-6683-462e-af5d-fe7d28ab7d00@redhat.com>
 <diqzh61xqxfh.fsf@ackerleytng-ctop.c.googlers.com>
 <CADrL8HWHAzfYJktatQraUV6n661=rU4q4+f+tYRB8Q5xwdSY_Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CADrL8HWHAzfYJktatQraUV6n661=rU4q4+f+tYRB8Q5xwdSY_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.05.25 23:04, James Houghton wrote:
> On Tue, May 6, 2025 at 1:47 PM Ackerley Tng <ackerleytng@google.com> wrote:
>>  From here [1], these changes will make it to v9
>>
>> + kvm_max_private_mapping_level renaming to kvm_max_gmem_mapping_level
>> + kvm_mmu_faultin_pfn_private renaming to kvm_mmu_faultin_pfn_gmem
>>
>>> Only kvm_mmu_hugepage_adjust() must be taught to not rely on
>>> fault->is_private.
>>>
>>
>> I think fault->is_private should contribute to determining the max
>> mapping level.
>>
>> By the time kvm_mmu_hugepage_adjust() is called,
>>
>> * For Coco VMs using guest_memfd only for private memory,
>>    * fault->is_private would have been checked to align with
>>      kvm->mem_attr_array, so
>> * For Coco VMs using guest_memfd for both private/shared memory,
>>    * fault->is_private would have been checked to align with
>>      guest_memfd's shareability
>> * For non-Coco VMs using guest_memfd
>>    * fault->is_private would be false
> 
> I'm not sure exactly which thread to respond to, but it seems like the
> idea now is to have a *VM* flag determine if shared faults use gmem or
> use the user mappings. It seems more natural for that to be a property
> of the memslot / a *memslot* flag.

I think that's exactly what we discussed in the last meetings. The 
guest_memfd flag essentially defines that.

So it's not strictly a memslot flag but rather a guest_memfd flag, and 
the memslot is configured with that guest_memfd, inheriting that flag.

There might be a VM capability, whether it supports creation of these 
new guest_memfds (iow, guest_memfd understands the new flag).

-- 
Cheers,

David / dhildenb


