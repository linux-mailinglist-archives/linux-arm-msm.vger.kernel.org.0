Return-Path: <linux-arm-msm+bounces-56527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF2AA7584
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E61D3A4D39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F582255F5A;
	Fri,  2 May 2025 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sribkiaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122C14A09C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198305; cv=none; b=GjgOKtw2ycYmf4wwHh5sQS6RFcEvS9vZAOufsu3Jss3JHXw+5v6OLz1SPcMXPJIG7LSl5QZPlRzSaaNtfNpbHzxPmX2Htf7HI+KuY8HvGA+Wcz3zcslhu+9WlQVHYNn4P/hKG4t9tzo+gupFNn7bvXLtqCe24eTcEumTu3fGjeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198305; c=relaxed/simple;
	bh=m69f3ANgcY6LUMxCNBkefXGXUrDHXfhJYVGNwIyctVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLkHeASxa4nrrn4IKfBrp9xEE7v9g24AEN9m8+fY8uasD3biKD33976NPw6jAFzfQZpjEmKerg0lKTgA5UDZVIynZxC1el7SNYF3Gz0c5R6ReD2LW7PY0DG3528xPITow5U52VhAJvfBIKAbungdH0wiMscQq8YBQLoKePLR6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sribkiaz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746198302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uGszKsYJV+/3KxrWyzdce5oTg3e1aS8x57TNNDe6TdU=;
	b=SribkiazzTjFKeFXlNHZVJELMFrC+hkiQ7vENXoGYk0Eb/hMzQhUh339HTS1G3/9cDUEK4
	SGtbqpnT+jXE7DDkUAs8jK4x6xTfmJuhGZ5U+yS3JehEc8se/Ozgg1qBqOy5en7iV0aCvc
	volyzcKzNJWazfpLoJEiD1wbGUy3TSs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-BzPb95hZNy60EAd78ZnjnQ-1; Fri, 02 May 2025 11:05:01 -0400
X-MC-Unique: BzPb95hZNy60EAd78ZnjnQ-1
X-Mimecast-MFC-AGG-ID: BzPb95hZNy60EAd78ZnjnQ_1746198300
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so9413325e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 08:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198300; x=1746803100;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uGszKsYJV+/3KxrWyzdce5oTg3e1aS8x57TNNDe6TdU=;
        b=T6TmhoVHsp/Mz510tzOcB6PXg22RMxX8ux8pqf/vzfR04m7eNcx8W3USnY3kTD/aaM
         /RV3cVugi3rgkZmxW7dzpUwWw32sCm6cbKrhqCVD0xwtuoKKjaOjd4Nji7Ch1RX4lfp4
         IjJTQogvZPG/3FIsiV1Hg34lwBrbZnaQhKx6rfBppdDQAmJhx+Irv2K3qGE8J1lJ8Drm
         GjJoTlF4w2TmGStX200TCoTTd9pIloowC8Qr+ElFxF6Gx/zBAKpvPNP/hBgX/foGHpTr
         zB3Shbo46qfFWEesyASXITumU6rIDMwgn5lt676Ikj1Xc7atMPnn/ilR/Q+K4+xSjcMX
         j8bg==
X-Forwarded-Encrypted: i=1; AJvYcCX/n+gO12+jkWcPC1yWBhCxOSMbXnNmqOthPfHPcJD3YKZ3S5sgHXWrMb2sHAD1OmdZyOTCfoCniOIiYdU9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuo8WFai0UcQUE/CI8Dwq6Rc+AagsZiJ3Ktf0MMT5bY3Evmyp/
	NRg6ATW0U4URpaGA2fp1WWcb6EM9pgP9xYHSSsG6UknHguHOTzvHaa0dTioA0SnfEI3OQlxZ697
	UOTgDFWuOX6gUXrHmucFjUDYGDpf6qnDMNKN9MbozC3Da3dyCwGlX/p+lxUucuKA=
X-Gm-Gg: ASbGncsZ9wl3r0W+E2mMAMyW9D1TtKz8zxO14dgzJlarRTdG7VeHkg/BGIir0yVFNJ+
	rHBYDLHOlJbusYSp6NW7kOoSuZXHcEe8r5VGW+6ObcZANUZKS5xb4gQelfyBwKE4VwEAFd9cChK
	2LdgmC5wsq0g1eTGQ/tBV0o0Br3K1COnELNjF3N54wfMMZE/HoahfTraluo82M1ZTSJPNqUEOx7
	XZrJp0HvYA55IbeaDy1VhTVTH838BH83udr4y6UJr63XG9cXG71O8tYUjLt7vh4xBwuIGFUOWvw
	MkltAsJmM9HelH2IDML73efUa01UHCMBc30AXY3Y40eskAUOvPb+IADdxT1Xg1ou6yssWSpd7qQ
	+J0IBHqQQURLh8IZCMrTaGRBPK/SrWeMfR73OhbM=
