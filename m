Return-Path: <linux-arm-msm+bounces-45992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EFA1A59F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DEE93A04FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 14:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D128620F972;
	Thu, 23 Jan 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/mze3Ii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A17413212A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641923; cv=none; b=gdbHGnGCychxkLp1uwMBYd0LvQqfl/u6aws4M8y6VfZodHVegdmrGD8YSBYj+P8UNtdew5sds0KQ4I2tExq2lVrkIJ7tj1PrzIcUt8YVwWwXzXabbEH/akrP4t/z3twShr4OH/MwYE6rMUNyxxcnr84g7SI+M+NMfsO8YpZEiGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641923; c=relaxed/simple;
	bh=bn0TeOgp/eCqqZtWnt/qWExq7Dhjaz3Vef+6WrUQZvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFqcX5YRlIWdFvFiYgo6I+yqF+AVkqoEQTexPf9VeR8TkgyAEFvqAtpeioJsUHE2zIOfeETi0EcdxJns0YzN77sGtFSrOeywv6qVDHt7JJhWLx0p5CfkFYbXaPVttkdSuJGPFe905qCIXHVXMM+VeJ6ClYAAaASh1UKIoyXh+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/mze3Ii; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737641921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n6m0q/mJbsAGmSWWw+HA7VvCfk0tk41ZHdgy2uRRau4=;
	b=E/mze3IiA1YnCbnWQP8gFqOAbafKSg939vnq4njjs2lE8cCXNCTMBkf8G7+ClvQbzYy00D
	/6IukGktB2WvSqb58NRdzK+ht5sVLp2/ivej/pb+iinnIg+f46+2vPQS1p6HiiAAvdgI8U
	BjuRPlbwe/2LYgDtatwRhjLxCC5+qm8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-4Q8b3FJ4Pg-BGxBru1sjAQ-1; Thu, 23 Jan 2025 09:18:40 -0500
X-MC-Unique: 4Q8b3FJ4Pg-BGxBru1sjAQ-1
X-Mimecast-MFC-AGG-ID: 4Q8b3FJ4Pg-BGxBru1sjAQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e1fd40acso596913f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 06:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641919; x=1738246719;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n6m0q/mJbsAGmSWWw+HA7VvCfk0tk41ZHdgy2uRRau4=;
        b=Ti7LduRDLuH7Js5ciX8QsG2CSd2qTrTmg5O+wTnW2lobb1e4GZi2o14pF+CMjXxKge
         nhG3P0X6h+/wLHrEA4HzpHcfuHUtsKOt5QOxjrY7w2XZketfPfeccVn/Ky1pfDQ1F6qf
         8NGGcqPTC0p2HDu+Um2hpYzEWQ7+/cI0eOzyAdKdGS5T0gsalNOVIMOZnPSZDDvaVrFn
         g5PxXGgk9yvidJMV0XwkD7QYI/X3cSeLpv+YkoUoeNGi3ZRm68eVDiK5v5AHDmRJFyDw
         o4pd9fCgwXHjesh7yluY+8lixDqWy6s0SjhIU31ZbO2NyC3P6vVlpqsuocLCRJso65lX
         ROEg==
X-Forwarded-Encrypted: i=1; AJvYcCUPeeTi2nVG5KvPh12kk673n69dCjeLDWOKhgS+JHSaMtYOTqu8tSe3gopQzFRB4W7/FNUVTcDfi0lABcb6@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHqyUL+LJeuLRGGif/C+svRuF4XY8UMgWi2mPwF7KV4eQKa2C
	2enD7rAU/srNKi5t6KOt+/qSW6sBV0AGWkN1EwiqpsvNgkrhCR3Zj8F8HB07m2BFxF6k0hMYiMh
	jkiCmXOveWTqcywVtEN2HIDB0n7J5NIURg6fcUK6bSCn6PCPxvljTsqsSHgFt76XLd9ZbiBJj3A
	==
