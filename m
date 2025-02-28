Return-Path: <linux-arm-msm+bounces-49874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB12A4A081
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 18:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38EB0176901
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 17:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780001F09BF;
	Fri, 28 Feb 2025 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6A7+l4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6201F4C93
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740764022; cv=none; b=MlyxJLFQGsP7nHx9kI9sKQ/2awNoV5PGFEs4GZWgwSXC1TIY88mwD5X45+mXSNHH59ziDVMiAuOeyLVioLE+Y9FhntaqdNJdHfmwHU0S5yt5CvH9f5XXYXzjx34CR4RY1QI/CZzUzwujze6pnibGL/A1PqeKtiaOIIkdboco9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740764022; c=relaxed/simple;
	bh=J6ySpsRER44hWFy8MRUtHoj22ATqUm6Z8qwYFmNh4nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bL3P4Ry4Lh81YHdED0e0trH/sY6zXDra492ALqe3+OITEOOioFPKJUJ2iEmmWIQkZWoFkBnd1707+bghbauA6JaZs4ESIskP0BBOb2kqNoN0kcoiiys2+wqEiji2NJZbKZdTdlPR9VmVH24uB1twxpQX3/ziauO3UDNNhVq8bIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6A7+l4p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740764019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rhIm+GV5wR4qNBZa95hn2sN5wbAZ6AH9qtkxMEhDsQ4=;
	b=Y6A7+l4pFkbcAdWkZQomvleW7A4r+OBxyGPy3gNjASXXFoKuYBXHNXS+LM19675oz7F30k
	iQ2tuDAmXpqgY6efH2ur07bv4cqylpxx1u8Z3PKxez/tTynftrK7zOlZOgL71FSiNu3KhA
	QwLcOZAW0Esyo6oEC9NxvgHTXKTUOhQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-hughQZ60OkGERIhVHg3vTA-1; Fri, 28 Feb 2025 12:33:37 -0500
X-MC-Unique: hughQZ60OkGERIhVHg3vTA-1
X-Mimecast-MFC-AGG-ID: hughQZ60OkGERIhVHg3vTA_1740764016
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f28a4647eso1141830f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 09:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740764016; x=1741368816;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rhIm+GV5wR4qNBZa95hn2sN5wbAZ6AH9qtkxMEhDsQ4=;
        b=HW/CeMRMcaNV+xcuecYpN9zOpBoNIAlA+NibZY8iKTx4CLzmDLXPjmBTlbl/kt9y+n
         sB2oE1g0f0d7LS07vAc6rfk4aFGvz5Bsj5/p18zHwgc6Hp6Wq34wZ8vX6uhSd9HZwwxj
         vOhuGI4dDc5d6Gf5KdlsC130FoV+S6NuXIf0UGqApIz9KYpGaPX8NpQQqZ2EabgHWQpC
         UdY/aP1tFbIH92c7UD04y4mstTU/11L2tYHQ0G+5p25UV12Hh9CeuImAfAAyQRgm0oaI
         7/prSO2zqQ5JK2Erj6PWoXHORB0UnQch9LEX5A/k6jNQSvGBiEkIjxgSjrWBFBL9XxdK
         TZPA==
X-Forwarded-Encrypted: i=1; AJvYcCVTS8U1+7+Fzn+JB9mrAiaBAkrMHnTmSpG+B1HzzfmDId16K63LiYfDhW9oKcxu3v5dgX+I2og/wa8DtRS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOzUh2NszLAJ/8+UttMoEGEvcXXxivMAKF3/lMoKJmHEEXwqm
	+DbPcxqrvCa0dVNGvKmJvz7bsCFF7jU0sn77X0AVwc+Ina3SMQT66yxYaXAJMD8dDxV97uU4Nyp
	eQO8bqEydcfJAYdLdpf4zwmOxJT0xOHHkIy7R78/ZDfW2QGrDOpCodK6WBB+/UMw=
X-Gm-Gg: ASbGncsMaSJJcBPwr74i5mVp6D8zLH73stn4HT6aAUzf8smsvAgpi9vN4ZoPYJ1rfym
	GHJfjsV7Tzs5S9Jr/Ps2Y7xHzn/VNgBhzrX742K71clTb5qeDMaLWehj5LpxvTVA7k6RoQu/G+O
	39Dc7S46o/ApZ4xzlzLnenrrRuqt3Dm9rFCnE8oDJ5O5QnsUjA8LkDd4IuMwGQc3GbdXFRxyh3m
	A/gzjDGoNNoYuKYEJ3wVefPDOme/rXamYVG3/AfvquVpcb7J8baR/0l0Zn+JKCyVuZMmM3K7MFs
	WHklcZv7JWmeWakWYHrw/T72fEnQlRQ103KINxriXCyjvONd6Ru6nIRrDqk5yjaE+0Ha24l5ErX
	gqRazjxirOxbHSQpxY7lyDFTyoNfyUwtGsydAQdQC7sg=
