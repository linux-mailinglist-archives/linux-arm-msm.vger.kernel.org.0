Return-Path: <linux-arm-msm+bounces-45578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206EA16B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 12:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46B7A3A554F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8481E0DF5;
	Mon, 20 Jan 2025 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqFbAPkU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F261DF75B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372527; cv=none; b=dUAo15FfXc0ZaFA0BcVOwDRMN8ox043FK7g9ryZ5cPhNlnH6uraaNNRa/yxeNGPp955kRHUclHtZf8k5MSqjstleMroiEehhArC6Ld227J4/hX8mmH0VRHKcmcBhCo/Xy1Q1AOKZwuy2JBdmcwV8RIiew6S1oVC/+5eyVVwgiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372527; c=relaxed/simple;
	bh=BHBaOfgBfewb8GCvEZHqXWM4NoobI+1De5G6FCubJgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HC4kJsbk5izS46CEmdoycg1bP9D1refkGkuw0y8c8FgK15zcGBi+JeaGlbu30EUM4VJ/KFPQ+rNnP5EB+gI3Ae30hiROuJoeNax1A6JrzlNkpAdiUDMczIoIzjxm/KJEvNiL5cL4+0zpUYmscAL2mlTiN600fXU1Ccz+//j4sPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqFbAPkU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737372524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KQSLQ75LBX26JNsc8C4fo0McdstxtGs53ANKsfzLRxE=;
	b=PqFbAPkUY9onOplE+xEky5g8TGKuMxRUWgL4QM+OX2TWQKRuM9n/h75Qa/qGUy/qXw/yfO
	/ogGFCULhMoR5dby3WB43DYFXA+5Nm7WWkV7z4xIwYaMyLDj3pOaPuF9K3e8jbjSZiPYsw
	/Lnlp/6JvwsLo7ml+f0Xp3zjfNq293w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-haHn3_J1Pz-GH5zdiajk5A-1; Mon, 20 Jan 2025 06:28:43 -0500
X-MC-Unique: haHn3_J1Pz-GH5zdiajk5A-1
X-Mimecast-MFC-AGG-ID: haHn3_J1Pz-GH5zdiajk5A
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38bf5ef17a5so2563494f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737372522; x=1737977322;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KQSLQ75LBX26JNsc8C4fo0McdstxtGs53ANKsfzLRxE=;
        b=PwIBfeP013+9/ECIv6Ju6q2hNZFieoBq1O5cKSbS7Jrfcs+Hv3vEnDnWdzZipKZQBl
         fznKxpg8dvo7xI+7YwKg9bX2PGFrPNOoHScCn93a9xIoduGZlt5QuVRN6stsIednsHS5
         Pvs1HEgo9hfoxsgSzYnvnNgnre74mzPjinGmG5baAPO73PGnL9SCafRBPJ66A7pbfV30
         WHhW9zO1b1MzoSs9yghIFFqM3sZRyG/iiEvNoR5mN6dRLk2UPbwVBBmDq1s8lzwXGDWw
         ZD74RqbNIsAUR4MYYnH1SIMQykRkMoubaGw3wWEzkZgGtvNe/aZdXf5hin45usOIU4TN
         nvbg==
X-Forwarded-Encrypted: i=1; AJvYcCUjdNi5lOWs3gSos5D3NXO1IsShUeYrhMs48GMu5kilbdekDNSIDYJFb08VnFxhYrJVUibToxR7cdhIxRG+@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4mUv9oCuSuGt/NKsbhqchaEmIEw3rYJV5JaABjoRMtuxKLYv
	CytFZhl2aL9fKO+t60TbWNkSOPcqPFLn81+7yKaWFATIs0DfirGmcuyPzn5GCtXGGp88kD2k+lD
	CWR3EJREvx2RjOkAIqJ02UkYU88slBfZtzH1Ihoru4MPY6TxuW/q3tpc5UNOq33A=
X-Gm-Gg: ASbGncs7HfQrj2BH1xPlV14LOvhJCyngtGUSfF5EGuj9Zk66lOKv3eYUPWsX75GBMT4
	qaKdAAq5U5NxRDG0a0es/1zuSGDJzaMJnhOMWBp9fa8yAe/npogARRS1jnr7Y1SPzmPB1B7ycYT
	5T9q/CSWGoDuoIqu4cC1joySP7F+7/g2HMur6ZogWezoRPMflISPGRXILRd8XW/Mn8CUTSigUXC
	CX7WBYrl2dlRWwIWSqUGqrNteL+qWYb4GR86l3wMLdNeW7sLl56r4lKIl7Ooga0rntJduqhCHQp
	usJg/31xeu1yE1NMMuq3oIQVynQnZCknpFJTSESlw2dUMymBD23NIkCBozZffEiqinB32LHca0p
	ysl+zHnP98zMYBErQS2QxZw==
