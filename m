Return-Path: <linux-arm-msm+bounces-65250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC9B0767B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8773ADFBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74EF20110B;
	Wed, 16 Jul 2025 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KcWCNS3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF252F2C5A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670756; cv=none; b=J622PD1o2KgYLVabadKg3rB/UywAQo2l4aTqcEVC4N71dkbYnrFltACZWhOd5+o7fd1s95btLAcyCJvnK25LTXGC94AS53khaOcjWz014ntFBjNr91dSlT4O9vQOwxK27CHhpJ7f85e3/ZxyY4f9PCHtlx0Eq1YQnqsE8tmsFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670756; c=relaxed/simple;
	bh=YND42Vrml9Hy0dYuPFdNuU8Q4WUUBZUvslcQGXTRE3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DN0zWLI60kGEW9qpyQBYthIeHCmLSPr2hVPV1x3BpSKoHi1p9PmBrQpcWOMmKwGmU+rXtfcxUJimGMItgUBilh5vvYdQHvxrceqhwi6iaYGVSgUG5qb4/bxus3YUFbkW85PlJ0dRPJ2qz5S3aMeL7OonEfm33X26t1CXl9J65cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KcWCNS3m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752670753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rnCDE0anbzdnU2S3G+A8RzoEp80pmvgzbc0xHwRbxZQ=;
	b=KcWCNS3mjeweXyo+JHy24w2Uv8WPez/cMhG2wne8sAwRlkXJPOdIpi5WTIB384AEkrlxqn
	OWNBzTUHAt6UZaNL8b4t6EzG63iqOD3ebhUPXDBA09GuXX5VTcSU51p/QF5rCuPiKtMnNA
	7BTUFSe7i0O1/UIeuZFvLe3AtIlJVXQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-fX5F3I00OxuOeC40n2smyA-1; Wed, 16 Jul 2025 08:59:10 -0400
X-MC-Unique: fX5F3I00OxuOeC40n2smyA-1
X-Mimecast-MFC-AGG-ID: fX5F3I00OxuOeC40n2smyA_1752670750
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-456175dba68so26726975e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 05:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752670749; x=1753275549;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rnCDE0anbzdnU2S3G+A8RzoEp80pmvgzbc0xHwRbxZQ=;
        b=KKVMlpQ9bC/7JjzWZewpHjp2l3/g27MlNAeUWCHVivWQqSlfg0L8KRcLJw/pIFPObN
         VXqFfzajopfU7qDYJ2j1GHerNiNK2UgDl1F264z7/rba2iFOLwd5Pto0m51mFcNULWDO
         +ko9YThrHvIus5/WC993icTYrCySS5EfK/qYkxVs2yQfj5dhRK5hU5l5tnLPXHCdatau
         UDHpztIfNRFqCStorsByWnZNCw3CfmOJYXY1fSRdmAAbVUnJRSYIJoxdUMcY625fMf5Z
         IbxdXpUofehNGpDDBVDcL3UPD65/fYxx4+t2o42iNP3B+JIkeUAPTjKdbD3KtHmq4TxP
         1Ujw==
X-Forwarded-Encrypted: i=1; AJvYcCVKOX2eL+xOUTkEkXJpJSjiMcLPbjeW5JEDjyni+Xu6i6Kcy9AWX20pK3yHz7HtR9yqGwmxB0WRBFU5Dx6h@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7im/T5Wwv+CfEsJXMksTQcDHDXoSpJA+2Rps3Zm60K7KduePl
	E/7TOX3DtwBR1iIALU/i/8OJMd/E+Ry9CYcN1doX4Jge/isghxSL4OtDZ2/zFmW1he6GmG0cKkI
	WOVxnhxSwcLtDXCh2x07X9adFemERxRQB+gc9RUtJUsGrEKp21lVOiv1z+5BM+Hn0w5o=
