Return-Path: <linux-arm-msm+bounces-54208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D29CEA87D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987121895A4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1432F25DAE8;
	Mon, 14 Apr 2025 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBMXMQWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A21267AE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625212; cv=none; b=QAadFg/Qfyq60TXmYSfgel43FcYsiytTI7Ueu5sXmJPqxoL+8zAs+cI3D7kwgEkm/n8h7VBvpuaLZkLCgSN8dPTz6sBDF5n+qnmnDjDlA9nV/Sm+5cxL5WZQet/7fJj1+uP6NvTngxSbCoJJSmBeiV5IkSkVx2mt5T07myazS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625212; c=relaxed/simple;
	bh=qyJr3NgQx0jwl4cKCX0gtHhkQXLH7aE4ypHYyEjJAPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHkO4hJ6RMmTDhHz1HVcDr+0ZY8z/AvnT9F/Z2r/Q6e50v76faafndrtSI4ba0MkKGMHdxRxDZMHNkBBA9i8a5R25zO1+jczMwEFnOle5nL7y00+mwTX5sjLxLCdhuhMeJx6DqHqOerYCfn/+jcimflku7fUVynQm6538ijsKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBMXMQWs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744625209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rsaOKRbLinwzJ/zG1+yAYwNgtPa4wninc60N65ZD+qk=;
	b=NBMXMQWsIDypoeDxrti1lXa6mEEszVQz/0L3gldnlEclqV7MOaZGET8e6J5gYX7aWvAyzv
	2LuBgZB3n1mx01Wv1okuCeLzVnFlghtPqU0WLTz+SmlwLdeyOLlEnNsTLNH6WOzAjQgu7L
	4EfFEtw4Nyhfj2DcY62YwiQItnES/yM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-x-jpDjMrPQ2IU4xs_WFECw-1; Mon, 14 Apr 2025 06:06:48 -0400
X-MC-Unique: x-jpDjMrPQ2IU4xs_WFECw-1
X-Mimecast-MFC-AGG-ID: x-jpDjMrPQ2IU4xs_WFECw_1744625207
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39134c762ebso1690836f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625207; x=1745230007;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rsaOKRbLinwzJ/zG1+yAYwNgtPa4wninc60N65ZD+qk=;
        b=Xek2RkoUKyeKmc1DbIjPcpd8657QY5coTCDaDcjQHY2kHPYAlWTUCchikhmAgpzSVk
         UgVNEATrPw3bZv6Dmbx/G8Ru96aXUySlzunmdUu4EArMgvZmzm7rgl0QKPLgnDhPoxT+
         VrLIYpsjkgdrE7yZuJEppktN+RTI8dDp7W8dLSrV4lZlxG1oaO0oXHHDa56I4icpDgCT
         ROyjpPXxANMTbNrWH3+lvk8+3akQFZrOsEjFWPHOHjQKpP6KRlJ0k7ZnLvfP2CYTqB65
         FTh4mmQUPQCZiWnCqrULQKWtt9mDq/A0pDPeajta+6SQSMfN6oR4L4NNNAGpe11RSWw+
         6cnA==
X-Forwarded-Encrypted: i=1; AJvYcCVcJuDwqSkUOx0ElP9puGMQlN7EfXvKFtAWJUIrjtWqlij5osVDG7fvvftRdX+n52r0mdCyWqptMZCXKTJl@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEqGexeMVux4itXlxWz8kTJ5eCgPdIp26HCfJItOeVDfh1hiD
	0USdze+JnPk1UOQ8lwF3AW/m1QiEh8jqI9a04OMCTU8plKYl4D+VjhjW0MHnub7sANClLsrHsdt
	KdnH/U0pnJUGETv73JmzjyoKJxFbSmoABsGQeMax7gdbsQGEARr64O6ASj3XVapU=
X-Gm-Gg: ASbGncstkU2mhfBi5XXw04SJrxDivwdSKHcFr1xwCGmRVFAy1tJM3VILX4xCRHE4PbI
	HyCKpsbtulC1lBVVaibM+JD9A683In4u6hGMzqNzWTNjuT2ybEDGLQm/RpMGd8yJThx256eedel
	ciKmnIOx1fD0eMN79LHWTOx3BzRJK2sgCNttAaE9UK34s9GFBLPET32aawie9divYqr7G++w+Th
	NdvgnbxvxTH/hwMcmeIPveXnM5XXIvsPRsW3qD/W2c8AGSueZQ0Dz5Z5kayNg4lcNw+svMkLQgu
	9kCLa+oA7/oi+ZMdTFVGxUSul5pzlM5xpt6Fqz+EB2vHDwGQDLuS6HUA9GDKUq7PUn04z3Be1Fd
	fvIzLWRxhXICO2aiw56Dc4n2vKVxcpz87HFGIKQ==
X-Received: by 2002:adf:9c92:0:b0:39e:cbf3:2660 with SMTP id ffacd0b85a97d-39ecbf32731mr5109624f8f.3.1744625206605;
        Mon, 14 Apr 2025 03:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GSetFv7QqcuRiqzvlQioSSJQOjvbsN8IClzq+e48YTT/LjIqeg551SakqH4htz6t5IQOkA==
X-Received: by 2002:adf:9c92:0:b0:39e:cbf3:2660 with SMTP id ffacd0b85a97d-39ecbf32731mr5109565f8f.3.1744625206114;
        Mon, 14 Apr 2025 03:06:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9807b7sm10596804f8f.60.2025.04.14.03.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:06:45 -0700 (PDT)
Message-ID: <e3c26b84-5388-43f8-87ed-bee034f327b8@redhat.com>
Date: Mon, 14 Apr 2025 12:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/9] KVM: guest_memfd: Allow host to map guest_memfd()
 pages
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
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
 jthoughton@google.com, peterx@redhat.com
References: <20250318161823.4005529-1-tabba@google.com>
 <20250318161823.4005529-4-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250318161823.4005529-4-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> +	/*
> +	 * Shared folios would not be marked as "guestmem" so far, and we only
> +	 * expect shared folios at this point.
> +	 */
> +	if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}

With that dropped for now

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


