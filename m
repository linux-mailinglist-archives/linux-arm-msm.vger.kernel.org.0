Return-Path: <linux-arm-msm+bounces-48678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81FA3D8FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F4C188BBD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B2B1F3BBE;
	Thu, 20 Feb 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WIYbUKEj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286411F4614
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051558; cv=none; b=JkRPITFjcP7Sd5CJhVJVTNT7OHEzLMT9LK/J7kx05/mpcUOId1M5i1U2gzEbNxQWD+lyooAk6Eznwkmp+6UGILPBYZ/Ew9l+CiLMkQaa2SExEbcx7BxGKY0MLzJmR8tvfxZtEOywvS6/gOoLsUzh9aBEHh4HNQ3r8Gqb7GSF4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051558; c=relaxed/simple;
	bh=EP4aHE3qZAMM3T6w4C4yxMG64sp1czRxSTXxaD6f3ls=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MO6oHNhlO2ivWckuuMxfqEYwudhdPNbaZg1Oz+i9DweahntHw7yBRQ0awta1HOmiZ3d4gLcGe6gd+vjhcy5OSnfmAJXA8k5czIw8JOGJkFxlDfJlNNzCMeaO6whjEeYplZhMZHR7yBc9/neMn9t09WONFBcguhTFAXIeJY9gLBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WIYbUKEj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740051556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g2+hpRmEKJpV8Uw8EV4hWhvLmshWFRnC6+WjHkDeu1s=;
	b=WIYbUKEjWzOxd9NJMXUaZ+Clo69mOGWqm24BANKANsbqTx96gfP/5CUwDHHUJ68EI4lfRS
	aeX8Tq7KAa0v/adqdi+XfSRLfNlzblf7387RytQv876yg3URYsZOuAqkAIf+WKQ1Oc5LA6
	0j8SADrxbcYeyt44WhoZLYvC4pDnV9Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-HFhoqNRyNPWc5rj6bIiaNQ-1; Thu, 20 Feb 2025 06:39:14 -0500
X-MC-Unique: HFhoqNRyNPWc5rj6bIiaNQ-1
X-Mimecast-MFC-AGG-ID: HFhoqNRyNPWc5rj6bIiaNQ_1740051553
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f4cce15c8so428638f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740051553; x=1740656353;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g2+hpRmEKJpV8Uw8EV4hWhvLmshWFRnC6+WjHkDeu1s=;
        b=lWIhFVkqop8XRt7HZRP/clNS3MCTjcyJCV0R0gVeOFpSYOuQs2KSIKy9UKuIMCTl6l
         cqxyHysnclTwnz4+g5waGnoHOT9yz7yxgL3rYjaSJXC/XoSDZisZxZRsN+J5rZ5RXUKV
         UTpFda7JZ+kf8oZ8nuxlJZSHA+eGrClO8slh3wCQGaxaFoRkrFaPy6nsdPX7yvjoSpcn
         KbZR68iLp+fMugeF0ZmzldLUobswlFcGn8O49BepbVNtHZ2F1VmX2BciqFYgikF9NndW
         ON9kSeyleQl7fQxiABGC3FgMZK0kYCgJZq1LckuC5qtPxFFILFmY69FMQPyXQomk9P/b
         WhlA==
X-Forwarded-Encrypted: i=1; AJvYcCWYV7cgmzAJ4zAD8VVczob99r7cretPGcMETlDddRcU5mGJ23+f/HE1Pnd+fjK1yzLPNnhN4+q/BPJAr8Uu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyay/MEN0FPI3DRD+IOiCfOL1KuP2+tO71xP44GKcr6w14arOxR
	wBS5Gp0fKCPN0FfLYI5oloSDbprypzstTvUgDJ2BtfbUAeh8N01nsgzlMgerYZ5JknsFKR8vyjc
	v8h5XpE1TQSjECODopgIjrzz9e0Q428jwzdlU6/wIIwt1/kM4L3oKa+KhMSNmHQw=
X-Gm-Gg: ASbGncuDb3awfF+/xcjfVZiYSvKn51Pp0VQe8jjTWPCGhg9cYMJdkEHBE2zsXzLsi/n
	eq2OXCtoVN/MH/5XVqAeLJe+LIHSdQ85CPKhPjJS2r9lldNqUP3uE7u3ytvpuuZKpy/2oXdW4eE
	aoAhtQXyBGHgmyZgdUEh7+vpZ7LgXSHxmlhKdWj/+iemhWowMDJoBgyjW3LAMxtj+8aqmOAsPE2
	oxkdbbMa6tNxNeZZNW6tw+QaYM5Bvq/5cIE6AfJhoynnlHdGtUswyqhNaEMezohpLgZIHx9qBlv
	7/5hb6D0+PtOQttYYo31TrXZUJx2DQYEWHM3mIps9YHSxrcd6rUnRowJIe7eaxHNS4V5eMPNDAa
	JPhji/8bTleKDBRikZn/L2avqkMMB8A==
X-Received: by 2002:a5d:6d09:0:b0:38d:e3e2:27c9 with SMTP id ffacd0b85a97d-38f33f37422mr18013605f8f.8.1740051553159;
        Thu, 20 Feb 2025 03:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxLAeWk3fnSX3Nh5KDTZUAdYnSUTHSVFV6TWK4+rv2ne1o+fjYxQXoyzfB+HX/KeT8I0RqDA==
X-Received: by 2002:a5d:6d09:0:b0:38d:e3e2:27c9 with SMTP id ffacd0b85a97d-38f33f37422mr18013450f8f.8.1740051551277;
        Thu, 20 Feb 2025 03:39:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:2000:e44c:bc46:d8d3:be5? (p200300cbc7062000e44cbc46d8d30be5.dip0.t-ipconnect.de. [2003:cb:c706:2000:e44c:bc46:d8d3:be5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a8007easm101290405e9.21.2025.02.20.03.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 03:39:10 -0800 (PST)
Message-ID: <9751bcb1-bbbe-4586-b4bc-2b8f2ca98cc8@redhat.com>
Date: Thu, 20 Feb 2025 12:39:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] KVM: guest_memfd: Add KVM capability to check if
 guest_memfd is shared
From: David Hildenbrand <david@redhat.com>
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
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-5-tabba@google.com>
 <9abf6dd8-919d-44a4-8352-ee350fec8ad3@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9abf6dd8-919d-44a4-8352-ee350fec8ad3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.02.25 12:37, David Hildenbrand wrote:
> On 11.02.25 13:11, Fuad Tabba wrote:
>> Add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which indicates
>> that the VM supports shared memory in guest_memfd, or that the
>> host can create VMs that support shared memory. Supporting shared
>> memory implies that memory can be mapped when shared with the
>> host.
> 
> Was there a good reason to not squash this into the next patch?

Sorry, I was confused, I meant the previous commit, where we essentially 
add the mmap option in the first place.

-- 
Cheers,

David / dhildenb


