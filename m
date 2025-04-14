Return-Path: <linux-arm-msm+bounces-54204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA3A87CAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54D4C172BAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F5517A2EF;
	Mon, 14 Apr 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+5TyIdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0AF18C32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624825; cv=none; b=AEmFcY96eEW1nYK43n8/7uSXZTGObRVnev3BEAByImfrMffkoyyqlpWn+2iVPGAJu9VZlnf9MX6fRhFdEqqiDlcP5tZstDxkqvWvbUkFO+W4n/LpyvvGTNwNJN7Q+xjdWjyNj0kDw9ZIAc7EnhHvhs9w5YUqJLAQuGcx9dWK1J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624825; c=relaxed/simple;
	bh=E2ulgG8qf7wPn46Y2lAa5uVy4QqnKmHl6sR0Ix0GsYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXDvnwDW2OlofyO1lskR5EUHYxBQYlNHvHWeALOKE0qB3dlWjx2oO06W+UL1n5muvDHt9jGFm0i3osuySDMMJtEWlAdh0OLsWFEF8EU8eEFi8oUyQprB7c5aDJ4pktI7KLd3qSbiu0AcO0U2ohGtPrnatll47V3MUPxRkVudmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+5TyIdX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744624822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L4Idrt5jhlWOKQwE/zTHaJzLfRmeFRmEybrkysjcruE=;
	b=U+5TyIdXguZSZZfX0OEaZGOna/BQemmMIXgzVCycpM676IbQ6IL4v9oWKfRt3vI19OcuAK
	K5KwQw4Ze55wVEhsKpwJUQ2ZoGTj4b2AB6sLBn3nwc6Hd85iMNoJqsCpWWjwwuulMIA0xk
	kvJ5vv51TXCp0l7mR1rhs/Ds2SNSK34=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-sJs7J9ceMLWSYu6w_BB-Iw-1; Mon, 14 Apr 2025 06:00:21 -0400
X-MC-Unique: sJs7J9ceMLWSYu6w_BB-Iw-1
X-Mimecast-MFC-AGG-ID: sJs7J9ceMLWSYu6w_BB-Iw_1744624820
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so27923845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624820; x=1745229620;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L4Idrt5jhlWOKQwE/zTHaJzLfRmeFRmEybrkysjcruE=;
        b=YP2XawZV0Jmpa+hcI8PkL6mmkvhIWXjwClL4azm3d0vCnxa/BBEQrqyCJ6OGkG9LNY
         ciP5pDAZFMicBlYnYFFjo9ComhiXI39UKy6vBG6rcERbw0N0iYG4mEV69G5ti+zPZ7bN
         +LMNpInOA6nL9KSzM0aEXETCR04/azxSXTrtJTv/CwwU1YhQDu9GLZyFY8fNbbUJepJI
         aj+SU/X15cWrWsNR0a2P6wSXx44qo0D5/mS8XOWjCCBt0HZH17vWxRL/On9FMKKmPU2V
         Xo1n7ugiU67LIoDx2bDRdorcHMaGMQZ4DTlZEI0u2dE3HSjU+Zd2hIB6ldOrEOHSY/xZ
         KLpw==
X-Forwarded-Encrypted: i=1; AJvYcCXOgJbh9M+mtmhjWCzmUnqMKHMXI9On9z0GPAOqFs9YrNMAJFqG5N1DVc2viRmMv5vM3YYOEDsaL11X+U9K@vger.kernel.org
X-Gm-Message-State: AOJu0YziY5Hr3CTHm9tadh5zAYH4xDsi38B6X64y//RdOH5u07QbNJKc
	WPcehKaptemxaziOrdITNis0VfTJViF4wYowCExp3hXpAY0B/MqAo/arflLkIcMfYGQ85dOyoW7
	Y5Zt4nieSo2VUbGb/p2YKg3NoyTeVbCiNUm8mMGD/aLpZmTV0/Jx8fivdpsc6T0A=
X-Gm-Gg: ASbGncsd+7+NeaCS53LsLoweNpgGCE2GbdNdc8F1Gby3MjI2clX0VNMeW3nIKFhzp7o
	HnFbuHGGXo6Rv/lZerzcZi07cPv9NQ1ZpEVc0J1vas+yB+deTAgzkBNif1oqEca0tVRMca0VAVq
	LUOBuS/GTPMsG0fHDHpvFLsAB0m2oosWc9RJ+TCUAmh1XqBLQK+1IgqREB/yfrEXCq86r0XbiN4
	ylVnDjXP0IyuGSi2ONWsTn/JDcmmsuV1IQXrW6Ff/sAEovKyFo+5AZ8MmR5jbYo5udRps7GKKql
	6bjh6X+ub55gqphshI3HhOIWBFKkKn4qw0n/kGfVr0tTf75j5cGon//ERUjtT2m2Xl1ob48STie
	dRClBpxPd7aUehYsKW7tdCOQltepLN8WJl12CLg==
X-Received: by 2002:a05:600c:3b10:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-43f3a9aafafmr81664035e9.23.1744624819878;
        Mon, 14 Apr 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyhYzyPNehTd4v1p4+Sh2300WZZI+TtxBPATJRETBckgmoME/MwenniNO9Zxg98EcULt2d5A==
X-Received: by 2002:a05:600c:3b10:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-43f3a9aafafmr81663625e9.23.1744624819297;
        Mon, 14 Apr 2025 03:00:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cc72sm10766875f8f.67.2025.04.14.03.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:00:18 -0700 (PDT)
Message-ID: <96ed1b7e-a4ec-417f-a766-237229231017@redhat.com>
Date: Mon, 14 Apr 2025 12:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] mm: Consolidate freeing of typed folios on final
 folio_put()
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
 <20250318161823.4005529-2-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250318161823.4005529-2-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.25 17:18, Fuad Tabba wrote:
> Some folio types, such as hugetlb, handle freeing their own
> folios. Moreover, guest_memfd will require being notified once a
> folio's reference count reaches 0 to facilitate shared to private
> folio conversion, without the folio actually being freed at that
> point.
> 
> As a first step towards that, this patch consolidates freeing
> folios that have a type. The first user is hugetlb folios. Later
> in this patch series, guest_memfd will become the second user of
> this.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---

As discussed in the last upstream meeting, we should focus on using the 
folio_put() hook only for the post-truncate case where required (e.g., 
re-assemble hugetlb).

For shared->private conversion doing it synchronously (unmap, try 
freezing refcount) and failing if impossible to signal user space to 
retry is a better first approach.

So this patch will be dropped from your series for now, correct?

-- 
Cheers,

David / dhildenb


