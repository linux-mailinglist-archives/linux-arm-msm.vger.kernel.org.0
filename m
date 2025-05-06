Return-Path: <linux-arm-msm+bounces-56960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33CAAC79A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CF28523594
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ECC28003B;
	Tue,  6 May 2025 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VzYhpzvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A26928003A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540921; cv=none; b=JDPD7LmcEB8zP/wfEX2Y0LlZ9D0mQbjuEbfts1tPfAQ0u8zSyl2QlSSA+1OyKGhHLKvJYHk4yyCcFww5SA6wCiHZjt9TajdRByDdNqnYo1D1c5edPml2JSbyigS19ziquKP9IBD82VrQ7cNKhXllkdD6AX8mnguHT6B1ih/31NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540921; c=relaxed/simple;
	bh=KXhLrXstZ270xbaX23H7LhAxp9pzzvl5arekRXqG/50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bn3iozHz/A6KwwdlgfVvRql6EHxwwfKqx9q9qSYlcOUsoXFTrH0Jh7pXW4YnuRLRUj6kOaQy3EHV4RdzxczZtNmazDJ7RkQNOijS2e33O18fCDeab3Jawbi5Y5v+Q90/Ho1VH+COr5ZWr9UduSKgvSPy2y/Wryb4uCzMpSCylAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VzYhpzvD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746540918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4APN7dnMnAt5QkvYolpeUiJNpxoUhPNfZxfp6a9qlkA=;
	b=VzYhpzvDtT1O0MB6TckMCaMvasekBV/z/9EN+jJ/Oa/MucwFjM1EWTT1HPpTf7jBmD2EmT
	4TcXn7f5FZOWXQQ1I+Gqui+DZ1g6nNI8kjfhB+L3CEmEIhznQfeu5UE2kIWFQIz0QXbr1H
	dhCRJBsOyG0VmVSS35zejZBe0cWW6Hk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-Bd-jptmROmKzjbEfAXB6ig-1; Tue, 06 May 2025 10:15:17 -0400
X-MC-Unique: Bd-jptmROmKzjbEfAXB6ig-1
X-Mimecast-MFC-AGG-ID: Bd-jptmROmKzjbEfAXB6ig_1746540916
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so40780105e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 07:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540916; x=1747145716;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4APN7dnMnAt5QkvYolpeUiJNpxoUhPNfZxfp6a9qlkA=;
        b=aRret84Vu61fyUzqrY3nJSmWXrpGSV+vhdXCO6qt60BEaMkPaynusbFioCdVFU6zDs
         Xg0mOwd3QjyfO6n4czvPeT2KyjTWaQlAeAPClKSKu5Wjj44dE42sLQ/4ldpu5w1X/B9E
         Ut9QoU0RDTq2BsT/kxVX8ELZ0n2RrV01+lOoYoIAea984p3LfOiHzaEm4UGJYmdj1/0W
         nyVpoFbF9CeKxGOxOmV7r1pZG3Z6tHj5G0F5EorGEtcB6Dm3kQ6YMK0mD+KIo0dCtd+X
         0pBBptHE0+zl7iHW1ONFxsFlZPNOjXzgC/oGa0Ht6WNx3HkEEp1gmqgslhrjqtQhlW+w
         yLIg==
X-Forwarded-Encrypted: i=1; AJvYcCWu12XOufedsFE0TVX8GlJA9INs4d9U8jxHZ5xUfMS34olOzeKQPKabo2gRwv7hq/m/jG/CR+piRIz/P4cQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJh1K4gtakOw5cv7s5pIiIarqGFxCMABG+kBoTKK72cbChT1Md
	eD7qWqALUaI6TMo8EO7qw8edQ0gS5bc4UBHfASqxkFF5clae8DS8T1kSQFeGjCgYexL0zOyrU5i
	gf6I60JWAzy4vUsWWET+VUToiouv6BgjiP6HzAxNbLLKQ8hV71dEOBQbH9+2p82k=
X-Gm-Gg: ASbGncsU5OLxa7REurrE137C6a9fomOgW3w7jHmud5M4SoKQFjzBGq93Qb6NltxQKVp
	oDExxjUsa8t+8cRnjOlvD8m0Qh9GTKunxiAPa4BiRNKmYivcztYrx84xPyLKjdtL+eAJbBbBaiT
	gjzsh/FmO8y1UKgWJiYdqWj4f0+TsIJein1YrU8Yej+cc+iYnmA8CMhXZI1RTw89ijHMhNNRw50
	+ahLE+/fbU0UBDpDOydaTOhwhORHUEQy/+TM4Jp6JN6V/PrneJugSusuIO+VTQlpy9r2jy4SvVu
	rL41atL8N4zjZ0rRoeU1saTBzHGi5Zul8J7e19d5hP57KstWg5Y=
