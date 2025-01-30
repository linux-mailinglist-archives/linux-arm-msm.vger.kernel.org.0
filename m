Return-Path: <linux-arm-msm+bounces-46580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8256CA23241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 17:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB88C16457F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 16:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0F21E9B3F;
	Thu, 30 Jan 2025 16:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOmSf9VV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC9013FEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255822; cv=none; b=hyyRv7FiaNvaKSICNFA5V5lYbvaKtGUkf1hD0Wz7QyQSwazI3tTMrthlvnQvxXIk1DlDfyHRcXV/G4jrZdDkaCqJEnA3Sdc+TNqBUMELMf4jiG2sZU1hOc9vi5AIGudozaB0DpKkF7mdA2ojbLh/qVgdEp8gBQTMv66Bv9dAUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255822; c=relaxed/simple;
	bh=sd6/Kr/W0fj4Tt/V73mGqrB78Z99cuIzf7NoMNqTaA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSJQMjISXnCdExdIlMKC06iihsS5TbOXZ6N/0DUAp+cQkuvBS0LfvEooCdkCArQYJJuOBW50S6XpOMe+KQwFRRaZoW00HqRnV8v3Dw/0U02J0wfPsYGI75yWu2GXx8iLZZAlQSOd/QPf4+bS6B+zDLtQYLw0FnMAznhIzw1F2x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOmSf9VV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738255819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aDuLjl2GAZ7/D8fcAP2LpDCVaOfyiXeWSKBzLYMRsrM=;
	b=FOmSf9VV8FlGvUfVpSlNrnDJ0cx+pYw5sapAiobmw9bEGRhUIiUFO7WFW45sLzV5zVOEK0
	ueYLc6I0UohJ+OH01F9RcNcmIrUUHCDPnh5B9R8fMdBLFlGIwepkvJxO3kvQZ8qYt7wr4s
	LJFoT2pWPg4+oKY2EvWhb7zgsVZOZXA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-shksDcW8M3OUSgF0o1BSdw-1; Thu, 30 Jan 2025 11:50:18 -0500
X-MC-Unique: shksDcW8M3OUSgF0o1BSdw-1
X-Mimecast-MFC-AGG-ID: shksDcW8M3OUSgF0o1BSdw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso4933705e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 08:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255817; x=1738860617;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aDuLjl2GAZ7/D8fcAP2LpDCVaOfyiXeWSKBzLYMRsrM=;
        b=rtdkQuXzazTqYbs8UPrDL7NF8iFN5iE03mbryb846+dG8bjBDpjX2VidbZ1l6PCQD1
         Y1+E0+AOULe5m6yHLcU65GifRZ9o1xGcJMhG2cLJloLvI4Sv7gNYkqaYsUo46S3LeoLF
         mSX5k6RJik6B1HWtSK2tI5+fD9789tCNy9+Dsanqrvm2yEJ/RY+KJAC2Ibi53iCyEuSu
         Y5mw5wzsw7L+Hu6uLkbAuOguvkhYIgiffCnGoBR5faSbgM0OzbdsZ81+b3rD7lAx8Squ
         y3JV31FrdKYnAFJsRKbDsWU7Wdm2FjiACKC65H80dxJmeKAFI+ioKHcdQFAg8Why/Qy6
         tGiw==
X-Forwarded-Encrypted: i=1; AJvYcCVUeywiRZP/S9s7OI+3Rt8hA9sGJfaTwpc3vGS48Zr1aZOH8jHFaKPma3t8wsLt0ftud0jyYEUTubwNrz9o@vger.kernel.org
X-Gm-Message-State: AOJu0Yygq+cnWj3jsnBH2NF3IhZepsDcg6nPdA2/Df5CtFzIsvUPJeuq
	u8pSAmtnwvC/h6gHXwWH2gzkKFDMVuR3jxKi2Er56oeQVSGZoxCHvUxgoafjk73us4wuYj1fOaQ
	RRomb2b3YOTO/QhUpsGeDM36d1ZKILbFejYUdK3V7eKES0fLxOSFMwW1LXL4yzv8=
X-Gm-Gg: ASbGncvqcg7DpLPLw5ghh1LZBvpMGvfg/N0QQuYUKqfkhd/P0PvGm8HwwlEME7y4hAH
	VoU4gqjWTMtbCgtb5+WpK2scQ/byYkLQOloFufOJ97PA1F76N1b4mmohLVFZKk6N8LITVu/Avvj
	GVMZ3k5PJFQT/t0xclyCRc3Xm7iqyTDw5dD1+Qusu6sDX1TZAd9ww6n6A+tvxbaODsk0MMCI+s8
	jhCEXDkZovk1O9jYoEGVem5SWuZNh/sBDvjpBgvZ+uQcS6kFOaSPV0dK7CVA666DYh7mOWwiMKD
	KM9pbKSnVQwhaB0sPYXE6xTpbmZ+N5AX8MHOFjR6Q/UgCHpeLV6rmLGwCzCPvcy5ASKp+UQ2vsU
	gMSZCHWAMa3drsa4L0259aemv2qd3GbaB
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-438dc3ca802mr73784515e9.13.1738255816965;
        Thu, 30 Jan 2025 08:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKH2fW4NSbkO08R90rYpb1d1lZDXWlBjtaOO68yuI6mRQsZM3l8jfnNpqX2ThheKVnCBKblg==
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-438dc3ca802mr73784235e9.13.1738255816572;
        Thu, 30 Jan 2025 08:50:16 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df1esm64941645e9.27.2025.01.30.08.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:50:16 -0800 (PST)
Message-ID: <6810dbdb-1b44-4656-9f65-abca471523f9@redhat.com>
Date: Thu, 30 Jan 2025 17:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/11] KVM: Mapping guest_memfd backed memory at
 the host for software protected VMs
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
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
References: <20250129172320.950523-1-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250129172320.950523-1-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.01.25 18:23, Fuad Tabba wrote:

Thanks for the new version

> Main changes since v1 [1]:
> - Added x86 support for mapping guest_memfd at the host, enabled
>   only for the KVM_X86_SW_PROTECTED_VM type.

Nice!

> - Require setting memslot userspace_addr for guest_memfd slots
>   even if shared, and remove patches that worked around that.
> - Brought in more of the infrastructure from the patch series
>   that allows restricted mapping of guest_memfd backed memory.

Ah, that explains why we see the page_type stuff in here now :)

> - Renamed references to "mappable" -> "shared".
> - Expanded the selftests.
> - Added instructions to test on x86 and arm64 (below).

Very nice!


I assume there is still no page conversion happening -- or is there now 
that the page_stuff thing is in here?

Would be good to spell out what's supported and what's still TBD 
regarding mmap support.

-- 
Cheers,

David / dhildenb


