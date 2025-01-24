Return-Path: <linux-arm-msm+bounces-46093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FEFA1B814
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 15:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87DC3AE94E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 14:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB79E146D6B;
	Fri, 24 Jan 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5EsEOR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78AD15530C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737729910; cv=none; b=luhAJUpfVsodJl5BMcuo+LD0sqVfJ0Y3xF/ohESBkKypy9IFFjkcK4rwqGDcEZMsbHD1GL63vQt1JhcKQwEjLW+ohKTg6oPVe7pLmzsGJY7BqEQnpyy535WUXyjRverb9cxrsre8GK7R3Q3d/9i/H05ovoIn0a2qh+TT1gsJhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737729910; c=relaxed/simple;
	bh=q0GAdwPhbGRpJ6HEDydpcvRhxCU1i+DZdmp51hgMSXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Owaz1B0BQe7Nu6fhIcNm+1d8Jv58TsPW/qDAVm+GAv97CK1WX349R1sAsMRU61Qljz/sm/DrMSlq+ZFgEjrK6zY4FUlHSeMOoZtWOvlDr1dWoQ382Vuv+ZUDJziGtWS41keKM1JChcRmjD/y2QRKhofViItM8PM5/zNdKo+kpdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5EsEOR2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737729907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ocsd7wFcpPH6tBSZFNIlHlu+PG10KWF3ThfH3Uo4iWo=;
	b=J5EsEOR2QVoP2HpQHMDSb4vqN+1jr097vYKxbv36uYdtITRzh34aoBQbquGe+uwaDYWSM1
	bah8BX31r7xSZt9FfSiHlMO2kwSi4QS0jP87G+wMufw/KusWRdqNM1Z80zmILGQX1m34Kp
	Vw4WCKSb0XtYvmj7X0/U6dLHyEOQYaQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-x2Krr2bkMvm-zgOx0lmsDw-1; Fri, 24 Jan 2025 09:45:06 -0500
X-MC-Unique: x2Krr2bkMvm-zgOx0lmsDw-1
X-Mimecast-MFC-AGG-ID: x2Krr2bkMvm-zgOx0lmsDw
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d90a59999aso2105465a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 06:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737729905; x=1738334705;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ocsd7wFcpPH6tBSZFNIlHlu+PG10KWF3ThfH3Uo4iWo=;
        b=j+Mj6daN6dhdBoXdhrsuRJ8JGIIDSbIM+CRHyh/b+l4oFSbM4HiYmzVttxq6eBxOKL
         oY1okVedPwZQonao1XADoMjDOPnJyD5s9k+Eiglc18esDsK+XCFvmOQU02AMOwNom934
         FCQDn2EgOH54Nu1/RXRRnzqFmE1BZ80++RthQq5TtCy2iHnIE3FEO0JALlcZswpDcoiE
         FumSMg8JsD4h5fdRAKjvTXh3WfFodlF8z+s/lc/QtuXhpP7bV3DTDxRd2nVjySFTMmrU
         xZaLO58Rs0+e5MJ+sBKCaExjAS9fEXuYQhIMotB4YMMVho0tjdOL0yct3E8RXuvlp+kO
         6ouA==
X-Forwarded-Encrypted: i=1; AJvYcCXGDklatz+OfSJOwYJrSDIleQoKOZQIkBbfdtNggY/c6d4CmPzhulzIYqGPg2pfDgbnr9RgLqaPQuqIVqaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4V+TjYGQZ6715eAch7D6WYJp5s9itpRZeri3kJg2IOncPuXYI
	n4zVLTcmF+vgSkOP0rLOtmiXG531fFwsgYZVPJmRL+8haJgM30iqvuQ/kugKL+AwDTU8LKale8Q
	f5yNLZkSRDEuc94cxwaC7FQo1VQHcS56BSHBtz7X+mX1dHbsj6+5RaPZ4/QdPOXo=
X-Gm-Gg: ASbGncttEygL7GMWrytlMKPJY39dVJgw71zsVvSZnfLMHCRFrG/8B9DlDI83MyeEzQf
	W2u0XRuAE8uzxa6OWwTHFo0OSCBNR5IlLpIgCAtnlJJli9LhCEPZ4m1sK60Vsk/BaFgtOEoUiKC
	E1M1pqgI2GD+rA/lZ9rvs62+jSX1y2M9Q4FJV23czuGy8K+lTt2LjW2m7H91NYtntU1lpwVU4iq
	gevPbZJdC5xThNz7W9O2J6qzVZRt7LcUUWGLPbB25RaT71VE1uTSXoT69krI/1UAfAvA8o6oJcc
	k+0vWylrxSkov+NHrBBj63V4EPf6X1GcpBs=