X-Received: by 2002:a5d:584d:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a0ac3eb15bmr2870801f8f.52.1746540916160;
        Tue, 06 May 2025 07:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgitA+znSrs1vXUCKq97PQplFmwCrP3rkC+yS96yyi2Pokh/Euka5gxglHWGpKYjq6Epu4HA==
X-Received: by 2002:a5d:584d:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a0ac3eb15bmr2870751f8f.52.1746540915674;
        Tue, 06 May 2025 07:15:15 -0700 (PDT)
Received: from ?IPV6:2a01:599:915:8911:b13f:d972:e237:7fe2? ([2a01:599:915:8911:b13f:d972:e237:7fe2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b0f18accsm1745424f8f.41.2025.05.06.07.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:15:15 -0700 (PDT)
Message-ID: <39ea3946-6683-462e-af5d-fe7d28ab7d00@redhat.com>
Date: Tue, 6 May 2025 16:15:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
To: Sean Christopherson <seanjc@google.com>,
 Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>,
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
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com>
 <aBTxJvew1GvSczKY@google.com>
 <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com>
 <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
 <aBlCSGB86cp3B3zn@google.com>
 <CAGtprH8DW-hqxbFdyo+Mg7MddsOAnN+rpLZUOHT-msD+OwCv=Q@mail.gmail.com>
 <CAGtprH9AVUiFsSELhmt4p24fssN2x7sXnUqn39r31GbA0h39Sw@mail.gmail.com>
 <aBoVbJZEcQ2OeXhG@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBoVbJZEcQ2OeXhG@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.05.25 15:58, Sean Christopherson wrote:
> On Mon, May 05, 2025, Vishal Annapurve wrote:
>> On Mon, May 5, 2025 at 10:17 PM Vishal Annapurve <vannapurve@google.com> wrote:
>>>
>>> On Mon, May 5, 2025 at 3:57 PM Sean Christopherson <seanjc@google.com> wrote:
>>>>> ...
>>>>> And not worry about lpage_infor for the time being, until we actually do
>>>>> support larger pages.
>>>>
>>>> I don't want to completely punt on this, because if it gets messy, then I want
>>>> to know now and have a solution in hand, not find out N months from now.
>>>>
>>>> That said, I don't expect it to be difficult.  What we could punt on is
>>>> performance of the lookups, which is the real reason KVM maintains the rather
>>>> expensive disallow_lpage array.
>>>>
>>>> And that said, memslots can only bind to one guest_memfd instance, so I don't
>>>> immediately see any reason why the guest_memfd ioctl() couldn't process the
>>>> slots that are bound to it.  I.e. why not update KVM_LPAGE_MIXED_FLAG from the
>>>> guest_memfd ioctl() instead of from KVM_SET_MEMORY_ATTRIBUTES?
>>>
>>> I am missing the point here to update KVM_LPAGE_MIXED_FLAG for the
>>> scenarios where in-place memory conversion will be supported with
>>> guest_memfd. As guest_memfd support for hugepages comes with the
>>> design that hugepages can't have mixed attributes. i.e. max_order
>>> returned by get_pfn will always have the same attributes for the folio
>>> range.
> 
> Oh, if this will naturally be handled by guest_memfd, then do that.  I was purely
> reacting to David's suggestion to "not worry about lpage_infor for the time being,
> until we actually do support larger pages".
> 
>>> Is your suggestion around using guest_memfd ioctl() to also toggle
>>> memory attributes for the scenarios where guest_memfd instance doesn't
>>> have in-place memory conversion feature enabled?
>>
>> Reading more into your response, I guess your suggestion is about
>> covering different usecases present today and new usecases which may
>> land in future, that rely on kvm_lpage_info for faster lookup. If so,
>> then it should be easy to modify guest_memfd ioctl to update
>> kvm_lpage_info as you suggested.
> 
> Nah, I just missed/forgot that using a single guest_memfd for private and shared
> would naturally need to split the folio and thus this would Just Work.

Yeah, I ignored that fact as well. So essentially, this patch should be 
mostly good for now.

Only kvm_mmu_hugepage_adjust() must be taught to not rely on 
fault->is_private.

Once we support large folios in guest_memfd, only the "alignment" 
consideration might have to be taken into account.

Anything else?

-- 
Cheers,

David / dhildenb


