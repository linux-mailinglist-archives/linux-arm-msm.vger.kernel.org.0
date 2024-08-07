Return-Path: <linux-arm-msm+bounces-28111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63594ADCF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 18:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7FC282115
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 16:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A463839C;
	Wed,  7 Aug 2024 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYHartFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54084037
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723047128; cv=none; b=bKd7KR/o2joat+NjUfPI7inMEqzOsGm9Y8BJ8qW7+o/wqdUtYcOfKHi6ByF2SrQOrzvf3vsnY0zBStNZP76gRdvMk6ItLDwYC9FgTnFdtUjHeP2bSs1cxFGGXZgGix1X+4KaXFzzcBym2FTl2VoJyfVC0+8k6jWU5u92PN5A7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723047128; c=relaxed/simple;
	bh=X7QCLAwNclPApPkd4erwNkoe9XlUxIdl1pmmcDWabUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGpTcnNsrOqYjpB85aNgKZVka7AxsJgHTBb5T/ChrwLPXtPIOXuRyvprxrl7IeTiJVZgw6heRdw372+Kc+nJALaqmhjv6RwOK18t75HbxmmZzcmbFUcFSNi84F7jXTIkECxYXKdDMNcEiRyY0AUHZy/JVS3OM3tFiaj6hu/5IT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYHartFA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723047125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WnephO0jHtL3QUKOPrQKyFATyWXbhewa9UcfcjQtYIs=;
	b=bYHartFAmf1RPIPvg4CUwvz4e86tQuzLYut+e/eyDPQu9zr4uIeqChvKk9sOxRNsAaK49o
	6mInPYn29h5eEPND45snefww2Y6Xqe2VDgs3dYycHJ+tjHuH20m8w7rDmtPVVPEbBzDCqC
	T0HS009W4QA+sEsuMlBun6qe+Y+5ibk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-MHEiU6adNa-ghN42wqh8NQ-1; Wed, 07 Aug 2024 12:12:04 -0400
X-MC-Unique: MHEiU6adNa-ghN42wqh8NQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42808efc688so312265e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 09:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723047123; x=1723651923;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WnephO0jHtL3QUKOPrQKyFATyWXbhewa9UcfcjQtYIs=;
        b=oc7+5swA/rolJXrtK3jupybdNO5kfLkpFCY3JH9WrAH2tihbOcBbtZ2glP8Nn90Ue7
         x9P7E0hCfZL5RYJ/qdjBmiIK8p0KHizMRkZewRW3nxPRHfAlJ6hfIa/l4W8nHAQQ2JN0
         SSzHBcpHovJ0MskOe1W117gu9AO+ujaL3Zv8jintVNgpQkEEcKesXcKVf52NC/eyfB6H
         Bi8EyT1R9/R3MLVeYWRfEy8MqMU1DnMy5FuLX2JyZhsX38prlmNTkSzLKXC6x1ohfj4h
         ptVUOq9K8Slmr8EW0vw8LXFo2pg9C1MnC9lXD8I3lMWbEhFAJWMwMGbc1vwp868Sozue
         0bSg==
X-Forwarded-Encrypted: i=1; AJvYcCU95hi5a0GRRIEG8G7xrPDa/nPoaEwruZpYgaWreoLj84tUOa3yMQFNEvfPlsjd4fC79HrC1UQqS6bnWp8ziiGhHKns0VQGygnwibOy6Q==
X-Gm-Message-State: AOJu0Yzf0cS34XXX+nGtZJrRCli0kaDriCaJQfg/UivpVev0ywTzmYio
	nWhFVY5BXF+Hz8FvHuJU5StzFjF6uAW0/e5+FMU/gyGbeo+849YfIdxyvsjR3yt2gHggRlI30f/
	c45zTAApJeAsCKPnJBnmO7s8Vm0npGC0peYb0RP/u5A16U/zf6tvGOy5v7yQfZZo=