X-Received: by 2002:a5d:5f8c:0:b0:385:fb34:d5a0 with SMTP id ffacd0b85a97d-38bf5669e90mr13152247f8f.29.1737372522132;
        Mon, 20 Jan 2025 03:28:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuhcNCZwJBTFSjxvnS2YG9WoxJRcK3YxBjzpJqw3vJjbMgUj6cgza3ZuESh9vRMhVYPEuJwg==
X-Received: by 2002:a5d:5f8c:0:b0:385:fb34:d5a0 with SMTP id ffacd0b85a97d-38bf5669e90mr13152163f8f.29.1737372521661;
        Mon, 20 Jan 2025 03:28:41 -0800 (PST)
Received: from ?IPV6:2003:d8:2f22:1000:d72d:fd5f:4118:c70b? (p200300d82f221000d72dfd5f4118c70b.dip0.t-ipconnect.de. [2003:d8:2f22:1000:d72d:fd5f:4118:c70b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bfeb391ffsm7777798f8f.63.2025.01.20.03.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 03:28:40 -0800 (PST)
Message-ID: <5d9a5520-4190-4db2-9409-25451683f6f3@redhat.com>
Date: Mon, 20 Jan 2025 12:28:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on
 final folio_put()
To: Vlastimil Babka <vbabka@suse.cz>, Fuad Tabba <tabba@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
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
 jthoughton@google.com
References: <20250117163001.2326672-1-tabba@google.com>
 <20250117163001.2326672-2-tabba@google.com>
 <0f588655-62c0-46c3-bd15-01016615953f@redhat.com>
 <176781cc-75b8-449b-bd56-06d1c25e2276@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <176781cc-75b8-449b-bd56-06d1c25e2276@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.01.25 11:43, Vlastimil Babka wrote:
> On 1/20/25 11:39, David Hildenbrand wrote:
>> On 17.01.25 17:29, Fuad Tabba wrote:
>>> diff --git a/mm/swap.c b/mm/swap.c
>>> index 10decd9dffa1..6f01b56bce13 100644
>>> --- a/mm/swap.c
>>> +++ b/mm/swap.c
>>> @@ -94,6 +94,20 @@ static void page_cache_release(struct folio *folio)
>>>    		unlock_page_lruvec_irqrestore(lruvec, flags);
>>>    }
>>>    
>>> +static void free_typed_folio(struct folio *folio)
>>> +{
>>> +	switch (folio_get_type(folio)) {
>>> +	case PGTY_hugetlb:
>>> +		free_huge_folio(folio);
>>> +		return;
>>> +	case PGTY_offline:
>>> +		/* Nothing to do, it's offline. */
>>> +		return;
>>
>> Please drop the PGTY_offline part for now, it was rather to highlight
>> what could be done.
>>
>> But the real goal will be to not make offline pages
>> use the refcount at all (frozen).
>>
>> If we really want the temporary PGTY_offline change, it should be
>> introduced separately.
>>
>> Apart from that LGTM!
> 
> I gues you mean the WARN_ON_ONCE(1) should be dropped from the default:
> handler as well, right? IIUC offline pages are not not yet frozen so there
> will be warnings otherwise.

If we get offline pages here, it is unexpected and wrong. All users 
clear PG_offline before handing them back to the buddy.

There is one nasty race in virtio-mem code for handling memory offlining 
with PG_offline pages, which we haven't seen so far in practice. See 
virtio_mem_fake_offline_going_offline()->page_ref_dec_and_test() for the 
nasty details. It would only trigger with some weird speculative references.

The proper fix will be do leave the refcount frozen for them, so 
speculative refcount users will just fail.

If we want to tackle that before we can do that, we should do it in a 
separate patch (and not buried in this series).

And I haven't check if the other types are
> frozen (I know slab is, very recently :)

I think if we would have that, we would end up triggering the 
free_pages_prepare()->free_page_is_bad(), because page->_mapcount == 
folio->mapcount would not be -1 for typed folios.

Right now we don't expect folios of specific types to ever get freed (in 
the future, these won't be folios anymore at all -- only guest_memfd and 
hugetlb would be folios, that need special care to be handed back to 
their pool).

-- 
Cheers,

David / dhildenb