X-Received: by 2002:a05:600c:470f:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-441bbec4897mr28964815e9.16.1746198299721;
        Fri, 02 May 2025 08:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBmFWdd61i7kQfGj0DSlbMhLGC/f16Iqwd9J9AcP1MHmrDAlG5FHiYpT5N2sKEXY6IvxTSTQ==
X-Received: by 2002:a05:600c:470f:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-441bbec4897mr28963495e9.16.1746198299210;
        Fri, 02 May 2025 08:04:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:d600:afc5:4312:176f:3fb0? (p200300cbc713d600afc54312176f3fb0.dip0.t-ipconnect.de. [2003:cb:c713:d600:afc5:4312:176f:3fb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2922sm92031265e9.17.2025.05.02.08.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:04:58 -0700 (PDT)
Message-ID: <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com>
Date: Fri, 2 May 2025 17:04:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
To: Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com,
 wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.25 20:58, Ackerley Tng wrote:
> Fuad Tabba <tabba@google.com> writes:
> 
>> Until now, faults to private memory backed by guest_memfd are always
>> consumed from guest_memfd whereas faults to shared memory are consumed
>> from anonymous memory. Subsequent patches will allow sharing guest_memfd
>> backed memory in-place, and mapping it by the host. Faults to in-place
>> shared memory should be consumed from guest_memfd as well.
>>
>> In order to facilitate that, generalize the fault lookups. Currently,
>> only private memory is consumed from guest_memfd and therefore as it
>> stands, this patch does not change the behavior.
>>
>> Co-developed-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Fuad Tabba <tabba@google.com>
>> ---
>>   arch/x86/kvm/mmu/mmu.c   | 19 +++++++++----------
>>   include/linux/kvm_host.h |  6 ++++++
>>   2 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
>> index 6d5dd869c890..08eebd24a0e1 100644
>> --- a/arch/x86/kvm/mmu/mmu.c
>> +++ b/arch/x86/kvm/mmu/mmu.c
>> @@ -3258,7 +3258,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>>
>>   static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>>   				       const struct kvm_memory_slot *slot,
>> -				       gfn_t gfn, int max_level, bool is_private)
>> +				       gfn_t gfn, int max_level, bool is_gmem)
>>   {
>>   	struct kvm_lpage_info *linfo;
>>   	int host_level;
>> @@ -3270,7 +3270,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>>   			break;
>>   	}
>>
>> -	if (is_private)
>> +	if (is_gmem)
>>   		return max_level;
> 
 > I think this renaming isn't quite accurate.

After our discussion yesterday, does that still hold true?

> 
> IIUC in __kvm_mmu_max_mapping_level(), we skip considering
> host_pfn_mapping_level() if the gfn is private because private memory
> will not be mapped to userspace, so there's no need to query userspace
> page tables in host_pfn_mapping_level().

I think the reason was that: for private we won't be walking the user 
space pages tables.

Once guest_memfd is also responsible for the shared part, why should 
this here still be private-only, and why should we consider querying a 
user space mapping that might not even exist?

> 
> Renaming is_private to is_gmem in this function implies that as long as
> gmem is used, especially for shared pages from gmem, lpage_info will
> always be updated and there's no need to query userspace page tables.

I'm missing the point why shared memory from gmem should be treated 
differently here. Can you maybe clarify which issue you see?

> 
>>
>>   	if (max_level == PG_LEVEL_4K)
>> @@ -3283,10 +3283,9 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>>   int kvm_mmu_max_mapping_level(struct kvm *kvm,
>>   			      const struct kvm_memory_slot *slot, gfn_t gfn)
>>   {
>> -	bool is_private = kvm_slot_has_gmem(slot) &&
>> -			  kvm_mem_is_private(kvm, gfn);
>> +	bool is_gmem = kvm_slot_has_gmem(slot) && kvm_mem_from_gmem(kvm, gfn);
> 
> This renaming should probably be undone too.
> 
>>
>> -	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
>> +	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_gmem);
>>   }


-- 
Cheers,

David / dhildenb