X-Received: by 2002:a05:600c:468b:b0:427:d8f2:332 with SMTP id 5b1f17b1804b1-428e6ae43c0mr133743945e9.7.1723047123231;
        Wed, 07 Aug 2024 09:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7fDqLCekj1MJn87GS5OV3LrntDMwMowxdL9R+2xUSbWi5BIU+SYpulFQbMbHLdZRwk09sjw==
X-Received: by 2002:a05:600c:468b:b0:427:d8f2:332 with SMTP id 5b1f17b1804b1-428e6ae43c0mr133743675e9.7.1723047122689;
        Wed, 07 Aug 2024 09:12:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1a00:df86:93fe:6505:d096? (p200300cbc7081a00df8693fe6505d096.dip0.t-ipconnect.de. [2003:cb:c708:1a00:df86:93fe:6505:d096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd022ce0sm16470486f8f.55.2024.08.07.09.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 09:12:02 -0700 (PDT)
Message-ID: <a7c5bfc0-1648-4ae1-ba08-e706596e014b@redhat.com>
Date: Wed, 7 Aug 2024 18:12:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Fuad Tabba <tabba@google.com>,
 Patrick Roy <roypat@amazon.co.uk>, qperret@google.com,
 Ackerley Tng <ackerleytng@google.com>, linux-coco@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kvm@vger.kernel.org
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>
 <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
 <20240806093625007-0700.eberman@hu-eberman-lv.qualcomm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240806093625007-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.08.24 19:14, Elliot Berman wrote:
> On Tue, Aug 06, 2024 at 03:51:22PM +0200, David Hildenbrand wrote:
>>> -	if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
>>> +	if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
>>>    		r = guest_memfd_folio_private(folio);
>>>    		if (r)
>>>    			goto out_err;
>>> @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
>>>    }
>>>    EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
>>> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
>>> +{
>>> +	unsigned long gmem_flags = (unsigned long)file->private_data;
>>> +	unsigned long i;
>>> +	int r;
>>> +
>>> +	unmap_mapping_folio(folio);
>>> +
>>> +	/**
>>> +	 * We can't use the refcount. It might be elevated due to
>>> +	 * guest/vcpu trying to access same folio as another vcpu
>>> +	 * or because userspace is trying to access folio for same reason
>>
>> As discussed, that's insufficient. We really have to drive the refcount to 1
>> -- the single reference we expect.
>>
>> What is the exact problem you are running into here? Who can just grab a
>> reference and maybe do nasty things with it?
>>
> 
> Right, I remember we had discussed it. The problem I faced was if 2
> vcpus fault on same page, they would race to look up the folio in
> filemap, increment refcount, then try to lock the folio. One of the
> vcpus wins the lock, while the other waits. The vcpu that gets the
> lock vcpu will see the elevated refcount.
> 
> I was in middle of writing an explanation why I think this is best
> approach and realized I think it should be possible to do
> shared->private conversion and actually have single reference. There
> would be some cost to walk through the allocated folios and convert them
> to private before any vcpu runs. The approach I had gone with was to
> do conversions as late as possible.

We certainly have to support conversion while the VCPUs are running.

The VCPUs might be able to avoid grabbing a folio reference for the 
conversion and only do the folio_lock(): as long as we have a guarantee 
that we will disallow freeing the folio in gmem, for example, by syncing 
against FALLOC_FL_PUNCH_HOLE.

So if we can rely on the "gmem" reference to the folio that cannot go 
away while we do what we do, we should be fine.

<random though>

Meanwhile, I was thinking if we would want to track the references we
hand out to "safe" users differently.

Safe references would only be references that would survive a 
private<->shared conversion, like KVM MMU mappings maybe?

KVM would then have to be thought to return these gmem references 
differently.

The idea would be to track these "safe" references differently 
(page->private?) and only allow dropping *our* guest_memfd reference if 
all these "safe" references are gone. That is, FALLOC_FL_PUNCH_HOLE 
would also fail if there are any "safe" reference remaining.

<\random though>

-- 
Cheers,

David / dhildenb


