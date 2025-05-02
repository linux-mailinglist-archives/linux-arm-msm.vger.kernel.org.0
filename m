Return-Path: <linux-arm-msm+bounces-56452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71797AA6AD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 08:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEFB516E583
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7B526563C;
	Fri,  2 May 2025 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7zWZ9fB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B261E260D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168302; cv=none; b=m+hLG7h9xSvjBFPKBAwTdmew+43TkPIOz8CA/RP069GD/U14qHdigCBlsrqGCbXbLfflaYWxm7g9QsAVgwSLKmnub3c4j06L3KAQTQOV3TdQxW4gD0HgHDWX5SY3t0lNeUPbNQPZt1po65rhMOfGHkpW415S0vu+LSFq4HsATg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168302; c=relaxed/simple;
	bh=ftI638hKBNgg3g3jV/MmYoitoAu8daGeJvqD1hgvbLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkGOtzCpLSQuHsTgfUZS5soUoyY9KeQY7K7tAXQPzwhPjuvcTxAKIdUdBEIqnDfzXK0a36rb/yHlIziYmBAZOj/U6WnUyvvmDYdAzdDbLY1A2X8C6ZdJT0oZiChwf6Mhwt6lxu35E2edkdebpsh1u7vjlKJLIIDcTiQfmkqO5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7zWZ9fB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746168300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pKCmDpTJ4WVlMS7YDLhQuB3yJR81LkbOgXdTVmdiHhA=;
	b=H7zWZ9fBViiREtYM3/W0dPLEY1sR7QIsXjTPai8K7Xsv8P+u11svjajojfLcFxLiqzSC9s
	4oozbDH/LYJoUeOElUW3fRtx5gUbG/eDepvTE46LORDHlV0mpi72eIFy1/BDj+dBpKmj/u
	Q9cgPUL5e7DW+HG6ErejtZVse2Asl8Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-zLvrDCSKMC-Dm3tjzhIx2Q-1; Fri, 02 May 2025 02:44:58 -0400
X-MC-Unique: zLvrDCSKMC-Dm3tjzhIx2Q-1
X-Mimecast-MFC-AGG-ID: zLvrDCSKMC-Dm3tjzhIx2Q_1746168297
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c2da64df9so747897f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 23:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746168297; x=1746773097;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pKCmDpTJ4WVlMS7YDLhQuB3yJR81LkbOgXdTVmdiHhA=;
        b=drX+NrNFub2VP4kHoOjiH1yiKyL98kXfiG4w6wHB6NiqDS92co66JteAtV50ku4G4w
         tpY4H2uv2HYMVXXxD9eYQmA9fAnsu4Z7ge1AY73JxtOvyru48YopIBXEt/+OSt863e1i
         wOjC7J5llM5pt4P4uD2P9Mes6/NFVqgU0aSx2gyjbv6oS02iRO3V/PynNhsvpHEBVF18
         OyixStp7AXTewiBoKwKdjflyQUH7jL3WAbny+P2WlZEM7d+t5queNnrlReOWs6n78/No
         6qpBUuh8wCNaizowHPSNr0ZyBg0+B2zzt7agqWYfwAlSNlB1T9PHWb2yOwQGIwjm28VN
         kTWg==
X-Forwarded-Encrypted: i=1; AJvYcCX8fbPpVD3vi3HYWks5IjR6BS4QioDLD65GqbVtANX6mgm7n+jxRNjOlokxbFP+zTx2SNL4AUN/D7eDmfcv@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNtob0CzXsrX4ZY1VY30Bskv6Db6cBmC8bWeI4tLuj08vDEFI
	GMAa5kHkSjaBWvnTA4JDx5pnA1mJc995l7s19HS+5pvgEwtTG9lS8HJkNkcj7YCoFqQSb/RNeZO
	u00t8LI9tohKzVdh0W9Z0P0SnsRF3whl0IEX4eNuQz9uoSsCFaMv/+kHusIS9A5I=
X-Gm-Gg: ASbGncsBXsVQaZJ+RFIZqDE7PCB8/PoP/lw5xipJirsuldepL5yuAjuRrywiodsiat8
	hQcA4BKv7Ci2kdX59gxOepRCNJblE/z6tZWM3A8s943eShBfVyrrkYlG5TBcq7WzRUiB43yBDgB
	qyOKgZ48LzQbIcLRewEJhUBs7LLotwyWvj5XjizjXOMBql9Q2NLypUioICdaSrC9euUJv8yCIap
	IfpWwKOFFMEBOPnNT/Aj+/9WtwTuykfdbFnRxT+JFbB4gHi8WRaEIInjJ/2Nl+cpnL8+N21Qvbu
	S0OTuYTOr38YdMt0PxHJtZTDWL+K0kIaYm/wZ2to6YkrEQtbIZzvs3nVcE+d6yM9Wp8ffsU1NoF
	+7cGRYPeD5jEQ8uAjkM8fyodi3Yi/aZhtLuTHUbw=
X-Received: by 2002:a05:6000:2585:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a099addbe5mr879527f8f.33.1746168297323;
        Thu, 01 May 2025 23:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYkjHJPoTbYUuL3XuwZQ8WpGAioiqU9FtDeqcHoQrYX71WEo+ASp/7gmLpQSMx5lSYrEtEoA==
X-Received: by 2002:a05:6000:2585:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-3a099addbe5mr879468f8f.33.1746168296878;
        Thu, 01 May 2025 23:44:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:d600:afc5:4312:176f:3fb0? (p200300cbc713d600afc54312176f3fb0.dip0.t-ipconnect.de. [2003:cb:c713:d600:afc5:4312:176f:3fb0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3bc0sm1266521f8f.35.2025.05.01.23.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 23:44:56 -0700 (PDT)
Message-ID: <b6355951-5f9d-4ca9-850f-79e767d8caa2@redhat.com>
Date: Fri, 2 May 2025 08:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/13] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
 CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Ira Weiny <ira.weiny@intel.com>, Fuad Tabba <tabba@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
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
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
References: <20250430165655.605595-1-tabba@google.com>
 <20250430165655.605595-3-tabba@google.com>
 <6813b9167661b_2614f12944e@iweiny-mobl.notmuch>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6813b9167661b_2614f12944e@iweiny-mobl.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.05.25 20:10, Ira Weiny wrote:
> Fuad Tabba wrote:
>> The option KVM_GENERIC_PRIVATE_MEM enables populating a GPA range with
>> guest data. Rename it to KVM_GENERIC_GMEM_POPULATE to make its purpose
>> clearer.
> 
> I'm curious what generic means in this name?

That an architecture wants to use the generic version and not provide 
it's own alternative implementation.

We frequently use that term in this context, see GENERIC_IOREMAP as one 
example.

-- 
Cheers,

David / dhildenb


