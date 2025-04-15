Return-Path: <linux-arm-msm+bounces-54446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E625A8A54D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 19:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D36883A0FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 17:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4E821C9E9;
	Tue, 15 Apr 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLOmJoYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E69178372
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737793; cv=none; b=F99+oSVNEQRRwdCARShhqfCSAZLdwU0TUTYjtUxlopzIL5KRDPbpzLmCf5zswJz56dU8aYt0rT1HxjhSN1zBGiJMIe2XfyXNVHkxitm2sjmY3k6itKMKxJCPkj2Bz8tGYx0aXZj0SrRZS2Lq3cpllB1Gsiuiz1tzcAkBGLpPo3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737793; c=relaxed/simple;
	bh=Y1JUWPISlkJt8B//Qod84czkkX1C5W9WGafAlty3jgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgRcJSHWx+OYT4FhRPU2mblIosuoeSuaXlNogyGAt+TJyDrYA9WVXx/s9YczSm7k5NjOccncN4tjkksefvoVa2GRS5OC6vbzAq37lulUKVk/Twd/wHzx97zBC+g61obTPNo3tSPLE8aQZcfDjM8g4rGlk7MjSCbGYF/bjGjNxe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLOmJoYF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744737790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bhSV341q24aO8EQtF4O9ohvrxfGYa7rxKYrPlGIJdUg=;
	b=bLOmJoYFdAYfwEg12nM1QDZ8aicULeyptngTWLeIP+FtOVeirCQ+ouZuy9I3ByFhmGEAMR
	CnE75EZD6SssP1j1efYJaOjAzYl1jtgwj5rAG79lBFcKF3PONmWXb1MC9z/TIxoZfzQ9eS
	pnSY8u2Y3CBjZupOiPTXQPRSeNLHBJY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-CwAGNd3nNzWd9oUKvCRjkg-1; Tue, 15 Apr 2025 13:23:09 -0400
X-MC-Unique: CwAGNd3nNzWd9oUKvCRjkg-1
X-Mimecast-MFC-AGG-ID: CwAGNd3nNzWd9oUKvCRjkg_1744737787
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cec217977so34857425e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737787; x=1745342587;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bhSV341q24aO8EQtF4O9ohvrxfGYa7rxKYrPlGIJdUg=;
        b=oUtI3tXaqD0rRmUrx4S6hzHSJ5HJMMmVW/Fy1bi9muBcl/GcyJsCpfS+/ENlC1zRz/
         C6UZ9n2Yxs05TQy19qm7B6iMliRMcJ/NP2uZJKLsmErBOPfDnNo4uytt1EH6B762KRsp
         xvUXQLfGk++eizSnINl9RuN30X0EkRMS8HXpejRyv39wwYMAaBhPChmLpPpeZguxUZ1e
         umQn96yrFQwCIw2cIj3nbbODfEQqJgrMtLLwuXLQuEIxKf8w4QBIuVfVx63nTpGaUohW
         UHIbmwXqr3Z8iPhoYSRBO3tsBwj+K2x9ut0znWuqWOtGjS08Jzy94p4wgKOXSJUTxqX1
         0d2w==
X-Forwarded-Encrypted: i=1; AJvYcCXNgnB/Cm2uFdRNwLPoo/VnNfr9W/vLhPewzTAZDfDlHQ5bU8J6W93TZOitczsXJmhUjFWMH3GMf/gnqbpE@vger.kernel.org
X-Gm-Message-State: AOJu0YxkrE2Hiw07zJndHAjsseUaEtFJ6Z9CT0ljaxNXgaQL7HIJqXl1
	nCY+/OsuzDklUJOZj3LZH/NoRluUt0y6l13v/Nfq6R8fd3YxOR8jn4WJzTzhLcyQ3tSNqi+RcIj
	Z7Fr7oCsMF2OuIME6Sbj7a/COEvLhphi2l1NjfNghpC3AJp9gb+YpQzKHmbIp014=
X-Gm-Gg: ASbGncurpNc3mRaC1P0wyriyNwa0ooW3VEOVIhvxygO9ljG2MSwc32Q65HE7xdglEFp
	jTNntmj7PMMy2TQSYN12iZG/Yv7VuROvGXxRDd7j0L/B2D9MzHgZjd3oNO2d8czyuo2Wua9Jnvp
	GGYMHncYBbccN//RXieAcU2pdESZdxlwBk27rDDoYzhzPE19M7/Uhl+Cy1HG3DmVjqP7sFjPlVj
	cGrQh7h+vUF04PXCwdIt8BcblnbdNTsE0NfJIULsCLtaLJgsFnZAiza18gQ5Dy+TJupZNN5yHQ3
	mJ7nLzNNpz0C1btsQSi0EH+PW3yKTlOtl2M31XxlfVwI5B0ED0ZG44LMimKgVeYOLUGnFxbCTWr
	FetMTdr0lYxTLwPKjrZRNxnwvss2Gp2DGg4I91g==
X-Received: by 2002:a05:6000:18a8:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-39ee272a150mr306323f8f.9.1744737787142;
        Tue, 15 Apr 2025 10:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4OtdBioxAO9IjozxlQnFj1BS+sjgx5ZDKW2N/G7FZqybmVgYzyJbmNYE8JRuotcchKYMdqA==
X-Received: by 2002:a05:6000:18a8:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-39ee272a150mr306300f8f.9.1744737786686;
        Tue, 15 Apr 2025 10:23:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963fccsm14758626f8f.3.2025.04.15.10.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 10:23:05 -0700 (PDT)
Message-ID: <497af7b4-3884-499d-88e2-2b0053ccecaf@redhat.com>
Date: Tue, 15 Apr 2025 19:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] KVM: guest_memfd: Handle in-place shared memory as
 guest_memfd backed memory
To: Fuad Tabba <tabba@google.com>
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
 jthoughton@google.com, peterx@redhat.com
References: <20250318161823.4005529-1-tabba@google.com>
 <20250318161823.4005529-5-tabba@google.com>
 <8ebc66ae-5f37-44c0-884b-564a65467fe4@redhat.com>
 <CA+EHjTwjShH8vw-YsSmPk0yNY3akLFT3R9COtWLVgLozT_G7nA@mail.gmail.com>
 <103b8afc-96e3-4a04-b36c-9a8154296426@redhat.com>
 <CA+EHjTxuAE1N3NOngNGfZYxPb1AJPmrUR5vhHpv353YUjEgfRg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+EHjTxuAE1N3NOngNGfZYxPb1AJPmrUR5vhHpv353YUjEgfRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> ... and ideally it would be part of this series. After all, this series
>> shrunk a bit :)
> 
> True, although Ackerley is working hard on adding more things on top
> (mainly selftests though) :) That said, having multiple series
> floating around was clearly not the way to go. So yes, this will be
> part of this series.
> 
>> Feel free to use my commits when helpful: they are still missing
>> descriptions and probably have other issues. Feel free to turn my SOB
>> into a Co-developed-by+SOB and make yourself the author.
>>
>> Alternatively, let me know and I can polish them up and we can discuss
>> what you have in mind (either here or elsewhere).
>>
>> I'd suggest we go full-steam on this series to finally get it over the
>> finish line :)
> 
> Sure. I can take it over from here and bug you whenever I have any questions :)

Just let me know if I can be of any help (privately, or on the list).

This has very high priority now for me :)

-- 
Cheers,

David / dhildenb


