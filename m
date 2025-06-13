Return-Path: <linux-arm-msm+bounces-61276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147FAD9745
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 23:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C41183B9057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EAF28D8C3;
	Fri, 13 Jun 2025 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iaYWExFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218528D828
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749849503; cv=none; b=jrsnthSBVw0VpvTIOxnfnRJX95LUhdJVCCV0goVtYSvc0UYWoGqAoJoyUbviC4f+qJsWL1fqo25Zalqk4EEO7DTYZholzvY2wSwvZLI/B6OcSSgZg77F916sltxcIkBYAYFIy3YNG9jBzteKxXrXSDxf5UcfqnFhk0eSOMRopnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749849503; c=relaxed/simple;
	bh=cjS1R/h5yYqj8F/QZF4nccCyoFcjDNQc4ZKgUarS9ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIWKILf9wq1Y3GN/OpgWDDBUDj2tGzzpdO4X8T2/K95EN19jnNdSNrGG3F4yMoPBWhCMY6nl8cD6lW1xVx54uVbYI6sUnmW0CYXVXBJBoCkxe45RABh+JueggHUGrnLExVaWG3f3xJhI5ubWYNY0Zwk6ACbKob5kfVUi79R5QKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iaYWExFl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749849500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ufscstiQHCbS9G1pdl0dbNIBD2ajGNOtHVKChNRSU3k=;
	b=iaYWExFlo+1/aArpY13XBgLrOvln+vLuP3xXGKw3gN6HrrbJT/pK/tOhYGIkMX/iPqkQlp
	Tdh8prv7Twsn+bqWgA2kxwFukpESO+vUPEXoGHWt/dRUS4N/JOBTqNJIoIhdy35+2Ke995
	gxTPhFw0pDKsD57SdxIVPaBdGLNVQBg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-os9qowASPnKK6_Nl7po5zA-1; Fri, 13 Jun 2025 17:18:18 -0400
X-MC-Unique: os9qowASPnKK6_Nl7po5zA-1
X-Mimecast-MFC-AGG-ID: os9qowASPnKK6_Nl7po5zA_1749849497
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso16567005e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749849497; x=1750454297;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ufscstiQHCbS9G1pdl0dbNIBD2ajGNOtHVKChNRSU3k=;
        b=rmH1Ny+v6SbcCQtlyLuz7HnfKdy3BSwWw5Bvwar+0HJkq4ykAiRMk03E091U3cDXog
         Hl++zHbLGhUAQLQal7GbecXCKIq/BJWmx1qdT18KzFtli7FqCicTF/yr9sNLSUTffazI
         WJ8gd5UpCrKCur5ZRjfX8lOtvWRHhX8XIz8t9pE3y8QSlJXAQT7wpRaDU7+QJrhrZzKU
         d4Jw0mjEQnXf9vi+K7Bcqwupzi5ZeS49ltJMkZxWJlpJWGgDklaCE6cOFjoj1HC5bwp3
         Gz2wq+TIlgf4/FuUvn59nmEhcASVjh371hgliGgJDTpL1Y0XeMaztMRUeI8XY2y5CCie
         /c3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3YdLYUlN5cXF3093Oj+9B3hUMwd2/sis55MZr40Y/ZKVaw2KWikg78FL2YcwEj3RHPQrSaZfET2kyQC4F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpt/5fDKeEQOG1+E/XvCqYhjHkX72MMBQmehYA7IIuAggrGTwy
	KgdJXXcd04ndFmbEwsqVQ2hdD5A023NfEEL9yAmdjvOwqFaKUXmOEEvM9exeSTPaSoo/8w69mvB
	3d40SNfyydq4Q+JzXYuSQ+4+ITtwYBWZH3pKzwpcRKvqSU4YNB/Xkyov3owWZ00AK8Dc=
X-Gm-Gg: ASbGncsf+kj4ASOjRT02uOx7nggxL2VIY1kZlvuyPHwWAt0nAwrjEsJI3rKl19IFlVA
	ijCWVedZJkmueP4onoxzkDDzbA3OjhbyJ/ZG3FMgZSPUZFMtuEXB4VSiWVYqnPKJA/2XUCDDgoh
	3VHScwHq2E6HEUJiQ2bd+QxSUwclgUQRT3YZ9EjtYS9Z73aOP5pFloYQ0tFZLjQtdCnIslbNVpX
	p0rnB75jQbpKoalq3QdnIJ3NxHEoHLnJkd7KxGFZgYaNbI3ufh9pZ2+b3dyd0HJzjPLfYqpTFpH
	CwkdWQKklmcLmYiTC01c0UsHwPno4HAbQhaTUCI3r0QVyBcUNqb6VI2IPADVA35K07aGRxwlDDY
	d6HKLGhv/9g34nTqGYm/xZBEBXnxjvrV4uoMyaEADu2GrlTRhcA==
X-Received: by 2002:a05:600c:8b45:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-4533c92e57bmr12391475e9.10.1749849496959;
        Fri, 13 Jun 2025 14:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOB0FovDmJMWiAczOt+st9w/YGQAhqOEOsMFMcs9zkOeNn6NLpFPp2mWC5LMWJqaHx++tm7w==
X-Received: by 2002:a05:600c:8b45:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-4533c92e57bmr12390675e9.10.1749849496527;
        Fri, 13 Jun 2025 14:18:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e172b03sm63129605e9.36.2025.06.13.14.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 14:18:15 -0700 (PDT)
Message-ID: <09b66a3f-e7f9-43b2-be9a-bbf6310b3c43@redhat.com>
Date: Fri, 13 Jun 2025 23:18:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/18] KVM: guest_memfd: Allow host to map guest_memfd
 pages
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk,
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
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250611133330.1514028-1-tabba@google.com>
 <20250611133330.1514028-9-tabba@google.com> <aEySD5XoxKbkcuEZ@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEySD5XoxKbkcuEZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 23:03, Sean Christopherson wrote:
> On Wed, Jun 11, 2025, Fuad Tabba wrote:
>> This patch enables support for shared memory in guest_memfd, including
> 
> Please don't lead with with "This patch", simply state what changes are being
> made as a command.

Agrred.

> 
>> mapping that memory from host userspace.
> 
>> This functionality is gated by the KVM_GMEM_SHARED_MEM Kconfig option,
>> and enabled for a given instance by the GUEST_MEMFD_FLAG_SUPPORT_SHARED
>> flag at creation time.
> 
> Why?  I can see that from the patch.
> 
> This changelog is way, way, waaay too light on details.

Agreed.

   Sorry for jumping in at
> the 11th hour, but we've spent what, 2 years working on this?

It's late in Germany on a Friday, so I am probably grumpy, but most of 
what you raise (terminology ...) was been discussed plenty of times 
before either during review here or during the upstream calls ... :(

Anyhow, happy for your review feedback on this series at this point, but 
this is just the perfect time to shutdown my computer on a Friday 
evening, knowing we will need another 2 years until this is finally 
upstream if we keep going like that.

(again, sorry to be grumpy, but this is not the stuff I want to be 
reading at the 11th hour)

-- 
Cheers,

David / dhildenb