X-Received: by 2002:a5d:5985:0:b0:390:eb32:3fc1 with SMTP id ffacd0b85a97d-390ec7d1e4bmr3492759f8f.27.1740764015786;
        Fri, 28 Feb 2025 09:33:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5vylgmIhOdS0yeOrDHHY05g8cd4R0FkZYz1HiLyQGuUqSC+rKchsZ2KlnSZrQPEf/sddkGw==
X-Received: by 2002:a5d:5985:0:b0:390:eb32:3fc1 with SMTP id ffacd0b85a97d-390ec7d1e4bmr3492708f8f.27.1740764015297;
        Fri, 28 Feb 2025 09:33:35 -0800 (PST)
Received: from ?IPV6:2003:d8:2f36:d800:164f:7689:99fe:7f58? (p200300d82f36d800164f768999fe7f58.dip0.t-ipconnect.de. [2003:d8:2f36:d800:164f:7689:99fe:7f58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4848252sm5848249f8f.69.2025.02.28.09.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 09:33:34 -0800 (PST)
Message-ID: <5c394c80-bb2b-4f9c-9b76-78b0696fa316@redhat.com>
Date: Fri, 28 Feb 2025 18:33:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] KVM: guest_memfd: Add KVM capability to check if
 guest_memfd is shared
To: Fuad Tabba <tabba@google.com>, Peter Xu <peterx@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
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
References: <20250218172500.807733-1-tabba@google.com>
 <20250218172500.807733-5-tabba@google.com> <Z8HjG9WlE3Djouko@x1.local>
 <CA+EHjTy60QBnJtMeZsVjOypZxUm5KW0r-Hm6_bEN7On0MLmxjw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTy60QBnJtMeZsVjOypZxUm5KW0r-Hm6_bEN7On0MLmxjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.02.25 18:22, Fuad Tabba wrote:
> Hi Peter,
> 
> On Fri, 28 Feb 2025 at 08:24, Peter Xu <peterx@redhat.com> wrote:
>>
>> On Tue, Feb 18, 2025 at 05:24:54PM +0000, Fuad Tabba wrote:
>>> Add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which indicates
>>> that the VM supports shared memory in guest_memfd, or that the
>>> host can create VMs that support shared memory. Supporting shared
>>> memory implies that memory can be mapped when shared with the
>>> host.
>>>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>>   include/uapi/linux/kvm.h | 1 +
>>>   virt/kvm/kvm_main.c      | 4 ++++
>>>   2 files changed, 5 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>>> index 45e6d8fca9b9..117937a895da 100644
>>> --- a/include/uapi/linux/kvm.h
>>> +++ b/include/uapi/linux/kvm.h
>>> @@ -929,6 +929,7 @@ struct kvm_enable_cap {
>>>   #define KVM_CAP_PRE_FAULT_MEMORY 236
>>>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>>>   #define KVM_CAP_X86_GUEST_MODE 238
>>> +#define KVM_CAP_GMEM_SHARED_MEM 239
>>
>> I think SHARED_MEM is ok.  Said that, to me the use case in this series is
>> more about "in-place" rather than "shared".
>>
>> In comparison, what I'm recently looking at is a "more" shared mode of
>> guest-memfd where it works almost like memfd.  So all pages will be shared
>> there.
>>
>> That helps me e.g. for the N:1 kvm binding issue I mentioned in another
>> email (in one of my relies in previous version), in which case I want to
>> enable gmemfd folios to be mapped more than once in a process.
>>
>> That'll work there as long as it's fully shared, because all things can be
>> registered in the old VA way, then there's no need to have N:1 restriction.
>> IOW, gmemfd will still rely on mmu notifier for tearing downs, and the
>> gmem->bindings will always be empty.
>>
>> So if this one would be called "in-place", then I'll have my use case as
>> "shared".
> 
> I understand what you mean. The naming here is to be consistent with
> the rest of the series. I don't really have a strong opinion. It means
> SHARED_IN_PLACE, but then that would be a mouthful. :)

I'll note that Patrick is also driving it in "all shared" mode for his 
direct-map removal series IIRC.

So we would have

a) All private
b) Mixing of private and shared (incl conversion)
c) All shared

"IN_PLACE" might be the wrong angle to look at it.

-- 
Cheers,

David / dhildenb


