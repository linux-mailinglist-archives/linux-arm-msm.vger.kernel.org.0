Return-Path: <linux-arm-msm+bounces-23549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122B9120D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 536B31C2143E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 09:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C616F835;
	Fri, 21 Jun 2024 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgjEyf7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC116E88B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962682; cv=none; b=Asw9hwhc2DUM4wznEsk66nHumuNSm3oWlxfBVKmTjO0y8e6O+tzqzunwJg5Ymkdlwye9fokMye/M284fsoldr/Si43JxvjKiN7iyMNf+HKWDyEC9ApEZ3TlvyEyKDW6vFv3+8mvKxBhswgN3oiIlYBBcMy7tDVirap+L/aK6lPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962682; c=relaxed/simple;
	bh=GOU4qk32qxl7SIkiqRtGAlaDHV7DuzTvKrPhjdL+sMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk9IYRV/6yoPzfeAOB3HN5pxn3+mkoo+KN27crcK1rhhLJWPHQJilmn2+S3wk/y0RGObICquD+yRGLgUBtUwvHEF3eZEJO24YaPKpQWmjgYk+lYtUvrQP5HAQExkj1/iXUeCa9HjDLIlKWh9cQoD0ENwDFcypj36nW6YX6Ldq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OgjEyf7k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718962679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PLL2YH8hxxUuEqXI4e8lnc4vw1eQbxr5oabmIbFLqNg=;
	b=OgjEyf7kEo5xs8L4gq9+c1oOL/QqUv7hmpDLJybE9pjXTpOWbKYdvLUg9FhrLLwARMWKIZ
	ZG9r2Z8cIJPDbEEm/U47V46KgtyAXycpPufACWC7sVn6W33h3lF7Hm5SYdLJclfZ20Qdd8
	7zGFj5+Vbd5oFxHKOx9GKVomXDUwLkI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-kVQGazfzN-y0HMkYeh6XLQ-1; Fri, 21 Jun 2024 05:37:54 -0400
X-MC-Unique: kVQGazfzN-y0HMkYeh6XLQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-364b75a8194so885962f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 02:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962673; x=1719567473;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLL2YH8hxxUuEqXI4e8lnc4vw1eQbxr5oabmIbFLqNg=;
        b=QuYtZiMH4ecasy4i6lkxvKcDrczBcZLiY59IGiYrIVaEhuRedzs+9HV6psJbkbyth/
         l2+gF7a2a9PbkjJR5AnpGhiL5SdtRVOvtLBXu39QarVTjaC2v8iedEwLx8K7F3otHK3q
         rx0N9L44DPTbOpl36CI1KOUYo8w8Ydt6Rmau+Pg4ysWeFaK/4MBaescRNJzfnILSR/3L
         5GuW24ipobYX5eKmCb4BdI32HytABW6XDd4Qsn1cs64G1Q0wPTVL6qlzCkd2Te1FvTpQ
         YVLQB7UbS7+cxzukfAxeJAilHcW4LjHbUx6g6hU3nCAgYymtHkl8J3fLQmoJYNaqDVBf
         Nvww==
X-Forwarded-Encrypted: i=1; AJvYcCUJY4proSKiCucvcLQOy/XfL+RAmrfzL5xPV32hxiAc9m7n6gEKQGJ/JXCFSE32mWRExk28Ya6ALB/nUFClQIRDB0B1ljX9cZoilG4fkg==
X-Gm-Message-State: AOJu0Yxx8A/o8foez1bJU69ymV6Tl/UZVPXHlCCjVR41BCMUNcpWhxqi
	eeWCU3/Joqn8xagca43xboYIiSx1MNYnugt/lwV98dY3i4Q66oO3fUoWeXSFePrB8RNBQJB3QpJ
	ETr0VTiMcaMBMO+1C0KKnSWo84m1ldEMP4sFbXT+lKJGRoqCMoikd65q9FAyKWxY=
X-Received: by 2002:a5d:53c3:0:b0:362:def2:3949 with SMTP id ffacd0b85a97d-363175b8d4emr6013259f8f.22.1718962672970;
        Fri, 21 Jun 2024 02:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIwaslunWPup9+1LeojFQz6m53IR+1OX9bq/Q14tOiBhYW6m3YiRS75z6wYCNd3Nd2gcz6lw==