X-Gm-Gg: ASbGnctSOABPwTaN4HNgY994/KriY6U6O/a+KD7FZufzGYaZyZRdrVmBjZxtPFwizkx
	4ea6+OjSoPUmgWgWz15nYD4AhCQC+vztIl7y6oS8vdLEaDqTMssli/g1QCItBVwJFSf3Qk/mFcT
	8vfrv8mp1IEZLKcd1b2CDAlVIzHv/T02b20XhpurxtuWI3+6KcX/ayYaFXuidwfaWMi87d/0tSK
	Unfgzq0AP+WE0f8vNyEixcpgQV1wiG7VMhmQdQjqs4OCS6xCdk+Lvy9QpbMjko6AueOJfvHQMso
	eacJks01kRfxDmz1HiPZHhoZRDR856/qlS3tHeHxFt+hHEe5XcdLN6adjFefRRNCOrqmBivL+mq
	TrTUXARu8IjquTIGCnZG261lbcry1jI6eHyGUbD5sZms2JMcHqhTN2WCKsGl6vDfb030=
X-Received: by 2002:a05:6000:5c6:b0:3b4:6577:eed5 with SMTP id ffacd0b85a97d-3b60e4b832bmr2075942f8f.12.1752670749494;
        Wed, 16 Jul 2025 05:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2OumeF8pXJTw7hPAH637uxvFFCphsEHA97i1WmtyqjORn/g2E3/6ECNcvlxeyQKntUVeaPg==
X-Received: by 2002:a05:6000:5c6:b0:3b4:6577:eed5 with SMTP id ffacd0b85a97d-3b60e4b832bmr2075898f8f.12.1752670749026;
        Wed, 16 Jul 2025 05:59:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:ed00:1769:dd7c:7208:eb33? (p200300d82f1ded001769dd7c7208eb33.dip0.t-ipconnect.de. [2003:d8:2f1d:ed00:1769:dd7c:7208:eb33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc9298sm17777986f8f.44.2025.07.16.05.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 05:59:08 -0700 (PDT)
Message-ID: <b827234f-2e46-4bb1-ba58-225c222cda42@redhat.com>
Date: Wed, 16 Jul 2025 14:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
 CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Fuad Tabba <tabba@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org,
 mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
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
References: <20250715093350.2584932-1-tabba@google.com>
 <20250715093350.2584932-3-tabba@google.com>
 <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com>
 <CA+EHjTy5zUJt5n5N1tRyHUQN6-P6CPqyC7+6Zqhokx-3=mvx+A@mail.gmail.com>
 <418ddbbd-c25e-4047-9317-c05735e02807@intel.com>
 <778ca011-1b2f-4818-80c6-ac597809ec77@redhat.com>
 <6927a67b-cd2e-45f1-8e6b-019df7a7417e@intel.com>
 <CA+EHjTz7C4WgS2-Dw0gywHy+zguSNXKToukPiRfsdiY8+Eq6KA@mail.gmail.com>
 <47395660-79ad-4d22-87b0-c5bf891f708c@redhat.com>
 <fa1ccce7-40d3-45d2-9865-524f4b187963@intel.com>
 <f7a54cc4-1017-4e32-85b8-cf74237db935@redhat.com>
 <CA+EHjTzOqCpcaNU4caddh6N3bCO0GvrOoZ+rMApdRh4=+BEXNA@mail.gmail.com>
 <c8b74572-3ed3-4a93-8433-1207e59f56e7@intel.com>
 <CA+EHjTzjxGqkaUkGvsUn+GXgKxUh3nsajRSbVmOszsLcAqVzcA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <CA+EHjTzjxGqkaUkGvsUn+GXgKxUh3nsajRSbVmOszsLcAqVzcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.25 14:54, Fuad Tabba wrote:
> Hi Xiaoyao,
> 
> <snip>
>> Not really the same result.
>>
>> The two-step patches I proposed doesn't produce the below thing of this
>> original patch. It doesn't make sense to select
>> KVM_GENERIC_GMEM_POPULATE for KVM_SW_PROTECTED_VM from the name.
> 
> I think I see where you're going. That said, other than in the
> configuration files, in all the actual code, the purpose of
> KVM_GENERIC_PRIVATE_MEMis to guard  kvm_gmem_populate(). So
> I disagree with you, and I think that this should be one patch that
> fixes the name. That said, I agree with you regarding:
> 
> -       select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
> +       select KVM_GENERIC_MEMORY_ATTRIBUTES if KVM_SW_PROTECTED_VM
> +       select KVM_GMEM if KVM_SW_PROTECTED_VM

Yeah, KVM_SW_PROTECTED_VM doesn't need the populate function.

-- 
Cheers,

David / dhildenb