X-Gm-Gg: ASbGncuJru4Zn5duba6v9jnrObyCmN6tqdSsnfd9OFCNl6XNL8ft5y4jeYokcZxMIsi
	6fRq27uZOXwES1ak8qWvMT+DA8gnHEjZo+VdPEYsTskPvF4Egm3myQ2eRzHM3dVVgR9G1J+QGmG
	NJ1Tub2TC3AUgHXdes+/uEAgy5G5fTOqRml/CE9pPec1rQMikWQ0g1ZFnB7vzXfFA5hXqGk6MFd
	3xELo/h6E80FhkKLZzaDlIHhnvdvYK7GPirqhmS/gCU0ImdtB0fbEpNj2YUH4IxvwMFTzO/IiZZ
	b4wZp13fOpGHeJqfkuPiKqtm8a0krEz08Q/2rmwzGXUQuuS7ZZztcqfujx4YplcacvACYdeZ99K
	LsdU+OCjNUEb239LFOC/dcg==
X-Received: by 2002:a5d:5986:0:b0:386:1cf9:b96e with SMTP id ffacd0b85a97d-38bf59f6d61mr24033444f8f.55.1737641918704;
        Thu, 23 Jan 2025 06:18:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF92dwxQ8eRCGPmu+DlcGyW7235PZmyCA8UwdVlDbyHAGx5NCV05uhVaOf9RiYwIllyjWwzDA==
X-Received: by 2002:a5d:5986:0:b0:386:1cf9:b96e with SMTP id ffacd0b85a97d-38bf59f6d61mr24033405f8f.55.1737641918294;
        Thu, 23 Jan 2025 06:18:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d? (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de. [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221761sm19134760f8f.22.2025.01.23.06.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 06:18:37 -0800 (PST)
Message-ID: <fe154ef9-ac57-40ce-96d8-4e744d83d37e@redhat.com>
Date: Thu, 23 Jan 2025 15:18:34 +0100
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ef864674-bbcf-457b-a4e3-fec272fc2d8a@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>
>>> That said, we could always have a userspace address dedicated to
>>> mapping shared locations, and use that address when the necessity
>>> arises. Or we could always require that memslots have a userspace
>>> address, even if not used. I don't really have a strong preference.
>>
>> So, the simpler version where user space would simply mmap guest_memfd
>> to provide the address via userspace_addr would at least work for the
>> use case of paravirtualized time?
> 
> fwiw, I'm currently prototyping something like this for x86 (although
> not by putting the gmem address into userspace_addr, but by adding a new
> field to memslots, so that memory attributes continue working), based on
> what we talked about at the last guest_memfd sync meeting (the whole
> "how to get MMIO emulation working for non-CoCo VMs in guest_memfd"
> story).

Yes, I recall that discussion. Can you elaborate why the separate field 
is required to keep memory attributes working? (could it be sorted out 
differently, by reusing userspace_addr?).

> So I guess if we're going down this route for x86, maybe it
> makes sense to do the same on ARM, for consistency?
> 
>> It would get rid of the immediate need for this patch and patch #4 to
>> get it flying.
>>
>>
>> One interesting question is: when would you want shared memory in
>> guest_memfd and *not* provide it as part of the same memslot.
> 
> In my testing of non-CoCo gmem VMs on ARM, I've been able to get quite
> far without giving KVM a way to internally access shared parts of gmem -
> it's why I was probing Fuad for this simplified series, because
> KVM_SW_PROTECTED_VM + mmap (for loading guest kernel) is enough to get a
> working non-CoCo VM on ARM (although I admittedly never looked at clocks
> inside the guest - maybe that's one thing that breaks if KVM can't
> access gmem. How to guest and host agree on the guest memory range
> used to exchange paravirtual timekeeping information? Could that exchange
> be intercepted in userspace, and set to shared via memory attributes (e.g.
> placed outside gmem)? That's the route I'm going down the paravirtual
> time on x86).

Sounds reasonable to me.

> 
>> One nice thing about the mmap might be that access go via user-space
>> page tables: E.g., __kvm_read_guest_page can just access the memory
>> without requiring the folio lock and an additional temporary folio
>> reference on every access -- it's handled implicitly via the mapcount.
>>
>> (of course, to map the page we still need that once on the fault path)
> 
> Doing a direct map access in kvm_{read,write}_guest() and friends will
> also get tricky if guest_memfd folios ever don't have direct map
> entries. On-demand restoration is painful, both complexity and
> performance wise [1], while going through a userspace mapping of
> guest_memfd would "just work".

Indeed.

-- 
Cheers,

David / dhildenb


