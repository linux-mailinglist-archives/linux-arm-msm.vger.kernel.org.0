Return-Path: <linux-arm-msm+bounces-67691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3AB1A32D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17FCF3ACD30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A642673B0;
	Mon,  4 Aug 2025 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NWdc9yak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FCE25F998
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 13:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313987; cv=none; b=GmyiUTQUNWQ+GU5EoeZxFK93YHfYX4jUl+PwgHbYTDSn8rQnyLJiWhZRP9y4fTCjUtnGF8XqaVrxtollxhJ2+J1LoKxAfSfcnsKEolKtklKd0xjhnc/dTsF4Rv2VM7r/K7rCxy4t8QmVrnFDUaEqBFBD2+e30tqvJ30s5D1k9nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313987; c=relaxed/simple;
	bh=xm3ARz2BdVDjm9NU++olW54M724H0oqk6vWXw/ZZufs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJhT10xuLIG2tkrgLIY1kYXGqqldfaduTIGySSCelCFAop3O9EHoRuC1W9pD8WfAAqQZYq1gNry3EUeli12TYV2YjDa77c9u7YHbKf9xSxREMjL7/Z6xe4ty0Hu1RV6OumxieQJhWgFy0dcTKA+N9nG1jXUYeamAkXoQzTlKOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NWdc9yak; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754313985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+syeeiXPEpHAZa1jQ2IGr9bhWKD3RhAUlR/Ct8pq72g=;
	b=NWdc9yak76LZCBqjKeLj7KccNlR2D0oeOzv3LAtq49H47pps65f/lIN1R14jkUCq9hhQ03
	yBz5i8taVVFCNK6l70e0R/1VSuGAGlTh+jj+fJuX+Q0mAjfB94/eQNt+xdWlNmcDdl4bvf
	3yLFU9n/AR4zfOrBPTu4tLPqX3iBbdE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-DIfwsFNCM6y5yAo_7_I_xw-1; Mon, 04 Aug 2025 09:26:21 -0400
X-MC-Unique: DIfwsFNCM6y5yAo_7_I_xw-1
X-Mimecast-MFC-AGG-ID: DIfwsFNCM6y5yAo_7_I_xw_1754313981
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-459e02731a2so1026545e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313981; x=1754918781;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+syeeiXPEpHAZa1jQ2IGr9bhWKD3RhAUlR/Ct8pq72g=;
        b=GKdUo4OEIpODsxIWSK02IzWcLpBoAmTp696UN7/TQ3fbDRvcOGkHsiiWMgSZDEVlKz
         hXr5be9/vyad99jseie+XWf3M0t6RgqSJOGl/+2iyufPcOs07qvZ1emvgzSipiiq7wj9
         Ti0QAH5tj2D59rI+s9bqHe3OeI4PU56pJtF+en7TqlhL0Epm1R3cO/zT6PN67FLyNb1r
         ncTEj2swKk2UgEXpD5PQu54uZROm9MNVOrvXvvEoxEtGfX8GtHukL4eohRSNvWS8f98K
         qye2FNtsgI6wPXtmXUyIuN1vH2YiRJ/eSejucHi0IX/qL9vdMtd3bPz6+4NA4da0fgj/
         hKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXb8ncsDvge7OYJW5eI7BRMMSqL202+aSgwGY++eEXzMr+YSP/ZrMAo5uwC6yhJN0a12MR/kfCV6zW/OEU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5zkgbykegBHb5ADhrs3h3sp/qgS1GqVdhBdBiu7JL52nEXzuC
	3n22VeEsb3KmuYWfDahiO7cNK391yUr61NeUZCAB7IdEIpK8HXscsq7PIoHkXwFtxGERb5OxDE5
	t7hNZI+M8Yjah95uVG912wy748LnHZZymXWlkRJ/2minucdTyzqF+8S+nNkOk+PJlb/Q=
X-Gm-Gg: ASbGnctJOTs9r6+dT9qPaWI3bIG6Ge5cIaL0D1KQFxA3UrH5+Zu6+olWmaOpT834akD
	6EDjsNrTqXs3MeA74M9Xw2QoazSIdXFJkFUTM6+BpmNjj+L1RW2SCghoz7I1VbXS54SYpA7AfGK
	OFELJjx+sw2pEsBjuQgs175yV9djrfNjTpq1pVL6XnamEr02Ajk7Ka5j2tHEeL1JoEKt4YModdO
	YRPX4FHyqzNo7S79woVbDwNQmI6AGwJXxiLQIPFXwUU8zBxezasarfCQBBIVNTHYGJr07OTWiqR
	ILIzfzMTH/D9nUc+dSZb1LfnA4OyeVvIufpXPFf/CJZLl3K1arV8oRV+yvcULlAi9+e/7FzJR0+
	4EDB5s1/mrtjc4+D94D+YdJ35TB1UTEB+87+0BIduqT4caBw+ut8cxCLFY/acds9SgfY=
