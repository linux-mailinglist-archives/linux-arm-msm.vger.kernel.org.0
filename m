Return-Path: <linux-arm-msm+bounces-66303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D1B0F3C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FEC1AA3E44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EA82E889D;
	Wed, 23 Jul 2025 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VtOYgYQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56752E7632
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276427; cv=none; b=KXVqF74B7sr3fOAdwvwzH9GgPzbxEdwMclTZb3JwhOAoagBsxZLvQQ2OIUakfH1Za7vPcTNlEFZ+eXLtruDJ1I4uoVcFI+MOoJYco56ScJP9eQfkJunHA0zZ9KP7RfdDPYp52VmStC+zzi4Ol08FrZ3z/G69JyzameAQBXYCPd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276427; c=relaxed/simple;
	bh=BuVlQiw4YuqhoCqbfyooddTKxtWiLyTZIS234B2Orvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRyqI6Oh4cTGKiOPQZ8e/NIiX2Yym1tKsNeHndx2yQl3nSmmlfuQUs8T6wcmp2zPyOOrKBo+JlYc+NG7sDP+FvHNio4bCmkVOHT2DE8VeB73LRh2pK9Db6rR07whprAifkDjXlJS1QodkHXQC9Lj2l9MzNXbGmPNL249yFs1bKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VtOYgYQY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753276424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WNsTttpzXt7BuB19w//5WAeWR9PeTbGdvwXUZjkwb7o=;
	b=VtOYgYQY28x2A7bSkTwSlx0VXEBeYm6yVLhGBA41qHQqqQvTb1pBQ9/ruJvhPLqaSKJBsI
	idyRoHO62fcQN+HBN0ZE0uvBirznREMLi5oK/mQtm7aRP5GVgkaf1qCowYTj2WxSropID7
	1suu+3Lgvs4SAoeCBdxId9wNcGlZSuA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-X_f3HlEaP-ORv_LAyxM8cA-1; Wed, 23 Jul 2025 09:13:43 -0400
X-MC-Unique: X_f3HlEaP-ORv_LAyxM8cA-1
X-Mimecast-MFC-AGG-ID: X_f3HlEaP-ORv_LAyxM8cA_1753276422
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45626e0d3e1so53839925e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276422; x=1753881222;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WNsTttpzXt7BuB19w//5WAeWR9PeTbGdvwXUZjkwb7o=;
        b=qDdR37GDzMhO5qA5EO5ZAP5nHL5osrEjbJOg1Fs8rioNgxMXaQ5k1cKG3wnLMKgIca
         j1MCjZuHePhie8ZeJzWB+pQEogZtyqj6NYkBGpv53dFmDOMPAMYGFUOz7xdXZr5aNx9B
         iQHo97+Ul8AxE0sPWL8/0vrTpYqPc0e1zzG2LPoIbvc/yIh3H8naYGpnvnzSGAemRICi
         m4+lPerIYD7Wqgsmouor/mPyr3Sf3Yb+hZA84S+cIDIGb9wAM7yHpbIg8b6vX7EQZuHW
         DATzmN8Uv18hQ3WwRjU7vZ61dgstHr6I7c+rpzVlxLKuF452+luuQrQyd5LlQSdm0Hl/
         5lOA==
X-Forwarded-Encrypted: i=1; AJvYcCUFkqFQzvZDZFxOMH43zTUv88GmAUMYzGuHP2PSvmwNUQhWW8uTblAQS3YRQyNYFF4NiByWR+AfrKXW6DFy@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQi8U5STU2B0Hbdv10Wfwim0G0Oj/RbMlN/B7n1vyvvoDrY/h
	pxI3Pvqn9y3iW+KvjQhlbvywpyX+6unz7L7DoePtfliqShb7MozYzNGMyTbthsG/99bqfilWf/h
	3EzCWNvjGkAR/yk/r1tZtNa3UoWujfRtMEGdr7HL2NQjWofq5ptNb6zWudRzQV6tUS84=
X-Gm-Gg: ASbGnctRJJJqp4zj5XogZO2HcjQAILwFdJOzu/ki3PwfzfayXxyoyuHpa35eP2+4YE0
	nKOmJrCiixwwnC/M0sqA5APyei8mM5hmBrh54XDpMn4W5bxn2w2S0P8exwZ2mJ7siH9+Bp0S8YJ
	92TBdvfVF1LzBJvXp1g0GbjpAI0rF0BjzEIquKxF11viYRG9NN6ALOwGRJEXcvzvK5hlbtFZJkI
	HPdaYA2uASITcQDsSYrjuhFAZdxb1Wgsjg/wx64Izc2k9fBL1mdmMU+1GdqQdoKlB7Bg/DRWYoF
	JMGaAjjfBTBUyS7oJejVNp6nTN28MPPZ4oFLTS8gAk82y3wz9vMx296NrPQZNevouR0Mchw9v/e
	0+lG2iMyP5iqBGeq2KUUgydt6sSBGybszzf6Ap7fXFVHyuHPDCp5VHqrXNdjo5j7iXxw=
X-Received: by 2002:a05:600c:6992:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-45869580b01mr25222255e9.18.1753276421890;
        Wed, 23 Jul 2025 06:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwYuDSBLOTHiVj0Wh3MHPmxHxu71mfC5e5j46cSfr2H+W9gY9MEaPOPTTU3x+pnNaIDwBYvQ==
X-Received: by 2002:a05:600c:6992:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-45869580b01mr25221575e9.18.1753276421277;
        Wed, 23 Jul 2025 06:13:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f00:4000:a438:1541:1da1:723a? (p200300d82f004000a43815411da1723a.dip0.t-ipconnect.de. [2003:d8:2f00:4000:a438:1541:1da1:723a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5d266sm16226012f8f.91.2025.07.23.06.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:13:40 -0700 (PDT)
Message-ID: <22b2f715-c64b-4c08-bdf9-10655a7791e2@redhat.com>
Date: Wed, 23 Jul 2025 15:13:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 03/22] KVM: x86: Select KVM_GENERIC_PRIVATE_MEM
 directly from KVM_SW_PROTECTED_VM
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev
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
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250723104714.1674617-1-tabba@google.com>
 <20250723104714.1674617-4-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250723104714.1674617-4-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.07.25 12:46, Fuad Tabba wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Now that KVM_SW_PROTECTED_VM doesn't have a hidden dependency on KVM_X86,
> select KVM_GENERIC_PRIVATE_MEM from within KVM_SW_PROTECTED_VM instead of
> conditionally selecting it from KVM_X86.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