X-Received: by 2002:a5d:53c3:0:b0:362:def2:3949 with SMTP id ffacd0b85a97d-363175b8d4emr6013242f8f.22.1718962672471;
        Fri, 21 Jun 2024 02:37:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c725:e600:4063:2059:fd18:9d65? (p200300cbc725e60040632059fd189d65.dip0.t-ipconnect.de. [2003:cb:c725:e600:4063:2059:fd18:9d65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366d5cbd5bbsm313262f8f.97.2024.06.21.02.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 02:37:52 -0700 (PDT)
Message-ID: <3fc39c4f-d4e6-4f63-96d6-7c24cad16612@redhat.com>
Date: Fri, 21 Jun 2024 11:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
To: Quentin Perret <qperret@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Elliot Berman
 <quic_eberman@quicinc.com>, Fuad Tabba <tabba@google.com>,
 Christoph Hellwig <hch@infradead.org>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, maz@kernel.org, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pbonzini@redhat.com
References: <20240619115135.GE2494510@nvidia.com>
 <ZnOsAEV3GycCcqSX@infradead.org>
 <CA+EHjTxaCxibvGOMPk9Oj5TfQV3J3ZLwXk83oVHuwf8H0Q47sA@mail.gmail.com>
 <20240620135540.GG2494510@nvidia.com>
 <6d7b180a-9f80-43a4-a4cc-fd79a45d7571@redhat.com>
 <20240620142956.GI2494510@nvidia.com>
 <20240620140516768-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240620231814.GO2494510@nvidia.com> <ZnUsmFFslBWZxGIq@google.com>
 <c05f2a97-5863-4da7-bfae-2d6873a62ebe@redhat.com>
 <ZnVG9oZL4GT0uFy_@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZnVG9oZL4GT0uFy_@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.06.24 11:25, Quentin Perret wrote:
> On Friday 21 Jun 2024 at 10:02:08 (+0200), David Hildenbrand wrote:
>> Thanks for the information. IMHO we really should try to find a common
>> ground here, and FOLL_EXCLUSIVE is likely not it :)
> 
> That's OK, IMO at least :-).
> 
>> Thanks for reviving this discussion with your patch set!
>>
>> pKVM is interested in in-place conversion, I believe there are valid use
>> cases for in-place conversion for TDX and friends as well (as discussed, I
>> think that might be a clean way to get huge/gigantic page support in).
>>
>> This implies the option to:
>>
>> 1) Have shared+private memory in guest_memfd
>> 2) Be able to mmap shared parts
>> 3) Be able to convert shared<->private in place
>>
>> and later in my interest
>>
>> 4) Have huge/gigantic page support in guest_memfd with the option of
>>     converting individual subpages
>>
>> We might not want to make use of that model for all of CC -- as you state,
>> sometimes the destructive approach might be better performance wise -- but
>> having that option doesn't sound crazy to me (and maybe would solve real
>> issues as well).
> 
> Cool.
> 
>> After all, the common requirement here is that "private" pages are not
>> mapped/pinned/accessible.
>>
>> Sure, there might be cases like "pKVM can handle access to private pages in
>> user page mappings", "AMD-SNP will not crash the host if writing to private
>> pages" but there are not factors that really make a difference for a common
>> solution.
> 
> Sure, there isn't much value in differentiating on these things. One
> might argue that we could save one mmap() on the private->shared
> conversion path by keeping all of guest_memfd mapped in userspace
> including private memory, but that's most probably not worth the
> effort of re-designing the whole thing just for that, so let's forget
> that.

In a world where we can mmap() the whole (sparse "shared") thing, and 
dynamically map/unmap the shared parts only it would be saving a page 
fault on private->shared conversion, correct.

But that's sounds more like a CC-specific optimization for frequent 
conversions, which we should just ignore initially.

> 
> The ability to handle stage-2 faults in the kernel has implications in
> other places however. It means we don't need to punch holes in the
> kernel linear map when donating memory to a guest for example, even with
> 'crazy' access patterns like load_unaligned_zeropad(). So that's good.
> 
>> private memory: not mapped, not pinned
>> shared memory: maybe mapped, maybe pinned
>> granularity of conversion: single pages
>>
>> Anything I am missing?
> 
> That looks good to me. And as discussed in previous threads, we have the
> ambition of getting page-migration to work, including for private memory,
> mostly to get kcompactd to work better when pVMs are running. Android
> makes extensive use of compaction, and pVMs currently stick out like a
> sore thumb.

Yes, I think migration for compaction has to be supported at some point 
(at least for small pages that can be either private or shared, not a 
mixture), and I suspect we should be able to integrate it with core-mm 
in a not-too-horrible fashion. For example, we do have a non-lru page 
migration infrastructure in place already if the LRU-based one is not a 
good fit.

Memory swapping and all other currently-strictly LRU-based mechanisms 
should be out of scope for now: as Sean says, we don't want to go down 
that path.

> 
> We can trivially implement a hypercall to have pKVM swap a private
> page with another without the guest having to know. The difficulty is
> obviously to hook that in Linux, and I've personally not looked into it
> properly, so that is clearly longer term. We don't want to take anybody
> by surprise if there is a need for some added complexity in guest_memfd
> to support this use-case though. I don't expect folks on the receiving
> end of that to agree to it blindly without knowing _what_ this
> complexity is FWIW. But at least our intentions are clear :-)

Agreed.

-- 
Cheers,

David / dhildenb