X-Received: by 2002:a05:6402:1e95:b0:5d1:fb79:c1b2 with SMTP id 4fb4d7f45d1cf-5db7d2f9ceamr29055118a12.11.1737729905189;
        Fri, 24 Jan 2025 06:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwpKT/HjjfhH33dhVMHKZHZVVhny4ymuXWG35wpbFdtpSLOJHShNMd1RmVk2JEV1zOxabkTA==
X-Received: by 2002:a05:6402:1e95:b0:5d1:fb79:c1b2 with SMTP id 4fb4d7f45d1cf-5db7d2f9ceamr29055088a12.11.1737729904744;
        Fri, 24 Jan 2025 06:45:04 -0800 (PST)
Received: from ?IPV6:2a01:599:922:1046:67aa:7b35:f780:c8fc? ([2a01:599:922:1046:67aa:7b35:f780:c8fc])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863b68fsm1311747a12.46.2025.01.24.06.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:45:03 -0800 (PST)
Message-ID: <14803371-ee5f-4a13-91ff-29b9e05ec9f7@redhat.com>
Date: Fri, 24 Jan 2025 15:44:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/9] KVM: guest_memfd: Add guest_memfd support to
 kvm_(read|/write)_guest_page()
To: Patrick Roy <roypat@amazon.co.uk>, Fuad Tabba <tabba@google.com>
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
 will@kernel.org, qperret@google.com, keirf@google.com, shuah@kernel.org,
 hch@infradead.org, jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com,
 fvdl@google.com, hughd@google.com, jthoughton@google.com
References: <20250122152738.1173160-1-tabba@google.com>
 <20250122152738.1173160-3-tabba@google.com>
 <e6ea48d2-959f-4fbb-a170-0beaaf37f867@redhat.com>
 <CA+EHjTxNEoQ3MtZPi603=366vxt=SmBwetS4mFkvTK2r6u=UHw@mail.gmail.com>
 <82d8d3a3-6f06-4904-9d94-6f92bba89dbc@redhat.com>
 <ef864674-bbcf-457b-a4e3-fec272fc2d8a@amazon.co.uk>
 <fe154ef9-ac57-40ce-96d8-4e744d83d37e@redhat.com>
 <5b2949bf-ab8b-46d4-9daf-71fe3e20b0c8@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5b2949bf-ab8b-46d4-9daf-71fe3e20b0c8@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.01.25 16:22, Patrick Roy wrote:
> On Thu, 2025-01-23 at 14:18 +0000, David Hildenbrand wrote:
>>>>>
>>>>> That said, we could always have a userspace address dedicated to
>>>>> mapping shared locations, and use that address when the necessity
>>>>> arises. Or we could always require that memslots have a userspace
>>>>> address, even if not used. I don't really have a strong preference.
>>>>
>>>> So, the simpler version where user space would simply mmap guest_memfd
>>>> to provide the address via userspace_addr would at least work for the
>>>> use case of paravirtualized time?
>>>
>>> fwiw, I'm currently prototyping something like this for x86 (although
>>> not by putting the gmem address into userspace_addr, but by adding a new
>>> field to memslots, so that memory attributes continue working), based on
>>> what we talked about at the last guest_memfd sync meeting (the whole
>>> "how to get MMIO emulation working for non-CoCo VMs in guest_memfd"
>>> story).
>>
>> Yes, I recall that discussion. Can you elaborate why the separate field
>> is required to keep memory attributes working? (could it be sorted out
>> differently, by reusing userspace_addr?).
> 
> The scenario I ran into was that within the same memslots, I wanted some
> gfns to be backed by guest_memfd, and others by traditional memory, so
> that KVM can GUP some parts of guest memory even if guest_memfd itself
> is direct map removed.

Just summarizing what we discussed yesterday:

GUP will not be allowed if the direct map was removed, and paravirt time 
on x86 uses GUP to access the guest page right now.

> 
> It actually also has to do with paravirtual time, but on x86. Here, the
> guest chooses where in guest memory the clock structure is placed via an
> MSR write (so I can't a priori use a traditional memslot, like we can on
> ARM).  KVM internally wants to GUP the hva that corresponds to the gfn
> the guest chooses, but if the hva is in a mapping of direct map removed
> gmem, that won't work.

And as discussed here, Sean raised that these hypervisor updates happen 
rarely.

In the first step, it might be good enough to just update using the 
user-space page table mappings (user access), to avoid messing with 
kmap/direct-map reinstalling.

With that in place, it looks like that user space could simply mmap 
guest_memfd and provide the mmaped area "ordinarily" as the "shared 
memory" part of the guest_memfd -- using userspace_address.

GUP would fail, bit paravirt time would not be using GUP.

So we could handle the guest_memfd mmap just like on other 
architectures, without the need for other memslot fields.

Please correct me if I misunderstood something :)

-- 
Cheers,

David / dhildenb


