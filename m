Return-Path: <linux-arm-msm+bounces-45991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A2A1A58E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C131637E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 14:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462C120F09C;
	Thu, 23 Jan 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hE64tbS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9520E711
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641745; cv=none; b=eV3Khl70RuJchUP6m9xHNZEt2bkMbeiL2V5neAmtjd3TEe5PpSGybAjiGzUxVofCGHoD25SD3cbKrFnnty7R4PlqyaSMxUpw08+nzH2M1hD0oJmB8+CUCD+CvVhXuJv5VEDJ1185Uzn5OJyiIzSgU9k46yZGldnwo5MQSaPPTms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641745; c=relaxed/simple;
	bh=j/jQWP3jevXbvE1wR+V6hZa7c8QKp3Zc7S35t/vecls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDoWErQiJKvF/G5OX9ZrpkP35e/ShGtD5Xr9V1f3anEs7wRjxdPivkqxGYu5xzyyuUspPyNH6JBj0YR62PIGGjFGv/XnsM7xbZDrz8nFlABCcgAn22yZuRaaYTGGD0dZ/3CpZGln6CYKWCRPqROu8Yq/9mUPXN0vFv3NWU/3h9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hE64tbS2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737641742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wrx1YQaV4jHrUT1GhyIwTMPOmbXf+GTlJTfZ94QWVzg=;
	b=hE64tbS2Uy9gKbpKcA/baPUMF7oh4FCAUfmPoeD1Rz3ySc5JsuPg0hwe6oxbkIAXaTvdsw
	1aIAKiJVg1ntLZZPgnJx1UpxVhl1WVGXj9Ue2GxuSzTrDHPnmEcjVZ4RTySWRoyxbXfG4f
	Z9mZocfFaS2r0Yi/rtgBG4olQ2osuqA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-tyclnSJHPXuRnNCDZzVxDQ-1; Thu, 23 Jan 2025 09:15:40 -0500
X-MC-Unique: tyclnSJHPXuRnNCDZzVxDQ-1
X-Mimecast-MFC-AGG-ID: tyclnSJHPXuRnNCDZzVxDQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab39f65dc10so102544166b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 06:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641739; x=1738246539;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wrx1YQaV4jHrUT1GhyIwTMPOmbXf+GTlJTfZ94QWVzg=;
        b=HY2rKsNTR7ZXHMCSwWwUdOIaeVuW6ICp2WgDwRZaNgsXgktp9iQPL09a26/yT7miH8
         tA7gzZd4+lZ/K9adWiZZWjEePqqEVwA3hQ+IY/Ksb/K+hPEDeXQQawNOrzfrH36PGrrQ
         m1f6adXTaOww0kALe8KOJ3/0rpcC6ZhoY8qqTT2jql+rl7bO3nRGLZ0VNvciSNt1aF7W
         U8mI/wRIhpQquJxnECXcz+bxdMFiSEHGjsoA7lVaEAICeT3xpqk1dOVLbnj4XUuqipYn
         9IghWKx+hkpCYh7rn3emAB8yMvWx7NdqNPyhyuDIF/g3cel91BeGCOlWJ4f2OSoSrDrV
         jgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJV3Iy+qIaliUZVIn6lhcbQ0fjcQ+hTOiRK6639ZbYvYhgpx7mUfaptI9TJSQo2RSuMEoBHAApQMJU5bkv@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXYw8JSB379MV/yPwjLZLwtiirAwiz8qMICzACQjkXx8TU67/
	Uhsx1J+VPl/F5KCI0ZyGJ3uAqsPGAAAEdFAb8hZ9DzjndL61PpIwaWLHtNWenesHEaKvruXnJrD
	cMnwKc61cYhmKpkTEKOiFXe8JaPc4TOMsUZ+q/dIugyGe2FCn8b8rjzJhtaj7dmI=
X-Gm-Gg: ASbGncs3jxzLaAisAR41si+mAO82RduAg2mpj9nqmNCD+WKIGMZpLwlq+C/ruhqFZxU
	Nk7+VFyvX9tlnrHaLksl0iSq8msU8Y1NkSAF8fL8K7tZ5nv0atuJC+ZbhwP900bZjalXvUJDnEE
	+3BBOJpCDaRVKQ4pKyC/stZ3n9IxfiANSJ4z3pDqNqGelGpm6IbB0v4Gxcs83hIX098ZbYdMBEr
	f2iSdcJQRW6eVqDJLKvX0yIze3ts2re/P3ISsILFwxRAQG8C7F36x0xQtm/8+E64RzVcfGuXk3v
	WkKJrPNDnZJy/G2Lgy8+Greeb8rv0TWqC2muVGguK0P66A22RgqkVGecJGx2RnEV4WhLNCbxJSC
	rqn4ArTJen95ijtnjUe6g6Q==
X-Received: by 2002:a17:907:1ca8:b0:aaf:ab71:bf79 with SMTP id a640c23a62f3a-ab38b11281cmr2086878966b.19.1737641739549;
        Thu, 23 Jan 2025 06:15:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcTUAuhVq/2s4i9/2RbGuCuGUVrgeqSO8BAAm2hdqg4twU0s2Aq/JfxjSXVgW37YmagHr1yw==
X-Received: by 2002:a17:907:1ca8:b0:aaf:ab71:bf79 with SMTP id a640c23a62f3a-ab38b11281cmr2086872966b.19.1737641739076;
        Thu, 23 Jan 2025 06:15:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d? (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de. [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f290a9sm1081240066b.101.2025.01.23.06.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 06:15:37 -0800 (PST)
Message-ID: <12286d1d-7671-4c0f-bede-53524ed94f0e@redhat.com>
Date: Thu, 23 Jan 2025 15:15:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/9] KVM: guest_memfd: Add guest_memfd support to
 kvm_(read|/write)_guest_page()
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
 <20250122152738.1173160-3-tabba@google.com>
 <e6ea48d2-959f-4fbb-a170-0beaaf37f867@redhat.com>
 <CA+EHjTxNEoQ3MtZPi603=366vxt=SmBwetS4mFkvTK2r6u=UHw@mail.gmail.com>
 <82d8d3a3-6f06-4904-9d94-6f92bba89dbc@redhat.com>
 <CA+EHjTzZoGuUcZTNUzx2e3PNOOEtOJT5rUEhSSmYQ-kcoZQiYQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTzZoGuUcZTNUzx2e3PNOOEtOJT5rUEhSSmYQ-kcoZQiYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> One interesting question is: when would you want shared memory in
>> guest_memfd and *not* provide it as part of the same memslot.
>>
> 
> My original thinking wasn't that we wouldn't _want_ to, rather that we
> don't _need_ to. I mistakenly thought that it would simplify things,
> but, especially after this discussion, I now realize that it makes
> things more complicated instead.

Right, and it's not off the table: we could always add support for this 
"no mmaped shared guest_memfd" memory later if there is good reason to 
have it.

-- 
Cheers,

David / dhildenb