X-Received: by 2002:a05:600c:4591:b0:459:ddd6:1ca3 with SMTP id 5b1f17b1804b1-459ddd61df8mr20635715e9.0.1754313980548;
        Mon, 04 Aug 2025 06:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzEU2ciW2PAPHvOJPycVzMqjI/w8se0E7GvKwu8THCSgopGYOKxHb1Dfm+Yw30i1TMB/Pz4w==
X-Received: by 2002:a05:600c:4591:b0:459:ddd6:1ca3 with SMTP id 5b1f17b1804b1-459ddd61df8mr20635205e9.0.1754313980022;
        Mon, 04 Aug 2025 06:26:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0e:2c00:d6bb:8859:fbbc:b8a9? (p200300d82f0e2c00d6bb8859fbbcb8a9.dip0.t-ipconnect.de. [2003:d8:2f0e:2c00:d6bb:8859:fbbc:b8a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm15589726f8f.22.2025.08.04.06.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:26:19 -0700 (PDT)
Message-ID: <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
Date: Mon, 4 Aug 2025 15:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAmgsLPQFCRvGjuMACgkQTd4Q
 9wD/g1o0bxAAqYC7gTyGj5rZwvy1VesF6YoQncH0yI79lvXUYOX+Nngko4v4dTlOQvrd/vhb
 02e9FtpA1CxgwdgIPFKIuXvdSyXAp0xXuIuRPQYbgNriQFkaBlHe9mSf8O09J3SCVa/5ezKM
 OLW/OONSV/Fr2VI1wxAYj3/Rb+U6rpzqIQ3Uh/5Rjmla6pTl7Z9/o1zKlVOX1SxVGSrlXhqt
 kwdbjdj/csSzoAbUF/duDuhyEl11/xStm/lBMzVuf3ZhV5SSgLAflLBo4l6mR5RolpPv5wad
 GpYS/hm7HsmEA0PBAPNb5DvZQ7vNaX23FlgylSXyv72UVsObHsu6pT4sfoxvJ5nJxvzGi69U
 s1uryvlAfS6E+D5ULrV35taTwSpcBAh0/RqRbV0mTc57vvAoXofBDcs3Z30IReFS34QSpjvl
 Hxbe7itHGuuhEVM1qmq2U72ezOQ7MzADbwCtn+yGeISQqeFn9QMAZVAkXsc9Wp0SW/WQKb76
 FkSRalBZcc2vXM0VqhFVzTb6iNqYXqVKyuPKwhBunhTt6XnIfhpRgqveCPNIasSX05VQR6/a
 OBHZX3seTikp7A1z9iZIsdtJxB88dGkpeMj6qJ5RLzUsPUVPodEcz1B5aTEbYK6428H8MeLq
 NFPwmknOlDzQNC6RND8Ez7YEhzqvw7263MojcmmPcLelYbfOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCaCwtJQUJG8aPFAAKCRBN3hD3AP+DWlDnD/4k2TW+HyOOOePVm23F5HOhNNd7nNv3
 Vq2cLcW1DteHUdxMO0X+zqrKDHI5hgnE/E2QH9jyV8mB8l/ndElobciaJcbl1cM43vVzPIWn
 01vW62oxUNtEvzLLxGLPTrnMxWdZgxr7ACCWKUnMGE2E8eca0cT2pnIJoQRz242xqe/nYxBB
 /BAK+dsxHIfcQzl88G83oaO7vb7s/cWMYRKOg+WIgp0MJ8DO2IU5JmUtyJB+V3YzzM4cMic3
 bNn8nHjTWw/9+QQ5vg3TXHZ5XMu9mtfw2La3bHJ6AybL0DvEkdGxk6YHqJVEukciLMWDWqQQ
 RtbBhqcprgUxipNvdn9KwNpGciM+hNtM9kf9gt0fjv79l/FiSw6KbCPX9b636GzgNy0Ev2UV
 m00EtcpRXXMlEpbP4V947ufWVK2Mz7RFUfU4+ETDd1scMQDHzrXItryHLZWhopPI4Z+ps0rB
 CQHfSpl+wG4XbJJu1D8/Ww3FsO42TMFrNr2/cmqwuUZ0a0uxrpkNYrsGjkEu7a+9MheyTzcm
 vyU2knz5/stkTN2LKz5REqOe24oRnypjpAfaoxRYXs+F8wml519InWlwCra49IUSxD1hXPxO
 WBe5lqcozu9LpNDH/brVSzHCSb7vjNGvvSVESDuoiHK8gNlf0v+epy5WYd7CGAgODPvDShGN
 g3eXuA==
Organization: Red Hat
In-Reply-To: <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.08.25 15:03, Eugen Hristev wrote:
> 
> 
> On 8/4/25 15:49, David Hildenbrand wrote:
>> On 04.08.25 14:29, Eugen Hristev wrote:
>>>
>>>
>>> On 8/4/25 15:18, David Hildenbrand wrote:
>>>> On 04.08.25 13:06, Eugen Hristev wrote:
>>>>>
>>>>>
>>>>> On 8/4/25 13:54, Michal Hocko wrote:
>>>>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>>>>> [...]
>>>>>>>> Yes, registering after is also an option. Initially this is how I
>>>>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>>>>> here:
>>>>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>>>>
>>>>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>>>>
>>>>>>> I also don't quite like the idea that we must encode here what to include in
>>>>>>> a dump and what not ...
>>>>>>>
>>>>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>>>>> where we e.g., have
>>>>>>>
>>>>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>>>>
>>>>>>> Could we similar have some place where we construct what to dump similarly,
>>>>>>> just not using the current values, but the memory ranges?
>>>>>>
>>>>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>>>>> infrastructure and a list of symbols to get what we need from there?
>>>>>>
>>>>>> In other words the list of symbols to be completely external to the code
>>>>>> that is defining them?
>>>>>
>>>>> Some static symbols are indeed part of kallsyms. But some symbols are
>>>>> not exported, for example patch 20/29, where printk related symbols are
>>>>> not to be exported. Another example is with static variables, like in
>>>>> patch 17/29 , not exported as symbols, but required for the dump.
>>>>> Dynamic memory regions are not have to also be considered, have a look
>>>>> for example at patch 23/29 , where dynamically allocated memory needs to
>>>>> be registered.
>>>>>
>>>>> Do you think that I should move all kallsyms related symbols annotation
>>>>> into a separate place and keep it for the static/dynamic regions in place ?
>>>>
>>>> If you want to use a symbol from kmemdump, then make that symbol
>>>> available to kmemdump.
>>>
>>> That's what I am doing, registering symbols with kmemdump.
>>> Maybe I do not understand what you mean, do you have any suggestion for
>>> the static variables case (symbols not exported) ?
>>
>> Let's use patch #20 as example:
>>
>> What I am thinking is that you would not include "linux/kmemdump.h" and
>> not leak all of that KMEMDUMP_ stuff in all these files/subsystems that
>> couldn't less about kmemdump.
>>
>> Instead of doing
>>
>> static struct printk_ringbuffer printk_rb_dynamic;
>>
>> You'd do
>>
>> struct printk_ringbuffer printk_rb_dynamic;
>>
>> and have it in some header file, from where kmemdump could lookup the
>> address.
>>
>> So you move the logic of what goes into a dump from the subsystems to
>> the kmemdump core.
>>
> 
> That works if the people maintaining these systems agree with it.
> Attempts to export symbols from printk e.g. have been nacked :
> 
>   https://lore.kernel.org/all/20250218-175733-neomutt-senozhatsky@chromium.org/

Do you really need the EXPORT_SYMBOL?

Can't you just not export symbols, building the relevant kmemdump part 
into the core not as a module.

IIRC, kernel/vmcore_info.c is never built as a module, as it also 
accesses non-exported symbols.

> 
> So I am unsure whether just removing the static and adding them into
> header files would be more acceptable.
> 
> Added in CC Cristoph Hellwig and Sergey Senozhatsky maybe they could
> tell us directly whether they like or dislike this approach, as kmemdump
> would be builtin and would not require exports.
> 
> One other thing to mention is the fact that the printk code dynamically
> allocates memory that would need to be registered. There is no mechanism
> for kmemdump to know when this process has been completed (or even if it
> was at all, because it happens on demand in certain conditions).

If we are talking about memblock allocations, they sure are finished at 
the time ... the buddy is up.

So it's just a matter of placing yourself late in the init stage where 
the buddy is already up and running.

I assume dumping any dynamically allocated stuff through the buddy is 
out of the picture for now.

-- 
Cheers,

David / dhildenb


